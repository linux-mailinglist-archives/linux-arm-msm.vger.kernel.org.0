Return-Path: <linux-arm-msm+bounces-28213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BD894C999
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 07:22:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3001286517
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 05:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E789916B75D;
	Fri,  9 Aug 2024 05:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jyL2/9i1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C60282F0;
	Fri,  9 Aug 2024 05:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723180933; cv=none; b=ECL1Gjo3k7GiqW9mao8L/1IsAXSWoprMtSY4/iCptN+GFMeL6yISsMZ9A+Qc7ydWVAA9l2kXu6uXoViU/TcxCXYZLvookBgfU+Cc3bCqEqdejSzpNYs3OTpLN5Iwdyk51l2fIMpSFb7hcWBJjptvM4VwUSF9gPH6clNfQ1tLyvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723180933; c=relaxed/simple;
	bh=JvOLaecZ6/wsk0EIouw/DBP1IpZZwPqkBTPZZarJhh8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=HlLwIGpVmgVw9OaWQlV/DC3E/KNDvEHjdN0q12amzY/OVmq7CF5V7UYsrwZZlFkOhwY+DBpc9lHcoWFZy3KuPhVlt/GMCg4jjM6z8v6CKYT2D1N+QWgdsWqQKKWlD/13B2hiFBpajtXRMLxmk9KYzUcgJIGuQGWWCSM3G3Obokw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jyL2/9i1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4792C0AH018254;
	Fri, 9 Aug 2024 05:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vgjOwZsv29O73iMiccloce
	mLGyRQiH00Tu1ZAHvgA7w=; b=jyL2/9i10bGpDbU7WmpuhXP9rQVzktH0HMzqBt
	EfrGkficmq5kftNNoSi3gOioFF1yRLCL/l19scshwa3eWanVxeiOc20582pUOcTJ
	LXeEjxFeqBoeTUI3wgL1RZot4Hh/dkhVA5ZZUlVssylocDHziQ0n7Uzxl9dZWzoN
	5eKZVLrznwZ+de404T09aP2ujOI3MqbQmbt0DeqwwZ7uGhWX+tvM7aabin0HL6ea
	XAxl3mMwLWzm0XfHkqA1pryMBpdCdO7XdZ/ROZZDfCnqJjY2Iq/ijOb3dY3rWqk6
	pOVsFsWDnu4A9xuF77xkhM8lx73Z3g45aIzoqK2bDDM1txfw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40vvgm2cpn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Aug 2024 05:21:45 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4795Lich027385
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 Aug 2024 05:21:44 GMT
Received: from hu-imrashai-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 8 Aug 2024 22:21:40 -0700
From: Imran Shaik <quic_imrashai@quicinc.com>
Date: Fri, 9 Aug 2024 10:51:29 +0530
Subject: [PATCH v2] clk: qcom: clk-rpmh: Fix overflow in BCM vote
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240809-clk-rpmh-bcm-vote-fix-v2-1-240c584b7ef9@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAFintWYC/4WNQQ6CMBBFr0Jm7Zi2NAquuIdhYYdRJgrFFhsN4
 e5WLmD+6v3kv79A5CAc4VQsEDhJFD9mMLsCqL+MN0bpMoNRxqpKVUiPO4Zp6NHRgMnPjFd5I5X
 WstEl1c5B3k6Bc715z23mXuLsw2e7SfrX/jMmjTmqdp3ujgdd1c3zJSQj7ckP0K7r+gUsvtJPv
 AAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, David Dai
	<daidavid1@codeaurora.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        "Taniya Das" <quic_tdas@quicinc.com>,
        Jagadeesh Kona
	<quic_jkona@quicinc.com>,
        "Satya Priya Kakitapalli"
	<quic_skakitap@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Mike
 Tipton <quic_mdtipton@quicinc.com>, <stable@vger.kernel.org>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: RKsShHV4ItIn-ljewABmXu63RtrLfyUO
X-Proofpoint-GUID: RKsShHV4ItIn-ljewABmXu63RtrLfyUO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-09_02,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408090039

From: Mike Tipton <quic_mdtipton@quicinc.com>

Valid frequencies may result in BCM votes that exceed the max HW value.
Set vote ceiling to BCM_TCS_CMD_VOTE_MASK to ensure the votes aren't
truncated, which can result in lower frequencies than desired.

Fixes: 04053f4d23a4 ("clk: qcom: clk-rpmh: Add IPA clock support")
Cc: stable@vger.kernel.org
Signed-off-by: Mike Tipton <quic_mdtipton@quicinc.com>
Reviewed-by: Taniya Das <quic_tdas@quicinc.com>
Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
---
Changes in v2:
- Updated the overflow check as per the comment from Stephen.
- Link to v1: https://lore.kernel.org/r/20240808-clk-rpmh-bcm-vote-fix-v1-1-109bd1d76189@quicinc.com
---
 drivers/clk/qcom/clk-rpmh.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index bb82abeed88f..4acde937114a 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -263,6 +263,8 @@ static int clk_rpmh_bcm_send_cmd(struct clk_rpmh *c, bool enable)
 		cmd_state = 0;
 	}
 
+	cmd_state = min(cmd_state, BCM_TCS_CMD_VOTE_MASK);
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


