Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9225A206B53
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 06:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728690AbgFXEl6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 00:41:58 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:51058 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727056AbgFXEl6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 00:41:58 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592973717; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=0dYginMgi1k67n62RpmbKWeGpkiw6FuM0+tyuL4cBzo=; b=WtEBzFOPlITSiTQAd+kzh+tdXtd0legAHae9Wo2BsRqxU+FXOfOtvLCSiYklZKG8hprmt3VU
 XaRLyvmyhoKRtLx/R7+iIY/JjfsiFLxSsDCMEesdhB3E6UzglW8HbT5xDtqst2BlVoNV113y
 SRTQQKxdIVh1DClZ3pSPkafWgdM=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n12.prod.us-west-2.postgun.com with SMTP id
 5ef2d9953a8a8b20b8f36000 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Jun 2020 04:41:57
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D510BC433CB; Wed, 24 Jun 2020 04:41:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.73.84])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 411B9C433C6;
        Wed, 24 Jun 2020 04:41:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 411B9C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH] soc: qcom: rpmh-rsc: Don't use ktime for timeout in
 write_tcs_reg_sync()
To:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200528074530.1.Ib86e5b406fe7d16575ae1bb276d650faa144b63c@changeid>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <2eb7c28e-d7af-8bc8-c308-46f4df5c995c@codeaurora.org>
Date:   Wed, 24 Jun 2020 10:11:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200528074530.1.Ib86e5b406fe7d16575ae1bb276d650faa144b63c@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reviewed-by: Maulik Shah <mkshah@codeaurora.org>

Thanks,
Maulik

On 5/28/2020 8:18 PM, Douglas Anderson wrote:
> The write_tcs_reg_sync() may be called after timekeeping is suspended
> so it's not OK to use ktime.  The readl_poll_timeout_atomic() macro
> implicitly uses ktime.  This was causing a warning at suspend time.
>
> Change to just loop 1000000 times with a delay of 1 us between loops.
> This may give a timeout of more than 1 second but never less and is
> safe even if timekeeping is suspended.
>
> NOTE: I don't have any actual evidence that we need to loop here.
> It's possibly that all we really need to do is just read the value
> back to ensure that the pipes are cleaned and the looping/comparing is
> totally not needed.  I never saw the loop being needed in my tests.
> However, the loop shouldn't hurt.
>
> Fixes: 91160150aba0 ("soc: qcom: rpmh-rsc: Timeout after 1 second in write_tcs_reg_sync()")
> Reported-by: Maulik Shah <mkshah@codeaurora.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>   drivers/soc/qcom/rpmh-rsc.c | 18 +++++++++++++-----
>   1 file changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index 076fd27f3081..906778e2c1fa 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -175,13 +175,21 @@ static void write_tcs_reg(const struct rsc_drv *drv, int reg, int tcs_id,
>   static void write_tcs_reg_sync(const struct rsc_drv *drv, int reg, int tcs_id,
>   			       u32 data)
>   {
> -	u32 new_data;
> +	int i;
>   
>   	writel(data, tcs_reg_addr(drv, reg, tcs_id));
> -	if (readl_poll_timeout_atomic(tcs_reg_addr(drv, reg, tcs_id), new_data,
> -				      new_data == data, 1, USEC_PER_SEC))
> -		pr_err("%s: error writing %#x to %d:%#x\n", drv->name,
> -		       data, tcs_id, reg);
> +
> +	/*
> +	 * Wait until we read back the same value.  Use a counter rather than
> +	 * ktime for timeout since this may be called after timekeeping stops.
> +	 */
> +	for (i = 0; i < USEC_PER_SEC; i++) {
> +		if (readl(tcs_reg_addr(drv, reg, tcs_id)) == data)
> +			return;
> +		udelay(1);
> +	}
> +	pr_err("%s: error writing %#x to %d:%#x\n", drv->name,
> +	       data, tcs_id, reg);
>   }
>   
>   /**

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

