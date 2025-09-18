Return-Path: <linux-arm-msm+bounces-74050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D41B83CA5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 11:28:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B19411887364
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 09:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8083230215B;
	Thu, 18 Sep 2025 09:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lz6+lRvS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8366321CC60
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 09:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758187702; cv=none; b=YXUX433CIFs2WxcPQ1lnSnAMOyv+o5W1Np/Uoww1zXEHGoAC3ydY559uCp+baxMQKu4BWndbwa2Gy1n7dDwZmAEdrJfCHoiaw2oi3lOr+pF89kYJrL4mQS8IwU6I0VX86m+thCuelKL6uHiCePL3xZky7d9/2sOF7UHWLxjkmpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758187702; c=relaxed/simple;
	bh=/CGq43tzWMfNDdDlK+Qof7y3z9AJtrM6doZyagoTfmg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hwVm4VLLC5j/mbdIGXy4Hnu2DwMW9rIPwz3fcZyEkWxktavAey78JSPc34/eRsLcelC8x5e7/blsTBU00VeGV15d4l71VoebVDAImevqe/sKhjALrx2CDMtGavVuY5itXdXAxFUZIPSIAx764GAuxAwdjax7dspovwUc6dXmG14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lz6+lRvS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I3ZRB6018260
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 09:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GKQOCbzNiJwcD7lOUVacKmR8HC41YYV39DVESXD17xw=; b=Lz6+lRvSUzRVoyIX
	5YGsz3vmGnL4nteOIHBh34EQSJ2DYwlX6SNKedek0D5OGcgAcNgcLDsFBID5GeeG
	+nWBUY8nRdteYZ+4mvivtd/APLmiOyvxRhSNA+p5dR4SxjukX4i1lAgLBoEuNzoI
	Hwtz5yOJpP/dGL1vxClKHYsrci/Hhy87N8PwbNE+Ek7uiQ1Jv0JoZ8oAxd7LbX1w
	2JL4XHdaG6GG4+MEStyH8psVv4MVMp1VqRc2MWk7jUHCNNNSryOlob7tSfWe2/8z
	uDlL5oZFqx4ia6D0hdF4zFKqFDRiyLgOOL9bE7QKA1ZKmwvCLJq40MHwBSY3qqDL
	BZKqoQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxwdqhu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 09:28:17 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b550514936fso527263a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 02:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758187696; x=1758792496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GKQOCbzNiJwcD7lOUVacKmR8HC41YYV39DVESXD17xw=;
        b=ZiTAp/JtUFs5VcxWJ7h1rahumy2OUEGxk0mI4uaDCWYSOfie4QBamJLpw96S0I3s8M
         dITxLsZhdYWEkoxwdfr7ytlRgprgyDe3IvUml/2xwKimmSTa1oa0cqHdewo7HjuEicOC
         SbXNWBHrG332nLwRqhaqb0zlpKOqgxfa5kGzy/Mq0DBrituR+pbuT9iUhK5sKvmzR2AB
         +U4/z0Khp8eQGVYuqaMfwd6e/2ycwgsfDJo60M0zg4teAsxqNmeZp4BGq9rNfX5nMMez
         XqXGVarelZbTiZ2IVPpaSR+A2GT8h8JEMszCA8jgq7d7jM9PP5rKlQXRsbmNWEy6WtZd
         wa+A==
X-Gm-Message-State: AOJu0YzaR9GmZCM9eJyZRmvmh2NIsSNAG42WhMtiwHhPHKhlhQ6VhEK8
	LpMW2b79p0gldzwK1q5BA/QNK8DqRffytHuObl87c7WKsEU2ly60PTMAIQ3Mk5abFJJ0jFCm7bK
	c7t8Q2m9K+kEsrf9I9sOx5Yv8fNi88ptaW+eLFZDZM/6F6ei4yI5GZ2D9maozGUo0/DAx
X-Gm-Gg: ASbGncvENM8Y+HpIFHaMRWHUsmZQFS5fxzEjkUi/Ut8Mq1u5gD4YU6PitvBKR2fVfFH
	34ccIZKfk69l32VpKus/T9xzaiwPXZiHBFWmE0Bh9m6avSqcks1HsI9JRhCJJi5hdWWZ5Hp2E54
	aXLXkU62tmdjkyYtvOdBThqwDQYW8SUr5xpbMM86KJiazkNhSJfAJv7x1NvVYjuYDw0XfAQAByk
	/774r7LWzSZTxxrd1J9vJ4iAKMpTiN+oElVv5r4cGIAgNkMyLPbtMMkdJu1LwxnZc8s1BI8vmDN
	WYMGsFVl7sF9E8jhKJ7geLTUov54zB+m5OB93RoSTxyBz9Y2YGu8xwArQNL+R9zq6jk+rB7JCIx
	YyZpjzzaRNR4oI+f7/ZkwkhFogg==
X-Received: by 2002:a05:6a20:a124:b0:262:c083:bb38 with SMTP id adf61e73a8af0-27a6e11485dmr7791621637.0.1758187694988;
        Thu, 18 Sep 2025 02:28:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGr733iNh33H/jSHPNgV2BGoInscEPV5FOjO83W+r6oWbDbsCiT6X+FdO80O29SO0iS5H/oJw==
X-Received: by 2002:a05:6a20:a124:b0:262:c083:bb38 with SMTP id adf61e73a8af0-27a6e11485dmr7791535637.0.1758187693731;
        Thu, 18 Sep 2025 02:28:13 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfbb79b81sm1819205b3a.10.2025.09.18.02.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 02:28:13 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 14:57:03 +0530
Subject: [PATCH v3 3/4] regulator: rpmh-regulator: Add support for new
 resource name format
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-glymur-rpmh-regulator-driver-v3-3-184c09678be3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758187677; l=79104;
 i=kamal.wadhwa@oss.qualcomm.com; s=20241018; h=from:subject:message-id;
 bh=/CGq43tzWMfNDdDlK+Qof7y3z9AJtrM6doZyagoTfmg=;
 b=pSWifZ/dglQRfz6zogKEUgVyPz+xi7MpP2v3Hn8yxhT8hRpQvkbcqu9LSj2leF/ke6l3Xbb3a
 usn9N3pthRVBwd2F3w0uOKbU+9GxBMGEozZgKQaQa/LY5GWxPRDQocE
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=XbPE6DM5/mJi2tsiYwMCJCZ4O5XPMqColJRlGVcM7Hs=
X-Authority-Analysis: v=2.4 cv=HbIUTjE8 c=1 sm=1 tr=0 ts=68cbd0b1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=psU_LNHGxoy0vHIXUlgA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX4JtNMv/pxipr
 53v2q+WIHWTrmH+rbJbMwqIJWjjppYlQeykyaMpFzHQrp24i9t9aLum1Q+xRp+MwDD1bztH1gdv
 cZQwx6yBKkx2+BoRgdiDR6xc2F9pPQ4zT69mM8IqopQ4yiuWcifBN5TpdARAcKlbgcZx8S1RT4q
 iqrcAvueNFB4JUiTjU9xcoQkMB7bMDqllU9ZNgR9B+VcdROkmtKr2P+O0D2iVllWDcNqO4DPc//
 TT0XTBqPz8oY7qfrDI6H6uantkATeGbLPHnpJk3+E8sRGFn+eOh14PgY2ymeRfmDBcry4B4lmpu
 q04gQwSqD+HO4wmJH6gmNA7jMO5PRFmQVtl1Huer3tXxa3eADBnlQtbL/dVUheyL6VpSQWAotvJ
 s7k+01xQ
X-Proofpoint-GUID: 9BYGaWut8j-Wxy5vH_fmmJopHA57v-CU
X-Proofpoint-ORIG-GUID: 9BYGaWut8j-Wxy5vH_fmmJopHA57v-CU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

Currently rpmh-regulator resource name inside CMD-DB follows this
format: `^(ldo|smp|bob|vs)[a-n][1-9][0-9]?$`

(eg - ldob11, smpa2, bobc1 etc)

Here `[a-n]` in the resource name signifies the `pmic-id`.
However, newer firmware follows a different format that also
includes the `bus_id` as well in the resource name.

New format:
`^(L|S|B)[1-9][0-9]?[A-N]_E[0-3]$`

(eg - L11B_E1, S2A_E0, B1C_E0 etc)

Here `_E[0-3]` at the end is the `bus_id`, and upper case `[A-N]`
is used to denote `pmic-id`, while the regulator `(ldo|smp|bob)`
is replaced with their initials in upper case `(L|S|B|VA)`.

To handle this properly, do the following:

- Remove the `resource_name` member from vreg init data

- Add `index` and `regulator_hw_type` new members, which will
contain the index number and the regulator hardware type
(SMPS/LDO/BOB/VS) which can be combined with the pmic-id read
from the devicetree to generate the resource_name.

- Choose new resource name format if `pmic-id` contains `_E`
in it, else fallback to old format.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 1135 ++++++++++++++++---------------
 1 file changed, 587 insertions(+), 548 deletions(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 109f0aae09b1df431d2e14d45a64d115e87cdec4..dfb5bf5b72a1ee0a9a87b72c7baabd52779819a3 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -32,6 +32,34 @@ enum rpmh_regulator_type {
 	XOB,
 };
 
+/**
+ * enum regulator_hw_type - supported regulator types
+ * @SMPS:			Switch mode power supply.
+ * @LDO:			Linear Dropout regulator.
+ * @BOB:			Buck/Boost type regulator.
+ * @VS:			Simple voltage ON/OFF switch.
+ * @NUM_REGULATOR_TYPES:	Number of regulator types.
+ */
+enum regulator_hw_type {
+	SMPS,
+	LDO,
+	BOB,
+	VS,
+	NUM_REGULATOR_TYPES,
+};
+
+struct resource_name_formats {
+	const char *rsc_name_fmt;
+	const char *rsc_name_fmt1;
+};
+
+static const struct resource_name_formats vreg_rsc_name_lookup[NUM_REGULATOR_TYPES] = {
+	[SMPS]	= {"S%d%s", "smp%s%d"},
+	[LDO]	= {"L%d%s", "ldo%s%d"},
+	[BOB]	= {"B%d%s", "bob%s%d"},
+	[VS]	= {"VS%d%s", "vs%s%d"},
+};
+
 #define RPMH_REGULATOR_REG_VRM_VOLTAGE		0x0
 #define RPMH_REGULATOR_REG_ENABLE		0x4
 #define RPMH_REGULATOR_REG_VRM_MODE		0x8
@@ -64,6 +92,7 @@ enum rpmh_regulator_type {
 #define PMIC5_BOB_MODE_AUTO			6
 #define PMIC5_BOB_MODE_PWM			7
 
+#define PMIC_ID_LEN				4
 /**
  * struct rpmh_vreg_hw_data - RPMh regulator hardware configurations
  * @regulator_type:		RPMh accelerator type used to manage this
@@ -136,17 +165,17 @@ struct rpmh_vreg {
  * struct rpmh_vreg_init_data - initialization data for an RPMh regulator
  * @name:			Name for the regulator which also corresponds
  *				to the device tree subnode name of the regulator
- * @resource_name:		RPMh regulator resource name format string.
- *				This must include exactly one field: '%s' which
- *				is filled at run-time with the PMIC ID provided
- *				by device tree property qcom,pmic-id.  Example:
- *				"ldo%s1" for RPMh resource "ldoa1".
+ * @index:			This is the index number of the regulator present
+ *				on the PMIC.
+ * @vreg_hw_type:		Regulator HW type enum, this must be BOB, SMPS,
+ *				LDO, VS, based on the regulator HW type.
  * @supply_name:		Parent supply regulator name
  * @hw_data:			Configuration data for this PMIC regulator type
  */
 struct rpmh_vreg_init_data {
 	const char			*name;
-	const char			*resource_name;
+	enum regulator_hw_type		vreg_hw_type;
+	int				index;
 	const char			*supply_name;
 	const struct rpmh_vreg_hw_data	*hw_data;
 };
@@ -417,6 +446,7 @@ static int rpmh_regulator_init_vreg(struct rpmh_vreg *vreg, struct device *dev,
 {
 	struct regulator_config reg_config = {};
 	char rpmh_resource_name[20] = "";
+	const char *rsc_name;
 	const struct rpmh_vreg_init_data *rpmh_data;
 	struct regulator_init_data *init_data;
 	struct regulator_dev *rdev;
@@ -433,8 +463,16 @@ static int rpmh_regulator_init_vreg(struct rpmh_vreg *vreg, struct device *dev,
 		return -EINVAL;
 	}
 
-	scnprintf(rpmh_resource_name, sizeof(rpmh_resource_name),
-		rpmh_data->resource_name, pmic_id);
+	if (strnlen(pmic_id, PMIC_ID_LEN) > 1 && strnstr(pmic_id, "_E", PMIC_ID_LEN)) {
+		rsc_name = vreg_rsc_name_lookup[rpmh_data->vreg_hw_type].rsc_name_fmt;
+		scnprintf(rpmh_resource_name, sizeof(rpmh_resource_name),
+			  rsc_name, rpmh_data->index, pmic_id);
+
+	} else {
+		rsc_name = vreg_rsc_name_lookup[rpmh_data->vreg_hw_type].rsc_name_fmt1;
+		scnprintf(rpmh_resource_name, sizeof(rpmh_resource_name),
+			  rsc_name, pmic_id, rpmh_data->index);
+	}
 
 	vreg->addr = cmd_db_read_addr(rpmh_resource_name);
 	if (!vreg->addr) {
@@ -904,671 +942,672 @@ static const struct rpmh_vreg_hw_data pmic5_bob = {
 	.of_map_mode = rpmh_regulator_pmic4_bob_of_map_mode,
 };
 
-#define RPMH_VREG(_name, _resource_name, _hw_data, _supply_name) \
+#define RPMH_VREG(_name, _vreg_hw_type, _index, _hw_data, _supply_name) \
 { \
 	.name		= _name, \
-	.resource_name	= _resource_name, \
+	.vreg_hw_type	= _vreg_hw_type, \
+	.index		= _index, \
 	.hw_data	= _hw_data, \
 	.supply_name	= _supply_name, \
 }
 
 static const struct rpmh_vreg_init_data pm8998_vreg_data[] = {
-	RPMH_VREG("smps1",  "smp%s1",  &pmic4_ftsmps426, "vdd-s1"),
-	RPMH_VREG("smps2",  "smp%s2",  &pmic4_ftsmps426, "vdd-s2"),
-	RPMH_VREG("smps3",  "smp%s3",  &pmic4_hfsmps3,   "vdd-s3"),
-	RPMH_VREG("smps4",  "smp%s4",  &pmic4_hfsmps3,   "vdd-s4"),
-	RPMH_VREG("smps5",  "smp%s5",  &pmic4_hfsmps3,   "vdd-s5"),
-	RPMH_VREG("smps6",  "smp%s6",  &pmic4_ftsmps426, "vdd-s6"),
-	RPMH_VREG("smps7",  "smp%s7",  &pmic4_ftsmps426, "vdd-s7"),
-	RPMH_VREG("smps8",  "smp%s8",  &pmic4_ftsmps426, "vdd-s8"),
-	RPMH_VREG("smps9",  "smp%s9",  &pmic4_ftsmps426, "vdd-s9"),
-	RPMH_VREG("smps10", "smp%s10", &pmic4_ftsmps426, "vdd-s10"),
-	RPMH_VREG("smps11", "smp%s11", &pmic4_ftsmps426, "vdd-s11"),
-	RPMH_VREG("smps12", "smp%s12", &pmic4_ftsmps426, "vdd-s12"),
-	RPMH_VREG("smps13", "smp%s13", &pmic4_ftsmps426, "vdd-s13"),
-	RPMH_VREG("ldo1",   "ldo%s1",  &pmic4_nldo,      "vdd-l1-l27"),
-	RPMH_VREG("ldo2",   "ldo%s2",  &pmic4_nldo,      "vdd-l2-l8-l17"),
-	RPMH_VREG("ldo3",   "ldo%s3",  &pmic4_nldo,      "vdd-l3-l11"),
-	RPMH_VREG("ldo4",   "ldo%s4",  &pmic4_nldo,      "vdd-l4-l5"),
-	RPMH_VREG("ldo5",   "ldo%s5",  &pmic4_nldo,      "vdd-l4-l5"),
-	RPMH_VREG("ldo6",   "ldo%s6",  &pmic4_pldo,      "vdd-l6"),
-	RPMH_VREG("ldo7",   "ldo%s7",  &pmic4_pldo_lv,   "vdd-l7-l12-l14-l15"),
-	RPMH_VREG("ldo8",   "ldo%s8",  &pmic4_nldo,      "vdd-l2-l8-l17"),
-	RPMH_VREG("ldo9",   "ldo%s9",  &pmic4_pldo,      "vdd-l9"),
-	RPMH_VREG("ldo10",  "ldo%s10", &pmic4_pldo,      "vdd-l10-l23-l25"),
-	RPMH_VREG("ldo11",  "ldo%s11", &pmic4_nldo,      "vdd-l3-l11"),
-	RPMH_VREG("ldo12",  "ldo%s12", &pmic4_pldo_lv,   "vdd-l7-l12-l14-l15"),
-	RPMH_VREG("ldo13",  "ldo%s13", &pmic4_pldo,      "vdd-l13-l19-l21"),
-	RPMH_VREG("ldo14",  "ldo%s14", &pmic4_pldo_lv,   "vdd-l7-l12-l14-l15"),
-	RPMH_VREG("ldo15",  "ldo%s15", &pmic4_pldo_lv,   "vdd-l7-l12-l14-l15"),
-	RPMH_VREG("ldo16",  "ldo%s16", &pmic4_pldo,      "vdd-l16-l28"),
-	RPMH_VREG("ldo17",  "ldo%s17", &pmic4_nldo,      "vdd-l2-l8-l17"),
-	RPMH_VREG("ldo18",  "ldo%s18", &pmic4_pldo,      "vdd-l18-l22"),
-	RPMH_VREG("ldo19",  "ldo%s19", &pmic4_pldo,      "vdd-l13-l19-l21"),
-	RPMH_VREG("ldo20",  "ldo%s20", &pmic4_pldo,      "vdd-l20-l24"),
-	RPMH_VREG("ldo21",  "ldo%s21", &pmic4_pldo,      "vdd-l13-l19-l21"),
-	RPMH_VREG("ldo22",  "ldo%s22", &pmic4_pldo,      "vdd-l18-l22"),
-	RPMH_VREG("ldo23",  "ldo%s23", &pmic4_pldo,      "vdd-l10-l23-l25"),
-	RPMH_VREG("ldo24",  "ldo%s24", &pmic4_pldo,      "vdd-l20-l24"),
-	RPMH_VREG("ldo25",  "ldo%s25", &pmic4_pldo,      "vdd-l10-l23-l25"),
-	RPMH_VREG("ldo26",  "ldo%s26", &pmic4_nldo,      "vdd-l26"),
-	RPMH_VREG("ldo27",  "ldo%s27", &pmic4_nldo,      "vdd-l1-l27"),
-	RPMH_VREG("ldo28",  "ldo%s28", &pmic4_pldo,      "vdd-l16-l28"),
-	RPMH_VREG("lvs1",   "vs%s1",   &pmic4_lvs,       "vin-lvs-1-2"),
-	RPMH_VREG("lvs2",   "vs%s2",   &pmic4_lvs,       "vin-lvs-1-2"),
+	RPMH_VREG("smps1",  SMPS, 1,  &pmic4_ftsmps426, "vdd-s1"),
+	RPMH_VREG("smps2",  SMPS, 2,  &pmic4_ftsmps426, "vdd-s2"),
+	RPMH_VREG("smps3",  SMPS, 3,  &pmic4_hfsmps3,   "vdd-s3"),
+	RPMH_VREG("smps4",  SMPS, 4,  &pmic4_hfsmps3,   "vdd-s4"),
+	RPMH_VREG("smps5",  SMPS, 5,  &pmic4_hfsmps3,   "vdd-s5"),
+	RPMH_VREG("smps6",  SMPS, 6,  &pmic4_ftsmps426, "vdd-s6"),
+	RPMH_VREG("smps7",  SMPS, 7,  &pmic4_ftsmps426, "vdd-s7"),
+	RPMH_VREG("smps8",  SMPS, 8,  &pmic4_ftsmps426, "vdd-s8"),
+	RPMH_VREG("smps9",  SMPS, 9,  &pmic4_ftsmps426, "vdd-s9"),
+	RPMH_VREG("smps10", SMPS, 10, &pmic4_ftsmps426, "vdd-s10"),
+	RPMH_VREG("smps11", SMPS, 11, &pmic4_ftsmps426, "vdd-s11"),
+	RPMH_VREG("smps12", SMPS, 12, &pmic4_ftsmps426, "vdd-s12"),
+	RPMH_VREG("smps13", SMPS, 13, &pmic4_ftsmps426, "vdd-s13"),
+	RPMH_VREG("ldo1",   LDO,  1,  &pmic4_nldo,      "vdd-l1-l27"),
+	RPMH_VREG("ldo2",   LDO,  2,  &pmic4_nldo,      "vdd-l2-l8-l17"),
+	RPMH_VREG("ldo3",   LDO,  3,  &pmic4_nldo,      "vdd-l3-l11"),
+	RPMH_VREG("ldo4",   LDO,  4,  &pmic4_nldo,      "vdd-l4-l5"),
+	RPMH_VREG("ldo5",   LDO,  5,  &pmic4_nldo,      "vdd-l4-l5"),
+	RPMH_VREG("ldo6",   LDO,  6,  &pmic4_pldo,      "vdd-l6"),
+	RPMH_VREG("ldo7",   LDO,  7,  &pmic4_pldo_lv,   "vdd-l7-l12-l14-l15"),
+	RPMH_VREG("ldo8",   LDO,  8,  &pmic4_nldo,      "vdd-l2-l8-l17"),
+	RPMH_VREG("ldo9",   LDO,  9,  &pmic4_pldo,      "vdd-l9"),
+	RPMH_VREG("ldo10",  LDO,  10, &pmic4_pldo,      "vdd-l10-l23-l25"),
+	RPMH_VREG("ldo11",  LDO,  11, &pmic4_nldo,      "vdd-l3-l11"),
+	RPMH_VREG("ldo12",  LDO,  12, &pmic4_pldo_lv,   "vdd-l7-l12-l14-l15"),
+	RPMH_VREG("ldo13",  LDO,  13, &pmic4_pldo,      "vdd-l13-l19-l21"),
+	RPMH_VREG("ldo14",  LDO,  14, &pmic4_pldo_lv,   "vdd-l7-l12-l14-l15"),
+	RPMH_VREG("ldo15",  LDO,  15, &pmic4_pldo_lv,   "vdd-l7-l12-l14-l15"),
+	RPMH_VREG("ldo16",  LDO,  16, &pmic4_pldo,      "vdd-l16-l28"),
+	RPMH_VREG("ldo17",  LDO,  17, &pmic4_nldo,      "vdd-l2-l8-l17"),
+	RPMH_VREG("ldo18",  LDO,  18, &pmic4_pldo,      "vdd-l18-l22"),
+	RPMH_VREG("ldo19",  LDO,  19, &pmic4_pldo,      "vdd-l13-l19-l21"),
+	RPMH_VREG("ldo20",  LDO,  20, &pmic4_pldo,      "vdd-l20-l24"),
+	RPMH_VREG("ldo21",  LDO,  21, &pmic4_pldo,      "vdd-l13-l19-l21"),
+	RPMH_VREG("ldo22",  LDO,  22, &pmic4_pldo,      "vdd-l18-l22"),
+	RPMH_VREG("ldo23",  LDO,  23, &pmic4_pldo,      "vdd-l10-l23-l25"),
+	RPMH_VREG("ldo24",  LDO,  24, &pmic4_pldo,      "vdd-l20-l24"),
+	RPMH_VREG("ldo25",  LDO,  25, &pmic4_pldo,      "vdd-l10-l23-l25"),
+	RPMH_VREG("ldo26",  LDO,  26, &pmic4_nldo,      "vdd-l26"),
+	RPMH_VREG("ldo27",  LDO,  27, &pmic4_nldo,      "vdd-l1-l27"),
+	RPMH_VREG("ldo28",  LDO,  28, &pmic4_pldo,      "vdd-l16-l28"),
+	RPMH_VREG("lvs1",   VS,   1,  &pmic4_lvs,       "vin-lvs-1-2"),
+	RPMH_VREG("lvs2",   VS,   2,  &pmic4_lvs,       "vin-lvs-1-2"),
 	{}
 };
 
 static const struct rpmh_vreg_init_data pmg1110_vreg_data[] = {
-	RPMH_VREG("smps1",  "smp%s1",  &pmic5_ftsmps510,  "vdd-s1"),
+	RPMH_VREG("smps1",  SMPS, 1, &pmic5_ftsmps510,  "vdd-s1"),
 	{}
 };
 
 static const struct rpmh_vreg_init_data pmi8998_vreg_data[] = {
-	RPMH_VREG("bob",    "bob%s1",  &pmic4_bob,       "vdd-bob"),
+	RPMH_VREG("bob",    BOB,  1, &pmic4_bob,       "vdd-bob"),
 	{}
 };
 
 static const struct rpmh_vreg_init_data pm8005_vreg_data[] = {
-	RPMH_VREG("smps1",  "smp%s1",  &pmic4_ftsmps426, "vdd-s1"),
-	RPMH_VREG("smps2",  "smp%s2",  &pmic4_ftsmps426, "vdd-s2"),
-	RPMH_VREG("smps3",  "smp%s3",  &pmic4_ftsmps426, "vdd-s3"),
-	RPMH_VREG("smps4",  "smp%s4",  &pmic4_ftsmps426, "vdd-s4"),
+	RPMH_VREG("smps1",  SMPS, 1, &pmic4_ftsmps426, "vdd-s1"),
+	RPMH_VREG("smps2",  SMPS, 2, &pmic4_ftsmps426, "vdd-s2"),
+	RPMH_VREG("smps3",  SMPS, 3, &pmic4_ftsmps426, "vdd-s3"),
+	RPMH_VREG("smps4",  SMPS, 4, &pmic4_ftsmps426, "vdd-s4"),
 	{}
 };
 
 static const struct rpmh_vreg_init_data pm8150_vreg_data[] = {
-	RPMH_VREG("smps1",  "smp%s1",  &pmic5_ftsmps510, "vdd-s1"),
-	RPMH_VREG("smps2",  "smp%s2",  &pmic5_ftsmps510, "vdd-s2"),
-	RPMH_VREG("smps3",  "smp%s3",  &pmic5_ftsmps510, "vdd-s3"),
-	RPMH_VREG("smps4",  "smp%s4",  &pmic5_hfsmps510,   "vdd-s4"),
-	RPMH_VREG("smps5",  "smp%s5",  &pmic5_hfsmps510,   "vdd-s5"),
-	RPMH_VREG("smps6",  "smp%s6",  &pmic5_ftsmps510, "vdd-s6"),
-	RPMH_VREG("smps7",  "smp%s7",  &pmic5_ftsmps510, "vdd-s7"),
-	RPMH_VREG("smps8",  "smp%s8",  &pmic5_ftsmps510, "vdd-s8"),
-	RPMH_VREG("smps9",  "smp%s9",  &pmic5_ftsmps510, "vdd-s9"),
-	RPMH_VREG("smps10", "smp%s10", &pmic5_ftsmps510, "vdd-s10"),
-	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_nldo,      "vdd-l1-l8-l11"),
-	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_pldo,      "vdd-l2-l10"),
-	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_nldo,      "vdd-l3-l4-l5-l18"),
-	RPMH_VREG("ldo4",   "ldo%s4",  &pmic5_nldo,      "vdd-l3-l4-l5-l18"),
-	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_nldo,      "vdd-l3-l4-l5-l18"),
-	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_nldo,      "vdd-l6-l9"),
-	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo,      "vdd-l7-l12-l14-l15"),
-	RPMH_VREG("ldo8",   "ldo%s8",  &pmic5_nldo,      "vdd-l1-l8-l11"),
-	RPMH_VREG("ldo9",   "ldo%s9",  &pmic5_nldo,      "vdd-l6-l9"),
-	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_pldo,      "vdd-l2-l10"),
-	RPMH_VREG("ldo11",  "ldo%s11", &pmic5_nldo,      "vdd-l1-l8-l11"),
-	RPMH_VREG("ldo12",  "ldo%s12", &pmic5_pldo_lv,   "vdd-l7-l12-l14-l15"),
-	RPMH_VREG("ldo13",  "ldo%s13", &pmic5_pldo,      "vdd-l13-l16-l17"),
-	RPMH_VREG("ldo14",  "ldo%s14", &pmic5_pldo_lv,   "vdd-l7-l12-l14-l15"),
-	RPMH_VREG("ldo15",  "ldo%s15", &pmic5_pldo_lv,   "vdd-l7-l12-l14-l15"),
-	RPMH_VREG("ldo16",  "ldo%s16", &pmic5_pldo,      "vdd-l13-l16-l17"),
-	RPMH_VREG("ldo17",  "ldo%s17", &pmic5_pldo,      "vdd-l13-l16-l17"),
-	RPMH_VREG("ldo18",  "ldo%s18", &pmic5_nldo,      "vdd-l3-l4-l5-l18"),
+	RPMH_VREG("smps1",  SMPS, 1,  &pmic5_ftsmps510, "vdd-s1"),
+	RPMH_VREG("smps2",  SMPS, 2,  &pmic5_ftsmps510, "vdd-s2"),
+	RPMH_VREG("smps3",  SMPS, 3,  &pmic5_ftsmps510, "vdd-s3"),
+	RPMH_VREG("smps4",  SMPS, 4,  &pmic5_hfsmps510, "vdd-s4"),
+	RPMH_VREG("smps5",  SMPS, 5,  &pmic5_hfsmps510, "vdd-s5"),
+	RPMH_VREG("smps6",  SMPS, 6,  &pmic5_ftsmps510, "vdd-s6"),
+	RPMH_VREG("smps7",  SMPS, 7,  &pmic5_ftsmps510, "vdd-s7"),
+	RPMH_VREG("smps8",  SMPS, 8,  &pmic5_ftsmps510, "vdd-s8"),
+	RPMH_VREG("smps9",  SMPS, 9,  &pmic5_ftsmps510, "vdd-s9"),
+	RPMH_VREG("smps10", SMPS, 10, &pmic5_ftsmps510, "vdd-s10"),
+	RPMH_VREG("ldo1",   LDO,  1,  &pmic5_nldo,      "vdd-l1-l8-l11"),
+	RPMH_VREG("ldo2",   LDO,  2,  &pmic5_pldo,      "vdd-l2-l10"),
+	RPMH_VREG("ldo3",   LDO,  3,  &pmic5_nldo,      "vdd-l3-l4-l5-l18"),
+	RPMH_VREG("ldo4",   LDO,  4,  &pmic5_nldo,      "vdd-l3-l4-l5-l18"),
+	RPMH_VREG("ldo5",   LDO,  5,  &pmic5_nldo,      "vdd-l3-l4-l5-l18"),
+	RPMH_VREG("ldo6",   LDO,  6,  &pmic5_nldo,      "vdd-l6-l9"),
+	RPMH_VREG("ldo7",   LDO,  7,  &pmic5_pldo,      "vdd-l7-l12-l14-l15"),
+	RPMH_VREG("ldo8",   LDO,  8,  &pmic5_nldo,      "vdd-l1-l8-l11"),
+	RPMH_VREG("ldo9",   LDO,  9,  &pmic5_nldo,      "vdd-l6-l9"),
+	RPMH_VREG("ldo10",  LDO,  10, &pmic5_pldo,      "vdd-l2-l10"),
+	RPMH_VREG("ldo11",  LDO,  11, &pmic5_nldo,      "vdd-l1-l8-l11"),
+	RPMH_VREG("ldo12",  LDO,  12, &pmic5_pldo_lv,   "vdd-l7-l12-l14-l15"),
+	RPMH_VREG("ldo13",  LDO,  13, &pmic5_pldo,      "vdd-l13-l16-l17"),
+	RPMH_VREG("ldo14",  LDO,  14, &pmic5_pldo_lv,   "vdd-l7-l12-l14-l15"),
+	RPMH_VREG("ldo15",  LDO,  15, &pmic5_pldo_lv,   "vdd-l7-l12-l14-l15"),
+	RPMH_VREG("ldo16",  LDO,  16, &pmic5_pldo,      "vdd-l13-l16-l17"),
+	RPMH_VREG("ldo17",  LDO,  17, &pmic5_pldo,      "vdd-l13-l16-l17"),
+	RPMH_VREG("ldo18",  LDO,  18, &pmic5_nldo,      "vdd-l3-l4-l5-l18"),
 	{}
 };
 
 static const struct rpmh_vreg_init_data pm8150l_vreg_data[] = {
-	RPMH_VREG("smps1",  "smp%s1",  &pmic5_ftsmps510, "vdd-s1"),
-	RPMH_VREG("smps2",  "smp%s2",  &pmic5_ftsmps510, "vdd-s2"),
-	RPMH_VREG("smps3",  "smp%s3",  &pmic5_ftsmps510, "vdd-s3"),
-	RPMH_VREG("smps4",  "smp%s4",  &pmic5_ftsmps510, "vdd-s4"),
-	RPMH_VREG("smps5",  "smp%s5",  &pmic5_ftsmps510, "vdd-s5"),
-	RPMH_VREG("smps6",  "smp%s6",  &pmic5_ftsmps510, "vdd-s6"),
-	RPMH_VREG("smps7",  "smp%s7",  &pmic5_ftsmps510, "vdd-s7"),
-	RPMH_VREG("smps8",  "smp%s8",  &pmic5_hfsmps510, "vdd-s8"),
-	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_pldo_lv,   "vdd-l1-l8"),
-	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_nldo,      "vdd-l2-l3"),
-	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_nldo,      "vdd-l2-l3"),
-	RPMH_VREG("ldo4",   "ldo%s4",  &pmic5_pldo,      "vdd-l4-l5-l6"),
-	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_pldo,      "vdd-l4-l5-l6"),
-	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_pldo,      "vdd-l4-l5-l6"),
-	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo,      "vdd-l7-l11"),
-	RPMH_VREG("ldo8",   "ldo%s8",  &pmic5_pldo_lv,   "vdd-l1-l8"),
-	RPMH_VREG("ldo9",   "ldo%s9",  &pmic5_pldo,      "vdd-l9-l10"),
-	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_pldo,      "vdd-l9-l10"),
-	RPMH_VREG("ldo11",  "ldo%s11", &pmic5_pldo,      "vdd-l7-l11"),
-	RPMH_VREG("bob",    "bob%s1",  &pmic5_bob,       "vdd-bob"),
+	RPMH_VREG("smps1",  SMPS, 1, &pmic5_ftsmps510, "vdd-s1"),
+	RPMH_VREG("smps2",  SMPS, 2, &pmic5_ftsmps510, "vdd-s2"),
+	RPMH_VREG("smps3",  SMPS, 3, &pmic5_ftsmps510, "vdd-s3"),
+	RPMH_VREG("smps4",  SMPS, 4, &pmic5_ftsmps510, "vdd-s4"),
+	RPMH_VREG("smps5",  SMPS, 5, &pmic5_ftsmps510, "vdd-s5"),
+	RPMH_VREG("smps6",  SMPS, 6, &pmic5_ftsmps510, "vdd-s6"),
+	RPMH_VREG("smps7",  SMPS, 7, &pmic5_ftsmps510, "vdd-s7"),
+	RPMH_VREG("smps8",  SMPS, 8, &pmic5_hfsmps510, "vdd-s8"),
+	RPMH_VREG("ldo1",   LDO,  1, &pmic5_pldo_lv,   "vdd-l1-l8"),
+	RPMH_VREG("ldo2",   LDO,  2, &pmic5_nldo,      "vdd-l2-l3"),
+	RPMH_VREG("ldo3",   LDO,  3, &pmic5_nldo,      "vdd-l2-l3"),
+	RPMH_VREG("ldo4",   LDO,  4, &pmic5_pldo,      "vdd-l4-l5-l6"),
+	RPMH_VREG("ldo5",   LDO,  5, &pmic5_pldo,      "vdd-l4-l5-l6"),
+	RPMH_VREG("ldo6",   LDO,  6, &pmic5_pldo,      "vdd-l4-l5-l6"),
+	RPMH_VREG("ldo7",   LDO,  7, &pmic5_pldo,      "vdd-l7-l11"),
+	RPMH_VREG("ldo8",   LDO,  8, &pmic5_pldo_lv,   "vdd-l1-l8"),
+	RPMH_VREG("ldo9",   LDO,  9, &pmic5_pldo,      "vdd-l9-l10"),
+	RPMH_VREG("ldo10",  LDO,  10, &pmic5_pldo,      "vdd-l9-l10"),
+	RPMH_VREG("ldo11",  LDO,  11, &pmic5_pldo,      "vdd-l7-l11"),
+	RPMH_VREG("bob",    BOB,  1, &pmic5_bob,       "vdd-bob"),
 	{}
 };
 
 static const struct rpmh_vreg_init_data pmm8155au_vreg_data[] = {
-	RPMH_VREG("smps1",  "smp%s1",  &pmic5_ftsmps510, "vdd-s1"),
-	RPMH_VREG("smps2",  "smp%s2",  &pmic5_ftsmps510, "vdd-s2"),
-	RPMH_VREG("smps3",  "smp%s3",  &pmic5_ftsmps510, "vdd-s3"),
-	RPMH_VREG("smps4",  "smp%s4",  &pmic5_hfsmps510, "vdd-s4"),
-	RPMH_VREG("smps5",  "smp%s5",  &pmic5_hfsmps510, "vdd-s5"),
-	RPMH_VREG("smps6",  "smp%s6",  &pmic5_ftsmps510, "vdd-s6"),
-	RPMH_VREG("smps7",  "smp%s7",  &pmic5_ftsmps510, "vdd-s7"),
-	RPMH_VREG("smps8",  "smp%s8",  &pmic5_ftsmps510, "vdd-s8"),
-	RPMH_VREG("smps9",  "smp%s9",  &pmic5_ftsmps510, "vdd-s9"),
-	RPMH_VREG("smps10", "smp%s10", &pmic5_ftsmps510, "vdd-s10"),
-	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_nldo,      "vdd-l1-l8-l11"),
-	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_pldo,      "vdd-l2-l10"),
-	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_nldo,      "vdd-l3-l4-l5-l18"),
-	RPMH_VREG("ldo4",   "ldo%s4",  &pmic5_nldo,      "vdd-l3-l4-l5-l18"),
-	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_nldo,      "vdd-l3-l4-l5-l18"),
-	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_nldo,      "vdd-l6-l9"),
-	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo_lv,   "vdd-l7-l12-l14-l15"),
-	RPMH_VREG("ldo8",   "ldo%s8",  &pmic5_nldo,      "vdd-l1-l8-l11"),
-	RPMH_VREG("ldo9",   "ldo%s9",  &pmic5_nldo,      "vdd-l6-l9"),
-	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_pldo,      "vdd-l2-l10"),
-	RPMH_VREG("ldo11",  "ldo%s11", &pmic5_nldo,      "vdd-l1-l8-l11"),
-	RPMH_VREG("ldo12",  "ldo%s12", &pmic5_pldo_lv,   "vdd-l7-l12-l14-l15"),
-	RPMH_VREG("ldo13",  "ldo%s13", &pmic5_pldo,      "vdd-l13-l16-l17"),
-	RPMH_VREG("ldo14",  "ldo%s14", &pmic5_pldo_lv,   "vdd-l7-l12-l14-l15"),
-	RPMH_VREG("ldo15",  "ldo%s15", &pmic5_pldo_lv,   "vdd-l7-l12-l14-l15"),
-	RPMH_VREG("ldo16",  "ldo%s16", &pmic5_pldo,      "vdd-l13-l16-l17"),
-	RPMH_VREG("ldo17",  "ldo%s17", &pmic5_pldo,      "vdd-l13-l16-l17"),
-	RPMH_VREG("ldo18",  "ldo%s18", &pmic5_nldo,      "vdd-l3-l4-l5-l18"),
+	RPMH_VREG("smps1",  SMPS, 1,  &pmic5_ftsmps510, "vdd-s1"),
+	RPMH_VREG("smps2",  SMPS, 2,  &pmic5_ftsmps510, "vdd-s2"),
+	RPMH_VREG("smps3",  SMPS, 3,  &pmic5_ftsmps510, "vdd-s3"),
+	RPMH_VREG("smps4",  SMPS, 4,  &pmic5_hfsmps510, "vdd-s4"),
+	RPMH_VREG("smps5",  SMPS, 5,  &pmic5_hfsmps510, "vdd-s5"),
+	RPMH_VREG("smps6",  SMPS, 6,  &pmic5_ftsmps510, "vdd-s6"),
+	RPMH_VREG("smps7",  SMPS, 7,  &pmic5_ftsmps510, "vdd-s7"),
+	RPMH_VREG("smps8",  SMPS, 8,  &pmic5_ftsmps510, "vdd-s8"),
+	RPMH_VREG("smps9",  SMPS, 9,  &pmic5_ftsmps510, "vdd-s9"),
+	RPMH_VREG("smps10", SMPS, 10, &pmic5_ftsmps510, "vdd-s10"),
+	RPMH_VREG("ldo1",   LDO,  1,  &pmic5_nldo,      "vdd-l1-l8-l11"),
+	RPMH_VREG("ldo2",   LDO,  2,  &pmic5_pldo,      "vdd-l2-l10"),
+	RPMH_VREG("ldo3",   LDO,  3,  &pmic5_nldo,      "vdd-l3-l4-l5-l18"),
+	RPMH_VREG("ldo4",   LDO,  4,  &pmic5_nldo,      "vdd-l3-l4-l5-l18"),
+	RPMH_VREG("ldo5",   LDO,  5,  &pmic5_nldo,      "vdd-l3-l4-l5-l18"),
+	RPMH_VREG("ldo6",   LDO,  6,  &pmic5_nldo,      "vdd-l6-l9"),
+	RPMH_VREG("ldo7",   LDO,  7,  &pmic5_pldo_lv,   "vdd-l7-l12-l14-l15"),
+	RPMH_VREG("ldo8",   LDO,  8,  &pmic5_nldo,      "vdd-l1-l8-l11"),
+	RPMH_VREG("ldo9",   LDO,  9,  &pmic5_nldo,      "vdd-l6-l9"),
+	RPMH_VREG("ldo10",  LDO,  10, &pmic5_pldo,      "vdd-l2-l10"),
+	RPMH_VREG("ldo11",  LDO,  11, &pmic5_nldo,      "vdd-l1-l8-l11"),
+	RPMH_VREG("ldo12",  LDO,  12, &pmic5_pldo_lv,   "vdd-l7-l12-l14-l15"),
+	RPMH_VREG("ldo13",  LDO,  13, &pmic5_pldo,      "vdd-l13-l16-l17"),
+	RPMH_VREG("ldo14",  LDO,  14, &pmic5_pldo_lv,   "vdd-l7-l12-l14-l15"),
+	RPMH_VREG("ldo15",  LDO,  15, &pmic5_pldo_lv,   "vdd-l7-l12-l14-l15"),
+	RPMH_VREG("ldo16",  LDO,  16, &pmic5_pldo,      "vdd-l13-l16-l17"),
+	RPMH_VREG("ldo17",  LDO,  17, &pmic5_pldo,      "vdd-l13-l16-l17"),
+	RPMH_VREG("ldo18",  LDO,  18, &pmic5_nldo,      "vdd-l3-l4-l5-l18"),
 	{}
 };
 
 static const struct rpmh_vreg_init_data pmm8654au_vreg_data[] = {
-	RPMH_VREG("smps1",  "smp%s1",  &pmic5_ftsmps527,  "vdd-s1"),
-	RPMH_VREG("smps2",  "smp%s2",  &pmic5_ftsmps527,  "vdd-s2"),
-	RPMH_VREG("smps3",  "smp%s3",  &pmic5_ftsmps527,  "vdd-s3"),
-	RPMH_VREG("smps4",  "smp%s4",  &pmic5_ftsmps527,  "vdd-s4"),
-	RPMH_VREG("smps5",  "smp%s5",  &pmic5_ftsmps527,  "vdd-s5"),
-	RPMH_VREG("smps6",  "smp%s6",  &pmic5_ftsmps527,  "vdd-s6"),
-	RPMH_VREG("smps7",  "smp%s7",  &pmic5_ftsmps527,  "vdd-s7"),
-	RPMH_VREG("smps8",  "smp%s8",  &pmic5_ftsmps527,  "vdd-s8"),
-	RPMH_VREG("smps9",  "smp%s9",  &pmic5_ftsmps527,  "vdd-s9"),
-	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_nldo515,    "vdd-s9"),
-	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_nldo515,    "vdd-l2-l3"),
-	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_nldo515,    "vdd-l2-l3"),
-	RPMH_VREG("ldo4",   "ldo%s4",  &pmic5_nldo515,    "vdd-s9"),
-	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_nldo515,    "vdd-s9"),
-	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_nldo515,    "vdd-l6-l7"),
-	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_nldo515,    "vdd-l6-l7"),
-	RPMH_VREG("ldo8",   "ldo%s8",  &pmic5_pldo515_mv, "vdd-l8-l9"),
-	RPMH_VREG("ldo9",   "ldo%s9",  &pmic5_pldo,       "vdd-l8-l9"),
+	RPMH_VREG("smps1",  SMPS, 1,  &pmic5_ftsmps527,  "vdd-s1"),
+	RPMH_VREG("smps2",  SMPS, 2,  &pmic5_ftsmps527,  "vdd-s2"),
+	RPMH_VREG("smps3",  SMPS, 3,  &pmic5_ftsmps527,  "vdd-s3"),
+	RPMH_VREG("smps4",  SMPS, 4,  &pmic5_ftsmps527,  "vdd-s4"),
+	RPMH_VREG("smps5",  SMPS, 5,  &pmic5_ftsmps527,  "vdd-s5"),
+	RPMH_VREG("smps6",  SMPS, 6,  &pmic5_ftsmps527,  "vdd-s6"),
+	RPMH_VREG("smps7",  SMPS, 7,  &pmic5_ftsmps527,  "vdd-s7"),
+	RPMH_VREG("smps8",  SMPS, 8,  &pmic5_ftsmps527,  "vdd-s8"),
+	RPMH_VREG("smps9",  SMPS, 9,  &pmic5_ftsmps527,  "vdd-s9"),
+	RPMH_VREG("ldo1",   LDO,  1,  &pmic5_nldo515,    "vdd-s9"),
+	RPMH_VREG("ldo2",   LDO,  2,  &pmic5_nldo515,    "vdd-l2-l3"),
+	RPMH_VREG("ldo3",   LDO,  3,  &pmic5_nldo515,    "vdd-l2-l3"),
+	RPMH_VREG("ldo4",   LDO,  4,  &pmic5_nldo515,    "vdd-s9"),
+	RPMH_VREG("ldo5",   LDO,  5,  &pmic5_nldo515,    "vdd-s9"),
+	RPMH_VREG("ldo6",   LDO,  6,  &pmic5_nldo515,    "vdd-l6-l7"),
+	RPMH_VREG("ldo7",   LDO,  7,  &pmic5_nldo515,    "vdd-l6-l7"),
+	RPMH_VREG("ldo8",   LDO,  8,  &pmic5_pldo515_mv, "vdd-l8-l9"),
+	RPMH_VREG("ldo9",   LDO,  9,  &pmic5_pldo,       "vdd-l8-l9"),
 	{}
 };
 
 static const struct rpmh_vreg_init_data pm8350_vreg_data[] = {
-	RPMH_VREG("smps1",  "smp%s1",  &pmic5_ftsmps510, "vdd-s1"),
-	RPMH_VREG("smps2",  "smp%s2",  &pmic5_ftsmps510, "vdd-s2"),
-	RPMH_VREG("smps3",  "smp%s3",  &pmic5_ftsmps510, "vdd-s3"),
-	RPMH_VREG("smps4",  "smp%s4",  &pmic5_ftsmps510, "vdd-s4"),
-	RPMH_VREG("smps5",  "smp%s5",  &pmic5_ftsmps510, "vdd-s5"),
-	RPMH_VREG("smps6",  "smp%s6",  &pmic5_ftsmps510, "vdd-s6"),
-	RPMH_VREG("smps7",  "smp%s7",  &pmic5_ftsmps510, "vdd-s7"),
-	RPMH_VREG("smps8",  "smp%s8",  &pmic5_ftsmps510, "vdd-s8"),
-	RPMH_VREG("smps9",  "smp%s9",  &pmic5_ftsmps510, "vdd-s9"),
-	RPMH_VREG("smps10", "smp%s10", &pmic5_hfsmps510, "vdd-s10"),
-	RPMH_VREG("smps11", "smp%s11", &pmic5_hfsmps510, "vdd-s11"),
-	RPMH_VREG("smps12", "smp%s12", &pmic5_hfsmps510, "vdd-s12"),
-	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_nldo,      "vdd-l1-l4"),
-	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_pldo,      "vdd-l2-l7"),
-	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_nldo,      "vdd-l3-l5"),
-	RPMH_VREG("ldo4",   "ldo%s4",  &pmic5_nldo,      "vdd-l1-l4"),
-	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_nldo,      "vdd-l3-l5"),
-	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_nldo,      "vdd-l6-l9-l10"),
-	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo,      "vdd-l2-l7"),
-	RPMH_VREG("ldo8",   "ldo%s8",  &pmic5_nldo,      "vdd-l8"),
-	RPMH_VREG("ldo9",   "ldo%s9",  &pmic5_nldo,      "vdd-l6-l9-l10"),
-	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_nldo,      "vdd-l6-l9-l10"),
+	RPMH_VREG("smps1",  SMPS, 1,  &pmic5_ftsmps510, "vdd-s1"),
+	RPMH_VREG("smps2",  SMPS, 2,  &pmic5_ftsmps510, "vdd-s2"),
+	RPMH_VREG("smps3",  SMPS, 3,  &pmic5_ftsmps510, "vdd-s3"),
+	RPMH_VREG("smps4",  SMPS, 4,  &pmic5_ftsmps510, "vdd-s4"),
+	RPMH_VREG("smps5",  SMPS, 5,  &pmic5_ftsmps510, "vdd-s5"),
+	RPMH_VREG("smps6",  SMPS, 6,  &pmic5_ftsmps510, "vdd-s6"),
+	RPMH_VREG("smps7",  SMPS, 7,  &pmic5_ftsmps510, "vdd-s7"),
+	RPMH_VREG("smps8",  SMPS, 8,  &pmic5_ftsmps510, "vdd-s8"),
+	RPMH_VREG("smps9",  SMPS, 9,  &pmic5_ftsmps510, "vdd-s9"),
+	RPMH_VREG("smps10", SMPS, 10, &pmic5_hfsmps510, "vdd-s10"),
+	RPMH_VREG("smps11", SMPS, 11, &pmic5_hfsmps510, "vdd-s11"),
+	RPMH_VREG("smps12", SMPS, 12, &pmic5_hfsmps510, "vdd-s12"),
+	RPMH_VREG("ldo1",   LDO,  1,  &pmic5_nldo,      "vdd-l1-l4"),
+	RPMH_VREG("ldo2",   LDO,  2,  &pmic5_pldo,      "vdd-l2-l7"),
+	RPMH_VREG("ldo3",   LDO,  3,  &pmic5_nldo,      "vdd-l3-l5"),
+	RPMH_VREG("ldo4",   LDO,  4,  &pmic5_nldo,      "vdd-l1-l4"),
+	RPMH_VREG("ldo5",   LDO,  5,  &pmic5_nldo,      "vdd-l3-l5"),
+	RPMH_VREG("ldo6",   LDO,  6,  &pmic5_nldo,      "vdd-l6-l9-l10"),
+	RPMH_VREG("ldo7",   LDO,  7,  &pmic5_pldo,      "vdd-l2-l7"),
+	RPMH_VREG("ldo8",   LDO,  8,  &pmic5_nldo,      "vdd-l8"),
+	RPMH_VREG("ldo9",   LDO,  9,  &pmic5_nldo,      "vdd-l6-l9-l10"),
+	RPMH_VREG("ldo10",  LDO,  10, &pmic5_nldo,      "vdd-l6-l9-l10"),
 	{}
 };
 
 static const struct rpmh_vreg_init_data pm8350c_vreg_data[] = {
-	RPMH_VREG("smps1",  "smp%s1",  &pmic5_hfsmps515, "vdd-s1"),
-	RPMH_VREG("smps2",  "smp%s2",  &pmic5_ftsmps510, "vdd-s2"),
-	RPMH_VREG("smps3",  "smp%s3",  &pmic5_ftsmps510, "vdd-s3"),
-	RPMH_VREG("smps4",  "smp%s4",  &pmic5_ftsmps510, "vdd-s4"),
-	RPMH_VREG("smps5",  "smp%s5",  &pmic5_ftsmps510, "vdd-s5"),
-	RPMH_VREG("smps6",  "smp%s6",  &pmic5_ftsmps510, "vdd-s6"),
-	RPMH_VREG("smps7",  "smp%s7",  &pmic5_ftsmps510, "vdd-s7"),
-	RPMH_VREG("smps8",  "smp%s8",  &pmic5_ftsmps510, "vdd-s8"),
-	RPMH_VREG("smps9",  "smp%s9",  &pmic5_ftsmps510, "vdd-s9"),
-	RPMH_VREG("smps10", "smp%s10", &pmic5_ftsmps510, "vdd-s10"),
-	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_pldo_lv,   "vdd-l1-l12"),
-	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_pldo_lv,   "vdd-l2-l8"),
-	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_pldo,      "vdd-l3-l4-l5-l7-l13"),
-	RPMH_VREG("ldo4",   "ldo%s4",  &pmic5_pldo,      "vdd-l3-l4-l5-l7-l13"),
-	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_pldo,      "vdd-l3-l4-l5-l7-l13"),
-	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_pldo,      "vdd-l6-l9-l11"),
-	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo,      "vdd-l3-l4-l5-l7-l13"),
-	RPMH_VREG("ldo8",   "ldo%s8",  &pmic5_pldo_lv,   "vdd-l2-l8"),
-	RPMH_VREG("ldo9",   "ldo%s9",  &pmic5_pldo,      "vdd-l6-l9-l11"),
-	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_nldo,      "vdd-l10"),
-	RPMH_VREG("ldo11",  "ldo%s11", &pmic5_pldo,      "vdd-l6-l9-l11"),
-	RPMH_VREG("ldo12",  "ldo%s12", &pmic5_pldo_lv,   "vdd-l1-l12"),
-	RPMH_VREG("ldo13",  "ldo%s13", &pmic5_pldo,      "vdd-l3-l4-l5-l7-l13"),
-	RPMH_VREG("bob",    "bob%s1",  &pmic5_bob,       "vdd-bob"),
+	RPMH_VREG("smps1",  SMPS, 1,  &pmic5_hfsmps515, "vdd-s1"),
+	RPMH_VREG("smps2",  SMPS, 2,  &pmic5_ftsmps510, "vdd-s2"),
+	RPMH_VREG("smps3",  SMPS, 3,  &pmic5_ftsmps510, "vdd-s3"),
+	RPMH_VREG("smps4",  SMPS, 4,  &pmic5_ftsmps510, "vdd-s4"),
+	RPMH_VREG("smps5",  SMPS, 5,  &pmic5_ftsmps510, "vdd-s5"),
+	RPMH_VREG("smps6",  SMPS, 6,  &pmic5_ftsmps510, "vdd-s6"),
+	RPMH_VREG("smps7",  SMPS, 7,  &pmic5_ftsmps510, "vdd-s7"),
+	RPMH_VREG("smps8",  SMPS, 8,  &pmic5_ftsmps510, "vdd-s8"),
+	RPMH_VREG("smps9",  SMPS, 9,  &pmic5_ftsmps510, "vdd-s9"),
+	RPMH_VREG("smps10", SMPS, 10, &pmic5_ftsmps510, "vdd-s10"),
+	RPMH_VREG("ldo1",   LDO,  1,  &pmic5_pldo_lv,   "vdd-l1-l12"),
+	RPMH_VREG("ldo2",   LDO,  2,  &pmic5_pldo_lv,   "vdd-l2-l8"),
+	RPMH_VREG("ldo3",   LDO,  3,  &pmic5_pldo,      "vdd-l3-l4-l5-l7-l13"),
+	RPMH_VREG("ldo4",   LDO,  4,  &pmic5_pldo,      "vdd-l3-l4-l5-l7-l13"),
+	RPMH_VREG("ldo5",   LDO,  5,  &pmic5_pldo,      "vdd-l3-l4-l5-l7-l13"),
+	RPMH_VREG("ldo6",   LDO,  6,  &pmic5_pldo,      "vdd-l6-l9-l11"),
+	RPMH_VREG("ldo7",   LDO,  7,  &pmic5_pldo,      "vdd-l3-l4-l5-l7-l13"),
+	RPMH_VREG("ldo8",   LDO,  8,  &pmic5_pldo_lv,   "vdd-l2-l8"),
+	RPMH_VREG("ldo9",   LDO,  9,  &pmic5_pldo,      "vdd-l6-l9-l11"),
+	RPMH_VREG("ldo10",  LDO,  10, &pmic5_nldo,      "vdd-l10"),
+	RPMH_VREG("ldo11",  LDO,  11, &pmic5_pldo,      "vdd-l6-l9-l11"),
+	RPMH_VREG("ldo12",  LDO,  12, &pmic5_pldo_lv,   "vdd-l1-l12"),
+	RPMH_VREG("ldo13",  LDO,  13, &pmic5_pldo,      "vdd-l3-l4-l5-l7-l13"),
+	RPMH_VREG("bob",    BOB,  1,  &pmic5_bob,       "vdd-bob"),
 	{}
 };
 
 static const struct rpmh_vreg_init_data pm8450_vreg_data[] = {
-	RPMH_VREG("smps1",  "smp%s1",  &pmic5_ftsmps520, "vdd-s1"),
-	RPMH_VREG("smps2",  "smp%s2",  &pmic5_ftsmps520, "vdd-s2"),
-	RPMH_VREG("smps3",  "smp%s3",  &pmic5_ftsmps520, "vdd-s3"),
-	RPMH_VREG("smps4",  "smp%s4",  &pmic5_ftsmps520, "vdd-s4"),
-	RPMH_VREG("smps5",  "smp%s5",  &pmic5_ftsmps520, "vdd-s5"),
-	RPMH_VREG("smps6",  "smp%s6",  &pmic5_ftsmps520, "vdd-s6"),
-	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_nldo,      "vdd-l1"),
-	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_nldo,      "vdd-l2"),
-	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_nldo,      "vdd-l3"),
-	RPMH_VREG("ldo4",   "ldo%s4",  &pmic5_pldo_lv,   "vdd-l4"),
+	RPMH_VREG("smps1",  SMPS, 1, &pmic5_ftsmps520, "vdd-s1"),
+	RPMH_VREG("smps2",  SMPS, 2, &pmic5_ftsmps520, "vdd-s2"),
+	RPMH_VREG("smps3",  SMPS, 3, &pmic5_ftsmps520, "vdd-s3"),
+	RPMH_VREG("smps4",  SMPS, 4, &pmic5_ftsmps520, "vdd-s4"),
+	RPMH_VREG("smps5",  SMPS, 5, &pmic5_ftsmps520, "vdd-s5"),
+	RPMH_VREG("smps6",  SMPS, 6, &pmic5_ftsmps520, "vdd-s6"),
+	RPMH_VREG("ldo1",   LDO,  1, &pmic5_nldo,      "vdd-l1"),
+	RPMH_VREG("ldo2",   LDO,  2, &pmic5_nldo,      "vdd-l2"),
+	RPMH_VREG("ldo3",   LDO,  3, &pmic5_nldo,      "vdd-l3"),
+	RPMH_VREG("ldo4",   LDO,  4, &pmic5_pldo_lv,   "vdd-l4"),
 	{}
 };
 
 static const struct rpmh_vreg_init_data pm8550_vreg_data[] = {
-	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_nldo515,    "vdd-l1-l4-l10"),
-	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_pldo,    "vdd-l2-l13-l14"),
-	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_nldo515,    "vdd-l3"),
-	RPMH_VREG("ldo4",   "ldo%s4",  &pmic5_nldo515,    "vdd-l1-l4-l10"),
-	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_pldo,    "vdd-l5-l16"),
-	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_pldo, "vdd-l6-l7"),
-	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo, "vdd-l6-l7"),
-	RPMH_VREG("ldo8",   "ldo%s8",  &pmic5_pldo, "vdd-l8-l9"),
-	RPMH_VREG("ldo9",   "ldo%s9",  &pmic5_pldo,    "vdd-l8-l9"),
-	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_nldo515,    "vdd-l1-l4-l10"),
-	RPMH_VREG("ldo11",  "ldo%s11", &pmic5_nldo515,    "vdd-l11"),
-	RPMH_VREG("ldo12",  "ldo%s12", &pmic5_nldo515,    "vdd-l12"),
-	RPMH_VREG("ldo13",  "ldo%s13", &pmic5_pldo,    "vdd-l2-l13-l14"),
-	RPMH_VREG("ldo14",  "ldo%s14", &pmic5_pldo,    "vdd-l2-l13-l14"),
-	RPMH_VREG("ldo15",  "ldo%s15", &pmic5_nldo515,    "vdd-l15"),
-	RPMH_VREG("ldo16",  "ldo%s16", &pmic5_pldo,    "vdd-l5-l16"),
-	RPMH_VREG("ldo17",  "ldo%s17", &pmic5_pldo,    "vdd-l17"),
-	RPMH_VREG("bob1",   "bob%s1",  &pmic5_bob,     "vdd-bob1"),
-	RPMH_VREG("bob2",   "bob%s2",  &pmic5_bob,     "vdd-bob2"),
+	RPMH_VREG("ldo1",   LDO,  1,  &pmic5_nldo515,    "vdd-l1-l4-l10"),
+	RPMH_VREG("ldo2",   LDO,  2,  &pmic5_pldo,       "vdd-l2-l13-l14"),
+	RPMH_VREG("ldo3",   LDO,  3,  &pmic5_nldo515,    "vdd-l3"),
+	RPMH_VREG("ldo4",   LDO,  4,  &pmic5_nldo515,    "vdd-l1-l4-l10"),
+	RPMH_VREG("ldo5",   LDO,  5,  &pmic5_pldo,       "vdd-l5-l16"),
+	RPMH_VREG("ldo6",   LDO,  6,  &pmic5_pldo,       "vdd-l6-l7"),
+	RPMH_VREG("ldo7",   LDO,  7,  &pmic5_pldo,       "vdd-l6-l7"),
+	RPMH_VREG("ldo8",   LDO,  8,  &pmic5_pldo,       "vdd-l8-l9"),
+	RPMH_VREG("ldo9",   LDO,  9,  &pmic5_pldo,       "vdd-l8-l9"),
+	RPMH_VREG("ldo10",  LDO,  10, &pmic5_nldo515,    "vdd-l1-l4-l10"),
+	RPMH_VREG("ldo11",  LDO,  11, &pmic5_nldo515,    "vdd-l11"),
+	RPMH_VREG("ldo12",  LDO,  12, &pmic5_nldo515,    "vdd-l12"),
+	RPMH_VREG("ldo13",  LDO,  13, &pmic5_pldo,       "vdd-l2-l13-l14"),
+	RPMH_VREG("ldo14",  LDO,  14, &pmic5_pldo,       "vdd-l2-l13-l14"),
+	RPMH_VREG("ldo15",  LDO,  15, &pmic5_nldo515,    "vdd-l15"),
+	RPMH_VREG("ldo16",  LDO,  16, &pmic5_pldo,       "vdd-l5-l16"),
+	RPMH_VREG("ldo17",  LDO,  17, &pmic5_pldo,       "vdd-l17"),
+	RPMH_VREG("bob1",   BOB,  1,  &pmic5_bob,        "vdd-bob1"),
+	RPMH_VREG("bob2",   BOB,  2,  &pmic5_bob,        "vdd-bob2"),
 	{}
 };
 
 static const struct rpmh_vreg_init_data pm8550vs_vreg_data[] = {
-	RPMH_VREG("smps1",  "smp%s1",  &pmic5_ftsmps525, "vdd-s1"),
-	RPMH_VREG("smps2",  "smp%s2",  &pmic5_ftsmps525, "vdd-s2"),
-	RPMH_VREG("smps3",  "smp%s3",  &pmic5_ftsmps525, "vdd-s3"),
-	RPMH_VREG("smps4",  "smp%s4",  &pmic5_ftsmps525, "vdd-s4"),
-	RPMH_VREG("smps5",  "smp%s5",  &pmic5_ftsmps525, "vdd-s5"),
-	RPMH_VREG("smps6",  "smp%s6",  &pmic5_ftsmps525, "vdd-s6"),
-	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_nldo515,   "vdd-l1"),
-	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_nldo515,   "vdd-l2"),
-	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_nldo515,   "vdd-l3"),
+	RPMH_VREG("smps1",  SMPS, 1, &pmic5_ftsmps525, "vdd-s1"),
+	RPMH_VREG("smps2",  SMPS, 2, &pmic5_ftsmps525, "vdd-s2"),
+	RPMH_VREG("smps3",  SMPS, 3, &pmic5_ftsmps525, "vdd-s3"),
+	RPMH_VREG("smps4",  SMPS, 4, &pmic5_ftsmps525, "vdd-s4"),
+	RPMH_VREG("smps5",  SMPS, 5, &pmic5_ftsmps525, "vdd-s5"),
+	RPMH_VREG("smps6",  SMPS, 6, &pmic5_ftsmps525, "vdd-s6"),
+	RPMH_VREG("ldo1",   LDO,  1, &pmic5_nldo515,   "vdd-l1"),
+	RPMH_VREG("ldo2",   LDO,  2, &pmic5_nldo515,   "vdd-l2"),
+	RPMH_VREG("ldo3",   LDO,  3, &pmic5_nldo515,   "vdd-l3"),
 	{}
 };
 
 static const struct rpmh_vreg_init_data pm8550ve_vreg_data[] = {
-	RPMH_VREG("smps1", "smp%s1", &pmic5_ftsmps525, "vdd-s1"),
-	RPMH_VREG("smps2", "smp%s2", &pmic5_ftsmps525, "vdd-s2"),
-	RPMH_VREG("smps3", "smp%s3", &pmic5_ftsmps525, "vdd-s3"),
-	RPMH_VREG("smps4", "smp%s4", &pmic5_ftsmps525, "vdd-s4"),
-	RPMH_VREG("smps5", "smp%s5", &pmic5_ftsmps525, "vdd-s5"),
-	RPMH_VREG("smps6", "smp%s6", &pmic5_ftsmps525, "vdd-s6"),
-	RPMH_VREG("smps7", "smp%s7", &pmic5_ftsmps525, "vdd-s7"),
-	RPMH_VREG("smps8", "smp%s8", &pmic5_ftsmps525, "vdd-s8"),
-	RPMH_VREG("ldo1",  "ldo%s1", &pmic5_nldo515,   "vdd-l1"),
-	RPMH_VREG("ldo2",  "ldo%s2", &pmic5_nldo515,   "vdd-l2"),
-	RPMH_VREG("ldo3",  "ldo%s3", &pmic5_nldo515,   "vdd-l3"),
+	RPMH_VREG("smps1", SMPS, 1, &pmic5_ftsmps525, "vdd-s1"),
+	RPMH_VREG("smps2", SMPS, 2, &pmic5_ftsmps525, "vdd-s2"),
+	RPMH_VREG("smps3", SMPS, 3, &pmic5_ftsmps525, "vdd-s3"),
+	RPMH_VREG("smps4", SMPS, 4, &pmic5_ftsmps525, "vdd-s4"),
+	RPMH_VREG("smps5", SMPS, 5, &pmic5_ftsmps525, "vdd-s5"),
+	RPMH_VREG("smps6", SMPS, 6, &pmic5_ftsmps525, "vdd-s6"),
+	RPMH_VREG("smps7", SMPS, 7, &pmic5_ftsmps525, "vdd-s7"),
+	RPMH_VREG("smps8", SMPS, 8, &pmic5_ftsmps525, "vdd-s8"),
+	RPMH_VREG("ldo1",  LDO,  1, &pmic5_nldo515,   "vdd-l1"),
+	RPMH_VREG("ldo2",  LDO,  2, &pmic5_nldo515,   "vdd-l2"),
+	RPMH_VREG("ldo3",  LDO,  3, &pmic5_nldo515,   "vdd-l3"),
 	{}
 };
 
 static const struct rpmh_vreg_init_data pmc8380_vreg_data[] = {
-	RPMH_VREG("smps1", "smp%s1", &pmic5_ftsmps525, "vdd-s1"),
-	RPMH_VREG("smps2", "smp%s2", &pmic5_ftsmps525, "vdd-s2"),
-	RPMH_VREG("smps3", "smp%s3", &pmic5_ftsmps525, "vdd-s3"),
-	RPMH_VREG("smps4", "smp%s4", &pmic5_ftsmps525, "vdd-s4"),
-	RPMH_VREG("smps5", "smp%s5", &pmic5_ftsmps525, "vdd-s5"),
-	RPMH_VREG("smps6", "smp%s6", &pmic5_ftsmps525, "vdd-s6"),
-	RPMH_VREG("smps7", "smp%s7", &pmic5_ftsmps525, "vdd-s7"),
-	RPMH_VREG("smps8", "smp%s8", &pmic5_ftsmps525, "vdd-s8"),
-	RPMH_VREG("ldo1",  "ldo%s1", &pmic5_nldo515,   "vdd-l1"),
-	RPMH_VREG("ldo2",  "ldo%s2", &pmic5_nldo515,   "vdd-l2"),
-	RPMH_VREG("ldo3",  "ldo%s3", &pmic5_nldo515,   "vdd-l3"),
+	RPMH_VREG("smps1", SMPS, 1, &pmic5_ftsmps525, "vdd-s1"),
+	RPMH_VREG("smps2", SMPS, 2, &pmic5_ftsmps525, "vdd-s2"),
+	RPMH_VREG("smps3", SMPS, 3, &pmic5_ftsmps525, "vdd-s3"),
+	RPMH_VREG("smps4", SMPS, 4, &pmic5_ftsmps525, "vdd-s4"),
+	RPMH_VREG("smps5", SMPS, 5, &pmic5_ftsmps525, "vdd-s5"),
+	RPMH_VREG("smps6", SMPS, 6, &pmic5_ftsmps525, "vdd-s6"),
+	RPMH_VREG("smps7", SMPS, 7, &pmic5_ftsmps525, "vdd-s7"),
+	RPMH_VREG("smps8", SMPS, 8, &pmic5_ftsmps525, "vdd-s8"),
+	RPMH_VREG("ldo1",  LDO,  1, &pmic5_nldo515,   "vdd-l1"),
+	RPMH_VREG("ldo2",  LDO,  2, &pmic5_nldo515,   "vdd-l2"),
+	RPMH_VREG("ldo3",  LDO,  3, &pmic5_nldo515,   "vdd-l3"),
 	{}
 };
 
 static const struct rpmh_vreg_init_data pm8009_vreg_data[] = {
-	RPMH_VREG("smps1",  "smp%s1",  &pmic5_hfsmps510, "vdd-s1"),
-	RPMH_VREG("smps2",  "smp%s2",  &pmic5_hfsmps515, "vdd-s2"),
-	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_nldo,      "vdd-l1"),
-	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_nldo,      "vdd-l2"),
-	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_nldo,      "vdd-l3"),
-	RPMH_VREG("ldo4",   "ldo%s4",  &pmic5_nldo,      "vdd-l4"),
-	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_pldo,      "vdd-l5-l6"),
-	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_pldo,      "vdd-l5-l6"),
-	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo_lv,   "vdd-l7"),
+	RPMH_VREG("smps1", SMPS, 1, &pmic5_hfsmps510, "vdd-s1"),
+	RPMH_VREG("smps2", SMPS, 2, &pmic5_hfsmps515, "vdd-s2"),
+	RPMH_VREG("ldo1",  LDO,  1, &pmic5_nldo,      "vdd-l1"),
+	RPMH_VREG("ldo2",  LDO,  2, &pmic5_nldo,      "vdd-l2"),
+	RPMH_VREG("ldo3",  LDO,  3, &pmic5_nldo,      "vdd-l3"),
+	RPMH_VREG("ldo4",  LDO,  4, &pmic5_nldo,      "vdd-l4"),
+	RPMH_VREG("ldo5",  LDO,  5, &pmic5_pldo,      "vdd-l5-l6"),
+	RPMH_VREG("ldo6",  LDO,  6, &pmic5_pldo,      "vdd-l5-l6"),
+	RPMH_VREG("ldo7",  LDO,  7, &pmic5_pldo_lv,   "vdd-l7"),
 	{}
 };
 
 static const struct rpmh_vreg_init_data pm8009_1_vreg_data[] = {
-	RPMH_VREG("smps1",  "smp%s1",  &pmic5_hfsmps510, "vdd-s1"),
-	RPMH_VREG("smps2",  "smp%s2",  &pmic5_hfsmps515_1, "vdd-s2"),
-	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_nldo,      "vdd-l1"),
-	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_nldo,      "vdd-l2"),
-	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_nldo,      "vdd-l3"),
-	RPMH_VREG("ldo4",   "ldo%s4",  &pmic5_nldo,      "vdd-l4"),
-	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_pldo,      "vdd-l5-l6"),
-	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_pldo,      "vdd-l5-l6"),
-	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo_lv,   "vdd-l7"),
+	RPMH_VREG("smps1", SMPS, 1, &pmic5_hfsmps510, "vdd-s1"),
+	RPMH_VREG("smps2", SMPS, 2, &pmic5_hfsmps515_1, "vdd-s2"),
+	RPMH_VREG("ldo1",  LDO,  1, &pmic5_nldo,      "vdd-l1"),
+	RPMH_VREG("ldo2",  LDO,  2, &pmic5_nldo,      "vdd-l2"),
+	RPMH_VREG("ldo3",  LDO,  3, &pmic5_nldo,      "vdd-l3"),
+	RPMH_VREG("ldo4",  LDO,  4, &pmic5_nldo,      "vdd-l4"),
+	RPMH_VREG("ldo5",  LDO,  5, &pmic5_pldo,      "vdd-l5-l6"),
+	RPMH_VREG("ldo6",  LDO,  6, &pmic5_pldo,      "vdd-l5-l6"),
+	RPMH_VREG("ldo7",  LDO,  7, &pmic5_pldo_lv,   "vdd-l7"),
 	{}
 };
 
 static const struct rpmh_vreg_init_data pm8010_vreg_data[] = {
-	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_nldo502,   "vdd-l1-l2"),
-	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_nldo502,   "vdd-l1-l2"),
-	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_pldo502ln, "vdd-l3-l4"),
-	RPMH_VREG("ldo4",   "ldo%s4",  &pmic5_pldo502ln, "vdd-l3-l4"),
-	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_pldo502,   "vdd-l5"),
-	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_pldo502ln, "vdd-l6"),
-	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo502,   "vdd-l7"),
+	RPMH_VREG("ldo1",  LDO,  1, &pmic5_nldo502,   "vdd-l1-l2"),
+	RPMH_VREG("ldo2",  LDO,  2, &pmic5_nldo502,   "vdd-l1-l2"),
+	RPMH_VREG("ldo3",  LDO,  3, &pmic5_pldo502ln, "vdd-l3-l4"),
+	RPMH_VREG("ldo4",  LDO,  4, &pmic5_pldo502ln, "vdd-l3-l4"),
+	RPMH_VREG("ldo5",  LDO,  5, &pmic5_pldo502,   "vdd-l5"),
+	RPMH_VREG("ldo6",  LDO,  6, &pmic5_pldo502ln, "vdd-l6"),
+	RPMH_VREG("ldo7",  LDO,  7, &pmic5_pldo502,   "vdd-l7"),
 };
 
 static const struct rpmh_vreg_init_data pm6150_vreg_data[] = {
-	RPMH_VREG("smps1",  "smp%s1",  &pmic5_ftsmps510, "vdd-s1"),
-	RPMH_VREG("smps2",  "smp%s2",  &pmic5_ftsmps510, "vdd-s2"),
-	RPMH_VREG("smps3",  "smp%s3",  &pmic5_ftsmps510, "vdd-s3"),
-	RPMH_VREG("smps4",  "smp%s4",  &pmic5_hfsmps510, "vdd-s4"),
-	RPMH_VREG("smps5",  "smp%s5",  &pmic5_hfsmps510, "vdd-s5"),
-	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_nldo,      "vdd-l1"),
-	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_nldo,      "vdd-l2-l3"),
-	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_nldo,      "vdd-l2-l3"),
-	RPMH_VREG("ldo4",   "ldo%s4",  &pmic5_nldo,      "vdd-l4-l7-l8"),
-	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_pldo,   "vdd-l5-l16-l17-l18-l19"),
-	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_nldo,      "vdd-l6"),
-	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_nldo,      "vdd-l4-l7-l8"),
-	RPMH_VREG("ldo8",   "ldo%s8",  &pmic5_nldo,      "vdd-l4-l7-l8"),
-	RPMH_VREG("ldo9",   "ldo%s9",  &pmic5_nldo,      "vdd-l9"),
-	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_pldo_lv,   "vdd-l10-l14-l15"),
-	RPMH_VREG("ldo11",  "ldo%s11", &pmic5_pldo_lv,   "vdd-l11-l12-l13"),
-	RPMH_VREG("ldo12",  "ldo%s12", &pmic5_pldo_lv,   "vdd-l11-l12-l13"),
-	RPMH_VREG("ldo13",  "ldo%s13", &pmic5_pldo_lv,   "vdd-l11-l12-l13"),
-	RPMH_VREG("ldo14",  "ldo%s14", &pmic5_pldo_lv,   "vdd-l10-l14-l15"),
-	RPMH_VREG("ldo15",  "ldo%s15", &pmic5_pldo_lv,   "vdd-l10-l14-l15"),
-	RPMH_VREG("ldo16",  "ldo%s16", &pmic5_pldo,   "vdd-l5-l16-l17-l18-l19"),
-	RPMH_VREG("ldo17",  "ldo%s17", &pmic5_pldo,   "vdd-l5-l16-l17-l18-l19"),
-	RPMH_VREG("ldo18",  "ldo%s18", &pmic5_pldo,   "vdd-l5-l16-l17-l18-l19"),
-	RPMH_VREG("ldo19",  "ldo%s19", &pmic5_pldo,   "vdd-l5-l16-l17-l18-l19"),
+	RPMH_VREG("smps1", SMPS, 1, &pmic5_ftsmps510, "vdd-s1"),
+	RPMH_VREG("smps2", SMPS, 2, &pmic5_ftsmps510, "vdd-s2"),
+	RPMH_VREG("smps3", SMPS, 3, &pmic5_ftsmps510, "vdd-s3"),
+	RPMH_VREG("smps4", SMPS, 4, &pmic5_hfsmps510, "vdd-s4"),
+	RPMH_VREG("smps5", SMPS, 5, &pmic5_hfsmps510, "vdd-s5"),
+	RPMH_VREG("ldo1",  LDO,  1, &pmic5_nldo,      "vdd-l1"),
+	RPMH_VREG("ldo2",  LDO,  2, &pmic5_nldo,      "vdd-l2-l3"),
+	RPMH_VREG("ldo3",  LDO,  3, &pmic5_nldo,      "vdd-l2-l3"),
+	RPMH_VREG("ldo4",  LDO,  4, &pmic5_nldo,      "vdd-l4-l7-l8"),
+	RPMH_VREG("ldo5",  LDO,  5, &pmic5_pldo,      "vdd-l5-l16-l17-l18-l19"),
+	RPMH_VREG("ldo6",  LDO,  6, &pmic5_nldo,      "vdd-l6"),
+	RPMH_VREG("ldo7",  LDO,  7, &pmic5_nldo,      "vdd-l4-l7-l8"),
+	RPMH_VREG("ldo8",  LDO,  8, &pmic5_nldo,      "vdd-l4-l7-l8"),
+	RPMH_VREG("ldo9",  LDO,  9, &pmic5_nldo,      "vdd-l9"),
+	RPMH_VREG("ldo10", LDO,  10, &pmic5_pldo_lv,   "vdd-l10-l14-l15"),
+	RPMH_VREG("ldo11", LDO,  11, &pmic5_pldo_lv,   "vdd-l11-l12-l13"),
+	RPMH_VREG("ldo12", LDO,  12, &pmic5_pldo_lv,   "vdd-l11-l12-l13"),
+	RPMH_VREG("ldo13", LDO,  13, &pmic5_pldo_lv,   "vdd-l11-l12-l13"),
+	RPMH_VREG("ldo14", LDO,  14, &pmic5_pldo_lv,   "vdd-l10-l14-l15"),
+	RPMH_VREG("ldo15", LDO,  15, &pmic5_pldo_lv,   "vdd-l10-l14-l15"),
+	RPMH_VREG("ldo16", LDO,  16, &pmic5_pldo,      "vdd-l5-l16-l17-l18-l19"),
+	RPMH_VREG("ldo17", LDO,  17, &pmic5_pldo,      "vdd-l5-l16-l17-l18-l19"),
+	RPMH_VREG("ldo18", LDO,  18, &pmic5_pldo,      "vdd-l5-l16-l17-l18-l19"),
+	RPMH_VREG("ldo19", LDO,  19, &pmic5_pldo,      "vdd-l5-l16-l17-l18-l19"),
 	{}
 };
 
 static const struct rpmh_vreg_init_data pm6150l_vreg_data[] = {
-	RPMH_VREG("smps1",  "smp%s1",  &pmic5_ftsmps510, "vdd-s1"),
-	RPMH_VREG("smps2",  "smp%s2",  &pmic5_ftsmps510, "vdd-s2"),
-	RPMH_VREG("smps3",  "smp%s3",  &pmic5_ftsmps510, "vdd-s3"),
-	RPMH_VREG("smps4",  "smp%s4",  &pmic5_ftsmps510, "vdd-s4"),
-	RPMH_VREG("smps5",  "smp%s5",  &pmic5_ftsmps510, "vdd-s5"),
-	RPMH_VREG("smps6",  "smp%s6",  &pmic5_ftsmps510, "vdd-s6"),
-	RPMH_VREG("smps7",  "smp%s7",  &pmic5_ftsmps510, "vdd-s7"),
-	RPMH_VREG("smps8",  "smp%s8",  &pmic5_hfsmps510, "vdd-s8"),
-	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_pldo_lv,   "vdd-l1-l8"),
-	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_nldo,      "vdd-l2-l3"),
-	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_nldo,      "vdd-l2-l3"),
-	RPMH_VREG("ldo4",   "ldo%s4",  &pmic5_pldo,      "vdd-l4-l5-l6"),
-	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_pldo,      "vdd-l4-l5-l6"),
-	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_pldo,      "vdd-l4-l5-l6"),
-	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo,      "vdd-l7-l11"),
-	RPMH_VREG("ldo8",   "ldo%s8",  &pmic5_pldo,      "vdd-l1-l8"),
-	RPMH_VREG("ldo9",   "ldo%s9",  &pmic5_pldo,      "vdd-l9-l10"),
-	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_pldo,      "vdd-l9-l10"),
-	RPMH_VREG("ldo11",  "ldo%s11", &pmic5_pldo,      "vdd-l7-l11"),
-	RPMH_VREG("bob",    "bob%s1",  &pmic5_bob,       "vdd-bob"),
+	RPMH_VREG("smps1",  SMPS, 1, &pmic5_ftsmps510, "vdd-s1"),
+	RPMH_VREG("smps2",  SMPS, 2, &pmic5_ftsmps510, "vdd-s2"),
+	RPMH_VREG("smps3",  SMPS, 3, &pmic5_ftsmps510, "vdd-s3"),
+	RPMH_VREG("smps4",  SMPS, 4, &pmic5_ftsmps510, "vdd-s4"),
+	RPMH_VREG("smps5",  SMPS, 5, &pmic5_ftsmps510, "vdd-s5"),
+	RPMH_VREG("smps6",  SMPS, 6, &pmic5_ftsmps510, "vdd-s6"),
+	RPMH_VREG("smps7",  SMPS, 7, &pmic5_ftsmps510, "vdd-s7"),
+	RPMH_VREG("smps8",  SMPS, 8, &pmic5_hfsmps510, "vdd-s8"),
+	RPMH_VREG("ldo1",   LDO,  1, &pmic5_pldo_lv,   "vdd-l1-l8"),
+	RPMH_VREG("ldo2",   LDO,  2, &pmic5_nldo,      "vdd-l2-l3"),
+	RPMH_VREG("ldo3",   LDO,  3, &pmic5_nldo,      "vdd-l2-l3"),
+	RPMH_VREG("ldo4",   LDO,  4, &pmic5_pldo,      "vdd-l4-l5-l6"),
+	RPMH_VREG("ldo5",   LDO,  5, &pmic5_pldo,      "vdd-l4-l5-l6"),
+	RPMH_VREG("ldo6",   LDO,  6, &pmic5_pldo,      "vdd-l4-l5-l6"),
+	RPMH_VREG("ldo7",   LDO,  7, &pmic5_pldo,      "vdd-l7-l11"),
+	RPMH_VREG("ldo8",   LDO,  8, &pmic5_pldo,      "vdd-l1-l8"),
+	RPMH_VREG("ldo9",   LDO,  9, &pmic5_pldo,      "vdd-l9-l10"),
+	RPMH_VREG("ldo10",  LDO,  10, &pmic5_pldo,      "vdd-l9-l10"),
+	RPMH_VREG("ldo11",  LDO,  11, &pmic5_pldo,      "vdd-l7-l11"),
+	RPMH_VREG("bob",    BOB,  1, &pmic5_bob,       "vdd-bob"),
 	{}
 };
 
 static const struct rpmh_vreg_init_data pm6350_vreg_data[] = {
-	RPMH_VREG("smps1",  "smp%s1",  &pmic5_ftsmps510, NULL),
-	RPMH_VREG("smps2",  "smp%s2",  &pmic5_hfsmps510, NULL),
+	RPMH_VREG("smps1",  SMPS, 1,  &pmic5_ftsmps510, NULL),
+	RPMH_VREG("smps2",  SMPS, 2,  &pmic5_hfsmps510, NULL),
 	/* smps3 - smps5 not configured */
-	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_nldo,      NULL),
-	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_pldo,      NULL),
-	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_pldo,      NULL),
-	RPMH_VREG("ldo4",   "ldo%s4",  &pmic5_nldo,      NULL),
-	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_pldo,      NULL),
-	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_pldo,      NULL),
-	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo,      NULL),
-	RPMH_VREG("ldo8",   "ldo%s8",  &pmic5_pldo,      NULL),
-	RPMH_VREG("ldo9",   "ldo%s9",  &pmic5_pldo,      NULL),
-	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_pldo,      NULL),
-	RPMH_VREG("ldo11",  "ldo%s11", &pmic5_pldo,      NULL),
-	RPMH_VREG("ldo12",  "ldo%s12", &pmic5_pldo,      NULL),
-	RPMH_VREG("ldo13",  "ldo%s13", &pmic5_nldo,      NULL),
-	RPMH_VREG("ldo14",  "ldo%s14", &pmic5_pldo,      NULL),
-	RPMH_VREG("ldo15",  "ldo%s15", &pmic5_nldo,      NULL),
-	RPMH_VREG("ldo16",  "ldo%s16", &pmic5_nldo,      NULL),
+	RPMH_VREG("ldo1",   LDO,  1,  &pmic5_nldo,      NULL),
+	RPMH_VREG("ldo2",   LDO,  2,  &pmic5_pldo,      NULL),
+	RPMH_VREG("ldo3",   LDO,  3,  &pmic5_pldo,      NULL),
+	RPMH_VREG("ldo4",   LDO,  4,  &pmic5_nldo,      NULL),
+	RPMH_VREG("ldo5",   LDO,  5,  &pmic5_pldo,      NULL),
+	RPMH_VREG("ldo6",   LDO,  6,  &pmic5_pldo,      NULL),
+	RPMH_VREG("ldo7",   LDO,  7,  &pmic5_pldo,      NULL),
+	RPMH_VREG("ldo8",   LDO,  8,  &pmic5_pldo,      NULL),
+	RPMH_VREG("ldo9",   LDO,  9,  &pmic5_pldo,      NULL),
+	RPMH_VREG("ldo10",  LDO,  10, &pmic5_pldo,      NULL),
+	RPMH_VREG("ldo11",  LDO,  11, &pmic5_pldo,      NULL),
+	RPMH_VREG("ldo12",  LDO,  12, &pmic5_pldo,      NULL),
+	RPMH_VREG("ldo13",  LDO,  13, &pmic5_nldo,      NULL),
+	RPMH_VREG("ldo14",  LDO,  14, &pmic5_pldo,      NULL),
+	RPMH_VREG("ldo15",  LDO,  15, &pmic5_nldo,      NULL),
+	RPMH_VREG("ldo16",  LDO,  16, &pmic5_nldo,      NULL),
 	/* ldo17 not configured */
-	RPMH_VREG("ldo18",  "ldo%s18", &pmic5_nldo,      NULL),
-	RPMH_VREG("ldo19",  "ldo%s19", &pmic5_nldo,      NULL),
-	RPMH_VREG("ldo20",  "ldo%s20", &pmic5_nldo,      NULL),
-	RPMH_VREG("ldo21",  "ldo%s21", &pmic5_nldo,      NULL),
-	RPMH_VREG("ldo22",  "ldo%s22", &pmic5_nldo,      NULL),
+	RPMH_VREG("ldo18",  LDO,  18, &pmic5_nldo,      NULL),
+	RPMH_VREG("ldo19",  LDO,  19, &pmic5_nldo,      NULL),
+	RPMH_VREG("ldo20",  LDO,  20, &pmic5_nldo,      NULL),
+	RPMH_VREG("ldo21",  LDO,  21, &pmic5_nldo,      NULL),
+	RPMH_VREG("ldo22",  LDO,  22, &pmic5_nldo,      NULL),
 };
 
 static const struct rpmh_vreg_init_data pmx55_vreg_data[] = {
-	RPMH_VREG("smps1",   "smp%s1",    &pmic5_ftsmps510, "vdd-s1"),
-	RPMH_VREG("smps2",   "smp%s2",    &pmic5_hfsmps510, "vdd-s2"),
-	RPMH_VREG("smps3",   "smp%s3",    &pmic5_hfsmps510, "vdd-s3"),
-	RPMH_VREG("smps4",   "smp%s4",    &pmic5_hfsmps510, "vdd-s4"),
-	RPMH_VREG("smps5",   "smp%s5",    &pmic5_hfsmps510, "vdd-s5"),
-	RPMH_VREG("smps6",   "smp%s6",    &pmic5_ftsmps510, "vdd-s6"),
-	RPMH_VREG("smps7",   "smp%s7",    &pmic5_hfsmps510, "vdd-s7"),
-	RPMH_VREG("ldo1",    "ldo%s1",    &pmic5_nldo,      "vdd-l1-l2"),
-	RPMH_VREG("ldo2",    "ldo%s2",    &pmic5_nldo,      "vdd-l1-l2"),
-	RPMH_VREG("ldo3",    "ldo%s3",    &pmic5_nldo,      "vdd-l3-l9"),
-	RPMH_VREG("ldo4",    "ldo%s4",    &pmic5_nldo,      "vdd-l4-l12"),
-	RPMH_VREG("ldo5",    "ldo%s5",    &pmic5_pldo,      "vdd-l5-l6"),
-	RPMH_VREG("ldo6",    "ldo%s6",    &pmic5_pldo,      "vdd-l5-l6"),
-	RPMH_VREG("ldo7",    "ldo%s7",    &pmic5_nldo,      "vdd-l7-l8"),
-	RPMH_VREG("ldo8",    "ldo%s8",    &pmic5_nldo,      "vdd-l7-l8"),
-	RPMH_VREG("ldo9",    "ldo%s9",    &pmic5_nldo,      "vdd-l3-l9"),
-	RPMH_VREG("ldo10",   "ldo%s10",   &pmic5_pldo,      "vdd-l10-l11-l13"),
-	RPMH_VREG("ldo11",   "ldo%s11",   &pmic5_pldo,      "vdd-l10-l11-l13"),
-	RPMH_VREG("ldo12",   "ldo%s12",   &pmic5_nldo,      "vdd-l4-l12"),
-	RPMH_VREG("ldo13",   "ldo%s13",   &pmic5_pldo,      "vdd-l10-l11-l13"),
-	RPMH_VREG("ldo14",   "ldo%s14",   &pmic5_nldo,      "vdd-l14"),
-	RPMH_VREG("ldo15",   "ldo%s15",   &pmic5_nldo,      "vdd-l15"),
-	RPMH_VREG("ldo16",   "ldo%s16",   &pmic5_pldo,      "vdd-l16"),
+	RPMH_VREG("smps1",  SMPS, 1,  &pmic5_ftsmps510, "vdd-s1"),
+	RPMH_VREG("smps2",  SMPS, 2,  &pmic5_hfsmps510, "vdd-s2"),
+	RPMH_VREG("smps3",  SMPS, 3,  &pmic5_hfsmps510, "vdd-s3"),
+	RPMH_VREG("smps4",  SMPS, 4,  &pmic5_hfsmps510, "vdd-s4"),
+	RPMH_VREG("smps5",  SMPS, 5,  &pmic5_hfsmps510, "vdd-s5"),
+	RPMH_VREG("smps6",  SMPS, 6,  &pmic5_ftsmps510, "vdd-s6"),
+	RPMH_VREG("smps7",  SMPS, 7,  &pmic5_hfsmps510, "vdd-s7"),
+	RPMH_VREG("ldo1",   LDO,  1,  &pmic5_nldo,      "vdd-l1-l2"),
+	RPMH_VREG("ldo2",   LDO,  2,  &pmic5_nldo,      "vdd-l1-l2"),
+	RPMH_VREG("ldo3",   LDO,  3,  &pmic5_nldo,      "vdd-l3-l9"),
+	RPMH_VREG("ldo4",   LDO,  4,  &pmic5_nldo,      "vdd-l4-l12"),
+	RPMH_VREG("ldo5",   LDO,  5,  &pmic5_pldo,      "vdd-l5-l6"),
+	RPMH_VREG("ldo6",   LDO,  6,  &pmic5_pldo,      "vdd-l5-l6"),
+	RPMH_VREG("ldo7",   LDO,  7,  &pmic5_nldo,      "vdd-l7-l8"),
+	RPMH_VREG("ldo8",   LDO,  8,  &pmic5_nldo,      "vdd-l7-l8"),
+	RPMH_VREG("ldo9",   LDO,  9,  &pmic5_nldo,      "vdd-l3-l9"),
+	RPMH_VREG("ldo10",  LDO,  10, &pmic5_pldo,      "vdd-l10-l11-l13"),
+	RPMH_VREG("ldo11",  LDO,  11, &pmic5_pldo,      "vdd-l10-l11-l13"),
+	RPMH_VREG("ldo12",  LDO,  12, &pmic5_nldo,      "vdd-l4-l12"),
+	RPMH_VREG("ldo13",  LDO,  13, &pmic5_pldo,      "vdd-l10-l11-l13"),
+	RPMH_VREG("ldo14",  LDO,  14, &pmic5_nldo,      "vdd-l14"),
+	RPMH_VREG("ldo15",  LDO,  15, &pmic5_nldo,      "vdd-l15"),
+	RPMH_VREG("ldo16",  LDO,  16, &pmic5_pldo,      "vdd-l16"),
 	{}
 };
 
 static const struct rpmh_vreg_init_data pmx65_vreg_data[] = {
-	RPMH_VREG("smps1",   "smp%s1",    &pmic5_ftsmps510, "vdd-s1"),
-	RPMH_VREG("smps2",   "smp%s2",    &pmic5_hfsmps510, "vdd-s2"),
-	RPMH_VREG("smps3",   "smp%s3",    &pmic5_hfsmps510, "vdd-s3"),
-	RPMH_VREG("smps4",   "smp%s4",    &pmic5_hfsmps510, "vdd-s4"),
-	RPMH_VREG("smps5",   "smp%s5",    &pmic5_hfsmps510, "vdd-s5"),
-	RPMH_VREG("smps6",   "smp%s6",    &pmic5_ftsmps510, "vdd-s6"),
-	RPMH_VREG("smps7",   "smp%s7",    &pmic5_hfsmps510, "vdd-s7"),
-	RPMH_VREG("smps8",   "smp%s8",    &pmic5_hfsmps510, "vdd-s8"),
-	RPMH_VREG("ldo1",    "ldo%s1",    &pmic5_nldo,      "vdd-l1"),
-	RPMH_VREG("ldo2",    "ldo%s2",    &pmic5_nldo,      "vdd-l2-l18"),
-	RPMH_VREG("ldo3",    "ldo%s3",    &pmic5_nldo,      "vdd-l3"),
-	RPMH_VREG("ldo4",    "ldo%s4",    &pmic5_nldo,      "vdd-l4"),
-	RPMH_VREG("ldo5",    "ldo%s5",    &pmic5_pldo,      "vdd-l5-l6-l16"),
-	RPMH_VREG("ldo6",    "ldo%s6",    &pmic5_pldo,      "vdd-l5-l6-l16"),
-	RPMH_VREG("ldo7",    "ldo%s7",    &pmic5_nldo,      "vdd-l7"),
-	RPMH_VREG("ldo8",    "ldo%s8",    &pmic5_nldo,      "vdd-l8-l9"),
-	RPMH_VREG("ldo9",    "ldo%s9",    &pmic5_nldo,      "vdd-l8-l9"),
-	RPMH_VREG("ldo10",   "ldo%s10",   &pmic5_pldo,      "vdd-l10"),
-	RPMH_VREG("ldo11",   "ldo%s11",   &pmic5_pldo,      "vdd-l11-l13"),
-	RPMH_VREG("ldo12",   "ldo%s12",   &pmic5_nldo,      "vdd-l12"),
-	RPMH_VREG("ldo13",   "ldo%s13",   &pmic5_pldo,      "vdd-l11-l13"),
-	RPMH_VREG("ldo14",   "ldo%s14",   &pmic5_nldo,      "vdd-l14"),
-	RPMH_VREG("ldo15",   "ldo%s15",   &pmic5_nldo,      "vdd-l15"),
-	RPMH_VREG("ldo16",   "ldo%s16",   &pmic5_pldo,      "vdd-l5-l6-l16"),
-	RPMH_VREG("ldo17",   "ldo%s17",   &pmic5_nldo,      "vdd-l17"),
+	RPMH_VREG("smps1",   SMPS, 1,  &pmic5_ftsmps510, "vdd-s1"),
+	RPMH_VREG("smps2",   SMPS, 2,  &pmic5_hfsmps510, "vdd-s2"),
+	RPMH_VREG("smps3",   SMPS, 3,  &pmic5_hfsmps510, "vdd-s3"),
+	RPMH_VREG("smps4",   SMPS, 4,  &pmic5_hfsmps510, "vdd-s4"),
+	RPMH_VREG("smps5",   SMPS, 5,  &pmic5_hfsmps510, "vdd-s5"),
+	RPMH_VREG("smps6",   SMPS, 6,  &pmic5_ftsmps510, "vdd-s6"),
+	RPMH_VREG("smps7",   SMPS, 7,  &pmic5_hfsmps510, "vdd-s7"),
+	RPMH_VREG("smps8",   SMPS, 8,  &pmic5_hfsmps510, "vdd-s8"),
+	RPMH_VREG("ldo1",    LDO,  1,  &pmic5_nldo,      "vdd-l1"),
+	RPMH_VREG("ldo2",    LDO,  2,  &pmic5_nldo,      "vdd-l2-l18"),
+	RPMH_VREG("ldo3",    LDO,  3,  &pmic5_nldo,      "vdd-l3"),
+	RPMH_VREG("ldo4",    LDO,  4,  &pmic5_nldo,      "vdd-l4"),
+	RPMH_VREG("ldo5",    LDO,  5,  &pmic5_pldo,      "vdd-l5-l6-l16"),
+	RPMH_VREG("ldo6",    LDO,  6,  &pmic5_pldo,      "vdd-l5-l6-l16"),
+	RPMH_VREG("ldo7",    LDO,  7,  &pmic5_nldo,      "vdd-l7"),
+	RPMH_VREG("ldo8",    LDO,  8,  &pmic5_nldo,      "vdd-l8-l9"),
+	RPMH_VREG("ldo9",    LDO,  9,  &pmic5_nldo,      "vdd-l8-l9"),
+	RPMH_VREG("ldo10",   LDO,  10, &pmic5_pldo,      "vdd-l10"),
+	RPMH_VREG("ldo11",   LDO,  11, &pmic5_pldo,      "vdd-l11-l13"),
+	RPMH_VREG("ldo12",   LDO,  12, &pmic5_nldo,      "vdd-l12"),
+	RPMH_VREG("ldo13",   LDO,  13, &pmic5_pldo,      "vdd-l11-l13"),
+	RPMH_VREG("ldo14",   LDO,  14, &pmic5_nldo,      "vdd-l14"),
+	RPMH_VREG("ldo15",   LDO,  15, &pmic5_nldo,      "vdd-l15"),
+	RPMH_VREG("ldo16",   LDO,  16, &pmic5_pldo,      "vdd-l5-l6-l16"),
+	RPMH_VREG("ldo17",   LDO,  17, &pmic5_nldo,      "vdd-l17"),
 	/* ldo18 not configured */
-	RPMH_VREG("ldo19",   "ldo%s19",   &pmic5_nldo,      "vdd-l19"),
-	RPMH_VREG("ldo20",   "ldo%s20",   &pmic5_nldo,      "vdd-l20"),
-	RPMH_VREG("ldo21",   "ldo%s21",   &pmic5_nldo,      "vdd-l21"),
+	RPMH_VREG("ldo19",   LDO,  19, &pmic5_nldo,      "vdd-l19"),
+	RPMH_VREG("ldo20",   LDO,  20, &pmic5_nldo,      "vdd-l20"),
+	RPMH_VREG("ldo21",   LDO,  21, &pmic5_nldo,      "vdd-l21"),
 	{}
 };
 
 static const struct rpmh_vreg_init_data pmx75_vreg_data[] = {
-	RPMH_VREG("smps1",   "smp%s1",    &pmic5_ftsmps525, "vdd-s1"),
-	RPMH_VREG("smps2",   "smp%s2",    &pmic5_ftsmps525, "vdd-s2"),
-	RPMH_VREG("smps3",   "smp%s3",    &pmic5_ftsmps525, "vdd-s3"),
-	RPMH_VREG("smps4",   "smp%s4",    &pmic5_ftsmps525, "vdd-s4"),
-	RPMH_VREG("smps5",   "smp%s5",    &pmic5_ftsmps525, "vdd-s5"),
-	RPMH_VREG("smps6",   "smp%s6",    &pmic5_ftsmps525, "vdd-s6"),
-	RPMH_VREG("smps7",   "smp%s7",    &pmic5_ftsmps525, "vdd-s7"),
-	RPMH_VREG("smps8",   "smp%s8",    &pmic5_ftsmps525, "vdd-s8"),
-	RPMH_VREG("smps9",   "smp%s9",    &pmic5_ftsmps525, "vdd-s9"),
-	RPMH_VREG("smps10",  "smp%s10",   &pmic5_ftsmps525, "vdd-s10"),
-	RPMH_VREG("ldo1",    "ldo%s1",    &pmic5_nldo515,   "vdd-l1"),
-	RPMH_VREG("ldo2",    "ldo%s2",    &pmic5_nldo515,   "vdd-l2-18"),
-	RPMH_VREG("ldo3",    "ldo%s3",    &pmic5_nldo515,   "vdd-l3"),
-	RPMH_VREG("ldo4",    "ldo%s4",    &pmic5_nldo515,   "vdd-l4-l16"),
-	RPMH_VREG("ldo5",    "ldo%s5",    &pmic5_pldo_lv,   "vdd-l5-l6"),
-	RPMH_VREG("ldo6",    "ldo%s6",    &pmic5_pldo_lv,   "vdd-l5-l6"),
-	RPMH_VREG("ldo7",    "ldo%s7",    &pmic5_nldo515,   "vdd-l7"),
-	RPMH_VREG("ldo8",    "ldo%s8",    &pmic5_nldo515,   "vdd-l8-l9"),
-	RPMH_VREG("ldo9",    "ldo%s9",    &pmic5_nldo515,   "vdd-l8-l9"),
-	RPMH_VREG("ldo10",   "ldo%s10",   &pmic5_pldo,      "vdd-l10"),
-	RPMH_VREG("ldo11",   "ldo%s11",   &pmic5_pldo,      "vdd-l11-l13"),
-	RPMH_VREG("ldo12",   "ldo%s12",   &pmic5_nldo515,   "vdd-l12"),
-	RPMH_VREG("ldo13",   "ldo%s13",   &pmic5_pldo,      "vdd-l11-l13"),
-	RPMH_VREG("ldo14",   "ldo%s14",   &pmic5_nldo515,   "vdd-l14"),
-	RPMH_VREG("ldo15",   "ldo%s15",   &pmic5_nldo515,   "vdd-l15"),
-	RPMH_VREG("ldo16",   "ldo%s16",   &pmic5_nldo515,   "vdd-l4-l16"),
-	RPMH_VREG("ldo17",   "ldo%s17",   &pmic5_nldo515,   "vdd-l17"),
+	RPMH_VREG("smps1",   SMPS, 1,  &pmic5_ftsmps525, "vdd-s1"),
+	RPMH_VREG("smps2",   SMPS, 2,  &pmic5_ftsmps525, "vdd-s2"),
+	RPMH_VREG("smps3",   SMPS, 3,  &pmic5_ftsmps525, "vdd-s3"),
+	RPMH_VREG("smps4",   SMPS, 4,  &pmic5_ftsmps525, "vdd-s4"),
+	RPMH_VREG("smps5",   SMPS, 5,  &pmic5_ftsmps525, "vdd-s5"),
+	RPMH_VREG("smps6",   SMPS, 6,  &pmic5_ftsmps525, "vdd-s6"),
+	RPMH_VREG("smps7",   SMPS, 7,  &pmic5_ftsmps525, "vdd-s7"),
+	RPMH_VREG("smps8",   SMPS, 8,  &pmic5_ftsmps525, "vdd-s8"),
+	RPMH_VREG("smps9",   SMPS, 9,  &pmic5_ftsmps525, "vdd-s9"),
+	RPMH_VREG("smps10",  SMPS, 10, &pmic5_ftsmps525, "vdd-s10"),
+	RPMH_VREG("ldo1",    LDO,  1,  &pmic5_nldo515,   "vdd-l1"),
+	RPMH_VREG("ldo2",    LDO,  2,  &pmic5_nldo515,   "vdd-l2-18"),
+	RPMH_VREG("ldo3",    LDO,  3,  &pmic5_nldo515,   "vdd-l3"),
+	RPMH_VREG("ldo4",    LDO,  4,  &pmic5_nldo515,   "vdd-l4-l16"),
+	RPMH_VREG("ldo5",    LDO,  5,  &pmic5_pldo_lv,   "vdd-l5-l6"),
+	RPMH_VREG("ldo6",    LDO,  6,  &pmic5_pldo_lv,   "vdd-l5-l6"),
+	RPMH_VREG("ldo7",    LDO,  7,  &pmic5_nldo515,   "vdd-l7"),
+	RPMH_VREG("ldo8",    LDO,  8,  &pmic5_nldo515,   "vdd-l8-l9"),
+	RPMH_VREG("ldo9",    LDO,  9,  &pmic5_nldo515,   "vdd-l8-l9"),
+	RPMH_VREG("ldo10",   LDO,  10, &pmic5_pldo,      "vdd-l10"),
+	RPMH_VREG("ldo11",   LDO,  11, &pmic5_pldo,      "vdd-l11-l13"),
+	RPMH_VREG("ldo12",   LDO,  12, &pmic5_nldo515,   "vdd-l12"),
+	RPMH_VREG("ldo13",   LDO,  13, &pmic5_pldo,      "vdd-l11-l13"),
+	RPMH_VREG("ldo14",   LDO,  14, &pmic5_nldo515,   "vdd-l14"),
+	RPMH_VREG("ldo15",   LDO,  15, &pmic5_nldo515,   "vdd-l15"),
+	RPMH_VREG("ldo16",   LDO,  16, &pmic5_nldo515,   "vdd-l4-l16"),
+	RPMH_VREG("ldo17",   LDO,  17, &pmic5_nldo515,   "vdd-l17"),
 	/* ldo18 not configured */
-	RPMH_VREG("ldo19",   "ldo%s19",   &pmic5_nldo515,   "vdd-l19"),
-	RPMH_VREG("ldo20",   "ldo%s20",   &pmic5_nldo515,   "vdd-l20-l21"),
-	RPMH_VREG("ldo21",   "ldo%s21",   &pmic5_nldo515,   "vdd-l20-l21"),
+	RPMH_VREG("ldo19",   LDO,  19, &pmic5_nldo515,   "vdd-l19"),
+	RPMH_VREG("ldo20",   LDO,  20, &pmic5_nldo515,   "vdd-l20-l21"),
+	RPMH_VREG("ldo21",   LDO,  21, &pmic5_nldo515,   "vdd-l20-l21"),
 };
 
 static const struct rpmh_vreg_init_data pm7325_vreg_data[] = {
-	RPMH_VREG("smps1",  "smp%s1",  &pmic5_hfsmps510, "vdd-s1"),
-	RPMH_VREG("smps2",  "smp%s2",  &pmic5_ftsmps520, "vdd-s2"),
-	RPMH_VREG("smps3",  "smp%s3",  &pmic5_ftsmps520, "vdd-s3"),
-	RPMH_VREG("smps4",  "smp%s4",  &pmic5_ftsmps520, "vdd-s4"),
-	RPMH_VREG("smps5",  "smp%s5",  &pmic5_ftsmps520, "vdd-s5"),
-	RPMH_VREG("smps6",  "smp%s6",  &pmic5_ftsmps520, "vdd-s6"),
-	RPMH_VREG("smps7",  "smp%s7",  &pmic5_ftsmps520, "vdd-s7"),
-	RPMH_VREG("smps8",  "smp%s8",  &pmic5_hfsmps510, "vdd-s8"),
-	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_nldo,      "vdd-l1-l4-l12-l15"),
-	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_pldo,      "vdd-l2-l7"),
-	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_nldo,      "vdd-l3"),
-	RPMH_VREG("ldo4",   "ldo%s4",  &pmic5_nldo,      "vdd-l1-l4-l12-l15"),
-	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_nldo,      "vdd-l5"),
-	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_nldo,      "vdd-l6-l9-l10"),
-	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo,      "vdd-l2-l7"),
-	RPMH_VREG("ldo8",   "ldo%s8",  &pmic5_nldo,      "vdd-l8"),
-	RPMH_VREG("ldo9",   "ldo%s9",  &pmic5_nldo,      "vdd-l6-l9-l10"),
-	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_nldo,      "vdd-l6-l9-l10"),
-	RPMH_VREG("ldo11",  "ldo%s11", &pmic5_pldo_lv,   "vdd-l11-l17-l18-l19"),
-	RPMH_VREG("ldo12",  "ldo%s12", &pmic5_nldo,      "vdd-l1-l4-l12-l15"),
-	RPMH_VREG("ldo13",  "ldo%s13", &pmic5_nldo,      "vdd-l13"),
-	RPMH_VREG("ldo14",  "ldo%s14", &pmic5_nldo,      "vdd-l14-l16"),
-	RPMH_VREG("ldo15",  "ldo%s15", &pmic5_nldo,      "vdd-l1-l4-l12-l15"),
-	RPMH_VREG("ldo16",  "ldo%s16", &pmic5_nldo,      "vdd-l14-l16"),
-	RPMH_VREG("ldo17",  "ldo%s17", &pmic5_pldo_lv,   "vdd-l11-l17-l18-l19"),
-	RPMH_VREG("ldo18",  "ldo%s18", &pmic5_pldo_lv,   "vdd-l11-l17-l18-l19"),
-	RPMH_VREG("ldo19",  "ldo%s19", &pmic5_pldo_lv,   "vdd-l11-l17-l18-l19"),
+	RPMH_VREG("smps1",  SMPS, 1,  &pmic5_hfsmps510, "vdd-s1"),
+	RPMH_VREG("smps2",  SMPS, 2,  &pmic5_ftsmps520, "vdd-s2"),
+	RPMH_VREG("smps3",  SMPS, 3,  &pmic5_ftsmps520, "vdd-s3"),
+	RPMH_VREG("smps4",  SMPS, 4,  &pmic5_ftsmps520, "vdd-s4"),
+	RPMH_VREG("smps5",  SMPS, 5,  &pmic5_ftsmps520, "vdd-s5"),
+	RPMH_VREG("smps6",  SMPS, 6,  &pmic5_ftsmps520, "vdd-s6"),
+	RPMH_VREG("smps7",  SMPS, 7,  &pmic5_ftsmps520, "vdd-s7"),
+	RPMH_VREG("smps8",  SMPS, 8,  &pmic5_hfsmps510, "vdd-s8"),
+	RPMH_VREG("ldo1",   LDO,  1,  &pmic5_nldo,      "vdd-l1-l4-l12-l15"),
+	RPMH_VREG("ldo2",   LDO,  2,  &pmic5_pldo,      "vdd-l2-l7"),
+	RPMH_VREG("ldo3",   LDO,  3,  &pmic5_nldo,      "vdd-l3"),
+	RPMH_VREG("ldo4",   LDO,  4,  &pmic5_nldo,      "vdd-l1-l4-l12-l15"),
+	RPMH_VREG("ldo5",   LDO,  5,  &pmic5_nldo,      "vdd-l5"),
+	RPMH_VREG("ldo6",   LDO,  6,  &pmic5_nldo,      "vdd-l6-l9-l10"),
+	RPMH_VREG("ldo7",   LDO,  7,  &pmic5_pldo,      "vdd-l2-l7"),
+	RPMH_VREG("ldo8",   LDO,  8,  &pmic5_nldo,      "vdd-l8"),
+	RPMH_VREG("ldo9",   LDO,  9,  &pmic5_nldo,      "vdd-l6-l9-l10"),
+	RPMH_VREG("ldo10",  LDO,  10, &pmic5_nldo,      "vdd-l6-l9-l10"),
+	RPMH_VREG("ldo11",  LDO,  11, &pmic5_pldo_lv,   "vdd-l11-l17-l18-l19"),
+	RPMH_VREG("ldo12",  LDO,  12, &pmic5_nldo,      "vdd-l1-l4-l12-l15"),
+	RPMH_VREG("ldo13",  LDO,  13, &pmic5_nldo,      "vdd-l13"),
+	RPMH_VREG("ldo14",  LDO,  14, &pmic5_nldo,      "vdd-l14-l16"),
+	RPMH_VREG("ldo15",  LDO,  15, &pmic5_nldo,      "vdd-l1-l4-l12-l15"),
+	RPMH_VREG("ldo16",  LDO,  16, &pmic5_nldo,      "vdd-l14-l16"),
+	RPMH_VREG("ldo17",  LDO,  17, &pmic5_pldo_lv,   "vdd-l11-l17-l18-l19"),
+	RPMH_VREG("ldo18",  LDO,  18, &pmic5_pldo_lv,   "vdd-l11-l17-l18-l19"),
+	RPMH_VREG("ldo19",  LDO,  19, &pmic5_pldo_lv,   "vdd-l11-l17-l18-l19"),
 	{}
 };
 
 static const struct rpmh_vreg_init_data pm7550_vreg_data[] = {
-	RPMH_VREG("smps1", "smp%s1",  &pmic5_ftsmps525,    "vdd-s1"),
-	RPMH_VREG("smps2", "smp%s2",  &pmic5_ftsmps525,    "vdd-s2"),
-	RPMH_VREG("smps3", "smp%s3",  &pmic5_ftsmps525,    "vdd-s3"),
-	RPMH_VREG("smps4", "smp%s4",  &pmic5_ftsmps525,    "vdd-s4"),
-	RPMH_VREG("smps5", "smp%s5",  &pmic5_ftsmps525,    "vdd-s5"),
-	RPMH_VREG("smps6", "smp%s6",  &pmic5_ftsmps525,    "vdd-s6"),
-	RPMH_VREG("ldo1",  "ldo%s1",  &pmic5_nldo515,      "vdd-l1"),
-	RPMH_VREG("ldo2",  "ldo%s2",  &pmic5_nldo515,      "vdd-l2-l3"),
-	RPMH_VREG("ldo3",  "ldo%s3",  &pmic5_nldo515,      "vdd-l2-l3"),
-	RPMH_VREG("ldo4",  "ldo%s4",  &pmic5_nldo515,      "vdd-l4-l5"),
-	RPMH_VREG("ldo5",  "ldo%s5",  &pmic5_nldo515,      "vdd-l4-l5"),
-	RPMH_VREG("ldo6",  "ldo%s6",  &pmic5_nldo515,      "vdd-l6"),
-	RPMH_VREG("ldo7",  "ldo%s7",  &pmic5_nldo515,      "vdd-l7"),
-	RPMH_VREG("ldo8",  "ldo%s8",  &pmic5_nldo515,      "vdd-l8"),
-	RPMH_VREG("ldo9",  "ldo%s9",  &pmic5_nldo515,      "vdd-l9-l10"),
-	RPMH_VREG("ldo10", "ldo%s10", &pmic5_nldo515,      "vdd-l9-l10"),
-	RPMH_VREG("ldo11", "ldo%s11", &pmic5_nldo515,      "vdd-l11"),
-	RPMH_VREG("ldo12", "ldo%s12", &pmic5_pldo515_mv,   "vdd-l12-l14"),
-	RPMH_VREG("ldo13", "ldo%s13", &pmic5_pldo515_mv,   "vdd-l13-l16"),
-	RPMH_VREG("ldo14", "ldo%s14", &pmic5_pldo,         "vdd-l12-l14"),
-	RPMH_VREG("ldo15", "ldo%s15", &pmic5_pldo,         "vdd-l15-l17-l18-l19-l20-l21-l22-l23"),
-	RPMH_VREG("ldo16", "ldo%s16", &pmic5_pldo,         "vdd-l13-l16"),
-	RPMH_VREG("ldo17", "ldo%s17", &pmic5_pldo,         "vdd-l15-l17-l18-l19-l20-l21-l22-l23"),
-	RPMH_VREG("ldo18", "ldo%s18", &pmic5_pldo,         "vdd-l15-l17-l18-l19-l20-l21-l22-l23"),
-	RPMH_VREG("ldo19", "ldo%s19", &pmic5_pldo,         "vdd-l15-l17-l18-l19-l20-l21-l22-l23"),
-	RPMH_VREG("ldo20", "ldo%s20", &pmic5_pldo,         "vdd-l15-l17-l18-l19-l20-l21-l22-l23"),
-	RPMH_VREG("ldo21", "ldo%s21", &pmic5_pldo,         "vdd-l15-l17-l18-l19-l20-l21-l22-l23"),
-	RPMH_VREG("ldo22", "ldo%s22", &pmic5_pldo,         "vdd-l15-l17-l18-l19-l20-l21-l22-l23"),
-	RPMH_VREG("ldo23", "ldo%s23", &pmic5_pldo,         "vdd-l15-l17-l18-l19-l20-l21-l22-l23"),
-	RPMH_VREG("bob",   "bob%s1",  &pmic5_bob,          "vdd-bob"),
+	RPMH_VREG("smps1", SMPS, 1,  &pmic5_ftsmps525,    "vdd-s1"),
+	RPMH_VREG("smps2", SMPS, 2,  &pmic5_ftsmps525,    "vdd-s2"),
+	RPMH_VREG("smps3", SMPS, 3,  &pmic5_ftsmps525,    "vdd-s3"),
+	RPMH_VREG("smps4", SMPS, 4,  &pmic5_ftsmps525,    "vdd-s4"),
+	RPMH_VREG("smps5", SMPS, 5,  &pmic5_ftsmps525,    "vdd-s5"),
+	RPMH_VREG("smps6", SMPS, 6,  &pmic5_ftsmps525,    "vdd-s6"),
+	RPMH_VREG("ldo1",  LDO,  1,  &pmic5_nldo515,      "vdd-l1"),
+	RPMH_VREG("ldo2",  LDO,  2,  &pmic5_nldo515,      "vdd-l2-l3"),
+	RPMH_VREG("ldo3",  LDO,  3,  &pmic5_nldo515,      "vdd-l2-l3"),
+	RPMH_VREG("ldo4",  LDO,  4,  &pmic5_nldo515,      "vdd-l4-l5"),
+	RPMH_VREG("ldo5",  LDO,  5,  &pmic5_nldo515,      "vdd-l4-l5"),
+	RPMH_VREG("ldo6",  LDO,  6,  &pmic5_nldo515,      "vdd-l6"),
+	RPMH_VREG("ldo7",  LDO,  7,  &pmic5_nldo515,      "vdd-l7"),
+	RPMH_VREG("ldo8",  LDO,  8,  &pmic5_nldo515,      "vdd-l8"),
+	RPMH_VREG("ldo9",  LDO,  9,  &pmic5_nldo515,      "vdd-l9-l10"),
+	RPMH_VREG("ldo10", LDO,  10, &pmic5_nldo515,      "vdd-l9-l10"),
+	RPMH_VREG("ldo11", LDO,  11, &pmic5_nldo515,      "vdd-l11"),
+	RPMH_VREG("ldo12", LDO,  12, &pmic5_pldo515_mv,   "vdd-l12-l14"),
+	RPMH_VREG("ldo13", LDO,  13, &pmic5_pldo515_mv,   "vdd-l13-l16"),
+	RPMH_VREG("ldo14", LDO,  14, &pmic5_pldo,         "vdd-l12-l14"),
+	RPMH_VREG("ldo15", LDO,  15, &pmic5_pldo,         "vdd-l15-l17-l18-l19-l20-l21-l22-l23"),
+	RPMH_VREG("ldo16", LDO,  16, &pmic5_pldo,         "vdd-l13-l16"),
+	RPMH_VREG("ldo17", LDO,  17, &pmic5_pldo,         "vdd-l15-l17-l18-l19-l20-l21-l22-l23"),
+	RPMH_VREG("ldo18", LDO,  18, &pmic5_pldo,         "vdd-l15-l17-l18-l19-l20-l21-l22-l23"),
+	RPMH_VREG("ldo19", LDO,  19, &pmic5_pldo,         "vdd-l15-l17-l18-l19-l20-l21-l22-l23"),
+	RPMH_VREG("ldo20", LDO,  20, &pmic5_pldo,         "vdd-l15-l17-l18-l19-l20-l21-l22-l23"),
+	RPMH_VREG("ldo21", LDO,  21, &pmic5_pldo,         "vdd-l15-l17-l18-l19-l20-l21-l22-l23"),
+	RPMH_VREG("ldo22", LDO,  22, &pmic5_pldo,         "vdd-l15-l17-l18-l19-l20-l21-l22-l23"),
+	RPMH_VREG("ldo23", LDO,  23, &pmic5_pldo,         "vdd-l15-l17-l18-l19-l20-l21-l22-l23"),
+	RPMH_VREG("bob",   BOB,  1,  &pmic5_bob,          "vdd-bob"),
 	{}
 };
 
 static const struct rpmh_vreg_init_data pmr735a_vreg_data[] = {
-	RPMH_VREG("smps1",  "smp%s1",  &pmic5_ftsmps520, "vdd-s1"),
-	RPMH_VREG("smps2",  "smp%s2",  &pmic5_ftsmps520, "vdd-s2"),
-	RPMH_VREG("smps3",  "smp%s3",  &pmic5_hfsmps515, "vdd-s3"),
-	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_nldo,      "vdd-l1-l2"),
-	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_nldo,      "vdd-l1-l2"),
-	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_nldo,      "vdd-l3"),
-	RPMH_VREG("ldo4",   "ldo%s4",  &pmic5_pldo_lv,   "vdd-l4"),
-	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_nldo,      "vdd-l5-l6"),
-	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_nldo,      "vdd-l5-l6"),
-	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo,      "vdd-l7-bob"),
+	RPMH_VREG("smps1", SMPS, 1, &pmic5_ftsmps520, "vdd-s1"),
+	RPMH_VREG("smps2", SMPS, 2, &pmic5_ftsmps520, "vdd-s2"),
+	RPMH_VREG("smps3", SMPS, 3, &pmic5_hfsmps515, "vdd-s3"),
+	RPMH_VREG("ldo1",  LDO,  1, &pmic5_nldo,      "vdd-l1-l2"),
+	RPMH_VREG("ldo2",  LDO,  2, &pmic5_nldo,      "vdd-l1-l2"),
+	RPMH_VREG("ldo3",  LDO,  3, &pmic5_nldo,      "vdd-l3"),
+	RPMH_VREG("ldo4",  LDO,  4, &pmic5_pldo_lv,   "vdd-l4"),
+	RPMH_VREG("ldo5",  LDO,  5, &pmic5_nldo,      "vdd-l5-l6"),
+	RPMH_VREG("ldo6",  LDO,  6, &pmic5_nldo,      "vdd-l5-l6"),
+	RPMH_VREG("ldo7",  LDO,  7, &pmic5_pldo,      "vdd-l7-bob"),
 	{}
 };
 
 static const struct rpmh_vreg_init_data pmr735b_vreg_data[] = {
-	RPMH_VREG("ldo1",   "ldo%s1",   &pmic5_nldo,      "vdd-l1-l2"),
-	RPMH_VREG("ldo2",   "ldo%s2",   &pmic5_nldo,      "vdd-l1-l2"),
-	RPMH_VREG("ldo3",   "ldo%s3",   &pmic5_nldo,      "vdd-l3"),
-	RPMH_VREG("ldo4",   "ldo%s4",   &pmic5_pldo_lv,   "vdd-l4"),
-	RPMH_VREG("ldo5",   "ldo%s5",   &pmic5_nldo,      "vdd-l5"),
-	RPMH_VREG("ldo6",   "ldo%s6",   &pmic5_nldo,      "vdd-l6"),
-	RPMH_VREG("ldo7",   "ldo%s7",   &pmic5_nldo,      "vdd-l7-l8"),
-	RPMH_VREG("ldo8",   "ldo%s8",   &pmic5_nldo,      "vdd-l7-l8"),
-	RPMH_VREG("ldo9",   "ldo%s9",   &pmic5_nldo,      "vdd-l9"),
-	RPMH_VREG("ldo10",  "ldo%s10",  &pmic5_pldo_lv,   "vdd-l10"),
-	RPMH_VREG("ldo11",  "ldo%s11",  &pmic5_nldo,      "vdd-l11"),
-	RPMH_VREG("ldo12",  "ldo%s12",  &pmic5_nldo,      "vdd-l12"),
+	RPMH_VREG("ldo1",  LDO,  1, &pmic5_nldo,      "vdd-l1-l2"),
+	RPMH_VREG("ldo2",  LDO,  2, &pmic5_nldo,      "vdd-l1-l2"),
+	RPMH_VREG("ldo3",  LDO,  3, &pmic5_nldo,      "vdd-l3"),
+	RPMH_VREG("ldo4",  LDO,  4, &pmic5_pldo_lv,   "vdd-l4"),
+	RPMH_VREG("ldo5",  LDO,  5, &pmic5_nldo,      "vdd-l5"),
+	RPMH_VREG("ldo6",  LDO,  6, &pmic5_nldo,      "vdd-l6"),
+	RPMH_VREG("ldo7",  LDO,  7, &pmic5_nldo,      "vdd-l7-l8"),
+	RPMH_VREG("ldo8",  LDO,  8, &pmic5_nldo,      "vdd-l7-l8"),
+	RPMH_VREG("ldo9",  LDO,  9, &pmic5_nldo,      "vdd-l9"),
+	RPMH_VREG("ldo10", LDO,  10, &pmic5_pldo_lv,   "vdd-l10"),
+	RPMH_VREG("ldo11", LDO,  11, &pmic5_nldo,      "vdd-l11"),
+	RPMH_VREG("ldo12", LDO,  12, &pmic5_nldo,      "vdd-l12"),
 	{}
 };
 
 static const struct rpmh_vreg_init_data pm660_vreg_data[] = {
-	RPMH_VREG("smps1",  "smp%s1",  &pmic4_ftsmps426, "vdd-s1"),
-	RPMH_VREG("smps2",  "smp%s2",  &pmic4_ftsmps426, "vdd-s2"),
-	RPMH_VREG("smps3",  "smp%s3",  &pmic4_ftsmps426, "vdd-s3"),
-	RPMH_VREG("smps4",  "smp%s4",  &pmic4_hfsmps3,   "vdd-s4"),
-	RPMH_VREG("smps5",  "smp%s5",  &pmic4_hfsmps3,   "vdd-s5"),
-	RPMH_VREG("smps6",  "smp%s6",  &pmic4_hfsmps3,   "vdd-s6"),
-	RPMH_VREG("ldo1",   "ldo%s1",  &pmic4_nldo,      "vdd-l1-l6-l7"),
-	RPMH_VREG("ldo2",   "ldo%s2",  &pmic4_nldo,      "vdd-l2-l3"),
-	RPMH_VREG("ldo3",   "ldo%s3",  &pmic4_nldo,      "vdd-l2-l3"),
+	RPMH_VREG("smps1", SMPS, 1,  &pmic4_ftsmps426, "vdd-s1"),
+	RPMH_VREG("smps2", SMPS, 2,  &pmic4_ftsmps426, "vdd-s2"),
+	RPMH_VREG("smps3", SMPS, 3,  &pmic4_ftsmps426, "vdd-s3"),
+	RPMH_VREG("smps4", SMPS, 4,  &pmic4_hfsmps3,   "vdd-s4"),
+	RPMH_VREG("smps5", SMPS, 5,  &pmic4_hfsmps3,   "vdd-s5"),
+	RPMH_VREG("smps6", SMPS, 6,  &pmic4_hfsmps3,   "vdd-s6"),
+	RPMH_VREG("ldo1",  LDO,  1,  &pmic4_nldo,      "vdd-l1-l6-l7"),
+	RPMH_VREG("ldo2",  LDO,  2,  &pmic4_nldo,      "vdd-l2-l3"),
+	RPMH_VREG("ldo3",  LDO,  3,  &pmic4_nldo,      "vdd-l2-l3"),
 	/* ldo4 is inaccessible on PM660 */
-	RPMH_VREG("ldo5",   "ldo%s5",  &pmic4_nldo,      "vdd-l5"),
-	RPMH_VREG("ldo6",   "ldo%s6",  &pmic4_nldo,      "vdd-l1-l6-l7"),
-	RPMH_VREG("ldo7",   "ldo%s7",  &pmic4_nldo,      "vdd-l1-l6-l7"),
-	RPMH_VREG("ldo8",   "ldo%s8",  &pmic4_pldo_lv,   "vdd-l8-l9-l10-l11-l12-l13-l14"),
-	RPMH_VREG("ldo9",   "ldo%s9",  &pmic4_pldo_lv,   "vdd-l8-l9-l10-l11-l12-l13-l14"),
-	RPMH_VREG("ldo10",  "ldo%s10", &pmic4_pldo_lv,   "vdd-l8-l9-l10-l11-l12-l13-l14"),
-	RPMH_VREG("ldo11",  "ldo%s11", &pmic4_pldo_lv,   "vdd-l8-l9-l10-l11-l12-l13-l14"),
-	RPMH_VREG("ldo12",  "ldo%s12", &pmic4_pldo_lv,   "vdd-l8-l9-l10-l11-l12-l13-l14"),
-	RPMH_VREG("ldo13",  "ldo%s13", &pmic4_pldo_lv,   "vdd-l8-l9-l10-l11-l12-l13-l14"),
-	RPMH_VREG("ldo14",  "ldo%s14", &pmic4_pldo_lv,   "vdd-l8-l9-l10-l11-l12-l13-l14"),
-	RPMH_VREG("ldo15",  "ldo%s15", &pmic4_pldo,      "vdd-l15-l16-l17-l18-l19"),
-	RPMH_VREG("ldo16",  "ldo%s16", &pmic4_pldo,      "vdd-l15-l16-l17-l18-l19"),
-	RPMH_VREG("ldo17",  "ldo%s17", &pmic4_pldo,      "vdd-l15-l16-l17-l18-l19"),
-	RPMH_VREG("ldo18",  "ldo%s18", &pmic4_pldo,      "vdd-l15-l16-l17-l18-l19"),
-	RPMH_VREG("ldo19",  "ldo%s19", &pmic4_pldo,      "vdd-l15-l16-l17-l18-l19"),
+	RPMH_VREG("ldo5",  LDO,  5,  &pmic4_nldo,      "vdd-l5"),
+	RPMH_VREG("ldo6",  LDO,  6,  &pmic4_nldo,      "vdd-l1-l6-l7"),
+	RPMH_VREG("ldo7",  LDO,  7,  &pmic4_nldo,      "vdd-l1-l6-l7"),
+	RPMH_VREG("ldo8",  LDO,  8,  &pmic4_pldo_lv,   "vdd-l8-l9-l10-l11-l12-l13-l14"),
+	RPMH_VREG("ldo9",  LDO,  9,  &pmic4_pldo_lv,   "vdd-l8-l9-l10-l11-l12-l13-l14"),
+	RPMH_VREG("ldo10", LDO,  10, &pmic4_pldo_lv,   "vdd-l8-l9-l10-l11-l12-l13-l14"),
+	RPMH_VREG("ldo11", LDO,  11, &pmic4_pldo_lv,   "vdd-l8-l9-l10-l11-l12-l13-l14"),
+	RPMH_VREG("ldo12", LDO,  12, &pmic4_pldo_lv,   "vdd-l8-l9-l10-l11-l12-l13-l14"),
+	RPMH_VREG("ldo13", LDO,  13, &pmic4_pldo_lv,   "vdd-l8-l9-l10-l11-l12-l13-l14"),
+	RPMH_VREG("ldo14", LDO,  14, &pmic4_pldo_lv,   "vdd-l8-l9-l10-l11-l12-l13-l14"),
+	RPMH_VREG("ldo15", LDO,  15, &pmic4_pldo,      "vdd-l15-l16-l17-l18-l19"),
+	RPMH_VREG("ldo16", LDO,  16, &pmic4_pldo,      "vdd-l15-l16-l17-l18-l19"),
+	RPMH_VREG("ldo17", LDO,  17, &pmic4_pldo,      "vdd-l15-l16-l17-l18-l19"),
+	RPMH_VREG("ldo18", LDO,  18, &pmic4_pldo,      "vdd-l15-l16-l17-l18-l19"),
+	RPMH_VREG("ldo19", LDO,  19, &pmic4_pldo,      "vdd-l15-l16-l17-l18-l19"),
 	{}
 };
 
 static const struct rpmh_vreg_init_data pm660l_vreg_data[] = {
-	RPMH_VREG("smps1",  "smp%s1",  &pmic4_ftsmps426, "vdd-s1"),
-	RPMH_VREG("smps2",  "smp%s2",  &pmic4_ftsmps426, "vdd-s2"),
-	RPMH_VREG("smps3",  "smp%s3",  &pmic4_ftsmps426, "vdd-s3-s4"),
-	RPMH_VREG("smps5",  "smp%s5",  &pmic4_ftsmps426, "vdd-s5"),
-	RPMH_VREG("ldo1",   "ldo%s1",  &pmic4_nldo,      "vdd-l1-l9-l10"),
-	RPMH_VREG("ldo2",   "ldo%s2",  &pmic4_pldo,      "vdd-l2"),
-	RPMH_VREG("ldo3",   "ldo%s3",  &pmic4_pldo,      "vdd-l3-l5-l7-l8"),
-	RPMH_VREG("ldo4",   "ldo%s4",  &pmic4_pldo,      "vdd-l4-l6"),
-	RPMH_VREG("ldo5",   "ldo%s5",  &pmic4_pldo,      "vdd-l3-l5-l7-l8"),
-	RPMH_VREG("ldo6",   "ldo%s6",  &pmic4_pldo,      "vdd-l4-l6"),
-	RPMH_VREG("ldo7",   "ldo%s7",  &pmic4_pldo,      "vdd-l3-l5-l7-l8"),
-	RPMH_VREG("ldo8",   "ldo%s8",  &pmic4_pldo,      "vdd-l3-l5-l7-l8"),
-	RPMH_VREG("bob",    "bob%s1",  &pmic4_bob,       "vdd-bob"),
+	RPMH_VREG("smps1", SMPS, 1, &pmic4_ftsmps426, "vdd-s1"),
+	RPMH_VREG("smps2", SMPS, 2, &pmic4_ftsmps426, "vdd-s2"),
+	RPMH_VREG("smps3", SMPS, 3, &pmic4_ftsmps426, "vdd-s3-s4"),
+	RPMH_VREG("smps5", SMPS, 5, &pmic4_ftsmps426, "vdd-s5"),
+	RPMH_VREG("ldo1",  LDO,  1, &pmic4_nldo,      "vdd-l1-l9-l10"),
+	RPMH_VREG("ldo2",  LDO,  2, &pmic4_pldo,      "vdd-l2"),
+	RPMH_VREG("ldo3",  LDO,  3, &pmic4_pldo,      "vdd-l3-l5-l7-l8"),
+	RPMH_VREG("ldo4",  LDO,  4, &pmic4_pldo,      "vdd-l4-l6"),
+	RPMH_VREG("ldo5",  LDO,  5, &pmic4_pldo,      "vdd-l3-l5-l7-l8"),
+	RPMH_VREG("ldo6",  LDO,  6, &pmic4_pldo,      "vdd-l4-l6"),
+	RPMH_VREG("ldo7",  LDO,  7, &pmic4_pldo,      "vdd-l3-l5-l7-l8"),
+	RPMH_VREG("ldo8",  LDO,  8, &pmic4_pldo,      "vdd-l3-l5-l7-l8"),
+	RPMH_VREG("bob",   BOB,  1, &pmic4_bob,       "vdd-bob"),
 	{}
 };
 

-- 
2.25.1


