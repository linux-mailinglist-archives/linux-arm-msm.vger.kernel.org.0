Return-Path: <linux-arm-msm+bounces-71295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C8AB3CFD0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Aug 2025 00:21:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3908B5E5195
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 22:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0062261B9D;
	Sat, 30 Aug 2025 22:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eyPzT4h/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72B954758;
	Sat, 30 Aug 2025 22:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756592491; cv=none; b=iYKElK35TQlsRMO+LqvdfactLqZnqC+2fhNSQ0r2hffup+B0IztLglqYXtcKVuoj7EAY+JI36g+KJxX32608EYFRr2zSQs9xRBUabyhsaqiYfsGODrpIwtavC2R1xkMWWbZkK4jfQDQGxfdJNh8w+eVDnYx6ZI6jpn9srOsYXSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756592491; c=relaxed/simple;
	bh=hR7XzaIv+C/VCHroKbqlx7yUBWoPBfcDwAYko2piPic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LZdnxNmbdb3ixEvWV+cAnI+PuxczjQme3Ki2F+IKBXOObxKpl4i9K0x8kk1PYPlLjG45dXok7BkxTivcQjoeZaAJJGxN7fVOiqtiGr68TDxdmOgjiqxLMieqiSBWGkcum/Ktc4Sz9b0YhoCqStTrYYxuXrEB5FftNRIzJC+buxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eyPzT4h/; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b0225483ca0so110019366b.2;
        Sat, 30 Aug 2025 15:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756592487; x=1757197287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4XnZO2gxytH1SRadueynUzMjxvJf4l9akI+JpgEYXK0=;
        b=eyPzT4h/+pv78gN830WCz4S8bf+NrkgpjfWVbBYaYK1gV44M8JeEd/k7nqJnBgJBDk
         WmegeVpR64ceD4k4Y0rrTGxFjIMxxzZccZrIgMQXC7fmlOzM8nl3npKWj/Qh4Yo4ewqF
         /cv9SeasdwF9RHgc5W1iuQ7kFjtD8m7ghPIanHIJE9pusXHaJ24CQ42JT3h1c+BmfHiV
         CC/q/glcHJkAEd7HsqyUI78XVCYnGg14PTZNy2Nhxb9XPOsPwwzLZ1K/jVlt176I0NaH
         LcgM6yFa0t5uCar087dKwvWzbPnI6kM2sQQYz1IZd026JSEml62AAL9G9u67Q9x0xX+W
         xOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756592487; x=1757197287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4XnZO2gxytH1SRadueynUzMjxvJf4l9akI+JpgEYXK0=;
        b=K0ADIetsSa4WC1iv9yBI9qpQ1wZ5pYLWtVV5y1QCaWMd06r59HDsWyUEtaXMZOGS9L
         8NY4fmGmP2TsctQfICzFAO2Js3dLx47csjGMciD/Ca1izCMAUHRn1beyNRmtksR29gq/
         SRcIlXOTLM0DaY/11GNDv5Z7XBzfoD4MqbtWzQhFsvNJmvoP9s2CcALywA4hS51Qo528
         nb0EqxoSvOYI+IQHoEdNab1oMRd8MppY5wSG6vPMkYkoM25j8muzzxEGMQnC+Pc4gN5c
         uAEbzwCuCp3vAQHEE9IDiJ86TtIXRCX/W1723A5g+tPYilFLxneKgD0yWKuMV+jIPZFg
         X09w==
X-Forwarded-Encrypted: i=1; AJvYcCUaHDySjqltNQD8xluBG0y3vZVosNiiJnC8eZIDr/Va3Hux3NPMxDx9kjkSsF2ezF6AXYQX4dT/cS2B@vger.kernel.org, AJvYcCWYBdTmV9VKVcBD19x9zABxIXU/VdCT8Ha+mh2w1SMb0LTEYv+PW7vA8SU/M35r+LEFHzsWAsxRjBOKZlpwOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHtm4FKUazyEB+8Fozi8NdqJ1l/7YeWeFO3x6GQlUQILGbDfim
	e+d9S4wILhGFgBGmftJ6U4OxjI74lo4uLNWtHuU8DxsJgyMh3LbfdpxyDf1Q1A==
X-Gm-Gg: ASbGncstLkghgBFwYHAr/a9GJhza//QaLyudST0+T9vKTpLXjiwzhc8DVTDrGa87Qj4
	cVH09VNitPoaBoFaxer3opHa81LWm6q+PnpOlHJOjAfZCyaJL3OfvJ6nmp80GPIO7gcnySPQqB3
	ZIO3MZrcKyjpfZz6kWJBaO89IqtxFnKzns+rHSdyaW/Le7qVHR22E6YXfhbOID3hN9jL8KVQznB
	fErRdj4sXj1EMue0W957LC/RRuaFw32Re+fThM+SP/MSlYwvy59jxKcAXJ1sU8fSeWsqsFShLty
	CTRBluUqj8inPMDgjvMe3O1bcBMjpmyE28ocqT0+w0VgeTRISsIv+o2BZZQIMSI1PDx3HYQmJw+
	b9nXr5BQ/40cKLcsPxsNSFmDL+hrtaYg=
X-Google-Smtp-Source: AGHT+IG0oNhGAlrFRAhRbjM1edLbJ7Sv6GpLDcNzcQveGwk3gHxEbkwY770AX4GImoNMHPS09b9U4g==
X-Received: by 2002:a17:907:3fa3:b0:aec:f8bb:abeb with SMTP id a640c23a62f3a-b01d97305bcmr303090766b.42.1756592487008;
        Sat, 30 Aug 2025 15:21:27 -0700 (PDT)
Received: from [127.0.1.1] ([46.53.240.27])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b016e56a4e2sm241201366b.26.2025.08.30.15.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 15:21:26 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Sun, 31 Aug 2025 01:21:21 +0300
Subject: [PATCH 1/2] dt-bindings: add mfd/max77705 definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250831-starqltechn-correct_max77705_nodes-v1-1-5f2af9d13dad@gmail.com>
References: <20250831-starqltechn-correct_max77705_nodes-v1-0-5f2af9d13dad@gmail.com>
In-Reply-To: <20250831-starqltechn-correct_max77705_nodes-v1-0-5f2af9d13dad@gmail.com>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756592484; l=1376;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=hR7XzaIv+C/VCHroKbqlx7yUBWoPBfcDwAYko2piPic=;
 b=vtCjQ3aBoL4p1qSQQxtRwusaVezctkvS1enKuuI7Nw7GVFn9z2XOO5Kxh+oj9G7lGhAFR9i3S
 XG+Z5OMSnGDBhifvKPVy5KABLmjoFeMbYYQjEplm+e0jYi/Mr0grODy
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add a dt-bindings include file for max77705 devicetree definition, define
available irq numbers.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 MAINTAINERS                        |  1 +
 include/dt-bindings/mfd/max77705.h | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 020d7aa13188..82f500cf3c02 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15166,6 +15166,7 @@ F:	drivers/clk/clk-max77686.c
 F:	drivers/extcon/extcon-max14577.c
 F:	drivers/extcon/extcon-max77693.c
 F:	drivers/rtc/rtc-max77686.c
+F:	include/dt-bindings/mfd/max77705.h
 F:	include/linux/mfd/max14577*.h
 F:	include/linux/mfd/max77686*.h
 F:	include/linux/mfd/max77693*.h
diff --git a/include/dt-bindings/mfd/max77705.h b/include/dt-bindings/mfd/max77705.h
new file mode 100644
index 000000000000..34fcf1642e2d
--- /dev/null
+++ b/include/dt-bindings/mfd/max77705.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * DTS binding definitions used for the MAX77705 PMIC.
+ *
+ * Copyright (C) 2025 Dzmitry Sankouski <dsankouski@gmail.com>
+ */
+
+#ifndef _DT_BINDINGS_MFD_MAX77705_H
+#define _DT_BINDINGS_MFD_MAX77705_H
+
+#define MAX77705_IRQ_CHG	0
+#define MAX77705_IRQ_TOP	1
+#define MAX77705_IRQ_FG		2
+#define MAX77705_IRQ_USBC	3
+
+#endif

-- 
2.39.5


