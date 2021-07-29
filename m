Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0987D3DA8B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 18:18:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbhG2QSC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 12:18:02 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:49061 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229556AbhG2QSC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 12:18:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627575479; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=e1dPKh3zKj9PpqF9ZxCzzdvomuVG/QrY82xKdOIhZYE=;
 b=XVcdnnb2T5bXuvCE+YAX9MLGqX6Z6kkbXxo2LgeJaY/7k1VxL6sWzZqZArhWmatHkg9tHUlH
 ybzCNxdtH73TexUEDFV+sNsfjrx5fNv/wqNvH7QHt+dHbgzUzWu6sbO+PWHnJlDnoMeIup6+
 2vllh8aLxunjFDxGMe8tY785cl8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6102d4ab290ea35ee6eb3ce7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Jul 2021 16:17:46
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 56F3EC4360C; Thu, 29 Jul 2021 16:17:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B5037C433D3;
        Thu, 29 Jul 2021 16:17:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 29 Jul 2021 09:17:45 -0700
From:   khsieh@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, abhinavk@codeaurora.org, aravindh@codeaurora.org,
        airlied@linux.ie, daniel@ffwll.ch, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/7] drm/msm/dp: return correct edid checksum after
 corrupted edid checksum read
In-Reply-To: <CAE-0n539r5zQx7zX9bECspKUAypQ8VucgeMNTmqAjHOCemVmOg@mail.gmail.com>
References: <1626191647-13901-1-git-send-email-khsieh@codeaurora.org>
 <1626191647-13901-6-git-send-email-khsieh@codeaurora.org>
 <CAE-0n539r5zQx7zX9bECspKUAypQ8VucgeMNTmqAjHOCemVmOg@mail.gmail.com>
Message-ID: <ef1a1d24e0afe5455d841054660f1e3c@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-22 12:23, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2021-07-13 08:54:05)
>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c 
>> b/drivers/gpu/drm/msm/dp/dp_panel.c
>> index 88196f7..0fdb551 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>> @@ -303,7 +303,12 @@ void dp_panel_handle_sink_request(struct dp_panel 
>> *dp_panel)
>>         panel = container_of(dp_panel, struct dp_panel_private, 
>> dp_panel);
>> 
>>         if (panel->link->sink_request & DP_TEST_LINK_EDID_READ) {
>> -               u8 checksum = 
>> dp_panel_get_edid_checksum(dp_panel->edid);
>> +               u8 checksum;
>> +
>> +               if (dp_panel->edid)
>> +                       checksum = 
>> dp_panel_get_edid_checksum(dp_panel->edid);
>> +               else
>> +                       checksum = 
>> dp_panel->connector->real_edid_checksum;
> 
> Is there any reason why we can't use connector->real_edid_checksum all
> the time?
> 
real_edid_checksum only calculated by drm when edid checksum 
vitrification failed after edid read.
In the good edid checksum case (edid verification succeed), 
real_edid_checksum is not calculated by drm.
>> 
>>                 dp_link_send_edid_checksum(panel->link, checksum);
>>                 dp_link_send_test_response(panel->link);
