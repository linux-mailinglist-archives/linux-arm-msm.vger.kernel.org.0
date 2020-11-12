Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 363242AFF84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Nov 2020 06:59:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725884AbgKLF7u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Nov 2020 00:59:50 -0500
Received: from z5.mailgun.us ([104.130.96.5]:55431 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725941AbgKLF7u (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Nov 2020 00:59:50 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605160789; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=zwaMc+SVpS1C+Zz1mB49ILbAPgIJNx3GhVUbj+IZG0w=; b=cM2Xz82IcC4lEoKBjXy6erThlMTiYu3WiledFZmapOLnPzwTcPq9/f/1IlHHTa77gqJ9U178
 tnC1G9AodtF0oi3SPp2ykQZMg3lKi0wgvkd/oF++56HWCuABmKjfnRe96dCeyhvc8n0OiaUh
 e5WSNfn+fdF8rkinHwo3qbDS/ug=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-west-2.postgun.com with SMTP id
 5faccf5437ede2253bc4ab18 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 12 Nov 2020 05:59:48
 GMT
Sender: vbadigan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 98B11C433C8; Thu, 12 Nov 2020 05:59:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.0.105] (unknown [49.205.245.25])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5F6C4C433C6;
        Thu, 12 Nov 2020 05:59:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5F6C4C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=vbadigan@codeaurora.org
Subject: Re: [PATCH] mmc: sdhci-msm: detect if tassadar_dll is used by using
 core version
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org
References: <20201111220122.2392823-1-dmitry.baryshkov@linaro.org>
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Message-ID: <b1cd32a4-64ea-2322-985a-219083671e4b@codeaurora.org>
Date:   Thu, 12 Nov 2020 11:29:42 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201111220122.2392823-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/12/2020 3:31 AM, Dmitry Baryshkov wrote:
> Detect if tassadar_dll is required by using core version rather than
> just specifying it in the sdhci_msm_variant_info.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> ---
>   drivers/mmc/host/sdhci-msm.c | 15 +++++----------
>   1 file changed, 5 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 3451eb325513..dd67acab1660 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -248,7 +248,6 @@ struct sdhci_msm_variant_ops {
>   struct sdhci_msm_variant_info {
>   	bool mci_removed;
>   	bool restore_dll_config;
> -	bool uses_tassadar_dll;
>   	const struct sdhci_msm_variant_ops *var_ops;
>   	const struct sdhci_msm_offset *offset;
>   };
> @@ -2154,18 +2153,11 @@ static const struct sdhci_msm_variant_info sdm845_sdhci_var = {
>   	.offset = &sdhci_msm_v5_offset,
>   };
>   
> -static const struct sdhci_msm_variant_info sm8250_sdhci_var = {
> -	.mci_removed = true,
> -	.uses_tassadar_dll = true,
> -	.var_ops = &v5_var_ops,
> -	.offset = &sdhci_msm_v5_offset,
> -};
> -
>   static const struct of_device_id sdhci_msm_dt_match[] = {
>   	{.compatible = "qcom,sdhci-msm-v4", .data = &sdhci_msm_mci_var},
>   	{.compatible = "qcom,sdhci-msm-v5", .data = &sdhci_msm_v5_var},
>   	{.compatible = "qcom,sdm845-sdhci", .data = &sdm845_sdhci_var},
> -	{.compatible = "qcom,sm8250-sdhci", .data = &sm8250_sdhci_var},
> +	{.compatible = "qcom,sm8250-sdhci", .data = &sdm845_sdhci_var},
Since you have made it 'uses_tassadar_dll' check generic,
SM8250 should work with default compatible string (qcom,sdhci-msm-v5).
We can drop the entry to SM8250 from this table.

>   	{.compatible = "qcom,sc7180-sdhci", .data = &sdm845_sdhci_var},
>   	{},
>   };
> @@ -2249,7 +2241,6 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>   	msm_host->restore_dll_config = var_info->restore_dll_config;
>   	msm_host->var_ops = var_info->var_ops;
>   	msm_host->offset = var_info->offset;
> -	msm_host->uses_tassadar_dll = var_info->uses_tassadar_dll;
>   
>   	msm_offset = msm_host->offset;
>   
> @@ -2396,6 +2387,10 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>   	if (core_major == 1 && core_minor >= 0x49)
>   		msm_host->updated_ddr_cfg = true;
>   
> +	if (core_major == 1 &&
> +	    (core_minor == 0x6e || core_minor == 0x71 || core_minor == 0x72))
> +		msm_host->uses_tassadar_dll = true;
> +
This new registers that got introduced for supporting this new DLL are 
present on all versions > 0x71
So we can update check as core_minor >= 0x71.

And i dont find any target with SDCC controller minor version 0x6e.So we 
can remove check for version 0x6e.

>   	ret = sdhci_msm_register_vreg(msm_host);
>   	if (ret)
>   		goto clk_disable;
