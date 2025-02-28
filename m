Return-Path: <linux-arm-msm+bounces-49889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2581CA4A544
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 22:46:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40E6B189BF1F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 21:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D7B71DC98A;
	Fri, 28 Feb 2025 21:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AXmrInw9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EE31DE2A4;
	Fri, 28 Feb 2025 21:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740779179; cv=none; b=akFLHX556cFuvhgZi4UyqIzIKfQtDPmEn6Q7ylG46zUIES9YScPahkNdJlh3xghx40k9toy78tm4rCFBAic9s7i32yJlsYzFXtkZyaVm3WIsIOhfoc1JkgXdbnGc5qJaQ9hyQEsbOzGPRIMpf//FlBo2RegOCFXyIR7Asho+wSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740779179; c=relaxed/simple;
	bh=rpkz69HealP3Py0HdfF1Llh10EQ+h/ApdrwZFunC/RQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=qzY9ih86V4ANiqQgb8/B7yE7fF9hdyuOiCVyI8RCWZj46EOWGgnEMZ9SRp2Wi2J7D+u1p+ZQpaqnuA0U0jZVQg5kN6Wm/6bqIBd9LGIvFDooPZv/eNlagpxTAUejNQkkNwsEAlnne8vgnL4mnGeWel/gqx3qbsyYq0+jMLUf7A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXmrInw9; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-abbb12bea54so478641466b.0;
        Fri, 28 Feb 2025 13:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740779175; x=1741383975; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=z44PpIsh3vLE/afH5iH0W6ltnQA2fSJsEIEQTKn0hFY=;
        b=AXmrInw9UJbdnrJupHbgLebZDVXRjhNKc+ATin6R/sFHL5LL0qe1pifpulM3JMkxLV
         DRF+2j1+I/Q6w1y6CiWtuPvudFo0TQwHp6g3jsCqdGDT8zgnV2304XwiiWQux2UtuKth
         I3zSAg7HLQBx61XazaTUwN58nIAhK3zuUflG+n/fNfmrvfh7oNd/yj5dr+mOGJF61Gbu
         4/8/8F4eC6/h/qLw9GAMfKMVGwvtVxBVkGifGXJxBcBWrkqVwUzlgMe0ekYHxD1VmyzJ
         YgDL7/acu9ezg28uYqqr7EZtomanDKdP3lCAPa+O1WKgOqhm4qr8yGCMOg0s6x6s5ib4
         T46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740779175; x=1741383975;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z44PpIsh3vLE/afH5iH0W6ltnQA2fSJsEIEQTKn0hFY=;
        b=o0h44GWwOiJ5bFo8UII3YMza2ZUtGyNNQfksIrsjYGrS81+vH3cHxzo+5f34GJnxYf
         +3HSrQUNehXGNOte9h1f+P0csrfHlpzcuPrrA0eHHr7EotJs/73gMCcowbNvscz3zK4V
         vmvsDnfUqQCjZzrz9adovl5KHLTdc17NOV3MJx0Rk4KXSZjgTvuVM/2ccL8X76VITmH+
         7KNiL1uN7odbk1gSB+S6aGRs50jeZLe5hHkpJXqDeyNJk+pT57PzviqWCXI37o/y8rGD
         B/+SkyHo60wfW4qyYSXVJMeAMrTWGy7ZNsAkT+CUoeN2nE8iaqhypULlleiRjBzbFbpc
         S0Ig==
X-Forwarded-Encrypted: i=1; AJvYcCXVMcJj/HNu8XXX75DnKZrlkUJ4m4EPT/WZZxbj43xuVvOKnreMndxKwa6t2YoUQ2dEA9iR7oQ9S2+aitUQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzYoBrY6/Ri8hHKOAFA3pN5Aa9i19RucIl5oKUUFnz6AL0wdfql
	nP9witaSu45mnZG6rKu/HL3+EyfMbCut5tTY3mOLtCsx1k9thnlW
X-Gm-Gg: ASbGncttFCvqjbJkvQZLiMTIZwOWJWU85v6t2qkImsHmPoIx76tW/7V0PKOiqqVlZ49
	HGNXQME6lfpyAeOC/S3jZ7L/hyu+b0UX6oGb3NZvAkrocupdjnd945QUhpi7RcsRrIaDOI0vHXR
	yj8cm5N72qY0ZBOV+VczLHYJVfJKLV7MvKHEQIAuck8CozVJIZOShtZZ0O4eU2IXi2Te3JF0Bgq
	kjBK3KFy/FTNwcr7eGMsd/BO3vie0kXFQ+hfRxXz+UrZoBL+OXt1FDLMEcPlnJ+XoauAFtAMoLL
	iBGbbzZNVshqDH8phpSLTJ9KsnjC1NC3UVXwMAOQioQwIr4fJu6Fufzp4wOFe2o82VYoUyV1URN
	1pEZV8OTZC59nc0rRxGyi4U+YYyxPF94IMoz3/zhlNN/Zo61/vYJyuSeefBNJWY/vL6Bm4e3F/e
	BUAJ3Xopk3A/hsNenSR0GJGGhGnSZ3sc85SwV5
X-Google-Smtp-Source: AGHT+IGP6bNbwBJ8aUPoIYK2hJiDLEV9kuGWZVRk/kHjuVqrdg1Izm14Ba5s4Qo8hJ8K70gbtKj/Qg==
X-Received: by 2002:a17:907:1c9e:b0:abb:b330:5bd6 with SMTP id a640c23a62f3a-abf25fdc426mr546567766b.21.1740779175390;
        Fri, 28 Feb 2025 13:46:15 -0800 (PST)
Received: from ?IPV6:2a02:3100:af43:5200:e57d:90a4:e6b5:1175? (dynamic-2a02-3100-af43-5200-e57d-90a4-e6b5-1175.310.pool.telefonica.de. [2a02:3100:af43:5200:e57d:90a4:e6b5:1175])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-abf0c75c333sm356473166b.145.2025.02.28.13.46.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Feb 2025 13:46:14 -0800 (PST)
Message-ID: <496cf940-b57d-4c2e-92b9-80a90d239523@gmail.com>
Date: Fri, 28 Feb 2025 22:47:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next v2 2/8] net: phy: add getters for public members in
 struct phy_package_shared
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Robert Marko <robimarko@gmail.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>
References: <8b290ccf-ca0c-422f-b853-6fc7af045f99@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <8b290ccf-ca0c-422f-b853-6fc7af045f99@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Add getters for public members, this prepares for making struct
phy_package_shared private to phylib. Declare the getters in a new header
file phylib.h, which will be used by PHY drivers only.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- rename the getters, making the names shorter
- add header phylib.h
---
 drivers/net/phy/phy_package.c | 14 ++++++++++++++
 drivers/net/phy/phylib.h      | 15 +++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 drivers/net/phy/phylib.h

diff --git a/drivers/net/phy/phy_package.c b/drivers/net/phy/phy_package.c
index 260469f02..873420e58 100644
--- a/drivers/net/phy/phy_package.c
+++ b/drivers/net/phy/phy_package.c
@@ -6,6 +6,20 @@
 #include <linux/of.h>
 #include <linux/phy.h>
 
+#include "phylib.h"
+
+struct device_node *phy_package_get_node(struct phy_device *phydev)
+{
+	return phydev->shared->np;
+}
+EXPORT_SYMBOL_GPL(phy_package_get_node);
+
+void *phy_package_get_priv(struct phy_device *phydev)
+{
+	return phydev->shared->priv;
+}
+EXPORT_SYMBOL_GPL(phy_package_get_priv);
+
 /**
  * phy_package_join - join a common PHY group
  * @phydev: target phy_device struct
diff --git a/drivers/net/phy/phylib.h b/drivers/net/phy/phylib.h
new file mode 100644
index 000000000..a42e1fc07
--- /dev/null
+++ b/drivers/net/phy/phylib.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * phylib header
+ */
+
+#ifndef __PHYLIB_H
+#define __PHYLIB_H
+
+struct device_node;
+struct phy_device;
+
+struct device_node *phy_package_get_node(struct phy_device *phydev);
+void *phy_package_get_priv(struct phy_device *phydev);
+
+#endif /* __PHYLIB_H */
-- 
2.48.1



