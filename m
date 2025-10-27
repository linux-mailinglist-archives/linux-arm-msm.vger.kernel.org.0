Return-Path: <linux-arm-msm+bounces-78983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78326C0F0C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 16:51:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D4AD19C7517
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 15:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2545830C634;
	Mon, 27 Oct 2025 15:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="A541Nr+i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B57315D2B
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 15:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761579917; cv=none; b=HAeTLh4Uk+wI7hUOepgqTCBBbP+kIfK99Bn76iUzf5kvFHlTppK4tsSWO/cgTG/jUDDUP20+bfodMjgCN2j0MLOQNJlc3PvgcDE0DZkTwVEIO60Qajme8lUWggdribPmskXEERRljkWlj5irrDhsrwbY8Imak8a6DN1RPCL5rls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761579917; c=relaxed/simple;
	bh=i1kWXJ1nEYOgPM1tmCAbFb+vRHzNPInWom5+gW0JW9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TkRHjKBPefBmfp5sa1oSSe/DR8RKWph/rWQRft8/1mtZWWdqOlZWXlP4Updfuy3j7ZRFC4IQNup7pn11fErgz5j+A16RnSQtCqFbDXVbzoqRh1rZAbzfl/woq6BMfs9CV9lNjsFWCGfLFFwKaKkrWOwwWomP7S2JoXWpWlwNC/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=A541Nr+i; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-475dd559a83so12740265e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 08:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761579912; x=1762184712; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eNS/wqhYOljfWC+fSnpn1y3WQ4q23+yxEBnxY7wxw6g=;
        b=A541Nr+i3goxCxCvHRDwCOjNbVlCimKQU/m+q3yzcBCOdgWrh2G54WtIaJFcoT8gsq
         RXv3ZW8QYbqvC0DdafYiTd2Y95ncOihrgWiuMQs06jWM6NjUlzwISos9x8q4ufFWGJjI
         NjfDq02rO3PaAa5C6RSgyRf13dtPwfg5F8gqavHqs9xhW2txPCCMq0zkT61R1VPXTWrX
         LAZXImXPfnPL7wjcnUrX4MQYJrXAVfu269NHpJVJxSK/vOPsmUcWjo8ZwhSIuFBrYJ03
         BcA/llpSNXr3Ustq3Fkf6adRfAZ+AlTOygGVKjVJAATnO6G3vZftdVoLoR65OFc5dm+a
         /goQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761579912; x=1762184712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eNS/wqhYOljfWC+fSnpn1y3WQ4q23+yxEBnxY7wxw6g=;
        b=T+tbS7GqvpWNIuSIBNRGg1PWYkqjZ7c8nt+JnFFgV4WnGxKKQzDiTcWGrVptXQXOEr
         8q9NOGwSqO/eBjd1uSLyF2k9eX/pxFbgX3Ak0K8gdCbzGHk2fnw6VrFICFsdXQ2NfPep
         ZXQubrxpVv0dT+gdQRirGpIJXoDWg3nxdKy8v2/yR/QFxsl+EAvnYtC8QSrNMVLSl4aU
         agSgFODwzzCAWNkLejRyd1CuDmne1twQwzJDthfq4YM0XRPMMFBjwESwZ8cmT/jma7SS
         LGAZ/RC/JSnwDmQciamYcy5toBraUTIxeeu+VjNGTMm1kGr/8xaQ1NDxUL3IPyVXbt/+
         RwCg==
X-Gm-Message-State: AOJu0YwC6zswCWbg6q/mDE78GNkGTIIAeYgNF9lu3138E1pjzgoJY5An
	5S5HtSRZ07JN8q1OO+sEH1VSrIzVV+HMars0FuUVuLN6NCRYriOwA8i9WecyncRG7kI=
X-Gm-Gg: ASbGncucy3yWah5FGuFbXgWeK5QOe8AVkFd1Lj8DrFrADUk+Yo1Ow0+7XQFjl/rCimq
	Z7yrXjCR3gSSCq/1AMWNO1BSTbLKzSXF5qG1vOwXWnjC/JvYRkTkB/rgHwG1j9zZnWRXdantK0X
	J/UZ+5ZtRlZLfUVsN1GAMOxdX+81fmVNG6Gz0bZxLUSrgIGlWecAzzTFS8v5tVmMxuwUebv9WbV
	zFW77/Mrt3ggfVE42DJXboAJ3eVP5aEiSpzWIfbLev2U4KvmOTOLo+KMlb/g+uHTgZxJET9F+Pi
	/VEb6zKMxwlqieFJ5xy/hXXVIXybgwvqy0qA2TiIvepk6rbbtZdEFvTQG5eDPCsTi2DH967H/TK
	g681w9lM6bUAKIGZox1T32pyEdndNVZ4XNM+rdtrgS/fHQtNZVZfRSTZ5x15fZQ2hcK5QV4E=
X-Google-Smtp-Source: AGHT+IEcS3+Mjv+mhXDzePSPYtR5z2XLlTFPrVb1vdXnvrOFtKLZZKXhn+EX6Uyf8++3V+KI2L1nQA==
X-Received: by 2002:a05:600c:3109:b0:475:dba3:9ca with SMTP id 5b1f17b1804b1-47717e7fa0fmr551335e9.39.1761579912349;
        Mon, 27 Oct 2025 08:45:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1c6:7dde:fe94:6881])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd477d0esm138708045e9.0.2025.10.27.08.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 08:45:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 Oct 2025 16:44:54 +0100
Subject: [PATCH v3 6/8] net: stmmac: qcom-ethqos: split power management
 context into a separate struct
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-qcom-sa8255p-emac-v3-6-75767b9230ab@linaro.org>
References: <20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org>
In-Reply-To: <20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4943;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=GgzPtEPZX7xvMWn454sVcSaK6B006ED6cn0Ay90ur54=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo/5N8H8/tfulP9sfcdTh0prmWo4yvzuq4p3oVM
 UzG5vCPRh6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaP+TfAAKCRARpy6gFHHX
 ckfYD/9GFZbGhB0rIgQMsDuYjJI2F6r8bEJR2t5MXewyHGb0uBNirHJxqdDET5pMKzrBjXMX4i6
 AMmgzpETEwaCyZAswoOaTBd6YYaQo286whbtuGE/TVm671hhPk/mTkXcHnFUtC8C7QnwSAxTliq
 h1yXzbw9Yn7kOiOiCbhV6PHouufWr/FVGORHbqvkBYmae451ubnkG/8RPye1JwGBR2KKBTH2ECN
 LxfQ/LT9F91EgLGgi856IJz6OJZ0fzY0jRl0VwNbwMsjBe0ZLr/W315gMbRMzjobB7SK48vflJn
 kABE1SXMUrEF29ZM8KyKtx5BTz/yQ2fYZcFVYw3kSxW91nuTOk2h3jpgncAJmX2XfFMldm6SIVO
 bKCPsxtf7AKsVN9w268LsHvdemlilofFoYSP6863Ofq6L7UVMHiIaUAY4gTY3/Xw6qQ0OrIp7MA
 VBYngI5Lhe2NLsAHWCvVcvwVpUgIshWlSl9fpdhP8wCIGVcnYJlxF3mNu5UBIkyN3ESGiCeAl/G
 +ytjDgLy2TxB8dFqrMKk162NaW6E9DXdkoVoDujO+0tyw9detsCzs2d8fNu4g5V12u+KBJ9hxPV
 FIspXSJBb5mU47bGsF4bsagQIYmEz1koQQipGYowzi3OV2jeB8Hd4u61AY01NP3SBLP8M9OQKg1
 lMUDvHUmSKnRsvA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With match data split into general and power-management sections, let's
now do the same with runtime device data.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 46 ++++++++++++----------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 7ed07142f67c931cb2c2c0e8806f5a7fbd68945d..c25b4b4581f9cea6107a39f0bc6165be6955cc1b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -109,17 +109,21 @@ struct ethqos_emac_match_data {
 	const struct ethqos_emac_pm_data *pm_data;
 };
 
+struct ethqos_emac_pm_ctx {
+	struct clk *link_clk;
+	unsigned int link_clk_rate;
+	struct phy *serdes_phy;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
 	void __iomem *mac_base;
 	int (*configure_func)(struct qcom_ethqos *ethqos, int speed);
 
-	unsigned int link_clk_rate;
-	struct clk *link_clk;
-	struct phy *serdes_phy;
-	int serdes_speed;
+	struct ethqos_emac_pm_ctx pm;
 	phy_interface_t phy_mode;
+	int serdes_speed;
 
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
@@ -185,9 +189,9 @@ ethqos_update_link_clk(struct qcom_ethqos *ethqos, int speed)
 
 	rate = rgmii_clock(speed);
 	if (rate > 0)
-		ethqos->link_clk_rate = rate * 2;
+		ethqos->pm.link_clk_rate = rate * 2;
 
-	clk_set_rate(ethqos->link_clk, ethqos->link_clk_rate);
+	clk_set_rate(ethqos->pm.link_clk, ethqos->pm.link_clk_rate);
 }
 
 static void
@@ -643,7 +647,7 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 {
 	if (ethqos->serdes_speed != speed) {
-		phy_set_speed(ethqos->serdes_phy, speed);
+		phy_set_speed(ethqos->pm.serdes_phy, speed);
 		ethqos->serdes_speed = speed;
 	}
 }
@@ -722,23 +726,23 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 	struct qcom_ethqos *ethqos = priv;
 	int ret;
 
-	ret = phy_init(ethqos->serdes_phy);
+	ret = phy_init(ethqos->pm.serdes_phy);
 	if (ret)
 		return ret;
 
-	ret = phy_power_on(ethqos->serdes_phy);
+	ret = phy_power_on(ethqos->pm.serdes_phy);
 	if (ret)
 		return ret;
 
-	return phy_set_speed(ethqos->serdes_phy, ethqos->serdes_speed);
+	return phy_set_speed(ethqos->pm.serdes_phy, ethqos->serdes_speed);
 }
 
 static void qcom_ethqos_serdes_powerdown(struct net_device *ndev, void *priv)
 {
 	struct qcom_ethqos *ethqos = priv;
 
-	phy_power_off(ethqos->serdes_phy);
-	phy_exit(ethqos->serdes_phy);
+	phy_power_off(ethqos->pm.serdes_phy);
+	phy_exit(ethqos->pm.serdes_phy);
 }
 
 static int ethqos_clks_config(void *priv, bool enabled)
@@ -747,7 +751,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 	int ret = 0;
 
 	if (enabled) {
-		ret = clk_prepare_enable(ethqos->link_clk);
+		ret = clk_prepare_enable(ethqos->pm.link_clk);
 		if (ret) {
 			dev_err(&ethqos->pdev->dev, "link_clk enable failed\n");
 			return ret;
@@ -760,7 +764,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		 */
 		ethqos_set_func_clk_en(ethqos);
 	} else {
-		clk_disable_unprepare(ethqos->link_clk);
+		clk_disable_unprepare(ethqos->pm.link_clk);
 	}
 
 	return ret;
@@ -857,9 +861,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, clk_name);
-	if (IS_ERR(ethqos->link_clk))
-		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
+	ethqos->pm.link_clk = devm_clk_get(dev, clk_name);
+	if (IS_ERR(ethqos->pm.link_clk))
+		return dev_err_probe(dev, PTR_ERR(ethqos->pm.link_clk),
 				     "Failed to get link_clk\n");
 
 	ret = ethqos_clks_config(ethqos, true);
@@ -870,9 +874,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ethqos->serdes_phy = devm_phy_optional_get(dev, "serdes");
-	if (IS_ERR(ethqos->serdes_phy))
-		return dev_err_probe(dev, PTR_ERR(ethqos->serdes_phy),
+	ethqos->pm.serdes_phy = devm_phy_optional_get(dev, "serdes");
+	if (IS_ERR(ethqos->pm.serdes_phy))
+		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
 				     "Failed to get serdes phy\n");
 
 	ethqos->serdes_speed = SPEED_1000;
@@ -894,7 +898,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (drv_data->dma_addr_width)
 		plat_dat->host_dma_width = drv_data->dma_addr_width;
 
-	if (ethqos->serdes_phy) {
+	if (ethqos->pm.serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
 		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
 	}

-- 
2.48.1


