Return-Path: <linux-arm-msm+bounces-81875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C38C5D668
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 14:43:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E0A894E8CA8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 13:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0336C325726;
	Fri, 14 Nov 2025 13:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dt1nnhJW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hp1Wwi5o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8283254A2
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 13:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763127516; cv=none; b=Bt7JdNqNJZFoBBj2GoxCzBu+6x1ASTAwOxq7E0HKncik8VYHLHXtqfkEVx5m9XIs0Az95oEr0WJR40QyEmIVzVq0Gy0HqKiDoqnF78i+DRb9p+P11qJWgzEdRJUXoljemgiuafnp1zyMnz3dzEoTKScdiDq2oSbhN7tYjt6MUOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763127516; c=relaxed/simple;
	bh=m61eMS/4Zf1kuMzQQJkinZ8IQRWkDw0yg3iKL4VHoyc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kKgg/BVvT81SMEFtkjgTqiWgbYPlPwipZ9dmhTvs57QjBt6nhCpN4tKk5tNqlHKB/Nav8Jngc0SasLef88hXlt8bjLPtr9dr8wJZ84p+rPkFejkx2xiIWdAkFWT2gBwY6jI2wy3Kb4C29eJk0FcuDMyEMCXZW4fNvLGz8n8/abo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dt1nnhJW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hp1Wwi5o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE7tA291745388
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 13:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=poTbLM0qPOc
	Pg8sP6szKFYdlzJPOHxetHWTXDuuHwzo=; b=dt1nnhJW4mpWMHOpa5h5Hk+kf0/
	1Jq+AkvA7w2ySp9lvXoKwxBpYc0dKViTl4q2CAIY+9bum8T/GvtUerAyshoh1m4N
	hYp5zXz7jZe0ruLHz0HFvWHpKY2dhI9KNhRqybwX4NIccxgr2MEaXKI/xYFTnQ75
	ZoEmjdJ+UZ74+okGQi48KzrWl6do8AF4Op9VdPKfikVL9rNAaLS7JXmyI2bWXdMi
	efJhaRo/6R23mTZBX9cQw0wc7sJzuEigGqwd8jMsBbvsLomhaYWn9CYqepfsMQJS
	gUBE0y7kZd0B80BrepbPWzUkGdIJZi3i4AmoVVmwOa/lv3yNReWWlp2ZMeQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9ejb39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 13:38:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e8b33c1d8eso59978021cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 05:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763127513; x=1763732313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=poTbLM0qPOcPg8sP6szKFYdlzJPOHxetHWTXDuuHwzo=;
        b=hp1Wwi5ozJX0zeCL2tm/pQHjZsyYlqLOUkqWedraWN0zkSHJNVum0yu3MZ3VrDXUaf
         H7KV7maiue6YTpLDIah5mv6pyWZtH0V2NUThswSDEUJr85IJzZVWBPhjWlfnUTUL1zng
         Dm3BdxrBT57OUn7gIV0tzWLZejQwP3Uts0zRpUYwwiTZ2wO1me2y25BJvTkUsqebPAcv
         iTVoQMmsYV42ONrraFDq7VOzGOOKHY46ZJfEBpM8re8RLiTW1LdeCBrwisl0+sOQC30O
         dhvFh5aYpX+gLxECJyQKZH5F7l3WsJi3/bAvw10DaGWioGLHdv70QJ5jm7vjV6oEcSTe
         Kazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763127513; x=1763732313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=poTbLM0qPOcPg8sP6szKFYdlzJPOHxetHWTXDuuHwzo=;
        b=xH5bgO8xJ050XWKbxmTPIVSHg8Z5FDm4roeluHUMVJVeQZoF57hMMRXfvzwVWGeK5e
         iivoiFUIJCBiMJIFtHOKaHymW1CTlymwt+hEUhC7rh7NBfCddfzsQHsPidQ0eiqbE7vY
         Gn+HkHAtV7fyTAguX7/lQqDDG6jK5BZW7EQ4j4YZr+lzQdw2tabrhSCBgec4ipVD/g3n
         GafQo4Lk50l0R/P8VBwL8ZUHgZb4/RgvGboCZtAE38KlT5I6lprYb69EsM8/gyCBWUtG
         66TyIs6bkoDcFzr8XoUnIEADB1KaXYkvey8AIdh4gsmsKvLp91hfjI9iaNrhj8qdqvSI
         5iGg==
X-Forwarded-Encrypted: i=1; AJvYcCVUx7xp+/J6PMag0XfT//iPUNzRYn4xcVZ90a8IEkV0LcgZw8suZBEHu6IIETOXOL1S/lWQ3KqDx4qqLlf7@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4VfajxV5L0DxhPwZC3AN6Dgna824IaOLUkJWLihguzdF0MKZx
	vuqm2XJlxGE10ol3Bjvf24R7OG0nD4PbViPCZVxBPzcK5fvhIeP6rLkSaP6FKJoyws1j9D69V1F
	PXtYg0pwRq7ZLIQ9TDO2xtKDwmbksYr0udiGYW/tDUTYzMbP0/V/Xuk+hXooXi9wlqYek
X-Gm-Gg: ASbGncuyKZGjSZio9/J1wP5Z/jCz5VsxawNkvSx/NCp0DAI7vP9qCNqEqF/c/Mt+9kz
	GBqGhEqB6zsF2kam903vR2QroeWtvCvHIPZf3BzOWThA33wlT/l0VBtNKuVemeAVLoV4/UGlkkW
	Nouncnkg1b+FGNPuY7yWjUmhC0t+xPL8VlBoE1/Aynb9udKVBhG4bl/CjLvsXJLKO6ss8y40snQ
	O/SQJaHc9sN61fEGTxRUd7sjfYBHKPyKPc8rRhGT7p75/i14Q0RxEk7/AH4hkds9Y6YLZ+aWtV1
	II0QoMwlZ1jRmlSllFewCfXajGCQhjXe0OkoKhJDSpjHE9Cb+JnP6wWURpnmlarVxc4ctjzJxSu
	rRKQ3MD5vnHMjzPRRmhuPDxOwY7NITQKkKZL4oH/pISIrP2MEV7nuZZZ1lvgAGJjZsA==
X-Received: by 2002:ac8:57d0:0:b0:4ec:f8c3:c470 with SMTP id d75a77b69052e-4edf21b6e12mr47077521cf.84.1763127513260;
        Fri, 14 Nov 2025 05:38:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPtFh/HJ5A1gMnV2UIJSRzHjxUEjIBQB6ZHT3M7JyGrmD+egfnYsszHoP0C1u/KIfi3tkYhA==
X-Received: by 2002:ac8:57d0:0:b0:4ec:f8c3:c470 with SMTP id d75a77b69052e-4edf21b6e12mr47077121cf.84.1763127512760;
        Fri, 14 Nov 2025 05:38:32 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:a4af:3f59:b032:5434])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4ce83dsm3659659a12.34.2025.11.14.05.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 05:38:31 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org,
        dave.stevenson@raspberrypi.com, sakari.ailus@linux.intel.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        mchehab@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 3/4] arm64: dts: qcom: qrb2210-rb1: Add PM8008 node
Date: Fri, 14 Nov 2025 14:38:21 +0100
Message-Id: <20251114133822.434171-4-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114133822.434171-1-loic.poulain@oss.qualcomm.com>
References: <20251114133822.434171-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDEwOSBTYWx0ZWRfX369dRQMjJ6ky
 Bkc075SuaYQ81uYzLWI958OcfPqXtSKWHYSwqzZUGbWadM9NThPV4duPwBUjYa5IdgPJ1x5cGZv
 KmHvmeKRmVPhhzHyY12B+I/ExXwfGRybUPjx3B5zfER4wRM0anvO54f5MZlf6hWjXILSnWnXm5m
 c0vuxKbbbs8DSHW8k32gmFxyniC+xV4rkOe9hVk6Z1kv5NyLBsxziqnmL+zPhiETESKXP17fw23
 mW56GS2ZhO6/2WsESJklvZbV+j2gW4AqTeVPkoZZWEPZvKg1hgF7Wj2sEjm5EdUOJrmi8X6w7Zf
 lzPUMfsFQPk4G9M9v1d3/ReAg9S0qrBEYPXRLhEjx1N0RZX/dFFNah34P0ZW6kcXJwo5gpzH12N
 BBBOky8lZH4adqEpV/aBQoqwtBLZug==
X-Proofpoint-ORIG-GUID: qROBt5JpVoXV3okvdcqVZdbWyqURM5ok
X-Authority-Analysis: v=2.4 cv=Afu83nXG c=1 sm=1 tr=0 ts=691730da cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=XkKmpa5t3BpS1E1QlwAA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: qROBt5JpVoXV3okvdcqVZdbWyqURM5ok
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511140109

The PM8008 device is a dedicated camera PMIC integrating all the necessary
camera power management features.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 75 ++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index 1b9ca957a94b..9814ac4896c5 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -267,6 +267,81 @@ &gpu_zap_shader {
 	firmware-name = "qcom/qcm2290/a702_zap.mbn";
 };
 
+&i2c1 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	pm8008: pmic@8 {
+		compatible = "qcom,pm8008";
+		reg = <0x8>;
+
+		interrupts-extended = <&tlmm 25 IRQ_TYPE_EDGE_RISING>;
+		reset-gpios = <&tlmm 26 GPIO_ACTIVE_LOW>;
+
+		vdd-l1-l2-supply = <&pm4125_s3>;
+		vdd-l3-l4-supply = <&vph_pwr>;
+		vdd-l5-supply = <&vph_pwr>;
+		vdd-l6-supply = <&vph_pwr>;
+		vdd-l7-supply = <&vph_pwr>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-ranges = <&pm8008 0 0 2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		#thermal-sensor-cells = <0>;
+
+		status = "disabled";
+
+		regulators {
+			vreg_l1p: ldo1 {
+				regulator-name = "vreg_l1p";
+				regulator-min-microvolt = <528000>;
+				regulator-max-microvolt = <1200000>;
+			};
+
+			vreg_l2p: ldo2 {
+				regulator-name = "vreg_l2p";
+				regulator-min-microvolt = <528000>;
+				regulator-max-microvolt = <1200000>;
+			};
+
+			vreg_l3p: ldo3 {
+				regulator-name = "vreg_l3p";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			vreg_l4p: ldo4 {
+				regulator-name = "vreg_l4p";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <3404000>;
+			};
+
+			vreg_l5p: ldo5 {
+				regulator-name = "vreg_l5p";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			vreg_l6p: ldo6 {
+				regulator-name = "vreg_l6p";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			vreg_l7p: ldo7 {
+				regulator-name = "vreg_l7p";
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+		};
+	};
+};
+
 &i2c2_gpio {
 	clock-frequency = <400000>;
 	status = "okay";
-- 
2.34.1


