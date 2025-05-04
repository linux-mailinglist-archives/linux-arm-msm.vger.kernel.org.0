Return-Path: <linux-arm-msm+bounces-56687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 598AEAA86D3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 16:46:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A1821897002
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 14:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EBE21DE4C3;
	Sun,  4 May 2025 14:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/F15RW6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7411D8E10;
	Sun,  4 May 2025 14:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746369946; cv=none; b=LMAoiq908rn3NI4crzZkZ3e2XwvXuLD2zqgXg7kXcCe8xDkKQwZRBU0n3e37cEsS6nsBgLyZAhwnstgS9emIIEDFsMG+cVP3EW7bhP9K53VQsfIad+buoq5td33u3p7lT3U+vj3WBOHQAQKK7NC25xn9LWF8yInpPrjINj0gMY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746369946; c=relaxed/simple;
	bh=aTojt8Dh7gclUi44xp/qnVu5croeoXM5gZOR4fhmKuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BcaTcT4OxDpPfW7HDa059d+eh+eyxDCYUlQu8PwpDK06HbxYKFNBPOXhvfwqb7Jep/cVyKfAfy9cVu8zV1ukEneGlF9zUtkNSgri17ujyJDodJylll2XvyMhqAhxZFHQ4x+Djm0TpeFzKLapG/1tEd1l2noATnac2cijga7p3QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/F15RW6; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5eb92df4fcbso6750619a12.0;
        Sun, 04 May 2025 07:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746369942; x=1746974742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2usqzIFp+F+sor9mgGvMP54EUED928aPFjm+huTcOyg=;
        b=e/F15RW65VocdvoSWoQ5f0hSszMjbs54GIdhMCf/r+NBC04RNYxN1OHUaeyDRQ0UHw
         cjGEUm9Whno37bzshvxSYfX+txsBwram0//5azr+GHZ0/FN3np+SYapKFkMWE6jyImNy
         yCnRhp4nOyBPuVkeZdIi5xcCe5nZYnfWDPGLsSNfJebQJZBTpAiN2vNq5aSMQN47r8kX
         047QcvTl/Cld+7bUc9bPvRojXKYsIc81/Et2B3dTrerpMHmEwDuKpObLOOqRgwStF7H3
         pUPAtI6Ymg+bTM0svtxVzdWcP1JlXeqi9v1/Pt1nrv3EOyaYLt4/G2kf2P/uGCkHx91X
         2vWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746369942; x=1746974742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2usqzIFp+F+sor9mgGvMP54EUED928aPFjm+huTcOyg=;
        b=gCn3tDqidjMxXSbRbyGANWFG8ldWHp5z3yqXa9YT1K/GPxSOYtHvudFscMYVGKkEua
         X0iTcz0kA0bOMZEBBSi67Enn0uJhKCuwiSAjt1gCHrPIKw8yyQqFx0C54BEkae2KBjg9
         28qpxPARANL2szNbwQ0/jp5oBTN2zy58APscZcmgRuXTn2YvYIBu2/yh3zc8LpoQMatn
         oM/BersjBJFeINAPTeC6Klhapdz9OC9mS2X/q+mU7xPghvkRTA2pG+AfBLXFsgcQOnwK
         wQLmg34aKzNCsj4J53hymxJ4zTYh5bPSnQ6aVH1+JQAFV4ePJPmCc/LVEakG/SghQYvi
         NpaA==
X-Forwarded-Encrypted: i=1; AJvYcCUNnfUpUMj7i0oiq3PayuOzs+qRxkJ0xUr+Rnv1uwgsxDj9X1uLU6VlapjtCTJ2rrfYbIiDOfLeOerKeODR7w==@vger.kernel.org, AJvYcCUeKMaSQlavgBsYsIXRGRlutniZBR/DK/QL6yIscJJSnZHprdTnqNSCjlWByzNy+1epP49P45N/1DBcqpHa@vger.kernel.org, AJvYcCVCiNDMiOYusro5sITovtsSC1ZMO7xTfNe6x+g2wgT8boySRal3iFOl/Kdsyl8gtMBH6zy4Oimhdnd3tBpc4lvb1eg=@vger.kernel.org, AJvYcCWPr6kUUNDEcD0GZbKmCoG3Q8RLrxCaqVhJdPZjJW0Tr/tSpgTIY7Pnku/6GdlS7KqS4MEkA+4xZNCI@vger.kernel.org
X-Gm-Message-State: AOJu0YyQwRK2kYFzN+yGJ8DdKUklaZ/i9+lrVq5dwht5vsSKFqTu2UjD
	R4Xi7LQNyitujD7LTtmWyx25xUr2Q+b8UWDDW2QiQwsXD1vWkEVU
X-Gm-Gg: ASbGncv0c5li6MPpN1ouSjyDVqIW6kpPIXlTQyS+KA+ZUyTjiBxTSPnx/8fWisVGTjO
	hsy4qvZewX5M5mlGHsIFfhrZ+Jd+8r6nkqztABsYEBhSeTaZ2Zl/heUVofO3xCr9gTcaVf9n0Z/
	dpeIzX2XvFXz6crsS7usQal7WJQwcxAcE7y6f6Goh+Kj3t6a6YH2+F0VtRy9RJPajlfSGwiqlNl
	0j7pv0xmVdnJY8M7Bh7xtn4T8eCNdIrhRzQc1tbxxYH3T7GvPLvAW6Nvd+/fOnVlIjmdXsQQOCl
	FburvN3Tl5yzqhy+o3UVpce3CUF73G/JjZJiVyP35h4Gn6dPBvAr3bdEqz5kzPaXFh4xU0MDHGH
	j69CvxFI8impfydwS
X-Google-Smtp-Source: AGHT+IFTIP5CBFY93DSwyT3Ei3OKqLDWTnScVRZxdsvibHCNV0wkkQGod1vGXCLNf31UK3SVtHlNWg==
X-Received: by 2002:a05:6402:4408:b0:5f8:d6b1:c3f8 with SMTP id 4fb4d7f45d1cf-5fab05763b1mr3722707a12.8.1746369942217;
        Sun, 04 May 2025 07:45:42 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5faecf59d31sm1147258a12.77.2025.05.04.07.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 07:45:41 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-phy@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 03/10] phy: move phy-qcom-snps-eusb2 out of its vendor sub-directory
Date: Sun,  4 May 2025 17:45:20 +0300
Message-ID: <20250504144527.1723980-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250504144527.1723980-1-ivo.ivanov.ivanov1@gmail.com>
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


