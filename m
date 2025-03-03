Return-Path: <linux-arm-msm+bounces-50050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 406ADA4CC87
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 21:14:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6B9A3AC382
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 20:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF38B21C175;
	Mon,  3 Mar 2025 20:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cAn/rS9L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8178633F;
	Mon,  3 Mar 2025 20:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741032845; cv=none; b=Ga//Qt6sEwRWx1E8xjo5lo9qK8OZQ5p3lzPkq/JcpR6AlYOUuGD9q+NlWpalFZzwJ+RBIoXn8Yd6oKU7+eGpO2SG6+vhKvcPed7D0d9urMPwFSLSS5kKNPH4h0vVDQSD3jd8Fqw/npBA8Y5zwuit1ij8QYLzxshQ8KQfp79Yz+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741032845; c=relaxed/simple;
	bh=HsEFDeAbEdG7csLAduDUsB0/AG1OtMFAL++sxrdIjD4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=EZPgeHlmC2pFq9UY4xoWuOlEoQeL5jFVG1urxNE02KmPOguWYsNNu9Bl/irN8azXk2BZbewv3zwhUA7wVaURRSMW8ddg6he9y1TXSHO+meyQ+yDb9ibqIngvqKWEIxytZWH/KpFD0PDjic0vRwGfhlY/cPx74OzsoS2dZ4Omdjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cAn/rS9L; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4394a823036so46598365e9.0;
        Mon, 03 Mar 2025 12:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741032842; x=1741637642; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FB+r4IMcrYP9X1FAsufMXQchNOKyq0qSgDMx6XaOSI4=;
        b=cAn/rS9LEJk1YwFNA/jw6dP84lglviTRkX8hsH8EjmVdguWhx6mWsE8ubNXRhz1hyQ
         jbJM5edBcbC1SgsZVGWHau7cKtJYvkJOfIWiDQ9BDjibFyjo5yLVufBAZAt0BkTiQwAh
         wqt64SActvUQFrwbM2Qqk5i3OGnNNlicn1ELgvratFQJ8qWi4w+Mft4BpUlvJIi8Q2as
         YEBW+HJo6i+rcK7LABhqTgnoEoKy98910welJBwHyOUFXzP/WuVPvMkhgVyBLmz4oUAN
         9GTR3jSGN1JN2jIiBjSvT7bovNzPr55IzsYMIU1TjzZ7YC7vP8I1RUitlQSdduthiD45
         +YyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741032842; x=1741637642;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FB+r4IMcrYP9X1FAsufMXQchNOKyq0qSgDMx6XaOSI4=;
        b=O5hCOXngfHoXRHjZ7d0xKvhAoE5eWlLAPBBRoMJbBvWgWfNtPd6zRJV9Sv9e5mWqG9
         x6azQ9pLshkSsXyc1ecKwNk0aIC2cSfsYywBwHgm4y33Bm2L7agS2m8hirhaQfMCmwFK
         1eTYKsfQUSS626goSTsiKbci59N2ybt0SSDVaABxOShHjrluT6OHZdGzJYAhE0E9r9lH
         OYnQChozKxFlnUvwS1ibuOOuMfONgIpG9Mnq1bBC5W6jeXqfyZghtRP7+xZ4Wwok5JD3
         xWqLvfEI5rELi6U8sum3uaAZZFeNpoE+IFBpyL7/A0zZYkMC8662HCKjcQxNDuAJy+pe
         I8Bg==
X-Forwarded-Encrypted: i=1; AJvYcCXECkJfumo/z/L8VtVYtTH1GkMNpl1M0N9d88QHhm2scb855rtCVG5RyRcj/6Wy5FIBXtORkygSPLya+HzQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxRqOqfkMCzlIyef/guSMAMK3YOqERK3NLg4ImCva1ZiO5eQPJp
	P89R2bjP+Re4stHSAz/Fdaiwy83OmaK78bE7VMsUWpTNmNf0CgcC
X-Gm-Gg: ASbGnctIW+ZLSdmegXADWmguyR7ZrmVeGALLmUGfI6J4YUzHo85UVqww4F31P4oum8A
	UGzkCNfc+jhjXi1cmyrcD6qsSuiqGt+//ZfZX7KhGvsyUxX46w4/rZoMvKcRedATeTFE67PCKfD
	HHrDPf6X7qXZ1Ls6r6XOmAvKfB/0bze68ceFR7jyqqDsLVi3ElKl8WzDMpv2Nez3LOKk3tuGWrT
	voCyPid78jZxo9qUaXQaxc7lckebnHJipUpBC0eLDFV0tWy/BIM4XnjiSW/eqP12oM3la4Fr3tF
	GvkhcV8l+S6iyY88U5YfW2yh6Og8Zx8Ku4tuUMK+Aun0iLUIMBmyt7eBE615ewPPcE+C3DIvxDs
	TR1XH9ORUvmMREOmk9DM+v0rBDIfdihWF3eO6/9uqvhklEJV3ICAe5nO1e9cPtFXbAcp5GyQPms
	slcuU5rYIawwiiNkDY1/2SuEOuHkakf2mgJ3NX
X-Google-Smtp-Source: AGHT+IFftp5oGTv1dqci4Hrpf1S/JobH9UCuDY4jwpxtV8qQCaPz2QhAfkAOR2R2yUrnMGAJVqmcsg==
X-Received: by 2002:a5d:598f:0:b0:390:f902:f961 with SMTP id ffacd0b85a97d-390f902fa79mr7524306f8f.45.1741032842440;
        Mon, 03 Mar 2025 12:14:02 -0800 (PST)
Received: from ?IPV6:2a02:3100:af60:7000:f08c:4f29:ab35:752a? (dynamic-2a02-3100-af60-7000-f08c-4f29-ab35-752a.310.pool.telefonica.de. [2a02:3100:af60:7000:f08c:4f29:ab35:752a])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-390e4844a22sm15577084f8f.74.2025.03.03.12.14.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 12:14:02 -0800 (PST)
Message-ID: <c6da0b27-4479-4717-9e16-643821b76bd8@gmail.com>
Date: Mon, 3 Mar 2025 21:15:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next v3 2/8] net: phy: add getters for public members in
 struct phy_package_shared
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

Add getters for public members, this prepares for making struct
phy_package_shared private to phylib. Declare the getters in a new header
file phylib.h, which will be used by PHY drivers only.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- rename getters
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



