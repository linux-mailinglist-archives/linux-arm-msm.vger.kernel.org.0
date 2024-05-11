Return-Path: <linux-arm-msm+bounces-19752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB59C8C3472
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 May 2024 00:06:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECE121C2102F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 May 2024 22:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E7B5F87D;
	Sat, 11 May 2024 22:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KMyAb/Rk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DAF58AC1
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 May 2024 22:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715465061; cv=none; b=BzgYThh0cOaB2Zs5+WMVsDnt4rirxvGCCpt5GYryrRyouvaW228Shd1vdgc7U4EZbxdx0bgvKOfsNpJZDJtdTse50z1BR4VCKmlFTLW59hkqb+65a4GdLaKB9JWEQVgZaumZ/ZF/aFZmAxv3wUc8i325LrEnQpaFvI8LX1VnCts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715465061; c=relaxed/simple;
	bh=2X9TSF9mpPgpbniBtbr3RQy14gET4Nt7uQSs8F1H82k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nwo1RMUUA1aIkj6vRt+B53JE8CavjAlXmmVrNczlrOEvof932mpvwLXC//YiyYMRnfZ9N70YpsVUb9A0Mko07upNNouaiWpjjI0TEydkRr+b00ti3EXiDWgAp5T7oEBfSoYSk20O982jee9xJ91WRSQ7QNed5XyuJ8hXkpkNDyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KMyAb/Rk; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5231efd80f2so27849e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 May 2024 15:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715465058; x=1716069858; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=etPGlhDWRxy2MUXfAs4NBOjvIGN4vsVr90R24B7wpPM=;
        b=KMyAb/Rk548umUTkhXlOMk9BG78XQCAxKV0ddXiPE13EOX+EtSyPs1w3TI13c9qMzo
         +rbhooUOlu2c0B4+g6B+U1wUD1++U3RLPGP2Iz7eGAhLWrIgmDDTL7756SXtLkj6CN4Q
         RCEE4dQIll8+4BRYR7T6/HJCY0KskO7ZpZU7C8/IrN5hztPLANUQf86RPL1bKHvpJjwX
         raUPOLnp8mg6b2+KxuMnifEYmiKGmEueRUMpDyM/MZ+VxBzJoo5EkzoNUHdGD7s6SH9l
         +ozB/qxPw2XZNFcRYSovKbsK4T2dAW5QIhB/TVd/skOIm8mm5vuKRl/BmARaDdnDEDN1
         hY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715465058; x=1716069858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etPGlhDWRxy2MUXfAs4NBOjvIGN4vsVr90R24B7wpPM=;
        b=GenCtcycGdZHpIyduG7YFMZc54vaGFLiuC8msYXu1JuqQCRyWv4ESyGgtrapB7Fw9Z
         M5ApvnVmYOfPeL1gMm4HhsyHE/X2TTkS154+1lJoO2B0nBgoFmI7q2o6S441Ae2Iyjq9
         poKdbFJfhSjrCtslZDyLfCJ+EzSgPHLMwAcXqdkXYU4kAeucBaOMGRdc9xNXKAoJmo8V
         DLDy4/oiqMiOxOiRZ1p8OGLXlqWTZz8st4kWWiGwiwPkwpyPxS+vI350b8CZCm0w+WnJ
         ufYCwG0WfeojvrGC0pquc30LT69SQHl4vAVJHkreZvhnTFRq6xYjPdR9XuRRji7H7T+X
         1jCQ==
X-Gm-Message-State: AOJu0YyuC+m3AyFq+FwbfT5Hv10NOjShFDK1qAIihEDQS71m+4pX7kde
	64C6wBxwLzdhiJIV/nJMToPy5SXiSdt4bnQZhYZewo0MjmKNt6HpneYI+wJRl8g=
X-Google-Smtp-Source: AGHT+IG2XsjgS4cbuPJ5ppeA0B7bDqDs6E/McKESaridVAwjhdDKZYdJpZJGBOy7q71GzuMotnquEA==
X-Received: by 2002:ac2:4309:0:b0:518:bc7c:413a with SMTP id 2adb3069b0e04-52210276505mr3128424e87.69.1715465057806;
        Sat, 11 May 2024 15:04:17 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d878fsm1123875e87.206.2024.05.11.15.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 May 2024 15:04:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 12 May 2024 01:04:15 +0300
Subject: [PATCH v4 9/9] arm64: dts: qcom: sm8150-hdk: rename Type-C HS
 endpoints
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240512-typec-fix-sm8250-v4-9-ad153c747a97@linaro.org>
References: <20240512-typec-fix-sm8250-v4-0-ad153c747a97@linaro.org>
In-Reply-To: <20240512-typec-fix-sm8250-v4-0-ad153c747a97@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=948;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=2X9TSF9mpPgpbniBtbr3RQy14gET4Nt7uQSs8F1H82k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmP+tYCqjWTMqYT9C9MzILCW2xppEsFrszHxcGD
 9qoZpVEtyCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZj/rWAAKCRCLPIo+Aiko
 1bJeB/9dYlm2ImAAYIpoDO3azYyYwVLOLaqOX/SDTnE4+gwhzOpuEqtbY5JiqriY60KKW9ij7/a
 1mxB0aOSWJt2Ky3k53n27tKZ1Crys9glIyen8SE0QNwxhf6Brl7GbxNgW7kMi+i4J93b36eps5J
 FZ8qFpj1BwynxQCkhoU4rbQvJ1TXWGhDTbjRX1+nBhENSy5lY2j5dbgawc74H0qAG6RbUzUM3MJ
 h5enTm7NSR+G40BziJa9JNIQXfPsqwoWX28LRRn5PDx8auXoNhHOtJIhVkykOAdnFv7nCCEvxXs
 Y/fuJLyIAIIueu01Gxgaojt3fl34BbpnN6ohh32m2RW9ZVe3
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Follow other Qualcomm platforms and rename pm8150b_role_switch_in to
pm8150_hs_in. Corresponding port is described as HS port rather than
role switching.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
index 6cb6f503fdac..e9b9abc18746 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-hdk.dts
@@ -556,7 +556,7 @@ ports {
 
 			port@0 {
 				reg = <0>;
-				pm8150b_role_switch_in: endpoint {
+				pm8150b_hs_in: endpoint {
 					remote-endpoint = <&usb_1_dwc3_hs>;
 				};
 			};
@@ -708,7 +708,7 @@ &usb_1_dwc3 {
 };
 
 &usb_1_dwc3_hs {
-	remote-endpoint = <&pm8150b_role_switch_in>;
+	remote-endpoint = <&pm8150b_hs_in>;
 };
 
 &usb_1_dwc3_ss {

-- 
2.39.2


