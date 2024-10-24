Return-Path: <linux-arm-msm+bounces-35693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 244E39AE6C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 15:37:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C469D1F2782A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 13:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E602F1FBF4F;
	Thu, 24 Oct 2024 13:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="H6lZmS94"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFC01F667E;
	Thu, 24 Oct 2024 13:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729776730; cv=none; b=QRlxPmfX6wE1goEfTo9WUegGU/b+gLmXqA99MvXnz6z8l4T7vIHoo/8RIZV5XKfGbMoKW1M8ST17zWPwLzXjyKUa0/jWxHNAGU0f6bUVL1r299/9fkNY6KP+K+XfTk6y5fGmfmHIBz6KvUj55ofNrsNKygTZ/ZEfcjLjjlp4Egc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729776730; c=relaxed/simple;
	bh=Mn2pmr6wwJiDzx8Q+vyNXKeaGJlP9Z5kxfsmkd+Ur1Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=nPpM/dhUWIcXZgWK8GbWOftBwVWUZymlEykEBbYdT9959V93tCcSl2mP+plcEWKduaFWW0tlqyIaTJMLjW1NfwKOcAV6hJfBGTULyZ8i0suahhQJ1iRoDuFleoVhP8pKJu4ecP+4WioD6ON0HPXB0T6/jtwfcPJYiWc7/PGk7EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=H6lZmS94; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49O9aJeJ028304;
	Thu, 24 Oct 2024 13:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZtMlp4gGjKBW6FEZSa2ElwA4XN8uyE3U9LyxPPYzKiI=; b=H6lZmS947vbQ2sgJ
	2lCXgGmmBn6VUVLj1ozFz/C2WU1woQ4entH57AwUx2yjPzaVNq+Av886d0Umv0KU
	Gu/QQCPJycPVRsYe6Vo+v/NM454CK4afZjXx6ELQW1Lzz36wXmXQZmGhbBEskjYB
	S/mbbG+RNSnYQkhrkt2T4oWhbmw//S00mBVLJRPg47fSNiXVa7gfMZsH683pGcMO
	EDrujaTwioW8Rxshwy2fsTp9QryDLUl0CDfLJ4t1u22KM4mHH2o/rmZbzzL3QEEG
	Ei215/+CWO2Uzr7OGAdktecujm59Wqy5HQENhOpV8hK1cLgCoc6ZWa4cGVHMMBUg
	f0pVog==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em41wr25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 13:32:05 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49ODW4K3011643
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 13:32:04 GMT
Received: from hu-imrashai-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Oct 2024 06:32:00 -0700
From: Imran Shaik <quic_imrashai@quicinc.com>
Date: Thu, 24 Oct 2024 19:01:19 +0530
Subject: [PATCH v2 6/6] clk: qcom: Add support for Video Clock Controller
 on QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241024-qcs8300-mm-patches-v2-6-76c905060d0a@quicinc.com>
References: <20241024-qcs8300-mm-patches-v2-0-76c905060d0a@quicinc.com>
In-Reply-To: <20241024-qcs8300-mm-patches-v2-0-76c905060d0a@quicinc.com>
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
        Imran Shaik <quic_imrashai@quicinc.com>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ceIQ2rEd0lUguhqMY5t8TUoA8Qz6iBE5
X-Proofpoint-ORIG-GUID: ceIQ2rEd0lUguhqMY5t8TUoA8Qz6iBE5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410240110

Add support to the QCS8300 Video clock controller by extending
the SA8775P Video clock controller, which is mostly identical
but QCS8300 has minor difference.

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


