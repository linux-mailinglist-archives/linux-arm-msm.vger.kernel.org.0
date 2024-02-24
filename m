Return-Path: <linux-arm-msm+bounces-12443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1CE86230A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Feb 2024 07:55:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65C672813A1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Feb 2024 06:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 925A04C64;
	Sat, 24 Feb 2024 06:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZgaSv86P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E46611A
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Feb 2024 06:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708757693; cv=none; b=eWDBG6AQze+WfQG5fjOSKBQHF9Ot3Ysyb2Tfejasqr5fY9GuSwDhBBIvhaqRdtolEqw9WNn2/JUtHhJASs2VoXejPW2VDJTAOMdIM2aRQQQRFEIE/gT+tFsG9ln2xjtdQ8RPBrLCAQ0jxVlUewXhg5OQ18E6j5Z0sFrajlGcKrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708757693; c=relaxed/simple;
	bh=AMzVel+mzNPZDu5rNOshxFrNbNGmTb5cvr1qXK6YD5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hmcj0d4yDbOoZX0zZoN3/DrSBBCinX3xhgYyNdRIC1zRnrU4QUsOvyLCwFfkR/MQIYKRfBelZQXYaHYjYbMwqFt6wcEOVkDCyKrFu18gtHVkKhNRfPX6zGIJEtiPcP67AUHcx1cjw4vymzP+VavcpDjsHKlwOsz0eKvXnQK6I9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZgaSv86P; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6e4560664b5so1254851b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Feb 2024 22:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708757691; x=1709362491; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gm7BOWCebEzto6pQtqllLk3GIjiAQNALfrviMiZ/ywU=;
        b=ZgaSv86PWk6aIyq7gfcgteSTipIx3I9ArIokDljZZIfRe5HEYmCgPJONdOcmZL5TGv
         ys58ShzKhoQH6bQrsUbLdBAlyTTnL8zcsKUhfIXry7+H8WSTkYcTw0loi8n3YLNvSshf
         mqx+Kzj1h45QomKIF7QrG3hJFI3wPKmbs5RjFXjBE5Y50+mdSLNaOQFosKJIvzFnnhOB
         19UP7LO3NYA+lxhzKovY1LUbENjqOCu/Io18f1wiTzXZ4/W7wKKHfvy+//QoaG7O8Qpk
         n8YnVih7bso+h5F3Jev1qAhdkDfsWCZkD7bDZsoSM1wUjWrT4Luzqs1T6LesxkL7o46J
         tC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708757691; x=1709362491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gm7BOWCebEzto6pQtqllLk3GIjiAQNALfrviMiZ/ywU=;
        b=jnHGbPeS5paQ1IJqrhRU7GTEIARC2y6rjC4KIn7xeyqNBz/FGiw4hZ0ck606A1Ycow
         AOdLD9Kw13yUr0wWuKEoHeqJjkOZGiiuXWTU91edKGaM83Le0o0R1SDhguiKC/DnelJO
         zWEr16i7LmxYUcJN2TDPoH9lKIfp/z+kGNQj36OrzhV+SbSLz206GiKdQf95cqkGBOmf
         +FkMSLhJZk+SZBUFKOSIa24hMbGvhhkxuW3rqegeM9gLdR9AeqJLZEZtyjXR8Ug+jG52
         EZyErqR/JO+p96PkQJuXFiqYxGQkChbw3G/rc/Xdx+TkbzYotnU9sbPxonNLae2BehYi
         oSAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgqM9JIo2+Sk4bTJfebKFnMT/CBtCgHNyIdy33M4PgLbg+NXM+PxHdP5vnK+B2BeSCHJqKoZZZMHglpa4wJtVSbzgmvG0PpvABHqCc5A==
X-Gm-Message-State: AOJu0YyuV/qRHNPIHt/c/9IAdE4tMGdWZPn06x1Dgh/ARY4zLpj+RVEs
	skp572stpIB564IS+3+9NJVehjOK/qVTlMVlrikKTJK4/6VkUK9EmsgzhygSOg==
X-Google-Smtp-Source: AGHT+IHWxIkDhPJyduioril8hiji11X7d7va4hiErOPNmMZew2cA9RMTzz/cgWgTY7GV8ZXijlFlZQ==
X-Received: by 2002:a05:6a20:c995:b0:1a0:d04a:8485 with SMTP id gy21-20020a056a20c99500b001a0d04a8485mr2121214pzb.22.1708757691194;
        Fri, 23 Feb 2024 22:54:51 -0800 (PST)
Received: from [127.0.1.1] ([120.138.12.46])
        by smtp.gmail.com with ESMTPSA id r5-20020aa78b85000000b006e4cb7f4393sm502932pfd.165.2024.02.23.22.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 22:54:50 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Sat, 24 Feb 2024 12:24:09 +0530
Subject: [PATCH v8 03/10] PCI: dwc: ep: Introduce dw_pcie_ep_cleanup() API
 for drivers supporting PERST#
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240224-pci-dbi-rework-v8-3-64c7fd0cfe64@linaro.org>
References: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
In-Reply-To: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
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
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 Niklas Cassel <cassel@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3640;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=AMzVel+mzNPZDu5rNOshxFrNbNGmTb5cvr1qXK6YD5c=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl2ZKWN5s7yp9FVQGAuReNe7g8yseCdV9BNHSCP
 Zrav+1vZ/2JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZdmSlgAKCRBVnxHm/pHO
 9UFMB/9QN232kQi2reuocmy2tE//cMRFTozpfDoIA92osFCOoy0Cer23LiZEAcJeSGrpC5C49sC
 mgA1ZnNS7iSCH4PCISxuQiI86G73z/enEIpqSklDziO4mv0OyumLih98yNqum7HVp67XWtw3Vm9
 fGzA5s/htyFJnXZvvsTAIRUlBSyCkENUFLZZjR9X9iDCUeUWzWxKXHC+0E066ZOGDZdEuohlxNg
 TB5ZqF4hSHZaz18Uai4MAw0p+JFaIfZIfAcZwz67LBb5w4MFCIagUxuZfhWlQJ9M5tV6rpAzERJ
 tdNfrJDsEPY/efpFhDlwrXfYiKuRtY+jzlQqn6wXjmIuQe5/
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

For DWC glue drivers supporting PERST# (currently Qcom and Tegra194), some
of the DWC resources like eDMA should be cleaned up during the PERST#
assert time.

So let's introduce a dw_pcie_ep_cleanup() API that could be called by these
drivers to cleanup the DWC specific resources. Currently, it just removes
eDMA.

Reported-by: Niklas Cassel <cassel@kernel.org>
Closes: https://lore.kernel.org/linux-pci/ZWYmX8Y%2F7Q9WMxES@x1-carbon
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 11 +++++++++--
 drivers/pci/controller/dwc/pcie-designware.h    |  5 +++++
 drivers/pci/controller/dwc/pcie-qcom-ep.c       |  1 +
 drivers/pci/controller/dwc/pcie-tegra194.c      |  2 ++
 4 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 2b11290aab4c..1205bfba8310 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -564,12 +564,19 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
-void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
+void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
-	struct pci_epc *epc = ep->epc;
 
 	dw_pcie_edma_remove(pci);
+}
+EXPORT_SYMBOL_GPL(dw_pcie_ep_cleanup);
+
+void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
+{
+	struct pci_epc *epc = ep->epc;
+
+	dw_pcie_ep_cleanup(ep);
 
 	pci_epc_mem_free_addr(epc, ep->msi_mem_phys, ep->msi_mem,
 			      epc->mem->window.page_size);
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 61465203bb60..351d2fe3ea4d 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -672,6 +672,7 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep);
 int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep);
 void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep);
 void dw_pcie_ep_deinit(struct dw_pcie_ep *ep);
+void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep);
 int dw_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep, u8 func_no);
 int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
 			     u8 interrupt_num);
@@ -705,6 +706,10 @@ static inline void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
 {
 }
 
+static inline void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep)
+{
+}
+
 static inline int dw_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep, u8 func_no)
 {
 	return 0;
diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 36e5e80cd22f..59b1c0110288 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -507,6 +507,7 @@ static void qcom_pcie_perst_assert(struct dw_pcie *pci)
 		return;
 	}
 
+	dw_pcie_ep_cleanup(&pci->ep);
 	qcom_pcie_disable_resources(pcie_ep);
 	pcie_ep->link_status = QCOM_PCIE_EP_LINK_DISABLED;
 }
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 7afa9e9aabe2..68bfeed3429b 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1715,6 +1715,8 @@ static void pex_ep_event_pex_rst_assert(struct tegra_pcie_dw *pcie)
 	if (ret)
 		dev_err(pcie->dev, "Failed to go Detect state: %d\n", ret);
 
+	dw_pcie_ep_cleanup(&pcie->pci.ep);
+
 	reset_control_assert(pcie->core_rst);
 
 	tegra_pcie_disable_phy(pcie);

-- 
2.25.1


