Return-Path: <linux-arm-msm+bounces-37128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 383C49BE330
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 10:54:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 694DC1C212CB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 09:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1CEC1DE2BB;
	Wed,  6 Nov 2024 09:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MdaCudAZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359921DACAF;
	Wed,  6 Nov 2024 09:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730886772; cv=none; b=VahqSpbLkSoo8p36zg6d2SiV8s6ASJ5V1RW0w6tk23RNMRKRHWt3g4pNYs7pOd6yDclNFP9cfrNUwHbUIJ70+9Bq8issIzcBQYU+KgHZdAOvcWuZs7olKAMxSgoIu90upKIym0wSQaAfzuOMc3UXOrz9XBx0SwdAjgq2cU/cFro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730886772; c=relaxed/simple;
	bh=U0CCeQzWfP1iBZWhKO83TTCNxQEf04HnQEfAu361c0A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=YKp761GvTjuJZwpD52ylHxKpKxWHd/z8+RjVuxkZFYPz8cnZY/xHd740AAFLPjje/t1+dQdxOhwBkraGkrOCooxLTGkzDpMu9yw0H1wTpAGNAyjmALz/lvM+i1aeZPV2rjtzB5ViFxtny/g+HDzGlpaDEK2jOCuMEZDOmz5Y75U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MdaCudAZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A633lx4023352;
	Wed, 6 Nov 2024 09:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UGetzr5ci6idx8lzYmmDjNdud4UxgLMutcO1FDQc4Ak=; b=MdaCudAZoRAN6sMI
	JHpeBqKOYz8yyxlO/zyShy9eVw6vrK9jhPgKC+hk14kZGjHrCEV6sAX47x+JxaNU
	AVe02/OxLiZxUS8AzVqVAHjjQQ7P5FA7Ldjb3P2KLHXKO8jQK3fJLGcF7neQEYkN
	T8N/D7Y7K//jf5j/6zkfu0QvIB8V0ehcwNYQ0BXWQ0XjSF5LkjXXWCwpCjQXR7fm
	T4/OxCkS+Loqsuempc49/1Ub+/S1o9sCG+9PghAJX/uwdvI7jYCVDVtXq7SM2oKV
	AFqL1OMjTvPTLocMKxKyUMHQEqlbqbm2Qqqq9V6iTSWq6Izob8JC0YgF1tMl5gBw
	+agEug==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42r07hgy06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 09:52:47 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A69qkwJ003221
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Nov 2024 09:52:46 GMT
Received: from hu-imrashai-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 6 Nov 2024 01:52:41 -0800
From: Imran Shaik <quic_imrashai@quicinc.com>
Date: Wed, 6 Nov 2024 15:22:01 +0530
Subject: [PATCH v3 6/6] clk: qcom: Add support for Video Clock Controller
 on QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241106-qcs8300-mm-patches-v3-6-f611a8f87f15@quicinc.com>
References: <20241106-qcs8300-mm-patches-v3-0-f611a8f87f15@quicinc.com>
In-Reply-To: <20241106-qcs8300-mm-patches-v3-0-f611a8f87f15@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ee0COV6AJonHxJDJqcVEnzs3GwwQyNH_
X-Proofpoint-ORIG-GUID: ee0COV6AJonHxJDJqcVEnzs3GwwQyNH_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411060080

Add support to the QCS8300 Video clock controller by extending
the SA8775P Video clock controller, which is mostly identical
but QCS8300 has minor difference.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
---
 drivers/clk/qcom/videocc-sa8775p.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/qcom/videocc-sa8775p.c b/drivers/clk/qcom/videocc-sa8775p.c
index bf5de411fd5d..db492984fd7d 100644
--- a/drivers/clk/qcom/videocc-sa8775p.c
+++ b/drivers/clk/qcom/videocc-sa8775p.c
@@ -523,6 +523,7 @@ static struct qcom_cc_desc video_cc_sa8775p_desc = {
 };
 
 static const struct of_device_id video_cc_sa8775p_match_table[] = {
+	{ .compatible = "qcom,qcs8300-videocc" },
 	{ .compatible = "qcom,sa8775p-videocc" },
 	{ }
 };
@@ -550,6 +551,13 @@ static int video_cc_sa8775p_probe(struct platform_device *pdev)
 	clk_lucid_evo_pll_configure(&video_pll0, regmap, &video_pll0_config);
 	clk_lucid_evo_pll_configure(&video_pll1, regmap, &video_pll1_config);
 
+	/*
+	 * Set mvs0c clock divider to div-3 to make the mvs0 and
+	 * mvs0c clocks to run at the same frequency on QCS8300
+	 */
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,qcs8300-videocc"))
+		regmap_write(regmap, video_cc_mvs0c_div2_div_clk_src.reg, 2);
+
 	/* Keep some clocks always enabled */
 	qcom_branch_set_clk_en(regmap, 0x80ec); /* VIDEO_CC_AHB_CLK */
 	qcom_branch_set_clk_en(regmap, 0x8144); /* VIDEO_CC_SLEEP_CLK */

-- 
2.25.1


