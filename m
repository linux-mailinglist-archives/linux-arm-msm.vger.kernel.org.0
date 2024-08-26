Return-Path: <linux-arm-msm+bounces-29479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A48895EE18
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 12:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F4F01C220B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 10:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E27B14D457;
	Mon, 26 Aug 2024 10:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CRi5JUYl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E57149C7B
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2024 10:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724666863; cv=none; b=IrDr5I31YILYke1CP2KmfdHrFMiRx/XIlLZkSrCnm4w7JUDLpMI59VHyeAE+YwP43InMLI1viInWTKj7cnHC6tq0ewRLn11b3vMN+Ra7x3JH8dFlXqogpvkXoPrSU6NvxVx/VJFjGpnLzXUl+j8lJl2vq/JCQMkfvZj1034Vd9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724666863; c=relaxed/simple;
	bh=d6YjtlhFoRREw1+Zm7s3VPFYbcnOL8lp7zFl+ncHJGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WVDgfWVeQy+6MTEt6KGetSntEMC21FLDjGKRKZ7D0+aomEu1n1oHHQP0ZJQfk5FHJxDc6aW6yIWj8MWhNwXkktoW2vWwAwvo9A704IkzaH60q9B3hlq/cBmKxjAxOlm6w2W33n/mn/mUGkGsoPUm0YhkUCGc3aVfl7GcfSSmUKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CRi5JUYl; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4280692835dso6308625e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2024 03:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724666860; x=1725271660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0GaYhvDqOLdQ0LiAwBiqvznHKPRO8c0nk7Yc/S2Se7Y=;
        b=CRi5JUYlfSZuZjUXNU+b644Tp3cRKpj+TM4qcZWiBnLKeawiXnogfV5y7cQrKe9+EM
         WPVLf6O6OTyXoCPs8dQVHaNYJbEHlK3kuxa7MXjr4/50F9RJSmHX84dbxRsOQHT14zKw
         T5LHz7fql+aKphY93oUR41E2gluRxlRleROUkULyI8tDNwxIrQfIWvmGHzw6HJ+DqZ+n
         7sq/zSNqyp6+/YedxAjccmd6KG5X2hMsrp8WKKngTyuZpaZXFflXSNze4BCz/fp6UHAd
         4niCK3VjJgp/aLpBttMxhfvTzg6+jI2ycN3xksZvF6uoailwVFOG1eTvZUTv7SbGiayV
         HPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724666860; x=1725271660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0GaYhvDqOLdQ0LiAwBiqvznHKPRO8c0nk7Yc/S2Se7Y=;
        b=eyHx5XG2uUnxIGEWxEW5pkuEiXQ4UV3qj5vOxucm87ZO+tq4y/bxEflZuISlDKNyqJ
         aJAl7aOQvAXSuXy0WVILe5lmN5k1IubAGu+3V/GHb7DEykbivtnYR0LpHO0/wAMVdOrL
         4aH6C7//1l0QnbQBP2yBwuOfkAdRlzI3rT0xGMgAmwpoTSdFh+RUWIgqMTgk88+TrGjH
         +F3Xu7u9FP0auuKvqDWYJh1wQOEjo8wcul3MSND+z6udKHmjUtlepzX4Ul2ZxfP11PQJ
         R5YtJ+8lIzCOSm1M76IvNPLjs9q16TcyVbS+FVzuBPqQWxiiHGlnZTFHivNdlxsrL25U
         ULVw==
X-Forwarded-Encrypted: i=1; AJvYcCX/lRNkYyNu6djouqHx8lquFctm4lqomN/Rz1RgIUXO/fFigY8gxZ5gdsrKYS0rLwTqYTiYXidBUHyk/nNu@vger.kernel.org
X-Gm-Message-State: AOJu0YwY8mYFrUXliCsQl9LBxOTbFGEEfSflpO/sakywi7jTF5Yu7aO8
	4HPWUdksHbPh1qOn9eD4vW9O/ofNzrPUA7+/vH0sE6DkgUs1WlsiOd9yZy96erE=
X-Google-Smtp-Source: AGHT+IHAE0Rm2NAn+4wjgcKvkxwPa4s7aWdk9L4hMBcsuf6xx9Pm4Kt8Ws0+LEPOIoRTC/kzupBvqA==
X-Received: by 2002:a5d:47c2:0:b0:367:9cf7:6df8 with SMTP id ffacd0b85a97d-37311830cd4mr3462928f8f.2.1724666859817;
        Mon, 26 Aug 2024 03:07:39 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37308110009sm10324821f8f.18.2024.08.26.03.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 03:07:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 26 Aug 2024 12:07:21 +0200
Subject: [PATCH 05/11] phy: mediatek: tphy: Simplify with scoped for each
 OF child loop
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240826-phy-of-node-scope-v1-5-5b4d82582644@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2867;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=d6YjtlhFoRREw1+Zm7s3VPFYbcnOL8lp7zFl+ncHJGc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmzFPcISCpOL78DthcvA7n9HD0PjGn3OQrBZ0N6
 9WAbz2hyTiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZsxT3AAKCRDBN2bmhouD
 1/L+EACU8UjoaFd/VCOUIcGc4SNtlfbfC+VIH3e/hLs5GQvLFRRKaw/ctKPrtD5hehNwo8cqZGd
 dbw5yPIsS9sW9/GVW1zLhi2allQ5HZKJqUSsrUXVrFQApwPK++u2IJ33hHv6CIjyLO4vvEbIA6t
 8GJlZuVUzRGxaCTDhPsL4H2HCYaZujr+qRH4DWBOKRD2qqzPpL/JoPlt2TH0+AoJXmHCNW7db9Z
 1utOfTYXSq61lEXGuuZimVJ9TXXnhfRkmH2oq6Xc/0exvXZG1MbWU7CQM4PdG9DreJnFuNLbtap
 ruBReOQDSvd9AHBgC/o8s6E/4+lP3cP5fS0SBki7LgcoegQrMVbw2cEQQZ6xI/eQtuPnpyVxAGJ
 wVVPLZwSvfW539p4NPtF6IFBDj0FJ09mosqDstt/Wc73q5PkaFd7vUoKaMVAKaIvolHFen6oaBO
 i08cuJne7aIPc01MiGV2kCxoUaKV+dNs4UA+prfk8xydUpMvxgAbhyT2nZ6CGVVyaY8hxGgXeFj
 0qZ7duixEF2nhzTlLhFJTLL7v74FlpJ8hM1FiYp/MdMks6Fogf6HycKJkUqanRrymxvL/QD3Q5x
 L3ejj/i3hAyBxNyuZeexLBUMc69HrPnaFYtg8u/Sw524zBA6MpifbyrXCL5tBSGsJhV8BE4OTJD
 IC1QCJiWHP5cqjA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_child_of_node_scoped() when iterating over device
nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/phy/mediatek/phy-mtk-tphy.c | 30 +++++++++++-------------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index 25b86bbb9cec..3f7095ec5978 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -1577,12 +1577,11 @@ static int mtk_tphy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct device_node *child_np;
 	struct phy_provider *provider;
 	struct resource *sif_res;
 	struct mtk_tphy *tphy;
 	struct resource res;
-	int port, retval;
+	int port;
 
 	tphy = devm_kzalloc(dev, sizeof(*tphy), GFP_KERNEL);
 	if (!tphy)
@@ -1623,25 +1622,23 @@ static int mtk_tphy_probe(struct platform_device *pdev)
 	}
 
 	port = 0;
-	for_each_child_of_node(np, child_np) {
+	for_each_child_of_node_scoped(np, child_np) {
 		struct mtk_phy_instance *instance;
 		struct clk_bulk_data *clks;
 		struct device *subdev;
 		struct phy *phy;
+		int retval;
 
 		instance = devm_kzalloc(dev, sizeof(*instance), GFP_KERNEL);
-		if (!instance) {
-			retval = -ENOMEM;
-			goto put_child;
-		}
+		if (!instance)
+			return -ENOMEM;
 
 		tphy->phys[port] = instance;
 
 		phy = devm_phy_create(dev, child_np, &mtk_tphy_ops);
 		if (IS_ERR(phy)) {
 			dev_err(dev, "failed to create phy\n");
-			retval = PTR_ERR(phy);
-			goto put_child;
+			return PTR_ERR(phy);
 		}
 
 		subdev = &phy->dev;
@@ -1649,14 +1646,12 @@ static int mtk_tphy_probe(struct platform_device *pdev)
 		if (retval) {
 			dev_err(subdev, "failed to get address resource(id-%d)\n",
 				port);
-			goto put_child;
+			return retval;
 		}
 
 		instance->port_base = devm_ioremap_resource(subdev, &res);
-		if (IS_ERR(instance->port_base)) {
-			retval = PTR_ERR(instance->port_base);
-			goto put_child;
-		}
+		if (IS_ERR(instance->port_base))
+			return PTR_ERR(instance->port_base);
 
 		instance->phy = phy;
 		instance->index = port;
@@ -1668,19 +1663,16 @@ static int mtk_tphy_probe(struct platform_device *pdev)
 		clks[1].id = "da_ref";  /* analog clock */
 		retval = devm_clk_bulk_get_optional(subdev, TPHY_CLKS_CNT, clks);
 		if (retval)
-			goto put_child;
+			return retval;
 
 		retval = phy_type_syscon_get(instance, child_np);
 		if (retval)
-			goto put_child;
+			return retval;
 	}
 
 	provider = devm_of_phy_provider_register(dev, mtk_phy_xlate);
 
 	return PTR_ERR_OR_ZERO(provider);
-put_child:
-	of_node_put(child_np);
-	return retval;
 }
 
 static struct platform_driver mtk_tphy_driver = {

-- 
2.43.0


