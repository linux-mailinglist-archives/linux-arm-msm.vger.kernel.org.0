Return-Path: <linux-arm-msm+bounces-62089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE41AE468C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 16:22:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF5B24A260A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 14:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 371DF25A2CC;
	Mon, 23 Jun 2025 14:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KzNVGll3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91ED925A624
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 14:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750688084; cv=none; b=aDvn9Ipa2f9jSxZS5hvKAtBajD763A6ZkZEi1dbwYLgRTtB6c/Br9quTB+JK2UUm+iP5RdOrYsN9cglRpGqkEPy/gJcGY2d4zTluru/llxM3TIt3H2p8K7naJJJq+f/Pm12of9pOe3CgnbU5JZXxmv8Qy5Jbhf1H6sr3KBHQzGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750688084; c=relaxed/simple;
	bh=MQN6pHg2XU+7FGCZBrKWg0kNH29zk0vF/Z7d/e3l7a4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eQ0l5fMj+LwMUbkedcR1KS5oM24MFvEqzUOUX0JCLvDZAkavrd/WZBf1aIZ1ZoJ90yjHNXF1IJ9/6Ng5EEDzWJ+LxhOfh1y8bzcufnw3YG1MmsFCNk3ah4l9IFnLV2mhTh+WBTqytpfhmQKjM7B2b+wWi38D8xyBRkJnfXvCyjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KzNVGll3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9THcJ020768
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 14:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZUSYhC6o46Hf8IpyKC2uFmsO01aWBnLrFas76fWv42s=; b=KzNVGll30RWi6Znw
	rG62oRtxVLFWOJjMUvNQOaqYsewyjci9iHd7ClacY8Yx/yeDaAsJmQclcxneZZCS
	euqOX3rWADelkrx7LYskaWFG+IJe+xeTNiypoh6J5xcyswo9v85OjhUskVqYxYpL
	tytnql2AAkNSKyNhfxmivRnIQgiiGth2tYYFDoKtPoPBQptsKsRZsy7bgchr5T3s
	U2jokWsXNj9BE384tn5M8/7+pM6b/NtfGnpgJgET9HWW2fbRNX7YBcuOhV0iVx6n
	MTX2G+ZELyhFkb/J9u+x1ohWFqtiCzoMt5e2q6tll8s11PKTREHH3e8pwUtAEZAx
	jBkMlA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b3rs2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 14:14:41 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3121cffd7e8so3191995a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 07:14:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750688081; x=1751292881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZUSYhC6o46Hf8IpyKC2uFmsO01aWBnLrFas76fWv42s=;
        b=AOCgeF2PKUADngdHYJCe5kSq0f21NfFNc8x4bX8sw0nAxofOWrFfDnIT3sgpP4jB3Y
         pwngDB5SsCkPHTXr3jTjN59SFwy8KRbivuk83W8YPCG7KXrEW6wOp4QKZvC4XEuGRpeO
         eZrUtZDszEhvv3cSgeW4UB2l4YSHWNRby8HnVomTc/8KuGPPYCAXv/mBSwb5LSwIVJKL
         zcB/GTIQWarPFO9VupRhVd0dmPyKHbrXclO7t4bZaknh5KkuhV32GX6U8h8aPmVWAHbw
         yNA+XL2JPqDZf4VL6y/YcChQYpIcfvovpTAee9YTzInrVoqYW6q+pHSaz1QOxPlvP1QM
         tzMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWOLcgV2EN9dl5OXosnwxMhtnuyVxRWBH2E5rBmD9Cj6HTaA85Sl1ApjnqfrueF4covytUjT2mR7STaW95@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm4ZiYaAaXurDqiWivQ8vEtLmMTpCwzK2LPLaMCiIzbNBMR4W6
	ve2YJzQRzWtV+5YOOfy11xnXv02keNyS5x1InjWTOJLVrJQ2Zu4kiHgC0ySbGgh/qXQLu3JwrLk
	rNaspXE51R85ezOHkLhyBzmhBNeo56szDBiF40hN+imHYUzykrjfevd/LcAlo645esnM2
X-Gm-Gg: ASbGnctIAAcvJOH0nGmXAGyotCK6/KEnurZREdOqCJnWKKYEPRv7bm+NjkSk5Q+tXeT
	Eu2WBcpffvAmYd9QEHPorhB38/ynuzkd4UPeL943yCYEz2DRIQAIEEydPRLzgNcF9ySRbessP17
	TbFgDTAUNJTvcDuIDd2p8JnCHJkFEKocVuM4dvfCF1jApew4CpC5Ch8qaWRpTw7R8uh0rAxUmMh
	kpckWTvtUgRPLYsyqAR3wSP7G1k1Blig/mUcyQI1CFdVys1xBtfY3CtlchcmVE+lVr2rPl9dM0S
	+tW+7dKIHBkmKmE30bw6T6MqzIBzEQV8
X-Received: by 2002:a17:90b:1f8b:b0:311:e8cc:424e with SMTP id 98e67ed59e1d1-3159d8d685dmr23300701a91.24.1750688080571;
        Mon, 23 Jun 2025 07:14:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEl1qyuN7gQNvPm6W20g4kJcQ/+98rCZ9ZS65bbUUQKpRf+w15+pvrZr59iT4MKwZX3WdgrHQ==
X-Received: by 2002:a17:90b:1f8b:b0:311:e8cc:424e with SMTP id 98e67ed59e1d1-3159d8d685dmr23300647a91.24.1750688080133;
        Mon, 23 Jun 2025 07:14:40 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159df71c4bsm8112049a91.2.2025.06.23.07.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:14:39 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 19:42:09 +0530
Subject: [PATCH v4 4/4] arm64: dts: qcom: Add GPU support to X1P42100 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-x1p-adreno-v4-4-d2575c839cbb@oss.qualcomm.com>
References: <20250623-x1p-adreno-v4-0-d2575c839cbb@oss.qualcomm.com>
In-Reply-To: <20250623-x1p-adreno-v4-0-d2575c839cbb@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750688040; l=5912;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=MQN6pHg2XU+7FGCZBrKWg0kNH29zk0vF/Z7d/e3l7a4=;
 b=cMApY9dMEMtm0TOSSRpoZVVcb0aMMXaCw2trIESEtt7ToKAeFPBno+Kl9hvbWWuWnxoRLFDpd
 XtgMTQXizmKD99IYT+3MfqIzaFEvS5NyRB4eDKlASetkPWn7K4gWuEd
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4NCBTYWx0ZWRfX0CWOTc12l2jn
 y9oYR9D8iSbI/CJ3YKzPKyqOt1BI0Aq3gpCdwjSv7EJiC0jZ6+CG8hi4qHOlJkCm/Kak1CEs+5O
 AMHRLC6/faEdcZc+RcEcdpUItdBt1JBsR3j+/Lb9DUnlN5X5coC6jWCKzqfEDBaQZkJbi3LMNhW
 9ymTum1e9fF2IXa1H2kvKatyw30xFLNIS2YfxLNAdRkSXfLwj3kQi1etrkTJgF6ybqfmypkdKHr
 pVGrV/d6WciizDSyh6aBZQM4d8vQ4O88nxLd8JIhEXgIYwVHjaVHT1YCH7U46c4d+eG3sP5MvXj
 LXVU/qWuyqNIVK+3ta6sdTWx3Vwjs4lUWZfltXS0pBP8FCwv15J0exlipUjBCVH/akEfU+k1qsU
 V9q53VFeKe471pNFx+LrTHau1YeqpO8K0EA6lBiv86pj5o3rPGRvtP4xtodogRzOSsumfx/z
X-Proofpoint-ORIG-GUID: KVDEuzkWbPVxojWwEfp3qd2jo34hPy3L
X-Proofpoint-GUID: KVDEuzkWbPVxojWwEfp3qd2jo34hPy3L
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=68596151 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=8xAZcMgD8QFAYO27TxYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=891 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230084

X1P42100 SoC has a new GPU called Adreno X1-45 which is a smaller
version of Adreno X1-85 GPU. Describe this new GPU and also add
the secure gpu firmware path that should used for X1P42100 CRD.

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com> # x1-26-100
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi    |   7 ++
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts |   4 +
 arch/arm64/boot/dts/qcom/x1p42100.dtsi    | 120 +++++++++++++++++++++++++++++-
 3 files changed, 129 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index a8eb4c5fe99fe6dd49af200a738b6476d87279b2..558d7d387d7710770244fcc901f461384dd9b0d4 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -8245,6 +8245,13 @@ sbsa_watchdog: watchdog@1c840000 {
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		qfprom: efuse@221c8000 {
+			compatible = "qcom,x1e80100-qfprom", "qcom,qfprom";
+			reg = <0 0x221c8000 0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		pmu@24091000 {
 			compatible = "qcom,x1e80100-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
 			reg = <0 0x24091000 0 0x1000>;
diff --git a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
index cf07860a63e97c388909fb5721ae7b9729b6c586..cf999c2cf8d4e0af83078253fd39ece3a0c26a49 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
@@ -15,3 +15,7 @@ / {
 	model = "Qualcomm Technologies, Inc. X1P42100 CRD";
 	compatible = "qcom,x1p42100-crd", "qcom,x1p42100";
 };
+
+&gpu_zap_shader {
+	firmware-name = "qcom/x1p42100/gen71500_zap.mbn";
+};
diff --git a/arch/arm64/boot/dts/qcom/x1p42100.dtsi b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
index 27f479010bc330eb6445269a1c46bf78ec6f1bd4..090659b8bb8942cdcc46f8d4a3e7dbcc043a0f78 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
@@ -17,15 +17,124 @@
 /delete-node/ &cpu_pd9;
 /delete-node/ &cpu_pd10;
 /delete-node/ &cpu_pd11;
+/delete-node/ &gpu_opp_table;
 /delete-node/ &pcie3_phy;
 
 &gcc {
 	compatible = "qcom,x1p42100-gcc", "qcom,x1e80100-gcc";
 };
 
-/* The GPU is physically different and will be brought up later */
+&gmu {
+	compatible = "qcom,adreno-gmu-x145.0", "qcom,adreno-gmu";
+};
+
 &gpu {
-	/delete-property/ compatible;
+	compatible = "qcom,adreno-43030c00", "qcom,adreno";
+
+	nvmem-cells = <&gpu_speed_bin>;
+	nvmem-cell-names = "speed_bin";
+
+	gpu_opp_table: opp-table {
+		compatible = "operating-points-v2-adreno", "operating-points-v2";
+
+		opp-1400000000 {
+			opp-hz = /bits/ 64 <1400000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L4>;
+			opp-peak-kBps = <16500000>;
+			qcom,opp-acd-level = <0xa8295ffd>;
+			opp-supported-hw = <0x3>;
+		};
+
+		opp-1250000000 {
+			opp-hz = /bits/ 64 <1250000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L3>;
+			opp-peak-kBps = <16500000>;
+			qcom,opp-acd-level = <0x882a5ffd>;
+			opp-supported-hw = <0x7>;
+		};
+
+		opp-1107000000 {
+			opp-hz = /bits/ 64 <1107000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+			opp-peak-kBps = <16500000>;
+			qcom,opp-acd-level = <0x882a5ffd>;
+			opp-supported-hw = <0xf>;
+		};
+
+		opp-1014000000 {
+			opp-hz = /bits/ 64 <1014000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+			opp-peak-kBps = <14398438>;
+			qcom,opp-acd-level = <0xa82a5ffd>;
+			opp-supported-hw = <0xf>;
+		};
+
+		opp-940000000 {
+			opp-hz = /bits/ 64 <940000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+			opp-peak-kBps = <14398438>;
+			qcom,opp-acd-level = <0xa82a5ffd>;
+			opp-supported-hw = <0xf>;
+		};
+
+		opp-825000000 {
+			opp-hz = /bits/ 64 <825000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+			opp-peak-kBps = <12449219>;
+			qcom,opp-acd-level = <0x882b5ffd>;
+			opp-supported-hw = <0xf>;
+		};
+
+		opp-720000000 {
+			opp-hz = /bits/ 64 <720000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+			opp-peak-kBps = <10687500>;
+			qcom,opp-acd-level = <0xa82c5ffd>;
+			opp-supported-hw = <0xf>;
+		};
+
+		opp-666000000-0 {
+			opp-hz = /bits/ 64 <666000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+			opp-peak-kBps = <8171875>;
+			qcom,opp-acd-level = <0xa82d5ffd>;
+			opp-supported-hw = <0xf>;
+		};
+
+		/* Only applicable for SKUs which has 666Mhz as Fmax */
+		opp-666000000-1 {
+			opp-hz = /bits/ 64 <666000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+			opp-peak-kBps = <16500000>;
+			qcom,opp-acd-level = <0xa82d5ffd>;
+			opp-supported-hw = <0x10>;
+		};
+
+		opp-550000000 {
+			opp-hz = /bits/ 64 <550000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+			opp-peak-kBps = <6074219>;
+			qcom,opp-acd-level = <0x882e5ffd>;
+			opp-supported-hw = <0x1f>;
+		};
+
+		opp-380000000 {
+			opp-hz = /bits/ 64 <380000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+			opp-peak-kBps = <3000000>;
+			qcom,opp-acd-level = <0xc82f5ffd>;
+			opp-supported-hw = <0x1f>;
+		};
+
+		opp-280000000 {
+			opp-hz = /bits/ 64 <280000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+			opp-peak-kBps = <2136719>;
+			qcom,opp-acd-level = <0xc82f5ffd>;
+			opp-supported-hw = <0x1f>;
+		};
+	};
+
 };
 
 &gpucc {
@@ -41,6 +150,13 @@ &pcie6a_phy {
 	compatible = "qcom,x1p42100-qmp-gen4x4-pcie-phy";
 };
 
+&qfprom {
+	gpu_speed_bin: gpu-speed-bin@119 {
+		reg = <0x119 0x2>;
+		bits = <7 9>;
+	};
+};
+
 &soc {
 	/* The PCIe3 PHY on X1P42100 uses a different IP block */
 	pcie3_phy: phy@1bd4000 {

-- 
2.48.1


