Return-Path: <linux-arm-msm+bounces-29475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0E195EE10
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 12:07:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE74BB21302
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 10:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D556E146D6F;
	Mon, 26 Aug 2024 10:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aqZqbE8b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E261A145FE4
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2024 10:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724666857; cv=none; b=O2M01xnWo0WLVJ52fxBtEz1K5SJQeIzD2/RL9rSr1zw5aXiKaJRGHnjjIWpxymj0ogxc/REUQXOXymrMRFzYx1f9PG2Svf/VAuHXeXfM14pbWBXCg7UNB6otNlZPHVZtP0yz0jVaUDo/1WV7ZKBvlhhzbSKlAXX0nN9qavJxKKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724666857; c=relaxed/simple;
	bh=TpIPQN7XozxtTe7qsA1gv0aDxiJmfS+D7twYSKLPk5Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R53rB02SYQBimcX2xZ3G2cruaHQDTxL+8TORa58GhUPOcwpAXZctG2Qjtihjg4X4c8uewssLkuzqM3u3eq/D6ZjvzJSf1WZOlau2PI/XQ1QARtP+TkxlnyPbajGzoWr/8DBhdrDF5iiyazUBhh+cCY/LJ6IsZVFBj/noQB4m9Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aqZqbE8b; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4280692835dso6308415e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2024 03:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724666854; x=1725271654; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/DdzSA0vze8jJF7vX2SLvT3UgFzgudCA7IbUx1PMAI=;
        b=aqZqbE8bY4V/pNsxWsQamQduzAA/BAlvYhdnd2Zq7s81qicw9l/uDqM+e8TlLVTgLe
         BcvzuEWEtZwT0KFwNu8uu8jQnZWdBFQxDh7ZOfg4rcSi8Tf20nSrAJ0tdX211mKh41g/
         yyy46G/NU4P7cA/3C9ChQPQSMFYK/CoTrkX3JY4tA8YD0x7NKrx6/zO13lMCaDifUGuZ
         rsf0NZTLZI0S938yAdYGgpBIqf/aoD16XJkm0AOl/MnYusmWWWme8D3gi6VUei8n7Oew
         EaOScyYafXQE9yYrtKFXTVU8IaYZ3DYdqX9h1n2g3mova/G6WjJ7fWA4d9QLSo1lQKPs
         VpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724666854; x=1725271654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/DdzSA0vze8jJF7vX2SLvT3UgFzgudCA7IbUx1PMAI=;
        b=ftqNxTuWprRnTQSWQeIEpSnjBPLS5p/dPO9/MnIoYMKD6GgsFgm9MetARDN5oRZu1l
         BGs3vD3NS3JBaj6SKtdoIjt6dqbToBaa3FeUtMI/nHWTz2YM7qcdMOsFX2WZ+P/zJx+0
         cFZeksC0/x2ebS/MVTJNtTZtW+wfxhZrj3CA11WeupPsK42Sqo+T1QQbIaSU+lOLWjql
         5cdKt+5oSH/MHpnyoav2ODJ/AodYUt8rdGTyc2CM8ks59ChroTSZcaSxLvaMg+X0Hmjw
         5RgSmebWyKPjTlMmdGQVdw9r+UilUdLZI2nHor2IEqLAUzwLLj2oLPeM0g3wEMSCd87t
         3x6g==
X-Forwarded-Encrypted: i=1; AJvYcCVy4LvpJ18GdTA6SpbEFBmtQ/Vxemt7ICrYG7JI1bajBht0lGdn1zDBG+XGenXx+4bf/DB4hpjfywGxRVM7@vger.kernel.org
X-Gm-Message-State: AOJu0YzNH7kM2NYYW6mTykgny7ZgIB2swhAl9GQw//bVPJeZv41Mabya
	0o53g8G2VRjMl3FlWQTbhifAuHvtP7lw9a2O7eWaDAobOKW2qn+pAj6T6ipNoaw=
X-Google-Smtp-Source: AGHT+IFCloPHVlipisTPRlj7L/4tT1LnRxXBniUHPmcalUaiFibCVkfryo9gCkJju4XSIkj5WwU/1g==
X-Received: by 2002:a05:6000:154f:b0:371:730c:b0 with SMTP id ffacd0b85a97d-373118b5e0amr3921043f8f.5.1724666854063;
        Mon, 26 Aug 2024 03:07:34 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37308110009sm10324821f8f.18.2024.08.26.03.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 03:07:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 26 Aug 2024 12:07:17 +0200
Subject: [PATCH 01/11] phy: broadcom: bcm-cygnus-pcie: Simplify with scoped
 for each OF child loop
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240826-phy-of-node-scope-v1-1-5b4d82582644@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2359;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=TpIPQN7XozxtTe7qsA1gv0aDxiJmfS+D7twYSKLPk5Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmzFPZPsNHfRqaWN7YWNfr2xfCg/Ckdjq6GIWH9
 BAyU2h1RcKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZsxT2QAKCRDBN2bmhouD
 129nD/9VqOSzQXsR+Oo8j0WtHebQVSWq/Nu9rJNndOKdLXNRZ5htUwQmDUASfOxefNbc/4/Y2nj
 leHbwHrisD89b1WugrAkPOOzmyfMpMFw5bEEHeeHkI3AVHrzrt4Al1zj1qkHc70iR00gs+ELyUX
 2VfIS6XW9NLIFlEHX03DPl5xvVc4x/7xQyanGYmh6eFVxM2izPCBTK+K9vkIj2qtclovgLrNTie
 KmncHhcBLslYvJKEef7dioNPu33lEMhw9+7CGrG+zgCBaaGqGUS3MisioaFN644cMhSi+qDhrz3
 HGLji6BcmVQUjd7t0FgLhAZUx4GH2bKxj9WtLErzerzj0cOOlVOLhDGTniGfC+R6sdGbwKtuzOS
 jo25+LfkcVHVR3Bg4JZOVeH7EF6m3NGGmULvHf5ZtXALU3BTFClcJK3rO/8t0rBOGiAPv4ku8LR
 9PT16AIvtCMXq4rlbLtdd36Kb9coYjfvsK3/Eb5J9+eRyVAO6+T0xj/qkFwqghcv6xjZrn8FoMd
 dh0aGhv7r2JqiKoYCNqT+JL9jYI/UXBF39X2dk5ekyjEXuZRM8idspON3hIdFs22m/JCIDS5uB/
 yYjbGZVPLtKC0EdrJ2ZtkEOhhPuY9mPt3D1oTIpRH3oFSzWD0mqDGwOyB5u6OXTbPWn+xTwvSR9
 fB8wOieD0ABnnww==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/phy/broadcom/phy-bcm-cygnus-pcie.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/phy/broadcom/phy-bcm-cygnus-pcie.c b/drivers/phy/broadcom/phy-bcm-cygnus-pcie.c
index cc29b08e49eb..462c61a24ec5 100644
--- a/drivers/phy/broadcom/phy-bcm-cygnus-pcie.c
+++ b/drivers/phy/broadcom/phy-bcm-cygnus-pcie.c
@@ -113,11 +113,10 @@ static const struct phy_ops cygnus_pcie_phy_ops = {
 static int cygnus_pcie_phy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *node = dev->of_node, *child;
+	struct device_node *node = dev->of_node;
 	struct cygnus_pcie_phy_core *core;
 	struct phy_provider *provider;
 	unsigned cnt = 0;
-	int ret;
 
 	if (of_get_child_count(node) == 0) {
 		dev_err(dev, "PHY no child node\n");
@@ -136,35 +135,31 @@ static int cygnus_pcie_phy_probe(struct platform_device *pdev)
 
 	mutex_init(&core->lock);
 
-	for_each_available_child_of_node(node, child) {
+	for_each_available_child_of_node_scoped(node, child) {
 		unsigned int id;
 		struct cygnus_pcie_phy *p;
 
 		if (of_property_read_u32(child, "reg", &id)) {
 			dev_err(dev, "missing reg property for %pOFn\n",
 				child);
-			ret = -EINVAL;
-			goto put_child;
+			return -EINVAL;
 		}
 
 		if (id >= MAX_NUM_PHYS) {
 			dev_err(dev, "invalid PHY id: %u\n", id);
-			ret = -EINVAL;
-			goto put_child;
+			return -EINVAL;
 		}
 
 		if (core->phys[id].phy) {
 			dev_err(dev, "duplicated PHY id: %u\n", id);
-			ret = -EINVAL;
-			goto put_child;
+			return -EINVAL;
 		}
 
 		p = &core->phys[id];
 		p->phy = devm_phy_create(dev, child, &cygnus_pcie_phy_ops);
 		if (IS_ERR(p->phy)) {
 			dev_err(dev, "failed to create PHY\n");
-			ret = PTR_ERR(p->phy);
-			goto put_child;
+			return PTR_ERR(p->phy);
 		}
 
 		p->core = core;
@@ -184,9 +179,6 @@ static int cygnus_pcie_phy_probe(struct platform_device *pdev)
 	dev_dbg(dev, "registered %u PCIe PHY(s)\n", cnt);
 
 	return 0;
-put_child:
-	of_node_put(child);
-	return ret;
 }
 
 static const struct of_device_id cygnus_pcie_phy_match_table[] = {

-- 
2.43.0


