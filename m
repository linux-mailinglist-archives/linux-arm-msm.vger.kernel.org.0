Return-Path: <linux-arm-msm+bounces-19232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5592B8BC7B0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 May 2024 08:38:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FBAB28125F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 May 2024 06:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0318F44376;
	Mon,  6 May 2024 06:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hbWw03pc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9433BBE8;
	Mon,  6 May 2024 06:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714977484; cv=none; b=cFwA+RO71izu064e6xMCzvvSf1F1Lou8syCu2H/tr0YrdzCBi8uw1ObZR0HNhh1XTVVTIin4Jgn5mQOv12YPAZz1ZwxeU6tkprcchQjDO5OFl8S1X8r8o4KahycArQxs6Le/GlBKaVQ0DR23skChYOXBZj1p7QvtIkXEJOCuAQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714977484; c=relaxed/simple;
	bh=WkuDHUy0Rpe3/0hm/IOKIERWznsN9LEpDgFyIbLyzGo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AVztglPM9ymnmll5MZG+B1Eu0gua/LiSSa7TmLRRLjHgMnnR4sYlv0Mb1Tjq5qFAwtWJuwYgVghNH1eGEhh648XnzCmR19efkneyLCSI/wS7XAQvuWpGxndxyiMbtpyo77W8rmNjP8Hy00FXnVoAxKu809xwEPHs8r8nmhr4c5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hbWw03pc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4463xesb020582;
	Mon, 6 May 2024 06:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=qcppdkim1; bh=Qkzc1RV3d+RExsQmBI/r
	3vkO3Al2pizB5aSZEMiGVnc=; b=hbWw03pcMQ/nrdRVRVB86n0Zj8wDA8E6wiDj
	oXb7dGFtzY0awJGx9WQqPv9gIh2zO9NXBIg814gHL2CvY6vDW/y8LgICsF9QCjoP
	S2Guo6fecqCyRfLwoGdKhK4VISebM/2CxrCnm4ibfKwlp/E78KjbGN2QnCdsCJ6U
	lejw/9U1SZcgNC0cva1JBDkMkg6hTTBhOpCPyNmeYR5fo4jp04c3uQA3epfXyVn2
	8jYdPyx32FxKToOMU7biuF82hDj8tukBe5MNEi17FjAz+NC9ydUMT5jsdiTTVd1X
	h+TnM42QPUSAUV1L3ZVaCLk+UvPK1x7RqnBvkZdoj6dq4ZoaXA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xwd3yatvj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 06:37:58 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 4466bt0P016397;
	Mon, 6 May 2024 06:37:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3xwe3kdrqv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 06:37:55 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4466bte3016392;
	Mon, 6 May 2024 06:37:55 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-mdalam-blr.qualcomm.com [10.131.36.157])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4466bt6O016390
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 06:37:55 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 466583)
	id 4F4B9414B0; Mon,  6 May 2024 12:07:54 +0530 (+0530)
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        quic_anusha@quicinc.com, bhupesh.sharma@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: quic_mdalam@quicinc.com, quic_srichara@quicinc.com,
        quic_varada@quicinc.com, stable@vger.kernel.org
Subject: [PATCH v2] clk: qcom: gcc-ipq9574: Add BRANCH_HALT_VOTED flag
Date: Mon,  6 May 2024 12:07:51 +0530
Message-Id: <20240506063751.346759-1-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ErExOIK9WA1sqUCg2KsRqpd2IgRHsKFu
X-Proofpoint-GUID: ErExOIK9WA1sqUCg2KsRqpd2IgRHsKFu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-06_03,2024-05-03_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 adultscore=0 clxscore=1011
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405060041

Add BRANCH_HALT_VOTED flag to inform clock framework
don't check for CLK_OFF bit.

CRYPTO_AHB_CLK_ENA and CRYPTO_AXI_CLK_ENA enable bit is
present in other VOTE registers also, like TZ.
If anyone else also enabled this clock, even if we turn
off in GCC_APCS_CLOCK_BRANCH_ENA_VOTE | 0x180B004, it won't
turn off.
Also changes the CRYPTO_AHB_CLK_ENA & CRYPTO_AXI_CLK_ENA
offset to 0xb004 from 0x16014.

Cc: stable@vger.kernel.org
Fixes: f6b2bd9cb29a ("clk: qcom: gcc-ipq9574: Enable crypto clocks")
Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---
Change in [v2]

* Added Fixes tag and stable kernel tag

* updated commit message about offset change

 drivers/clk/qcom/gcc-ipq9574.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq9574.c b/drivers/clk/qcom/gcc-ipq9574.c
index 0a3f846695b8..f8b9a1e93bef 100644
--- a/drivers/clk/qcom/gcc-ipq9574.c
+++ b/drivers/clk/qcom/gcc-ipq9574.c
@@ -2140,9 +2140,10 @@ static struct clk_rcg2 pcnoc_bfdcd_clk_src = {
 
 static struct clk_branch gcc_crypto_axi_clk = {
 	.halt_reg = 0x16010,
+	.halt_check = BRANCH_HALT_VOTED,
 	.clkr = {
-		.enable_reg = 0x16010,
-		.enable_mask = BIT(0),
+		.enable_reg = 0xb004,
+		.enable_mask = BIT(15),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_crypto_axi_clk",
 			.parent_hws = (const struct clk_hw *[]) {
@@ -2156,9 +2157,10 @@ static struct clk_branch gcc_crypto_axi_clk = {
 
 static struct clk_branch gcc_crypto_ahb_clk = {
 	.halt_reg = 0x16014,
+	.halt_check = BRANCH_HALT_VOTED,
 	.clkr = {
-		.enable_reg = 0x16014,
-		.enable_mask = BIT(0),
+		.enable_reg = 0xb004,
+		.enable_mask = BIT(16),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_crypto_ahb_clk",
 			.parent_hws = (const struct clk_hw *[]) {
-- 
2.34.1


