Return-Path: <linux-arm-msm+bounces-29477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCD295EE14
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 12:08:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5058C1F231C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 10:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FFFE14883F;
	Mon, 26 Aug 2024 10:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G5YeJIc+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF6B1474C9
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2024 10:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724666860; cv=none; b=dsoQKYOP7a8N9jCekQ6Mu3N57xH6+Y+TR1xjlCr890rgPZmxxW1wnxVcnItpKldcbZir3CoK5aMMJjDMExfiMSF6DYunpVSLnPbj5eq+jJB19YCBF9hVtnxr+BBTU1g4WjFlbIojmFJrW0SMDH9HP/BaNct/YvQ8edc7uKoyjYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724666860; c=relaxed/simple;
	bh=jtNLroZp6oDWwv/KZ3xoT8RtBVpmgjpirqt/ibFxI8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BFSX+jkoBywJVR4RXbHOowykqcMPMrkJwmfq37d/oZCzpjoWz2RQ7V2z5VpR4r7WUxIBr+R2j/szEm49zpPiCDj4XsqtLBxJFYq689+ilfYOv/SGvQAqkSpLWniaOLfzKeN5Ed4FJMjG2PAgPi99TXCD7yYciRuyhe5MF9xVtcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G5YeJIc+; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4280ef642fbso5130685e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2024 03:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724666857; x=1725271657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3WbdwJwMzGd487Jm58/6IPAFGaqbJVFIEVy/1bU3kBU=;
        b=G5YeJIc+ZTSh0Qx8O1FIG6/NFImOGHNgaraIa0qz8byyrjrGepsAnz6sGi4OET/ocZ
         Dd7Y8+RoSb/OFM90eRDvHDzRvORrNqoQaxMtSqn7/16D3NkAHDgqJTv18WimodpqutZN
         zwn8yfZgWYCpBS1OapjT7Ww2XwD3XoACMV1KQFYMaD7YzKfW9faKhxL39tBEk9SLKjpZ
         6HzyTPz7xTFkzRVgGjQ0CVtTby4rCy6P56ZxZp/qszFC2HdgeY5b5/9PvE6hVkJdCTm/
         MlkyxsVbFX3gBaQU5GIRhONJWNfQfZkICCTL6yH74GjayenVSWzoJ5wzg0TTooENl7Xp
         LvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724666857; x=1725271657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3WbdwJwMzGd487Jm58/6IPAFGaqbJVFIEVy/1bU3kBU=;
        b=f+fnY6on9xpjx81+Mu1ZMLQ9YcqbGyZE7a67cuUY4UNMhvovlVXpO2zerlYRsOo/Tn
         s7ee0BbjYlaCeS+wpCcvQAV/foFPjjXibnhy+p9j1DTWsq1JWZ7o1GrRdYPIfBW3OwJd
         9h9GW4TPPLdtvLs4bAGG/OMNSuVPCft0xpTv5ltqbSBby2PQ4+FaBsgGo753A6es6V5y
         aRVpWiRtlNPi8BI91JA34UyYvgiFOxhSyuSX2ctOAw6fXZDPrXB9UzPSwY33ZvBHxs2U
         HjZlspF3R2sCthfsqN1cYVhjly9AcIgK6hY7CIPyfgLwAhrRRPP7EfWKdCS109xvbjlB
         zJIw==
X-Forwarded-Encrypted: i=1; AJvYcCWmD2Km20+z6nA8TSJL7B8Xuqvdayb/2aeqd+/IHcYeappfU2yPgzILonWXkXyQOXLIBXeEVIiW6QpahbiX@vger.kernel.org
X-Gm-Message-State: AOJu0YwAVNiDhMeJVLyybpLQQ1VTHH8BCmmTFtWJy6GAcmaOYBji/EJd
	TnCtqUNsXZxlz9NM7kEz+rDpf/dj81sHknsfgHAH1+Eq9ZQ2KRkkryLdPMPJkXI=
X-Google-Smtp-Source: AGHT+IFklH3Ny9t7GPphcYtSHUeO9OqMZPPFfYRC9xfJkhjaSEMhKLJDJuN0g5pcthbBx7LS51ulDQ==
X-Received: by 2002:a5d:648e:0:b0:373:6bf:9608 with SMTP id ffacd0b85a97d-37311843370mr3729073f8f.2.1724666856869;
        Mon, 26 Aug 2024 03:07:36 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37308110009sm10324821f8f.18.2024.08.26.03.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 03:07:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 26 Aug 2024 12:07:19 +0200
Subject: [PATCH 03/11] phy: cadence: sierra: Simplify with scoped for each
 OF child loop
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240826-phy-of-node-scope-v1-3-5b4d82582644@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2013;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=jtNLroZp6oDWwv/KZ3xoT8RtBVpmgjpirqt/ibFxI8s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmzFPbbKpPHL6GdF5Qqk8rC/GGGrQ4Hh1ZvCtrZ
 cPY7A2jkAWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZsxT2wAKCRDBN2bmhouD
 15SfD/9OO/+x3tuIvYd/WbnMT1CUTEf/bF9MuCLRDZpGzwZ8G5dCifwH0FuB5yPntS+hAZlBHp3
 uIrluv46zJ/Bwsu8eq55BNiIRX2jDecimSOcjXpQndqjiK0v11mZqrpzbFr0PFZcxC2LdszLC9j
 /1mXPHAhb7CRvCnzKAieTGIY0RA+XP2H0vmzYIQLoc4P7pX19VuxzJhn1pz3CAxAS5qu/iHf5EE
 7MfJDnYLKjy48xxkuXs2K2x7jfQv1rBa400T84DoO34MI6A/CxhYEvclBvEVotu+W2zY6x+C+ek
 QcfKOYnaW1fgCgbA6BpD64ycS2PLcs0Sa+U9KCaaxGkMFF3wcsTeHQ8medG4dhIrzRPyKTMyPkt
 VluPLHFOHLDew0KlZGSnd2Q1ksOGy+/45S1Oco+2jKUJKyOaiVhsS21scCBagibIWtRLLGHlDid
 JUVnWiX9yv436GZxILEaeALTUJZbn7NOJUcZK/mcLgVLcaG46CZnZgF+iw7uv1WpwIAUqXkaUpM
 bnfiSwO5YAEdHESCbWUmxilRSIntxrgzfEhTmEipYjHtmtGNX7nO0ZtShMAiKmpIsqb1+g8nxXE
 Vl6HFgHWsh5qYz0LpYb7xlW7AmzeV+0LqjatoYQECv4pDCWf/rZiuC8oqhQw3mBeO4gq/qcGhbr
 2ZWDAaRAwHdBApA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/phy/cadence/phy-cadence-sierra.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/cadence/phy-cadence-sierra.c b/drivers/phy/cadence/phy-cadence-sierra.c
index 3010c9f24136..aeec6eb6be23 100644
--- a/drivers/phy/cadence/phy-cadence-sierra.c
+++ b/drivers/phy/cadence/phy-cadence-sierra.c
@@ -1366,7 +1366,7 @@ static int cdns_sierra_phy_probe(struct platform_device *pdev)
 	unsigned int id_value;
 	int ret, node = 0;
 	void __iomem *base;
-	struct device_node *dn = dev->of_node, *child;
+	struct device_node *dn = dev->of_node;
 
 	if (of_get_child_count(dn) == 0)
 		return -ENODEV;
@@ -1438,7 +1438,7 @@ static int cdns_sierra_phy_probe(struct platform_device *pdev)
 
 	sp->autoconf = of_property_read_bool(dn, "cdns,autoconf");
 
-	for_each_available_child_of_node(dn, child) {
+	for_each_available_child_of_node_scoped(dn, child) {
 		struct phy *gphy;
 
 		if (!(of_node_name_eq(child, "phy") ||
@@ -1452,7 +1452,6 @@ static int cdns_sierra_phy_probe(struct platform_device *pdev)
 			dev_err(dev, "failed to get reset %s\n",
 				child->full_name);
 			ret = PTR_ERR(sp->phys[node].lnk_rst);
-			of_node_put(child);
 			goto put_control;
 		}
 
@@ -1461,7 +1460,6 @@ static int cdns_sierra_phy_probe(struct platform_device *pdev)
 			if (ret) {
 				dev_err(dev, "missing property in node %s\n",
 					child->name);
-				of_node_put(child);
 				reset_control_put(sp->phys[node].lnk_rst);
 				goto put_control;
 			}
@@ -1475,7 +1473,6 @@ static int cdns_sierra_phy_probe(struct platform_device *pdev)
 			gphy = devm_phy_create(dev, child, &noop_ops);
 		if (IS_ERR(gphy)) {
 			ret = PTR_ERR(gphy);
-			of_node_put(child);
 			reset_control_put(sp->phys[node].lnk_rst);
 			goto put_control;
 		}

-- 
2.43.0


