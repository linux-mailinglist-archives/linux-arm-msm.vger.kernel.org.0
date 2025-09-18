Return-Path: <linux-arm-msm+bounces-74049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE96B83CAB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 11:28:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06377174167
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 09:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71E17302157;
	Thu, 18 Sep 2025 09:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DyLKNwBR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD93302148
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 09:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758187702; cv=none; b=uecbMsWcUCfQDn5M8VJtqz7YK/pgr/JJoYVmpk+hEcIZRZM1JaK52OpOwxv9I4tNpvjlAQAceWz4NbSFIn6UOOTaz/fjzCv8COez/hEX56oSLqTiJE2RJNYyB7J+uN/BI9s8wvmb/g6jNSNgXgbkmgR1If75CpTNHbFgWYZVnLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758187702; c=relaxed/simple;
	bh=SVm+2JNVOaU5nQkmgsxMtzbT+R/HyCvs1JvnOMf0qQw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XM/JChQptGKYCf42/N5NPsxjRMXtcxJpotnkXW0Vco7hRjBaHu7hNt4z/lFnIncc+izRRNCbPDKyALLrPL2n0lMmlpK/M6pbZcdE5/ZgBkzfUglJJGlRJWyyhy6NFWOkD2nrHH9pn6HMEAOnO4TeWM3w4QxmDhqoNvIvndbkYyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DyLKNwBR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I8B5pJ007399
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 09:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ub3GQmzHl30Cut+oVDM/HIiblWbIkzetyqoTDLdfgQ=; b=DyLKNwBREmnF/Tsc
	W5KF8310aGNbC5TsLw2I27+jSN9kFgrhTsaO1feckjSFYzSkgPcXoSBDLt/bviQW
	iTAgRBB3ngo8qh/n4vXJ+Whw2zqOshn5yqpj+FT4ZEgTPNLk2MqF3/bAHm9TkKki
	2UkcEuc0B+YE2NvFV5UjcpiHRI2m6V9+v0vyZBU9oa27Z0Hy/AKQg5Rt58S7b2qZ
	ZS22o1S+oJzZ6iP1ceb8YQQN4T6ltgXEcpv9N9P2mw8JR6zFP9g8ZYLH1HItrA4Q
	ILj+Di2UdqPvBMOt+Or1O2Zf5d/sL6dh2zLy8oqON8FJxyzluChTZiErpbViWB/g
	xz8zug==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 498eber7y2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 09:28:19 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b52435ee30cso530555a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 02:28:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758187698; x=1758792498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ub3GQmzHl30Cut+oVDM/HIiblWbIkzetyqoTDLdfgQ=;
        b=I6f3xhraOLKQz7rtY4CybMAG7j3XRizAhq9hLv6vX798tmsGoe7ELCZY8vs3eYm0kq
         zROcdw49w/WX2Alp1HE0KjppP6+WqruhW5j93Ileykef18KYEZXCwkfhBROBcsCx02DW
         v+YbBeT1Ji70hRhhBYCPMOk4y7IbClpMhqa9Rwi8Yqb5NY+t8/vJ03mW4ek+lnUrWL3a
         TDf15T9TkUqr+b/ATOEd/iTdwpQ2kkvyOe5QBynLgRQL0R8RahTABUY2ZVddAJtDsXYJ
         bavxL5zabvg3/qOo5+FqLyX2eGhUQsPpOe5Gvm9qrh00mrLZatDuQwAtzKAo/lnTG7C/
         L5YA==
X-Gm-Message-State: AOJu0YwFTrwLwCgDWfuY+IJAzKC9o5U96aPfYo1ncld3haRBTVhSRrda
	CMpa4yZuRVy4y4ptbSTNBkLzFHGZlXXDL4tszZI6MTo0zB7640TzEF6zbfmC3VjyUOi7pM+MbN8
	8cM6TngFQgXVj/PYOKqP2Jx8hiFljkTtjTI2G7xMjV4Jqu1xP8a/H0QtKAovoLe0su6x9CJ5VJ9
	oW
X-Gm-Gg: ASbGncvrII8aKSJ6809Uljbfdgurz7+u3bEuXPAUjcJByZ6EqMDIjclidn/gHLNZZ3w
	w5P2TZsanm8OR+4xtT69Ggq11J15/S4W+KE6e82NZeDrz9Zp2GLSW9GCYYWEiKAI8+1yAuUQFjj
	u5nz4YbnamAVWhL5h036sd0fQViFVGz0AwF5lDxnUo2yKg5U069xX6IO0wOSrHEqzC5wRO97f+k
	qSulUgLj3xr1Up/5yt1elRmEYjoPBx+nrGQ782yNNqwvGl5goXQb/amCtDoyvYye1jcRujfPviJ
	4aYFmNDPzpUQb7Q4Ex8FgJyhvVgjhFTYLv02TCl2ChXCdVUErQY1Ab15M+mRKoQ7FcE2+yXfCPE
	ntJLY/ei/4m3LyeJkT8cLW+gq3Q==
X-Received: by 2002:a05:6a20:939f:b0:263:b547:d0c3 with SMTP id adf61e73a8af0-27aa47743cbmr8198930637.36.1758187698266;
        Thu, 18 Sep 2025 02:28:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdk4fIjvqrYrgerXEHulOA8AzRWcolrxLfECXiV2TjRAx9Q4Tf5SWxS1d+nVx41RCe/t/EvA==
X-Received: by 2002:a05:6a20:939f:b0:263:b547:d0c3 with SMTP id adf61e73a8af0-27aa47743cbmr8198900637.36.1758187697744;
        Thu, 18 Sep 2025 02:28:17 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfbb79b81sm1819205b3a.10.2025.09.18.02.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 02:28:17 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 14:57:04 +0530
Subject: [PATCH v3 4/4] regulator: rpmh-regulator: Add RPMH regulator
 support for Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-glymur-rpmh-regulator-driver-v3-4-184c09678be3@oss.qualcomm.com>
References: <20250918-glymur-rpmh-regulator-driver-v3-0-184c09678be3@oss.qualcomm.com>
In-Reply-To: <20250918-glymur-rpmh-regulator-driver-v3-0-184c09678be3@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758187677; l=10504;
 i=kamal.wadhwa@oss.qualcomm.com; s=20241018; h=from:subject:message-id;
 bh=SVm+2JNVOaU5nQkmgsxMtzbT+R/HyCvs1JvnOMf0qQw=;
 b=Rh+hrzxz+ag0rqPhTlhTb5GF9OBc/F1IFA//rz+NQEF5V53AFB/9Ml18SwH4E7/BLhnXqH32+
 nsnc60Tz13vCQl9hhf7nS2gm/3CvMq5SCN6WF0jDwwBS0Oks7K1dYQD
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=XbPE6DM5/mJi2tsiYwMCJCZ4O5XPMqColJRlGVcM7Hs=
X-Proofpoint-ORIG-GUID: UfvW8IZ-23znshfqraw2H69cYR1mH-2v
X-Authority-Analysis: v=2.4 cv=H6/bw/Yi c=1 sm=1 tr=0 ts=68cbd0b3 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=9dvOv8C0H7iFIk4192MA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: UfvW8IZ-23znshfqraw2H69cYR1mH-2v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDA3NCBTYWx0ZWRfX7XtuOGTSqiAN
 sl3DMFRzNyvgGUV6noeoTaqRdyAVbXr2iXDvEz6oCI/JhSc5hzcnXyPFYHNclFPtm5ys+SL9uKp
 D+8TgNTM0Lx3xTOAMwk7es7P9ioQDfardkze00/zL/dAXYqep1AgVzaqAH1qTK2Y4LhdbRm7SEJ
 zS1uOt9Q4Sg4hglUZnzm3E5aSKjSCSa99kGjJArjv5hqNLiTBydrNRj7HkKD/dKRUILP7f9q4Z/
 oTpTjSy7ob5c+GXXhRtCq/3o+OezJ5gKTud3p2ehqnBMHkIMhaOxuCUgq3HeSb0h2Cz57UcVO/4
 TYUUHU4MScypFkmzuODDoeQ9Ps1MHYmU202uoDrtE10PrWvZdZRuXuW+IbrCoaQJEurUIhOryCd
 Q2fPd+CV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509180074

Add support for PMH0101/PMCX0102/PMH0110/PMH0104 PMIC voltage
regulators which are present on Glymur boards.

Introduce new LDOs & SMPSs under them (PMIC5 subtype 530 for
both).

For these new LDOs support a new optimum power mode(OPM). In
this mode LDO will automatically switch between high power mode
(HPM) and low power mode (LPM) based on the real-time LDO load
current. Its operation is analogous to SMPS AUTO mode.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 188 +++++++++++++++++++++++++++++++-
 1 file changed, 187 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index dfb5bf5b72a1ee0a9a87b72c7baabd52779819a3..0a561f1d94523bf479f48e8c2062f79cf64f5b5f 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2018-2021, The Linux Foundation. All rights reserved.
-// Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
 
 #define pr_fmt(fmt) "%s: " fmt, __func__
 
@@ -92,6 +92,11 @@ static const struct resource_name_formats vreg_rsc_name_lookup[NUM_REGULATOR_TYP
 #define PMIC5_BOB_MODE_AUTO			6
 #define PMIC5_BOB_MODE_PWM			7
 
+#define PMIC530_LDO_MODE_RETENTION		3
+#define PMIC530_LDO_MODE_LPM			4
+#define PMIC530_LDO_MODE_OPM			5
+#define PMIC530_LDO_MODE_HPM			7
+
 #define PMIC_ID_LEN				4
 /**
  * struct rpmh_vreg_hw_data - RPMh regulator hardware configurations
@@ -557,6 +562,14 @@ static const int pmic_mode_map_pmic5_ldo_hpm[REGULATOR_MODE_STANDBY + 1] = {
 	[REGULATOR_MODE_FAST]    = -EINVAL,
 };
 
+static const int pmic_mode_map_pmic530_ldo[REGULATOR_MODE_STANDBY + 1] = {
+	[REGULATOR_MODE_INVALID] = -EINVAL,
+	[REGULATOR_MODE_STANDBY] = PMIC530_LDO_MODE_RETENTION,
+	[REGULATOR_MODE_IDLE]    = PMIC530_LDO_MODE_LPM,
+	[REGULATOR_MODE_NORMAL]  = PMIC530_LDO_MODE_OPM,
+	[REGULATOR_MODE_FAST]    = PMIC530_LDO_MODE_HPM,
+};
+
 static unsigned int rpmh_regulator_pmic4_ldo_of_map_mode(unsigned int rpmh_mode)
 {
 	unsigned int mode;
@@ -579,6 +592,30 @@ static unsigned int rpmh_regulator_pmic4_ldo_of_map_mode(unsigned int rpmh_mode)
 	return mode;
 }
 
+static unsigned int rpmh_regulator_pmic530_ldo_of_map_mode(unsigned int rpmh_mode)
+{
+	unsigned int mode;
+
+	switch (rpmh_mode) {
+	case RPMH_REGULATOR_MODE_HPM:
+		mode = REGULATOR_MODE_FAST;
+		break;
+	case RPMH_REGULATOR_MODE_AUTO:
+		mode = REGULATOR_MODE_NORMAL;
+		break;
+	case RPMH_REGULATOR_MODE_LPM:
+		mode = REGULATOR_MODE_IDLE;
+		break;
+	case RPMH_REGULATOR_MODE_RET:
+		mode = REGULATOR_MODE_STANDBY;
+		break;
+	default:
+		mode = REGULATOR_MODE_INVALID;
+		break;
+	}
+	return mode;
+}
+
 static const int pmic_mode_map_pmic4_smps[REGULATOR_MODE_STANDBY + 1] = {
 	[REGULATOR_MODE_INVALID] = -EINVAL,
 	[REGULATOR_MODE_STANDBY] = PMIC4_SMPS_MODE_RETENTION,
@@ -942,6 +979,71 @@ static const struct rpmh_vreg_hw_data pmic5_bob = {
 	.of_map_mode = rpmh_regulator_pmic4_bob_of_map_mode,
 };
 
+static const struct rpmh_vreg_hw_data pmic5_nldo530 = {
+	.regulator_type = VRM,
+	.ops = &rpmh_regulator_vrm_drms_ops,
+	.voltage_ranges = (struct linear_range[]) {
+		REGULATOR_LINEAR_RANGE(320000, 0, 210, 8000),
+	},
+	.n_linear_ranges = 1,
+	.n_voltages = 211,
+	.hpm_min_load_uA = 30000,
+	.pmic_mode_map = pmic_mode_map_pmic530_ldo,
+	.of_map_mode = rpmh_regulator_pmic530_ldo_of_map_mode,
+};
+
+static const struct rpmh_vreg_hw_data pmic5_pldo530_mvp150 = {
+	.regulator_type = VRM,
+	.ops = &rpmh_regulator_vrm_drms_ops,
+	.voltage_ranges = (struct linear_range[]) {
+		REGULATOR_LINEAR_RANGE(1504000, 0, 255, 8000),
+	},
+	.n_linear_ranges = 1,
+	.n_voltages = 256,
+	.hpm_min_load_uA = 10000,
+	.pmic_mode_map = pmic_mode_map_pmic530_ldo,
+	.of_map_mode = rpmh_regulator_pmic530_ldo_of_map_mode,
+};
+
+static const struct rpmh_vreg_hw_data pmic5_pldo530_mvp300 = {
+	.regulator_type = VRM,
+	.ops = &rpmh_regulator_vrm_drms_ops,
+	.voltage_ranges = (struct linear_range[]) {
+		REGULATOR_LINEAR_RANGE(1504000, 0, 255, 8000),
+	},
+	.n_linear_ranges = 1,
+	.n_voltages = 256,
+	.hpm_min_load_uA = 20000,
+	.pmic_mode_map = pmic_mode_map_pmic530_ldo,
+	.of_map_mode = rpmh_regulator_pmic530_ldo_of_map_mode,
+};
+
+static const struct rpmh_vreg_hw_data pmic5_pldo530_mvp600 = {
+	.regulator_type = VRM,
+	.ops = &rpmh_regulator_vrm_drms_ops,
+	.voltage_ranges = (struct linear_range[]) {
+		REGULATOR_LINEAR_RANGE(1504000, 0, 255, 8000),
+	},
+	.n_linear_ranges = 1,
+	.n_voltages = 256,
+	.hpm_min_load_uA = 40000,
+	.pmic_mode_map = pmic_mode_map_pmic530_ldo,
+	.of_map_mode = rpmh_regulator_pmic530_ldo_of_map_mode,
+};
+
+static const struct rpmh_vreg_hw_data pmic5_ftsmps530 = {
+	.regulator_type = VRM,
+	.ops = &rpmh_regulator_vrm_ops,
+	.voltage_ranges = (struct linear_range[]) {
+		REGULATOR_LINEAR_RANGE(252000, 0, 305, 4000),
+		REGULATOR_LINEAR_RANGE(1480000, 306, 464, 8000),
+	},
+	.n_linear_ranges = 2,
+	.n_voltages = 465,
+	.pmic_mode_map = pmic_mode_map_pmic5_smps,
+	.of_map_mode = rpmh_regulator_pmic4_smps_of_map_mode,
+};
+
 #define RPMH_VREG(_name, _vreg_hw_type, _index, _hw_data, _supply_name) \
 { \
 	.name		= _name, \
@@ -1376,6 +1478,74 @@ static const struct rpmh_vreg_init_data pm6350_vreg_data[] = {
 	RPMH_VREG("ldo22",  LDO,  22, &pmic5_nldo,      NULL),
 };
 
+static const struct rpmh_vreg_init_data pmcx0102_vreg_data[] = {
+	RPMH_VREG("smps1",   SMPS, 1,    &pmic5_ftsmps530, "vdd-s1"),
+	RPMH_VREG("smps2",   SMPS, 2,    &pmic5_ftsmps530, "vdd-s2"),
+	RPMH_VREG("smps3",   SMPS, 3,    &pmic5_ftsmps530, "vdd-s3"),
+	RPMH_VREG("smps4",   SMPS, 4,    &pmic5_ftsmps530, "vdd-s4"),
+	RPMH_VREG("smps5",   SMPS, 5,    &pmic5_ftsmps530, "vdd-s5"),
+	RPMH_VREG("smps6",   SMPS, 6,    &pmic5_ftsmps530, "vdd-s6"),
+	RPMH_VREG("smps7",   SMPS, 7,    &pmic5_ftsmps530, "vdd-s7"),
+	RPMH_VREG("smps8",   SMPS, 8,    &pmic5_ftsmps530, "vdd-s8"),
+	RPMH_VREG("smps9",   SMPS, 9,    &pmic5_ftsmps530, "vdd-s9"),
+	RPMH_VREG("smps10",  SMPS, 10,   &pmic5_ftsmps530, "vdd-s10"),
+	RPMH_VREG("ldo1",   LDO,  1,    &pmic5_nldo530,      "vdd-l1"),
+	RPMH_VREG("ldo2",   LDO,  2,    &pmic5_nldo530,      "vdd-l2"),
+	RPMH_VREG("ldo3",   LDO,  3,    &pmic5_nldo530,      "vdd-l3"),
+	RPMH_VREG("ldo4",   LDO,  4,    &pmic5_nldo530,      "vdd-l4"),
+	{}
+};
+
+static const struct rpmh_vreg_init_data pmh0101_vreg_data[] = {
+	RPMH_VREG("ldo1",   LDO, 1,  &pmic5_nldo530,      "vdd-l1-l4-l10"),
+	RPMH_VREG("ldo2",   LDO, 2,  &pmic5_pldo530_mvp300,      "vdd-l2-l13-l14"),
+	RPMH_VREG("ldo3",   LDO, 3,  &pmic5_nldo530,      "vdd-l3-l11"),
+	RPMH_VREG("ldo4",   LDO, 4,  &pmic5_nldo530,      "vdd-l1-l4-l10"),
+	RPMH_VREG("ldo5",   LDO, 5,  &pmic5_pldo530_mvp150,      "vdd-l5-l16"),
+	RPMH_VREG("ldo6",   LDO, 6,  &pmic5_pldo530_mvp300,      "vdd-l6-l7"),
+	RPMH_VREG("ldo7",   LDO, 7,  &pmic5_pldo530_mvp300,      "vdd-l6-l7"),
+	RPMH_VREG("ldo8",   LDO, 8,  &pmic5_pldo530_mvp150,      "vdd-l8-l9"),
+	RPMH_VREG("ldo9",   LDO, 9,  &pmic5_pldo515_mv,      "vdd-l8-l9"),
+	RPMH_VREG("ldo10",  LDO, 10, &pmic5_nldo530,      "vdd-l1-l4-l10"),
+	RPMH_VREG("ldo11",  LDO, 11, &pmic5_nldo530,      "vdd-l3-l11"),
+	RPMH_VREG("ldo12",  LDO, 12, &pmic5_nldo530,      "vdd-l12"),
+	RPMH_VREG("ldo13",  LDO, 13, &pmic5_pldo530_mvp150,     "vdd-l2-l13-l14"),
+	RPMH_VREG("ldo14",  LDO, 14, &pmic5_pldo530_mvp150,     "vdd-l2-l13-l14"),
+	RPMH_VREG("ldo15",  LDO, 15, &pmic5_nldo530,      "vdd-l15"),
+	RPMH_VREG("ldo16",  LDO, 15, &pmic5_pldo530_mvp600,      "vdd-l5-l16"),
+	RPMH_VREG("ldo17",  LDO, 17, &pmic5_pldo515_mv,   "vdd-l17"),
+	RPMH_VREG("ldo18",  LDO, 18, &pmic5_nldo530,      "vdd-l18"),
+	RPMH_VREG("bob1",   BOB, 1,  &pmic5_bob,          "vdd-bob1"),
+	RPMH_VREG("bob2",   BOB, 2,  &pmic5_bob,          "vdd-bob2"),
+	{}
+};
+
+static const struct rpmh_vreg_init_data pmh0104_vreg_data[] = {
+	RPMH_VREG("smps1",   SMPS, 1,    &pmic5_ftsmps530, "vdd-s1"),
+	RPMH_VREG("smps2",   SMPS, 2,    &pmic5_ftsmps530, "vdd-s2"),
+	RPMH_VREG("smps3",   SMPS, 3,    &pmic5_ftsmps530, "vdd-s3"),
+	RPMH_VREG("smps4",   SMPS, 4,    &pmic5_ftsmps530, "vdd-s4"),
+	{}
+};
+
+static const struct rpmh_vreg_init_data pmh0110_vreg_data[] = {
+	RPMH_VREG("smps1",   SMPS, 1,    &pmic5_ftsmps530, "vdd-s1"),
+	RPMH_VREG("smps2",   SMPS, 2,    &pmic5_ftsmps530, "vdd-s2"),
+	RPMH_VREG("smps3",   SMPS, 3,    &pmic5_ftsmps530, "vdd-s3"),
+	RPMH_VREG("smps4",   SMPS, 4,    &pmic5_ftsmps530, "vdd-s4"),
+	RPMH_VREG("smps5",   SMPS, 5,    &pmic5_ftsmps530, "vdd-s5"),
+	RPMH_VREG("smps6",   SMPS, 6,    &pmic5_ftsmps530, "vdd-s6"),
+	RPMH_VREG("smps7",   SMPS, 7,    &pmic5_ftsmps530, "vdd-s7"),
+	RPMH_VREG("smps8",   SMPS, 8,    &pmic5_ftsmps530, "vdd-s8"),
+	RPMH_VREG("smps9",   SMPS, 9,    &pmic5_ftsmps530, "vdd-s9"),
+	RPMH_VREG("smps10",  SMPS, 10,   &pmic5_ftsmps530, "vdd-s10"),
+	RPMH_VREG("ldo1",   LDO,  1,    &pmic5_nldo530,      "vdd-l1"),
+	RPMH_VREG("ldo2",   LDO,  2,    &pmic5_nldo530,      "vdd-l2"),
+	RPMH_VREG("ldo3",   LDO,  3,    &pmic5_nldo530,      "vdd-l3"),
+	RPMH_VREG("ldo4",   LDO,  4,    &pmic5_nldo530,      "vdd-l4"),
+	{}
+};
+
 static const struct rpmh_vreg_init_data pmx55_vreg_data[] = {
 	RPMH_VREG("smps1",  SMPS, 1,  &pmic5_ftsmps510, "vdd-s1"),
 	RPMH_VREG("smps2",  SMPS, 2,  &pmic5_hfsmps510, "vdd-s2"),
@@ -1728,6 +1898,22 @@ static const struct of_device_id __maybe_unused rpmh_regulator_match_table[] = {
 		.compatible = "qcom,pmc8380-rpmh-regulators",
 		.data = pmc8380_vreg_data,
 	},
+	{
+		.compatible = "qcom,pmcx0102-rpmh-regulators",
+		.data = pmcx0102_vreg_data,
+	},
+	{
+		.compatible = "qcom,pmh0101-rpmh-regulators",
+		.data = pmh0101_vreg_data,
+	},
+	{
+		.compatible = "qcom,pmh0104-rpmh-regulators",
+		.data = pmh0104_vreg_data,
+	},
+	{
+		.compatible = "qcom,pmh0110-rpmh-regulators",
+		.data = pmh0110_vreg_data,
+	},
 	{
 		.compatible = "qcom,pmm8155au-rpmh-regulators",
 		.data = pmm8155au_vreg_data,

-- 
2.25.1


