Return-Path: <linux-arm-msm+bounces-28138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBA294B70B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 09:06:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE331B22D35
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 07:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B69B218786F;
	Thu,  8 Aug 2024 07:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QiVmDixD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E570C7464;
	Thu,  8 Aug 2024 07:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723100752; cv=none; b=XBxwdYAEaqAhEKa6iPIRukYbXGqADX6dkxPsNF/qf0de2XlhVgMVBXNdCop7AQEPfksXBCPX1bYelAWSeLm8mnN6jTrxf33dkAA3dpVY6pZPmTV8pxx2ZW9kg65WTijnI4wVEVBT4TXgLBgxwiEfKbrbnvbT91jMphMQMZqO4p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723100752; c=relaxed/simple;
	bh=EzFiZKxPsEQuaNjgeAbYCXjKPTN375hUD2GmtOEBwQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=lCij4oZ28ZLCC5HIVWpb0CPPdP6+pYlHlEkcVmSqFxQelFkpkwz/u540nq+yRSIPELvcc6LgkEyHkMagdKc5aXIU9w/IhRpxMh9iToJonxqexKbR3nGr57GjAFdcEqlj0Tzxu5i9vNwRZjK8xB7cRBsz9Geew4vJAe2Vxcojgls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QiVmDixD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 477JU4Ef015806;
	Thu, 8 Aug 2024 07:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Bdfq9xJH01fnZJ8StpOQr+
	JBpQkW/Z8nW3PQkAdZnGA=; b=QiVmDixDAK3Vtkz/+gUxDGAmgX7QCvjgCHQxbW
	1xyt8uP7wXdlwLELfxBZk7qgzuK2y4oOzRwin/9pjJvx8Om0AkNGNEu0cZ2ndJ4Z
	cC47WsBmXBQuNrNBypAw3i9drGtQcL9xHyb8Tw/e32d/jCAUfNf4VtBE2EcYFTM/
	cgSTKZr0lSwCh012R0c6q70+GNZnwE5FMu5RPdqJ2vj7F/YgUKCMbq8BVckMhgS9
	iWwwIpSfmspZ5TkNxdIpsZWXQcehN1FToApJ8bUjdsompRGBwZqMoNvSaODM+dn4
	LXnvzhObC6GHou64PAm2/5gWOOf6D1AyR88yWHDJYi6UjVQQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40sc4ycvcj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Aug 2024 07:05:15 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 47875Dwh026314
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Aug 2024 07:05:13 GMT
Received: from hu-imrashai-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 8 Aug 2024 00:05:09 -0700
From: Imran Shaik <quic_imrashai@quicinc.com>
Date: Thu, 8 Aug 2024 12:35:02 +0530
Subject: [PATCH] clk: qcom: clk-rpmh: Fix overflow in BCM vote
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240808-clk-rpmh-bcm-vote-fix-v1-1-109bd1d76189@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAB1utGYC/x2MywqAIBAAfyX23IKZB+tXokNuWy090ZAg/Pek4
 wzMvBDYCwdoixc8RwlyHhmqsgBahmNmlDEzaKWNssoibSv6a1/Q0Y7xvBkneZBqY1hXNTXOQW4
 vz1n/365P6QP4cHkSZwAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, David Dai
	<daidavid1@codeaurora.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        "Imran
 Shaik" <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        Mike Tipton <quic_mdtipton@quicinc.com>, <stable@vger.kernel.org>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Zjc-zyJ8TjWMw63AUym1j8hqzkValrC9
X-Proofpoint-GUID: Zjc-zyJ8TjWMw63AUym1j8hqzkValrC9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-08_07,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 mlxlogscore=882 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408080049

From: Mike Tipton <quic_mdtipton@quicinc.com>

Valid frequencies may result in BCM votes that exceed the max HW value.
Set vote ceiling to BCM_TCS_CMD_VOTE_MASK to ensure the votes aren't
truncated, which can result in lower frequencies than desired.

Fixes: 04053f4d23a4 ("clk: qcom: clk-rpmh: Add IPA clock support")
Cc: stable@vger.kernel.org
Signed-off-by: Mike Tipton <quic_mdtipton@quicinc.com>
Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
---
 drivers/clk/qcom/clk-rpmh.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index bb82abeed88f..233ccd365a37 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -263,6 +263,9 @@ static int clk_rpmh_bcm_send_cmd(struct clk_rpmh *c, bool enable)
 		cmd_state = 0;
 	}
 
+	if (cmd_state > BCM_TCS_CMD_VOTE_MASK)
+		cmd_state = BCM_TCS_CMD_VOTE_MASK;
+
 	if (c->last_sent_aggr_state != cmd_state) {
 		cmd.addr = c->res_addr;
 		cmd.data = BCM_TCS_CMD(1, enable, 0, cmd_state);

---
base-commit: 222a3380f92b8791d4eeedf7cd750513ff428adf
change-id: 20240808-clk-rpmh-bcm-vote-fix-c344e213c9bb

Best regards,
-- 
Imran Shaik <quic_imrashai@quicinc.com>


