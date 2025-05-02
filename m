Return-Path: <linux-arm-msm+bounces-56566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A629AA7871
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 19:15:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36ED73B19CE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 17:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC911A4F3C;
	Fri,  2 May 2025 17:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KG3IXJgK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFDD262FF6;
	Fri,  2 May 2025 17:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746206108; cv=none; b=NICQClc1BbWqq5q9SipvM0+gpSyu9bRLD0StVKu7xNZIKuQzNNQlTzfDD1q4B+omVbPmjss4P0sozks2jwTjRji8suF6At6yqjo/XEDoiHIbYkZf9N9EgPmSfZFJhTI2vy7cI9GlvjH+olQaznCfgoCpz+/yXGtN5Gb+59DAGf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746206108; c=relaxed/simple;
	bh=kUzXd6wqDQ94/2MstxdWpzOp1AyqpOKavXcnya3XVmM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LNglr+S0UM8dJRxZxNJXVvdk3lyhOOTZwwMqGrXPRUvLBPAGlwzEGWMKTJ2yyB6IsVKN2il1kHLFz4JKfFS+GNlnLBI/45KxgZGjfNqF0luB6iLSa7IfGB6D946lcf7/tQuYBbMczUFv7UW0gIs24ee7eVK/IamEeaFMccmpjk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KG3IXJgK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542Df6ki009422;
	Fri, 2 May 2025 17:15:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zs51gnKIQHLl8yr5BQ1ptroO
	VOpk6oKTX+80sT1I1F4=; b=KG3IXJgKiLtZenRdCUMIhI10JJ4z3Ti0l99gFRjw
	TrRNqOpnMIJz2NrXf+qqAxVhvWdrT1b90jo8QoD7Su7pt43g6xhhpwY2JNKQF1FS
	2a8BeEeKbylbU21xqPi2AGaIkm9tcGvKG4D6dmMfg0Sco5P9j4IZz4hZMrzZN5iJ
	AVij7ERZzqISvcVZJ4nIIa3+gCZn/++NT1PdIwDLlDWpiNdqfNRIJM4gO0JPamux
	D/EkEhVndyI+mgvmDKA/sUApQZNbx52RzMmpt+16MXL5L/sKHv5A/wDi21VeyrVi
	Gnh/L3vIn1HhsaErU+PWGrF1Ca0WivzlDJQGk1q20Af01Q==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ubs0yw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 17:15:01 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 542HF0Fl011175
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 May 2025 17:15:00 GMT
Received: from hu-ptalari-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 2 May 2025 10:14:55 -0700
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
        <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <psodagud@quicinc.com>, <djaggi@quicinc.com>, <quic_msavaliy@quicinc.com>,
        <quic_vtanuku@quicinc.com>, <quic_arandive@quicinc.com>,
        <quic_mnaresh@quicinc.com>, <quic_shazhuss@quicinc.com>
Subject: [PATCH v4 3/8] soc: qcom: geni-se: Enable QUPs on SA8255p Qualcomm platforms
Date: Fri, 2 May 2025 22:44:12 +0530
Message-ID: <20250502171417.28856-4-quic_ptalari@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250502171417.28856-1-quic_ptalari@quicinc.com>
References: <20250502171417.28856-1-quic_ptalari@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: g3Sq3OYFDHJCsgnk28FLNb8vvkxdPgqT
X-Authority-Analysis: v=2.4 cv=bsxMBFai c=1 sm=1 tr=0 ts=6814fd95 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=-8ewQQW4l5uToJikuzQA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDEzNyBTYWx0ZWRfX6CzH+WMwB21q MpsyiXPS8KpKUP1UloG6IPPvy3RNxONTBxaxWuk2OnkP63DhH9Ys10zc/PlJx9JpaNXss5hydzr iww3/b0KC5WbhIi3W/I4DhWs/ylty/mYuRbaq4l7FNRJFdS9CVK5bGi/9Hu+L3p8CcKu3Ycp13K
 /tVzhOtpLevxZy9zKTyPlC3S+hGDcQhOjGxkgV9yRhYI2mvZZwAv8GzpEGm6RiAMXDeydj3rqhx W6gT0rGsPNSI0+h+iYW5Ru0GTPmqAPNaDL3FQL7Oj7IXL6dQ4+hGZy8kW3KxN3Pm3SlfD24duGL c2JqeajTBAM8Q0ZP1l8z94y6aZXvPC3frmUyCCHl0DfVXG6uFzjLNaAdBOXXaqsVjdS617Bj/P/
 CK9BsH4FKdiMqWU5M02SjYh7q/bC0KLkZBHVE0bGuQ6usae5FdYXrDUjyhYtLPsNsvpRM0Fy
X-Proofpoint-ORIG-GUID: g3Sq3OYFDHJCsgnk28FLNb8vvkxdPgqT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020137

On the sa8255p platform, resources such as clocks,interconnects
and TLMM (GPIO) configurations are managed by firmware.

Introduce a platform data function callback to distinguish whether
resource control is performed by firmware or directly by the driver
in linux.

The refactor ensures clear differentiation of resource
management mechanisms, improving maintainability and flexibility
in handling platform-specific configurations.

Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
---
v3 -> v4
- declared an empty struct for sa8255p and added check as num clks.
- Added version log after ---

v1 -> v2
- changed datatype of i from int to unsigned int as per comment.
---
 drivers/soc/qcom/qcom-geni-se.c | 73 ++++++++++++++++++++-------------
 1 file changed, 45 insertions(+), 28 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 4cb959106efa..b6e90bac55fe 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -105,6 +105,8 @@ struct geni_wrapper {
 struct geni_se_desc {
 	unsigned int num_clks;
 	const char * const *clks;
+	int (*geni_se_rsc_init)(struct geni_wrapper *wrapper,
+				const struct geni_se_desc *desc);
 };
 
 static const char * const icc_path_names[] = {"qup-core", "qup-config",
@@ -891,10 +893,44 @@ int geni_icc_disable(struct geni_se *se)
 }
 EXPORT_SYMBOL_GPL(geni_icc_disable);
 
+static int geni_se_resource_init(struct geni_wrapper *wrapper,
+				 const struct geni_se_desc *desc)
+{
+	struct device *dev = wrapper->dev;
+	int ret;
+	unsigned int i;
+
+	wrapper->num_clks = min_t(unsigned int, desc->num_clks, MAX_CLKS);
+
+	for (i = 0; i < wrapper->num_clks; ++i)
+		wrapper->clks[i].id = desc->clks[i];
+
+	ret = of_count_phandle_with_args(dev->of_node, "clocks", "#clock-cells");
+	if (ret < 0) {
+		dev_err(dev, "invalid clocks property at %pOF\n", dev->of_node);
+		return ret;
+	}
+
+	if (ret < wrapper->num_clks) {
+		dev_err(dev, "invalid clocks count at %pOF, expected %d entries\n",
+			dev->of_node, wrapper->num_clks);
+		return -EINVAL;
+	}
+
+	ret = devm_clk_bulk_get(dev, wrapper->num_clks, wrapper->clks);
+	if (ret) {
+		dev_err(dev, "Err getting clks %d\n", ret);
+		return ret;
+	}
+
+	return ret;
+}
+
 static int geni_se_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct geni_wrapper *wrapper;
+	const struct geni_se_desc *desc;
 	int ret;
 
 	wrapper = devm_kzalloc(dev, sizeof(*wrapper), GFP_KERNEL);
@@ -906,36 +942,12 @@ static int geni_se_probe(struct platform_device *pdev)
 	if (IS_ERR(wrapper->base))
 		return PTR_ERR(wrapper->base);
 
-	if (!has_acpi_companion(&pdev->dev)) {
-		const struct geni_se_desc *desc;
-		int i;
+	desc = device_get_match_data(&pdev->dev);
 
-		desc = device_get_match_data(&pdev->dev);
-		if (!desc)
+	if (!has_acpi_companion(&pdev->dev) && desc->num_clks) {
+		ret = desc->geni_se_rsc_init(wrapper, desc);
+		if (ret)
 			return -EINVAL;
-
-		wrapper->num_clks = min_t(unsigned int, desc->num_clks, MAX_CLKS);
-
-		for (i = 0; i < wrapper->num_clks; ++i)
-			wrapper->clks[i].id = desc->clks[i];
-
-		ret = of_count_phandle_with_args(dev->of_node, "clocks", "#clock-cells");
-		if (ret < 0) {
-			dev_err(dev, "invalid clocks property at %pOF\n", dev->of_node);
-			return ret;
-		}
-
-		if (ret < wrapper->num_clks) {
-			dev_err(dev, "invalid clocks count at %pOF, expected %d entries\n",
-				dev->of_node, wrapper->num_clks);
-			return -EINVAL;
-		}
-
-		ret = devm_clk_bulk_get(dev, wrapper->num_clks, wrapper->clks);
-		if (ret) {
-			dev_err(dev, "Err getting clks %d\n", ret);
-			return ret;
-		}
 	}
 
 	dev_set_drvdata(dev, wrapper);
@@ -951,8 +963,11 @@ static const char * const qup_clks[] = {
 static const struct geni_se_desc qup_desc = {
 	.clks = qup_clks,
 	.num_clks = ARRAY_SIZE(qup_clks),
+	.geni_se_rsc_init = geni_se_resource_init,
 };
 
+static const struct geni_se_desc sa8255p_qup_desc;
+
 static const char * const i2c_master_hub_clks[] = {
 	"s-ahb",
 };
@@ -960,11 +975,13 @@ static const char * const i2c_master_hub_clks[] = {
 static const struct geni_se_desc i2c_master_hub_desc = {
 	.clks = i2c_master_hub_clks,
 	.num_clks = ARRAY_SIZE(i2c_master_hub_clks),
+	.geni_se_rsc_init = geni_se_resource_init,
 };
 
 static const struct of_device_id geni_se_dt_match[] = {
 	{ .compatible = "qcom,geni-se-qup", .data = &qup_desc },
 	{ .compatible = "qcom,geni-se-i2c-master-hub", .data = &i2c_master_hub_desc },
+	{ .compatible = "qcom,sa8255p-geni-se-qup", .data = &sa8255p_qup_desc },
 	{}
 };
 MODULE_DEVICE_TABLE(of, geni_se_dt_match);
-- 
2.17.1


