Return-Path: <linux-arm-msm+bounces-60515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5496BAD0DDF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 16:16:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 464CF3A7D76
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 14:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F781DF97D;
	Sat,  7 Jun 2025 14:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rhgnbdse"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675001D5CEA
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Jun 2025 14:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749305764; cv=none; b=ujeuPwL9uD5h+s6cuN/K1+AXoP8i05v4UzE+zGF7uwuVi+MtKDhKOY4vAJQ0uSuWu7TvIDafrEX1xawUevDz27VIVnA6Ahj2be0Xo5QKwY05mf++vWyY4JnR61Yeqodfz+V685scMy9ac+/M3Ii4NyC7tMGwkiHZ+pB+hlwjLFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749305764; c=relaxed/simple;
	bh=QS5xAbCsPSyfOkc5yt45bGQeG+Bp1wTdC51lAoqzxks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kyAuqrx3hFLtgNNfGSo1r11UVwVSSfy/GwAs2RMBo8dr/Ln8MhRc9iSAeyb5/WI5MCl3JqJ5aE05LngpRtUOEr8LN9r5wCeqh15vMeKdnO+/2p49rc0Dhu4tpGrBbRt0uvG3xsxbX6UqOu3K/DDNJ+0TEYz55GwicSb1Dy2rLTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rhgnbdse; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557Crp1B004538
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Jun 2025 14:16:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WJ8Ew+S+TV+XVqus/74shJoWoJJfddIwjRK4epM6VrU=; b=RhgnbdseNMM3/L8V
	HbSmqGP/cRWqFmMw3dR+DXBqeOgrKWbM3sT2M9t/CvHaYk6frvd4MGXUko85p2aT
	LSbimrdDyZYNnckDpHflW+wUmlPbCAsoXe7GBVO2Pe+pOdu/4+w7oNJCdFkGZuQN
	z93ufJS++OAze323FXiQpwFv87RYIkn3pmxbB/IC7YNCRsYBJInYGl+pmgPcMxv6
	esckDhZtCWp/xjtnBF+b00C2GQ4QqHPYc9AOa2jw3CZoWWAfqrYAnvIKmfhBccIm
	Rgq6aC0/uLH/48t1eqn+p59+5sHdiPhdv/yEoX20NrmMyPlZVanvRWfCGnyt3BjA
	+q+qoA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474b4j0uua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jun 2025 14:16:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-234fedd3e51so26910515ad.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jun 2025 07:16:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749305761; x=1749910561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJ8Ew+S+TV+XVqus/74shJoWoJJfddIwjRK4epM6VrU=;
        b=W8dRemvIb83/MAykSekKxSvzN8j83smB6iJP+qI8rW3wLf4phuW/x2DYxF77bBbjrN
         MXbj8ji5BySSyQUIVzBlY9WfDuX8xj0jzcQASqozCu0scT53LUDbNuwIdN2YVbQMCYwX
         xIzH0v99Ms+9RczJ+mW42iWKorCZGcCvkIMaVudoIzBFhupauPAOT9ph0VCD7Sd1PjVW
         gMMhh33mlbXcoB7L7qRy+Q0s7QDt2guzGedndnaNc8gl1CqXyw2bxbRv2y8OlNIXghtr
         aGEjYdtbEAjxR+ozHRZWp/BNy3pgMR6yOQIMWGRZVy8K7bndZ6ko3LaP4QfhTM9UTGkD
         uY0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVkrPSNXb9hOvmz7ALF7domO34epoOcRhbK8fzLn7QnS6KPpYV4ORvKhYOy8QBjYX9upHJSNdApD+48nZOv@vger.kernel.org
X-Gm-Message-State: AOJu0YydfME/mquL4KtWbI9dPdoKYiChJaqzSWOSLhWE7DOa/vEsFSg2
	yAp1W76wBEwZyMN4qN+f7hbH2zKIJRPwZ7cRvj4VuX33vJr2Dc24WqyglKHcDtoNF7fh8NBWZcx
	OiYbRTYHZ+pJ8/7wyKxzyRpeNvRXSdjnwHUBVjAOlJoBKb0i/Qc6nqyjkqhoSmG88mEeh
X-Gm-Gg: ASbGncvnoR5tRkvILxopmKmQBB7aRqbJ+yeyjhKH+wrMN45pgztCAQ+x24doJDUjX6H
	jMN4KY9LBZU5VjsFFDRA0QAh6IGlba2eaaBR9EbTkU0z2fBk6YWnCXAg2QzVkb6oCtCjWxLokNf
	ytF1e4g6YoyhixM/lWbmbGpGKqXyLZgBFWH1c84iLeMBPKt0hZmZjFmPnTRKADOAnoHS0G5CFPQ
	n9maC7rvjRNtnFpnVitFPFLzTBC1oll9BqWKmRXD5XFT111ldqCxDm5gj53uUB/SMJb4nvaaYRs
	zWY9xXcUVl53hBscrqFV2A==
X-Received: by 2002:a17:903:46cb:b0:234:c549:da0e with SMTP id d9443c01a7336-23601dcb75emr93146995ad.47.1749305761499;
        Sat, 07 Jun 2025 07:16:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOApIcU2L2RZot2Csb4zWoWI6DwNf0PlZVtfKtEY3NUUZHvtafg2Uw/6v+Il6tRqW0hYPgmw==
X-Received: by 2002:a17:903:46cb:b0:234:c549:da0e with SMTP id d9443c01a7336-23601dcb75emr93146445ad.47.1749305761076;
        Sat, 07 Jun 2025 07:16:01 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603405732sm27500435ad.155.2025.06.07.07.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 07:16:00 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 07 Jun 2025 19:45:01 +0530
Subject: [PATCH 3/3] arm64: dts: qcom: Add GPU support to X1P42100 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250607-x1p-adreno-v1-3-a8ea80f3b18b@oss.qualcomm.com>
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
In-Reply-To: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
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
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749305735; l=5559;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=QS5xAbCsPSyfOkc5yt45bGQeG+Bp1wTdC51lAoqzxks=;
 b=pAY2ylCHsX7Jv7ShjBFdy78oBW7AkGOeMibz8rjkArmHDm7fnVviS69DyoeTBupFz5to0/N6V
 prsC/x7m3lGAT2ClArRRTRUbl/Sl60G4rLFyPHzIowAOPwk+HnkgpFM
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDEwMiBTYWx0ZWRfX6XEJZpGq29zF
 By3873Nzey7kTP/Vjgb8GopUUEkJnmJYR1nRPTr16KT9kOKeSzfnDX50M4TyHboPHU6t7ipg+b3
 peEiiPPPi/On/tnBeBLgm4xtlgbo8ZxfYEF9BDZKcmBQ/ojNesdyBDFAzWSPm2GDI0+kVOsGu7M
 LXTGXnVEDOtOQtOXHQZpk7qdPPZz9th8dcDmjzOXtAzm8I4ZFz98+3G3t4w249nUbrZhsaEX3c2
 nK0fVn8fLCWbIAbvbLZEs/zEwJerHBYMddbeShBhRt91xOBHUKRPzQgcpPNUy3QoboHR55cujMj
 CNautvkHkoup6Jx4sFR3A3O8BFeeFxVw62vqY8Ut9xO+VyXnZ9u5aCNVPYuLvKNM3R3vjv277xO
 6kgt3LhLD0r3a4UgE+ponBYn/y1dIO9qjphz500T2LW8cHL8xusWDYPt56nqLr+pg0UjLHgP
X-Proofpoint-GUID: 7m61V4ru7zTG3WNPcr15eQG387rZ5uvQ
X-Authority-Analysis: v=2.4 cv=Te6WtQQh c=1 sm=1 tr=0 ts=684449a2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=VoI47dy04w1U0DMRdPAA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 7m61V4ru7zTG3WNPcr15eQG387rZ5uvQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1011 suspectscore=0
 mlxlogscore=848 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070102

X1P42100 SoC has a new GPU called Adreno X1-45 which is a smaller
version of Adreno X1-85 GPU. Describe this new GPU and also add
the secure gpu firmware path that should used for X1P42100 CRD.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi    |   7 ++
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts |   4 +
 arch/arm64/boot/dts/qcom/x1p42100.dtsi    | 121 +++++++++++++++++++++++++++++-
 3 files changed, 131 insertions(+), 1 deletion(-)

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
index 27f479010bc330eb6445269a1c46bf78ec6f1bd4..5ed461ed5cca271d43647888aa6eacac3de2ac9d 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
@@ -17,15 +17,134 @@
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
+	/delete-property/ compatible;
+	compatible = "qcom,adreno-gmu-x145.0", "qcom,adreno-gmu";
+};
+
+&qfprom {
+	gpu_speed_bin: gpu_speed_bin@119 {
+		reg = <0x119 0x2>;
+		bits = <7 9>;
+	};
+};
+
 &gpu {
 	/delete-property/ compatible;
+
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

-- 
2.48.1


