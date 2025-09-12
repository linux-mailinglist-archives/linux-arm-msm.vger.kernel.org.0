Return-Path: <linux-arm-msm+bounces-73222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 826E9B54289
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 08:09:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4415E5A1982
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 06:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04D1723B632;
	Fri, 12 Sep 2025 06:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TtqRNNP3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE1A2AD20
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 06:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757657376; cv=none; b=kPOK3IcgLriEWG9D+X589l9nNXKHpo84JEjclkHqCdLLNx5s4njK933lmfrZP/GtGPMHUauB4SipqJSAVQMiwwfzd1z9TYmvpCC4zDyqBwJfAzB9WbtysOtxuZkDoWZOk8FFmZiZpKeoapGPNImKXD8xiv2pS4saa7F2mVS1OG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757657376; c=relaxed/simple;
	bh=TlPRpYbwmr7OOZkidAJONG6hHcs7sWog2LIz+3WzMac=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YzNpwhegqfOyxlEagOJLd7KQwPlh/hQBkuHbe0z3AP8qI7cfgXJ6cCWIB/yCoup76SRXz61qOgDdOW7sMm5PS+BhUcVbWv/YRb4UwI6pzUSCBy1D3AXmRaa3+7Ljvs2V6bLjjXWIKXyk3ljD6if880fbDYFXHuyCiWOn7VJ36xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TtqRNNP3; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b4d4881897cso958458a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 23:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757657375; x=1758262175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PHmi2Axy7+8qo7U5BHpZrqKUEVgZm49/TnuO9lYmy9g=;
        b=TtqRNNP3wgbtANd/ophykWYyITzB4ghl2VcYLStaefIep+2vbp4l+VRzphJ4Nv9n+D
         SqK/6gFcdq5+zSmF5RLZQM/IBo+juToTtaBbD/SwBD9QKy/IupQChujXOS7tb4TFoCke
         4i8W5HuY+pwmsXw4Zi/aZxY1VVLcSWfeInL29gRzzvEzkrutuLasyho5+pgeI37GGXeS
         2HQcGHXMa7NzPxMv8R073rigUU4T26FkhuVC0tHeeaQ6/jU8OaaHD4KOMvoxufVU0Nb2
         SV3s/aea5Ilz0w+5Eio4ObGwnZND96gKWZ8OTUb0NSGTGFIkGSBzhSDnks+VLXjXeI9M
         OrpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757657375; x=1758262175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHmi2Axy7+8qo7U5BHpZrqKUEVgZm49/TnuO9lYmy9g=;
        b=r/b2vH8VOq52uLASUOlJ0EiAaIGOaw8QOQyNiIiV+hyuDSWMaSKfYOEN0B9PQ0Udvm
         n0SZly/KeS4e9XoSpzvdNIL1gsJNVr6Q3el+8I8VPXMt/gfrUClfRLnt39o/w2XJibDy
         MIEy9yNyV+ihnQL52O7c4BmaeiwSIEPkFV1YKPAYnfNDm14unw2OPdtWL6UyS2E7xLdQ
         CN+ZgQZuwYvIxwzMWLHKuqicw5zXfi1GYPaVzHIUbBLVWmZ38jvheeSSRWfVdL3mczIi
         nevRFY27a415tNT/ZrIii2zHHXgcZRpJQIbe1c+sROTnPUwRKtuwUi6xxaUy58N02RWx
         GsWg==
X-Gm-Message-State: AOJu0Yw2DpzK/e2Cc6U7YXqrTc51MsRX2+V8u+UdkSfjMUVseLXjgb++
	qZihsIbSYIPHxNQXjGTw+/c0wMhwAAfvkB9j5kwHfZumHaG/pX3kasx9
X-Gm-Gg: ASbGncsHLGVa1ZmdB/JG3e/4ix8AG2xj6c8aVE+ziwJfnDj6NNK3T4su4uKpIF15ErE
	Xk3qFRC8LCzNL8JuYlgu0IDStufWQQtoLZHHHAzSKTeJd4VPN9zdgreLVJ0kBMZvi+3CRK37N3P
	Y1N32qE1RhAT4Jr7gA8wa+RSwjfT7pLZnTbypWqizDBHq258mR8R+VuMKaUz8f5Uf57IPj5i4Tm
	xCVwQ9Cb3e6aIbVyJ3AYwBh45sJNZROu8hOscN3HirEWCJcfjLMeiIKJD2mQFhg2Yb/8ripOl5Y
	mI5cztLLFseZOQGHKz1Zyly339d5ZNh4gZQB0uB8L0aoiKpRuJKtqBQ207X6qLo6tqlto4ZsWKM
	Qj6iAAzO+U1a3i1tsp5yF/XVYAYQ19afaCbPsGRz5WNDvEmwHUMTFvHN0Nxh21mWZ1Q==
X-Google-Smtp-Source: AGHT+IHdgaOA+rY2BJxhFpOhHU/02YengieWl6nPssZXURpbM+MI8UqJa5SZOjcf/XiPCvyPg/7X/Q==
X-Received: by 2002:a17:903:11c3:b0:235:ed02:288b with SMTP id d9443c01a7336-25d260795bcmr20375935ad.30.1757657374806;
        Thu, 11 Sep 2025 23:09:34 -0700 (PDT)
Received: from af623941f5e9 (ai200241.d.west.v6connect.net. [138.64.200.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3ab43506sm37885845ad.98.2025.09.11.23.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 23:09:34 -0700 (PDT)
From: Tamura Dai <kirinode0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tamura Dai <kirinode0@gmail.com>
Subject: [PATCH] arm64: dts: qcom: sdm845-shift-axolotl: Fix typo of compatible.
Date: Fri, 12 Sep 2025 06:09:04 +0000
Message-Id: <20250912060904.7659-1-kirinode0@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ref. edt-ft5x06.yaml

Signed-off-by: Tamura Dai <kirinode0@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index 2cf7b5e1243c..a0b288d6162f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -432,7 +432,7 @@ &i2c5 {
 	status = "okay";
 
 	touchscreen@38 {
-		compatible = "focaltech,fts8719";
+		compatible = "focaltech,ft8719";
 		reg = <0x38>;
 		wakeup-source;
 		interrupt-parent = <&tlmm>;
-- 
2.34.1


