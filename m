Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5481757BB66
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Jul 2022 18:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238560AbiGTQ1s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jul 2022 12:27:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232825AbiGTQ1s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jul 2022 12:27:48 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 582AA54AC3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jul 2022 09:27:46 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id f65so16822096pgc.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jul 2022 09:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ooE778IFSi1IkfbGtX6hl4iB0LXZvmvtcSrtXeDxX3U=;
        b=OWpXoesW5LvPcXIlkw5a795g84zjw8sLeaSN+xY1ZpjUZBVg13s22EVvSUI5m8E1ST
         3Tl6UlFkxjwPU+PIU9ObEvACUGAZqM9sgz3CAXqTuB12RCMRdvbTljQiKPXal2BfZUV/
         eQwwbljSdYJXRc41H9MQSxqzylR0ANWSPZHCu/pUK9cox2uaAm0ew0GfEi4PLdBocvGW
         BtIK+7ZsVpSkJyj9D1OEN0OLaBjQYpv+8PX8zn1NmzQtSUQdCH2li+sbob/i2TtY3voq
         jiIr0iGIcgjCVQkw6jky7is5jN+RjnWb4WGyS007OcaRXv+UIM29QAt790PcD6lqayYd
         hEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ooE778IFSi1IkfbGtX6hl4iB0LXZvmvtcSrtXeDxX3U=;
        b=Ox87t98peONXI/jtAV/xPaHpQQvYDpuP1ojbz5ycfxcSbj/OfcNh67nvYCFNlXGFHG
         z69o8P7E0yw3W4C8W8ro4ZR0uvnfxYqGcT/uJ9lK1A0O1EegOrR5jwELYVwU5GizX/Qv
         g84ujL88fT2bJHz8TQsI289iJQc+0APosgFGHqDtQ0Qo2eD/EohnkjlIJjLj8QZzQO/A
         nDorJ5n2QA2dDjUSV5qYaG+eFh1Icwz6svFDiJb1ebQ04U+YnD1yXoA4NgjgfJigLqGC
         4u9QohaZi2iQ0ZX7Gifdox7INtHRIwoeG1SODyJekUz7rtB1nmGgPBdXhGlAkuYgie6y
         WN4Q==
X-Gm-Message-State: AJIora9mrBmd6run4oXJcp8KgJYAsVpfbdGMEY4SkDbACLWiN/pfFv6B
        kz92n6Juog9bcyr1x1tNLTFc
X-Google-Smtp-Source: AGRyM1vbubtETE/LAPmuKg0clgnIhra3b0byhzrWUlYjyCLZxmJNG3CoYv2F7HpVOIsP4cIfcut2tw==
X-Received: by 2002:aa7:8887:0:b0:52b:17e8:fc7 with SMTP id z7-20020aa78887000000b0052b17e80fc7mr35966355pfe.35.1658334465763;
        Wed, 20 Jul 2022 09:27:45 -0700 (PDT)
Received: from workstation ([117.217.186.84])
        by smtp.gmail.com with ESMTPSA id mp16-20020a17090b191000b001ef863193f4sm1890608pjb.33.2022.07.20.09.27.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Jul 2022 09:27:45 -0700 (PDT)
Date:   Wed, 20 Jul 2022 21:57:38 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: qcom: Add support for modular builds
Message-ID: <20220720162738.GA6035@workstation>
References: <20220519094646.23009-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220519094646.23009-1-johan+linaro@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 19, 2022 at 11:46:46AM +0200, Johan Hovold wrote:
> Allow the Qualcomm PCIe controller driver to be built as a module, which
> is useful for multi-platform kernels as well as during development.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/pci/controller/dwc/Kconfig     |  2 +-
>  drivers/pci/controller/dwc/pcie-qcom.c | 36 +++++++++++++++++++++++---
>  2 files changed, 34 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> index 62ce3abf0f19..230f56d1a268 100644
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -168,7 +168,7 @@ config PCI_HISI
>  	  Hip05 and Hip06 SoCs
>  
>  config PCIE_QCOM
> -	bool "Qualcomm PCIe controller"
> +	tristate "Qualcomm PCIe controller"
>  	depends on OF && (ARCH_QCOM || COMPILE_TEST)
>  	depends on PCI_MSI_IRQ_DOMAIN
>  	select PCIE_DW_HOST
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 8523b5ef9d16..e25d5c09657c 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -16,7 +16,7 @@
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
>  #include <linux/kernel.h>
> -#include <linux/init.h>
> +#include <linux/module.h>
>  #include <linux/of_device.h>
>  #include <linux/of_gpio.h>
>  #include <linux/pci.h>
> @@ -1425,6 +1425,15 @@ static int qcom_pcie_host_init(struct pcie_port *pp)
>  	return ret;
>  }
>  
> +static void qcom_pcie_host_deinit(struct qcom_pcie *pcie)
> +{
> +	qcom_ep_reset_assert(pcie);
> +	if (pcie->cfg->ops->post_deinit)
> +		pcie->cfg->ops->post_deinit(pcie);
> +	phy_power_off(pcie->phy);
> +	pcie->cfg->ops->deinit(pcie);
> +}
> +
>  static const struct dw_pcie_host_ops qcom_pcie_dw_ops = {
>  	.host_init = qcom_pcie_host_init,
>  };
> @@ -1651,6 +1660,22 @@ static int qcom_pcie_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> +static int qcom_pcie_remove(struct platform_device *pdev)
> +{
> +	struct qcom_pcie *pcie = platform_get_drvdata(pdev);
> +	struct device *dev = &pdev->dev;
> +
> +	dw_pcie_host_deinit(&pcie->pci->pp);
> +	qcom_pcie_host_deinit(pcie);
> +
> +	phy_exit(pcie->phy);
> +
> +	pm_runtime_put_sync(dev);
> +	pm_runtime_disable(dev);
> +
> +	return 0;
> +}
> +
>  static const struct of_device_id qcom_pcie_match[] = {
>  	{ .compatible = "qcom,pcie-apq8084", .data = &apq8084_cfg },
>  	{ .compatible = "qcom,pcie-ipq8064", .data = &ipq8064_cfg },
> @@ -1669,6 +1694,7 @@ static const struct of_device_id qcom_pcie_match[] = {
>  	{ .compatible = "qcom,pcie-sc7280", .data = &sc7280_cfg },
>  	{ }
>  };
> +MODULE_DEVICE_TABLE(of, qcom_pcie_match);
>  
>  static void qcom_fixup_class(struct pci_dev *dev)
>  {
> @@ -1684,10 +1710,14 @@ DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_QCOM, 0x1001, qcom_fixup_class);
>  
>  static struct platform_driver qcom_pcie_driver = {
>  	.probe = qcom_pcie_probe,
> +	.remove = qcom_pcie_remove,
>  	.driver = {
>  		.name = "qcom-pcie",
> -		.suppress_bind_attrs = true,
>  		.of_match_table = qcom_pcie_match,
>  	},
>  };
> -builtin_platform_driver(qcom_pcie_driver);
> +module_platform_driver(qcom_pcie_driver);
> +
> +MODULE_AUTHOR("Stanimir Varbanov <svarbanov@mm-sol.com>");
> +MODULE_DESCRIPTION("Qualcomm PCIe root complex driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.35.1
> 
