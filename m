Return-Path: <linux-arm-msm+bounces-44530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EB3A07097
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 10:01:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4740B3A78DD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 09:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E642215F6C;
	Thu,  9 Jan 2025 09:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IRHmR80l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0576215F65;
	Thu,  9 Jan 2025 09:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736413206; cv=none; b=sz0ajlAg/GANIG0a4B5W+dScnEvbuwBOyoyRoZKQ/qAMrMpRHw98Hk1/bazbGsp55Xnl50FRi4aX26fRtWIgMHNqQ5001LH4G6KdMZDVuEHKC3xYNdPsK0o1MGFcpM1EwI4cyOmT1z0K+0/luCiaRBCjhqE5/kLOdMDe3l1JzrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736413206; c=relaxed/simple;
	bh=mkSfCc3RbGrAxpsLap3a4bZqY4bEP7216doYt78iWXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=lIHsXDje11tM6EkQMb3YWVU6oPHdeGx63gtnQxXmOVcoBElKebi5dNtqhE0p8VUuP49KplyW+9zN4KlIPeWfaDLW1MRLkYiRh2ENOdVMBcSZ/FPTF2C6zEO71fU3TmDCtE3tVBlKHb3/Y1Q6oMsX4TqvTyEaAq4FFDhKRrsnNXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IRHmR80l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5096qTfR009780;
	Thu, 9 Jan 2025 09:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BVB5kU4owkWssLro8FAZQoVPbNyoFfkeWGX2HuijLew=; b=IRHmR80l7xj7KtMW
	8uIBy9v7+N6CFqWrXbIevrUUbSE4ALVb0BgThniJbJ4VocL5LCypirKaiyTHGQ0w
	2Y40CCSvsile9bVavg+004IsewZD7njR6RtJS5UaN5XkG8rrxbHlGtXBChkYRTJQ
	jIx4pgQ1MBajp0ps/kzmYriRKuMth+xtlk5OBXSqH/EC318pvWaJM+nmfJE77JX8
	3k7vToDHptSURJI6L/pEHba0hjxHkbCF9/DryVCAizrTAVQig/tqRYED0jkygu8H
	lndHnYrnZPRMUkT8utvdCH3yMSuM7oNpCVM2b/VuLhl1ebKYiVQONO0a9HnxlKtY
	de+k+Q==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4429jt89tc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 09:00:01 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 509900DQ021748
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 09:00:00 GMT
Received: from hu-imrashai-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 9 Jan 2025 00:59:55 -0800
From: Imran Shaik <quic_imrashai@quicinc.com>
Date: Thu, 9 Jan 2025 14:27:49 +0530
Subject: [PATCH v4 6/6] clk: qcom: Add support for Video Clock Controller
 on QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250109-qcs8300-mm-patches-new-v4-6-63e8ac268b02@quicinc.com>
References: <20250109-qcs8300-mm-patches-new-v4-0-63e8ac268b02@quicinc.com>
In-Reply-To: <20250109-qcs8300-mm-patches-new-v4-0-63e8ac268b02@quicinc.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TpOJorPFlMGkdNgtvvjlyb8EMLuyAiB2
X-Proofpoint-GUID: TpOJorPFlMGkdNgtvvjlyb8EMLuyAiB2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 phishscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090073

The QCS8300 Video clock controller is a derivative of SA8775P, but has a
minor difference. Hence add support for QCS8300 Video clock controller by
extending the SA8775P VideoCC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


