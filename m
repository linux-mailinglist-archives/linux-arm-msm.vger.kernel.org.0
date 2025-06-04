Return-Path: <linux-arm-msm+bounces-60217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5DCACDD87
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 14:09:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EB0D1894C39
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 12:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4C8E28ECE5;
	Wed,  4 Jun 2025 12:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DU3Ppkt2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D7D1E5B99
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 12:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749038929; cv=none; b=Fkib3rZ3iSBVmXDaVxHt38fs2qOaihWCQgxza6N71dcf/oFDA83AyAlI3J47V2A6tzrfxjHrEUBj0BoDnXTOVYtmla+AovNIvkKQSh3ovn45u8/N+RpLjC6bcaai+0N6r0rIHO5cuSeFeItw7JRl7VPFrEtNMu4JCUP6lxU1K8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749038929; c=relaxed/simple;
	bh=rGdN3v31aLv/PBCFA5XzjY0q5LLbpW30GxzwXF64bPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u/fb9OpPaseI55Q/NPcV27nDBv6i5bnq15Mnm3QnkW1HmVI7gcYylzyCFQ5uQfXvM+KafgSUaxJMMbfP/WlsvpVDI7KFVIi8YIIg1foCaRzRtdt220HIilV3KCt2tcAlduVaj1vKSTWYqcd6BBZ6O5q2i9Fo53Q1xA0vdnzIAqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DU3Ppkt2; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-747abb3cd0bso667340b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 05:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749038927; x=1749643727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjYBjKWJV5CqNiGs22RjLFcCVYroLCOBOVDwOAOK6GY=;
        b=DU3Ppkt2tYGUkO6u3xW4tbudYv5PhWyy1PYupqIxU4dvg1tkm16YiOU4riZ/hxB84n
         MSRW7sN9zTnfCF2ptUJoMLJ6X6r8R1/Xwg6kwiT9GIsyCMFtEWBdrnuTOVFqEZtskmFG
         sJKMzMfKzdHGoeh8vZPSdWNQjc2yREey0RGRCQM/MI8atp1z33pQRsC08OVkXHDlyua4
         6kM4uRjgcvXnsNnz2PyKElD9PnhPIdME3wHS4Nnfxj2jtVE54uxUDx351glDcaqU1Z1G
         M5EvMZcJel6wP7iparsKXc9LqXshbIeDrraKS/6nox3siuX+Kk9cp591wzamfXfNNaaX
         iE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749038927; x=1749643727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjYBjKWJV5CqNiGs22RjLFcCVYroLCOBOVDwOAOK6GY=;
        b=ptc+4cwB9B17zIRZxyH/UTCIiEUJmKBhtf3YmqIuVjFp++spkXTci8Pma2QsiDvYXy
         Si1Qj0Wu8xVt5OFwKgDJUib3r3U9dvki+er3HBqMVDT2/8tSkGf7YdKIieGhhGU0lrXS
         G4IwL+zp6OuGDoUErOOztHqBqw4Zk6+wRWTGAAMYU0m8aI21MJEqvqhkxVCrYyDWW+yb
         raa6O+RYZWrUyV9qqeLV5L2hQzBSsvPSoUvwZwmCyYPy19v662F2BzGhLZpo0R+GV+vT
         hM4oV4JScvc5R4n501KuExcr2vKHaw7s/Kk63ODX4FYKWbp+vB1pTZ/LRyXpR1SP0SCU
         cveQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaig2/Wips1f9lwC9/vSvF41uqipPuMq3iKSyHOsdJQByRr1FZN6tSHKZcgVJbrpffQs3JTwu26oZsJXq0@vger.kernel.org
X-Gm-Message-State: AOJu0YzqF43Pv2trET49Vx6NZ1CjPhLH+dOSmiyTp6fav0+FTlakzTA0
	pmU6ETjnknh/vtidK92fYKhw4oHE+inbT+2/g1Ri5nvaeJRDVaiU6TYNbq6cEvp2cYuae4uJyt5
	e4E8=
X-Gm-Gg: ASbGnctrHBIWrqbrxUN9J+Wi2uMPMaePfR37/uI2Tp4QZyPS9V+ZfMhhm8CoZWdCZHs
	jYx8Mx60IzlGK/r//zNLxEa87s+sE9y7wNeoOr7YeDfubwifNgajHcn/wXFfg4Uyfce86NHu0AA
	lh8PeT6QcjBDaqB6kz60zp+KOvT0h1+Jmm6HkAnYQGcRKx8pF/Fd1YEjR3nQ5swHnFMdb3nofGC
	51PhBhLjHuVfvEWQRMWHbbZDE3UZJzNLbowqVydMfz2J4zfq9HzFRtQcDaLMoxJHz5f4iA68Qwb
	gNxqokKp+j7FnA0RW0zp4F20X/XyP2vpxDIv6q8F2EHFzIsntF//9gfKXtlMLsQl
X-Google-Smtp-Source: AGHT+IEVOZmmV9E31mhCbC4YHgaliV2VnrEV1sOC49gAAGFgUHtXngMbCL1CKPL2LnQJ3qUWCxsoWw==
X-Received: by 2002:a05:6a21:1796:b0:21a:de8e:5c53 with SMTP id adf61e73a8af0-21d22716cbfmr4189624637.12.1749038927376;
        Wed, 04 Jun 2025 05:08:47 -0700 (PDT)
Received: from thinkpad.. ([120.60.60.253])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affafaebsm11034942b3a.87.2025.06.04.05.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 05:08:46 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: bhelgaas@google.com
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/2] MAINTAINERS: Update the e-mail address of Manivannan Sadhasivam
Date: Wed,  4 Jun 2025 17:38:30 +0530
Message-ID: <20250604120833.32791-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250604120833.32791-1-manivannan.sadhasivam@linaro.org>
References: <20250604120833.32791-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

My Linaro email is going to bounce soon, so switch to the kernel.org alias.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 MAINTAINERS | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 690e48c20fb5..f39b6fca3ab8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2102,7 +2102,7 @@ F:	arch/arm/plat-*/
 
 ARM/ACTIONS SEMI ARCHITECTURE
 M:	Andreas Färber <afaerber@suse.de>
-M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+M:	Manivannan Sadhasivam <mani@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-actions@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
@@ -2354,7 +2354,7 @@ F:	arch/arm/boot/dts/intel/axm/
 F:	arch/arm/mach-axxia/
 
 ARM/BITMAIN ARCHITECTURE
-M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+M:	Manivannan Sadhasivam <mani@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/arm/bitmain.yaml
@@ -3022,7 +3022,7 @@ F:	include/linux/soc/qcom/
 F:	include/soc/qcom/
 
 ARM/RDA MICRO ARCHITECTURE
-M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+M:	Manivannan Sadhasivam <mani@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-unisoc@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
@@ -3725,7 +3725,7 @@ F:	Documentation/admin-guide/aoe/
 F:	drivers/block/aoe/
 
 ATC260X PMIC MFD DRIVER
-M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+M:	Manivannan Sadhasivam <mani@kernel.org>
 M:	Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
 L:	linux-actions@lists.infradead.org
 S:	Maintained
@@ -6730,7 +6730,7 @@ S:	Orphan
 F:	drivers/mtd/nand/raw/denali*
 
 DESIGNWARE EDMA CORE IP DRIVER
-M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+M:	Manivannan Sadhasivam <mani@kernel.org>
 L:	dmaengine@vger.kernel.org
 S:	Maintained
 F:	drivers/dma/dw-edma/
@@ -8546,7 +8546,7 @@ S:	Maintained
 F:	drivers/edac/pnd2_edac.[ch]
 
 EDAC-QCOM
-M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+M:	Manivannan Sadhasivam <mani@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
 L:	linux-edac@vger.kernel.org
 S:	Maintained
@@ -14702,7 +14702,7 @@ F:	drivers/hid/hid-mcp2221.c
 
 MCP251XFD SPI-CAN NETWORK DRIVER
 M:	Marc Kleine-Budde <mkl@pengutronix.de>
-M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+M:	Manivannan Sadhasivam <mani@kernel.org>
 R:	Thomas Kopp <thomas.kopp@microchip.com>
 L:	linux-can@vger.kernel.org
 S:	Maintained
@@ -15849,7 +15849,7 @@ F:	arch/arm64/boot/dts/marvell/armada-3720-eDPU.dts
 F:	arch/arm64/boot/dts/marvell/armada-3720-uDPU.*
 
 MHI BUS
-M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+M:	Manivannan Sadhasivam <mani@kernel.org>
 L:	mhi@lists.linux.dev
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
@@ -18752,7 +18752,7 @@ F:	drivers/pci/controller/dwc/pci-exynos.c
 
 PCI DRIVER FOR SYNOPSYS DESIGNWARE
 M:	Jingoo Han <jingoohan1@gmail.com>
-M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+M:	Manivannan Sadhasivam <mani@kernel.org>
 L:	linux-pci@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/pci/snps,dw-pcie-ep.yaml
@@ -18787,7 +18787,7 @@ F:	Documentation/devicetree/bindings/pci/xilinx-versal-cpm.yaml
 F:	drivers/pci/controller/pcie-xilinx-cpm.c
 
 PCI ENDPOINT SUBSYSTEM
-M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+M:	Manivannan Sadhasivam <mani@kernel.org>
 M:	Krzysztof Wilczyński <kw@linux.com>
 R:	Kishon Vijay Abraham I <kishon@kernel.org>
 L:	linux-pci@vger.kernel.org
@@ -18840,7 +18840,7 @@ F:	drivers/pci/controller/pci-xgene-msi.c
 PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS
 M:	Lorenzo Pieralisi <lpieralisi@kernel.org>
 M:	Krzysztof Wilczyński <kw@linux.com>
-M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+M:	Manivannan Sadhasivam <mani@kernel.org>
 R:	Rob Herring <robh@kernel.org>
 L:	linux-pci@vger.kernel.org
 S:	Supported
@@ -18997,7 +18997,7 @@ F:	Documentation/devicetree/bindings/pci/microchip*
 F:	drivers/pci/controller/plda/*microchip*
 
 PCIE DRIVER FOR QUALCOMM MSM
-M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+M:	Manivannan Sadhasivam <mani@kernel.org>
 L:	linux-pci@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
@@ -19033,7 +19033,7 @@ F:	Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
 F:	drivers/pci/controller/plda/pcie-starfive.c
 
 PCIE ENDPOINT DRIVER FOR QUALCOMM
-M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+M:	Manivannan Sadhasivam <mani@kernel.org>
 L:	linux-pci@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
@@ -20154,7 +20154,7 @@ F:	drivers/iommu/arm/arm-smmu/arm-smmu-qcom*
 F:	drivers/iommu/msm_iommu*
 
 QUALCOMM IPC ROUTER (QRTR) DRIVER
-M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+M:	Manivannan Sadhasivam <mani@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	include/trace/events/qrtr.h
@@ -20162,7 +20162,7 @@ F:	include/uapi/linux/qrtr.h
 F:	net/qrtr/
 
 QUALCOMM IPCC MAILBOX DRIVER
-M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+M:	Manivannan Sadhasivam <mani@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
@@ -20196,7 +20196,7 @@ F:	Documentation/devicetree/bindings/media/qcom,*-iris.yaml
 F:	drivers/media/platform/qcom/iris/
 
 QUALCOMM NAND CONTROLLER DRIVER
-M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+M:	Manivannan Sadhasivam <mani@kernel.org>
 L:	linux-mtd@lists.infradead.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
@@ -22731,7 +22731,7 @@ F:	Documentation/devicetree/bindings/media/i2c/sony,imx283.yaml
 F:	drivers/media/i2c/imx283.c
 
 SONY IMX290 SENSOR DRIVER
-M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+M:	Manivannan Sadhasivam <mani@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -22740,7 +22740,7 @@ F:	drivers/media/i2c/imx290.c
 
 SONY IMX296 SENSOR DRIVER
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+M:	Manivannan Sadhasivam <mani@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -25041,7 +25041,7 @@ S:	Maintained
 F:	drivers/ufs/host/ufs-mediatek*
 
 UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER QUALCOMM HOOKS
-M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+M:	Manivannan Sadhasivam <mani@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
 L:	linux-scsi@vger.kernel.org
 S:	Maintained
-- 
2.43.0


