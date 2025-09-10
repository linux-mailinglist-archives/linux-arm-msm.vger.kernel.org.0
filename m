Return-Path: <linux-arm-msm+bounces-72914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7E2B510AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 10:10:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F20073A1B1F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 08:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFEAD311978;
	Wed, 10 Sep 2025 08:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sZwtAMB5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42723115A0
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 08:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757491674; cv=none; b=n5apL7wWGXLt1Ga2tqRBF9hYOyS6f3NsQsQsVuuO3IOE1kZ3j5gL98nOOWdd+xfmMQFNn8HX1HfgoFwv4yOnzx4XLDhqGudgQtF4uKiUMR6fHcbMNeaxYHsAPbaJQAKMTdj7bwRQRA9nP426tkBa+DNeL1iOsYd1jLsKGzDu+vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757491674; c=relaxed/simple;
	bh=ibsEYvxohb5mD1I4yEmeNl07uAKjfZzWOmtVL8aBmCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rB7cx26m80ILWXTk2fp+OO72euCDkvungnluHrh8PQKO3/o0LHUhkr04gYLH3sNMen6jA2wM9tz+WDQkaPmV5L80GvzI/12SVGMLh50/SmaB5Ov9fKUJCX4r2qoGps09beb71DmBJ8V1IdznqYahW2r+ZE2S8kwMXHdnsd0v4Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sZwtAMB5; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45dd5e24d16so47005535e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 01:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757491671; x=1758096471; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z1sCvmiZl6CYI7nEwas+vkP3919eSylK4ly9/aS+CfQ=;
        b=sZwtAMB5lhZGl7/VJtCW0tGfOh3e8KBO1Xhps2+EMLNCIjuzkdmUXGkcFJh4PzL8rv
         +qvvMFmc78NOyWqEBVE7J4jen/hUStq82Nhy39Lnb/D49ATktYtkrXFQlcpgh5+l1kK3
         +8yO9TxcIG+LXk4BOYc7X3lhd85li803j38Tl00T+HK8Ma+9PAaKUF/Xw4UYhBVZ6/Yp
         qbU/E3VyKkKyauOLjaS1uouwJhwZBZWp4UfoJsNO+OMJKNLLtFCJdJkqINwFvaxr+Ax/
         xejp9LixsiFl4CABE5XG5lKPO5IeGMbtvsMOuyOsCXmPdYP7/tQrW8WL8xqI8DUeHS2J
         zmfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757491671; x=1758096471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z1sCvmiZl6CYI7nEwas+vkP3919eSylK4ly9/aS+CfQ=;
        b=aVPHhtOOthAujTC3pyreo7h3GqrK+KLKDaHJFKNDSSJt9vKquGGlD2Rh3vV1WGOYKK
         YU4kFemPTh5wm6pSDbIOjMYlHMW+FevDlv+YaoAQzT2S/xWEKoygIN3PBWzlcgpMAmNJ
         y0UBJ+rKZ2WGIulFcIHoqQwelIWLwcf0GG8fjVi485sE528gfiHwRFhuCvYDJHuU5WRb
         kEucKSJVzcwyAJm5MuYhWRyEllSZZ22J6tksjkklZX6J4iacghRj/D1rieylzzKHHap/
         6BKy6G/FCf1JXzS1ieu1dz9lPecJWIH1zwIWtKRnN5M6nljDNO/RZNZTsA2HjVAfwMnV
         nZUA==
X-Gm-Message-State: AOJu0YwfSmX00Z/8gEHW/CjZvCyFEof4lvzing/JhSKraAGEY8AB5Q+X
	MtVRQKosNhjc5TAYuh69giAM7ipt/Oy/9EdA2ho01n3A1ZxndAD2htJ/muVpB5j4iws=
X-Gm-Gg: ASbGnct1Ya6uVcDTcnEZ7FJzAZPZKPDvoM+vYU6eFLlpOrJvexymqUCwk82T/imyuZz
	svKmHGX6jgDwol2ac97ef15kz+DMdo+p9Em/QvTRqAqVXsnk9x0peBWdpjy2eDioYONZ9q0jv7a
	Zx53hwWk0E9mDFknG/664KzB5KP/vtBC8cAoiW2wzyO0WwKBHvtkTXKiHLpnE9SzXtu08oXFXn9
	9qc09srg0Gg06Um1xp5ZpqlKuAxlyP22TeBuYc+rtl/K5MKJeN8+VukeJM/VVDeyBHGAYHElQLp
	eSv88jZAL090+q56pVFjqP1Jgj/6wyiTh0RPecsKwANxuSna7W3zY6pL7knCCf+kYSVe/qc6jPA
	hnCKqPpMo4hDC20LS6w==
X-Google-Smtp-Source: AGHT+IGcJm1mXQDl/cArlppVSaTq7H4cXV1oKCtm0I7gPOnxwJ8/RibyfCM5aVWWqsaeO31u/dWC2Q==
X-Received: by 2002:a05:600c:1ca0:b0:45b:8352:4475 with SMTP id 5b1f17b1804b1-45dddf02148mr141677935e9.36.1757491671063;
        Wed, 10 Sep 2025 01:07:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8247cc6sm17813605e9.12.2025.09.10.01.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 01:07:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 10:07:40 +0200
Subject: [PATCH 3/9] net: stmmac: qcom-ethqos: use generic device
 properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-qcom-sa8255p-emac-v1-3-32a79cf1e668@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2902;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=wKpcSDQ9j5gn7fqOrffdxHVw4IYX35svrsS9hhVY/uU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowTHNyzW1urCJGaZW5gke5O8FSvQ7UnCqZZ8Cj
 PtMPh+GTVyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMExzQAKCRARpy6gFHHX
 cijUEADYjksEkSI3XXPioMcFqFig+ma4t/+cw3XI6Nn8GUS2nhn1HpaO+L3aLWDlpp5xJROdTMv
 qhOiiiZmMvYyeWo9afPRxaDGdjv3fWICRI45x8VoZ/AzPLw4dI5he37GOpfjJ0A2Zin7NKz4RGm
 ywo/NHT79dS+3SvYysaFfL2z/UmW53HGqDG+/UKgL8MivzfgATeROpRpgrHuX30yTqzka9IqDz6
 oP6WqPREVulYKjwg9Y9vD4IraHpFP998xKBmvNbTmIzDGwsV5nSrr0pKdUTJGGt43S9WfI0M14A
 4XvEpZHXEfTv/4QAhz4I/Dr4fuIm5E7yr23MUHOvoChMnkg2QQQIIe/X57J97l4TGYcqcxWODGP
 lEu+ENy9jJONFai4j31aIgckTvTvZ1JbtYKvnkJ/f9cZBYTitZhswBMrFR6xHWqo7bWsWkViCco
 WF+2GsWPRIa2etHizQNLIOw8014zf8qu+czN7Ukj6F3lpuDL3J7yO160HpBpbpNbYFAkXNTm1ur
 bmxcK9UenqvbBpw/k86NlsSSKBSkYYT0MT3X6O3DbHGyu1ZZeBXMLKOThxl2zLamrAbQUH0Ur60
 kbRzFya8F/XeR7LLjBf2Md2r6FJlrQ3W3oBUDyKhgza92D0gllCwL84XdPcfFKVGyuRoK9hTnzA
 M/OfCOjqiEY8BkQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order to drop the dependency on CONFIG_OF, convert all device property
getters from OF-specific to generic device properties and stop pulling
in any linux/of.h symbols.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig             | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 67fa879b1e521ef6d7bd2a8db30d812301eb4cf7..beeca52d4d0f0795d27a2cc35be44d1d4e7d45d2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -125,7 +125,7 @@ config DWMAC_MESON
 config DWMAC_QCOM_ETHQOS
 	tristate "Qualcomm ETHQOS support"
 	default ARCH_QCOM
-	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  Support for the Qualcomm ETHQOS core.
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index d8fd4d8f6ced76cbe198f3d3443084daee151b04..aa4715bc0b3e7ebb8534f6456c29991d2ab3f917 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2018-19, Linaro Limited
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/platform_device.h>
 #include <linux/phy.h>
@@ -764,7 +764,6 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	const struct ethqos_emac_driver_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
@@ -815,7 +814,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	ethqos->mac_base = stmmac_res.addr;
 
-	data = of_device_get_match_data(dev);
+	data = device_get_match_data(dev);
 	ethqos->por = data->por;
 	ethqos->num_por = data->num_por;
 	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
@@ -852,9 +851,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ethqos->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
 	plat_dat->pmt = 1;
-	if (of_property_read_bool(np, "snps,tso"))
+	if (device_property_present(dev, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
-	if (of_device_is_compatible(np, "qcom,qcs404-ethqos"))
+	if (device_is_compatible(dev, "qcom,qcs404-ethqos"))
 		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
 	if (data->has_integrated_pcs)
 		plat_dat->flags |= STMMAC_FLAG_HAS_INTEGRATED_PCS;

-- 
2.48.1


