Return-Path: <linux-arm-msm+bounces-19833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0070B8C5690
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 15:09:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 707661F226D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 13:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11C1A1428E6;
	Tue, 14 May 2024 13:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B2OklwyD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E451411E7
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 May 2024 13:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715692133; cv=none; b=I5BdEq8fGfSwjVC2xWcC4dLrxRejS/yX60uRte8sMY2nNn0e4vock0/q52LvS0ZYL0YnFd+XVYoY80VJtSHrsHax1aTEeJ/o+qHoMgcYWv8sWZbcYrpl9ezt4A38Q0hmYw8zzxVVdLsBe4S2HQ/N0bARiMr3CluBh4m8jnh+HU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715692133; c=relaxed/simple;
	bh=79N957sFT+botkrfIwoMhZsYTKAk7xgpP8euBkNNACI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uqic/ptN59sNE8+b17rw8aKWOeV/z9D/SKukXDxxETeNoYW6B4S2kv2+qdrsm1ETCGtHx/TUQ5Nh4X82Uft8eevgMlnUSWgJgAFbP2xMUS9A1LXeNlte5y4Rjrh39u2ExlZq6bDPwYAYmeuOIGhOtGSk1dZve48PwF06TwlHl44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B2OklwyD; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-572f6ee87c1so83494a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 May 2024 06:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715692129; x=1716296929; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7VuwYtf2gX32SkqHPv74weor+XeWeSTj0M9fYMirYNI=;
        b=B2OklwyDlI6p+o71LKU3862hoJPBAMgmxACRxcOWd9w2QbdAF9KnSw6DWYcO7TOXJe
         /YL9h9H2pWdPmZB13OTOMXAvS7ba1sITmjabIQvBvCYFK3K0ZLuqjAhVvHxn1tfI+/pJ
         gYy3p1x9F6Y7HSFtO5CqLGbFhkAC3fBZ7rcPVorkM2C3HgSRjAvMeR7R4BjQ0TceoLWP
         kiBjvvq1kZ+KWqSvnrWjn61LLu79ddvZ9WmkaF/rsscEHLiVNzpi/jk2LJ4iisfBGMbd
         970F/dvPn4vm+0vRMamHlDC9z/Pciod7Nimy5va6wu6Ie4vEq4mMafKEjGi/8gWtu8Mm
         l1Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715692129; x=1716296929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7VuwYtf2gX32SkqHPv74weor+XeWeSTj0M9fYMirYNI=;
        b=N1iMLoGQqF9RkX2ZTqHDZw6nTEya638efz5H8WWwU60xLRILo8deHuJB0emAxGuEn9
         A5rTYbpRIpEPNmlJjA4IHaj0k6TQSwp0PJeySE+g4kIDQaDBnkVIjCTZw98c31J9Ckts
         Dd36WtFuQtCPWZAx4w+S2jtMlt6Vf+mmJ+1QplO3KONN/REWQV450CUGqtmJ/hH7ejC2
         ii6aSUPAI8Aqr7oflCBl/fFHCiH+IgwB/btdNZUSxWwtTpHWz4cN9oLQyHlvk2yBkymI
         Pa0epPdc3ZF1nM3fHpBG5XBpxLyaO5Qibi9AUxwKUarZys7s9C0t7DD0BcjMeYfHwP6a
         CcAQ==
X-Gm-Message-State: AOJu0YxeiEhEFC2g/Sg/5e31M7+5ewv56oouK7+B6gC3fa300M9PulbZ
	7PzG0uVJrF6rPzCxU3AMGWyuhDLSlQ7LaUPve4we4OguWnc178wiTmD0ej22xA==
X-Google-Smtp-Source: AGHT+IGNpGJlmgPOxPVJvvSuUoh2Ab97ent0Dok78SJQyBenyIoReygTEJ87C8Nx8095CWPY0R7wOA==
X-Received: by 2002:a17:906:4443:b0:a59:c728:5420 with SMTP id a640c23a62f3a-a5a2d6786damr842245266b.66.1715692129290;
        Tue, 14 May 2024 06:08:49 -0700 (PDT)
Received: from [127.0.1.1] ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781cf91sm719572466b.1.2024.05.14.06.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 06:08:48 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Tue, 14 May 2024 15:08:41 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: Use 'ufshc' as the node name for UFS
 controller nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240514-ufs-nodename-fix-v1-2-4c55483ac401@linaro.org>
References: <20240514-ufs-nodename-fix-v1-0-4c55483ac401@linaro.org>
In-Reply-To: <20240514-ufs-nodename-fix-v1-0-4c55483ac401@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
 Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=4956;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=79N957sFT+botkrfIwoMhZsYTKAk7xgpP8euBkNNACI=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmQ2JcCiqQHXYXc/pSk57uMz9J0WsiC91fwyJS8
 xlpoaLIiB+JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZkNiXAAKCRBVnxHm/pHO
 9QTmCACOCnfMGexb8BFI5GPfGZQ5LToQiDo/gsJ1usTirkHSeyxIWn1gyL3jxQ3kFuc9eygDYta
 0nAIdP2pRmsZQQhasFIVv1lIuHHiaDEx/cYWx0F/WNIuS/xZyCuMJouY5v99ljdHkhWiIzbWJ91
 AXgcx9753HE6xY0Zldn2NdmCPEG4DEkefb76hpqz1n5IWM3DP42cIwP/wtZZR7ZaVOzJxcyGubR
 L5FSRcrO/7+rdON2JMt+/38u4NjfLHQIu5Fb2g52zD97po6wCVryPSCZlNcr7ob17eXn8e7/tof
 qPPxmgAnQQnUitrBzGy2LMGVwq4y9PfYK40xnIaUZNBPwbwM
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Devicetree binding has documented the node name for UFS controllers as
'ufshc'. So let's use it instead of 'ufs' which is for the UFS devices.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi  | 2 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi   | 2 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 4 ++--
 arch/arm64/boot/dts/qcom/sm6115.dtsi   | 2 +-
 arch/arm64/boot/dts/qcom/sm6125.dtsi   | 2 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi   | 2 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi   | 2 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi   | 2 +-
 8 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 231cea1f0fa8..3f65494259aa 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -1577,7 +1577,7 @@ rng: rng@10d2000 {
 			reg = <0 0x010d2000 0 0x1000>;
 		};
 
-		ufs_mem_hc: ufs@1d84000 {
+		ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sa8775p-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
 			reg = <0x0 0x01d84000 0x0 0x3000>;
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 7e7f0f0fb41b..da63e9435130 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2303,7 +2303,7 @@ pcie1_phy: phy@1c0e000 {
 			status = "disabled";
 		};
 
-		ufs_mem_hc: ufs@1d84000 {
+		ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sc7280-ufshc", "qcom,ufshc",
 				     "jedec,ufs-2.0";
 			reg = <0x0 0x01d84000 0x0 0x3000>;
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index a5b194813079..9c5437c2540a 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -2208,7 +2208,7 @@ pcie2a_phy: phy@1c24000 {
 			status = "disabled";
 		};
 
-		ufs_mem_hc: ufs@1d84000 {
+		ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sc8280xp-ufshc", "qcom,ufshc",
 				     "jedec,ufs-2.0";
 			reg = <0 0x01d84000 0 0x3000>;
@@ -2274,7 +2274,7 @@ ufs_mem_phy: phy@1d87000 {
 			status = "disabled";
 		};
 
-		ufs_card_hc: ufs@1da4000 {
+		ufs_card_hc: ufshc@1da4000 {
 			compatible = "qcom,sc8280xp-ufshc", "qcom,ufshc",
 				     "jedec,ufs-2.0";
 			reg = <0 0x01da4000 0 0x3000>;
diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index aca0a87092e4..974e4b6e27a4 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1175,7 +1175,7 @@ opp-202000000 {
 			};
 		};
 
-		ufs_mem_hc: ufs@4804000 {
+		ufs_mem_hc: ufshc@4804000 {
 			compatible = "qcom,sm6115-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
 			reg = <0x0 0x04804000 0x0 0x3000>, <0x0 0x04810000 0x0 0x8000>;
 			reg-names = "std", "ice";
diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 98ab08356088..20527b254f6b 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -763,7 +763,7 @@ sdhc_2: mmc@4784000 {
 			status = "disabled";
 		};
 
-		ufs_mem_hc: ufs@4804000 {
+		ufs_mem_hc: ufshc@4804000 {
 			compatible = "qcom,sm6125-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
 			reg = <0x04804000 0x3000>, <0x04810000 0x8000>;
 			reg-names = "std", "ice";
diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 24bcec3366ef..66e5ebbbbada 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1136,7 +1136,7 @@ mmss_noc: interconnect@1740000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
-		ufs_mem_hc: ufs@1d84000 {
+		ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sm6350-ufshc", "qcom,ufshc",
 				     "jedec,ufs-2.0";
 			reg = <0 0x01d84000 0 0x3000>,
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 3904348075f6..94eea47c24d3 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1957,7 +1957,7 @@ ufs_mem_phy: phy@1d80000 {
 			status = "disabled";
 		};
 
-		ufs_mem_hc: ufs@1d84000 {
+		ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sm8550-ufshc", "qcom,ufshc",
 				     "jedec,ufs-2.0";
 			reg = <0x0 0x01d84000 0x0 0x3000>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index ba72d8f38420..7c6d2150a1e0 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2509,7 +2509,7 @@ ufs_mem_phy: phy@1d80000 {
 			status = "disabled";
 		};
 
-		ufs_mem_hc: ufs@1d84000 {
+		ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sm8650-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
 			reg = <0 0x01d84000 0 0x3000>;
 

-- 
2.25.1


