Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3ACAD171EE1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2020 15:31:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388127AbgB0Oa5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Feb 2020 09:30:57 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:35328 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387580AbgB0Oa4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Feb 2020 09:30:56 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582813855; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=31Jyd0ydGwDjWftSsYoT2QGP7wSU/YQyP0VpNOmwFCQ=; b=ZNuChyRIVE4hcrZxwqmXoUnZFq4ky/0RNviTiCMHKDNFbOby/nQvdwjqXyblFwLYEbTRvSrh
 uyzsHISZFmpCWxSpcL7qupz4ea0BBrZnquPzc16wmPlHendBLpPD21dbg0MdJJlEEvBwyY7i
 vJWi7/qMenNwvK76gO/UHNjDDy4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e57d292.7fb093b93e30-smtp-out-n03;
 Thu, 27 Feb 2020 14:30:42 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3CA76C4479D; Thu, 27 Feb 2020 14:30:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.25.140] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 35321C433A2;
        Thu, 27 Feb 2020 14:30:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 35321C433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
Subject: Re: [PATCH V4] mmc: sdhci-msm: Update system suspend/resume callbacks
 of sdhci-msm platform driver
To:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        adrian.hunter@intel.com, ulf.hansson@linaro.org,
        robh+dt@kernel.org, mka@chromium.org
Cc:     asutoshd@codeaurora.org, swboyd@chromium.org,
        stummala@codeaurora.org, sayalil@codeaurora.org,
        cang@codeaurora.org, rampraka@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org
References: <1582181100-29914-1-git-send-email-sbhanu@codeaurora.org>
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Message-ID: <d6c10b49-a12c-d17e-1ff9-90f12e98f624@codeaurora.org>
Date:   Thu, 27 Feb 2020 20:00:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1582181100-29914-1-git-send-email-sbhanu@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sajida,

On 2/20/2020 12:15 PM, Shaik Sajida Bhanu wrote:

> The existing suspend/resume callbacks of sdhci-msm driver are just
> gating/un-gating the clocks. During suspend cycle more can be done
> like disabling controller, disabling card detection, enabling wake-up events.
>
> So updating the system pm callbacks for performing these extra
> actions besides controlling the clocks.
>
> Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
> Changes since V3:
>      Invoking sdhci & cqhci resume if sdhci_host_suspend fails.
>      Removed condition check before invoking cqhci_resume since its a dummy function.
>
> Changes since V2:
>      Removed disabling/enabling pwr-irq from system pm ops.
>
> Changes since V1:
>      Invoking pm_runtime_force_suspend/resume instead of
>      sdhci_msm_runtime_suepend/resume.
> ---
>   drivers/mmc/host/sdhci-msm.c | 47 ++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 45 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 3955fa5d..3559b50 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2159,9 +2159,52 @@ static __maybe_unused int sdhci_msm_runtime_resume(struct device *dev)
>   	return 0;
>   }
>   
> +static int sdhci_msm_suspend(struct device *dev)
> +{
> +	struct sdhci_host *host = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (host->mmc->caps2 & MMC_CAP2_CQE) {
> +		ret = cqhci_suspend(host->mmc);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = sdhci_suspend_host(host);
> +	if (ret)
> +		goto resume_cqhci;
> +
> +	ret = pm_runtime_force_suspend(dev);
> +	if (!ret)
> +		return ret;
> +
> +	sdhci_resume_host(host);
> +
> +resume_cqhci:
> +	cqhci_resume(host->mmc);
> +	return ret;
> +}
> +
> +static int sdhci_msm_resume(struct device *dev)
> +{
> +	struct sdhci_host *host = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = pm_runtime_force_resume(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = sdhci_resume_host(host);

I'm observing an issue with this change.

After this step, i find interrupt enable register is zero (even though 
it's getting set in sdhci_resume_host()) and

resulting in request timeout for very first command in resume path.

Until its root caused, please hold back this change.

> +	if (ret < 0)
> +		return ret;
> +
> +	ret = cqhci_resume(host->mmc);
> +	return ret;
> +}
> +
>   static const struct dev_pm_ops sdhci_msm_pm_ops = {
> -	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> -				pm_runtime_force_resume)
> +	SET_SYSTEM_SLEEP_PM_OPS(sdhci_msm_suspend,
> +				sdhci_msm_resume)
>   	SET_RUNTIME_PM_OPS(sdhci_msm_runtime_suspend,
>   			   sdhci_msm_runtime_resume,
>   			   NULL)
