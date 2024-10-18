Return-Path: <linux-arm-msm+bounces-34949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BE99A3D07
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 13:14:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D4321F225CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 11:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2034920401B;
	Fri, 18 Oct 2024 11:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LKDXb9ul"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B4F20127B;
	Fri, 18 Oct 2024 11:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729250003; cv=none; b=cw2odtgjPTFSWx2JoOQNe2fU5+BQHwUxSH87pizQu3yrRAcPaY1gfawunHAY/hKTLnkUavBBXkDphtf5s54NRT87ecbmaTPsyiIoiT/QLULShXGmUCJTJkv4Iy9wftsqZGmOz/UdTaKmKe2vaIDlQ+vify4u8ukabqM5UtaDUVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729250003; c=relaxed/simple;
	bh=k4rZ40imsAEygLBTe5J0QmS/xB9+x4t22Hk+dbVRrCk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=RTGtxOC58jn3Cr3pvMepvThFm1CbPev69NONbvx4ybSHswlsf+G/D9+yfH0bpboXU8CVN43gn8jmM67LFsoDBQz2gy0kvHQOFAowVAhgkgFQ5tQ+USe4oUvYsyyvor/VFSJsne37YisiYJye7LUdo0L0bh1WBlVbKq27Rmtml38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LKDXb9ul; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I4v78d016585;
	Fri, 18 Oct 2024 11:13:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	73JEBDCxLZfc/Av2g444hWOmVABNunvuaxBMCo63u3s=; b=LKDXb9ulTFHwd/ez
	iSc28SjPrCkpCqASa6GwSsQghqCsRp2cqY9C7WiuCLI1pHjV1Sf0WZOblex+mC2s
	T5p3WGHn7HG8eQRfep0imlLurXJmgelMyr3miepBpEDDa6+92bW7Px+JL0BiTHSS
	8ZrKstpkgGaoh9Ox7kHw384lhxQOpw8D1SDKCu0tbiy7G5hBVoKdiQlFB7K2UCDL
	FSj/4TVpWk8AtWqezsw/YmfCYp8MihhKxdlIhjxdzESnjqK5/s6asjcq26z0vSIG
	Sel6zp0pPYd52scIErBt4X/jOa3YXYIJUtY7SeoEjPp1OlWt4Rowf0sqxZdb6Aj4
	qtwfgw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42bh3p95gu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 11:13:18 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49IBDHom014060
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 11:13:17 GMT
Received: from hu-imrashai-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 18 Oct 2024 04:13:13 -0700
From: Imran Shaik <quic_imrashai@quicinc.com>
Date: Fri, 18 Oct 2024 16:42:34 +0530
Subject: [PATCH 6/6] clk: qcom: Add support for Video Clock Controller on
 QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241018-qcs8300-mm-patches-v1-6-859095e0776c@quicinc.com>
References: <20241018-qcs8300-mm-patches-v1-0-859095e0776c@quicinc.com>
In-Reply-To: <20241018-qcs8300-mm-patches-v1-0-859095e0776c@quicinc.com>
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
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7Y7TQFIXw3gcoQqYhrAgM78wKi3vHRGY
X-Proofpoint-ORIG-GUID: 7Y7TQFIXw3gcoQqYhrAgM78wKi3vHRGY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180071

Add support to the QCS8300 Video clock controller by extending
the SA8775P Video clock controller, which is mostly identical
but QCS8300 has minor difference.

Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
---
 drivers/clk/qcom/videocc-sa8775p.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/videocc-sa8775p.c b/drivers/clk/qcom/videocc-sa8775p.c
index bf5de411fd5d..d0494ba81f5f 100644
--- a/drivers/clk/qcom/videocc-sa8775p.c
+++ b/drivers/clk/qcom/videocc-sa8775p.c
@@ -524,6 +524,7 @@ static struct qcom_cc_desc video_cc_sa8775p_desc = {
 
 static const struct of_device_id video_cc_sa8775p_match_table[] = {
 	{ .compatible = "qcom,sa8775p-videocc" },
+	{ .compatible = "qcom,qcs8300-videocc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, video_cc_sa8775p_match_table);
@@ -550,6 +551,9 @@ static int video_cc_sa8775p_probe(struct platform_device *pdev)
 	clk_lucid_evo_pll_configure(&video_pll0, regmap, &video_pll0_config);
 	clk_lucid_evo_pll_configure(&video_pll1, regmap, &video_pll1_config);
 
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,qcs8300-videocc"))
+		regmap_write(regmap, video_cc_mvs0c_div2_div_clk_src.reg, 2);
+
 	/* Keep some clocks always enabled */
 	qcom_branch_set_clk_en(regmap, 0x80ec); /* VIDEO_CC_AHB_CLK */
 	qcom_branch_set_clk_en(regmap, 0x8144); /* VIDEO_CC_SLEEP_CLK */

-- 
2.25.1


