Return-Path: <linux-arm-msm+bounces-65947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA37B0CA08
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 19:47:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 161993B5241
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 17:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C83E92E3B17;
	Mon, 21 Jul 2025 17:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kE10zkXq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05D92E3AE6;
	Mon, 21 Jul 2025 17:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753119984; cv=none; b=jdGeGAuhxpXuQI6GBW7HSaphPHhXFBV/qR1L5hb1bFh2pmO848p8fpwJA+BRRtQJe99b19WbKsEstPM4zwCCZnueIYCVcp7Fs6ODzkJoh/bRQYYHO+6jwX7rfbe840TwYqj9gbX7493krcyLUDM4RmDDS3J2WTT9jfH8+gmox50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753119984; c=relaxed/simple;
	bh=niVuQ/aAM0lXOMV6ImSG0FP6rQ97RhJ04iJ8bb5S0b0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N3D3N0PVcUok20Qlt8wqnXR6KaCRpd7DPEALbwn0iVQxmNBw9OhdOONQfUf70KA18hNJ39DiBL0DQIApS0gBAnMzAkCM3A4IXCIKH8bcSrVgamQZCPSMImeAPDX6+7ROnbY5VvqLHUU0MItL8QcM3UXMc8qdtyVm6rpdLCMMJKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kE10zkXq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LEeuP6012535;
	Mon, 21 Jul 2025 17:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jmouDg4glwwfoGra5BYSDJah
	XrnQZiV8kk3p4Zyu33k=; b=kE10zkXq07dPTpgdpss/iTpkOQTDSi11ry6BIfJ6
	guI/WIoSKDvVEtm/MsAY2RkYdTbavGXFtynv6DO0vTekT3OFAr5VB4Hou9AU6PT4
	AMINwqPGBhmLoe9MhKZ7Slri1ICnC2uxduCQYyKE92qjPi+Pq9MHFvHxKt3rtWgC
	5XS8/Wziy/1EoTQDqrT00P/qBXDXQQT9O+fN+JLippEUxbI7ACIVYki35Q3EFOA+
	3RrbEKpwEJCiM3v5A3O9lTKCdlbOApazMJFpul9LK7GcZ+Ug8tuxEVojrhJRlj8l
	Ngt7tFiPwOkkXhQEX1Zv9LJF+/cYiNp1d6dk6uWc9vst+Q==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6gw73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Jul 2025 17:46:18 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56LHkHw9014406
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Jul 2025 17:46:17 GMT
Received: from hu-ptalari-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 21 Jul 2025 10:46:11 -0700
From: Praveen Talari <quic_ptalari@quicinc.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby
	<jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Praveen
 Talari" <quic_ptalari@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <dmitry.baryshkov@oss.qualcomm.com>, <bryan.odonoghue@linaro.org>
CC: <psodagud@quicinc.com>, <djaggi@quicinc.com>, <quic_msavaliy@quicinc.com>,
        <quic_vtanuku@quicinc.com>, <quic_arandive@quicinc.com>,
        <quic_cchiluve@quicinc.com>, <quic_shazhuss@quicinc.com>
Subject: [PATCH v7 3/8] soc: qcom: geni-se: Enable QUPs on SA8255p Qualcomm platforms
Date: Mon, 21 Jul 2025 23:15:27 +0530
Message-ID: <20250721174532.14022-4-quic_ptalari@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250721174532.14022-1-quic_ptalari@quicinc.com>
References: <20250721174532.14022-1-quic_ptalari@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=687e7cea cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=ZThKv1m0n57AZib2rGMA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 0273X1JvPV5SmbZ63bGYKUmS1brVkYtb
X-Proofpoint-GUID: 0273X1JvPV5SmbZ63bGYKUmS1brVkYtb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE1MSBTYWx0ZWRfXxt4wCjwARTlR
 2pP/0R8lMRvfD6iEbEcoCbU4xCnRlMGHlRzcglb8EHETWU8CdETA8B3TzD3G5AmuzXQ1k69Cq7j
 P48Uo/tp+OrhnIiHatHgFLMz4vfJA8Avcq6dOE+NNiuiL6MvOYURiRPgaNkst5waTeE92F5NkGD
 aLeVZgvrrU7VDE0OVuk9wJPQc3WfYKJ9haKSgqjZnyP6Ar7iDkY9sZy5qjrVdxCNc2lIYujv1Jf
 12AtSAGc7kzXl0RHEMWaP6QUP7Z7BayRklO4zqaKFxSdlGb/aQdpBPP4JhSkWhmMrh5Ny2bKWRo
 J96cOMgo7GXrEYJihjdJe5LXzqDSgFb+5C6hlKdNNQRGIDepc0ukaF4powd1zVs7PJlLHrUjIJu
 U3cMvUI0cyRJQ0jGrKkPhbDy4AJ0hrEvC3n9NFRlRawHUTOWhM5HKRQ5cyb+nDmqkVB2AQhi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507210151

On the sa8255p platform, resources such as clocks,interconnects
and TLMM (GPIO) configurations are managed by firmware.

Use the `num_clks` field in platform data to distinguish whether
resource control is performed by firmware or directly by the driver
in linux.

Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
---
v6 -> v7
From Bjorn:
- removed resources_init() callback function from platform
  data
- removed geni_se_resource_init() and just add the
  additional expression to the condition
- added sa8255p_qup_desc = {};
- updated commit text based on code changes

v5 -> v6
- replaced dev_err with dev_err_probe
- added a check for desc->num_clks with MAX_CLKS, an error if
  the specified num_clks in descriptor exceeds defined MAX_CLKS.
- removed min_t which is not necessary.
- renamed callback function names to resources_init.
- resolved kernel bot warning error by documenting function
  pointer in geni_se_desc structure.

v3 -> v4
- declared an empty struct for sa8255p and added check as num clks.
- Added version log after ---

v1 -> v2
- changed datatype of i from int to unsigned int as per comment.
---
 drivers/soc/qcom/qcom-geni-se.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 4cb959106efa..3c3b796333a6 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -895,6 +895,7 @@ static int geni_se_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct geni_wrapper *wrapper;
+	const struct geni_se_desc *desc;
 	int ret;
 
 	wrapper = devm_kzalloc(dev, sizeof(*wrapper), GFP_KERNEL);
@@ -906,13 +907,10 @@ static int geni_se_probe(struct platform_device *pdev)
 	if (IS_ERR(wrapper->base))
 		return PTR_ERR(wrapper->base);
 
-	if (!has_acpi_companion(&pdev->dev)) {
-		const struct geni_se_desc *desc;
-		int i;
+	desc = device_get_match_data(&pdev->dev);
 
-		desc = device_get_match_data(&pdev->dev);
-		if (!desc)
-			return -EINVAL;
+	if (!has_acpi_companion(&pdev->dev) && desc->num_clks) {
+		int i;
 
 		wrapper->num_clks = min_t(unsigned int, desc->num_clks, MAX_CLKS);
 
@@ -953,6 +951,8 @@ static const struct geni_se_desc qup_desc = {
 	.num_clks = ARRAY_SIZE(qup_clks),
 };
 
+static const struct geni_se_desc sa8255p_qup_desc = {};
+
 static const char * const i2c_master_hub_clks[] = {
 	"s-ahb",
 };
@@ -965,6 +965,7 @@ static const struct geni_se_desc i2c_master_hub_desc = {
 static const struct of_device_id geni_se_dt_match[] = {
 	{ .compatible = "qcom,geni-se-qup", .data = &qup_desc },
 	{ .compatible = "qcom,geni-se-i2c-master-hub", .data = &i2c_master_hub_desc },
+	{ .compatible = "qcom,sa8255p-geni-se-qup", .data = &sa8255p_qup_desc },
 	{}
 };
 MODULE_DEVICE_TABLE(of, geni_se_dt_match);
-- 
2.17.1


