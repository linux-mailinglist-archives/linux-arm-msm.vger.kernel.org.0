Return-Path: <linux-arm-msm+bounces-48417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 391ABA3A4AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 18:54:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A03B77A1347
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 17:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3090270EB1;
	Tue, 18 Feb 2025 17:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NV2ML6bv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638BF26F447
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 17:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739901271; cv=none; b=CdIC20u9xwwOPogD7KkuitEPQnlkIxn5yCe2EMmZ/7ut0yOu5W1O0DtmfRRMkafViVX0epdELmv+l/joF1VhyRzz0b79+9Xym6jXKOcVW3oRxG0Dv25Tj/8UEDxSGEm+vrH5RJstoiG2fxQhS0f1Q3Vjc6UzmxvGt9/TR0PMLXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739901271; c=relaxed/simple;
	bh=7O7gacnsM6mOex+DDr8AyxTmbm8LNjdmfOHtWP0MKZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pQVdCGMTy5cV6Znm+aSLxoXO6SO47OTACAB2PVI7VEpZgH4VU6Z7OWFcqOluRHXRfx6NDbdfPZoWI60gaxf/4ygJvpRimI4rnmi8DmZuT/oNtnjNbe+/z5bLZ9cuJnpeUmVsxczlof86WtvZ7e6Zp9OZD7nGbFZHIvRqBxmgk+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NV2ML6bv; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3076262bfc6so61792061fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 09:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739901267; x=1740506067; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YI+znzuuXksA7qnH+pwXOwBdUnfrRNphP1Aa+shefSI=;
        b=NV2ML6bvD9nkQSH+Ip2sZQbA54ijce2jAZmR4vrngKNrqK2ZEaAdF+/fuYrkzV+CY6
         ndkscb0Vky2vPNRMq7dYtz1nGm2PbG0R3K4KuMtnmgnjUmB3zduYBBIyB8RXaSWIhSFH
         YtylWBfZCx1NESM+kYRuyTc0s5Vl56C7G57QE+54D10Oz0HG2hV5JBH0lLq3GmglDQ3j
         pv2jUlWlcjZdyunPQEcf3IbtpRk6J9TMo5Pt83j4goaEwQE1akN96hADXbpFNldBWrjZ
         0CewrZ05wgdOCxqTnY8FBeCTs+IyXTNhJEt0lVkzahKA3JnpMrRbREwhLlyURI3JvKjN
         yfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739901267; x=1740506067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YI+znzuuXksA7qnH+pwXOwBdUnfrRNphP1Aa+shefSI=;
        b=ocx+EcYA7ado7so3GVpkqWYl9pT9p73wMt9YjNbadnj25l/QjXlgEheAeL0jKrhcTd
         o9SLbDw/rbAZ5wF5V0nXplck0wfv/pYPH0bTs06JDyE5NRqBjXtFJHs8pMG21NgUKuRt
         fJ8/Ms7Q2zm9755ljzWEy2GmlEpdokVLSYM5aQ4oe2ciu3QPUdEsNlqStMzqtZo62kXv
         4i+GOxLrsbQ+WWGRTNnBB/+6G2UWJMfUfzY88ytIDWFD8MULxuxY8t8j6iwXx7QsmzcO
         vpnffwfK71ktyZFHJbHRCNbpe21PX8GUssTOrdk8NOqC/Q/hu0fzWmTiaJHSgR82T96D
         D2Zg==
X-Forwarded-Encrypted: i=1; AJvYcCVKbsLtvlj46pFdVjW6qPVPSHSZo7Wwk4pbDF8Y2uPu507M5nHCrfpu5NXc4g1/0HL0cpTPMma/8Rj2MEU5@vger.kernel.org
X-Gm-Message-State: AOJu0YyjMwFbkcDIFzbq+mQ5on/FxVE9aL36kWVgqz3g22E/GJesTXf8
	EkyN+GDQj3q9UV325L1EOyMXS+L35xWVEYvafCX/DJNY08SUnv5jPchjdurhYMZWkQjbp6hWf5a
	u
X-Gm-Gg: ASbGnctVehHpoRIMROROgifmQnL7VL8M1TJNXb6KHkyLfbAlQFhwP/qgcsMIMrBwN3/
	JawoW+Rg4j9uS7W1F2+NUeMbOIl1JMbGxUSTue1mmpUa4tTw1sfiGBZQR2lnCAyRdx7sb7zOQXL
	LpcbVl17k8oXoktltyUkDaVo9tMwJfUW4J/wUx23a2yT1PuRBpp4VOo+zULOXU1vHKo0EPYiIqz
	Tc3n95MGuzNSOJjndLm7e7cdHgNPlQ67YJjdvpw1zJp2jqJjc5TQk43T08F28lfkcvrhUsmAJNd
	svA2cCXijbQcoDiZxdQUIWVc4wMDgENfYHysfJj9J5yB/dW3RbTRg44SoqYstx1mjjp7FJk=
X-Google-Smtp-Source: AGHT+IGgS2rblfca+YLr7ikEH5fosM1HrQ1yesZD3FLHOUzZMq39lE7Z3Ptzi8ujTytXRTzK6lCM7Q==
X-Received: by 2002:a2e:878c:0:b0:2ff:e7c3:9e2e with SMTP id 38308e7fff4ca-30927a6f5d5mr43954511fa.17.1739901267137;
        Tue, 18 Feb 2025 09:54:27 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a25195701sm11365691fa.4.2025.02.18.09.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 09:54:26 -0800 (PST)
Date: Tue, 18 Feb 2025 19:54:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: manivannan.sadhasivam@linaro.org
Cc: Shuai Xue <xueshuai@linux.alibaba.com>, 
	Jing Zhang <renyu.zj@linux.alibaba.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring <robh@kernel.org>, 
	Shradha Todi <shradha.t@samsung.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/4] PCI: dwc: Add sysfs support for PTM
Message-ID: <qvkpasuxn54dpsvsq6vinuyjvnphvnvfcedqzvmhkpgbrgurvm@7e55l7rkkqo4>
References: <20250218-pcie-qcom-ptm-v1-0-16d7e480d73e@linaro.org>
 <20250218-pcie-qcom-ptm-v1-3-16d7e480d73e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218-pcie-qcom-ptm-v1-3-16d7e480d73e@linaro.org>

On Tue, Feb 18, 2025 at 08:06:42PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Precision Time Management (PTM) mechanism defined in PCIe spec r6.0,
> sec 6.22 allows precise coordination of timing information across multiple
> components in a PCIe hierarchy with independent local time clocks.
> 
> While the PTM support itself is indicated by the presence of PTM Extended
> Capability structure, Synopsys Designware IPs expose the PTM context
> (timing information) through Vendor Specific Extended Capability (VSEC)
> registers.
> 
> Hence, add the sysfs support to expose the PTM context information to
> userspace from both PCIe RC and EP controllers. Below PTM context are
> exposed through sysfs:
> 
> PCIe RC
> =======
> 
> 1. PTM Local clock
> 2. PTM T2 timestamp
> 3. PTM T3 timestamp
> 4. PTM Context valid
> 
> PCIe EP
> =======
> 
> 1. PTM Local clock
> 2. PTM T1 timestamp
> 3. PTM T4 timestamp
> 4. PTM Master clock
> 5. PTM Context update
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  Documentation/ABI/testing/sysfs-platform-dwc-pcie  |  70 ++++++
>  MAINTAINERS                                        |   1 +
>  drivers/pci/controller/dwc/Makefile                |   2 +-
>  drivers/pci/controller/dwc/pcie-designware-ep.c    |   3 +
>  drivers/pci/controller/dwc/pcie-designware-host.c  |   4 +
>  drivers/pci/controller/dwc/pcie-designware-sysfs.c | 278 +++++++++++++++++++++
>  drivers/pci/controller/dwc/pcie-designware.c       |   6 +
>  drivers/pci/controller/dwc/pcie-designware.h       |  22 ++
>  include/linux/pcie-dwc.h                           |   8 +
>  9 files changed, 393 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-platform-dwc-pcie b/Documentation/ABI/testing/sysfs-platform-dwc-pcie
> new file mode 100644
> index 000000000000..6b429108cd09
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-platform-dwc-pcie

Should be a class or just a ptm group in the PCIe controller device? How
generic are those attributes?

> @@ -0,0 +1,70 @@
> +What:		/sys/devices/platform/*/dwc/ptm/ptm_local_clock
> +Date:		February 2025
> +Contact:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +Description:
> +		(RO) PTM local clock in nanoseconds. Applicable for both Root
> +		Complex and Endpoint mode.
> +
> +What:		/sys/devices/platform/*/dwc/ptm/ptm_master_clock
> +Date:		February 2025
> +Contact:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +Description:
> +		(RO) PTM master clock in nanoseconds. Applicable only for
> +		Endpoint mode.
> +
> +What:		/sys/devices/platform/*/dwc/ptm/ptm_t1
> +Date:		February 2025
> +Contact:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +Description:
> +		(RO) PTM T1 timestamp in nanoseconds. Applicable only for
> +		Endpoint mode.
> +
> +What:		/sys/devices/platform/*/dwc/ptm/ptm_t2
> +Date:		February 2025
> +Contact:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +Description:
> +		(RO) PTM T2 timestamp in nanoseconds. Applicable only for
> +		Root Complex mode.
> +
> +What:		/sys/devices/platform/*/dwc/ptm/ptm_t3
> +Date:		February 2025
> +Contact:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +Description:
> +		(RO) PTM T3 timestamp in nanoseconds. Applicable only for
> +		Root Complex mode.
> +
> +What:		/sys/devices/platform/*/dwc/ptm/ptm_t4
> +Date:		February 2025
> +Contact:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +Description:
> +		(RO) PTM T4 timestamp in nanoseconds. Applicable only for
> +		Endpoint mode.
> +
> +What:		/sys/devices/platform/*/dwc/ptm/ptm_context_update
> +Date:		February 2025
> +Contact:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +Description:
> +		(RW) Control the PTM context update mode. Applicable only for
> +		Endpoint mode.
> +
> +		Following values are supported:
> +
> +		* auto = PTM context auto update trigger for every 10ms
> +
> +		* manual = PTM context manual update. Writing 'manual' to this
> +			   file triggers PTM context update (default)
> +
> +What:		/sys/devices/platform/*/dwc/ptm/ptm_context_valid
> +Date:		February 2025
> +Contact:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +Description:
> +		(RW) Control the PTM context validity (local clock timing).
> +		Applicable only for Root Complex mode. PTM context is
> +		invalidated by hardware if the Root Complex enters low power
> +		mode or changes link frequency.
> +
> +		Following values are supported:
> +
> +		* 0 = PTM context invalid (default)
> +
> +		* 1 = PTM context valid
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b4d09d52a750..1c3e21cfbc6e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18120,6 +18120,7 @@ M:	Jingoo Han <jingoohan1@gmail.com>
>  M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>  L:	linux-pci@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/ABI/testing/sysfs-platform-dwc-pcie
>  F:	Documentation/devicetree/bindings/pci/snps,dw-pcie-ep.yaml
>  F:	Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
>  F:	drivers/pci/controller/dwc/*designware*

[...]

> +
> +static struct attribute *ptm_attrs[] = {
> +	&dev_attr_ptm_context_update.attr,
> +	&dev_attr_ptm_context_valid.attr,
> +	&dev_attr_ptm_local_clock.attr,
> +	&dev_attr_ptm_master_clock.attr,
> +	&dev_attr_ptm_t1.attr,
> +	&dev_attr_ptm_t2.attr,
> +	&dev_attr_ptm_t3.attr,
> +	&dev_attr_ptm_t4.attr,
> +	NULL
> +};
> +
> +static umode_t ptm_attr_visible(struct kobject *kobj, struct attribute *attr,
> +				int n)
> +{
> +	struct device *dev = container_of(kobj, struct device, kobj);
> +	struct dw_pcie *pci = dev_get_drvdata(dev);
> +
> +	/* RC only needs local, t2 and t3 clocks and context_valid */
> +	if ((attr == &dev_attr_ptm_t1.attr && pci->mode == DW_PCIE_RC_TYPE) ||
> +	    (attr == &dev_attr_ptm_t4.attr && pci->mode == DW_PCIE_RC_TYPE) ||
> +	    (attr == &dev_attr_ptm_master_clock.attr && pci->mode == DW_PCIE_RC_TYPE) ||
> +	    (attr == &dev_attr_ptm_context_update.attr && pci->mode == DW_PCIE_RC_TYPE))
> +		return 0;

The pci->mode checks definitely can be refactored to a top-level instead
of being repeated on each line.

> +
> +	/* EP only needs local, master, t1, and t4 clocks and context_update */
> +	if ((attr == &dev_attr_ptm_t2.attr && pci->mode == DW_PCIE_EP_TYPE) ||
> +	    (attr == &dev_attr_ptm_t3.attr && pci->mode == DW_PCIE_EP_TYPE) ||
> +	    (attr == &dev_attr_ptm_context_valid.attr && pci->mode == DW_PCIE_EP_TYPE))
> +		return 0;
> +
> +	return attr->mode;

I think it might be better to register two separate groups, one for RC,
one for EP and use presense of the corresponding capability in the
.is_visible callback to check if the PTM attributes should be visible at
all.

> +}
> +
> +static const struct attribute_group ptm_attr_group = {
> +	.name = "ptm",
> +	.attrs = ptm_attrs,
> +	.is_visible = ptm_attr_visible,
> +};
> +
> +static const struct attribute_group *dwc_pcie_attr_groups[] = {
> +	&ptm_attr_group,
> +	NULL,
> +};
> +
> +static void pcie_designware_sysfs_release(struct device *dev)
> +{
> +	kfree(dev);
> +}
> +
> +void pcie_designware_sysfs_init(struct dw_pcie *pci,
> +				    enum dw_pcie_device_mode mode)
> +{
> +	struct device *dev;
> +	int ret;
> +
> +	/* Check for capabilities before creating sysfs attrbutes */
> +	ret = dw_pcie_find_ptm_capability(pci);
> +	if (!ret) {
> +		dev_dbg(pci->dev, "PTM capability not present\n");
> +		return;
> +	}
> +
> +	pci->ptm_vsec_offset = ret;
> +	pci->mode = mode;
> +
> +	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
> +	if (!dev)
> +		return;
> +
> +	device_initialize(dev);
> +	dev->groups = dwc_pcie_attr_groups;
> +	dev->release = pcie_designware_sysfs_release;
> +	dev->parent = pci->dev;
> +	dev_set_drvdata(dev, pci);
> +
> +	ret = dev_set_name(dev, "dwc");
> +	if (ret)
> +		goto err_free;
> +
> +	ret = device_add(dev);
> +	if (ret)
> +		goto err_free;
> +
> +	pci->sysfs_dev = dev;

Why do you need to add a new device under the PCIe controller?

> +
> +	return;
> +
> +err_free:
> +	put_device(dev);
> +}
> +
> +void pcie_designware_sysfs_exit(struct dw_pcie *pci)
> +{
> +	if (pci->sysfs_dev)
> +		device_unregister(pci->sysfs_dev);
> +}
> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> index a7c0671c6715..30825ec0648e 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.c
> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -323,6 +323,12 @@ static u16 dw_pcie_find_vsec_capability(struct dw_pcie *pci,
>  	return 0;
>  }
>  
> +u16 dw_pcie_find_ptm_capability(struct dw_pcie *pci)
> +{
> +	return dw_pcie_find_vsec_capability(pci, dwc_pcie_ptm_vsec_ids);
> +}
> +EXPORT_SYMBOL_GPL(dw_pcie_find_ptm_capability);

This API should go into the previous patch. Otherwise it will result in
unused function warnings.

> +
>  int dw_pcie_read(void __iomem *addr, int size, u32 *val)
>  {
>  	if (!IS_ALIGNED((uintptr_t)addr, size)) {
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 501d9ddfea16..7d3cbdce37c8 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -260,6 +260,21 @@
>  
>  #define PCIE_RAS_DES_EVENT_COUNTER_DATA		0xc
>  
> +/* PTM register definitions */
> +#define PTM_RES_REQ_CTRL		0x8
> +#define PTM_RES_CCONTEXT_VALID		BIT(0)
> +#define PTM_REQ_AUTO_UPDATE_ENABLED	BIT(0)
> +#define PTM_REQ_START_UPDATE		BIT(1)
> +
> +#define PTM_LOCAL_LSB			0x10
> +#define PTM_LOCAL_MSB			0x14
> +#define PTM_T1_T2_LSB			0x18
> +#define PTM_T1_T2_MSB			0x1c
> +#define PTM_T3_T4_LSB			0x28
> +#define PTM_T3_T4_MSB			0x2c
> +#define PTM_MASTER_LSB			0x38
> +#define PTM_MASTER_MSB			0x3c
> +
>  /*
>   * The default address offset between dbi_base and atu_base. Root controller
>   * drivers are not required to initialize atu_base if the offset matches this
> @@ -439,6 +454,7 @@ struct dw_pcie_ops {
>  
>  struct dw_pcie {
>  	struct device		*dev;
> +	struct device		*sysfs_dev;
>  	void __iomem		*dbi_base;
>  	resource_size_t		dbi_phys_addr;
>  	void __iomem		*dbi_base2;
> @@ -464,6 +480,8 @@ struct dw_pcie {
>  	struct reset_control_bulk_data	app_rsts[DW_PCIE_NUM_APP_RSTS];
>  	struct reset_control_bulk_data	core_rsts[DW_PCIE_NUM_CORE_RSTS];
>  	struct gpio_desc		*pe_rst;
> +	u16			ptm_vsec_offset;
> +	enum			dw_pcie_device_mode mode;
>  	bool			suspended;
>  };
>  
> @@ -478,6 +496,7 @@ void dw_pcie_version_detect(struct dw_pcie *pci);
>  
>  u8 dw_pcie_find_capability(struct dw_pcie *pci, u8 cap);
>  u16 dw_pcie_find_ext_capability(struct dw_pcie *pci, u8 cap);
> +u16 dw_pcie_find_ptm_capability(struct dw_pcie *pci);
>  
>  int dw_pcie_read(void __iomem *addr, int size, u32 *val);
>  int dw_pcie_write(void __iomem *addr, int size, u32 val);
> @@ -499,6 +518,9 @@ void dw_pcie_setup(struct dw_pcie *pci);
>  void dw_pcie_iatu_detect(struct dw_pcie *pci);
>  int dw_pcie_edma_detect(struct dw_pcie *pci);
>  void dw_pcie_edma_remove(struct dw_pcie *pci);
> +void pcie_designware_sysfs_init(struct dw_pcie *pci,
> +				enum dw_pcie_device_mode mode);
> +void pcie_designware_sysfs_exit(struct dw_pcie *pci);
>  
>  static inline void dw_pcie_writel_dbi(struct dw_pcie *pci, u32 reg, u32 val)
>  {
> diff --git a/include/linux/pcie-dwc.h b/include/linux/pcie-dwc.h
> index 261ae11d75a4..13835896290a 100644
> --- a/include/linux/pcie-dwc.h
> +++ b/include/linux/pcie-dwc.h
> @@ -31,4 +31,12 @@ static const struct dwc_pcie_vsec_id dwc_pcie_pmu_vsec_ids[] = {
>  	{} /* terminator */
>  };
>  
> +static const struct dwc_pcie_vsec_id dwc_pcie_ptm_vsec_ids[] = {
> +	{ .vendor_id = PCI_VENDOR_ID_QCOM, /* EP */
> +	  .vsec_id = 0x03, .vsec_rev = 0x1 },
> +	{ .vendor_id = PCI_VENDOR_ID_QCOM, /* RC */
> +	  .vsec_id = 0x04, .vsec_rev = 0x1 },
> +	{ }
> +};
> +
>  #endif /* LINUX_PCIE_DWC_H */
> 
> -- 
> 2.25.1
> 
> 

-- 
With best wishes
Dmitry

