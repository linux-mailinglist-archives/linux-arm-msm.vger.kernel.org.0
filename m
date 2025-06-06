Return-Path: <linux-arm-msm+bounces-60499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 57124AD07AB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 19:45:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7FAD17A70E8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 17:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F6328C004;
	Fri,  6 Jun 2025 17:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Np5P2jVr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136621D435F;
	Fri,  6 Jun 2025 17:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749231901; cv=none; b=b3Zm4NSLjnhtF3BfZGmBJdW3g5n8B/sJC+Syli0+4UNnXIa/sbQ6A1xhtKei0tAL8w30pbHQ7fzTKmZfOZFqcFN1EMNoISy9xNeY86Ai5GNhjsPS+2QXYhLDaccbaySlcTIJX1NHNu9j3LejS7tcZfOEIJVUabNilHqJ5vFqHDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749231901; c=relaxed/simple;
	bh=03BTYp0hCew3APG3+/xf6oi00M6560JY6uql0eOUp84=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ciSDi2HCTcM53uylo+PM9XGQ2UNwSsGHlqnjvOtZsByX9g9PFClRypqnjcvYbkYWqJ2K1jwexU36VuLHJGa5a2s39onS0Zz8i8SsN4XmmVB853FiUXB4IVrZyyzZFnzdI1xd3X53kJh1WhdQo9Ceo+XVaanKrWnYGMu/1hiHfvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Np5P2jVr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556F9Da9001920;
	Fri, 6 Jun 2025 17:21:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=E1SHzflA2o0mpMZzZEfBQHsT
	N9vhHq/idAZbyCvjvnw=; b=Np5P2jVrzQCc5ckg6rLaYJRsP4v9VOiHuDUZTlVy
	3wuBA2vUWAiac7nZQ25Gwv3oFq0JxhBMnGkS/mS9nUPBQGpOYRSbRBRFqJWT4prt
	E+yEoLuWcnyIuv/4OeEPZL04ysXpjg4Tine//rrcx0WqbVYj6gPX83cBEyWOukio
	4QRkyztdDXpNOpE7UHlkyRhI72WVWNsTTegRxZNirDqnh7o+H/7tIycN0JY5cObH
	oW+A0vdrdDzbQOWJDRweNG27HQ1FnptIm7Q7axRYF4BUL2QsUEJRm1vElxxXothd
	SjKhg1UsSugO6/rapLzMs5FuBoif0366WfJr6wmfZoP4sg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4737me4sc9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 17:21:57 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 556HLur6024493
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Jun 2025 17:21:56 GMT
Received: from hu-ptalari-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 6 Jun 2025 10:21:51 -0700
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
Subject: [PATCH v6 3/8] soc: qcom: geni-se: Enable QUPs on SA8255p Qualcomm platforms
Date: Fri, 6 Jun 2025 22:51:09 +0530
Message-ID: <20250606172114.6618-4-quic_ptalari@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250606172114.6618-1-quic_ptalari@quicinc.com>
References: <20250606172114.6618-1-quic_ptalari@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 02bo1TjJ8bKg6Zg0mRm8XtI2h1rGFuM0
X-Authority-Analysis: v=2.4 cv=GPQIEvNK c=1 sm=1 tr=0 ts=684323b5 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=YhC7SW2_YIdFTIakBAEA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 02bo1TjJ8bKg6Zg0mRm8XtI2h1rGFuM0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDE1MSBTYWx0ZWRfX7eBVNHacv9zN
 K0mocNmZSMofolImv1khdoUdM41gr41Yu395mA9pILXPdD3JfJQKNB8zqXoGxVbQeHsj4fcy0Wq
 5pptgkoFGwUW+kRDJYVM1Lk2i4h2c7jkSCFKkfXCmjNJ+P3aMGjp9PHnY9S1/hdBdvzbc/pMoM2
 M6GrNwCIvjmRIkcVte2uqMDFGM3MCdtsgVI+j4o6sQOHKAFC8YBmTxQWdLvPRGklosJUVDaIh8X
 o84n/s7jsSbA8vemm17hrAHQutjb0FXotEf36cK4bEKT2W1t9JR5ButLyKx5O7S5YoZ0MXqRdvU
 xtH0oD4TJJ2TiQaAJwJa9Z4YL+s1RhNcQvgVd0+BZJd6quuTDwSlEvKP7MCuoNyIaJGE1ifZWo0
 kdUAUazdt7gpmzPz0P96g58FSvmzN/7PD84JEgfbqWRCbpW8NXg4SGvvTNLgdrdWJeLdz7EQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 malwarescore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060151

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
 drivers/soc/qcom/qcom-geni-se.c | 77 +++++++++++++++++++++------------
 1 file changed, 49 insertions(+), 28 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 4cb959106efa..5c727b9a17e9 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -101,10 +101,13 @@ struct geni_wrapper {
  * struct geni_se_desc - Data structure to represent the QUP Wrapper resources
  * @clks:		Name of the primary & optional secondary AHB clocks
  * @num_clks:		Count of clock names
+ * @resources_init:	Function pointer for initializing QUP Wrapper resources
  */
 struct geni_se_desc {
 	unsigned int num_clks;
 	const char * const *clks;
+	int (*resources_init)(struct geni_wrapper *wrapper,
+			      const struct geni_se_desc *desc);
 };
 
 static const char * const icc_path_names[] = {"qup-core", "qup-config",
@@ -891,10 +894,47 @@ int geni_icc_disable(struct geni_se *se)
 }
 EXPORT_SYMBOL_GPL(geni_icc_disable);
 
+static int geni_se_resource_init(struct geni_wrapper *wrapper,
+				 const struct geni_se_desc *desc)
+{
+	struct device *dev = wrapper->dev;
+	int ret;
+	unsigned int i;
+
+	if (desc->num_clks > MAX_CLKS)
+		return dev_err_probe(dev, -EINVAL,
+				     "Too many clocks specified in descriptor:%u (max allowed: %u)\n",
+				     desc->num_clks, MAX_CLKS);
+
+	wrapper->num_clks = desc->num_clks;
+
+	for (i = 0; i < wrapper->num_clks; ++i)
+		wrapper->clks[i].id = desc->clks[i];
+
+	ret = of_count_phandle_with_args(dev->of_node, "clocks", "#clock-cells");
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "invalid clocks property at %pOF\n", dev->of_node);
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
@@ -906,36 +946,12 @@ static int geni_se_probe(struct platform_device *pdev)
 	if (IS_ERR(wrapper->base))
 		return PTR_ERR(wrapper->base);
 
-	if (!has_acpi_companion(&pdev->dev)) {
-		const struct geni_se_desc *desc;
-		int i;
-
-		desc = device_get_match_data(&pdev->dev);
-		if (!desc)
-			return -EINVAL;
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
+	desc = device_get_match_data(&pdev->dev);
 
-		if (ret < wrapper->num_clks) {
-			dev_err(dev, "invalid clocks count at %pOF, expected %d entries\n",
-				dev->of_node, wrapper->num_clks);
+	if (!has_acpi_companion(&pdev->dev) && desc->num_clks) {
+		ret = desc->resources_init(wrapper, desc);
+		if (ret)
 			return -EINVAL;
-		}
-
-		ret = devm_clk_bulk_get(dev, wrapper->num_clks, wrapper->clks);
-		if (ret) {
-			dev_err(dev, "Err getting clks %d\n", ret);
-			return ret;
-		}
 	}
 
 	dev_set_drvdata(dev, wrapper);
@@ -951,8 +967,11 @@ static const char * const qup_clks[] = {
 static const struct geni_se_desc qup_desc = {
 	.clks = qup_clks,
 	.num_clks = ARRAY_SIZE(qup_clks),
+	.resources_init = geni_se_resource_init,
 };
 
+static const struct geni_se_desc sa8255p_qup_desc;
+
 static const char * const i2c_master_hub_clks[] = {
 	"s-ahb",
 };
@@ -960,11 +979,13 @@ static const char * const i2c_master_hub_clks[] = {
 static const struct geni_se_desc i2c_master_hub_desc = {
 	.clks = i2c_master_hub_clks,
 	.num_clks = ARRAY_SIZE(i2c_master_hub_clks),
+	.resources_init = geni_se_resource_init,
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


