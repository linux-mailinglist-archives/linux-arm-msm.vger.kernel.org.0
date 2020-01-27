Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C454D14AB39
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2020 21:42:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbgA0UmG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jan 2020 15:42:06 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:55515 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725955AbgA0UmG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jan 2020 15:42:06 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580157726; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=2EI+f/oRnZvvny3CsdIHCj9B4pK5NA/3rDlv8CkcF0Y=;
 b=NObUE7YLgjEIcSIJM8H2mpZb2P1GNm/DqX7LBbjxSVfi+ErGYYcMzs2Yk+Vbjbn3QCy1K9d4
 sCGk/Uaaut0JWLCDVTvJWw8eJ30rkPkdw7fjVzqtsiMzlT0aYfAGmOplILqpqSHyzBSb8W5G
 IV8Oxqkqa1xVtE+Rm9EVa9V3jhs=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e2f4b1c.7f7053ce48b8-smtp-out-n02;
 Mon, 27 Jan 2020 20:42:04 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1AB7AC433CB; Mon, 27 Jan 2020 20:42:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8E2B0C43383;
        Mon, 27 Jan 2020 20:42:03 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 27 Jan 2020 12:42:03 -0800
From:   abhinavk@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     dri-devel@lists.freedesktop.org,
        Uma Shankar <uma.shankar@intel.com>,
        linux-arm-msm@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, nganji@codeaurora.org,
        aravindh@codeaurora.org, adelva@google.com,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH] drm: Parse Colorimetry data block from EDID
In-Reply-To: <5e2f2fe9.1c69fb81.6d20f.a6b4@mx.google.com>
References: <1579819245-21913-1-git-send-email-abhinavk@codeaurora.org>
 <5e2f2fe9.1c69fb81.6d20f.a6b4@mx.google.com>
Message-ID: <875bf9de01b7cd0107aee6f70badcbc5@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen

On 2020-01-27 10:46, Stephen Boyd wrote:
> Quoting Abhinav Kumar (2020-01-23 14:40:45)
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index 99769d6..148bfa4 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -4199,6 +4200,57 @@ static void 
>> fixup_detailed_cea_mode_clock(struct drm_display_mode *mode)
>>         mode->clock = clock;
>>  }
>> 
>> +static bool cea_db_is_hdmi_colorimetry_data_block(const u8 *db)
>> +{
>> +       if (cea_db_tag(db) != USE_EXTENDED_TAG)
>> +               return false;
>> +
>> +       if (db[1] != COLORIMETRY_DATA_BLOCK)
>> +               return false;
>> +
>> +       if (cea_db_payload_len(db) < 2)
>> +               return false;
>> +
>> +       return true;
>> +}
>> +
>> +static void
>> +drm_parse_colorimetry_data_block(struct drm_connector *connector, 
>> const u8 *db)
>> +{
>> +       struct drm_hdmi_info *info = &connector->display_info.hdmi;
>> +
>> +       /* As per CEA 861-G spec */
>> +       /* Byte 3 Bit 0: xvYCC_601 */
>> +       if (db[2] & BIT(0))
> 
> Why not use the defines added in drm_edid.h in this patch? Then the
> comments can be removed because the code would look like
> 
> 	if (db[2] & DRM_EDID_CLRMETRY_xvYCC_601)
[Abhinav] Sure, will make the change and upload a v2
