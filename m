Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EB732C978F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Dec 2020 07:30:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726405AbgLAGam (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Dec 2020 01:30:42 -0500
Received: from a2.mail.mailgun.net ([198.61.254.61]:57610 "EHLO
        a2.mail.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726142AbgLAGam (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Dec 2020 01:30:42 -0500
X-Greylist: delayed 323 seconds by postgrey-1.27 at vger.kernel.org; Tue, 01 Dec 2020 01:30:41 EST
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606804221; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=qjX5YWXQNyMIYh4ttlDr1yp5ks9fiVpqcINQz9NkRLU=;
 b=bqd1E0GnF2zpjzCbn96/PgF8zWA7VeuxU4BRiQd9IuxckO7N0rEEf5AGbEdeJL1BAURYurLH
 LKEzuggJffugkjUfINrS06VphQUh0dV0X+2eledxthUHjd1ZYV+lYJm8FZvdNNufXgSAEiHi
 KxME6Ocke8L/dg60EXic8FSb8dQ=
X-Mailgun-Sending-Ip: 198.61.254.61
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5fc5e19ff653ea0cd80c3d99 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 01 Dec 2020 06:24:31
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A4FA5C43463; Tue,  1 Dec 2020 06:24:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9BDD8C43461;
        Tue,  1 Dec 2020 06:24:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 01 Dec 2020 11:54:30 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmitry.baryshkov@linaro.org
Subject: Re: [PATCH v2 4/4] soc: qcom: llcc-qcom: Add support for SM8250 SoC
In-Reply-To: <20201130093924.45057-5-manivannan.sadhasivam@linaro.org>
References: <20201130093924.45057-1-manivannan.sadhasivam@linaro.org>
 <20201130093924.45057-5-manivannan.sadhasivam@linaro.org>
Message-ID: <9fbb8e2e5d74e50d95c750724c4a64e7@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-30 15:09, Manivannan Sadhasivam wrote:
> SM8250 SoC uses LLCC IP version 2. In this version, the WRSC_EN 
> register
> needs to be written to enable the Write Sub Cache for each SCID. Hence,
> use a dedicated "write_scid_en" member with predefined values and write
> them for LLCC IP version 2.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Reviewed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

>  drivers/soc/qcom/llcc-qcom.c       | 38 ++++++++++++++++++++++++++++++
>  include/linux/soc/qcom/llcc-qcom.h |  1 +
>  2 files changed, 39 insertions(+)
> 
> diff --git a/drivers/soc/qcom/llcc-qcom.c 
> b/drivers/soc/qcom/llcc-qcom.c
> index a559617ea7c0..8403a77b59fe 100644
> --- a/drivers/soc/qcom/llcc-qcom.c
> +++ b/drivers/soc/qcom/llcc-qcom.c
> @@ -51,6 +51,7 @@
> 
>  #define LLCC_TRP_SCID_DIS_CAP_ALLOC   0x21f00
>  #define LLCC_TRP_PCB_ACT              0x21f04
> +#define LLCC_TRP_WRSC_EN              0x21f20
> 
>  #define BANK_OFFSET_STRIDE	      0x80000
> 
> @@ -77,6 +78,7 @@
>   *               then the ways assigned to this client are not flushed 
> on power
>   *               collapse.
>   * @activate_on_init: Activate the slice immediately after it is 
> programmed
> + * @write_scid_en: Bit enables write cache support for a given scid.
>   */
>  struct llcc_slice_config {
>  	u32 usecase_id;
> @@ -91,6 +93,7 @@ struct llcc_slice_config {
>  	bool dis_cap_alloc;
>  	bool retain_on_pc;
>  	bool activate_on_init;
> +	bool write_scid_en;
>  };
> 
>  struct qcom_llcc_config {
> @@ -151,6 +154,25 @@ static const struct llcc_slice_config 
> sm8150_data[] =  {
>  	{  LLCC_WRCACHE, 31, 128,  1, 1, 0xFFF, 0x0,   0, 0, 0, 0, 0 },
>  };
> 
> +static const struct llcc_slice_config sm8250_data[] =  {
> +	{ LLCC_CPUSS,    1, 3072, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 1, 0 },
> +	{ LLCC_VIDSC0,   2, 512,  3, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
> +	{ LLCC_AUDIO,    6, 1024, 1, 0, 0xfff, 0x0, 0, 0, 0, 0, 0, 0 },
> +	{ LLCC_CMPT,    10, 1024, 1, 0, 0xfff, 0x0, 0, 0, 0, 0, 0, 0 },
> +	{ LLCC_GPUHTW,  11, 1024, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
> +	{ LLCC_GPU,     12, 1024, 1, 0, 0xfff, 0x0, 0, 0, 0, 1, 0, 1 },
> +	{ LLCC_MMUHWT,  13, 1024, 1, 1, 0xfff, 0x0, 0, 0, 0, 0, 1, 0 },
> +	{ LLCC_CMPTDMA, 15, 1024, 1, 0, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
> +	{ LLCC_DISP,    16, 3072, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
> +	{ LLCC_VIDFW,   17, 512,  1, 0, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
> +	{ LLCC_AUDHW,   22, 1024, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
> +	{ LLCC_NPU,     23, 3072, 1, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
> +	{ LLCC_WLHW,    24, 1024, 1, 0, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
> +	{ LLCC_CVP,     28, 256,  3, 1, 0xfff, 0x0, 0, 0, 0, 1, 0, 0 },
> +	{ LLCC_APTCM,   30, 128,  3, 0, 0x0,   0x3, 1, 0, 0, 1, 0, 0 },
> +	{ LLCC_WRCACHE, 31, 256,  1, 1, 0xfff, 0x0, 0, 0, 0, 0, 1, 0 },
> +};
> +
>  static const struct qcom_llcc_config sc7180_cfg = {
>  	.sct_data	= sc7180_data,
>  	.size		= ARRAY_SIZE(sc7180_data),
> @@ -168,6 +190,11 @@ static const struct qcom_llcc_config sm8150_cfg = 
> {
>  	.size           = ARRAY_SIZE(sm8150_data),
>  };
> 
> +static const struct qcom_llcc_config sm8250_cfg = {
> +	.sct_data       = sm8250_data,
> +	.size           = ARRAY_SIZE(sm8250_data),
> +};
> +
>  static struct llcc_drv_data *drv_data = (void *) -EPROBE_DEFER;
> 
>  /**
> @@ -417,6 +444,16 @@ static int _qcom_llcc_cfg_program(const struct
> llcc_slice_config *config,
>  			return ret;
>  	}
> 
> +	if (drv_data->major_version == 2) {
> +		u32 wren;
> +
> +		wren = config->write_scid_en << config->slice_id;
> +		ret = regmap_update_bits(drv_data->bcast_regmap, LLCC_TRP_WRSC_EN,
> +					 BIT(config->slice_id), wren);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	if (config->activate_on_init) {
>  		desc.slice_id = config->slice_id;
>  		ret = llcc_slice_activate(&desc);
> @@ -571,6 +608,7 @@ static const struct of_device_id 
> qcom_llcc_of_match[] = {
>  	{ .compatible = "qcom,sc7180-llcc", .data = &sc7180_cfg },
>  	{ .compatible = "qcom,sdm845-llcc", .data = &sdm845_cfg },
>  	{ .compatible = "qcom,sm8150-llcc", .data = &sm8150_cfg },
> +	{ .compatible = "qcom,sm8250-llcc", .data = &sm8250_cfg },
>  	{ }
>  };
> 
> diff --git a/include/linux/soc/qcom/llcc-qcom.h
> b/include/linux/soc/qcom/llcc-qcom.h
> index d17a3de80510..64fc582ae415 100644
> --- a/include/linux/soc/qcom/llcc-qcom.h
> +++ b/include/linux/soc/qcom/llcc-qcom.h
> @@ -29,6 +29,7 @@
>  #define LLCC_AUDHW       22
>  #define LLCC_NPU         23
>  #define LLCC_WLHW        24
> +#define LLCC_CVP         28
>  #define LLCC_MODPE       29
>  #define LLCC_APTCM       30
>  #define LLCC_WRCACHE     31

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
