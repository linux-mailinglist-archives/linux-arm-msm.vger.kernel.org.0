Return-Path: <linux-arm-msm+bounces-13233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B357A86FD36
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 10:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D75341C223C1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 09:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9921B22099;
	Mon,  4 Mar 2024 09:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OFh0BYgx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D8B21A0C
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Mar 2024 09:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709544190; cv=none; b=MFNCq1U5n8IhzIkwqSnb+Bg4ynjAziSXHL8HVa4soCuk5ixSSiujC6inkIjr05xV96Flh22STIvqzxTSXI87kQuVJdn2EzqM4b+V4W5RhXJGvLuTZO52f4gwt5o67+KEKY4H4ULXSraWnLPNvrLFE7JAPBkoHw6FEwVzQyO5A+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709544190; c=relaxed/simple;
	bh=g9mNmvK51fz68J5jozssdi6/0DjCS9JLFmd7JogEd4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sHJq5IsmbXDJEFr3H7J50cBXXETv704yre/0TmxIfE4bWonzZcaX4e7sknn5LlOUDAi7+guZ1izlBvhOA0hjtB66LJNU8JT0qPRnvGdTcpFkIxtC857BBP+baZIS05PN6sbee3YE8HQOOdNEJcy+k07pnqX0LtyDo4AIR8yI2aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OFh0BYgx; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d944e8f367so28122945ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Mar 2024 01:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709544188; x=1710148988; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kZnWb8d3C9Og59KtRq5XtOfAx+xAmaYSx4xuR1PV3YM=;
        b=OFh0BYgxR5TpPFLdYvGcbGncVkt3GCV8Ut2muGRhhjcnfidlLADvGxKY5iUQrnlHxs
         DiXL0T4nW2yvhoFexRfrUiPjBVZp7PYHViYmxCfXSsN5HQSkLdGRY9aMBdrHV8vq38Em
         qD1wm/R6EgU87AzgbPM/h0VuL2ceY9yi+6w0QU68r2YASca1xYmNgY37Y0UBRwq/Ijsy
         oA7no9x74cNvJ/GMSzmxM88kqtIpG+I8URgzNptVgvZn2YRAuKe4Fn8O7ybJI5Jto97+
         zTT6vvnaFokF8VbhdSDilaowdCfq/82fB4tVOO8Fa5ystj0T8thp13td0TozQIrmLq9e
         3jvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709544188; x=1710148988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kZnWb8d3C9Og59KtRq5XtOfAx+xAmaYSx4xuR1PV3YM=;
        b=guPDwYOcd8AEd6qasJoX9QRYjPbh4lgjyYaE+4wh00cF6YA5GJcCZAQM6RWO1oUXif
         FiAxeTIMTLWJArrhNjD8IzEe1h6CdAir9QX88fsF1+qnoBmkT6/ANCOvDgCq0SLa/tkC
         sPS4MMP8tQU7ObwW/An4bpv5b+owMk4By7yI31DQYqunTQJstiPXf4ygslHIFQRNQe+k
         KUM/pm9UPxS0RxUTKrJ4UxXuw33RWEG/BCxz4Ki2KEYzjk7f4yFuGXYe5Qox2FxV9zd0
         Q3YFlWf2GcvDU8ZndN5cNaSeW+s+mStAQwuof7WQnqooTneaI3B8pudmCk8Yd1rsRcN5
         BJTA==
X-Forwarded-Encrypted: i=1; AJvYcCWNexZHsCQri14N+iOkFqqkO/nROd4+YSzKaXL4PmsbqZ1h5ispfhrFSwgFvEaAaZdcDfHu7V75P2mDqLJBkUptF0i5EUPn5ks/UYJALw==
X-Gm-Message-State: AOJu0Yxcd0ORzW0uGFQJlED95u7FrI3iawRaUGnhQNT49AjJiGdZB9DR
	THj+goYVRr1EHwJ6EtFEks/tuke5QjuKlW6y7AEBxb15Qzj6+8h6tNLF7CMdWA==
X-Google-Smtp-Source: AGHT+IHadCZKDO8osCpF110ohJVMlzHI0kv3tjJxc8CaEETJeKyA9lQGvRZuMus+Vv0XnXpHiNbvhA==
X-Received: by 2002:a17:903:230f:b0:1dc:3ab7:cc78 with SMTP id d15-20020a170903230f00b001dc3ab7cc78mr10226033plh.29.1709544187965;
        Mon, 04 Mar 2024 01:23:07 -0800 (PST)
Received: from [127.0.1.1] ([117.202.187.165])
        by smtp.gmail.com with ESMTPSA id c5-20020a170902c1c500b001dbb06b6138sm7996648plc.252.2024.03.04.01.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 01:23:07 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 04 Mar 2024 14:52:14 +0530
Subject: [PATCH v9 02/10] PCI: dwc: ep: Rename dw_pcie_ep_exit() to
 dw_pcie_ep_deinit()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240304-pci-dbi-rework-v9-2-29d433d99cda@linaro.org>
References: <20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org>
In-Reply-To: <20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org>
To: Jingoo Han <jingoohan1@gmail.com>, 
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Vidya Sagar <vidyas@nvidia.com>, 
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
 Srikanth Thokala <srikanth.thokala@intel.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 Niklas Cassel <cassel@kernel.org>, linux-arm-kernel@axis.com, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2960;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=g9mNmvK51fz68J5jozssdi6/0DjCS9JLFmd7JogEd4g=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl5ZLXLJvwcaTA0KTIiIimACQMqOxY/E6kuxppM
 brQVyYuBSaJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZeWS1wAKCRBVnxHm/pHO
 9ZBmCACR44IY3tYba7u1CXyA0GkFEwPK5rfEAqNS+RMbvaQgu1eBEjBy7p6qV4aZbq+AXk31mP3
 hd/duOXibZWgwM4dASbi9vKug6dAA2zo87v7soROe6bTNLzhj1/0NhrY5aOIIw9Ncy3vyEJuY6V
 0UA7/7tNWcsch3hQeOluQb8K11fko+nM5rq4l3COPMBAdTpkmavtgoEvAZEkuHs/EOQOFqFzo+t
 MHAXyZQYcdwqQFHG2Ve4dxbksMkzUi6NLXAjBZOSKQEUWVNECwmhz9X3pNWuYCp8yTBydtXUmyM
 SjH94JeOXyPfiXAfCEi8WYvaMPxBF3Mh/rK7mq/AfA3JryTh
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

dw_pcie_ep_exit() API is undoing what the dw_pcie_ep_init() API has done
already (at least partly). But the API name dw_pcie_ep_exit() is not quite
reflecting that. So let's rename it to dw_pcie_ep_deinit() to make the
purpose of this API clear. This also aligns with the DWC host driver.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 4 ++--
 drivers/pci/controller/dwc/pcie-designware.h    | 4 ++--
 drivers/pci/controller/dwc/pcie-rcar-gen4.c     | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index d305f9b4cdfe..2b11290aab4c 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -564,7 +564,7 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
-void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
+void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct pci_epc *epc = ep->epc;
@@ -576,7 +576,7 @@ void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
 
 	pci_epc_mem_exit(epc);
 }
-EXPORT_SYMBOL_GPL(dw_pcie_ep_exit);
+EXPORT_SYMBOL_GPL(dw_pcie_ep_deinit);
 
 static unsigned int dw_pcie_ep_find_ext_capability(struct dw_pcie *pci, int cap)
 {
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index ab7431a37209..61465203bb60 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -671,7 +671,7 @@ void dw_pcie_ep_linkup(struct dw_pcie_ep *ep);
 int dw_pcie_ep_init(struct dw_pcie_ep *ep);
 int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep);
 void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep);
-void dw_pcie_ep_exit(struct dw_pcie_ep *ep);
+void dw_pcie_ep_deinit(struct dw_pcie_ep *ep);
 int dw_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep, u8 func_no);
 int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
 			     u8 interrupt_num);
@@ -701,7 +701,7 @@ static inline void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep)
 {
 }
 
-static inline void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
+static inline void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
 {
 }
 
diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index ac97d594ea47..9d9d22e367bb 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -430,7 +430,7 @@ static int rcar_gen4_add_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
 
 static void rcar_gen4_remove_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
 {
-	dw_pcie_ep_exit(&rcar->dw.ep);
+	dw_pcie_ep_deinit(&rcar->dw.ep);
 	rcar_gen4_pcie_ep_deinit(rcar);
 }
 

-- 
2.25.1


