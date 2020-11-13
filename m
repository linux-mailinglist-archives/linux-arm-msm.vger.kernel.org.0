Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83DFD2B171E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Nov 2020 09:20:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725866AbgKMIUo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Nov 2020 03:20:44 -0500
Received: from z5.mailgun.us ([104.130.96.5]:10722 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726149AbgKMIUo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Nov 2020 03:20:44 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605255643; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=+CJu1zvzA+UktbWZOILdHLoHEn/zMmbZG2OSDOPgzzg=; b=Ajx0MXdPQdmaXlsKfMtBlw48ikWNdShxm4tIN8+5Ya6EstEgfVVD+ktaVHu+PRLFeTh2J1g1
 I7aRJIurv5KHKDnXnA3bCBB5w4Lwkdcu2GtZoBseU9JoXHHeS9KnMQ3VdaHNGuH/WHfUKE1A
 VELM5JJL6HD2COJB7dVQuIsRTxk=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5fae41dae9dd187f539b47b3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 13 Nov 2020 08:20:42
 GMT
Sender: vbadigan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3FBBDC433CB; Fri, 13 Nov 2020 08:20:42 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9A0A4C433C6;
        Fri, 13 Nov 2020 08:20:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9A0A4C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=vbadigan@codeaurora.org
Subject: Re: [PATCH v2] mmc: sdhci-msm: detect if tassadar_dll is used by
 using core version
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org
References: <20201112173636.360186-1-dmitry.baryshkov@linaro.org>
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Message-ID: <cec45d79-5900-3136-5208-44451daf68ec@codeaurora.org>
Date:   Fri, 13 Nov 2020 13:50:35 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201112173636.360186-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/12/2020 11:06 PM, Dmitry Baryshkov wrote:
> Detect if tassadar_dll is required by using core version rather than
> just specifying it in the sdhci_msm_variant_info.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> ---
Reviewed-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
>   drivers/mmc/host/sdhci-msm.c | 13 +++----------
>   1 file changed, 3 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 3451eb325513..9c7927b03253 100644
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
> @@ -2154,18 +2153,10 @@ static const struct sdhci_msm_variant_info sdm845_sdhci_var = {
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
>   	{.compatible = "qcom,sc7180-sdhci", .data = &sdm845_sdhci_var},
>   	{},
>   };
> @@ -2249,7 +2240,6 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>   	msm_host->restore_dll_config = var_info->restore_dll_config;
>   	msm_host->var_ops = var_info->var_ops;
>   	msm_host->offset = var_info->offset;
> -	msm_host->uses_tassadar_dll = var_info->uses_tassadar_dll;
>   
>   	msm_offset = msm_host->offset;
>   
> @@ -2396,6 +2386,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>   	if (core_major == 1 && core_minor >= 0x49)
>   		msm_host->updated_ddr_cfg = true;
>   
> +	if (core_major == 1 && core_minor >= 0x71)
> +		msm_host->uses_tassadar_dll = true;
> +
>   	ret = sdhci_msm_register_vreg(msm_host);
>   	if (ret)
>   		goto clk_disable;
