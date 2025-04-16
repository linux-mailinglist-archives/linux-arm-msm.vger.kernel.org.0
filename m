Return-Path: <linux-arm-msm+bounces-54492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB56A8B83E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 14:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FC0F172729
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 12:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B8C23FC7D;
	Wed, 16 Apr 2025 12:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LeKvEFVw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A5224728F;
	Wed, 16 Apr 2025 12:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805070; cv=none; b=P51xa0mqfhd+QcNSIs27mmS3y7gRNG+uwGZ5AJ3zgyrF0j1cTjhp12DZnV6vulSGQzRoJ+2P77Kh4pegFj1BqJLjJ1HTlRI+F2ICjpFP4GwoCVq5+gQ5c8zFUgn9Zqz/nMUSQKGfRmto7Sr6+EiIV57hY7BDSbRW5z8Xa696d+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805070; c=relaxed/simple;
	bh=N5G9mRINCYZ8LZ4QGQ0gtT9BgYXjs96KJhHQAGMFPtM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YB8clydYiyKVAIoHFYKqnPQEKzvyv75zQqB34/jEcw3Je2CscZlfo0nnmbENXKB6i3W5GaHaj582yov70NQ5rexHgfZolEWlHWUjucYYqMdd792UIP/BKmabHspTAGVfd+KQ5vYqROj4HucbWiRP9rimxvUJp6RXvq0+FJt1I0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LeKvEFVw; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22c33e5013aso6072315ad.0;
        Wed, 16 Apr 2025 05:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744805068; x=1745409868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9tGlDQ1IGUwDLO9hraMXZmL07bXao+CXFFnK+kzwkl4=;
        b=LeKvEFVwepNe17jsqcaJCJ9TwMfm5e2QcXiWMFE2EeTOvBO/s5ffw7KwVxYMSO+1MC
         HOWvdVvyUVXvAjU9PFyfRA6Ia4OCwHdte99YHbVRBvEiDb0icoog3z+Eoa15DeiNp2MT
         JRnsW719TaV+NIsgQYV4pG7gJD/dGROtzM5w/iOm2P5S9IzX3hIQXNjrmLIMlQdadeAa
         imBnFvKM5wF9k84Gx/0iQsI9lFZAoyoSSg51Dk1ZJjz1P0zXzHCKieFjB0OVtEiyqyI+
         MMpjKCcQ7lUoqRafktr5ZPtT0m/Q+/3eO5dWLSowLdCenARAeFQD5SGLY5/kSe0qvRNX
         vK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744805068; x=1745409868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9tGlDQ1IGUwDLO9hraMXZmL07bXao+CXFFnK+kzwkl4=;
        b=vXhdKa9kAVFCQHvYad6rRhxt5FgmKdk6v8qz3VkxEoXTLfPTfYO5UwZHU1q22+Dkr8
         /REQEpLZugyW/K435lsaOKqh+BZKnY157cIsjou6/7u62fkOy7VjSdJ84lQdDf88uunu
         6MZAeyksnPXCo8SEKKDdXbZYTM+duToHevSOQgQg0pxs4EE6eCAP2tw4y9CyErz8hzvu
         HdtnJFB15smWKem3TjJEEEG8mdjL6kgVly6tIM2hWq6n5gYG01EaomyTanHrTGZnTmP9
         Cny0cRPsHUnF03GKjIvAaoyJZCDHfwhkdBpvxXcTItyimD7hJmPSd3088mWAEM1rHV7J
         dQFw==
X-Forwarded-Encrypted: i=1; AJvYcCVcaFYIW9XPFzpcd0pMHMNIJIJfsYn6CZBiPAxBRFxpT94lmusj63cw8JYLma4reaYoi7/RbG/7J04JWBOk@vger.kernel.org, AJvYcCWzw63sB/2Nf4oVd8A3HaSxvEMNx7acw3fPW7pgcIQE4yNJPiBAW0iQTLe+ZHl12zpIoltjcJjQF0yl@vger.kernel.org
X-Gm-Message-State: AOJu0YyqFMLCEwqnTPiAZfeu5cU/3bZa4M+wnf9WiYNz3+ptDJwTszVA
	5NleRHHQ3pBoLSzG+m+LnEMUKqEL0+YbW1eqy0hO0RTOe0RURtlK
X-Gm-Gg: ASbGncuVxoztsrUX/Fk5bG+llO1fQ9Mz4B732jZ1vq5A75j4j/gDiLvNN8UUlupST/y
	8cRD3viw4tZs41LTLFZk/g3dc9KeWxsAL7QZ4MPQUDO1yKU/X1GXq51llQDVvTe6/CMEWliMDFw
	FuwD6vE9vuWLdR5FuEzIa+Kw6kRUQwDDEE+08qzJEuxVOcMnjSNNtVcXfKP8GGsu1+w7e7m1kft
	cjFLsIUHaTymz+mDNxFEXtffZ5LnmnRu4cVcgRMXniSafNQw98r517fGoywrWbflTyUpPFttQeS
	WpOgdks/qbq9DRo1O+Ljwoyh5FMt6sYQJXXj/U7dTSxQ6sWsaw==
X-Google-Smtp-Source: AGHT+IGQweeqw93BBrEZ2xKPnpflNgKnyE2iuuUblGrDtL4/O2TrHxcy8ICju5cv/v4MTTf4qYa9rg==
X-Received: by 2002:a17:902:cece:b0:223:619e:71e9 with SMTP id d9443c01a7336-22c358c4130mr19704575ad.11.1744805067880;
        Wed, 16 Apr 2025 05:04:27 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33febfb3sm12033385ad.259.2025.04.16.05.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 05:04:27 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] phy: qualcomm: phy-qcom-eusb2-repeater: rework reg override handler
Date: Wed, 16 Apr 2025 20:01:59 +0800
Message-ID: <20250416120201.244133-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In downstream tree, many registers need to be overrided, it varies
from devices and platforms, with these registers getting more, adding
a handler for this is helpful.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Changes in v2:
- Drop dts changes, backwards compatible now
- Changes for dt-bindings (Krzysztof)
- Drop sequence overrides to use single property (Dmitry)
- Link to v1: https://lore.kernel.org/linux-arm-msm/20250405174319.405975-1-mitltlatltl@gmail.com

---
Pengyu Luo (2):
  dt-bindings: phy: qcom,snps-eusb2-repeater: Add more tuning overrides
  phy: qualcomm: phy-qcom-eusb2-repeater: rework reg override handler

 .../phy/qcom,snps-eusb2-repeater.yaml         |  41 ++++++-
 .../phy/qualcomm/phy-qcom-eusb2-repeater.c    | 105 +++++++++++++++---
 2 files changed, 130 insertions(+), 16 deletions(-)
---
base-commit: afd30f00ef898643491ce0c0c2571b3498f1a61e

-- 
2.49.0


