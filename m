Return-Path: <linux-arm-msm+bounces-38010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEE79CDD5D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 12:21:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD3902837FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 11:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C821B21B6;
	Fri, 15 Nov 2024 11:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cNurve2y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEDA1ABEDF
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 11:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731669694; cv=none; b=o17CV1DZM+gLwD7mynGiX2JvPZPa7/J///hO+ZfyWrNP11XJl4PR6wJd0IVPX1qAiU8mPBU/P+O7wfOHHxSWwP3QEiorshF3KfEkXB4MOHJAcq/jQJrnfy5KVW2m8885IODL1m0qyH8cMJ0R60XAdQeKgTa1Z7abf/TU2MJ15xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731669694; c=relaxed/simple;
	bh=Oel/o/pW5Ic84c83r4MHOLLopdqVgBINoGKIro0WqD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=muuLboLVN96cg4FW8KDywp+cjn3xlmNcwLw5ZW8eEcSPwEHZOEJAZJyrNX1fsk8tTUZoYPBKdvc654GKcNElHjiXHgWESTjigl/BJsa31QrhPnd07KE4NS3Qn6m0CyDNlvrzY44vDgRX2qjJzqX+vsefXzmb3c0xsDrwBzG+8K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cNurve2y; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20c70abba48so17184985ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 03:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731669692; x=1732274492; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ELW/N7HfoGdxV6J9AGnGqxhIM8EvK/dKl/phitL0z0A=;
        b=cNurve2yQe2PMr1efnphbIdd0uECxbxmy0cdzFdf3ytquLYNpxDfxmxU55TkxNgoes
         lDA7xirahjMwcDKUVSTCf4SAyG86dLke/T0GJ0lqnUXMCGKG7dsMdZ6TQJJ8qbcievhk
         M2ww6GzkH/pFIkQyXNVOX1IJjOr/uzMnYzN7ZDGpAmBwR9r3P7Q9AuWga0qAQWUjBMsj
         h+tg12ZImvkZEr/t5xAThILWSGBt0aIR++rIba9Y/f0tPRACVH3BW920ihbKT2T/I2O7
         lSoWn/qrsSwTPG15H30D9kakzi80vSUFayJ9zL6DyAlXvZH7CHn7jcKUS39q3iSyES+U
         +vEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731669692; x=1732274492;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ELW/N7HfoGdxV6J9AGnGqxhIM8EvK/dKl/phitL0z0A=;
        b=Ab9VMemO4xrcYWkqWg3O2+w9qKZDmerZuEc2hHzBx81wUYPCWqsxW9Uv6WtaWcwSeV
         pvWLtEMZxFFH/A+1bJuX1RgJ6pX4fJN1DQLxn3Ofyv6HdMarZRvs9Sp+7mgJUqSnZGWO
         LrAb1DfMi49WzcO8fahKNCFw2c0pDstrxvFbTcKE/i316GgItPnlWEAaDuTNkyngUHXO
         04Rg6F5mNw1lg1RlC4qDQ5YX/mjFPqewcfVtEi0kblE2bgSUNIHBmml2Tl7nIJ3s0KXf
         EfiXUZwWVn3uKKdbJK5q8mdE7vkH5zI+CbSx0fTt/19qgfz09wbNuorA9fnpkrT6LaNa
         FCzA==
X-Forwarded-Encrypted: i=1; AJvYcCXtEbuNRy8sx9guehrUJjcbJC40IQr1+vk/mplkkXpTPkYbA3ZX2Jf+jexgBSZOqRXAd/L14AWX6bLL2cg3@vger.kernel.org
X-Gm-Message-State: AOJu0YyOejLtnbMRJ+0R/j8etiX4VxkrrQZ8DCXOWnzo/g9w4BuRzQ1C
	qKfOC+IZFCe3RV08sfvT3K03rifhaO0hBl8JOCe7VbvmolmOuiG+SLKXiLQChA==
X-Google-Smtp-Source: AGHT+IFBuRI2q499WkqkjhRflq+dioVOzwcbh2YEfCg5bgRA39VJrPTlEU6z8cnSBvV06mnHdqpyAA==
X-Received: by 2002:a17:902:dac9:b0:20c:a189:c006 with SMTP id d9443c01a7336-211d0ebf0b8mr25896145ad.45.1731669691615;
        Fri, 15 Nov 2024 03:21:31 -0800 (PST)
Received: from thinkpad ([117.193.208.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f34698sm10046475ad.133.2024.11.15.03.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 03:21:31 -0800 (PST)
Date: Fri, 15 Nov 2024 16:51:23 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: neil.armstrong@linaro.org
Cc: Mayank Rana <quic_mrana@quicinc.com>, jingoohan1@gmail.com,
	will@kernel.org, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com, krzk@kernel.org,
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_krichai@quicinc.com
Subject: Re: [PATCH v3 4/4] PCI: qcom: Add Qualcomm SA8255p based PCIe root
 complex functionality
Message-ID: <20241115112123.ktv7ge3mfm6lavlj@thinkpad>
References: <20241106221341.2218416-1-quic_mrana@quicinc.com>
 <20241106221341.2218416-5-quic_mrana@quicinc.com>
 <a1f03a33-22b2-4023-8185-d15abc72bc8a@linaro.org>
 <7cfc0657-e8f4-45a8-95e2-668476ffce17@quicinc.com>
 <dffb4a49-9295-4ce3-af96-802f10c600e1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dffb4a49-9295-4ce3-af96-802f10c600e1@linaro.org>

On Fri, Nov 08, 2024 at 11:22:52AM +0100, neil.armstrong@linaro.org wrote:
> On 07/11/2024 18:45, Mayank Rana wrote:
> > 
> > 
> > On 11/7/2024 12:45 AM, neil.armstrong@linaro.org wrote:
> > > Hi,
> > > 
> > > On 06/11/2024 23:13, Mayank Rana wrote:
> > > > On SA8255p ride platform, PCIe root complex is firmware managed as well
> > > > configured into ECAM compliant mode. This change adds functionality to
> > > > enable resource management (system resource as well PCIe controller and
> > > > PHY configuration) through firmware, and enumerating ECAM compliant root
> > > > complex.
> > > > 
> > > > Signed-off-by: Mayank Rana <quic_mrana@quicinc.com>
> > > > ---
> > > >   drivers/pci/controller/dwc/Kconfig     |   1 +
> > > >   drivers/pci/controller/dwc/pcie-qcom.c | 116 +++++++++++++++++++++++--
> > > >   2 files changed, 108 insertions(+), 9 deletions(-)
> > > > 
> > > > diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> > > > index b6d6778b0698..0fe76bd39d69 100644
> > > > --- a/drivers/pci/controller/dwc/Kconfig
> > > > +++ b/drivers/pci/controller/dwc/Kconfig
> > > > @@ -275,6 +275,7 @@ config PCIE_QCOM
> > > >       select PCIE_DW_HOST
> > > >       select CRC8
> > > >       select PCIE_QCOM_COMMON
> > > > +    select PCI_HOST_COMMON
> > > >       help
> > > >         Say Y here to enable PCIe controller support on Qualcomm SoCs. The
> > > >         PCIe controller uses the DesignWare core plus Qualcomm-specific
> > > > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > > > index ef44a82be058..2cb74f902baf 100644
> > > > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > > > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > > > @@ -21,7 +21,9 @@
> > > >   #include <linux/limits.h>
> > > >   #include <linux/init.h>
> > > >   #include <linux/of.h>
> > > > +#include <linux/of_pci.h>
> > > >   #include <linux/pci.h>
> > > > +#include <linux/pci-ecam.h>
> > > >   #include <linux/pm_opp.h>
> > > >   #include <linux/pm_runtime.h>
> > > >   #include <linux/platform_device.h>
> > > > @@ -254,10 +256,12 @@ struct qcom_pcie_ops {
> > > >     * @ops: qcom PCIe ops structure
> > > >     * @override_no_snoop: Override NO_SNOOP attribute in TLP to enable cache
> > > >     * snooping
> > > > +  * @firmware_managed: Set if PCIe root complex is firmware managed
> > > >     */
> > > >   struct qcom_pcie_cfg {
> > > >       const struct qcom_pcie_ops *ops;
> > > >       bool override_no_snoop;
> > > > +    bool firmware_managed;
> > > >       bool no_l0s;
> > > >   };
> > > > @@ -1415,6 +1419,10 @@ static const struct qcom_pcie_cfg cfg_sc8280xp = {
> > > >       .no_l0s = true,
> > > >   };
> > > > +static const struct qcom_pcie_cfg cfg_fw_managed = {
> > > > +    .firmware_managed = true,
> > > > +};
> > > > +
> > > >   static const struct dw_pcie_ops dw_pcie_ops = {
> > > >       .link_up = qcom_pcie_link_up,
> > > >       .start_link = qcom_pcie_start_link,
> > > > @@ -1566,6 +1574,51 @@ static irqreturn_t qcom_pcie_global_irq_thread(int irq, void *data)
> > > >       return IRQ_HANDLED;
> > > >   }
> > > > +static void qcom_pci_free_msi(void *ptr)
> > > > +{
> > > > +    struct dw_pcie_rp *pp = (struct dw_pcie_rp *)ptr;
> > > > +
> > > > +    if (pp && pp->has_msi_ctrl)
> > > > +        dw_pcie_free_msi(pp);
> > > > +}
> > > > +
> > > > +static int qcom_pcie_ecam_host_init(struct pci_config_window *cfg)
> > > > +{
> > > > +    struct device *dev = cfg->parent;
> > > > +    struct dw_pcie_rp *pp;
> > > > +    struct dw_pcie *pci;
> > > > +    int ret;
> > > > +
> > > > +    pci = devm_kzalloc(dev, sizeof(*pci), GFP_KERNEL);
> > > > +    if (!pci)
> > > > +        return -ENOMEM;
> > > > +
> > > > +    pci->dev = dev;
> > > > +    pp = &pci->pp;
> > > > +    pci->dbi_base = cfg->win;
> > > > +    pp->num_vectors = MSI_DEF_NUM_VECTORS;
> > > > +
> > > > +    ret = dw_pcie_msi_host_init(pp);
> > > > +    if (ret)
> > > > +        return ret;
> > > > +
> > > > +    pp->has_msi_ctrl = true;
> > > > +    dw_pcie_msi_init(pp);
> > > > +
> > > > +    ret = devm_add_action_or_reset(dev, qcom_pci_free_msi, pp);
> > > > +    return ret;
> > > > +}
> > > > +
> > > > +/* ECAM ops */
> > > > +const struct pci_ecam_ops pci_qcom_ecam_ops = {
> > > > +    .init        = qcom_pcie_ecam_host_init,
> > > > +    .pci_ops    = {
> > > > +        .map_bus    = pci_ecam_map_bus,
> > > > +        .read        = pci_generic_config_read,
> > > > +        .write        = pci_generic_config_write,
> > > > +    }
> > > > +};
> > > > +
> > > >   static int qcom_pcie_probe(struct platform_device *pdev)
> > > >   {
> > > >       const struct qcom_pcie_cfg *pcie_cfg;
> > > > @@ -1580,11 +1633,52 @@ static int qcom_pcie_probe(struct platform_device *pdev)
> > > >       char *name;
> > > >       pcie_cfg = of_device_get_match_data(dev);
> > > > -    if (!pcie_cfg || !pcie_cfg->ops) {
> > > > -        dev_err(dev, "Invalid platform data\n");
> > > > +    if (!pcie_cfg) {
> > > > +        dev_err(dev, "No platform data\n");
> > > > +        return -EINVAL;
> > > > +    }
> > > > +
> > > > +    if (!pcie_cfg->firmware_managed && !pcie_cfg->ops) {
> > > > +        dev_err(dev, "No platform ops\n");
> > > >           return -EINVAL;
> > > >       }
> > > > +    pm_runtime_enable(dev);
> > > > +    ret = pm_runtime_get_sync(dev);
> > > > +    if (ret < 0)
> > > > +        goto err_pm_runtime_put;
> > > > +
> > > > +    if (pcie_cfg->firmware_managed) {
> > > > +        struct pci_host_bridge *bridge;
> > > > +        struct pci_config_window *cfg;
> > > > +
> > > > +        bridge = devm_pci_alloc_host_bridge(dev, 0);
> > > > +        if (!bridge) {
> > > > +            ret = -ENOMEM;
> > > > +            goto err_pm_runtime_put;
> > > > +        }
> > > > +
> > > > +        of_pci_check_probe_only();
> > > > +        /* Parse and map our Configuration Space windows */
> > > > +        cfg = gen_pci_init(dev, bridge, &pci_qcom_ecam_ops);
> > > > +        if (IS_ERR(cfg)) {
> > > > +            ret = PTR_ERR(cfg);
> > > > +            goto err_pm_runtime_put;
> > > > +        }
> > > > +
> > > > +        bridge->sysdata = cfg;
> > > > +        bridge->ops = (struct pci_ops *)&pci_qcom_ecam_ops.pci_ops;
> > > > +        bridge->msi_domain = true;
> > > > +
> > > > +        ret = pci_host_probe(bridge);
> > > > +        if (ret) {
> > > > +            dev_err(dev, "pci_host_probe() failed:%d\n", ret);
> > > > +            goto err_pm_runtime_put;
> > > > +        }
> > > > +
> > > > +        return ret;
> > > > +    }
> > > > +
> > > >       pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
> > > >       if (!pcie)
> > > >           return -ENOMEM;
> > > > @@ -1593,11 +1687,6 @@ static int qcom_pcie_probe(struct platform_device *pdev)
> > > >       if (!pci)
> > > >           return -ENOMEM;
> > > > -    pm_runtime_enable(dev);
> > > > -    ret = pm_runtime_get_sync(dev);
> > > > -    if (ret < 0)
> > > > -        goto err_pm_runtime_put;
> > > > -
> > > >       pci->dev = dev;
> > > >       pci->ops = &dw_pcie_ops;
> > > >       pp = &pci->pp;
> > > > @@ -1739,9 +1828,13 @@ static int qcom_pcie_probe(struct platform_device *pdev)
> > > >   static int qcom_pcie_suspend_noirq(struct device *dev)
> > > >   {
> > > > -    struct qcom_pcie *pcie = dev_get_drvdata(dev);
> > > > +    struct qcom_pcie *pcie;
> > > >       int ret = 0;
> > > > +    if (of_device_is_compatible(dev->of_node, "qcom,pcie-sa8255p"))
> > > 
> > > Can't you use if (pcie_cfg->firmware_managed) here instead ?
> > yes, although with firmware managed mode, struct qcom_pcie *pcie is not allocated, and just
> > to get access to pcie_cfg for this check, I took this approach. I am thiking to do allocating struct qcom_pcie *pcie and using it in future if we need more other related functionality which needs usage of this structure for functionality like global interrupt etc.
> > 
> > Although if you still prefer to allocate struct qcom_pcie based memory to access pcie_cfg, then I can consider to update in next patchset. Please suggest.
> 
> I understand, but running of_device_is_compatible() in runtime PM is not something we should do,
> so either allocate pcie_cfg, or add a firmware_managed bool to qcom_pcie copied from pcie_cfg,
> or move runtime pm callbacks in qcom_pcie_ops and don't declare any in cfg_fw_managed->ops.
> 
> I think the latter would be more scalable so we could add runtime pm variant handling
> for each IP versions. But it may be quite quite useless for now.
> 

Or just bail out if dev_get_drvdata() return NULL?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

