Return-Path: <linux-arm-msm+bounces-29484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C59A295EE24
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 12:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 03C931C21FFD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 10:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCBCC15575E;
	Mon, 26 Aug 2024 10:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FSHMGzAb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF75B155342
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2024 10:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724666870; cv=none; b=BpZV7UcsBhy+UhGJKHNrWOo2VyEm+VzvXKnnMrbskLX4JBIUyEcxvtZIYevsHjnqv20G3UWfPTSQKQIVU+GBTZuJLfkEInaqNbMbXLdJTtNXJXBfspjECOfYux4dZzZYE12AFUqa75iEydZdZ+Cl0qx6DW5mwM/A2El3yLTMSq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724666870; c=relaxed/simple;
	bh=CGi3eChPu6bG3w6Fr69D9qqrpc9tkyPX1aqBhqlWnMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XQLNvKOSSsdySCbr8hYIII44csUM8QXtNog6YtAiLrlVwu/J70NADxl6Ab7kmeufyd/ajfEspUWgLM4X4/dH3qvK1A45VA6qomAEUwplcSgalZ2h9wPChCg8vZQlL5cu5m7JdjVZ1R9isLzZkug5YI5GqfEo8ZGZvqDE6OputdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FSHMGzAb; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-428098e2b3bso4585875e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2024 03:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724666867; x=1725271667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yaF6QgfmysOfNqqYP+GDxy50eaU5ex1zhyz/GA1ShuE=;
        b=FSHMGzAbvRAxzOeyKFbIa9GEIqY46yHh6oiWItd5ySo+lgB8wk/3iaCw6y9PU3uglY
         q3IiUK4JqJdtYSTCGb8/X4sTE2pl3UDdnBlsOM2kYrd7ZkZzdmT637nOZJ/DVE+stfUi
         aR+D1ocZCUCp/B2qaqMSTxk5tG4q0yHCQ0BB7X0v8k0bu886m5qimMpU4DNO5Ei+JVuF
         XELZx2DMvlJxNNTTZOBt4dh4F4FjKE72vLT01bnhkvtxEHFAhEVUmXz7fN8t0eq92OU1
         IDuXJSeGtHaQjqUfkJ8+E5lFysJQBzRwpAHKEPdQZC+UqZnu6WFOSLjBuEj6JBBnJDUp
         as6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724666867; x=1725271667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yaF6QgfmysOfNqqYP+GDxy50eaU5ex1zhyz/GA1ShuE=;
        b=X28mNOuquwXKl4tpZO4GfiOJHoSrB3s1KOS42CnKxZG9VfzazSF8C2gF6JOio5Ea6i
         e+fsfNWD9KBHxGtL3FXf2HVHJbiHg3gUIJP3qn05IqYOsOguCUJ8sgLspipDpk8EEWVf
         3Eku4U9XFz9aM7N1lZs96Hezm2md64Q3CugAW7v3DJCGuIlKnqQsvTCr5FtxkZon8Ukg
         OCm2sg81uq+iWvyvzai7IlZYc7+vqP3koy4Xakn7YDvEcZ80qMe0Fcnpr2XF9AWDAoMo
         xv5DTRK7Dh+KJIcKmGhnPi7cVJw2VkH7ZD/Nrzl41hXmhxoUBUfOJcevvxY7d0sgZoSu
         4jZw==
X-Forwarded-Encrypted: i=1; AJvYcCUFELqXhKQST8h+B1JKVwmjMXC9mB22TelsRzt5etVqnWZ0UxevKZ8MM78yUcWtybLBDNYebVGJkU+5W/BP@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7fe610Ehp2VgS81RHI307ggu7poulZZoU86ftDgPjHRse9pNh
	TH+awb8oGgyS+6vSUVdyO4EdbXRnRdz/vCVBaPszL7ONi5VNGnDEIrqQhNtmL8Y=
X-Google-Smtp-Source: AGHT+IGDefyzo8TsCXur56zPbKTgs1i3KNs13szZdv7eh34y9pnC9KoDGsSP7j4E6LCU4dV5ibI1VQ==
X-Received: by 2002:a5d:5f8b:0:b0:36d:1d66:554f with SMTP id ffacd0b85a97d-3731185d6camr3670405f8f.3.1724666867264;
        Mon, 26 Aug 2024 03:07:47 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37308110009sm10324821f8f.18.2024.08.26.03.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 03:07:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 26 Aug 2024 12:07:26 +0200
Subject: [PATCH 10/11] phy: ti: j721e-wiz: Drop OF node reference earlier
 for simpler code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240826-phy-of-node-scope-v1-10-5b4d82582644@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1418;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=CGi3eChPu6bG3w6Fr69D9qqrpc9tkyPX1aqBhqlWnMU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmzFPhm3oloo7An+9It60VuGZ15r9nzj27gw1sL
 o+oziWrijOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZsxT4QAKCRDBN2bmhouD
 118PEACOxoXjL+n59/jWzY3jIoc47J0kYcJAz7/l0WpzV8SwV//9ZGWaY3j9nMj4+KlF8m83BYR
 /d0i3XgYzbe4JM5lTAyPt+JpgZOHFe1xBngHAbYEmqxkzIxdbbt0HTUf3yoQO3Gl83y3hJReJus
 1Zf4et4qDhqK1TALW+ssqeI7HQ1NmEz+kXDHs5vg5Zh6Ckap3OgX0pBBIcmOd/Vk4UJZtW8V07P
 eAMZRFjmHfZMERh+ZLLdSuC+zmhMRSjPkgmYYLKUqeBlJxrPXnBXmuc6NmogmtSB3FBEo6tKYre
 9MnI03e22jWdETGojV2nKsIza98/EJY46aJO6bw7tLLdpoYbf1Plnau+Q/gKqu0r+hUFoJZCNPG
 vjHlwymMO+fGbK3/eb6MZdYm83S+4LJWrw4Q7HUJ3vUpCqXaJorZ90sezTGLBjj27xDN3ZTCYIv
 nXPxjRph97i0JkBpObEXsprCqFtyzJ08U+aivTVc+yLbCRHYaJDn7ADj02vRe0IDLPhz4hOs3A8
 007ysTXKxr6urRswGzhWU/Rvrqil0rbl1Ncc6MxpSKVj35tgMfXfAZScXYcJTHeieRxgTSoRT38
 lckyAklBZe8SbXTt5GKDUC3KrYjlik33r9bTXo7ft514cU5IUKBz1dnKj+daq2MbTTasQ4cR692
 Tkb6i7/a0aURvFA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Drop OF node reference immediately after using it in
syscon_node_to_regmap(), which is both simpler and typical/expected
code pattern.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/phy/ti/phy-j721e-wiz.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/ti/phy-j721e-wiz.c b/drivers/phy/ti/phy-j721e-wiz.c
index bb16fdfe63df..d0f3ead3fc80 100644
--- a/drivers/phy/ti/phy-j721e-wiz.c
+++ b/drivers/phy/ti/phy-j721e-wiz.c
@@ -1179,14 +1179,13 @@ static int wiz_clock_probe(struct wiz *wiz, struct device_node *node)
 
 		ret = wiz_mux_of_clk_register(wiz, clk_node, wiz->mux_sel_field[i],
 					      clk_mux_sel[i].table);
+		of_node_put(clk_node);
 		if (ret) {
 			dev_err_probe(dev, ret, "Failed to register %s clock\n",
 				      node_name);
-			of_node_put(clk_node);
 			goto err;
 		}
 
-		of_node_put(clk_node);
 	}
 
 	for (i = 0; i < wiz->clk_div_sel_num; i++) {
@@ -1199,14 +1198,12 @@ static int wiz_clock_probe(struct wiz *wiz, struct device_node *node)
 
 		ret = wiz_div_clk_register(wiz, clk_node, wiz->div_sel_field[i],
 					   clk_div_sel[i].table);
+		of_node_put(clk_node);
 		if (ret) {
 			dev_err_probe(dev, ret, "Failed to register %s clock\n",
 				      node_name);
-			of_node_put(clk_node);
 			goto err;
 		}
-
-		of_node_put(clk_node);
 	}
 
 	return 0;

-- 
2.43.0


