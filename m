Return-Path: <linux-arm-msm+bounces-20550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DAC8CFBE3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 10:44:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCC10B2089C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 08:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C638912FF9F;
	Mon, 27 May 2024 08:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="irTiWpHZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA0D13AD32
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 08:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716799370; cv=none; b=u0p9Lk1a0tYeUmNj/qX3aSaBzJXFUZMPc7FcwpezfRRBikiyHfaK4oOBdoqD51Rz4qMY0TLBozgLAFBT14FNwIxqamQIwTYyAdM7FEulXrf5AFGsQc/M4sMNhnrBfLr3DhRNnSpOxvFCcKKPriYftxJWq4rZ6DotSblwnM3JvBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716799370; c=relaxed/simple;
	bh=64NV6QzxOvpeyMBuyWNXD513V021rtwBykr1hxoHJD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KZr7+wmXQmtpC+QhtX6zlqaaO2IGoRj66rIPpjDZ3la5Y8Kdw/uR1WxbIjUUB27xGOZ3KaK9VM7/zKMcjngnM86kzRxp9oy/+mG9ep1dydBcPeynlzBPE6P28wZehHHwsQaw2zVEEDdA/8TFTahevbc61EScmtNmWx9qsAxg/1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=irTiWpHZ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-354c5b7fafaso5205793f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 01:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716799367; x=1717404167; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5fM2JQC49aLohuvAOQ03vLAtXJ7DuKlglKcrOA/6ES0=;
        b=irTiWpHZo85MG5fySWD6IeyPaqfcTifcxXITjO8wmB6xSDiNEFgFZo1gQFFCZZHyKK
         RvJfFPsyUH3cL92tHMe3qIQrIByOGtsL88rCaIwwDILojeOXvxDljeyY0arTGvgXXHLC
         mjj+veB9ARg0k44P3dkDjl0MfxBkIPm0EDzyafE8mqK8bbFQltanHWgTQ24isriaXgRI
         ++RvpF3Ep6Noit74UgVfw225S71a/iPApoOnhWYQ8NNa2F9XYrgktjkTaO53YmheaUoY
         Bgs7fjqPrgAyjObGxoibnbysL1GOOjZASUlNBipqlowDfMl9gA+6x+Kmgeovm0X/KAaR
         F/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716799367; x=1717404167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5fM2JQC49aLohuvAOQ03vLAtXJ7DuKlglKcrOA/6ES0=;
        b=PpXzxEGYgzRd7ZrbhXbnAv3a1JGBFUYPttiAQWttdXazerELAaMi+MLH0tKreiirCz
         LfipwkCKoTsZbL+XQCCC2HHTaCm3/ccXDB2PkJQM5Ob07ipjpF1d6OlhPfj5AL2+KXCZ
         hv9fhoMVSfHr4gA9nogyMDB94Eo+LZ3y52CsVCy4rAEDw68sYjJAMZa1YSHW2fXbbUcQ
         YbLqSdneKT6MgF8hTfWdk/Np4CVjsrsH7DYtPwQeP9BaiOxoAtgrTDWE1n14BiHDMGoK
         fm/cZ+p1ThGbTWzg3R1HNCZSSRTZyuXDPoxceD/Tx/GSl/T7J7ZNWOWb1mUbn9sxdW5e
         Zv9Q==
X-Gm-Message-State: AOJu0YwEjumlT7MvGyS8iTlCiYqPAa0L9F3xdYwa4NA9kXv67X68+ef9
	UOIWQAOzTG2c9326WHWPlp0FR1XZTBsVBQ3pXcXFE1Io6yaux9DI3a/cPu27yfY=
X-Google-Smtp-Source: AGHT+IGa1M7vqlIE1C58dap0MUYea0CUqZITS59MDPsSM5pvcClAnYC6Q9OxDuJHFWpJZfB8rOdMgQ==
X-Received: by 2002:a5d:4382:0:b0:354:bde9:e286 with SMTP id ffacd0b85a97d-35526c18f20mr6513910f8f.10.1716799367174;
        Mon, 27 May 2024 01:42:47 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3558889fb57sm8447292f8f.114.2024.05.27.01.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 01:42:46 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 27 May 2024 10:42:35 +0200
Subject: [PATCH v2 3/7] phy: qcom: qmp-combo: introduce QPHY_MODE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-topic-sm8x50-upstream-phy-combo-typec-mux-v2-3-a03e68d7b8fc@linaro.org>
References: <20240527-topic-sm8x50-upstream-phy-combo-typec-mux-v2-0-a03e68d7b8fc@linaro.org>
In-Reply-To: <20240527-topic-sm8x50-upstream-phy-combo-typec-mux-v2-0-a03e68d7b8fc@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2828;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=64NV6QzxOvpeyMBuyWNXD513V021rtwBykr1hxoHJD4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmVEd+Iqk2CoBGSG/vvhX6fqwQ1IgBdRIZAOChhnvF
 X/Z5q7KJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZlRHfgAKCRB33NvayMhJ0VVkD/
 91JOyMvWaIuisFv1fb/z+0SJSAlcj9xc65JF+wOjXsIhJ8j4mVlCyUcYfGOEN011OCzET/GZ8C8GjX
 Q8GVS1X2RTKmwXwNKsULIdwDnf5Mep/go2GLeUBhTG+MmwelkjWV8fkL6nubsBzsy+0CCVIdd1GIPm
 5COBZQEzS9RAqg2xEBGvFkwQ3SbQpfCGWG+DUXiQK/KV09U0ygYpTkP/udnODf5wdzNC8qmvqFtQ5v
 5mUzE/al55I+TlLnkoPEmWRCuYfx1p0S8tS7uODLI98mwOqCqcSBDtoLpBN8KxZFVcQDJBgC1ytoqB
 GxsyYZJUBkJd6ahagAOb1tQsh5aRtqzw+rPmorQmL3ngMR6A4z81ude3rjs968fYU9vT5CrpGxs5Wd
 68c/H4ycD8Zn20dQnnFatuLETOwX/qEdMonl3aiS0qMvBSkn4vXWTxooWBvsTN4KZTczwE6jhskaJp
 yTfnYkekv/8USAKiS/xT9zfRnn9bQRfv8zwdnIWYKJHzxlOatzCpZoe5bGqJwwUziDipdTr3ZoMhMV
 COkGCTRVZx3RWyd7sUceNCgsUg63DqF8D5/TBlv3EjC3EaOCkaSY2dBMk/GxUPFMi1qguU51YBpPow
 zxHNEsGQkQcimqSQfU7BhOsUGJdHVumRmYWXxOWx1Q1e+yt59QB5iNCMvFDA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Introduce an enum for the QMP Combo PHY modes, use it in the
QMP commmon phy init function and default to COMBO mode.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 41 +++++++++++++++++++++++++++----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 183cd9cd1884..788e4c05eaf2 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -61,6 +61,12 @@
 
 #define PHY_INIT_COMPLETE_TIMEOUT		10000
 
+enum qphy_mode {
+	QPHY_MODE_COMBO = 0,
+	QPHY_MODE_DP_ONLY,
+	QPHY_MODE_USB_ONLY,
+};
+
 /* set of registers with offsets different per-PHY */
 enum qphy_reg_layout {
 	/* PCS registers */
@@ -1503,6 +1509,7 @@ struct qmp_combo {
 
 	struct mutex phy_mutex;
 	int init_count;
+	enum qphy_mode init_mode;
 
 	struct phy *usb_phy;
 	enum phy_mode mode;
@@ -2589,12 +2596,33 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
 	if (qmp->orientation == TYPEC_ORIENTATION_REVERSE)
 		val |= SW_PORTSELECT_VAL;
 	writel(val, com + QPHY_V3_DP_COM_TYPEC_CTRL);
-	writel(USB3_MODE | DP_MODE, com + QPHY_V3_DP_COM_PHY_MODE_CTRL);
 
-	/* bring both QMP USB and QMP DP PHYs PCS block out of reset */
-	qphy_clrbits(com, QPHY_V3_DP_COM_RESET_OVRD_CTRL,
-			SW_DPPHY_RESET_MUX | SW_DPPHY_RESET |
-			SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
+	switch (qmp->init_mode) {
+	case QPHY_MODE_COMBO:
+		writel(USB3_MODE | DP_MODE, com + QPHY_V3_DP_COM_PHY_MODE_CTRL);
+
+		/* bring both QMP USB and QMP DP PHYs PCS block out of reset */
+		qphy_clrbits(com, QPHY_V3_DP_COM_RESET_OVRD_CTRL,
+				SW_DPPHY_RESET_MUX | SW_DPPHY_RESET |
+				SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
+		break;
+
+	case QPHY_MODE_DP_ONLY:
+		writel(DP_MODE, com + QPHY_V3_DP_COM_PHY_MODE_CTRL);
+
+		/* bring QMP DP PHY PCS block out of reset */
+		qphy_clrbits(com, QPHY_V3_DP_COM_RESET_OVRD_CTRL,
+				SW_DPPHY_RESET_MUX | SW_DPPHY_RESET);
+		break;
+
+	case QPHY_MODE_USB_ONLY:
+		writel(USB3_MODE, com + QPHY_V3_DP_COM_PHY_MODE_CTRL);
+
+		/* bring QMP USB PHY PCS block out of reset */
+		qphy_clrbits(com, QPHY_V3_DP_COM_RESET_OVRD_CTRL,
+				SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
+		break;
+	}
 
 	qphy_clrbits(com, QPHY_V3_DP_COM_SWI_CTRL, 0x03);
 	qphy_clrbits(com, QPHY_V3_DP_COM_SW_RESET, SW_RESET);
@@ -3603,6 +3631,9 @@ static int qmp_combo_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_node_put;
 
+	/* Set PHY_MODE as combo by default */
+	qmp->init_mode = QPHY_MODE_COMBO;
+
 	qmp->usb_phy = devm_phy_create(dev, usb_np, &qmp_combo_usb_phy_ops);
 	if (IS_ERR(qmp->usb_phy)) {
 		ret = PTR_ERR(qmp->usb_phy);

-- 
2.34.1


