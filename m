Return-Path: <linux-arm-msm+bounces-54113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C493CA86F69
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 22:27:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E19DF17F371
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Apr 2025 20:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDC9D22A4F1;
	Sat, 12 Apr 2025 20:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gH0wqI+H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41AE224B05;
	Sat, 12 Apr 2025 20:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744489623; cv=none; b=Ps9b+qdaEba+wlHdff1gL9M2/qyPNo/2PebcvlTgJT+qs6x95adAoFk+20JWPUgvhNKEwg1B+iBQ66+41tBO1rw8rNxnjMZ+OfWoWdHvAhykdXdX6Rf7RRimmi2VKqFS0UhJpA4qJGVwz0vs2NAtMkRtyCUHrzqGLqDoAhlnUus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744489623; c=relaxed/simple;
	bh=aTojt8Dh7gclUi44xp/qnVu5croeoXM5gZOR4fhmKuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m5mU5m8g4fM6VnoLBbPuX7VyR0rzXpS34hQ0rt/kskfurkND5roOxCqrVnB6hQuxpWlH7egMFYE3bwWiyJgzL7yRVy8rmDRH2ul/NIYq7kM6X33n6ojggV2IJts8usYX8W9UlLlHTzJSATIXeNliBwTVwfpF5+mS2yhvirTAzs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gH0wqI+H; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf257158fso22207815e9.2;
        Sat, 12 Apr 2025 13:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744489620; x=1745094420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2usqzIFp+F+sor9mgGvMP54EUED928aPFjm+huTcOyg=;
        b=gH0wqI+H5U8AqzOobtjDYSkvq/KGGQLy9A5hoBmFxhsUDSttJW1IwXEI3B6VOhtlXh
         mM3w3Bst8orU1Vp9IsSXjzfGltZs7sB7plZWaNJkOTL1sG4vVYdlnEm+upvcoGftT7hS
         55RZWKFW0ZltpFjDxLHRrxIwS8PQE+k2cTVcag7tuGIElwsSGCHTVudpDF9md7mc3QuC
         wMeLlBiMPGRdHvVU2FI+lEMIgGVCnL1nnZnbDNs+6cFA+ROGI1jgNsKPCXyAX3VxrhiV
         tN6W1BTI7LyqjDGgl6JEDK55jiYgBXZtotxk19ii+aoCGH7v0yoQtqiaTV7OQtjrL/bq
         U+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744489620; x=1745094420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2usqzIFp+F+sor9mgGvMP54EUED928aPFjm+huTcOyg=;
        b=H+4I8i9vi7vUSDSBKFhuC2ZPGddejl5cjbv1daSp/8otveaeIUA6N/X4oY14E35ZJR
         qaW2yxMuWUQzh9iqHjLVi69/a0qJv23FYmj2EdAcnIBUC+oecUZIeWoF8WIYntdAxaI6
         6l0Obs8halHZH2+tvCGUFDZha5l1rZO6aAPnVQ1x9AJ/v/EyDkwdmf7ijCtPcjH98FSx
         qW+GZLI7fpdaelzQxigCNc7FhpnAtwOxTeerZfR+mz7/zll60cT+SyytGfwBiUhOkFXH
         pGpefGJracG71OdnJdPc/Do21DxFSPbcLiP0/SyA8wdwInq7ShoBopxuK6BNFxJ+r2Gf
         LqFg==
X-Forwarded-Encrypted: i=1; AJvYcCUjEZJ6+1wZ9Hj+kJTC4DN8Cy5b2z/xNFg21de92SymYpetxJxrsbURXpkx0tMJPBZOvKTArUwhGKi0p09bhQ==@vger.kernel.org, AJvYcCUndabWacIRESwUsLxi+Dg/UfIie1frkDMISuNJHh5o1pP4/pem3KDYS37D190Pp0gqAe7QWRMGkIu4@vger.kernel.org, AJvYcCVDL4uu8IbYsitS6fVIHsS9Xu0Bw17aLgQPpkEbSfg8+drV8KAlJCYmbUAYgvzk5dALOTm5H/Zt6Y+2e2tj@vger.kernel.org
X-Gm-Message-State: AOJu0YxAzh47wh5Gaaw8zEYrzosjaU5c7J9EFy8pfGed1PxPb+F3Ya3Y
	hUakK+N1T6pdYeBsoJJLpprjuxYLPY9lcgzG8fj6OWQHE1s1u6/m
X-Gm-Gg: ASbGncur0/FbWUj3nMlwE36vb3HxKud+XhTx+vd7NFw86zKGflTJRKxDYQsjg4BE/5H
	XBa4nWNiik3PbbJE1VEtxRjnkgG6iwIajMA3DCCMAeMO1TaCSdU1WWsr9S/l6Woh3mgukEaIMsx
	oEwiPnNsSw+IGbBhGnj4FZ8K0dRAzRzDOhunHbVt5alVLRFEBy2srnZ9WgJiYiqLF4ZKNo2GQ3h
	LeN8l+qU+bsQoMglrOUoSX7JqpZOGMCgwL0zq6lO9Mw6PAgs1YdRMhr6Kiy7C0yymlsjwSS0CsE
	UVgKqBi6eDQqkZTjWj/jlVPlCFWt3VN4xXcKWcLp0iCpdz8Zfk1Zm+85pl2dNcddm0/eJlfHkNU
	fUyBUsJc8hQDTmZet
X-Google-Smtp-Source: AGHT+IEah7+QhHhcMI502D3K184AdzgML6oZ4zalt7NAyqUNE6otZecWQFpnPiMPSdxHbSRclrEr4g==
X-Received: by 2002:a05:600c:5107:b0:43d:4e9:27ff with SMTP id 5b1f17b1804b1-43f3a925477mr59707825e9.7.1744489619878;
        Sat, 12 Apr 2025 13:26:59 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2338d802sm131797845e9.1.2025.04.12.13.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 13:26:59 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 03/10] phy: move phy-qcom-snps-eusb2 out of its vendor sub-directory
Date: Sat, 12 Apr 2025 23:26:13 +0300
Message-ID: <20250412202620.738150-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250412202620.738150-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250412202620.738150-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As not only Qualcomm, but also Samsung is using the Synopsys eUSB2 IP
(albeit with a different register layout) in their newer SoCs, move the
driver out of its vendor sub-directory and rename it to phy-snps-eusb2.

Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/Kconfig                                      | 8 ++++++++
 drivers/phy/Makefile                                     | 1 +
 .../{qualcomm/phy-qcom-snps-eusb2.c => phy-snps-eusb2.c} | 0
 drivers/phy/qualcomm/Kconfig                             | 9 ---------
 drivers/phy/qualcomm/Makefile                            | 1 -
 5 files changed, 9 insertions(+), 10 deletions(-)
 rename drivers/phy/{qualcomm/phy-qcom-snps-eusb2.c => phy-snps-eusb2.c} (100%)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 8d58efe99..11c166204 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -43,6 +43,14 @@ config PHY_PISTACHIO_USB
 	help
 	  Enable this to support the USB2.0 PHY on the IMG Pistachio SoC.
 
+config PHY_SNPS_EUSB2
+	tristate "SNPS eUSB2 PHY Driver"
+	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	select GENERIC_PHY
+	help
+	  Enable support for the USB high-speed SNPS eUSB2 phy on select
+	  SoCs. The PHY is usually paired with a Synopsys DWC3 USB controller.
+
 config PHY_XGENE
 	tristate "APM X-Gene 15Gbps PHY support"
 	depends on HAS_IOMEM && OF && (ARCH_XGENE || COMPILE_TEST)
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index e281442ac..c670a8dac 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_PHY_CAN_TRANSCEIVER)	+= phy-can-transceiver.o
 obj-$(CONFIG_PHY_LPC18XX_USB_OTG)	+= phy-lpc18xx-usb-otg.o
 obj-$(CONFIG_PHY_XGENE)			+= phy-xgene.o
 obj-$(CONFIG_PHY_PISTACHIO_USB)		+= phy-pistachio-usb.o
+obj-$(CONFIG_PHY_SNPS_EUSB2)		+= phy-snps-eusb2.o
 obj-$(CONFIG_USB_LGM_PHY)		+= phy-lgm-usb.o
 obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
 obj-$(CONFIG_PHY_NXP_PTN3222)		+= phy-nxp-ptn3222.o
diff --git a/drivers/phy/qualcomm/phy-qcom-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
similarity index 100%
rename from drivers/phy/qualcomm/phy-qcom-snps-eusb2.c
rename to drivers/phy/phy-snps-eusb2.c
diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index c1e0a11dd..ef14f4e33 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -125,15 +125,6 @@ config PHY_QCOM_QUSB2
 	  PHY which is usually paired with either the ChipIdea or Synopsys DWC3
 	  USB IPs on MSM SOCs.
 
-config PHY_QCOM_SNPS_EUSB2
-	tristate "Qualcomm SNPS eUSB2 PHY Driver"
-	depends on OF && (ARCH_QCOM || COMPILE_TEST)
-	select GENERIC_PHY
-	help
-	  Enable support for the USB high-speed SNPS eUSB2 phy on Qualcomm
-	  chipsets. The PHY is paired with a Synopsys DWC3 USB controller
-	  on Qualcomm SOCs.
-
 config PHY_QCOM_EUSB2_REPEATER
 	tristate "Qualcomm SNPS eUSB2 Repeater Driver"
 	depends on OF && (ARCH_QCOM || COMPILE_TEST)
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index 42038bc30..3851e28a2 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -15,7 +15,6 @@ obj-$(CONFIG_PHY_QCOM_QMP_USB)		+= phy-qcom-qmp-usb.o
 obj-$(CONFIG_PHY_QCOM_QMP_USB_LEGACY)	+= phy-qcom-qmp-usb-legacy.o
 
 obj-$(CONFIG_PHY_QCOM_QUSB2)		+= phy-qcom-qusb2.o
-obj-$(CONFIG_PHY_QCOM_SNPS_EUSB2)	+= phy-qcom-snps-eusb2.o
 obj-$(CONFIG_PHY_QCOM_EUSB2_REPEATER)	+= phy-qcom-eusb2-repeater.o
 obj-$(CONFIG_PHY_QCOM_UNIPHY_PCIE_28LP)	+= phy-qcom-uniphy-pcie-28lp.o
 obj-$(CONFIG_PHY_QCOM_USB_HS) 		+= phy-qcom-usb-hs.o
-- 
2.43.0


