Return-Path: <linux-arm-msm+bounces-31211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2949703BB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Sep 2024 20:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF6E3283E63
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Sep 2024 18:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F030167DB8;
	Sat,  7 Sep 2024 18:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UFrPGh2h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF20B165F13
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Sep 2024 18:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725734906; cv=none; b=ruhWEe2PA8jN2czJqj+gUz55bhhsRt4L6Iy5qsBlE/DKBVHH4QxFh8cfoNien0AhQkjUJiz1aM8hIcWTjZ4p+8E/BjNORbJ1KzpYpJ7VU6bWSoH2R/+odDV/0dsAkypuN2XvPiGNjbN0lqvLX/TiuKiDAGAEqdN01ZH3vky0s1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725734906; c=relaxed/simple;
	bh=czZ7T+mf6XqWzU6Vf6WURi7MEzoc/X2h0XJq3zPX//0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=imT1M1xjwQXoDnDQFzXFFNzOuAxf7GFVuc8vgqGZGlizTUTB3j4gvtz5ksjUSHLuu6g0kRjXI6bI+cYtDhnzR4XVd9G7iho4/STNWPur5FfyspZ4W+jIW1UIgjMT7Ak9G6LtfiJkviVY/vtje02KHnnk6A/PAx3XBrX0OZJqHxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UFrPGh2h; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f759b87f83so7922461fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Sep 2024 11:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725734902; x=1726339702; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+MQl+w+EtPc0//xS+aXieS9CbUw0+8xjxLVKoHk7Lo0=;
        b=UFrPGh2hYyiK2hGTk3ermZMm4NYSFvKJIW5h4BzKXwQzBiEtlM4N1S57kptuI66Wds
         DEuWq21kG+bpwPKxjwPglw3IDnT/59T336MEruiZk9ZAUz0BiGd18m7qggUoIUNYVCpt
         HXpR60xL2ZqgMsGQ04rvHIpTyV3EUn9mWIunmbvInpQ9UyZuM7NRcSYUcx6PTS59z80m
         YUtSfCYMASV+iQzV17z9BZS1cFEPWwVPFsWscSk8VwBckKdGW++TqdJMnDr0Jvqsx8bx
         ClkdUzVfncUMARNSkH/dCur6wjIrL5YDV7PgMpWVGQvERxUQqv+PnjDIRSsfmuBXYRHc
         tWEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725734902; x=1726339702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+MQl+w+EtPc0//xS+aXieS9CbUw0+8xjxLVKoHk7Lo0=;
        b=LkkeQ9qQU976WOHDaWhe5Q3gyiYMKkBTdg3HYZPEP5a57CkPkPPL86Hwjz5KULDQ3O
         IZYegkyezxZ1SFep4ScoUXqHw9e9LqLmISokx8bcvhnPDfeTRRpkJ0cxffixgZ/C4R08
         /MxWc0D93xln6qVfoRCPYMTab3tGcjFIt78zsh3y4oN8WZ6PZ2m/yTfV+Xt70HqKW0F3
         /SIrh2uVPbl9z92X7+Zmeeyg4g4z4JFkZyGwyAmZX+N506mRcGgYIb2iWGt8mAHL+pKB
         zujYJWm+YAxJhku5+svhsBASSvIWaJMbof4LwH9QuomeZPepdKIGPyj2JYKg155+d5fP
         6IlQ==
X-Forwarded-Encrypted: i=1; AJvYcCULGTrVHLld4ZS7sxHVQxtodZcbFgKzLClUTS33no3pdhU64GqMjw939eGmxdbmibvG6AIlvoGsV3lHcmGo@vger.kernel.org
X-Gm-Message-State: AOJu0Yxckg2ib0h4fkGzW83D74f3c4tRUeaYjsuYKfacfeSZp+QZas03
	7koBhN175V3w234tvlqBXJMEuGBGNbG5octk+wMltHzmPtpNVpOJxzCMC6z3tBE=
X-Google-Smtp-Source: AGHT+IFt/F9gdcOgwpNi7fafKgTp/rZCPURIU7Ulv5ZyfJmoQN15S9LX022Fh+nYO3YABMxPYuOVhw==
X-Received: by 2002:a2e:d02:0:b0:2f6:5d4e:bead with SMTP id 38308e7fff4ca-2f751f2b131mr30255761fa.21.1725734901592;
        Sat, 07 Sep 2024 11:48:21 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f75c0b1af3sm2271861fa.129.2024.09.07.11.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Sep 2024 11:48:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 07 Sep 2024 21:48:14 +0300
Subject: [PATCH 3/7] arm64: dts: qcom: sda660-ifc6560: enable GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240907-sdm660-wifi-v1-3-e316055142f8@linaro.org>
References: <20240907-sdm660-wifi-v1-0-e316055142f8@linaro.org>
In-Reply-To: <20240907-sdm660-wifi-v1-0-e316055142f8@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=czZ7T+mf6XqWzU6Vf6WURi7MEzoc/X2h0XJq3zPX//0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm3J/x7F2PoifzzkkFHxz2+pRkYLt9ML0xZEW+o
 3DWhVRfPlCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtyf8QAKCRCLPIo+Aiko
 1bLJCACJMd8jResuMsuhYfRhbO4DeTthTfGRK4rkPdDurx7rNtoeMvbbUL5rG3y2eVui87VLDfN
 EUAEwA6xXp4405PqYaI4rFWM0vWw5e4NEETlX0rgWjkglYhwNw5kN7xAA9SNakt27ds/M6MuN3L
 tJUM4EdZkcZfx4LF9qOlqX+JYa8SL+KidSHFtDbqK/3XYBqaIDYNWQUPwiUkbTbdqwgCGJrO+/J
 3zWN7oDuWEH6MUsiyP9+fryFrqlDqZhw4/Ru3fQAias+d6YtPv/AT9ZEuLLrBKzyb1XV0t9g0mV
 dx6JraJkMAwruTpCoJiLcV8qTA2QHCIeT1IO2T8HP7OBYSqA
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Enable Adreno GPU on the Inforce IFC6560 SBC. It requires the Zap shader
binary that was provided by the vendor.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts | 8 ++++++++
 arch/arm64/boot/dts/qcom/sdm630.dtsi                | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
index 60412281ab27..ac0197624c09 100644
--- a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
+++ b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
@@ -110,6 +110,14 @@ vreg_l10a_1p8: vreg-l10a-regulator {
 	};
 };
 
+&adreno_gpu {
+	status = "okay";
+};
+
+&adreno_gpu_zap {
+	firmware-name = "qcom/sda660/a512_zap.mbn";
+};
+
 &adsp_pil {
 	firmware-name = "qcom/sda660/adsp.mbn";
 };
diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 40ad99d75738..92695375a63b 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1150,6 +1150,10 @@ opp-160000000 {
 					opp-supported-hw = <0xff>;
 				};
 			};
+
+			adreno_gpu_zap: zap-shader {
+				memory-region = <&zap_shader_region>;
+			};
 		};
 
 		kgsl_smmu: iommu@5040000 {

-- 
2.39.2


