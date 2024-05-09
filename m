Return-Path: <linux-arm-msm+bounces-19580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDD08C0E96
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 12:54:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BD8C281E68
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 10:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B75D712FF71;
	Thu,  9 May 2024 10:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eDsOq3NB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FA814A8C;
	Thu,  9 May 2024 10:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715252065; cv=none; b=A4Ozjq2b5dFF1djS2ezou+iz86TFIXydUyzv6sN8FAePAJ0kHxKtDuireuk6a4NwuYa3eGgnmnYQ46U8DVr1BDSqY1nik0Ly6zS6+iEb8S2iB5dtf9rSR0knoDxE82kgLdCJcSe/n/B6q2TrwuuuUZ3S7Lb1xqPTbRHSPHKLEpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715252065; c=relaxed/simple;
	bh=GhAkWlfDq0KUJdDXBafOgj0BDEHLVL5It8am1v+i5SY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bbeZBrmnRch10pkSzQmJYN76MbsjK6KPbCMiAvJBuOWes1HP8MTyh9hdURjJXjgXfnb766D1XKtcFo0oipZjGMIdVYf2pGe4aXOATVQ9SVxLPqOjMT4bpYWKifA/N5lwqXNXlIli1Co5G9qcTtVvoRa0P4XUyhEfULXqc0g62TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eDsOq3NB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4490t8F8006648;
	Thu, 9 May 2024 10:54:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=qcppdkim1; bh=K0DS4Wi6YJock2WlpckO
	IAjEvBVRpuyG1EjlTD3n45s=; b=eDsOq3NBom7+cZzuIogVbrZJmle7hjTyMhkF
	36t+y2Y6uqZNlORvA/0IfCPnOoXS1tqI00ByvfBbU7/7649ZUI8gu7FSLwkP81RA
	BsYswzRo6LypIVRiA5peJyV6jeWIOAPIdOX4Fj8xEIG/Dkm3MGM3MesBK7/NGwB3
	DU5df1bIEP5NZzDY+I/DnjTaZGqA0tXqke87sq+eew570/oAz+3mQt9eR0zbg8d7
	76LzAvsh2GpPJAlRlTNVdhhCKN9KurojsThsr/YwAqs8Ni6vZ6BLhUMQ3BfIOrmM
	smMzmk+BrZFgZBEo0oML5Y+ugQ4tD7hoOIZq7aNv6jNJHX7KYA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y07wftnee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 10:54:19 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 449AsF9L000679;
	Thu, 9 May 2024 10:54:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3xwe3kn449-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 10:54:15 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 449AsESm000670;
	Thu, 9 May 2024 10:54:14 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-mdalam-blr.qualcomm.com [10.131.36.157])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 449AsEqZ000666
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 10:54:14 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 466583)
	id B3AC1412F1; Thu,  9 May 2024 16:24:13 +0530 (+0530)
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        bhupesh.sharma@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com,
        quic_mdalam@quicinc.com, stable@vger.kernel.org
Subject: [PATCH v3] clk: qcom: gcc-ipq9574: Add BRANCH_HALT_VOTED flag
Date: Thu,  9 May 2024 16:24:05 +0530
Message-Id: <20240509105405.1262369-1-quic_mdalam@quicinc.com>
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
X-Proofpoint-GUID: 0DJkuBkjxvMN1bALeppFh6gZm8PjRNNG
X-Proofpoint-ORIG-GUID: 0DJkuBkjxvMN1bALeppFh6gZm8PjRNNG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-09_06,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405090071

The crypto_ahb and crypto_axi clks are hardware voteable.
This means that the halt bit isn't reliable because some
other voter in the system, e.g. TrustZone, could be keeping
the clk enabled when the kernel turns it off from clk_disable().
Make these clks use voting mode by changing the halt check to
BRANCH_HALT_VOTED and toggle the voting bit in the voting register
instead of directly controlling the branch by writing to the branch
register. This fixes stuck clk warnings seen on ipq9574 and saves
power by actually turning the clk off.

Also changes the CRYPTO_AHB_CLK_ENA & CRYPTO_AXI_CLK_ENA
offset to 0xb004 from 0x16014.

Cc: stable@vger.kernel.org
Fixes: f6b2bd9cb29a ("clk: qcom: gcc-ipq9574: Enable crypto clocks")
Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---
Change in [v3]

* Updated commit message

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


