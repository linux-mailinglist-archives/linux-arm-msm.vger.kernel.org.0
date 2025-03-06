Return-Path: <linux-arm-msm+bounces-50483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 610D4A5493A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 12:29:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90A511734F0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 11:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C84A6209F22;
	Thu,  6 Mar 2025 11:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oSPqkvZn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405062063E8;
	Thu,  6 Mar 2025 11:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741260560; cv=none; b=R0W7fzaQB6hqAa/p/yRrVc3tYU/75qDv82F7NQY83P8cfMOZLaYjWQ0Y9LFbzF4K2nlr9Uvu+vzED9+MXJMzxH9DZPUqSFGLOg1iiyHahPfwRinTeL4YHZSF75D2yufaXCI7Rlp5k0lTfztHr14g4Xsd86PFMTSx4JLL6eXlMDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741260560; c=relaxed/simple;
	bh=ElzB3DuPBRiTLKUz/1G4RQ3IeosBY5hIKAZ7kA57ygA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aIK3cQsC1/jWV/ByI9PBZ7vyTf0U6Bpg38c5z7Owwd0E9nNkkAaHxP7XPgD1PqetlmSen7CayYcQBT35nAxdZ94wLt0C8ugBDpFGdOQrXaWr6KtyJiLlX6sMB6xjCV3wWedaS+MPnhNKrVUPLJNM2CqB9M5uYuGImeKNfnBPN10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oSPqkvZn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5267mNcn005530;
	Thu, 6 Mar 2025 11:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2H9MZ+wuyKLTvka/vs+A8B
	rH5oQwxB1fktDD7A9jEj8=; b=oSPqkvZnEkOSkH737o7HzhZHHUJ9eIAWFksuNO
	1aWvhEM75Y0ibcqg1J1BmH85sg78YjsNs5KFS1ndCp3a/YTNeXsrn0G+L8DYLRi9
	3zMaouLOOIQMii8x705uBKLhu17m9Uei5LFMt8xIbE2IIaNP7mXNHPuSHUnJ4HJq
	7pT0MjYvxWaoukx2N662AxoSQWPOismi2tNc2GazzIzttDdNDlGGMDDL+F1Zw60M
	10qVtxbC3qY8kjh03NnocCZ1Pi95hzBSOmRoVUkW4bba8GvHhfIQZQVmJrufBjY+
	ZFx1HeLHVEwRTCEa7wJZvwf2Yq5oIFAtZbM5I6JxI7amZZ9w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4577mx8myj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 11:29:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 526BTDOQ010452
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 11:29:13 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Mar 2025 03:29:10 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <dmitry.baryshkov@linaro.org>, <quic_srichara@quicinc.com>,
        <quic_varada@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1] drivers: clk: qcom: ipq5424: fix the freq table of sdcc1_apps clock
Date: Thu, 6 Mar 2025 16:59:00 +0530
Message-ID: <20250306112900.3319330-1-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oLxJ3pwSi9Wgl_KiwPI4dRIonyJVGN3n
X-Authority-Analysis: v=2.4 cv=cOIaskeN c=1 sm=1 tr=0 ts=67c9870a cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=3yUitucLZDAhSqLVeBgA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: oLxJ3pwSi9Wgl_KiwPI4dRIonyJVGN3n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_05,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060087

The divider values in the sdcc1_apps frequency table were incorrectly
updated, assuming the frequency of gpll2_out_main to be 1152MHz.
However, the frequency of the gpll2_out_main clock is actually 576MHz
(gpll2/2).

Due to these incorrect divider values, the sdcc1_apps clock is running
at half of the expected frequency.

Fixing the frequency table of sdcc1_apps allows the sdcc1_apps clock to
run according to the frequency plan.

Fixes: 21b5d5a4a311 ("clk: qcom: add Global Clock controller (GCC) driver for IPQ5424 SoC")
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
 drivers/clk/qcom/gcc-ipq5424.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq5424.c b/drivers/clk/qcom/gcc-ipq5424.c
index 37b1a3ff8f4e..3d42f3d85c7a 100644
--- a/drivers/clk/qcom/gcc-ipq5424.c
+++ b/drivers/clk/qcom/gcc-ipq5424.c
@@ -640,11 +640,11 @@ static struct clk_rcg2 gcc_qupv3_uart1_clk_src = {
 static const struct freq_tbl ftbl_gcc_sdcc1_apps_clk_src[] = {
 	F(144000, P_XO, 16, 12, 125),
 	F(400000, P_XO, 12, 1, 5),
-	F(24000000, P_XO, 1, 0, 0),
-	F(48000000, P_GPLL2_OUT_MAIN, 12, 1, 2),
-	F(96000000, P_GPLL2_OUT_MAIN, 6, 1, 2),
+	F(24000000, P_GPLL2_OUT_MAIN, 12, 1, 2),
+	F(48000000, P_GPLL2_OUT_MAIN, 12, 0, 0),
+	F(96000000, P_GPLL2_OUT_MAIN, 6, 0, 0),
 	F(177777778, P_GPLL0_OUT_MAIN, 4.5, 0, 0),
-	F(192000000, P_GPLL2_OUT_MAIN, 6, 0, 0),
+	F(192000000, P_GPLL2_OUT_MAIN, 3, 0, 0),
 	F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
 	{ }
 };

base-commit: 7ec162622e66a4ff886f8f28712ea1b13069e1aa
-- 
2.34.1


