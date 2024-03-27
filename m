Return-Path: <linux-arm-msm+bounces-15362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE0788D9EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 10:15:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0FC7B2522D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 09:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99AC381C1;
	Wed, 27 Mar 2024 09:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m5ONv8iC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C9F374CC
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 09:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711530873; cv=none; b=XXhtixUMq+zrZFEBO/fvl8rGIHB9Kl+t6L0L5HkQzeCgJ164t/g5RFMz1y/RQNcG5kK2oYyE5k82iJq/JnOhmTbgS0lArT00FfWueieN5285ntZDPyMeGqv1vOU2UUlOGX/0CtmbLJTxdYBLICyLMYCSJTn8SdFhpq5XptMAeR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711530873; c=relaxed/simple;
	bh=oxVwts31AynSAqvIvFdaJ3BN9dSR3M2c799N6+9XayE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nVqskXgvvGlhpYHSJF7I5wF6qE2vpoLybbKmZtxtaTE0HleNFctC1V6bW8hzoPcaqi6BelsAbOf8VNLalIsET1Wbc905UCfWdCMtV7LTSK/02QRRPmcig2KbQ8n9lWoCmjmKSMQAAm3TuSEio8eEK+EsM1R+g1kNpPtjrr6JEUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m5ONv8iC; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6e740fff1d8so4681643b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 02:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711530870; x=1712135670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zPk9OMXL2EDAJPzRk28eQ8ffeZSU9ou0GuU/yWTRHW0=;
        b=m5ONv8iCXEjJVkvByldej/oDeJ+69Bt+cW+NK7Urwn15/mFsrMjz14BbiMACA/VQko
         +GFTXc/sd8qcSVGEjm/KwXjNbZwzBsYifjHFz4HAaqevk+OL93zhpVo3YHQCRqEQ7BhT
         YWSyaJUBUqmBtnR4ouYix/GopR+UCeAcDvsuyxJ1RRO1tNcBsau5UDeWm6qTOrNb3gbC
         e5jwX5r7S6aY70V0JQT7QEggCZtGsDSBdl2QrVN6GIYuLi1Y5+saQ4FmsTGOaOFqMt1t
         kND50uJ6DgByPb3WoPBV56Fk1LM5LrAFgR7oyEEmabkjN0+t+BkLEr1l0u0Brn2+0F5Q
         e1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711530870; x=1712135670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zPk9OMXL2EDAJPzRk28eQ8ffeZSU9ou0GuU/yWTRHW0=;
        b=wF2W7kFdB6JAQhKiUwyKjvAT7PPPAYdiuZMMZDVAd3rweL1pfmvrca6eFgO8ysYzHI
         9FFhBsHaCwD3g4UKV10/x+6yZSml6nh/zeP5YuCzcnYHiwH1IsKXwhpdlKhr/xsd1A8G
         +s+iBK5/at1VAm2C2XSJir15N3aUoQFDNnpw0faVszHPAVandWPjnUaSFDrMI83tDbgx
         bH8u576t9DBz7w+m/Q3nG4G+LSCevlVFz1wD/xoyL6wQtW5QPLhBYJ6dm+weCyA3kDy8
         lEcurYOmsMxVic7wyPZfuzxIGieLwpJThRdEieQxqBQiziC0rgo5qXGldJe475gkQMdM
         Bemg==
X-Forwarded-Encrypted: i=1; AJvYcCXtPJA1Tkm8Y+qTU7iS/CSLaG39xVcW2NrphGol5DzZrPGZeblYr1t6Lvg98lu/eHuzIM6zKoiys7+r7VTUyWidzIDldj3g5Cnw4ueACA==
X-Gm-Message-State: AOJu0Yxw9deDJ7IpZrSUmS7YPW76bqETI2tFBaug4/YRVIYtzi6LG/+H
	3tZqhQfLTyJ4hHP5JPKvJu3UGsd+UMxAc6+1bYkROLN8vWv6kNOO9d12Apm9Dg==
X-Google-Smtp-Source: AGHT+IHUqTOBDCc0FzxMHZPzlvLHKFGoK7XVK6UdIi44MV6apc230jjA2Kps2spz4iW6N2fPM1JOFA==
X-Received: by 2002:aa7:888f:0:b0:6ea:ad01:357c with SMTP id z15-20020aa7888f000000b006eaad01357cmr2103804pfe.22.1711530870218;
        Wed, 27 Mar 2024 02:14:30 -0700 (PDT)
Received: from [127.0.1.1] ([120.60.52.77])
        by smtp.gmail.com with ESMTPSA id h190-20020a6383c7000000b005dc4fc80b21sm8673871pge.70.2024.03.27.02.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 02:14:29 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 27 Mar 2024 14:43:32 +0530
Subject: [PATCH v12 3/8] PCI: dwc: ep: Remove deinit() callback from struct
 dw_pcie_ep_ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-pci-dbi-rework-v12-3-082625472414@linaro.org>
References: <20240327-pci-dbi-rework-v12-0-082625472414@linaro.org>
In-Reply-To: <20240327-pci-dbi-rework-v12-0-082625472414@linaro.org>
To: Jingoo Han <jingoohan1@gmail.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Zhu <hongxing.zhu@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, 
 Roy Zang <roy.zang@nxp.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Srikanth Thokala <srikanth.thokala@intel.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 Niklas Cassel <cassel@kernel.org>, linux-arm-kernel@axis.com, 
 linux-rockchip@lists.infradead.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=4397;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=oxVwts31AynSAqvIvFdaJ3BN9dSR3M2c799N6+9XayE=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmA+NJyLax6YW3Dcb5Sh5QpLv875ecVd4pu/l86
 j0PZPCzgsaJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZgPjSQAKCRBVnxHm/pHO
 9XU1B/9zbXi+U6FRqviLhKGscc2BcpWXO/vZZZSbP1V8JFoZQnH13D+vsY4FHCsxxKSu06ZxXci
 Pur8uJij9gSzGzokzDgbR32/AAtNIxKbJmJgSp7Rm/DFAGPfOYbmm2CM1m8VXNgxphbS/ADHe2c
 k6+hszGUixD98daIPtNbm7G3Bo2O1PKrhUIRj5+kjN9Evl6Hr1b56Toj7oGZJbzedElT3HOKsa3
 Dw7LsKjusaL39VdWv2jKh2IgAZ2qC/VQCjZ7ub0J+yicfYWLIMdl4MPmlL+Ri/OUCJ8AzkGAmXp
 RJsivu+Qzbyuwo6MRmVdT54dAvHVgWmOq4iue+ylu5TEgsmZ
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

deinit() callback was solely introduced for the pcie-rcar-gen4 driver where
it is used to do platform specific resource deallocation. And this callback
is called right at the end of the dw_pcie_ep_exit() API. So it doesn't
matter whether it is called within or outside of dw_pcie_ep_exit() API.

So let's remove this callback and directly call rcar_gen4_pcie_ep_deinit()
in pcie-rcar-gen4 driver to do resource deallocation after the completion
of dw_pcie_ep_exit() API in rcar_gen4_remove_dw_pcie_ep().

This simplifies the DWC layer.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Niklas Cassel <cassel@kernel.org>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c |  9 +--------
 drivers/pci/controller/dwc/pcie-designware.h    |  1 -
 drivers/pci/controller/dwc/pcie-rcar-gen4.c     | 14 ++++++++------
 3 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index dc63478f6910..f06598715412 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -637,9 +637,6 @@ void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
 			      epc->mem->window.page_size);
 
 	pci_epc_mem_exit(epc);
-
-	if (ep->ops->deinit)
-		ep->ops->deinit(ep);
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_exit);
 
@@ -844,7 +841,7 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 			       ep->page_size);
 	if (ret < 0) {
 		dev_err(dev, "Failed to initialize address space\n");
-		goto err_ep_deinit;
+		return ret;
 	}
 
 	ep->msi_mem = pci_epc_mem_alloc_addr(epc, &ep->msi_mem_phys,
@@ -881,10 +878,6 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 err_exit_epc_mem:
 	pci_epc_mem_exit(epc);
 
-err_ep_deinit:
-	if (ep->ops->deinit)
-		ep->ops->deinit(ep);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_init);
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 26dae4837462..ab7431a37209 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -333,7 +333,6 @@ struct dw_pcie_rp {
 struct dw_pcie_ep_ops {
 	void	(*pre_init)(struct dw_pcie_ep *ep);
 	void	(*init)(struct dw_pcie_ep *ep);
-	void	(*deinit)(struct dw_pcie_ep *ep);
 	int	(*raise_irq)(struct dw_pcie_ep *ep, u8 func_no,
 			     unsigned int type, u16 interrupt_num);
 	const struct pci_epc_features* (*get_features)(struct dw_pcie_ep *ep);
diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index 0be760ed420b..5d29c4cfe0a0 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -352,11 +352,8 @@ static void rcar_gen4_pcie_ep_init(struct dw_pcie_ep *ep)
 		dw_pcie_ep_reset_bar(pci, bar);
 }
 
-static void rcar_gen4_pcie_ep_deinit(struct dw_pcie_ep *ep)
+static void rcar_gen4_pcie_ep_deinit(struct rcar_gen4_pcie *rcar)
 {
-	struct dw_pcie *dw = to_dw_pcie_from_ep(ep);
-	struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
-
 	writel(0, rcar->base + PCIEDMAINTSTSEN);
 	rcar_gen4_pcie_common_deinit(rcar);
 }
@@ -410,7 +407,6 @@ static unsigned int rcar_gen4_pcie_ep_get_dbi2_offset(struct dw_pcie_ep *ep,
 static const struct dw_pcie_ep_ops pcie_ep_ops = {
 	.pre_init = rcar_gen4_pcie_ep_pre_init,
 	.init = rcar_gen4_pcie_ep_init,
-	.deinit = rcar_gen4_pcie_ep_deinit,
 	.raise_irq = rcar_gen4_pcie_ep_raise_irq,
 	.get_features = rcar_gen4_pcie_ep_get_features,
 	.get_dbi_offset = rcar_gen4_pcie_ep_get_dbi_offset,
@@ -420,18 +416,24 @@ static const struct dw_pcie_ep_ops pcie_ep_ops = {
 static int rcar_gen4_add_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
 {
 	struct dw_pcie_ep *ep = &rcar->dw.ep;
+	int ret;
 
 	if (!IS_ENABLED(CONFIG_PCIE_RCAR_GEN4_EP))
 		return -ENODEV;
 
 	ep->ops = &pcie_ep_ops;
 
-	return dw_pcie_ep_init(ep);
+	ret = dw_pcie_ep_init(ep);
+	if (ret)
+		rcar_gen4_pcie_ep_deinit(rcar);
+
+	return ret;
 }
 
 static void rcar_gen4_remove_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
 {
 	dw_pcie_ep_exit(&rcar->dw.ep);
+	rcar_gen4_pcie_ep_deinit(rcar);
 }
 
 /* Common */

-- 
2.25.1


