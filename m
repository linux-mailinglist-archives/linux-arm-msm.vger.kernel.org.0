Return-Path: <linux-arm-msm+bounces-73227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B11B54375
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 09:05:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A338F17725C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 07:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C39A1C1F13;
	Fri, 12 Sep 2025 07:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IRX327If"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE402857FA
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 07:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757660718; cv=none; b=oBt+CMOb3b4+P6bv2WcXlIS8AV1Y5LAQZnN5aLYmpH8aii/nT8s4R15UjQOQn3QV0eFtDQVgijAiWQMt0bLxSRRW1+sXUhgiAHEk4PmHZDCaIeLS7idRHikXySGZTkayx9rdU1dLAcxWA5AR4Tu56kLqrgoNzXhg6EFpYyl/vws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757660718; c=relaxed/simple;
	bh=572DFU9jfopt+pPd0GVuZvfPHZV7rjdAPyzKWts76qY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P3vTy/wtE8BEaKahpamVaxD5k9SoyW9nmzFQbN+DxwukSp4lR6j60mR8J2zCtmHZxqvh0It/m0UY69EYjZv8GdgMbSeWoJ1QgoheFWZHxhBFIR4gKepfdSkVM2e6OuO6zeMukDJePSbSVccIwMqaZCfEPPsKza9IF2s+lye2KGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IRX327If; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so1398535b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 00:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757660714; x=1758265514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CrCZ/4lfkyLu6sbBLzuKM2Dvm81cgTRaZ1Y0I7OWBd8=;
        b=IRX327If0r7Wk7XC0bdTEumhTg7YG8Y++fjWyt96DaPU+8Eo7uWd+pTLDmANcjvv8s
         D1Q/M9mE3yQliaLg+7qOIkTmGbYiDt5MkMh8T5lF80ppl6qO4Is8OnKHw5CUSIwfECEw
         1YmOB+RFxElIn+f6YH/0XWXJ9zs1eQYDd5vhG3fLGNRSM54M0iK6DMgksfpj+72jSLJf
         MhYDvMKunrVLdd0yEwctXrhgO7c+kV7Pox7KvQHiGzcb76w+Nk6krXffsePXIzYI3UfT
         Fc5cI4BNiQRg/40wP7bRKCuzUolMbN7wP3NKTgaRz/vca33DGeyTiD2N5z63aaX8YYR3
         DIGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757660714; x=1758265514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CrCZ/4lfkyLu6sbBLzuKM2Dvm81cgTRaZ1Y0I7OWBd8=;
        b=UFzk0kROlaM5sovlG7RKQsvJWSkDpqBn7QQV76usmbiNVofwsjgZ7dwz/1oJqU+UUG
         bKMv6NKq0P/7vkp3oOF2Cbw735qFH5dUw+yNbYaImqlVYflkp0FFcdZISsxAinuQ8/6V
         F/UyLwbaPLM2y5LAwEmXe9EBHYofZVeFzsNK4RbPHxVd6NpOdyCpHZcoZOVrYqr9HkBn
         0CWSg06OMQalT9LsN4qIPUqF8f+VEohqyCTtFVhOtAVy0vQHANoCmkEdJV7tL+sw/nwe
         kyMBkN+gsZBPgB+o+KwkAoqSFLPtuQGdBBlVrL2TbxMajS3w1KFfvedLlKzjcpS17OM4
         Avpw==
X-Gm-Message-State: AOJu0Yx0vKsV/7vAP6XKWwF6qHPyv/ldLjxAE5gIxoY/7eT10pGGju+B
	+Xsj2fltYMn6/0w16KbGUiuCY1ja7OUD9PvD4XXANAD38WmcDTW+hKaWPKjhcsTG
X-Gm-Gg: ASbGncsypGUwXh6QN+xNllYC4qV9vkMKJ52iSpj5hvzZfWG1ouerpUr/Cv2rHU/TtkR
	Kq60Ia4ADyjZNXdD/O3eEZSBVaixHHb2pXXR4HTeMlEwSICSxW8cpRp/1BrYoZkLcn/bMUz5Z0G
	xq/IX9dODpBkyfDhH0Uu9Idp8kOFYODCltqtfhkvpIcvWv9Rpc1qzSfLPuTPpCi2wYcaONiRTxL
	dePDuUVcLbglYcRzUKuaB0HkdmKB+l+XIrMNiF49Iw8hn2ReaxooqARzXw0HOMlIOwOUP6J7ZxK
	Z0sjvsu9+myTPJrSpohjMxBGJLZ8ieOcpjSZHP0DivDD4EpW+pAwqiLip+x9k2Nz0TVE1aMC4YU
	4lGsMl/Nh6L8ZrS8g7UFeI19wPi2FFFO60GwjPtunwZp63gB3ZHC71G6errATUYoS3g==
X-Google-Smtp-Source: AGHT+IEWEFpoL5MC+MBgCE4p1Z3kBFGvdcN5KhhxsYEkiO1s5V7LSIfR5KPmte2LyppCMRUnCfAeYg==
X-Received: by 2002:a05:6a21:33a0:b0:24d:b11b:e908 with SMTP id adf61e73a8af0-2602a3a4a37mr2268661637.11.1757660714251;
        Fri, 12 Sep 2025 00:05:14 -0700 (PDT)
Received: from af623941f5e9 (ai200241.d.west.v6connect.net. [138.64.200.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607a47d7fsm4412620b3a.31.2025.09.12.00.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 00:05:13 -0700 (PDT)
From: Tamura Dai <kirinode0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tamura Dai <kirinode0@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] arm64: dts: qcom: sdm845-shift-axolotl: Fix typo of compatible
Date: Fri, 12 Sep 2025 07:01:46 +0000
Message-Id: <20250912070145.54312-1-kirinode0@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <38c24430-16ce-4d9a-8641-3340cc9364cf@kernel.org>
References: <38c24430-16ce-4d9a-8641-3340cc9364cf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bug is a typo in the compatible string for the touchscreen node.
According to Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml,
the correct compatible is "focaltech,ft8719", but the device tree used
"focaltech,fts8719".

Fixes: 45882459159de (arm64: dts: qcom: sdm845: add device tree for SHIFT6mq)
Cc: stable@vger.kernel.org
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


