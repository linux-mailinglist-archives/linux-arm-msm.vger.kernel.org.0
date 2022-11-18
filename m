Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BF8462F374
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Nov 2022 12:17:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241377AbiKRLRl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 06:17:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235219AbiKRLRk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 06:17:40 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F48C8EB51
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 03:17:38 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id x5so4690765wrt.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 03:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CSkFHgevabuZjvANL1RYhOAj/AzunXZe9f8AOvvsIl0=;
        b=tDg6M5k2ouCur0igY2qHHtlNsoC6a8/JwHpjs44o1wZgj5nQSlnSu7c1hM4czRUvdG
         MA4ToWZ4O95tFc6uZzPoMrVj8LS4k1CSRt9N2fzTeYhrIIqJaa/VoU/czeXv75kmB2IU
         YhEu2Dg2BTnERkBe8/Mr4zbfRDLDCToS90lNSx/JMKXHBAWM7ohT4CG9ifZ4acx3TQBg
         IwKAqrokssYT4T+kB+CxLQG7mUycEmRWkgl2BmJBg0wnWX+hrZzjdy7HPlUKBxddzFsZ
         sWpZ+7xef1yCvjCYy44JRnb8fcuZFYxs0xXqDflfonibb3PaHuRb+dcXOxMMZUplnaw2
         Ic3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CSkFHgevabuZjvANL1RYhOAj/AzunXZe9f8AOvvsIl0=;
        b=bnlC/4CjhPsSA207o87OGAq+Pu/CHDeqkfnUH8PymW4oi3ZWET+Bc3R06We1MgCrql
         pC0Sxacvp6chgxGwfZ+j4FEBdf1e8qYdQud4nLBVLw4vMcZR0C/IlaswSr25s8Vot1dh
         ST+yDHCxPjiVy2WltF43cKLDm8HQOjWbjhmdR51PqG9K+n3YoEzmf/FPwu+ksuXlmSX4
         K2dTp4t/eXgBEqSPlM07qFauLiV61ciBayPtbFVd7lGaQrty52FiPTOezu7Z3hMq6Mz6
         lvIDHIUVyvgPjGd7KckQns+BgR9vI4EdzJzPV4fYRYzCUKLEX3yiTWlt0lQWxv15trFq
         0XbQ==
X-Gm-Message-State: ANoB5pnXfgykh4oMnyhCJwTFZ+Tx/wvXoSEi75RwQ/6XdPZjmV45gibG
        Sx5pxil7LuAjdDRVnztfVsdfxA==
X-Google-Smtp-Source: AA0mqf5DcR3zCJuQbw9WWUpiC/6yyN8KsckObgzeEKOksN0/GKLcFWgj7ov94HF72hJtSX2LXPKOWQ==
X-Received: by 2002:adf:e844:0:b0:241:bfc9:5975 with SMTP id d4-20020adfe844000000b00241bfc95975mr1637001wrn.605.1668770256970;
        Fri, 18 Nov 2022 03:17:36 -0800 (PST)
Received: from [192.168.22.132] ([167.98.215.174])
        by smtp.googlemail.com with ESMTPSA id he5-20020a05600c540500b003cfd4e6400csm4305458wmb.19.2022.11.18.03.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 03:17:36 -0800 (PST)
Message-ID: <8cf8c902-571e-feb8-82a6-42e25e57caac@linaro.org>
Date:   Fri, 18 Nov 2022 11:17:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/2] soc: qcom: add MDSS DSM memory driver
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20221114-narmstrong-sm8550-upstream-mpss_dsm-v2-0-f7c65d6f0e55@linaro.org>
 <20221114-narmstrong-sm8550-upstream-mpss_dsm-v2-2-f7c65d6f0e55@linaro.org>
Content-Language: en-US
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-mpss_dsm-v2-2-f7c65d6f0e55@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 18/11/2022 08:53, Neil Armstrong wrote:
> Add a driver for the Qualcomm Modem Processing SubSystem DSM memory
> used to assign such regions of memory with remote MPSS processors.
> 
> This memory zone is shared between the APPS and the MPSS subsystem,
> and must be configured during the whole lifetime of the system.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/of/platform.c           |  1 +
>   drivers/soc/qcom/Kconfig        | 10 +++++
>   drivers/soc/qcom/Makefile       |  1 +
>   drivers/soc/qcom/mpss_dsm_mem.c | 95 +++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 107 insertions(+)
> 
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 3507095a69f6..d4bb03292f45 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -505,6 +505,7 @@ EXPORT_SYMBOL_GPL(of_platform_default_populate);
>   
>   static const struct of_device_id reserved_mem_matches[] = {
>   	{ .compatible = "phram" },
> +	{ .compatible = "qcom,mpss-dsm-mem" },
>   	{ .compatible = "qcom,rmtfs-mem" },
>   	{ .compatible = "qcom,cmd-db" },
>   	{ .compatible = "qcom,smem" },
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 024e420f1bb7..7624a8af56bf 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -95,6 +95,16 @@ config QCOM_QMI_HELPERS
>   	tristate
>   	depends on NET
>   
> +config QCOM_MPSS_DSM_MEM
> +	tristate "Qualcomm Modem Processing SubSystem DSM memory driver"
> +	depends on ARCH_QCOM
> +	select QCOM_SCM
> +	help
> +	  The Qualcomm Modem Processing SubSystem DSM memory driver is used to
> +	  assign regions of DSM memory with remote MPSS processors.
> +
> +	  Say y here if you intend to boot the modem remoteproc.
> +
>   config QCOM_RMTFS_MEM
>   	tristate "Qualcomm Remote Filesystem memory driver"
>   	depends on ARCH_QCOM
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index d66604aff2b0..0d0e850f1a18 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -16,6 +16,7 @@ qcom_rpmh-y			+= rpmh-rsc.o
>   qcom_rpmh-y			+= rpmh.o
>   obj-$(CONFIG_QCOM_SMD_RPM)	+= smd-rpm.o
>   obj-$(CONFIG_QCOM_SMEM) +=	smem.o
> +obj-$(CONFIG_QCOM_MPSS_DSM_MEM) += mpss_dsm_mem.o
>   obj-$(CONFIG_QCOM_SMEM_STATE) += smem_state.o
>   obj-$(CONFIG_QCOM_SMP2P)	+= smp2p.o
>   obj-$(CONFIG_QCOM_SMSM)	+= smsm.o
> diff --git a/drivers/soc/qcom/mpss_dsm_mem.c b/drivers/soc/qcom/mpss_dsm_mem.c
> new file mode 100644
> index 000000000000..5584bd101aee
> --- /dev/null
> +++ b/drivers/soc/qcom/mpss_dsm_mem.c
> @@ -0,0 +1,95 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022 Linaro Ltd.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/of.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/slab.h>
> +#include <linux/qcom_scm.h>
> +
> +struct qcom_mpss_dsm_mem {
> +	phys_addr_t addr;
> +	phys_addr_t size;
> +
> +	unsigned int perms;
> +};
> +
> +static int qcom_mpss_dsm_mem_probe(struct platform_device *pdev)
> +{
> +	struct device_node *node = pdev->dev.of_node;
> +	struct qcom_scm_vmperm perm;
> +	struct reserved_mem *rmem;
> +	struct qcom_mpss_dsm_mem *mpss_dsm_mem;
> +	int ret;
> +
> +	if (!qcom_scm_is_available())
> +		return -EPROBE_DEFER;
> +
> +	rmem = of_reserved_mem_lookup(node);
> +	if (!rmem) {
> +		dev_err(&pdev->dev, "failed to acquire memory region\n");
> +		return -EINVAL;
> +	}
> +
> +	mpss_dsm_mem = kzalloc(sizeof(*mpss_dsm_mem), GFP_KERNEL);
> +	if (!mpss_dsm_mem)
> +		return -ENOMEM;
> +
> +	mpss_dsm_mem->addr = rmem->base;
> +	mpss_dsm_mem->size = rmem->size;
> +
> +	perm.vmid = QCOM_SCM_VMID_MSS_MSA;
> +	perm.perm = QCOM_SCM_PERM_RW;
> +
> +	mpss_dsm_mem->perms = BIT(QCOM_SCM_VMID_HLOS);
> +	ret = qcom_scm_assign_mem(mpss_dsm_mem->addr, mpss_dsm_mem->size,
> +				  &mpss_dsm_mem->perms, &perm, 1);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "assign memory failed\n");

memory leak here?


> +		return ret;
> +	}
> +
> +	dev_set_drvdata(&pdev->dev, mpss_dsm_mem);
> +
> +	return 0;
> +}
> +
> +static int qcom_mpss_dsm_mem_remove(struct platform_device *pdev)
> +{
> +	struct qcom_mpss_dsm_mem *mpss_dsm_mem = dev_get_drvdata(&pdev->dev);
> +	struct qcom_scm_vmperm perm;
> +
> +	perm.vmid = QCOM_SCM_VMID_HLOS;
> +	perm.perm = QCOM_SCM_PERM_RW;
> +
> +	qcom_scm_assign_mem(mpss_dsm_mem->addr, mpss_dsm_mem->size,
> +			    &mpss_dsm_mem->perms, &perm, 1);
> +

same here.

> +	return 0;
> +}
> +
> +static const struct of_device_id qcom_mpss_dsm_mem_of_match[] = {
> +	{ .compatible = "qcom,mpss-dsm-mem" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, qcom_mpss_dsm_mem_of_match);
> +
> +static struct platform_driver qcom_mpss_dsm_mem_driver = {
> +	.probe = qcom_mpss_dsm_mem_probe,
> +	.remove = qcom_mpss_dsm_mem_remove,
> +	.driver  = {
> +		.name  = "qcom_mpss_dsm_mem",
> +		.of_match_table = qcom_mpss_dsm_mem_of_match,
> +	},
> +};
> +
> +module_platform_driver(qcom_mpss_dsm_mem_driver);
> +
> +MODULE_AUTHOR("Linaro Ltd");
> +MODULE_DESCRIPTION("Qualcomm DSM memory driver");
> +MODULE_LICENSE("GPL");
> 
