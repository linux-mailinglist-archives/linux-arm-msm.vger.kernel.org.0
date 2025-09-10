Return-Path: <linux-arm-msm+bounces-72917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF974B510B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 10:12:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 670FB3AEBE8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 08:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BDB4313E0B;
	Wed, 10 Sep 2025 08:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lImqtPdP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018AF31352D
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 08:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757491683; cv=none; b=Poc8eR4R3igKFoCevXN3J/fTV0RA1FVjRiGjC55tYAXamAH6HTwHoRI4rYC0HEh8P+Bunk1oewbO/PkA8qmdhLT9gy0Q1MnDbrLCfAu4OE+A9PzqT2TtX9dJAotfzEzrYB3hOAgKeY+p8AT8ZiRrYAbXpPxTh/NC3xd4dr8Vjb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757491683; c=relaxed/simple;
	bh=TO9nsTt0YPxpWytCVH7ZJjGxn2Z4plKkUXJnF32G1IE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UCBUEoLXWnCVpwpxi5C/UeUuMvEoo/O9aASN/z0j4V0JnAYtwnrtQyoiyK3jJ5hkgYSfbEP5FXKu08z7YNDMRCknNDjzTbQHC7GZIdMfM54+9fvPSdDjP3QFQVfzOk3l9kDioEOyurO8hKrqzUWMxj/Qgkdz/G6mkFTwzS9FVjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lImqtPdP; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45cb6428c46so61007585e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 01:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757491678; x=1758096478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K5ZbnZbGKkG8LBPBH3Ir29b+fdJ02lrKRlpbmxW9/T8=;
        b=lImqtPdPGEznMoBmibjexcE5txcc7mvtdPZVDF/bhZrFVf8EH1lb85KkZRLUkACilb
         T0wN+fzejMATKYqdm1w63JaiXlt0cKb+Jezj69ie9VdSNqHnTPaEYrYxtuKiv7W6a1Vg
         gQH42hh5pFXGN4r1c4rcaTx49xXyeU3h7g8P1TXQOucsPromu3H3F3qaRGgnnsa+XcKp
         f/pUc7Nr9b/PjLhAo4ZKNx4TnGMAdNnVCCnmiUTcy27WZ9UruGbSys1kNi0uM+R7cek5
         K73i2SKwbJJbIOXXfMYYyq85qTIE/HCHY4kEiWZCzZsCI1dSchZefjmukVYJnxD7j3EL
         Tdaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757491678; x=1758096478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K5ZbnZbGKkG8LBPBH3Ir29b+fdJ02lrKRlpbmxW9/T8=;
        b=NV1yQYUUp6ZvowH56xsIKZZ9k94cHVtE6Jj38tdDSxgfoFmMvjiyWdkky1fJssc5c2
         duAwg0SskF3IvUa1/md6ouJHcsokDS3pJaoQoYk1eBxj5aM1/YKQLAhn2OPNq7gFB6yV
         d/JeS3XbSx9+txdvXaAjIiQL6ddk5tUZxQAijUVTuJt5ukzx37j/FIZegPmbicf87pjZ
         2+BtloKQqMP3N/kB/COI23dwwAyRZEorLw5XBNh1OhSeHoSMXIGdnBF9psY8aMvCrdf8
         /cw1ljwPVR/19/ZU43vzt5c1Wy9qHofdKzRCeBUy80ctTMAQ8Teo3Vy4d/u9MDwxR/DX
         59Cg==
X-Gm-Message-State: AOJu0Yxqg0bnwjqky2JXUuxOcodBZFM0otZevV8NrHgHanGDIJQBERiS
	rDoG5W7C1Y3UXMf/evwlqxD9q0G03w5bUVAJqaOC5JHq2yj3hDOpY1PZejU2u4sMTgU=
X-Gm-Gg: ASbGncsRDkY/nFjEiXBJtaRHucxdihl4+bwvWYfDioMa8F219qB+b04IUA6bcVL7wS0
	OgmCXGWUomIY5TcTU/6tiCpCs3R9jAT+9S+U7UtFkCdHn8IKPppvC5bHqaU4XpFqYHS0xhdI2Yj
	Xer3JFwm2nQzZwb/IxI35GqA4r4pnCkXyljwHX+RBNz/QmZp8uLgM1/PKkKwlFn+zItdk+nHFQa
	uL1nyTPJa9RxkATv+e4CFWs9LbQd9K032Q084Cl1DLEUkCMW78CLSZvl0ISR3Peu+YNrXt0XicJ
	oVR0T96mzNkRHJHty6Z8WbEbEGSxCK1JIgA16+HF60jiU59hYqm6sxgFH0fHIW8AZ+AKIW1wCTt
	LtjxErCzFVhDZVqsZB0DfQikUVZTv
X-Google-Smtp-Source: AGHT+IGcNjYgg+7jgh4blEMFccFbkJGi6bO3RhLZjRwgFf65PTFPcgmBOAxw+fKWIq8T2MZtB5RgxQ==
X-Received: by 2002:a05:6000:647:b0:3e7:1f63:6e7d with SMTP id ffacd0b85a97d-3e71f6373admr13288055f8f.45.1757491678234;
        Wed, 10 Sep 2025 01:07:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8247cc6sm17813605e9.12.2025.09.10.01.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 01:07:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 10:07:43 +0200
Subject: [PATCH 6/9] net: stmmac: qcom-ethqos: split power management
 fields into a separate structure
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-qcom-sa8255p-emac-v1-6-32a79cf1e668@linaro.org>
References: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
In-Reply-To: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3478;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=QXDtZJBSeiuTqR9NRW8KT3qs59BPygxIGrInXJc2Y/o=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowTHNSoutMu84csaXFAxK6JnDf6fEo4asszTGJ
 FRKVbeAlzmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMExzQAKCRARpy6gFHHX
 cpjoEACYKIZtA23uWtKTc0XoGqp/fP7cMOcYG5mSWp8fvqyIw8kXSHByC0xxlZe/srDOLERBEhF
 yKU25p1oPHRtZisFB6RsQcgiszzHbZ/kjL5ZRQciJETi0moEBIkrsOkFx1dRwgaaFrHpNfD8rPq
 4mcf0j8xD+yssUJneaB2FANeiklmrp2PTZncMYKfnD88RJS8KO8HzgN01+puQGPd1wD3puGSv3O
 oyFQnvcFb5ssK/QShi0JKNtrDKc1o1hneQjoNNj+OzspZ+p/f9NccvKCcR8qFUVe9Cv23ck7zxt
 uRi5UD5z8ip/JF/bOigUNvgvdWCpsCeKjrkC88txKlACsUHMtkfFBq+I3JgQjvKNdNPeLt2fNgN
 G6OkHIMX8T/7c1Ug9r33lfRReohcPlk8bMXGu7CuwD4vXovzQ/sc/wc0XZwghe+DxyTzbrmh37J
 dJTS3HQ/Ih9OfatUUGz2P48FROomMfLD2cTYSnG+6dYnAm9DuKhmTWttLmzoh+6+RmRTLQLEa7n
 maqZU+srgHub5I++RBm/Hp7aHq7g9HR8hZipyCcFWMJFMO79boC6n21fShmqupy16Q73Wt9+Id6
 0oNsysqQ49Z9GLt/+wOZZEtHMME19WePfEu2TDmoXNy2HgWqPckjl7cA91nLzXqr22srgpwrtuR
 An7Ylq9J9Xb5RrA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Now that we have a separate wrapper for device match data, let's extend
this structure with a pointer to the structure containing fields related
to power-management only. This is done because a device may have the
same device settings but different power management mode (e.g.: firmware
vs manual).

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index dcee5c161c01124ea6bf36ceaeca4cc8ca29c5d5..d4ddf1c5c1bca2ae1fc5ec38a4ac244e1677482e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -95,15 +95,19 @@ struct ethqos_emac_driver_data {
 	unsigned int num_por;
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
-	const char *link_clk_name;
 	bool has_integrated_pcs;
 	u32 dma_addr_width;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
 };
 
+struct ethqos_emac_pm_data {
+	const char *link_clk_name;
+};
+
 struct ethqos_emac_match_data {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 };
 
 struct qcom_ethqos {
@@ -297,7 +301,6 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.num_por = ARRAY_SIZE(emac_v4_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
-	.link_clk_name = "phyaux",
 	.has_integrated_pcs = true,
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
@@ -319,8 +322,13 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_pm_data emac_sa8775p_pm_data = {
+	.link_clk_name = "phyaux",
+};
+
 static const struct ethqos_emac_match_data emac_sa8775p_data = {
 	.drv_data = &emac_v4_0_0_data,
+	.pm_data = &emac_sa8775p_pm_data,
 };
 
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
@@ -787,11 +795,13 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 	const struct ethqos_emac_match_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
 	struct qcom_ethqos *ethqos;
+	const char *clk_name;
 	int ret, i;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
@@ -839,6 +849,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	data = device_get_match_data(dev);
 	drv_data = data->drv_data;
+	pm_data = data->pm_data;
+	clk_name = pm_data && pm_data->link_clk_name ?
+				pm_data->link_clk_name : "rgmii";
 
 	ethqos->por = drv_data->por;
 	ethqos->num_por = drv_data->num_por;
@@ -846,7 +859,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
+	ethqos->link_clk = devm_clk_get(dev, clk_name);
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");

-- 
2.48.1


