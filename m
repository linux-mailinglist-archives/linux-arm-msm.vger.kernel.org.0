Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BCF416A799
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2020 14:50:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727460AbgBXNua (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Feb 2020 08:50:30 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:50346 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727310AbgBXNu2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Feb 2020 08:50:28 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582552228; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=W628OvkNRlX9E5Eh9zzngUI5dh1s51b264AW8MC+oWY=; b=Vhe/axGUELb66qdjPy0gzAf4YtHMWQRI0OyE+dEUgf/FqYEebzm5ytzkXW3+YCrHbHIAEvhP
 RYNBPeM4RzCVr5NouF5nXLSHytUbizJC5Z/ouC00SSZ2Os0hkT0eANzi39QVCj5z4tZp+9tb
 +vOyDO7qgrk7U+qkHP5rSICxD7I=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e53d498.7f1382beb7d8-smtp-out-n03;
 Mon, 24 Feb 2020 13:50:16 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 42017C4479F; Mon, 24 Feb 2020 13:50:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.25.140] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9DBA9C43383;
        Mon, 24 Feb 2020 13:50:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9DBA9C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
Subject: Re: [PATCH RFC] mmc: sdhci-msm: Toggle fifo write clk after ungating
 sdcc clk
To:     Sayali Lokhande <sayalil@codeaurora.org>,
        bjorn.andersson@linaro.org, adrian.hunter@intel.com,
        robh+dt@kernel.org, ulf.hansson@linaro.org,
        asutoshd@codeaurora.org, stummala@codeaurora.org,
        ppvk@codeaurora.org, rampraka@codeaurora.org, sboyd@kernel.org,
        georgi.djakov@linaro.org, mka@chromium.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, linux-mmc-owner@vger.kernel.org
References: <1582190446-4778-1-git-send-email-sayalil@codeaurora.org>
 <1582190446-4778-2-git-send-email-sayalil@codeaurora.org>
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Message-ID: <4e4f1e44-8033-94e9-641c-a74232727895@codeaurora.org>
Date:   Mon, 24 Feb 2020 19:19:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1582190446-4778-2-git-send-email-sayalil@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 2/20/2020 2:50 PM, Sayali Lokhande wrote:
> From: Ram Prakash Gupta <rampraka@codeaurora.org>
>
> During GCC level clock gating of MCLK, the async FIFO
> gets into some hang condition, such that for the next
> transfer after MCLK ungating, first bit of CMD response
> doesn't get written in to the FIFO. This cause the CPSM
> to hang eventually leading to SW timeout.
>
> To fix the issue, toggle the FIFO write clock after
> MCLK ungated to get the FIFO pointers and flags to
> valid states.
>
> Change-Id: Ibef2d1d283ac0b6983c609a4abc98bc574d31fa6
> Signed-off-by: Ram Prakash Gupta <rampraka@codeaurora.org>
> Signed-off-by: Sayali Lokhande <sayalil@codeaurora.org>
> ---
>   drivers/mmc/host/sdhci-msm.c | 43 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 43 insertions(+)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index c3a160c..eaa3e95 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -127,6 +127,8 @@
>   #define CQHCI_VENDOR_CFG1	0xA00
>   #define CQHCI_VENDOR_DIS_RST_ON_CQ_EN	(0x3 << 13)
>   
> +#define RCLK_TOGGLE 0x2
> +
>   struct sdhci_msm_offset {
>   	u32 core_hc_mode;
>   	u32 core_mci_data_cnt;
> @@ -1554,6 +1556,43 @@ static void __sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
>   	sdhci_enable_clk(host, clk);
>   }
>   
> +/*
> + * After MCLK ugating, toggle the FIFO write clock to get
> + * the FIFO pointers and flags to valid state.
> + */
> +static void sdhci_msm_toggle_fifo_write_clk(struct sdhci_host *host)
> +{
> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +	const struct sdhci_msm_offset *msm_offset =
> +					msm_host->offset;
> +	struct mmc_card *card = host->mmc->card;
> +
> +	if (msm_host->tuning_done ||
> +			(card && card->ext_csd.strobe_support &&
> +			card->host->ios.enhanced_strobe)) {

This issue is present on only HS400ES mode.

If(host->ios.enhanced_strob) check should be sufficient, other checks 
are not needed.

> +		/*
> +		 * set HC_REG_DLL_CONFIG_3[1] to select MCLK as
> +		 * DLL input clock
> +		 */
> +		writel_relaxed(((readl_relaxed(host->ioaddr +
> +			msm_offset->core_dll_config_3))
> +			| RCLK_TOGGLE), host->ioaddr +
> +			msm_offset->core_dll_config_3);
> +		/* ensure above write as toggling same bit quickly */
> +		wmb();
> +		udelay(2);
> +		/*
> +		 * clear HC_REG_DLL_CONFIG_3[1] to select RCLK as
> +		 * DLL input clock
> +		 */
> +		writel_relaxed(((readl_relaxed(host->ioaddr +
> +			msm_offset->core_dll_config_3))
> +			& ~RCLK_TOGGLE), host->ioaddr +
> +			msm_offset->core_dll_config_3);
> +	}
> +}
> +
>   /* sdhci_msm_set_clock - Called with (host->lock) spinlock held. */
>   static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
>   {
> @@ -2149,6 +2188,10 @@ static __maybe_unused int sdhci_msm_runtime_resume(struct device *dev)
>   				       msm_host->bulk_clks);
>   	if (ret)
>   		return ret;
> +	if (host->mmc &&
> +			(host->mmc->ios.timing == MMC_TIMING_MMC_HS400))
These checks are not needed. You can have these checks within 
sdhci_msm_toggle_fifo_write_clk
> +		sdhci_msm_toggle_fifo_write_clk(host);
> +
>   	/*
>   	 * Whenever core-clock is gated dynamically, it's needed to
>   	 * restore the SDR DLL settings when the clock is ungated.
