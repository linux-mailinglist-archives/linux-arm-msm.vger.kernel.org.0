Return-Path: <linux-arm-msm+bounces-49439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB3FA457BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 09:11:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6C633A5328
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 08:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CB65258CFE;
	Wed, 26 Feb 2025 08:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OwKLCuh6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACB0258CC1;
	Wed, 26 Feb 2025 08:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740557472; cv=none; b=Vcj+hCcFYa8Gory0Ra8jT+iw2y7biP05EMmU6OxKFe7OhtIO3PGDRWYKdKtiEJXgOBW0wI3vyf5Ovk3rMqpTuRVhpCL558rxz4lsrQ+KK1KrbxaNbsgF+VFco1MDdnC8QTfg4tgskQNy2UHoTnDmedSehLJzaw4AYGwy39KizNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740557472; c=relaxed/simple;
	bh=KDES5uF21mvxBvhM+ltGYgr2RNHky/xKTFAr5D9B0ik=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bn12kRqNBS5RoS5vglKmvI7avaCbvYIx4bGscdChRV9lQjl17WRfSOCT9K4giqU12QZ+NuE4+DXP5SLNqBs/M4zuxQ2gtSn6hsslC+KynCbRrYYDGCjzQtmckwFw54SAWuo2M8e++YK7G/u4cIrI5b6Zn8CEivs/kOsjsmEcR/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OwKLCuh6; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22114b800f7so130320525ad.2;
        Wed, 26 Feb 2025 00:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740557470; x=1741162270; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3z1MJaCTxF1SDisC/mT94LqBSMyXwhbG907miCNkk+c=;
        b=OwKLCuh6uTPR/9y9W4wEAQMZUbV719Xo3nFPo6y8OVWBsbmnHVSysYmDqISOBDz/C4
         fhh6CpoJlAcRHoUmEtsreY7ScbCEgOQFFNKz1b30wmoVMwsTIRTHwLHWGNtNrQ/ThBk1
         sSqQLPVGn+55Jt2nloOshhTezOyJG0Z1Opq0/VZi7WNPHBzY8lSFcnNWNP1aV9OTDsXn
         Ps+ljV708OHooklLRQN4vfMMdNyNbOk0Qo3wIRecCgLL77k0kEZX6rt9OJtWnZWfaGnJ
         aWxiv3GObqhh6Q8skVQyIqa90k+G8h8FfAbeNBKtfKGld6dg0kilnBBlCclIRjMyCwRK
         /1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740557470; x=1741162270;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3z1MJaCTxF1SDisC/mT94LqBSMyXwhbG907miCNkk+c=;
        b=p6jaYyaz8Uyr/boYhTLfCxisz+mIl79jlM6o+dFKdFz1eZicLCUr0+U14b45JLUcUt
         b3WCK48lzkNKToqk70vAIkov6UYf7oL0w3CSSoxkorS3mqPpjpwhVmB90Pg3nNv2Z6Oc
         0G7l5HaPsbZz/8/vAWvCB/k9s2MtC3oMu686evjlgyqyPpvKBJIZI94ySDmVxfdwY0og
         Vh9xDG8YV4rV5EpE3DV9b/SSzK4O+XRk0P8wWljp3seEhlc/FmIor41OtZukrwlXo02x
         u8D4xJ6Gv7/d+tbJQGtHcaoL9WDHc+0ZcScQgMeTlAk/kKHNXRW8ywOpR2k9A1luoUhk
         GnGQ==
X-Forwarded-Encrypted: i=1; AJvYcCU16ORemPwRZlyPBp8Q6vGpUyNtYscVq87IV+vOIA1inFaIb4/Ne9Ab3b6L/octZoXT+UAMjYVc52g9@vger.kernel.org, AJvYcCUKJCrAdGpxAWMaKktyWi3pXsTGJN2UI093FVNQ8mBSLzqkiqg63NQD8K0kqDax9/P25r8+eZIy6eJLMKP+@vger.kernel.org
X-Gm-Message-State: AOJu0YwjvlkLbRUzqw53u7knR3m6MSvBdcBkWmQHCLblmTiBZ1m2ta+V
	WY+cbSKGKq4TQEQSpEBIUvGWTTy7RNKMUYBgjo0YwDsqnbHyDr5j
X-Gm-Gg: ASbGncvGMUjOTTn0wyT3L8gB0EzznD+h24IA4SllaSeu2I+fW0332wZfX0EM2cjUqoA
	YGBDkJ77kwmG0ejvIkYfghDGgtrIoT+mg1WZBwsY4ZtyO7E+ndmj5TYr1c1JeTP8h0KXgrYRWI9
	XYXD5rPL4uIgQmFURSROXZOQOHp2jaCGGtYalJR9IMgvgmWgNHm/tPlKBOr6eWZwUBbU+S7pajx
	NB3fwZOTjgV5HIHu4BAjCde5zxY/qDRoXxiTc+PW4Ci2NX5H8nAVTnwuZwqQwt3PG4HQlP9gSDo
	35ZV+3RqbF6TYNl33N8ucOc66+0=
X-Google-Smtp-Source: AGHT+IGrEjsuyovLVVBUD1zJCuHlVPeYZo1Jl1kCwKkWE0Cjz8hNTBbtMQDWeIyL5PDqEm/McSUzhA==
X-Received: by 2002:a17:902:f693:b0:220:d078:eb28 with SMTP id d9443c01a7336-223202081e2mr38579085ad.48.1740557469802;
        Wed, 26 Feb 2025 00:11:09 -0800 (PST)
Received: from [127.0.1.1] ([2601:644:8501:1640:3de5:6339:3d24:b93b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2231fa8a570sm10641625ad.58.2025.02.26.00.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 00:11:09 -0800 (PST)
From: Rudraksha Gupta <guptarud@gmail.com>
Subject: [PATCH v2 0/2] Copy tsens node from apq8064 and adjust some values
Date: Wed, 26 Feb 2025 00:11:07 -0800
Message-Id: <20250226-expressatt-tsens-v2-0-7a4ce3a91f27@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJvMvmcC/32NQQqDMBBFryKzbkocEpWueo/iItVRB2osmRAsk
 rs39QBdvv/57x8gFJgEbtUBgRILb74AXioYFudnUjwWBtRoNaJVtL8DibgYVRTyonQzmsZ2rbO
 dgTIr9cT7qXz0hReWuIXP+ZDqX/pHlmpVK43mSWQn1Ka9z6vj13XYVuhzzl9qbPh6sAAAAA==
X-Change-ID: 20250225-expressatt-tsens-06d46587a584
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>, 
 wctrl <wctrl@proton.me>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740557468; l=774;
 i=guptarud@gmail.com; s=20250208; h=from:subject:message-id;
 bh=KDES5uF21mvxBvhM+ltGYgr2RNHky/xKTFAr5D9B0ik=;
 b=QS/JKPte6GyYRYdeVpoFyUPlt0Mm2AN0P4hnMFPhzgj1GysqIl1HHM062EOPleir46hvGaNI+
 cDD3TQxwn5qCbRB538uXzlVoRrGWXiB/nld5L817G/geEeJ3aPR85mI
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=5lJNaiR/Bu7edToWFLriO5zXOrVqSQWrBKbAKwuEw04=

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
Changes in v2:
- Remove coefficients as it's read from EEPROM
- Fix dtsi formatting
- Fix dtschema warnings introduced with v1
- Link to v1: https://lore.kernel.org/r/20250225-expressatt-tsens-v1-1-024bee5f2047@gmail.com

---
Rudraksha Gupta (2):
      dt-bindings: nvmem: Add compatible for MSM8960
      ARM: dts: qcom: msm8960: Add tsens

 .../devicetree/bindings/nvmem/qcom,qfprom.yaml     |  1 +
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           | 59 +++++++++++++++++++++-
 2 files changed, 59 insertions(+), 1 deletion(-)
---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20250225-expressatt-tsens-06d46587a584

Best regards,
-- 
Rudraksha Gupta <guptarud@gmail.com>


