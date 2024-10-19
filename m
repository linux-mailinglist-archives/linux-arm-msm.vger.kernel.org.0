Return-Path: <linux-arm-msm+bounces-35121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B11F09A4F69
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 17:46:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4FB9B26D90
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 15:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E274191F60;
	Sat, 19 Oct 2024 15:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EY9DDAYq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1703E191494
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Oct 2024 15:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729352710; cv=none; b=CKfaSY+blWVqSadFMA0g+xzVXaS2C8P3D6cl6OCOjkg4gjf2qj3qQEfP5LWZ9LLNborTqkZmL0vIyYCA8Vx9qi/n98HIe4t22GoF/rfIFIfSjzkGPfdcKj+gBaCzySu6z/5UCw/l3zm0dYYRGNwxakndWo9jC6FqgQ99hJjExBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729352710; c=relaxed/simple;
	bh=W4/vDRwVV7Of/fJJlqT46Dx7PzvQidb+t0kRpal68/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bQPeI9NWxkK+qY0CcAS0WQl7gkgv6QroyiGD00yx5b6aMDRB36wbsKM9hwxlMm5B5/cihdqmS+MSruO1K4e8LK5/K+pnzw+oL5HjVz2TNNLoq5tWpwePAw6Uaip5H3F2smQz1ux/ULg5OcTU03N0cT6kcoaG6Am1aLaD9BMvrZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EY9DDAYq; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539e5c15fd3so2836647e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Oct 2024 08:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729352706; x=1729957506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a2eyUP7PqA7x+pyAdp03ksII8x7mpw580zNqO7054tI=;
        b=EY9DDAYqnkMjsxkqCvH5YE2hWdIAvZ6uWG0Nitqf8/I8fGaGICfiTl61l4zTCMJaNW
         P4brp5BMBoHR3hYeibl6LEcNvigLDB4R9QeZeY6N5I2dO7IlVWOeuxu0whDngbc/568/
         l7mG2NYwIZfHPkUHiW/RmAFt8iKXsXavINpofYzR4bXEoDYWUENncksMlKoU8XOXd189
         d80Xi3h9Gl0Mhr4SbjlNcg4inh0Hs/hB98B4Lc34kanTLDiEEsE5VMdp8cholmobeF78
         y/qoM05Zpjtr9BNEPTyFZYsND09NYXiWTHfkcfTueCsDTDTPvI7+cfrTmJHH+z9N7zac
         ksPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729352706; x=1729957506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a2eyUP7PqA7x+pyAdp03ksII8x7mpw580zNqO7054tI=;
        b=lDb+r0vXkjZwP7h8Vyu82Zdt/Y4qAfT0hanIBTnEtwSYWNuQo8xYaMeaa7vRzWYYJ5
         mF1xGR0QDrzgcqmKB5eWxhmMFAzeAxcGZZBhR0zGpE/hTrHzAieCpg5z/F532rnurZ+V
         8iLhoVXlas26T+rrvr+HtHPIzSwR8ThlDciRSx37MREVmeWD/vATot1GoZMnm/a7CRpF
         IGvJ90NEmXPZ1wQFzgNLR1yE4mP1tVuNXfRfeo20uhXjaS1bGzS6wg8yGeN1cVpfRqY+
         CIit/ah/zU8IzbAImBCR/+z/v+WXf2PC0MpvbS+aC3pvsoZJYd/cUBcl4en6hKuMXpJ3
         fOlA==
X-Gm-Message-State: AOJu0YyhBZXFDZ+JVNtM9/V3vyhRUKLRfan/b630Z1LFAuzIbTKewfUB
	sFXziY/vIE/S41mRY/1+77H2jyF+LKYnm007rnSrixbQNfSaqdufYRx5VMD6nbBhLv/MJwrtRNU
	/3J8=
X-Google-Smtp-Source: AGHT+IHYkxaqVw5cjcGpwc15iXsqxdS1REG0bROkgUTWFdJwNDtdPJFkX67nBhyMkA+cVatBoV0POQ==
X-Received: by 2002:a05:6512:3d23:b0:539:e5e9:2159 with SMTP id 2adb3069b0e04-53a1522a8d6mr3648948e87.31.1729352705832;
        Sat, 19 Oct 2024 08:45:05 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a15211401sm562854e87.249.2024.10.19.08.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 08:45:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 19 Oct 2024 18:44:54 +0300
Subject: [PATCH 5/6] phy: qualcomm: qmp-pcie: define several new registers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241019-sar2130p-phys-v1-5-bf06fcea2421@linaro.org>
References: <20241019-sar2130p-phys-v1-0-bf06fcea2421@linaro.org>
In-Reply-To: <20241019-sar2130p-phys-v1-0-bf06fcea2421@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2284;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=W4/vDRwVV7Of/fJJlqT46Dx7PzvQidb+t0kRpal68/c=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnE9P11KkGH2U3FfSVJk4GXFitZtpTXBBZzkDtV
 X5dZJTX5mKJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxPT9QAKCRAU23LtvoBl
 uNRiD/0ZwTFkuQxkkN7LyCCEOioAKMZH5mREhcnSqNdH9AXwgMFg458S24lOEL8+qMDN6Jw4hv3
 KGJVUkKe9RvHoV1+DH9EzeJ9a4g4dP4lOU1CB58hgyNSACs6p1zXGld2DgrBH+G5R+vyZf/G+t5
 nCE/cdQ5SMHDSqaOZvs/vgjOXDyN/DbMrv4kwO0mb+sUaoiIl7Fjlj8ZQdX0Jmyv2hy/NDxj3hL
 WZ2ptAkziXlieQiV31phKG2xzVx/HfF/fLSs9zWSU2Kh2bDK8BLMchFYQsPQwMw1w/12ccaiJxy
 RWTE0y4CCmWdcEZQtT7OSvRFEKxkzszAduFKp27P4Hk9J2ZtkqVKn1zQQzI7zurMmjTzMrwGKrt
 YMZP7xEhElvVBH4Ljlimcn/T2wVGYenE2AJnv2DJ+XTvpQghrSQsRJHLg/QXJPiwO5mxZHHnTU7
 f/HIaFev5UcegC5E7Zb55XBErHGJv4PWZXhA2QXcKZjIMIBHW1LfFzP1QFN9oomEhqmxM1wxMal
 aLh9GQhYd5RvoDV5jGhh/i9a4u7M8eP5gBYxsh9YJMKFpA3qLyyxJxlhcQ9EJ0RrbgKwb15lGs1
 AB+PPB/a8RHn4P4zR4EUQKZdrWYil77tDytAjuuQdVuAne6lWQ/MXx2dtei8qA+Au1EFlkJCJK6
 rENgrAGiegI9QXQ==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Define several registers to be used by PCIe QMP PHYs on v6 platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6.h     | 3 +++
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h          | 2 ++
 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h | 1 +
 3 files changed, 6 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6.h
index 0ca79333d94261610f7274968c96362dcfb1f354..45397cb3c0c6fd2cd989ddc600510589792a3b1a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6.h
@@ -14,4 +14,7 @@
 #define QPHY_PCIE_V6_PCS_PCIE_ENDPOINT_REFCLK_DRIVE	0x20
 #define QPHY_PCIE_V6_PCS_PCIE_OSC_DTCT_ACTIONS		0x94
 
+#define QPHY_PCIE_V6_PCS_LANE1_INSIG_SW_CTRL2		0x024
+#define QPHY_PCIE_V6_PCS_LANE1_INSIG_MX_CTRL2		0x028
+
 #endif
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h
index 08299d2b78f096fa5f9388a4d54ddfa85667b18c..aa5afb921f12c07e0648f69433a2e6e2fb756c07 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-v6.h
@@ -17,6 +17,8 @@
 #define QPHY_V6_PCS_LOCK_DETECT_CONFIG3		0x0cc
 #define QPHY_V6_PCS_LOCK_DETECT_CONFIG6		0x0d8
 #define QPHY_V6_PCS_REFGEN_REQ_CONFIG1		0x0dc
+#define QPHY_V6_PCS_G12S1_TXDEEMPH_M6DB		0x168
+#define QPHY_V6_PCS_G3S2_PRE_GAIN		0x170
 #define QPHY_V6_PCS_RX_SIGDET_LVL		0x188
 #define QPHY_V6_PCS_RCVR_DTCT_DLY_P1U2_L	0x190
 #define QPHY_V6_PCS_RCVR_DTCT_DLY_P1U2_H	0x194
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h
index 23ffcfae9efab4a9e081414f9b3bbd0079d34f18..f47fdc9cecda8c4fe46c83e6449d68c033cd7fe2 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h
@@ -6,6 +6,7 @@
 #ifndef QCOM_PHY_QMP_QSERDES_TXRX_USB_V6_H_
 #define QCOM_PHY_QMP_QSERDES_TXRX_USB_V6_H_
 
+#define QSERDES_V6_TX_BIST_MODE_LANENO				0x00
 #define QSERDES_V6_TX_CLKBUF_ENABLE				0x08
 #define QSERDES_V6_TX_TX_EMP_POST1_LVL				0x0c
 #define QSERDES_V6_TX_TX_DRV_LVL				0x14

-- 
2.39.5


