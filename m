Return-Path: <linux-arm-msm+bounces-29482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 631A095EE20
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 12:09:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86A661C21F3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 10:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBACB154C0E;
	Mon, 26 Aug 2024 10:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qh8MCo7x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1731537DA
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2024 10:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724666867; cv=none; b=Y0dId6g3twprkaBWMvG4lE1BUqbfjL4dbA7HssrSbxAmajA8fLCiFmh4nWvaAErTDprmgrRGAm1hylj3FrHNNy874L0a2ndb7mab/zi3UPXrdH+v9kLps6sxrj8j6lcZHx10ev7Y1aPkH1wZ2QYQkpumxM9E78Tf570qRfKQwYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724666867; c=relaxed/simple;
	bh=q84FqGekrYD8KTQs5gy+VU5Crg5qXmyLk1XObeFSfeo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Abaqew7o5L0UnJ+cUF7xLCyi9wPrl4gyrGNrNv4TNphu2yPB0zkqlGrMisfYHlfUpmqFu5d6p+QnHvVkGrShgenGZA3ryLfTE7ZDMnby9j2Wtzd8yAlIOuTg6c8ltD6IIs5HxJUKHY7whFCc77LlyuU3Iy9xeWXtxRn1ev9nXm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qh8MCo7x; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4280921baa2so4588305e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2024 03:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724666864; x=1725271664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJH7gzL1aTMd1FSl3D4skxiHp7HFb4KrCiWKLzsaldQ=;
        b=qh8MCo7x8CUvIVyXB1dEJGWcsfqcfc0bxsJqXdpb2R7Die5QJYlLPLLvisEYIK8/oa
         l2bXC8os1xco55vukXDZ9UqkP2vimNC+JkmEqvWUqtKoCG3TZr8syVBngdoo5PMnEM3R
         1dT+UgtbHG3cXQiCale1wxfo2oQzP3+Xn53+CPzI7w7p129gWNii/KT5d25iFjQ5Yuc6
         NNKgF/uUdaAafjiUyaIiOzjHgBaZNyBpHDxqdsYKPKPRtmfkxYT1i836sGGaDzuY5maT
         m7ZV5WmcCC+DfsG8GVUAAU4/Xnb4x36VromVI8mBAgGe7JdWIvUNgDB4OrAKlHNtZmXj
         vVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724666864; x=1725271664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LJH7gzL1aTMd1FSl3D4skxiHp7HFb4KrCiWKLzsaldQ=;
        b=WIBZiXfhafTo0GCvPuya5NUOx3kV3YhMLHhbxVE0vKMQaD4ywZ1a7exva9zNBA3dQe
         v92gG+UfjZGi4L6pgeFk/hYAkRWjt1HTVdbLTibm46LNqX5KepCMAJj7oLDDofs5Tj4Q
         MP6ZIz7XjPB0gJIjOrO5Ct8EDVb82xckqEd8w32whh1y+Ks69DBG7cmvCgwd140gvXHW
         7G0vj4tR27G3YQbeRyzaQYbRW0Tm25+hnp11MOWuOcJFTQSGngsjAsziI7Yd6gij8Enc
         gmDoTzLN7EVLDDkaYs1/ihpvhkJnS+BqXRzI5W8Eo+o8yRs0nolnsVP1euFV/kxHZt7L
         Fseg==
X-Forwarded-Encrypted: i=1; AJvYcCVOda/JLNSTm4VhDgLVLTGp4YQR6DKnysalIDe+mIibiOtqDLfy0M2G3O9apJgR7xvQ2kGGAYLopagHfy4I@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6++yDdjmiKZx2xx0C4M+j1qjSf/T4Hk6MBrXmjR0Nx9F4H6Ij
	QDeUPiQlDk+Ca4fSTjJTtA6h0OHUokjuoAMLTcevem+tjhrcHuyRWcSv3M5dJJE=
X-Google-Smtp-Source: AGHT+IE7gdrYrwOwPxXE//4QC856859teFRpRbc14X0LTKkOSDn4Vd45gs5Ik+WW2PRPGPps93azfw==
X-Received: by 2002:a5d:6d05:0:b0:367:9495:9016 with SMTP id ffacd0b85a97d-373118e9996mr3690028f8f.6.1724666864363;
        Mon, 26 Aug 2024 03:07:44 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37308110009sm10324821f8f.18.2024.08.26.03.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 03:07:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 26 Aug 2024 12:07:24 +0200
Subject: [PATCH 08/11] phy: ti: am654-serdes: Use scoped device node
 handling to simplify error paths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240826-phy-of-node-scope-v1-8-5b4d82582644@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3499;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=q84FqGekrYD8KTQs5gy+VU5Crg5qXmyLk1XObeFSfeo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmzFPftx77rNEmy2lKEvE6nmjyeiGM/8vxfHVk3
 1Qxt9hxkm6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZsxT3wAKCRDBN2bmhouD
 17VdEACDE8+ajTSInapKgMwIRqo7PrspygrbulFRV7MG7gYQuFB9ZYxJChAIKilDS3tY/vSm+mm
 zka8Y2ZfUndSHX5z1j9a0k9HqItYyRBcF15JckSJS39yViVxdnO2So3JwRhp9ohH5RcBNLCgWXi
 oAXJD/xxYm8NoZluxZwpKr/P+e1DxZ/iTxE36qxsdmc0i5K1Lyv2MrhIccKiE5GNghuU21Qlmon
 pjYkvu95DSOsN4sCjuZ6mLJcHSJqSBMd+nTvI7o5AzdlCw32ewr/agT640du/9fH193lr4/juHX
 7I9KUOrV85awMCb205jQ9OkoqUV6T6Z6UjBzZgmfXUjW/AF/fIv4rwgpzTPwQq7FHLWhwmlSmMj
 O5s0De/VhSO0k8dVIg3Yj8JfcgA1eQ0JiMQFWsD358pPj/Cyx5IPK+rGGImuSWRwtuNVhQg2mDB
 tE2t9r3u+tYrCEA2qG8TnKtaj6PXKYOnFKzf01e3TWiDxsfmOE8Zrwrqbt2ctFhMNWRiUBPq14v
 UEnylJsz6b9bx/vDX3iMxSKEspCoL2hXH/uh3PTBa0BxgKi/Wc34u84+oxNf9A2BetAzxMFu3E+
 e1Ixc5zUX13AWl2KIQKnaC3M6hN8dT8k/BSTRE2enP0v6cWf41IzSjaNnlu4SyqhTbjuV7gKNdX
 eHb/19T7Mf/oiQg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Unlike in other typical of_node_get+syscon_node_to_regmap cases, the
reference cannot be dropped immediately after syscon_node_to_regmap(),
because further part of probe() uses it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/phy/ti/phy-am654-serdes.c | 50 +++++++++++++--------------------------
 1 file changed, 17 insertions(+), 33 deletions(-)

diff --git a/drivers/phy/ti/phy-am654-serdes.c b/drivers/phy/ti/phy-am654-serdes.c
index 673449607c02..3bf3aff4b1c7 100644
--- a/drivers/phy/ti/phy-am654-serdes.c
+++ b/drivers/phy/ti/phy-am654-serdes.c
@@ -7,6 +7,7 @@
  */
 
 #include <dt-bindings/phy/phy.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
@@ -644,7 +645,6 @@ static int serdes_am654_clk_register(struct serdes_am654 *am654_phy,
 	struct device_node *node = am654_phy->of_node;
 	struct device *dev = am654_phy->dev;
 	struct serdes_am654_clk_mux *mux;
-	struct device_node *regmap_node;
 	const char **parent_names;
 	struct clk_init_data *init;
 	unsigned int num_parents;
@@ -652,7 +652,6 @@ static int serdes_am654_clk_register(struct serdes_am654 *am654_phy,
 	const __be32 *addr;
 	unsigned int reg;
 	struct clk *clk;
-	int ret = 0;
 
 	mux = devm_kzalloc(dev, sizeof(*mux), GFP_KERNEL);
 	if (!mux)
@@ -660,41 +659,30 @@ static int serdes_am654_clk_register(struct serdes_am654 *am654_phy,
 
 	init = &mux->clk_data;
 
-	regmap_node = of_parse_phandle(node, "ti,serdes-clk", 0);
-	if (!regmap_node) {
-		dev_err(dev, "Fail to get serdes-clk node\n");
-		ret = -ENODEV;
-		goto out_put_node;
-	}
+	struct device_node *regmap_node __free(device_node) =
+		of_parse_phandle(node, "ti,serdes-clk", 0);
+	if (!regmap_node)
+		return dev_err_probe(dev, -ENODEV, "Fail to get serdes-clk node\n");
 
 	regmap = syscon_node_to_regmap(regmap_node->parent);
-	if (IS_ERR(regmap)) {
-		dev_err(dev, "Fail to get Syscon regmap\n");
-		ret = PTR_ERR(regmap);
-		goto out_put_node;
-	}
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "Fail to get Syscon regmap\n");
 
 	num_parents = of_clk_get_parent_count(node);
-	if (num_parents < 2) {
-		dev_err(dev, "SERDES clock must have parents\n");
-		ret = -EINVAL;
-		goto out_put_node;
-	}
+	if (num_parents < 2)
+		return dev_err_probe(dev, -EINVAL, "SERDES clock must have parents\n");
 
 	parent_names = devm_kzalloc(dev, (sizeof(char *) * num_parents),
 				    GFP_KERNEL);
-	if (!parent_names) {
-		ret = -ENOMEM;
-		goto out_put_node;
-	}
+	if (!parent_names)
+		return -ENOMEM;
 
 	of_clk_parent_fill(node, parent_names, num_parents);
 
 	addr = of_get_address(regmap_node, 0, NULL, NULL);
-	if (!addr) {
-		ret = -EINVAL;
-		goto out_put_node;
-	}
+	if (!addr)
+		return -EINVAL;
 
 	reg = be32_to_cpu(*addr);
 
@@ -710,16 +698,12 @@ static int serdes_am654_clk_register(struct serdes_am654 *am654_phy,
 	mux->hw.init = init;
 
 	clk = devm_clk_register(dev, &mux->hw);
-	if (IS_ERR(clk)) {
-		ret = PTR_ERR(clk);
-		goto out_put_node;
-	}
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
 
 	am654_phy->clks[clock_num] = clk;
 
-out_put_node:
-	of_node_put(regmap_node);
-	return ret;
+	return 0;
 }
 
 static const struct of_device_id serdes_am654_id_table[] = {

-- 
2.43.0


