Return-Path: <linux-arm-msm+bounces-28413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9BB950CA8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 20:58:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB655B2643A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 18:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB521A4F23;
	Tue, 13 Aug 2024 18:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RX3y3c9C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1983F1A4F02
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 18:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723575519; cv=none; b=d2z4NZTpKaSaXnSuAlXlu2anqTwOER1fRKcjA6N7dd1nd+kINA5NHZ44L3fPpbzM5/K1AYIGSndvd/3javQPSX0qPbvueYcHTUFvMGH/ARCXKtdvT4El5gs4cjWmpN+Ge4eWiSghBdCo8SQ/2q/BgigbpZH+8aiNPAuXcsLGm/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723575519; c=relaxed/simple;
	bh=VjVpCXhdprY8yAPr5q1xpO89FnUJgWu9bWelY/MfREs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QNuMwBhEC7nduyUaOtuVe95xbH1uqb5sOPDlEI4wcOPIgEfNLjlh+dRn13d8u1dTlHoSP7m/QcbPwHkuqdhFow8X+5beC99c9GBgVXezrCyB2I77mp7hJ75A0tKAUSwemZbQIZQKiQdOwSVuKGjD7bV7dLsP1MfW4dFq89tRfcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RX3y3c9C; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-428243f928fso58066165e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 11:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1723575515; x=1724180315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=etIaN+U0WiI8zpIpI/yy1cpDhwtG331HdZOmJAhsY+4=;
        b=RX3y3c9CC7MM3b8yE7dP3UM+1EXDjXChm8geasOX1oOvPdYRIzeBEasfHPS69VrwST
         2iBu6+Uq7MsqaD8KI44SI3/MtXH4JXaTL2wfyM/j4Bqey8tIHDQ8CtsF+mE1coxdqimR
         4gVAKgGUQc+CpXIjqv11OEzuVCar1I3YlbyVWELt+yW23x5nTTmvepqRP50bsrGsreFW
         rxbsmffGh1Rvwfb3jlHqOcBJYXElgsZ0KLwk7SEsAh3FHTB/RCWlKTFI8v1EjyE+Y/aK
         vBM56Q64dGjNo8hki/mbtPpDNrXIZe8AfPFQrXtRnsraI1C+OiTQRKFU+dd5YuLiGLFn
         QIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723575515; x=1724180315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=etIaN+U0WiI8zpIpI/yy1cpDhwtG331HdZOmJAhsY+4=;
        b=VQFb6IB54kKfMsBVuNU1vV0DJaAIWtLDqpjAIXC4fFnxTH8h0ZOfIMSD4JQUtMvCXE
         XV8WOw4lZJB4utJ2hcn5VE+GIL3rk2GfH608WjxAhPd/YzHLpoZOueRWtEXIUtdksWWK
         JiO6wWkvZ0SNlcnGIyR63egeUU4YwBhyslnJhxrMDmwSMaguyV64jIxOAWYvJ/S7v9Zv
         woHLQdc5psMRAfTn4TGU8rsVwB9514EKvVZmJGRcCfwiIDJL1ztjQbP/JCVRmbPm/Lwh
         GgOU7i4TSWUElkIyLIwysn2I8wtdSMfY9YGhH7RtB0U117lIOMjkQHr48qQosTvi4PfB
         xUWQ==
X-Gm-Message-State: AOJu0YxTiMrYu6S7Owgnz8cpLjKupA/HyQaz9U0TN3WEU7KJKoy/O/Tm
	HBhWFttB9WU57p3lQjX/zZkqRS6qdvPPPsC/Y7MbvH9dRmEz+UuZZGP21qXqwAQ=
X-Google-Smtp-Source: AGHT+IEy/ZjbXzN9pK5GQhzOFuJMOZ1u7SAEu8Uz+qQh0Yk2W331GPyCG+wCDY1nhz007Yqf/Ab8Nw==
X-Received: by 2002:a05:600c:4706:b0:426:6fd2:e14b with SMTP id 5b1f17b1804b1-429dd2365c1mr3967065e9.11.1723575514278;
        Tue, 13 Aug 2024 11:58:34 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3979:ff54:1b42:968a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429c775c509sm151208145e9.44.2024.08.13.11.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 11:58:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/3] regulator: dt-bindings: qcom,qca6390-pmu: fix the description for bt-enable-gpios
Date: Tue, 13 Aug 2024 20:58:25 +0200
Message-ID: <20240813185827.154779-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The Bluetooth module is obviously not an ath11k so drop the word.

Fixes: b5cb34c93bd4 ("regulator: dt-bindings: describe the PMU module of the QCA6390 package")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../devicetree/bindings/regulator/qcom,qca6390-pmu.yaml         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml b/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
index 3aaa9653419a..ce7771f9fa36 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
@@ -65,7 +65,7 @@ properties:
 
   bt-enable-gpios:
     maxItems: 1
-    description: GPIO line enabling the ATH11K Bluetooth module supplied by the PMU
+    description: GPIO line enabling the Bluetooth module supplied by the PMU
 
   clocks:
     maxItems: 1
-- 
2.43.0


