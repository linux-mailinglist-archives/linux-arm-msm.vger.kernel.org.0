Return-Path: <linux-arm-msm+bounces-2862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD0D80078A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 10:51:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2818E1C20756
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 09:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C72481E51D;
	Fri,  1 Dec 2023 09:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OfX8D6Ol"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 892CA170D;
	Fri,  1 Dec 2023 01:51:07 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B19W1Q0015381;
	Fri, 1 Dec 2023 09:50:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=WFLYfX+LyYJ6QVe4Q1/+gTF/6c882WUnjs7t2bRQoBk=;
 b=OfX8D6OlKOpwmTpcchUNd82qxQ0eJ1oSfVluSj4xNKcwXuFuA1ogZYm5eTA6b9Y3Ojgc
 dDXxiQJqU5w+Hn8O6HGF9JDs9hjYv9NTSQQ4MJt53mSWE3VR3vPttlKop4nT3QYej9XJ
 ya9Iybh7VWIx5dcvgh3s8MV+Gb2nIMXeitgoufUkIJhN8bjajwFB4FWKwYAQaccjHkis
 +tljn8BWphOx9GelBTJDf4uaqKfsKlozhZ9WvxYfKAeluT17RhT2nV2PgPc0aVTeZflb
 O8yhGp3pzA0rYYzTHshqqEadxrPzKRgb9htIGQ/j+qIqGaGOuvVjIP/XlDxgkGfNknoc HQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3upw12tbvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 09:50:54 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B19orfZ006804
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Dec 2023 09:50:53 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 1 Dec 2023 01:50:48 -0800
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Date: Fri, 1 Dec 2023 15:20:27 +0530
Subject: [PATCH v3 4/4] clk: qcom: videocc-sm8150: Add runtime PM support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231201-videocc-8150-v3-4-56bec3a5e443@quicinc.com>
References: <20231201-videocc-8150-v3-0-56bec3a5e443@quicinc.com>
In-Reply-To: <20231201-videocc-8150-v3-0-56bec3a5e443@quicinc.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Marek <jonathan@marek.ca>
CC: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>
X-Mailer: b4 0.12.4
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: syiUyzuHoWTiqdwhGtVfh99d6hDaAp-V
X-Proofpoint-ORIG-GUID: syiUyzuHoWTiqdwhGtVfh99d6hDaAp-V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_07,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2312010065

Add runtime PM support to ensure the supply rails are enabled
when necessary.

Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
 drivers/clk/qcom/videocc-sm8150.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8150.c b/drivers/clk/qcom/videocc-sm8150.c
index 52a9a453a143..f1456eaa87c4 100644
--- a/drivers/clk/qcom/videocc-sm8150.c
+++ b/drivers/clk/qcom/videocc-sm8150.c
@@ -6,6 +6,7 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,videocc-sm8150.h>
@@ -240,17 +241,32 @@ MODULE_DEVICE_TABLE(of, video_cc_sm8150_match_table);
 static int video_cc_sm8150_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
+	int ret;
+
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret)
+		return ret;
 
 	regmap = qcom_cc_map(pdev, &video_cc_sm8150_desc);
-	if (IS_ERR(regmap))
+	if (IS_ERR(regmap)) {
+		pm_runtime_put_sync(&pdev->dev);
 		return PTR_ERR(regmap);
+	}
 
 	clk_trion_pll_configure(&video_pll0, regmap, &video_pll0_config);
 
 	/* Keep VIDEO_CC_XO_CLK ALWAYS-ON */
 	regmap_update_bits(regmap, 0x984, 0x1, 0x1);
 
-	return qcom_cc_really_probe(pdev, &video_cc_sm8150_desc, regmap);
+	ret = qcom_cc_really_probe(pdev, &video_cc_sm8150_desc, regmap);
+
+	pm_runtime_put_sync(&pdev->dev);
+
+	return ret;
 }
 
 static struct platform_driver video_cc_sm8150_driver = {

-- 
2.25.1


