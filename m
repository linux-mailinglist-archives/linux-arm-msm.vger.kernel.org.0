Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18FCB85D8C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2019 10:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731485AbfHHI5W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Aug 2019 04:57:22 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:47802 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728289AbfHHI5V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Aug 2019 04:57:21 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 008E860A00; Thu,  8 Aug 2019 08:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565254641;
        bh=MNDBOpJkkIZGrJ7rizit8u8JPhs9ggs0CE8V7PeSvVc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=M26hVo5+QqlhM2+ZctHbdQQnaSSU8vnKo0UhWswne8CByRrvezAT6R1YXTtxadzml
         zbr7XxcxO0NQGk8m+7YbBRUHoGsIYNXG2SvQbLy5V617UwQka/bS93IhSgCyHMHjI4
         jf7U80OKrUxiBOJcFcwQY4ZNUrCa+AiRJmAekIGg=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 2821A6074C;
        Thu,  8 Aug 2019 08:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565254639;
        bh=MNDBOpJkkIZGrJ7rizit8u8JPhs9ggs0CE8V7PeSvVc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=PkSfB0M61FomeNg8Vo2ItAXQAyaOnJ3apyU9tTDYzN89kTlfdDZ3OttTX/Cc458V+
         vdNsDEGvOEViy2X44TdnZtpN6/XIQhPftiAfHhHEA+7XkMAkNmyp15SOFSkJ0egt0g
         Kgit+4LGu9Xai2hTeAfI8TosD93e3HTCYyYyZ7N8=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 08 Aug 2019 14:27:19 +0530
From:   Balakrishna Godavarthi <bgodavar@codeaurora.org>
To:     Claire Chang <tientzu@chromium.org>
Cc:     Rocky Liao <rjliao@codeaurora.org>, marcel@holtmann.org,
        johan.hedberg@gmail.com, Matthias Kaehlcke <mka@chromium.org>,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, c_hbandi@codeaurora.org
Subject: Re: [PATCH v1] Bluetooth: btqca: Reset download type to default
In-Reply-To: <CALiNf29bmSbjT4pmzGGG_WzmC6gaZS+vBeRQUiQuT85bm-iMsg@mail.gmail.com>
References: <20190808060737.3506-1-bgodavar@codeaurora.org>
 <56fe734d517399c6509f6e9c45f9b096@codeaurora.org>
 <CALiNf29bmSbjT4pmzGGG_WzmC6gaZS+vBeRQUiQuT85bm-iMsg@mail.gmail.com>
Message-ID: <ba4b17678fa7615735cd18c9eb13b2b8@codeaurora.org>
X-Sender: bgodavar@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 2019-08-08 12:51, Claire Chang wrote:
> Tested-by: Claire Chang <tientzu@chromium.org>
> 
> Hi,
> 
> Please add the Fixes: tag and I will add my Reviewed-by: tag.
> 
> Thanks,
> Claire
> 
> On Thu, Aug 8, 2019 at 2:21 PM Rocky Liao <rjliao@codeaurora.org> 
> wrote:
>> 
>> +Claire
>> 
>> On 2019-08-08 14:07, Balakrishna Godavarthi wrote:
>> > This patch will reset the download flag to default value
>> > before retrieving the download mode type.
>> >
>> > Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
>> > ---
>> >  drivers/bluetooth/btqca.c | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
>> > index 2221935fac7e..9fb247c10855 100644
>> > --- a/drivers/bluetooth/btqca.c
>> > +++ b/drivers/bluetooth/btqca.c
>> > @@ -140,6 +140,7 @@ static void qca_tlv_check_data(struct rome_config
>> > *config,
>> >       BT_DBG("Length\t\t : %d bytes", length);
>> >
>> >       config->dnld_mode = ROME_SKIP_EVT_NONE;
>> > +     config->dnld_type = ROME_SKIP_EVT_NONE;
>> >
>> >       switch (config->type) {
>> >       case TLV_TYPE_PATCH:
>> 
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
>> Forum,
>> a Linux Foundation Collaborative Project

uploaded new patch set.

-- 
Regards
Balakrishna.
