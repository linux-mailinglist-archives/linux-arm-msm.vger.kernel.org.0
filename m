Return-Path: <linux-arm-msm+bounces-49262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED64A43ABD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 11:07:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E27F3A5BFE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 10:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7C2126B957;
	Tue, 25 Feb 2025 09:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FFcg+AOY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E691D269806
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 09:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740477574; cv=none; b=t433op7CcE2nlicqe5mG5hBoWJUGY/4Uv+Gk64H6g3irIjqMFYDPOhe4DkWpL6sUGijfc7L8olHeTBSavAAy33xs72m1uQ6kEvtQkG7sIFSroabtyntdp/Lxnl9PVzoEJ+dzx/8dQ6wph8w54lVmZhIM3BJ/+sadNvLbrOuxnw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740477574; c=relaxed/simple;
	bh=ePJXG/FKiF61OwVHnQ/ULScMbiFJJ6uqCb49DA/AKdE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K9b1y7hSVkngzOPTtJeNCXhfcJf4o1Uv6lbAAVRtmQFzDgUm0qVe2RDguk4fSfSwd7pUTtZOedHJsgqfMB6Zpini4NOo/WolUdi5HnK0xbuuWZXXIwI6eHz+oRkfOxBPOc11hwZ8zQ+62Tqkprccst5GSiYA6Uy8LqMhCXWDQLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FFcg+AOY; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-abb88d2b67eso62648666b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 01:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740477571; x=1741082371; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NDP9qdF88560gFyYHsisHd5pOHDz85bi/ebZoJGmr+8=;
        b=FFcg+AOYvi/9Hf7IUfxaw+mJic0fkb6yyMHKeTMcSUt3/MNNvpvMSYtl1cKbdhHNwy
         Eog2qO7JRwPlFEzBc1hCeCh24MyE1AkOmDT0R2s57fB9SqyLfNJFRil3SLaFexuy6d7A
         pv8GXmgVbYr/wGnvC57iuz/w2IVPX48niv0Kk7Jn9pmpRrSgZTPiWrQ4pNQnk36tm92e
         hRlLrgpON/E/S6Vi8Kq2mP8nbrk1uXvcGtvW/CpgRJh/8U3iwHnPLvZLSlW3s1UbDXXy
         +rPc3Awk/ID/iba1poNzAmEP1e18M0UF8utITyPk52mWNkeRNoECb47bF5m2KYji68j9
         zs6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740477571; x=1741082371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NDP9qdF88560gFyYHsisHd5pOHDz85bi/ebZoJGmr+8=;
        b=vCm3TW0YrHYW4kp6XRpoKD4Qzhugbl3ehUduHCTeQ4oOXuEyL9ZBvnGPf3o2fayHct
         XiVvpCnF1W1cEt8g+iki6h08dfiDZ0WcQGjVyVbvY/kJI/vmsGfcPACa/ksN6hORmbJR
         VqLvGuuWVbkmksGTkRg1SNzv1mBmEKR60d1AhzsJ4IiJ0JkTb4yF4YG6WrEXauQYraVN
         9ANG1x9SST3KDOFl438XC+X8i4YWnHkDL5A+Xorr3fIiFf5r9M/3GmAeSBssg84R44uO
         JxW2lmlbq032tyvBoDVd0cckl6Da/yx1IZpyPdGDtlU6/0OfDAh+apqWTlJ+T6O10ZEo
         yARA==
X-Gm-Message-State: AOJu0Yx1pqsV/jkmoynqsn7bht0p87eTC3jNh8rw0ygFAsHhaR4NZpGc
	a/6Tk3wOhZLCpu4vRCl5D1JjJFcwcEHdik7rYKt0yi8nPWwH0D5Uu26rNaAh/y4=
X-Gm-Gg: ASbGnct3VHjlFnj70PHSzCN5qUNJiTqrAXIpx2w2/551iNPAq1n/3ROhipu9+9510Dp
	UUDCpr6GKYcoGzAgM6Y2GMrlYoLYzKIFfq+vRDI93eMzNv/hDBCSMsDhbqpJKBuEnrc57hqttgu
	8/dicE7t/JtJdJz7YDCgV0tUrjUjXAvRf/VMZ8gYRMlkAh1aPT47Es67BIo0ARpmRuU79GcI6Bk
	b5W3PRW9LG+o3PTV4Xgpa0ZRsrSXXSKhhzhdX1GV9CvgWnW75W07KrK1liooNzNjrHPGukm0WDc
	pzl2OF+/ouaccUwW7UtwMZnmb7ry/rytZzxuuRWoyUeUuOHOFN57rIIF0uh5gEqr56BIvRV2mFP
	8
X-Google-Smtp-Source: AGHT+IF2fXekPucfaA8HWvVlzBAlO65pPG5DIQZd2+drruVe45iJ0dYetWFL+W9k736ejPDGUtSLrA==
X-Received: by 2002:a17:907:6d22:b0:ab7:6056:7a7f with SMTP id a640c23a62f3a-abc09bccc3amr564697466b.9.1740477571017;
        Tue, 25 Feb 2025 01:59:31 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1d59391sm115164266b.56.2025.02.25.01.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:59:30 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 25 Feb 2025 10:59:07 +0100
Subject: [PATCH RFC 10/13] arm64: dts: qcom: qcm6490: Switch to
 undeprecated qcom,calibration-variant
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-dts-qcom-wifi-calibration-v1-10-347e9c72dcfc@linaro.org>
References: <20250225-dts-qcom-wifi-calibration-v1-0-347e9c72dcfc@linaro.org>
In-Reply-To: <20250225-dts-qcom-wifi-calibration-v1-0-347e9c72dcfc@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2679;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ePJXG/FKiF61OwVHnQ/ULScMbiFJJ6uqCb49DA/AKdE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnvZRv8b226qGGisPG97e6CiNFkAlQRJlTlaL2h
 M4+czMDC2+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ72UbwAKCRDBN2bmhouD
 1/xoD/9Zcd5HCTCBN3d+hONduxKfu2SG0p4iRegk2skrj/Fs+1xsLdaIlNMZse1p/suuFJtqxzl
 lQb85pXrsiHCchsDJAxQRxxcocGPjEe8V2hMoZNE4vlnB5rZPJ5V5tUuvKhYQoGo2qPrKCbyL7m
 h1qiFu9Mm9C6i30Kgin9ZeNzVrJg2un8WdehygXboc7feka/jSosuDxbNA4+XibBQRtGMzXUJxh
 mE7KqFspbHk3kZ4u5dtAJxW/xJ2XKGmf2UghuxqyS3zCt9KUFlXysxMaTriOt4TkDQ3olNSw1ph
 QSVzjjO3D8QCzbm0VWw/WOO1KL/cgGIaBo5OFqS0PPt+BW3PN2wbxk7U/t4aa7iQqERHx1ILrSz
 cUrq5QZduGoeQ/BcPAVOO+Ka8cGIZe+fdkdMJ60fG++Z08lbWcmmcbCL8vOdNfKR9381Bay0BgO
 DRE0gNJuLEhM1kdZcrBfIqZ/MYfBdCWNl1VNSzfuBnrcMZRimKeiJWT6lFKdj4ggFox6j3aLgTO
 eIjvJDE0UrKlm2rXAChppQ3Mnrfc2vLGveLp98db8PQr60rJmOB/D9cw5YC+y3M+n8v9dHTPNFs
 SI6Ajb8r75S/yc6qs6Xxx8fYAxeB0ZVHNfJ6QkS7z+Y2NrV/g5qAniWmB2/xZRhRN5gyqsmuDSO
 apG9Q8ZYrz/j2ow==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The property qcom,ath11k-calibration-variant was deprecated in favor of
recently introduced generic qcom,calibration-variant, common to all
Qualcomm Atheros WiFi bindings.

Change will affect out of tree users, like other projects, of this DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts   | 2 +-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 769c66cb5d19dbf50e137b3a72de2e36ec4daecf..d12ce8ed43f0af50d751c45cdac383247b44fa84 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -1190,6 +1190,6 @@ &venus {
 };
 
 &wifi {
-	qcom,ath11k-calibration-variant = "Fairphone_5";
+	qcom,calibration-variant = "Fairphone_5";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 9209efcc49b57a853c4dd55ac52cd4dc98d7fe86..f26c5c2fde6b81863661873fccc7c3dabb198585 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -755,7 +755,7 @@ &usb_1_qmpphy {
 
 &wifi {
 	memory-region = <&wlan_fw_mem>;
-	qcom,ath11k-calibration-variant = "Qualcomm_qcm6490idp";
+	qcom,calibration-variant = "Qualcomm_qcm6490idp";
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index 75930f95769663f6ac3e2dd0c5f7d224085dda40..712f29fbe85e596f35f0fec350308d89070ef0da 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -953,7 +953,7 @@ &usb_1_qmpphy {
 };
 
 &wifi {
-	qcom,ath11k-calibration-variant = "SHIFTphone_8";
+	qcom,calibration-variant = "SHIFTphone_8";
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 7a36c90ad4ec8b52f30b22b1621404857d6ef336..0729168d40b0b8652beeff8b5accc11c09f8fbf4 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -919,7 +919,7 @@ &venus {
 
 &wifi {
 	memory-region = <&wlan_fw_mem>;
-	qcom,ath11k-calibration-variant = "Qualcomm_rb3gen2";
+	qcom,calibration-variant = "Qualcomm_rb3gen2";
 
 	status = "okay";
 };

-- 
2.43.0


