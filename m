Return-Path: <linux-arm-msm+bounces-60956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0595AD539B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 13:17:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6347D16C270
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 11:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE92725BF1B;
	Wed, 11 Jun 2025 11:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l4cGoBcU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B315273D92
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 11:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749640586; cv=none; b=GvUb17qk9fUfW62pmqkYLKmbOIc1xC7jUCnuFeYZ0pGds1ZQyxrFCBX2QtbALepsgf5EXZV+YyXJCSsk1Bz+N5IUBwTSvvO4fVDJETS+EFkglJ6jIrafjXKEAQfrXl8xHYqGBcTxy9ZIeBU9gdj6HOpmnJTYxVawEs2Oiu07Jsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749640586; c=relaxed/simple;
	bh=xuCoARRIycvnlpjtSpht+VThiMR7a/SohDoKqRPbgOY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=COuxotcga8ZIu41NT7pXK89XtNq1XVNB0szTnUBnm+dq/3QqhHz3NdW3sxF9cbXsjFzMG3EMg3pa2i5M/txOLV5CPGxC54vnsXM0jW8E/hjU4BIK52scxVsxXwT9d+QtsfKurISwlUdosl6BvA/W1m1Ayd5drbi4d4ZRjV02W5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l4cGoBcU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DFjj010994
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 11:16:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V1mTuadu9vEQPY2JNEOp+7iIzW/OVfrDJfnLsNvR6oY=; b=l4cGoBcUMc2w+k6q
	94oXsKe6H0ofaMQeEwNmCUKxs0JTRWy7MgtWtNC7LQMOQzLoP35OlOEddwLNVNua
	LLXq0QRdv9x6hOkwIhada6La6YsS97qZv8zssezKF8tODi5FFbpo7SdRb+NdEmhj
	dAEh5o3LyevWqcYYP28317LtDkiCv98FRkZSmaAmSyxJVOWGCBfwiiEurJr1GddD
	SmlUr1DOJtatEA+eGnbzE4IBfqqrGWV1qpCO2novmlEvscRnCOz8gE9OHyNOMRWc
	24mL1wTpu0zocFK17ZUPJ2LuHoH5iw6R7BX1cFVFf9d/HgZBEWieeeIBAUAmPjeW
	H3dJWQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpvdr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 11:16:24 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74299055c3dso9351333b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 04:16:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749640583; x=1750245383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V1mTuadu9vEQPY2JNEOp+7iIzW/OVfrDJfnLsNvR6oY=;
        b=CJemUGz7wObTkA2R+lP9vrcL0J383mhKgogsoa8GxSEggQgCiGDvLW2zdo3VbSozCb
         Z7p+7UyhqgddZMkZO7ICFazndyPdmfoE4fmD1DhBFmNJ/plBrQMN75su7GLG3cyzd9If
         /ImPBlOS98342QQT5barJmoaVMc1m3Y5uywJGUqGR4Y23Zn+NIBHVjtko9qB49F2cZwA
         9uFivMbIL8dO6E5eT87aM2eXJ9WctgZJrRry0U55W6rePGYj21Bx+/Nd5AwVE7RAgQS7
         9zwwD1YNVOI0J8IV1BBjh6Gudfmr6Jshm4ogjWlRuiNWN3E/16+V9CIFzDN1956WTeI0
         IY5A==
X-Forwarded-Encrypted: i=1; AJvYcCVK2TKGiuQKqB3N3lWlXhbyuXW67t/N20n9JKIX08s1mkHPg+EdFl6/3P9bh2gDvJManlNMhPz7CNjbdZAe@vger.kernel.org
X-Gm-Message-State: AOJu0YxahhXUqY+d7iTyp4P1o02zHOG01AOD31+pmgL0KEhYXvvZ+UIa
	Qdd+m7rPJ8WjH6jWOJNILhAsdgoEXYU0WPUdTvAfO0JCW+KvKZhQqrDfiJRwpFy2zYwZEdEcveU
	NFUYQJaokesEVlnnbLUwRwZK8cXD93B6XTyNiZWu3qt8BQIKsAEOBB3GUPv6o5tgIoWyi
X-Gm-Gg: ASbGncvIye/iOFZWtMtyH4uiv54CX69vjirXM+NzEBal/sIoaJIrL5Jh2z4gh9snGhm
	sXBByHcO7Wp8M2U48Bpqpmi0hHsf0EV8mFYTGRY67z6gFK8Vx1/jSSaphr6ap7fbHsqo8/WdDZi
	3Qtn8B/RPH4yKGy1FeSpR5jYGnNoTgMdqQQT0mO5t0RsE235QWSN34qzXCtpV+4UCVNyxHL5i+y
	aYeIKWCpLjsXjbQKXrbHxQbNwCwIVacHyAcoq45IU6RHUIdxLFLqemXbE4wUWs2Ns4/RXIvOjX9
	pdOlADcaRqdjhUzzltZ+j2y1kGSDYT0s
X-Received: by 2002:a05:6a00:cd0:b0:73c:c11:b42e with SMTP id d2e1a72fcca58-7486ce18619mr4023738b3a.20.1749640583389;
        Wed, 11 Jun 2025 04:16:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGP76o/U3R36AYVd5ja9f6V1AiXn/VNLDR7vVtnNsh1JLfgCInvw13ZQN98n1A+o2dtgplzQ==
X-Received: by 2002:a05:6a00:cd0:b0:73c:c11:b42e with SMTP id d2e1a72fcca58-7486ce18619mr4023697b3a.20.1749640582924;
        Wed, 11 Jun 2025 04:16:22 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0e9d57sm8820772b3a.160.2025.06.11.04.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 04:16:22 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 16:45:34 +0530
Subject: [PATCH v2 4/4] arm64: dts: qcom: Add GPU support to X1P42100 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-x1p-adreno-v2-4-5074907bebbd@oss.qualcomm.com>
References: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
In-Reply-To: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
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
        linux-pm@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749640547; l=5718;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=xuCoARRIycvnlpjtSpht+VThiMR7a/SohDoKqRPbgOY=;
 b=UMTfzq8FiqNsPn2/SX0+89dDo+MECO6N05n12Ur/ZdlD2OlNCN88i9nw4gHUDWVY+y5CRFIh/
 K21qmVooZJrD6Tk143u/2uGvqfiiSM8aryPHgPK6TiPCs3ul9Okz08W
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=68496588 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=VoI47dy04w1U0DMRdPAA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA5NiBTYWx0ZWRfX1eustnu6HSJR
 vp79apbb9KLf+CVfBI7R2TnQTHUMJhln3QMOfz5BdppQ7miP01dfkA6z6lavbPZQxJltLjsXALe
 0p12NLksj66lOstQTAhg5pTiC+6uQVokO1aR4S0XFQEIxbiVDJ+2hFhTwXK+RB1DfHU3PvHY9xT
 uQxxjp7jkBm+Ea5sbpNREh3nsDuDOYUf3DVleCo3fW17o7WQ0lvoq8Yufsv8yXhP0e/RMVmb0ao
 3xXPMwgMppf2A2YqZh3afMJDT6i+pAHh9qtZi/WRHlB0wopPpRR3V2039WkX1JqZNvml7+k+iid
 YlrEyKoBnHKciShi5nFJaEfkv/ZuZLbubSkUs50f861JG0NbZF6T6X4WXWsKY5InAGLdcS680Sp
 IIs6QAiDiyLqr7U/Wt34KgiZ2V9RgCJIb4IYoxRVR0W9uZZBcdwVrlLDnXxQtvKyXxOV+623
X-Proofpoint-GUID: OTSQCZzilH50Le0H-nBTIq2DKlp6VSTn
X-Proofpoint-ORIG-GUID: OTSQCZzilH50Le0H-nBTIq2DKlp6VSTn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=770 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110096

X1P42100 SoC has a new GPU called Adreno X1-45 which is a smaller
version of Adreno X1-85 GPU. Describe this new GPU and also add
the secure gpu firmware path that should used for X1P42100 CRD.

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
index 27f479010bc330eb6445269a1c46bf78ec6f1bd4..807db5a079394442596939847e0e6aef4b0525a1 100644
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
+	gpu_speed_bin: gpu_speed_bin@119 {
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


