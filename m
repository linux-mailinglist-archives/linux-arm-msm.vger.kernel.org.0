Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A72D66198B3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 15:04:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230428AbiKDOEY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 10:04:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbiKDOEW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 10:04:22 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9589B22BF7
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Nov 2022 07:04:21 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id n18so3224372qvt.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Nov 2022 07:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SGXI4uOFUmw6tZuPJPIsRTwiUyuymqNGhyu0fMFLngY=;
        b=Y3Jh7krSivsqUXZ1y8aUKcbH0YggDsbbm62KuXJDGrLqEMYhAVhtbnLmVr4NRE4V7A
         r4GHd7AzcBHpTxbI3xMOodbEGGBLsebbWXGDsgIxNX3xw0psYxuyvalVEURq+b9dtp42
         Zec3/x5TyCr27R6LXpkQWobhyWF+K8Qch0XYMIrrEztR4F+p7R6n08Zf+/RrFIHG8x3i
         BfjhEM2o+LSWjiNfmZGKk3WTS1D68nb+4SqS9xER9ekgkerDTSeuUJQyM2LsImLODkIk
         wdEQrfGfAQrGRN8W+vXjgu7mPEazrTEhZPgSCLRKWQMiJraexXUZGW6aPgWjtnX3/fuu
         mPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SGXI4uOFUmw6tZuPJPIsRTwiUyuymqNGhyu0fMFLngY=;
        b=n75f/BTT13ZkWwk6/JGcMPTcySimYjvxJrYPdN7zUDbI7P5TE1+VCFHiBStjs0lX4L
         bWMdg0XO20ugPxtn/Ios/FwG2F6Qxi+wQFWmsMWmBnFn5ywKx48OPgxG8w+L8zHhpfzf
         T15KGO2tqyQ1ALKuQFRBoGDvmAtVDwv+noHHrVp0wRUCtGSdtcF1owTfwBY5xdF5InP6
         Qb8GSWtOtk+z1miufjobpSWhFgg04EKDUflzOrMzOakftNFEWSEeUqhnphRRREzJBtjp
         Gz/ZfP/OSOpJk/6DPW0p6xOwxD7CVWB9y9wRylPi9pbbiHeSYCXQxymzHAOOhjz1mD0t
         u38g==
X-Gm-Message-State: ACrzQf2BNjyOOUpDsUjHD59ZH6eWl1grD5OPEeJb6MXPsZfSOp8AvNmi
        w85CUXQo/eevrpnafhxcvNEA3Q==
X-Google-Smtp-Source: AMsMyM7t1UWhJ3+vFZhZ5FsL+3dGPFrNeosAMKKArGnMGgQF1/R8eynBl4jHvCyW6+G61q2kQXzccg==
X-Received: by 2002:a05:6214:c63:b0:4bb:d14c:ada4 with SMTP id t3-20020a0562140c6300b004bbd14cada4mr30219758qvj.77.1667570660739;
        Fri, 04 Nov 2022 07:04:20 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b? ([2601:586:5000:570:aad6:acd8:4ed9:299b])
        by smtp.gmail.com with ESMTPSA id u12-20020a05620a430c00b006b640efe6dasm2984286qko.132.2022.11.04.07.04.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 07:04:20 -0700 (PDT)
Message-ID: <cf1a15c5-a16b-2d23-8f6c-b3892c141c34@linaro.org>
Date:   Fri, 4 Nov 2022 10:04:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/2] soc: qcom: Add Qualcomm Ramp Controller driver
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, agross@kernel.org
Cc:     andersson@kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, marijn.suijten@somainline.org,
        kernel@collabora.com,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
References: <20221104133506.131316-1-angelogioacchino.delregno@collabora.com>
 <20221104133506.131316-3-angelogioacchino.delregno@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221104133506.131316-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/11/2022 09:35, AngeloGioacchino Del Regno wrote:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> 
> The Ramp Controller is used to program the sequence ID for pulse
> swallowing, enable sequence and linking sequence IDs for the CPU
> cores on some Qualcomm SoCs.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  drivers/soc/qcom/Kconfig           |   9 +
>  drivers/soc/qcom/Makefile          |   1 +
>  drivers/soc/qcom/ramp_controller.c | 330 +++++++++++++++++++++++++++++
>  3 files changed, 340 insertions(+)
>  create mode 100644 drivers/soc/qcom/ramp_controller.c
> 
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 024e420f1bb7..1e681f98bad4 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -95,6 +95,15 @@ config QCOM_QMI_HELPERS
>  	tristate
>  	depends on NET
>  
> +config QCOM_RAMP_CTRL
> +	tristate "Qualcomm Ramp Controller driver"
> +	depends on ARCH_QCOM

I propose:
depends on ARCH_QCOM && ARM || COMPILE_TEST

I don't think it is used on ARM64 SoCs, so let's make life of distros
easier.

> +	help
> +	  The Ramp Controller is used to program the sequence ID for pulse
> +	  swallowing, enable sequence and linking sequence IDs for the
> +	  CPU cores on some Qualcomm SoCs.
> +	  Say y here to enable support for the ramp controller.
> +
>  config QCOM_RMTFS_MEM
>  	tristate "Qualcomm Remote Filesystem memory driver"
>  	depends on ARCH_QCOM
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index d66604aff2b0..6e02333c4080 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -10,6 +10,7 @@ obj-$(CONFIG_QCOM_OCMEM)	+= ocmem.o
>  obj-$(CONFIG_QCOM_PDR_HELPERS)	+= pdr_interface.o
>  obj-$(CONFIG_QCOM_QMI_HELPERS)	+= qmi_helpers.o
>  qmi_helpers-y	+= qmi_encdec.o qmi_interface.o
> +obj-$(CONFIG_QCOM_RAMP_CTRL)	+= ramp_controller.o
>  obj-$(CONFIG_QCOM_RMTFS_MEM)	+= rmtfs_mem.o
>  obj-$(CONFIG_QCOM_RPMH)		+= qcom_rpmh.o
>  qcom_rpmh-y			+= rpmh-rsc.o
> diff --git a/drivers/soc/qcom/ramp_controller.c b/drivers/soc/qcom/ramp_controller.c
> new file mode 100644
> index 000000000000..e28679b545d1
> --- /dev/null
> +++ b/drivers/soc/qcom/ramp_controller.c
> @@ -0,0 +1,330 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Qualcomm Ramp Controller driver
> + * Copyright (c) 2022, AngeloGioacchino Del Regno
> + *                     <angelogioacchino.delregno@collabora.com>
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>
> +
> +#define RC_UPDATE_EN		BIT(0)
> +#define RC_ROOT_EN		BIT(1)
> +
> +#define RC_REG_CFG_UPDATE	0x60
> + #define RC_CFG_UPDATE_EN	BIT(8)
> + #define RC_CFG_ACK		GENMASK(31, 16)

Drop spaces before #define

> +
> +#define RC_DCVS_CFG_SID		2
> +#define RC_LINK_SID		3
> +#define RC_LMH_SID		6
> +#define RC_DFS_SID		14
> +
> +#define RC_UPDATE_TIMEOUT_US	500
> +
> +/**
> + * struct qcom_ramp_controller_desc - SoC specific parameters
> + * @cfg_dfs_sid:      Dynamic Frequency Scaling SID configuration
> + * @cfg_link_sid:     Link SID configuration
> + * @cfg_lmh_sid:      Limits Management hardware SID configuration
> + * @cfg_ramp_pre_en:  Ramp Controller pre-enable sequence
> + * @cfg_ramp_en:      Ramp Controller enable sequence
> + * @cfg_ramp_post_en: Ramp Controller post-enable sequence
> + * @cfg_ramp_dis:     Ramp Controller disable sequence
> + * @cmd_reg:          Command register offset
> + * @num_dfs_sids:     Number of DFS SIDs (max 8)
> + * @num_link_sids:    Number of Link SIDs (max 3)
> + * @num_lmh_sids:     Number of LMh SIDs (max 8)
> + */
> +struct qcom_ramp_controller_desc {
> +	struct reg_sequence *cfg_dfs_sid;

I didn't check much, but can these be pointers to const?

> +	struct reg_sequence *cfg_link_sid;
> +	struct reg_sequence *cfg_lmh_sid;
> +	struct reg_sequence *cfg_ramp_pre_en;
> +	struct reg_sequence *cfg_ramp_en;
> +	struct reg_sequence *cfg_ramp_post_en;
> +	struct reg_sequence *cfg_ramp_dis;
> +	u8 cmd_reg;
> +	u8 num_dfs_sids;
> +	u8 num_link_sids;
> +	u8 num_lmh_sids;
> +};
> +

(...)

> +
> +static struct platform_driver qcom_ramp_controller_driver = {
> +	.driver = {
> +		.name = "qcom-ramp-controller",
> +		.of_match_table = qcom_ramp_controller_match_table,
> +		.suppress_bind_attrs = true,
> +	},
> +	.probe  = qcom_ramp_controller_probe,
> +	.remove = qcom_ramp_controller_remove,
> +};
> +
> +static int __init qcom_ramp_controller_init(void)
> +{
> +	return platform_driver_register(&qcom_ramp_controller_driver);
> +}
> +arch_initcall(qcom_ramp_controller_init);

Does it really have to be arch initcall? Cannot be module platform driver?

> +
> +MODULE_AUTHOR("AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>");
> +MODULE_DESCRIPTION("Qualcomm Ramp Controller driver");
> +MODULE_LICENSE("GPL");

Best regards,
Krzysztof

