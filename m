Return-Path: <linux-arm-msm+bounces-57879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D59AB7187
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 18:35:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78DAF3AF4CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 16:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A659D27990E;
	Wed, 14 May 2025 16:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fn4THqlg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9F527A131
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 16:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747240506; cv=none; b=iBWrJmHJaQtZD7NJ9Tztgy1st0Shg/U4xObwFDsfXMpYN4eb1fKGJvL2yqYtX5w1vKqQHS51KFZywMiKImzRN3UE6pSKKseIRmlFT8RYlpleaZIfjJLHt+IuYB+4OO48jkWxjFoZj9JHMGPuVhC7z+GIjymY7WyEJ1U/G66wMVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747240506; c=relaxed/simple;
	bh=jMqaj7CoSlKge6w9ihSGG6969e9NHdD3WrG9K31ZQaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qeF2GH8zKdDK0O33zuOA5ew37oA7cEwcsfguXXmZEnsmDl/NKshRME5+jfgbPzmWNe+FaJmfR6JGhCTsmXWN8T1Qus49mJng156BZaDXIbRvI3ARk4A76I4gTxCFY99pIuNVxq7ct6ZONO17jjrFOP9Dhy/ccuZmjsEgvOcO2Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fn4THqlg; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a0b637db6eso4283482f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 09:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747240503; x=1747845303; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AOckZ8P9OykpU46zTLvu6zDFwY48KuX591SKzhfoGSE=;
        b=fn4THqlgGxgP9fH1cN0T9bNgMhxYOQCUJLm30Ny3R86vjZ8FK7iHDoqR6jF+/Z4xSU
         5YCSvxlVxMvDYdu19y6owG6phma5ZbzM8wH7ebQy/3RszIvu4IUP2CcFlKimxUyMgKfO
         pAxpZl5KnF4Nivt8JaxFkTb27DiHng+W6VF4rkatMhaLid7BJnr9mHlXp9HoY8NInTgd
         +0BgHeWu7S6+/IUWVOpZ4bsEVSr2EhL1OR+Rf98Oe8aq/C6WlOirftc32yRXHO1DZetO
         8u4CjdC2LtgLAsl7Y7W/BQCbArWUPwQ+q/rSO4MCp/zLGJDa7XD/6BOgTfPkyc9Z7YUf
         1Y1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747240503; x=1747845303;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AOckZ8P9OykpU46zTLvu6zDFwY48KuX591SKzhfoGSE=;
        b=N/AfV6IwSNuzn86PT+8ox9sqGVkCoY27ZA/oNbIn8ZNelKQ8DAq0cyO/6W3r3UplPp
         DIgNRTVejzK/t0rRA6pVLwsMXunLDczIC5YBmeQUtXXoDWfz8ANUKmdfiI0IGZGm3DJb
         f/kYlmnTEnioTdGHzxj2Vs0IEZKW1v/jlhfGMrdtf75uKHvZuUgVfw07oQcqmRjTV3pe
         jV25h1zoaKK3nQokiixObD0wkzZTORY9I/n5Ssgc81fkYy2gywb4B8C2M+JlURezftsh
         ZEucODDwZku/DK59Pmhyn1+9ueRUCyby0jqU7A+gw4287KLB88NIgL3uixKA1GKVvpHR
         EVGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKQBf7vA4YG/y0LeMTXVR/XThkr11kMfe5h2GLTyCqpXJAhbY0bjFx2xbQujBheuaI5Y9gZ/xLEqDGJvTz@vger.kernel.org
X-Gm-Message-State: AOJu0YyDEJ3iH8CXTliUK79+ZxDB3EtV1P0m4RF/COiz8Jl/RY8SLHdt
	dD6gIDqydseIcOmZPFQ9L0/LWyLkVWYzA++4BiURBvJR4OcJqdwNHZ0T8Y2q+g==
X-Gm-Gg: ASbGncthiMU2OuGjemfexUZbSTz/ERz1lCRtCBDaiVn54GfgjyoyKJ68uR2t82LeB3Y
	UTp4ndLceMoVaCEZ1VNjeXx5miV7e3Cqv4F7fxjSR0VdzWtH+hjCyt6Gj4StfakyQh1CsijexNl
	h0aQo0Pwk15YQ+U5DP0UE+4Q4JWGe/C3fT869igf94qqmNRV7jrN3sU6C/g85Rzgym8WPKhi6PU
	WwSk7gl97YlyR7jifU2upfRsjWJB/aWT0ffu2x9jBZVzqjfU7VrDXdpQp+ZTkgrRpMjXmMy9NqF
	jcnt+voL5Sd1Jc4BiazN+mSfCW2KtJWhr9wTwV0njdqShRrOhCL0x8yeZXlXf3di6XzOu8TcKIN
	aed+VtijeNuI4cg==
X-Google-Smtp-Source: AGHT+IGj3+htGnEIyMivpivIivCnjfIy6Tideg6ovbKdF3ZUejVVtTS1+sX05zRZKNfgj9Ou9ozS3A==
X-Received: by 2002:a05:6000:1848:b0:3a0:b4f1:8bb8 with SMTP id ffacd0b85a97d-3a3496c38b8mr3799664f8f.34.1747240502599;
        Wed, 14 May 2025 09:35:02 -0700 (PDT)
Received: from thinkpad (112.8.30.213.rev.vodafone.pt. [213.30.8.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2d2d3sm20577369f8f.63.2025.05.14.09.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 09:35:02 -0700 (PDT)
Date: Wed, 14 May 2025 17:35:00 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>, 
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 5/5] PCI: qcom: Add support for resetting the slot due
 to link down event
Message-ID: <sotge26h35mcijcu3eqkbf7aimkwnxzhbgltoz74nfnefc7fjd@xct54hpv5ane>
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
 <20250508-pcie-reset-slot-v4-5-7050093e2b50@linaro.org>
 <1b4b7ee5-1d7e-573c-0647-44aad654354a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b4b7ee5-1d7e-573c-0647-44aad654354a@oss.qualcomm.com>

On Wed, May 14, 2025 at 11:52:13AM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 5/8/2025 12:40 PM, Manivannan Sadhasivam wrote:
> > The PCIe link can go down under circumstances such as the device firmware
> > crash, link instability, etc... When that happens, the PCIe slot needs to
> > be reset to make it operational again. Currently, the driver is not
> > handling the link down event, due to which the users have to restart the
> > machine to make PCIe link operational again. So fix it by detecting the
> > link down event and resetting the slot.
> > 
> > Since the Qcom PCIe controllers report the link down event through the
> > 'global' IRQ, enable the link down event by setting PARF_INT_ALL_LINK_DOWN
> > bit in PARF_INT_ALL_MASK register.
> > 
> > Then in the case of the event, call pci_host_handle_link_down() API
> > in the handler to let the PCI core handle the link down condition. Note
> > that both link up and link down events could be set at a time when the
> > handler runs. So always handle link down first.
> > 
> > The API will internally call, 'pci_host_bridge::reset_slot()' callback to
> > reset the slot in a platform specific way. So implement the callback to
> > reset the slot by first resetting the PCIe core, followed by reinitializing
> > the resources and then finally starting the link again.
> > 
> Only one comment see below.
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > ---
> >   drivers/pci/controller/dwc/Kconfig     |   1 +
> >   drivers/pci/controller/dwc/pcie-qcom.c | 112 ++++++++++++++++++++++++++++++---
> >   2 files changed, 105 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> > index d9f0386396edf66ad0e514a0f545ed24d89fcb6c..ce04ee6fbd99cbcce5d2f3a75ebd72a17070b7b7 100644
> > --- a/drivers/pci/controller/dwc/Kconfig
> > +++ b/drivers/pci/controller/dwc/Kconfig
> > @@ -296,6 +296,7 @@ config PCIE_QCOM
> >   	select PCIE_DW_HOST
> >   	select CRC8
> >   	select PCIE_QCOM_COMMON
> > +	select PCI_HOST_COMMON
> >   	help
> >   	  Say Y here to enable PCIe controller support on Qualcomm SoCs. The
> >   	  PCIe controller uses the DesignWare core plus Qualcomm-specific
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > index dc98ae63362db0422384b1879a2b9a7dc564d091..e577619d0f8ceddf0955139ae6b939842f8cb7be 100644
> > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > @@ -34,6 +34,7 @@
> >   #include <linux/units.h>
> >   #include "../../pci.h"
> > +#include "../pci-host-common.h"
> >   #include "pcie-designware.h"
> >   #include "pcie-qcom-common.h"
> > @@ -55,6 +56,7 @@
> >   #define PARF_INT_ALL_STATUS			0x224
> >   #define PARF_INT_ALL_CLEAR			0x228
> >   #define PARF_INT_ALL_MASK			0x22c
> > +#define PARF_STATUS				0x230
> >   #define PARF_SID_OFFSET				0x234
> >   #define PARF_BDF_TRANSLATE_CFG			0x24c
> >   #define PARF_DBI_BASE_ADDR_V2			0x350
> > @@ -130,9 +132,14 @@
> >   /* PARF_LTSSM register fields */
> >   #define LTSSM_EN				BIT(8)
> > +#define SW_CLEAR_FLUSH_MODE			BIT(10)
> > +#define FLUSH_MODE				BIT(11)
> >   /* PARF_INT_ALL_{STATUS/CLEAR/MASK} register fields */
> > -#define PARF_INT_ALL_LINK_UP			BIT(13)
> > +#define INT_ALL_LINK_DOWN			1
> > +#define INT_ALL_LINK_UP				13
> > +#define PARF_INT_ALL_LINK_DOWN			BIT(INT_ALL_LINK_DOWN)
> > +#define PARF_INT_ALL_LINK_UP			BIT(INT_ALL_LINK_UP)
> >   #define PARF_INT_MSI_DEV_0_7			GENMASK(30, 23)
> >   /* PARF_NO_SNOOP_OVERRIDE register fields */
> > @@ -145,6 +152,9 @@
> >   /* PARF_BDF_TO_SID_CFG fields */
> >   #define BDF_TO_SID_BYPASS			BIT(0)
> > +/* PARF_STATUS fields */
> > +#define FLUSH_COMPLETED				BIT(8)
> > +
> >   /* ELBI_SYS_CTRL register fields */
> >   #define ELBI_SYS_CTRL_LT_ENABLE			BIT(0)
> > @@ -169,6 +179,7 @@
> >   						PCIE_CAP_SLOT_POWER_LIMIT_SCALE)
> >   #define PERST_DELAY_US				1000
> > +#define FLUSH_TIMEOUT_US			100
> >   #define QCOM_PCIE_CRC8_POLYNOMIAL		(BIT(2) | BIT(1) | BIT(0))
> > @@ -274,11 +285,14 @@ struct qcom_pcie {
> >   	struct icc_path *icc_cpu;
> >   	const struct qcom_pcie_cfg *cfg;
> >   	struct dentry *debugfs;
> > +	int global_irq;
> >   	bool suspended;
> >   	bool use_pm_opp;
> >   };
> >   #define to_qcom_pcie(x)		dev_get_drvdata((x)->dev)
> > +static int qcom_pcie_reset_slot(struct pci_host_bridge *bridge,
> > +				  struct pci_dev *pdev);
> >   static void qcom_ep_reset_assert(struct qcom_pcie *pcie)
> >   {
> > @@ -1263,6 +1277,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
> >   			goto err_assert_reset;
> >   	}
> > +	pp->bridge->reset_slot = qcom_pcie_reset_slot;
> > +
> >   	return 0;
> >   err_assert_reset:
> > @@ -1517,6 +1533,74 @@ static void qcom_pcie_icc_opp_update(struct qcom_pcie *pcie)
> >   	}
> >   }
> > +static int qcom_pcie_reset_slot(struct pci_host_bridge *bridge,
> > +				  struct pci_dev *pdev)
> > +{
> > +	struct pci_bus *bus = bridge->bus;
> > +	struct dw_pcie_rp *pp = bus->sysdata;
> > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > +	struct qcom_pcie *pcie = to_qcom_pcie(pci);
> > +	struct device *dev = pcie->pci->dev;
> > +	u32 val;
> > +	int ret;
> > +
> > +	/* Wait for the pending transactions to be completed */
> > +	ret = readl_relaxed_poll_timeout(pcie->parf + PARF_STATUS, val,
> > +					 val & FLUSH_COMPLETED, 10,
> > +					 FLUSH_TIMEOUT_US);
> > +	if (ret) {
> > +		dev_err(dev, "Flush completion failed: %d\n", ret);
> > +		goto err_host_deinit;
> > +	}
> > +
> > +	/* Clear the FLUSH_MODE to allow the core to be reset */
> > +	val = readl(pcie->parf + PARF_LTSSM);
> > +	val |= SW_CLEAR_FLUSH_MODE;
> > +	writel(val, pcie->parf + PARF_LTSSM);
> > +
> > +	/* Wait for the FLUSH_MODE to clear */
> > +	ret = readl_relaxed_poll_timeout(pcie->parf + PARF_LTSSM, val,
> > +					 !(val & FLUSH_MODE), 10,
> > +					 FLUSH_TIMEOUT_US);
> > +	if (ret) {
> > +		dev_err(dev, "Flush mode clear failed: %d\n", ret);
> > +		goto err_host_deinit;
> > +	}
> > +
> > +	qcom_pcie_host_deinit(pp);
> > +
> > +	ret = qcom_pcie_host_init(pp);
> > +	if (ret) {
> > +		dev_err(dev, "Host init failed\n");
> > +		return ret;
> > +	}
> > +
> > +	ret = dw_pcie_setup_rc(pp);
> > +	if (ret)
> > +		goto err_host_deinit;
> > +
> > +	/*
> > +	 * Re-enable global IRQ events as the PARF_INT_ALL_MASK register is
> > +	 * non-sticky.
> > +	 */
> > +	if (pcie->global_irq)
> > +		writel_relaxed(PARF_INT_ALL_LINK_UP | PARF_INT_ALL_LINK_DOWN |
> > +			       PARF_INT_MSI_DEV_0_7, pcie->parf + PARF_INT_ALL_MASK);
> > +
> > +	qcom_pcie_start_link(pci);
> > +	if (!dw_pcie_wait_for_link(pci))
> > +		qcom_pcie_icc_opp_update(pcie);
> This icc opp update can we removed as this can updated from the global
> IRQ.

Right. I forgot to remove it after keeping link up IRQ change. Removed it while
applying.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

