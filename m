Return-Path: <linux-arm-msm+bounces-48562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D378A3CAF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 22:09:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 027DE3B1AC7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 21:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2830125291D;
	Wed, 19 Feb 2025 21:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L7kINgYL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2B1214A66;
	Wed, 19 Feb 2025 21:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739999048; cv=none; b=rAVPac/lT7689ag/4LQIOJe8WABvE+K2REbFJP+ss5+aQomIerF/L6PZ3FbfShHPbosU+czdXKOeEX+njIYZbiECeletMiFKe3ckQ3IB56K67DyQfYtR0bHS5OEW9BA3oh0cxr4WMd0pSSlxUPCiu9eiKIYqo5q7zsoBh5xcMzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739999048; c=relaxed/simple;
	bh=MK8cFc4KyeQ37poNNoZlsldVQfON8CeoIaEvnbGtRcg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ER0w9jVivFA6R9Jop2yUHOzH3O6wF/5V8ogMTv2oEbl4glF7BV6kv4cuqxf5DeVS85avOjPUPDxa66VxGLr6JrRj/IonzenypVFp5roNgBa0K8lZYJ5tyY/qtW9mwRHhaiJ7+pFOBB+17iiqj2PqVvEMM4iNP6Yk9TyrlKBvscA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L7kINgYL; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5dee1626093so2542707a12.1;
        Wed, 19 Feb 2025 13:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739999045; x=1740603845; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iqVQmif5rWfQY9xKS/pYfnIOIMVEEPODJnDQ9GyjQd8=;
        b=L7kINgYLwPuN8UfoJyJrXpa9JSSNTnH1awNBMA6valD2X2pXiF3RBC31ZjUuEGKVTj
         wZninovJTJge6OlvMQ+Zn6HJ6YUhPzLM2WMW0Ed9Qdw4oRLwyK+gB4pT59J87aIciFqr
         MLQyT82Q4Csn41IpzxEhXNU2hKTIgc/VArWO1nD88VzhzvEMuOB9x4DHmQf2zCOmIfte
         t6CRsixNN4YE8FpvTFVqTjVE3Qxnz1oC3VnKZx01RlZ6H7ZTUeo0Y7Sk9b1WIdgPuvvI
         NMTULJGgQNOE1Rqp9jQxAiVR8f2uQtYabPqEaKdNi/vxw2Rqh4XVrEnMrjNS0gMisUmN
         LhFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739999045; x=1740603845;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iqVQmif5rWfQY9xKS/pYfnIOIMVEEPODJnDQ9GyjQd8=;
        b=FAcSpKhs2WJ0N0LD01tBlrYiC++wmYP7ith5AC1dkgzF52fcYoreYKK35mcvQkeTc3
         48dPrRxBP1tHRILzTM18rx4ohqzXBux0csePW49boZdBfmq3XzvkwUXKa9yYV5LA2QQP
         DYsJYTG2gRGghDm8HTQ3ej2m2ON9jhUz4togVTPaXLMFtmMo+5wHa9jf5U8mI4+wV7n3
         vj0W/109UxzZuy5xJHxmyclT6GT6paEQPw6shX9+IfA0wjz8qPURgT2xRsreY4zPOJBo
         tHfTaHgGFKdJezJKezEkDgwTgSpBHbyTsvX9KKYtEKuJRUxQzSAmx0gsS2e4IrpOyFtK
         16EA==
X-Forwarded-Encrypted: i=1; AJvYcCXaY19Vl6Bg8GXi97q0Ucl6Liuv1qCLk2oPvdYSqmjYAZ55kdHHvRX3+fwG6U8ZBXPVVOq50TgPaVH9n81t@vger.kernel.org
X-Gm-Message-State: AOJu0YzdxowyTSzludAkoJ8Lr8WBhIE2nMBgqk+2291fnD+pyq+RWkxa
	3HvBSemJd0fa8w8Pj1zD0M8QaXs6g9pRoeLFeH95Lxxc1aiRkgz2
X-Gm-Gg: ASbGnct1XLwhbuKo2bXmVPxZ4NalD2ys6RAaxtdR42ObeeXq1wC2szKKI6drvRraMtO
	ctwKEYaTjuVFigo7V27/5vCO52gbOb24B5cmxCbg/UzYPfz2DVBJit4yHuYW0PuzX2hZl3GK7fL
	CTad9EBLvsJttyDjC/Pig9owWCbCzG15+aBxTNvd3+A8IDthzBi8sU5cK8QWEGxqYrmKW8bVq1F
	FWIcTkccz+mHZzKysrN2Yh+M0pP79gnGJi9eEQrkC5BpGDx0O1LME87vxcZ6oJJsYOfDcvTP74x
	JbYLo6X2F0Tod85PkFO9Wg6eNuP8qqzm4e327/7w6toyqDZ8ZvNe8vgw5L00L8tK3FA6HFRqhcF
	IsdeGcNeolVgbqh3TXiR4+agkT0kQDtcGkpsKDkEjgAk3iZNacAcVjc7ZNJQ2rFoLjNRdbLOpcG
	b/IA9k/Ns=
X-Google-Smtp-Source: AGHT+IGHn8JMWM2nJoXI50VLUVNtZBVQFbuznMWtLN7o6/jBqEWvvL+cqAhZ2DA0oLYdK/lp9E0AUA==
X-Received: by 2002:a17:907:cf8d:b0:abb:e7ed:1324 with SMTP id a640c23a62f3a-abbedeea645mr55214466b.17.1739999044595;
        Wed, 19 Feb 2025 13:04:04 -0800 (PST)
Received: from ?IPV6:2a02:3100:a982:e400:6dd0:628c:981b:2783? (dynamic-2a02-3100-a982-e400-6dd0-628c-981b-2783.310.pool.telefonica.de. [2a02:3100:a982:e400:6dd0:628c:981b:2783])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-abb9de73d1csm635483266b.140.2025.02.19.13.04.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 13:04:03 -0800 (PST)
Message-ID: <b505ed6a-533d-42ad-82d0-93315ce27e7f@gmail.com>
Date: Wed, 19 Feb 2025 22:04:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 3/8] net: phy: add getters for public members of
 struct phy_package_shared
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <c02c50ab-da01-4cfa-af72-4bed109fa8e2@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <c02c50ab-da01-4cfa-af72-4bed109fa8e2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Add getters for public members, this prepares for making struct
phy_package_shared private to phylib.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/phy_package.c | 12 ++++++++++++
 include/linux/phy.h           |  3 +++
 2 files changed, 15 insertions(+)

diff --git a/drivers/net/phy/phy_package.c b/drivers/net/phy/phy_package.c
index 9b9c200ae..6955b4132 100644
--- a/drivers/net/phy/phy_package.c
+++ b/drivers/net/phy/phy_package.c
@@ -6,6 +6,18 @@
 #include <linux/of.h>
 #include <linux/phy.h>
 
+struct device_node *phy_package_shared_get_node(struct phy_device *phydev)
+{
+	return phydev->shared->np;
+}
+EXPORT_SYMBOL_GPL(phy_package_shared_get_node);
+
+void *phy_package_shared_get_priv(struct phy_device *phydev)
+{
+	return phydev->shared->priv;
+}
+EXPORT_SYMBOL_GPL(phy_package_shared_get_priv);
+
 int phy_package_address(struct phy_device *phydev, unsigned int addr_offset)
 {
 	struct phy_package_shared *shared = phydev->shared;
diff --git a/include/linux/phy.h b/include/linux/phy.h
index a8f39e817..ce591307a 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -2095,6 +2095,9 @@ int phy_ethtool_get_link_ksettings(struct net_device *ndev,
 int phy_ethtool_set_link_ksettings(struct net_device *ndev,
 				   const struct ethtool_link_ksettings *cmd);
 int phy_ethtool_nway_reset(struct net_device *ndev);
+
+struct device_node *phy_package_shared_get_node(struct phy_device *phydev);
+void *phy_package_shared_get_priv(struct phy_device *phydev);
 int phy_package_join(struct phy_device *phydev, int base_addr, size_t priv_size);
 int of_phy_package_join(struct phy_device *phydev, size_t priv_size);
 void phy_package_leave(struct phy_device *phydev);
-- 
2.48.1



