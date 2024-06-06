Return-Path: <linux-arm-msm+bounces-21862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D458FDFB0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 09:28:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1301A1C21B28
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 07:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E60C613CABA;
	Thu,  6 Jun 2024 07:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JG299hie"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB6713D242
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 07:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717658882; cv=none; b=pq7ZF2UlkvkB+1wYGa3xjl5L3nSwx3M2VHSqf2UIjZqTECPfGuuOIcRs1gVSP//OjaVekcIBjXcHks0g4DIfZID7Ph9/h7OHgOjBS7q5obUD9y+JJcT+HVwJVI7pyiWMYtKNImf7esGAfT5hdENpdqOHCuuJNF/o1ubTIHlJxxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717658882; c=relaxed/simple;
	bh=iTBLcuvewMpJ4faEaIFRB8NCV5eK2XvDog669bY6A04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MpYXt6cv0ObIgB/l/EZ+0aweXBNCZUpBAeBdH/TAHplKbT67/Z0JtLfcIJ580kw6LJT0zo+lDlAl2js0CBrezkd9w4OMOvbWmqjD609keHzC3xjG1eTpTagBiksWJZbGRTIbqfJGsJE3V4mKH3KFx/0irEJMDiA9OacOFlEtJ70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JG299hie; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-652fd0bb5e6so508500a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 00:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717658880; x=1718263680; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HPG+iYxST5I5DbJlxvzuCXfj8r8tlsuRAuVmKBt4I54=;
        b=JG299hiersRJmlMIlWaBGTlVNIzV0EWX2O/tXePH7FUUT+pXdYT0jQYYL+rWUW1wYn
         UfYawvH39ftOPgXSILc8y7MLfUmbJPYj1A2fcJsYNLjrkW90HTH6opOwqCqLOVQ6fFg9
         5TgSfhQcthIlPAtrB1/GKIOrO73LXzkR9BJkpZNzfLBqpXdMfxgbztpq6/Mv2uh3KOH0
         YcRwLDtWpnJx8cQYB0LwxuUdMsuKj0U6VYTl1gZs3J9tAKEFeTkiWfKpWKxwDA95gb9q
         HCuMqJy5tT1GvafFZZ0Zxpe1mvV8nzx8RTRfoUrEQp9iAXtGTZQO1CTApeK5ZYlKYMMW
         tTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717658880; x=1718263680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HPG+iYxST5I5DbJlxvzuCXfj8r8tlsuRAuVmKBt4I54=;
        b=YjY6y1mMMUsMVmH7CEVSoFdxLy7I7nyHAsT1HIg5hvsskxgvVgEwBST6PkX03uhRVT
         wIM0MFV6jtVnRrQZkYAn3qtcuJt5l3XSDlpZ/Kh+1xww1Pv1PdJcFCzdZTmbAg+gMUx+
         S5eHtaUjh4NiQjvCt2iwWVxCxbkAo3JDTpEXAJ2XGNo6mP93gn1PzTui1m7Qoc1WG2TN
         qPjXlkq4ySSjLTGQD3xoYEXfh1kcOVLffR7BGi8WHoL3obBWoQsqkt9pInN5FpSPJA5y
         jA/fX9YYbEjD9obkaXQNLL2YN66RT46WMxV+bCHZdsDLfQHngL3aUHoabVS+sLvCFgs1
         4wIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW83/6mYfXY0uC7PatOXuTj5205xbQJ5SMz2ksJoseplwGl3UHGWpnHmZEWx9/N6fH72go0kvktHROBrfmUOqDLbQodbzztVYFFWs4ABQ==
X-Gm-Message-State: AOJu0YxvHlqzNDxjXEMhQNKuRmfwxfggZZrgaLb92QWn1qbvvDa/peFV
	AOLG73zBvQPNeztqngTQnnAdXWQfkc/BGLGm/7JtMYYPoGVx/qGSW8K4fhB2BQ==
X-Google-Smtp-Source: AGHT+IFcf9cgtatPK4aegB5pOtXP/U3r7+aHmKSySRB4gcmnkYTJLzQC9N/nujSZyq7rntRegQ9fyQ==
X-Received: by 2002:a05:6a21:9994:b0:1b2:2893:4c30 with SMTP id adf61e73a8af0-1b2b75a28b6mr5554701637.43.1717658880331;
        Thu, 06 Jun 2024 00:28:00 -0700 (PDT)
Received: from [127.0.1.1] ([120.60.142.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-703fd494feasm566621b3a.100.2024.06.06.00.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 00:27:59 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 06 Jun 2024 12:56:38 +0530
Subject: [PATCH 5/5] PCI: layerscape-ep: Use the generic
 dw_pcie_ep_linkdown() API to handle Link Down event
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-pci-deinit-v1-5-4395534520dc@linaro.org>
References: <20240606-pci-deinit-v1-0-4395534520dc@linaro.org>
In-Reply-To: <20240606-pci-deinit-v1-0-4395534520dc@linaro.org>
To: Vignesh Raghavendra <vigneshr@ti.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Minghuan Lian <minghuan.Lian@nxp.com>, 
 Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, Jingoo Han <jingoohan1@gmail.com>, 
 Srikanth Thokala <srikanth.thokala@intel.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
 linux-arm-kernel@axis.com, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org, 
 mhi@lists.linux.dev, Niklas Cassel <cassel@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Bjorn Helgaas <helgaas@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1130;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=iTBLcuvewMpJ4faEaIFRB8NCV5eK2XvDog669bY6A04=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmYWTDAWlDlC+iP821vFRRCpXr79KN0oimjGpwM
 9zYQuHhq6WJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZmFkwwAKCRBVnxHm/pHO
 9dUvB/4geNbdfN8AuZaua5Q6crO4wiBZbDIZpTUEWbj5cD3+PQgZdP2fszAcOMysVUd2LhEzvbX
 kN7XJZcOGcc8d4i5IFEjwKG/dbhVt/tdxFru22kORqs05rEFn8+aFrQwhtSGaYkYgqYgRfP5Y6W
 b7v2+d152TaxfMTEdc5KIpJ3NjqVYBYvg2Gm5ndnVM2TIBPLBmyqzyiXOFEURUukShXcXr+j5P5
 wTPHtr9arU74ONCvNRavuhdpDxwvIoRgVqCiA2vDPG5DViOV2w7sRHoLC0PIvLJstIr0Gh5lZUc
 0TbWhXew/SfM3kcXGjBTL99FKexWWdBkpH4rAOvlZ4HUiEBN
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Now that the API is available, let's make use of it. It also handles the
reinitialization of DWC non-sticky registers in addition to sending the
notification to EPF drivers.

Reported-by: Bjorn Helgaas <helgaas@kernel.org>
Closes: https://lore.kernel.org/linux-pci/20240528195539.GA458945@bhelgaas/
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pci-layerscape-ep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index 35bb481564c7..a4a800699f89 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -104,7 +104,7 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
 		dev_dbg(pci->dev, "Link up\n");
 	} else if (val & PEX_PF0_PME_MES_DR_LDD) {
 		dev_dbg(pci->dev, "Link down\n");
-		pci_epc_linkdown(pci->ep.epc);
+		dw_pcie_ep_linkdown(&pci->ep);
 	} else if (val & PEX_PF0_PME_MES_DR_HRD) {
 		dev_dbg(pci->dev, "Hot reset\n");
 	}

-- 
2.25.1


