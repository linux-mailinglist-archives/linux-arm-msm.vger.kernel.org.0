Return-Path: <linux-arm-msm+bounces-24435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4594991A578
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 13:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62B241C21FAC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 11:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B2D14F110;
	Thu, 27 Jun 2024 11:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UppM8blT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BE014B95B
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 11:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719488401; cv=none; b=FrS8ikU/GUwVnjTEbbv1BYBBVkzNIFTDI9kEM6lJuk255VpXioK2hEqRZNA75Gcto4nVkUlOlrl5XqXece7p8fJBenh+MrqVB+eMwNY+iotfofquW0vKzZ9uAeQbIQ0mOiizxAW8xI2PKPaq07WNE+luVO8L8j3lVXlBwlRIHKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719488401; c=relaxed/simple;
	bh=Tcp3ABbjOYKsLQ0HZr7FhRtHNkGUGeDfdZHzFHhp0fo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DSbEHX7+qCAEPRk9x7m9l3cxgIMMYY8xuEgfQs9BhbEv7XaDYa546Wl5OzdbJoOMjH4ycU0tVwcF0JsH+Nr4nTFdoYt3knZJPIx2tzeQCjLWjm5H+jLZysqcEo8Iuwa8FuXabU9dxOaDiNBPpZuHTG7L/vWXiCyxuMOer73lKok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UppM8blT; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ee4ae13aabso5786831fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 04:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719488398; x=1720093198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4pg+dewGD9qJnz964kSExuGkcfdlUV33yviPPBuaIJc=;
        b=UppM8blTu+y+Qial+2kOS+/zsmEaKeYfB40BCB9VnRAugyZx4/jNBIkKmnD+UGPaSl
         z1//eTvuoX1q1SDrmZqPVVokD+RFCF4S2g7hOdFnc1mi6raeZJcUOtt0fleNlG4eLK3g
         V0Z5mjc5KonLcaS5jalEXaxJUOoPS+weVOX38fvguEQRD/hY8nKG+CkhfYGcHi3pDLuA
         C7n62tQtWEv0Ov2sWXh0/Y4j2hL9sBpPkOtZ3ga6fNgOd8u6KJ/K/Rde0IMqmniAzej7
         3QgR72uDduvn5AJeMsEQjxbDiYZNe1fC7DE2Zpy+Dsp0H1j2n9JgVRBzJIj5TZ1P3igB
         QF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719488398; x=1720093198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4pg+dewGD9qJnz964kSExuGkcfdlUV33yviPPBuaIJc=;
        b=HHf/4cF3ew5znWt/uPEHjY9UqFWDWWmoPkvYRDFnMnM1TIkM0WaFsdRznhc8S6FYsD
         o0ZjVve8NnAi/VZKOZ5DlBdqGfotTqWm9pRm5NWRKN9IJVQesBUHRtbwa0g++d4wxUbr
         5i6LGDvPWJpnhqhuP+Q5k3EOWqqYyyI2O8XaMpnAToZlINFmOoqZBJu6A0JOw+1IrUmb
         XkwfV3L+FKE5aVaayJTjmTZXvY5kHuKjwfTyifRAcDcY6m8hHehHvMMRSY3fWT10bvkH
         9uGZe2RPi+ZAvaapqJe/eX3Frv+BkgJIVU1gS66fksAGTR0rlFw7fkFELjm/nSUuLNA7
         /6ag==
X-Forwarded-Encrypted: i=1; AJvYcCUh4xn5m+oowoZs/3snqsVnXNuklo+XgSdscaoNbvGww+7MQeqaznRb8282Ov6E5TwNfzzIhwrJhlqC3aetArQS9Vsrns/eNmPSIhFCgQ==
X-Gm-Message-State: AOJu0Yyhuy2F6h9ncPGjmQ+H1tXixRdfq6XMmTOmQpgI3qemwHC3TwNh
	rk8I4h8OOERdwLaUwacqNRr8zW4DagHNrl5DgMiTGW4j16WbMASoTcJnsnG+wMQ=
X-Google-Smtp-Source: AGHT+IFesDthKKQJOFKJN5mrhDcAjnIOVckKhyM8WzR1KTGyuUBEn5Q3dR+OhY/YzKz0W/J5FKzIyg==
X-Received: by 2002:a2e:7e0f:0:b0:2ec:56b9:259f with SMTP id 38308e7fff4ca-2ec5b3e24d7mr75758781fa.48.1719488398134;
        Thu, 27 Jun 2024 04:39:58 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:7fe5:47e9:28c5:7f25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c8468613sm62081815e9.39.2024.06.27.04.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 04:39:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vinod Koul <vkoul@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 net-next 2/2] net: stmmac: qcom-ethqos: add a DMA-reset quirk for sa8775p-ride
Date: Thu, 27 Jun 2024 13:39:47 +0200
Message-ID: <20240627113948.25358-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240627113948.25358-1-brgl@bgdev.pl>
References: <20240627113948.25358-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

On sa8775p-ride the RX clocks from the AQR115C PHY are not available at
the time of the DMA reset so we need to loop TX clocks to RX and then
disable loopback after link-up. Use the existing callbacks to do it just
for this board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 91fe57a3e59e..f4d72d75e8de 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -21,6 +21,7 @@
 #define RGMII_IO_MACRO_CONFIG2		0x1C
 #define RGMII_IO_MACRO_DEBUG1		0x20
 #define EMAC_SYSTEM_LOW_POWER_DEBUG	0x28
+#define EMAC_WRAPPER_SGMII_PHY_CNTRL1	0xf4
 
 /* RGMII_IO_MACRO_CONFIG fields */
 #define RGMII_CONFIG_FUNC_CLK_EN		BIT(30)
@@ -79,6 +80,9 @@
 #define ETHQOS_MAC_CTRL_SPEED_MODE		BIT(14)
 #define ETHQOS_MAC_CTRL_PORT_SEL		BIT(15)
 
+/* EMAC_WRAPPER_SGMII_PHY_CNTRL1 bits */
+#define SGMII_PHY_CNTRL1_SGMII_TX_TO_RX_LOOPBACK_EN	BIT(3)
+
 #define SGMII_10M_RX_CLK_DVDR			0x31
 
 struct ethqos_emac_por {
@@ -95,6 +99,7 @@ struct ethqos_emac_driver_data {
 	bool has_integrated_pcs;
 	u32 dma_addr_width;
 	struct dwmac4_addrs dwmac4_addrs;
+	bool needs_sgmii_loopback;
 };
 
 struct qcom_ethqos {
@@ -114,6 +119,7 @@ struct qcom_ethqos {
 	unsigned int num_por;
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
+	bool needs_sgmii_loopback;
 };
 
 static int rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
@@ -191,8 +197,21 @@ ethqos_update_link_clk(struct qcom_ethqos *ethqos, unsigned int speed)
 	clk_set_rate(ethqos->link_clk, ethqos->link_clk_rate);
 }
 
+static void
+qcom_ethqos_set_sgmii_loopback(struct qcom_ethqos *ethqos, bool enable)
+{
+	if (!ethqos->needs_sgmii_loopback)
+		return;
+
+	rgmii_updatel(ethqos,
+		      SGMII_PHY_CNTRL1_SGMII_TX_TO_RX_LOOPBACK_EN,
+		      enable ? SGMII_PHY_CNTRL1_SGMII_TX_TO_RX_LOOPBACK_EN : 0,
+		      EMAC_WRAPPER_SGMII_PHY_CNTRL1);
+}
+
 static void ethqos_set_func_clk_en(struct qcom_ethqos *ethqos)
 {
+	qcom_ethqos_set_sgmii_loopback(ethqos, true);
 	rgmii_updatel(ethqos, RGMII_CONFIG_FUNC_CLK_EN,
 		      RGMII_CONFIG_FUNC_CLK_EN, RGMII_IO_MACRO_CONFIG);
 }
@@ -277,6 +296,7 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.has_emac_ge_3 = true,
 	.link_clk_name = "phyaux",
 	.has_integrated_pcs = true,
+	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
 	.dwmac4_addrs = {
 		.dma_chan = 0x00008100,
@@ -682,6 +702,7 @@ static void ethqos_fix_mac_speed(void *priv, unsigned int speed, unsigned int mo
 {
 	struct qcom_ethqos *ethqos = priv;
 
+	qcom_ethqos_set_sgmii_loopback(ethqos, false);
 	ethqos->speed = speed;
 	ethqos_update_link_clk(ethqos, speed);
 	ethqos_configure(ethqos);
@@ -820,6 +841,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->num_por = data->num_por;
 	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
 	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
+	ethqos->needs_sgmii_loopback = data->needs_sgmii_loopback;
 
 	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
 	if (IS_ERR(ethqos->link_clk))
-- 
2.43.0


