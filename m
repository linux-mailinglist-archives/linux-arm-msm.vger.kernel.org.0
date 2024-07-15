Return-Path: <linux-arm-msm+bounces-26233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48069931AB8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 21:18:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD3B728363E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 19:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A72A130E4A;
	Mon, 15 Jul 2024 19:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oHkKu9z6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9856A6A33A
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 19:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721071069; cv=none; b=dnz7yN9C6RiJ8xQw+slYhU2/IaHiZ2DX+AxgErzljzLKsj2l0Uhs8k4Yb9sIA2eVbhuICNnWTQJAootFkCWaISwvLCyxdT8L/iHzl+RoJnKF8tOz8vONXszRLSlWZUazclyRFCn2LI5VYnT8MZzyKltgVbeVjVEfSWn4yswLbxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721071069; c=relaxed/simple;
	bh=utNUZ3pMu5Xac+u0DtmzgMVuHuN4/sV/+uvc+Az3lPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mZTwCivIHHm1Y9uIxWY3MABR3q0qabUVaFiMq7v0GA/9B9XefLPcv4YgqAKR0swYmXSPxcZqDgmw4Y/70EMvDfmh2lcRPdpNzyTfZA/EcpCInLFCg9JeZHpMrKYDWnR9dL6Ntchcq431sE+yK0SJ6DctTUxHOhLzkSYPXygd6I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oHkKu9z6; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52ea5dc3c66so7492849e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 12:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721071065; x=1721675865; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y+wXI8a7R2HYVHhZYxnEisHnsUG78L6EHcaBmq0xs5c=;
        b=oHkKu9z6Ep4htl3X+mRQZOIpwJ1uZtsJYx5e537mtf8dVB2zq1pETVrr68JgKMNOtW
         XwlVr/0b1bsUbxcAagJX6dGCcuBpK7q/pNFxJEvhrLzljZfDxGlRhZWUInf/sP7t6WS2
         tAc3dvxqKid6BO6q8JG3eT3YbH29SNkHCVC5SoskGEx2l7wmMCdaU1yuUngtFKplfMm3
         TuciLz0+W1ToUpmbUEeX9X84MdJEJI+w5C5BzUZk/tyQ4d/JplXNP3M3eKs8sANvZhRX
         HMDEyo8rzC/G7oYlY1rebP4IkcbZti9ihgOJYebSH5+YkSZGA4xeyTEvipHfYRQIEqfi
         QKiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721071065; x=1721675865;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y+wXI8a7R2HYVHhZYxnEisHnsUG78L6EHcaBmq0xs5c=;
        b=R/x7hAA6G7fFd/zupit3lpNexXRMKpV6NmIl9jJRuUo1SW2FJ8cLo+beM10Vp88GJy
         WbnrGjnYDklESPTMQKnQeyNypWn4D+6El1fKVWLB7660TvvS3vPW+XvF6e4cq4eo+sF9
         rnAnyZryeNwmNzfPU8ZUMErBvk7tM9Lj3x6IQcacpZeJYpk1hRuhesUe4AHUuzPfpHnO
         QvR1Wys9epcNQvBL8c2V4UogPEEg4AOpZEyVGikt2TcK4E1igsQR+yFMe34IzEDTF80r
         4q9PeitQ0uB4ZIp7sUy9fO4TnLoTTp4b3/qUDaivBWa7xJLauJFeLGXFyALJZOPpxhjd
         ajwQ==
X-Gm-Message-State: AOJu0Yz/axzuqtHR+xGQKyWOnJJc0HhsZqVw58gxvXI+u4ml5yP9z2/N
	E2cNoKT85nKRjSCSX/ppzfYGbUguangOtHFfa8iH+lXgDC8Hd8hUrugVaG3zvr0VcUbtHvcI9z8
	1psBz3A==
X-Google-Smtp-Source: AGHT+IGoVIlI0A5kR7bh6bxF8zDOHsM1S8NOUArko9v+cC0r/K1xCNDsmPr3jbrrlzv90RoqR0CwOw==
X-Received: by 2002:a05:6512:68e:b0:52c:db0e:6c4a with SMTP id 2adb3069b0e04-52ede19cecemr325779e87.2.1721071065264;
        Mon, 15 Jul 2024 12:17:45 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed24e2ab1sm939838e87.29.2024.07.15.12.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 12:17:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 Jul 2024 22:17:44 +0300
Subject: [PATCH v3] arm64: dts: qcom: disable GPU on x1e80100 by default
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240715-x1e8-zap-name-v3-1-e7a5258c3c2e@linaro.org>
X-B4-Tracking: v=1; b=H4sIANd1lWYC/32MQQ6CMBAAv0J6dk1bCq2e/IfxUGCBTbQlrWlQw
 t8t3DzocSaZWVjEQBjZuVhYwESRvMtQHgrWjtYNCNRlZpJLxbWoYBZo4G0ncPaBoJuy1SdZKsU
 Fy80UsKd5/11vmUeKTx9e+z6Jzf46JQECmrruen7qeFNXlzs5G/zRh4FtqyT/5jLn1khlDOpet
 +IrX9f1A1UP/dTqAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3039;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=utNUZ3pMu5Xac+u0DtmzgMVuHuN4/sV/+uvc+Az3lPM=;
 b=owEBbAGT/pANAwAKAYs8ij4CKSjVAcsmYgBmlXXYgvmmmwJ2dAfcNMP0dCPCnkjUSIuOCeg6W
 psmrCQaBOWJATIEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZpV12AAKCRCLPIo+Aiko
 1eKsB/dVz6ssxJWJPY3PUPrc/FCv8XDHudEU8kLT/Kbk5Kr1Wr22KkS+KrCEuuTF6/qq7XBaY3e
 LxG0ndvQUG3CJJTF2nKVX61X1BjlUG4/VGSGe3tAath8SbkWl3RfcINsV6Ta/eKurndlDSrwqdG
 vTnmYiwiCCZILCpDtdqPwcSxWQYmmp13XfZJsy2Yn2BTKXvzV1NF49+NnYKgQi+o3dPAc2LECcQ
 MOddu63X5ZCbTDz4+F0Z85OgJniTqBW0PLCdhBdhkHyFxMDT2ybe5YJYmm8Bao/9o/xrM6UmoNa
 tVJzzkGaNHspsHr+k8CCjVHC74nsK1/njTZuwLAdZhXA31I=
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The GPU on X1E80100 requires ZAP 'shader' file to be useful. Since the
file is signed by the OEM keys and might be not available by default,
disable the GPU node and drop the firmware name from the x1e80100.dtsi
file. Devices not being fused to use OEM keys can specify generic
location at `qcom/x1e80100/gen70500_zap.mbn` while enabling the GPU.

The CRD and QCP were lucky enough to work with the default settings, so
reenable the GPU on those platforms and provide correct firmware-name
(including the SoC subdir).

Fixes: 721e38301b79 ("arm64: dts: qcom: x1e80100: Add gpu support")
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v3:
- Fix the status property name (Akhil)
- Also keep the GPU enabled on QCP (Akhil)
- Link to v2: https://lore.kernel.org/r/20240715-x1e8-zap-name-v2-1-a82488e7f7c1@linaro.org

Changes in v2:
- Keep GPU enabled for X1E80100-CRD (Johan)
- Link to v1: https://lore.kernel.org/r/20240715-x1e8-zap-name-v1-1-b66df09d0b65@linaro.org
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 8 ++++++++
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 8 ++++++++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi    | 3 ++-
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index 6152bcd0bc1f..81d7ec82a845 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -637,6 +637,14 @@ vreg_l3j_0p8: ldo3 {
 	};
 };
 
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		firmware-name = "qcom/x1e80100/gen70500_zap.mbn";
+	};
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 72a4f4138616..b3521ec4879c 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -606,6 +606,14 @@ vreg_l3j_0p8: ldo3 {
 	};
 };
 
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		firmware-name = "qcom/x1e80100/gen70500_zap.mbn";
+	};
+};
+
 &lpass_tlmm {
 	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
 		pins = "gpio12";
diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 7bca5fcd7d52..8df90d01eba8 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3155,9 +3155,10 @@ gpu: gpu@3d00000 {
 			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
 			interconnect-names = "gfx-mem";
 
+			status = "disabled";
+
 			zap-shader {
 				memory-region = <&gpu_microcode_mem>;
-				firmware-name = "qcom/gen70500_zap.mbn";
 			};
 
 			gpu_opp_table: opp-table {

---
base-commit: 3fe121b622825ff8cc995a1e6b026181c48188db
change-id: 20240715-x1e8-zap-name-7b3c79234401

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


