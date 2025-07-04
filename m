Return-Path: <linux-arm-msm+bounces-63609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F095AF88F3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 09:17:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17DD7487E49
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 07:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A5D7279DD6;
	Fri,  4 Jul 2025 07:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="PT3RMI4U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2435F210F65
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 07:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751613436; cv=none; b=SqmCi6fUzvLzSMsYV+XY/u0CdfKBJ7StRag5vFXrcB/hCy5nv4P0O7UlPCui09E/eJnqmKjK4wGa0XebLJV8ieNbcei9f+6O9ZT4W9bZerkN1csicJ3eEzwtKGtHNPZbOVuF0Nw8sUVnjtXED+Hp8cso29p3D6lAdb13yW6r1jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751613436; c=relaxed/simple;
	bh=uth/TQpjLf3lBUfNxZBkzPLdFlA4ZgzmdxkY4dVv4aM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CpicakN66Gk8Lp9vewY2ojmYflN2uLiGuw7dSaQP8YH0E03vxwQj0MWLdcGZK2qmWZxHzP6WcxbMLQmIXRaKOr6J+2VOcEDwHo3+oZEUCZIWqLRnD7Z1inYPHO5Igugr0cWKz1gNbYEgYxXMyF77OTsP7GLkwFFhJc/EApiRWYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=PT3RMI4U; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ae0c571f137so125019966b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 00:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751613432; x=1752218232; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOxW8sDZSm4A9YicXJzPnN/tY8ldwMWP8nLye+j8a0A=;
        b=PT3RMI4U9x9Gjja66CkPgfRaA7d6458nKW68fgMU5QIqTGKEgBZ4DM4ticQ6f8UPt7
         6kuEw+CFgqXBKXPpTlyDi+wIVYx5ENjKE8bhc7IOrtp4qkQjAFHencB/2FPs7RRyNrh3
         +J/deWZlarC38+0YUB6KOZuwDd1J9NizYZAHZ1HB5Mm34FWPF9l1MabFxgCPrikvy9cz
         bVMDRoVH5sPnFh/mKCK9Rb8ivmO+h6ECtxeP4czX0UsluhCliyD/8V01ZCfYjqBSS55U
         LU9mVLHqmrtlI5UMCj+FTeq3xWTIgBkDuxyxYSgLKoKnPAePlTqpjB+CdP0Jw0GJB67q
         FINQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751613432; x=1752218232;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZOxW8sDZSm4A9YicXJzPnN/tY8ldwMWP8nLye+j8a0A=;
        b=VK5TQKcGLzwi7dTck7uvCIUrO77j/7BiEIXKkdw8+DPQcMeJktxdT5CH2BFQtN11T/
         HnzbNVw6J8iWIVppD4rNKyPUQCWzEfsoywPPjJWi4Nf5ByhUKaidVTsicv6KhR3ErK1F
         9cEzFi3+Kpm8JQIyV80fog1QeLsTol2kk6kYn9x0n6Z8XI//q5FkZRq0JD1lHzVC8Hse
         sV+QEepUF2eVnV4BI/0I9IlzBlGE0wzsp3XzPNWFobRbq8QEpxhEWwR3fvgcCCziZ+rc
         NzsoqOA9wxQyM1GA3u6q25K/bq/uiNrM2EtEA6lRFKJPuftIDOXMf8INApW1onO0SwZO
         i4eA==
X-Forwarded-Encrypted: i=1; AJvYcCWgAqERAfngMZTfrHCMiQU4gwBTp32b2SsWl2I2MrWc7Ud13x8a4i8mz+rfQFeCvBACeVInqHV8ypyAr0zo@vger.kernel.org
X-Gm-Message-State: AOJu0Yz05EZkNldaXyRtC2Ph7K70/iTvXFd2s0V2lVql8i3HhapshrCH
	sEOdfLjhii/Dgopkud4qgB+lxDaySqqn7Ypgvn2eXUc7oovAgm7vl6z2OcRyH337ZSY=
X-Gm-Gg: ASbGncvYfD0Joa1RZX6iqzwLlLtVR+AkdGVKK6aV5P3FRsaI3UHVOx0TTyX6efHr3W4
	da707lfDRy+Hz395c5QtL9SP3K+Y7qV4vuQTuRTah+V99OkTVO2GGOoRyao9LPaVdXlj5gDYT5B
	zXRQ6D2pQjnnzVT/1UsRI77IptE/QpZGUM4BFGjOovn/3E9aennCwkiTQX8YikZQO6fTpptEmIS
	RZ/B43EuwuudxiOciizb/rkFgo7hI0GLFlBfA9Zv9W5qHiFND7OzNqcF7tekzXD4j/cRBYKW9TQ
	iKod7AcBnIuC/Npo5AFzxhD41l8lzCx703LvcuuXkalayijv/ECizCA62iMXHlNFLBRQh8iNYzO
	eNzSXsmuPAmCnC5OBK1dUeMMepO6W5APD
X-Google-Smtp-Source: AGHT+IEqkKAlFA3Wv0a0+O2lG4Gewr8tyBjRmd36nr0j0b20xOn8+R6sxOjM9dV8a5eD98pz9vYk5A==
X-Received: by 2002:a17:906:6a08:b0:ae3:b654:165b with SMTP id a640c23a62f3a-ae3fbc7da25mr147143366b.24.1751613432382;
        Fri, 04 Jul 2025 00:17:12 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d1ae3sm119401766b.7.2025.07.04.00.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:17:11 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 00/11] Add clock drivers for Milos (SM7635)
Date: Fri, 04 Jul 2025 09:16:52 +0200
Message-Id: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOR/Z2gC/13OwQ6CMAwG4FchO1sztsDAk+9hOMxRpFE23CbBE
 N7dCfHi8W/zf+3CAnrCwE7ZwjxOFMjZFMQhY6bX9oZAbcpMcFHwUnAIgyplAebhzD2AKuu6lbJ
 qjVQsdUaPHc2bd2lS7ilE598bP+Xf6U8q/qQpBw5Gy1xwlLrieO40+bF3Fo/GDaxZd97j85W+j
 PsNdtUBIe0HiqfM4hxh8xWXqbF+AAMtKwXfAAAA
X-Change-ID: 20250620-sm7635-clocks-7699d338dc37
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751613431; l=2902;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=uth/TQpjLf3lBUfNxZBkzPLdFlA4ZgzmdxkY4dVv4aM=;
 b=bd8e4tDnMHNsvuFQteHi6X9U/WdUlNYw8STR6kJwPXqS0m6W3BAkimsyn4EelbCoGmkh84Cx0
 VGHtKQWx6S9B2krWVcZjFHQxgmI84VUcpobGPg6+EqxIZPGXFTZSWkz
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document and add the clock drivers for GCC, CAMCC, DISPCC, GPUCC and
VIDEOCC on the Milos SoC (e.g. SM7635).

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Rebrand SM7635 to Milos as requested: https://lore.kernel.org/linux-arm-msm/aGMI1Zv6D+K+vWZL@hu-bjorande-lv.qualcomm.com/
- Use new qcom_cc_driver_data to configure e.g. always-on clks instead
  of in probe function, plus some other related bits from the probe
  function
- Add patch to support registering rcg dfs in qcom_cc_really_probe
- Link to v1: https://lore.kernel.org/r/20250625-sm7635-clocks-v1-0-ca3120e3a80e@fairphone.com

---
Luca Weiss (11):
      clk: qcom: common: Add support to register rcg dfs in qcom_cc_really_probe
      dt-bindings: clock: qcom: document the Milos Global Clock Controller
      clk: qcom: Add Global Clock controller (GCC) driver for Milos
      dt-bindings: clock: qcom: document the Milos Camera Clock Controller
      clk: qcom: Add Camera Clock controller (CAMCC) driver for Milos
      dt-bindings: clock: qcom: document the Milos Display Clock Controller
      clk: qcom: Add Display Clock controller (DISPCC) driver for Milos
      dt-bindings: clock: qcom: document the Milos GPU Clock Controller
      clk: qcom: Add Graphics Clock controller (GPUCC) driver for Milos
      dt-bindings: clock: qcom: document the Milos Video Clock Controller
      clk: qcom: Add Video Clock controller (VIDEOCC) driver for Milos

 .../bindings/clock/qcom,milos-camcc.yaml           |   51 +
 .../bindings/clock/qcom,milos-dispcc.yaml          |   63 +
 .../devicetree/bindings/clock/qcom,milos-gcc.yaml  |   62 +
 .../bindings/clock/qcom,milos-videocc.yaml         |   53 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    2 +
 drivers/clk/qcom/Kconfig                           |   47 +
 drivers/clk/qcom/Makefile                          |    5 +
 drivers/clk/qcom/camcc-milos.c                     | 2161 +++++++++++++
 drivers/clk/qcom/common.c                          |    8 +
 drivers/clk/qcom/common.h                          |    2 +
 drivers/clk/qcom/dispcc-milos.c                    |  974 ++++++
 drivers/clk/qcom/gcc-milos.c                       | 3225 ++++++++++++++++++++
 drivers/clk/qcom/gpucc-milos.c                     |  562 ++++
 drivers/clk/qcom/videocc-milos.c                   |  403 +++
 include/dt-bindings/clock/qcom,milos-camcc.h       |  131 +
 include/dt-bindings/clock/qcom,milos-dispcc.h      |   61 +
 include/dt-bindings/clock/qcom,milos-gcc.h         |  210 ++
 include/dt-bindings/clock/qcom,milos-gpucc.h       |   56 +
 include/dt-bindings/clock/qcom,milos-videocc.h     |   36 +
 19 files changed, 8112 insertions(+)
---
base-commit: b803ad80123e6efccfeeffa7cd37f98f642e37f4
change-id: 20250620-sm7635-clocks-7699d338dc37

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


