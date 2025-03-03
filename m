Return-Path: <linux-arm-msm+bounces-50051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66193A4CC8A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 21:15:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C29B18915C9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 20:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8894323536E;
	Mon,  3 Mar 2025 20:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+dyhEtI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6A121507B;
	Mon,  3 Mar 2025 20:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741032896; cv=none; b=rj16MhCsq68KlTPiT0/F7uH8FBjO2XQo5pM0xEVfNBApSs6dS3qnt1tjqTPLI75lYAQLa4a5rClEdwKUr9lTCT2os1gtbsLBHe/svl4evTNafEJQRjMBoFL//3kptj9GHBdD9mLomJmpKyNz72ZkIUlf5VlX8Z60Rtf1LKnmMRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741032896; c=relaxed/simple;
	bh=uguFkPyhLHqqHy6Oa3gPcmGsNAcmpL4z+DzL8HxNyMI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=LN1K0U+kQsh4LXpZrSNIa8dbiuQTc1PSBWWF49Spq3fkP8wCAZXREb+kIxDfAkfSm9c4bxqhVZf5gNV2N21LbGyo7/Bz7iPBXqXvgsSne+G9XslUWNuuq1N7WngbBgf9aCRER41uZmWGPVqxupxnbhHE9WgMjcJXHNZrIFHOB18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+dyhEtI; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-390cf7458f5so4586741f8f.2;
        Mon, 03 Mar 2025 12:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741032893; x=1741637693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rbOxg+2NOcU8S02BJzsCpuBN1u0Nv4BgUhVkmfXa+II=;
        b=d+dyhEtI6H49tqbbgi2WnsirZ/RRTh4hPei/WyI/+wdOYTkqnlqXXUY1DWLFuTuYVd
         VWXwFIPlS3qehzqTyAYoqiORjPSkQjnNnjkRASJNw9owCubgtFBIsQ3RuCT/ofhF/B1P
         sG+BW0U7JsczI0SwpkgBmCcYE3iep7DVZo8UEjq+OFsbVHGWZsYwHq5dzSwCxpOEjIzL
         nQC2xKVGLQFmO48NGTBIdYq3CgNR3J6EalnmhWzV2A24n7eztP25/e6h/a4Nr7g0vGGH
         1t65Mg66mIsDeBlutDNmyamttGEJrtI5qgjbmRbl1t4ZX/0dFEt7CJAdll30ASnadmUS
         GFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741032893; x=1741637693;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rbOxg+2NOcU8S02BJzsCpuBN1u0Nv4BgUhVkmfXa+II=;
        b=nC/rmh8BLCYqKgmJMYU48R6WnS41RvuSE6yvKWMJVvH0tClsoLosSV3kWU5oHjDvfL
         oY7//yv/iBkZOuNuAGnga8Hliw2ZM8Jm/mKs9h1Y3j0MA/aiL3wCu84MzcFzn0XnF8IU
         olB8zPrV+AQQuFwMY9adLBsiwommlh/nPWs77r3LoYF8U2gKi5zHwvZgfYTlatzYHhA5
         x2TBjlAkc6ZgzgLvo4r0HBmtN7Q4SWt8n+Y9byhqWQ/63w/1eLvLAnML2KevdUu/yuwb
         o1CXG6em2HTiM2ZgtBsGpRbbkl3F0lKFBrVw1IlHvhSt2Rce0fthXP/Ek4qAdfrPIrkN
         QU3A==
X-Forwarded-Encrypted: i=1; AJvYcCVaqhLadqnH5bpWiGhT/fTVMwG+ToMGQpi0yUSLL3Z8jkkE1IZPSfzMnk8sSz4bL04k8S4P+qIauVO1+DHe@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9nuVpR29QzskiiU5I9ouC/SiwYH7D9movpYFqJgbH96begq8s
	DwgTc+FBbXtXhnS98x1l2y4dW5msAs1GgaEmqqysfPlCB2cqAUSL
X-Gm-Gg: ASbGncup7buLZn9oOTgN/+Lp8ahYkYXKj7iu8YehvWWtFySplqR0yK14lXc4lwzx4VH
	SytivDZokRQnU9MJtKoLd+6rt+qIiw0KyAWbYGxuDrYs8naT2Yl/SLXiTrr+N06Fb3n6xuGsgBT
	ztIb5FJqsUNp2VUToH10E97x1TkXJSAenxJd5LezGunuffnarhdNJzUrDqYWJz53V6DDlHm+WNd
	ZKQg/McsX6Tr1ua92m8TXNg9imQrP4nbm6/ENHGAa9eNCUxCrj5woh0AKTmOAOqxeLtSeHbssZE
	ptdtHPR1uq/tVtrjKTVxQWnm8OYqXM3RmUP1z7pVC44rVAIHyzy152Xu0XaYKJdAK1je3uB0GYU
	6faqc/m9jYArApfcvgNTpLhxJfs831oFerfosbCTJgGm1kWp5ErrEKV6i/0GufA2SYOQdCiMi7G
	8y/V3SWY0pvHIo2njXUFq8erFyus0ter05EpVk
X-Google-Smtp-Source: AGHT+IGARpDSg5XhxYbQGckwRKwrsrKe87MnLl+HRy5bpEImeWmi57FgLD2j7bX/sPPwidKvu1eIfA==
X-Received: by 2002:adf:fc11:0:b0:38c:5fbf:10ca with SMTP id ffacd0b85a97d-390eca06cf4mr13275775f8f.39.1741032892907;
        Mon, 03 Mar 2025 12:14:52 -0800 (PST)
Received: from ?IPV6:2a02:3100:af60:7000:f08c:4f29:ab35:752a? (dynamic-2a02-3100-af60-7000-f08c-4f29-ab35-752a.310.pool.telefonica.de. [2a02:3100:af60:7000:f08c:4f29:ab35:752a])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-390e485dba4sm15702921f8f.92.2025.03.03.12.14.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 12:14:52 -0800 (PST)
Message-ID: <b6402789-45d2-49d6-835f-ed584bce5b2f@gmail.com>
Date: Mon, 3 Mar 2025 21:16:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next v3 3/8] net: phy: qca807x: use new phy_package_shared
 getters
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Robert Marko <robimarko@gmail.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 Rosen Penev <rosenp@gmail.com>
References: <5c5e60b3-0378-4960-8cf0-07ce0e219c68@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <5c5e60b3-0378-4960-8cf0-07ce0e219c68@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Use the new getters for members of struct phy_package_shared.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/qcom/qca807x.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/net/phy/qcom/qca807x.c b/drivers/net/phy/qcom/qca807x.c
index 2ad8c2586..1af6b5ead 100644
--- a/drivers/net/phy/qcom/qca807x.c
+++ b/drivers/net/phy/qcom/qca807x.c
@@ -15,6 +15,7 @@
 #include <linux/gpio/driver.h>
 #include <linux/sfp.h>
 
+#include "../phylib.h"
 #include "qcom.h"
 
 #define QCA807X_CHIP_CONFIGURATION				0x1f
@@ -486,13 +487,13 @@ static int qca807x_read_status(struct phy_device *phydev)
 
 static int qca807x_phy_package_probe_once(struct phy_device *phydev)
 {
-	struct phy_package_shared *shared = phydev->shared;
-	struct qca807x_shared_priv *priv = shared->priv;
+	struct qca807x_shared_priv *priv = phy_package_get_priv(phydev);
+	struct device_node *np = phy_package_get_node(phydev);
 	unsigned int tx_drive_strength;
 	const char *package_mode_name;
 
 	/* Default to 600mw if not defined */
-	if (of_property_read_u32(shared->np, "qcom,tx-drive-strength-milliwatt",
+	if (of_property_read_u32(np, "qcom,tx-drive-strength-milliwatt",
 				 &tx_drive_strength))
 		tx_drive_strength = 600;
 
@@ -541,7 +542,7 @@ static int qca807x_phy_package_probe_once(struct phy_device *phydev)
 	}
 
 	priv->package_mode = PHY_INTERFACE_MODE_NA;
-	if (!of_property_read_string(shared->np, "qcom,package-mode",
+	if (!of_property_read_string(np, "qcom,package-mode",
 				     &package_mode_name)) {
 		if (!strcasecmp(package_mode_name,
 				phy_modes(PHY_INTERFACE_MODE_PSGMII)))
@@ -558,8 +559,7 @@ static int qca807x_phy_package_probe_once(struct phy_device *phydev)
 
 static int qca807x_phy_package_config_init_once(struct phy_device *phydev)
 {
-	struct phy_package_shared *shared = phydev->shared;
-	struct qca807x_shared_priv *priv = shared->priv;
+	struct qca807x_shared_priv *priv = phy_package_get_priv(phydev);
 	int val, ret;
 
 	/* Make sure PHY follow PHY package mode if enforced */
@@ -708,7 +708,6 @@ static int qca807x_probe(struct phy_device *phydev)
 	struct device_node *node = phydev->mdio.dev.of_node;
 	struct qca807x_shared_priv *shared_priv;
 	struct device *dev = &phydev->mdio.dev;
-	struct phy_package_shared *shared;
 	struct qca807x_priv *priv;
 	int ret;
 
@@ -722,8 +721,7 @@ static int qca807x_probe(struct phy_device *phydev)
 			return ret;
 	}
 
-	shared = phydev->shared;
-	shared_priv = shared->priv;
+	shared_priv = phy_package_get_priv(phydev);
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
-- 
2.48.1



