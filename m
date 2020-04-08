Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AACA1A1FCE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 13:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728205AbgDHL0G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 07:26:06 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:25994 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728447AbgDHL0F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 07:26:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586345165; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=vwPWwjoq+ay7kRuzGle4KUDYQbqavT9sOm3xpLYcaTQ=; b=sPqXcYT1cKfRES4M0olpd3qlBEQBNy4BU4nKAdtp3fK7TuT3v78Tw4TvTEds06YxXYho/Zud
 eAbAO6uEBgaspDeeIWVNdUMY0pLRTdVhhkqaZ3YBKhYPk+0OVBDW2d+oM6tBeLd1zzB19J+t
 ZO3kYureEutfuh7f/9BBA4IX5ow=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8db4cc.7ff1de38c960-smtp-out-n05;
 Wed, 08 Apr 2020 11:26:04 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6119DC433F2; Wed,  8 Apr 2020 11:26:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.137] (unknown [106.213.202.231])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3F5AEC433D2;
        Wed,  8 Apr 2020 11:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3F5AEC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v3 07/10] drivers: qcom: rpmh-rsc: tcs_is_free() can just
 check tcs_in_use
To:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mka@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, swboyd@chromium.org,
        evgreen@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200407235024.260460-1-dianders@chromium.org>
 <20200407164915.v3.7.Icf2213131ea652087f100129359052c83601f8b0@changeid>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <d1f863e3-cc49-3970-7dfd-3cb081bd265c@codeaurora.org>
Date:   Wed, 8 Apr 2020 16:55:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200407164915.v3.7.Icf2213131ea652087f100129359052c83601f8b0@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
Tested-by: Maulik Shah <mkshah@codeaurora.org>

Thanks,
Maulik

On 4/8/2020 5:20 AM, Douglas Anderson wrote:
> tcs_is_free() had two checks in it: does the software think that the
> TCS is free and does the hardware think that the TCS is free.  I
> couldn't figure out in which case the hardware could think that a TCS
> was in-use but software thought it was free.  Apparently there is no
> case and the extra check can be removed.  This apparently has already
> been done in a downstream patch.
>
> Suggested-by: Maulik Shah <mkshah@codeaurora.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v3:
> - Replace ("...warn if state mismatch") w/ ("...just check tcs_in_use")
>
> Changes in v2:
> - Comment tcs_is_free() new for v2; replaces old patch 6.
>
>   drivers/soc/qcom/rpmh-rsc.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index 84ae3e514eee..9502e7ea96be 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -177,7 +177,6 @@ static void write_tcs_reg_sync(struct rsc_drv *drv, int reg, int tcs_id,
>    * @tcs_id: The global ID of this TCS.
>    *
>    * Returns true if nobody has claimed this TCS (by setting tcs_in_use).
> - * If the TCS looks free, checks that the hardware agrees.
>    *
>    * Must be called with the drv->lock held or the tcs_lock for the TCS being
>    * tested. If only the tcs_lock is held then it is possible that this
> @@ -188,8 +187,7 @@ static void write_tcs_reg_sync(struct rsc_drv *drv, int reg, int tcs_id,
>    */
>   static bool tcs_is_free(struct rsc_drv *drv, int tcs_id)
>   {
> -	return !test_bit(tcs_id, drv->tcs_in_use) &&
> -	       read_tcs_reg(drv, RSC_DRV_STATUS, tcs_id);
> +	return !test_bit(tcs_id, drv->tcs_in_use);
>   }
>   
>   /**

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
