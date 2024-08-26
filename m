Return-Path: <linux-arm-msm+bounces-29481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF1795EE1C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 12:09:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 934B21C22029
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 10:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68F18153BEE;
	Mon, 26 Aug 2024 10:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uh/2D57l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874AF146A6B
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2024 10:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724666866; cv=none; b=qKH7NJemT+EBedI+8Q9LOo0yacf/k+Nsz/0KDC17kipxPCnyjiKuOxnXf7y54YSX8FcfXPLTMnwoNRQpfohV5rNYvpFPaPJgMA6fTaVS6f3osPD9JpTMn4kl3H+Bad0Z2kdB4a0UOEwYyisNg8XN8A2YnvU+gQhs9V82ipTHIhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724666866; c=relaxed/simple;
	bh=XFJ5tns8gjfvYAtdDyTfcLoPh02DwDwXoBQWVHMfwN4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q/LZEW51gZW00YYjCZ1Tipsi4adPDh9gHXbPPoQMrQshyTYQSlbfUXICpC0mt4fdjc3GeH4Cg0BVkPZcynrfEGvBRP966rYTGB0+ZRYy2NbT5m8WqhwD3ozR0iPXVI1A9shNfUKTu7oJ0iit36hBdpMUyb38XgLvWUB5qtUZszA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uh/2D57l; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42802e90140so1842035e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2024 03:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724666863; x=1725271663; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w76jNQAWt6bAp+W3zUZ22TllXAAFoaq8C3LjT25NtVg=;
        b=Uh/2D57lpjVLaXlMBrMRqr0FKVwJBE6OUgmHzhBbdqb5pCZMO0yTgDBFrUkEcgeDGc
         D6UIrhDEz7ABxqRzYIs5F75Lk/QWb5xVLLgyzhUdJBHrvQcAvkviPBLG7DSI677nLk6f
         1KhS3tDUIsiEjJFDYll0M9wWU+e4R74EFaXcQZ6FH1a+8lhWDIzABuQAv1J4wJ+5q0mD
         79tmKzP/JreFkgipgMsJ4P7m9KUxjY52ka9Zp6Rnr+KlfaFzeIz1BHbBjO6bershWyDe
         q/Id3NXmmIMUCfPbrSMVzayK6KZfSzMjPu5YNhmqvJKIWm2qhZPUr+H8FHuahVKfF5bE
         xEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724666863; x=1725271663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w76jNQAWt6bAp+W3zUZ22TllXAAFoaq8C3LjT25NtVg=;
        b=izSXI2tkNGBJV/BZZ+Fe5NVTUSU7SFW4fNV6kQtjUCGwdIlD0PMKN8tZOU1EaaoYN+
         joG/w0DRQCMDrNqbKiT6hhMc6Ar4geA7zqTZL8AKwNOYFoE/suDIJpIN2lKvuB3FkXXT
         2kOaY2/51FwpD5apC4IIpOdgbIqoO41qkH1VVn8eWdqkl4xmWsB5AwYs0HmWiYl7Qqvm
         9kOH09K/ubx67fWtb58OOpvnBpiWTkbY6nsa0HJfRi4wFDvr0MUF6KikgMeFwq/VEwSY
         G8MDgS0tCXZqWZ5d3rM5NaGeT5rOcjBT1zymxYKybJGZb+amBJz7HaCaXm2ZLmw2c1Yj
         SkTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwLyT35Yf0G651TjPI6eHHrDQsjf23VpdKJ09dPahJFARQE2r52vG9+UIhYN0aBux/tgo631nxMX22XrYL@vger.kernel.org
X-Gm-Message-State: AOJu0YzJJZ/6GrvyN8sSFjDWMhpTAPWnhQ8Yp3H9SX+SHLL7QWNjWvVG
	a3VIZ1nmPc3rggp7tXlhNXAdWrcaeeWQpzJoeTyV2/jS7VUc3i+otetzVLouYyQ=
X-Google-Smtp-Source: AGHT+IExT3kmRSceNRiJcXglO6EQr+JgRlwbktOceZAKBgocM3t4FdK6T71lQ8U1bTjnR+v/YdTdjA==
X-Received: by 2002:a05:600c:1d22:b0:426:6fc0:5910 with SMTP id 5b1f17b1804b1-42acc8d4dabmr44531595e9.1.1724666862755;
        Mon, 26 Aug 2024 03:07:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37308110009sm10324821f8f.18.2024.08.26.03.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 03:07:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 26 Aug 2024 12:07:23 +0200
Subject: [PATCH 07/11] phy: qcom: qmp-pcie-msm8996: Simplify with scoped
 for each OF child loop
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240826-phy-of-node-scope-v1-7-5b4d82582644@linaro.org>
References: <20240826-phy-of-node-scope-v1-0-5b4d82582644@linaro.org>
In-Reply-To: <20240826-phy-of-node-scope-v1-0-5b4d82582644@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1922;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=XFJ5tns8gjfvYAtdDyTfcLoPh02DwDwXoBQWVHMfwN4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmzFPe01E0Dq3KWujpfT2EVykCertsjntcsXBD7
 +xUsNUHtVaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZsxT3gAKCRDBN2bmhouD
 14N3D/47LpfmUaVHVAo6X4RPv0WAxp15k+koHvm3j2dUhTy7ZzV4EXYQECCOfFGsB+CPzxwJwc5
 Lg5d7XwJxs9h5sfcDWf5rvgrpSoPqbgPEgMt3ofDnhmXcpelT+lJwgZ9DxZdGMx46xMNr0PIA63
 1RHnEPF5iJQlH1zjQVUaiUtIoq9H5DtH3i3uF2msnwsgYRl/r11LxSlaBb37HgmubTH0EYr/3aV
 UyG65tricVuY4f7q9XjgSI86CCCoPjiclzQoYKo2Uwrw6e8/kbt6F2TfGwyadrvLyuWdwca9UhY
 NwnzS5Dfc+jtMIm1MG9dX+2Xog9uutXkTRBVyN/JAPUw4COYFxLwvoGdRNFtaK57V96PZF8TduH
 jB74iPXTm5PWTrZQlbhZlAuVbYzjVWL8F6cI62QbCjiJVaZXzJyHlVTCDKTL4a+qKhtQitydsGi
 YymvzTC0L9jX7NsoATfnvbDN5A04ldqhv7gyRHIghP4YZjWk5FGQU4KZC7j3Trdm2SH6aCR6T7G
 jIww5t/cBdwRPzapjcCNHE89Qks4EXKfW8NXS5TysLeSU0okvPw3A9eqJH/YyBqLPBWkmEu06zw
 gciV7L+UwHo++g8M73hfXlCa8sLYeYOySlvoUr+GWhJoZ1IHIl1LMpwU8WGjxFU02xUhUganhfm
 6E0aoiBNZ6ogpTw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
index 5f89e3a3e54f..a7c65cfe31df 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
@@ -725,7 +725,6 @@ static int qmp_pcie_msm8996_probe(struct platform_device *pdev)
 {
 	struct qcom_qmp *qmp;
 	struct device *dev = &pdev->dev;
-	struct device_node *child;
 	struct phy_provider *phy_provider;
 	void __iomem *serdes;
 	const struct qmp_phy_cfg *cfg = NULL;
@@ -773,13 +772,13 @@ static int qmp_pcie_msm8996_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	id = 0;
-	for_each_available_child_of_node(dev->of_node, child) {
+	for_each_available_child_of_node_scoped(dev->of_node, child) {
 		/* Create per-lane phy */
 		ret = qmp_pcie_msm8996_create(dev, child, id, serdes, cfg);
 		if (ret) {
 			dev_err(dev, "failed to create lane%d phy, %d\n",
 				id, ret);
-			goto err_node_put;
+			return ret;
 		}
 
 		/*
@@ -790,7 +789,7 @@ static int qmp_pcie_msm8996_probe(struct platform_device *pdev)
 		if (ret) {
 			dev_err(qmp->dev,
 				"failed to register pipe clock source\n");
-			goto err_node_put;
+			return ret;
 		}
 
 		id++;
@@ -799,10 +798,6 @@ static int qmp_pcie_msm8996_probe(struct platform_device *pdev)
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 
 	return PTR_ERR_OR_ZERO(phy_provider);
-
-err_node_put:
-	of_node_put(child);
-	return ret;
 }
 
 static struct platform_driver qmp_pcie_msm8996_driver = {

-- 
2.43.0


