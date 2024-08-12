Return-Path: <linux-arm-msm+bounces-28310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 408DF94EEBF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 15:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E13531F228BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 13:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE5517DE0E;
	Mon, 12 Aug 2024 13:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Yj2AloPi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF7A17C7D9;
	Mon, 12 Aug 2024 13:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723470660; cv=none; b=AOFGHiu8o5OatVeDkhFAMHBChlh/pCeV1j574H3XuzxsbdbTdy/vtx6fqdn+QkeJmBmhtoIjPvBQOY8FsYkmauMze/uEnMoSOV+oiiYRoDVTVSCBs6kJuwWMd9DL/pzh44WfD4R2E4YAXcphzvjschPrWMLkpqouUz6XRe+/uyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723470660; c=relaxed/simple;
	bh=kh/IALq1XQ9m8Te5Ux773w+t6WkY/AsYD0340tkJOZA=;
	h=From:To:Cc:Subject:Date:Message-Id; b=buydWAbAgBbZn3MvQZs7psqtZy/0svOwNPqNQlrhnewdD/Xg+ohCYvYTic4LGAw3haIRVhnYixVQkW8xHTyTzWn7tROjVcXIoOdTNDOL3DhKw8xEUCpOxIkcNUQFMubqeM9pXgvF+4G6EhTEDrR3m2dvAKgs7aASz8MEgKc3CqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Yj2AloPi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47CDSTSo021389;
	Mon, 12 Aug 2024 13:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=930aszK0KEsA
	OOoD/7zM9uY0zZlSEktX16qHqr6eTVM=; b=Yj2AloPi0a1mj0AZyg8rL3m/iH/a
	wtPvK0CoLzAgyO5Zg8gseJgqeXqsnf4KHKHMI36AlIEqGgTonztFPiRUYxTqvhf2
	NchuP3rsM16U1Vquyvpt4kHTCW6QCXHE4aX6dWrzt5ninmt1H34z7szb2yTKW4HY
	+CbHv8fXrRG1aegSiBmq8+VycGyp5YIRyZL/LB3ksS5Jwn31/ayvxgWAr3BcC+0Q
	44nov4uH71+XEuCHn5rY8f/V1yd9pO/DAn9Kw8orGWLz+3HECTqiyxyqUgSR5kUz
	gy0H3gyJJuDgtD+oY4tHhrZWf1dRxa7TmrI6BawwzUd0uF8jaUXL2aCjXA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x1g7vcpf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 13:50:54 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 47CDopkl031196;
	Mon, 12 Aug 2024 13:50:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 40xkmgnukx-1;
	Mon, 12 Aug 2024 13:50:51 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 47CDopmU031190;
	Mon, 12 Aug 2024 13:50:51 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-vnagar-hyd.qualcomm.com [10.213.105.104])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 47CDooES031187;
	Mon, 12 Aug 2024 13:50:51 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 4112864)
	id F3B915012F0; Mon, 12 Aug 2024 19:20:49 +0530 (+0530)
From: Vedang Nagar <quic_vnagar@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_dikshita@quicinc.com,
        quic_vgarodia@quicinc.com, Vedang Nagar <quic_vnagar@quicinc.com>
Subject: [PATCH] clk: qcom: videocc-sm8550: Use HW_CTRL_TRIGGER flag for video GDSC's
Date: Mon, 12 Aug 2024 19:17:52 +0530
Message-Id: <20240812134752.28031-1-quic_vnagar@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TywnR619o4-CE0C-BDSKjxqSob3aM0ez
X-Proofpoint-ORIG-GUID: TywnR619o4-CE0C-BDSKjxqSob3aM0ez
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-12_04,2024-08-12_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408120103
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

The video driver will be using the newly introduced
dev_pm_genpd_set_hwmode() API to switch the video GDSC
to HW/SW control modes at runtime.
Hence use HW_CTRL_TRIGGER flag instead of HW_CTRL for
video GDSC's.

Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
---
 drivers/clk/qcom/videocc-sm8550.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8550.c b/drivers/clk/qcom/videocc-sm8550.c
index 97d150b132a6..7c25a50cfa97 100644
--- a/drivers/clk/qcom/videocc-sm8550.c
+++ b/drivers/clk/qcom/videocc-sm8550.c
@@ -449,7 +449,7 @@ static struct gdsc video_cc_mvs0_gdsc = {
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.parent = &video_cc_mvs0c_gdsc.pd,
-	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | HW_CTRL,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | HW_CTRL_TRIGGER,
 };
 
 static struct gdsc video_cc_mvs1c_gdsc = {
@@ -474,7 +474,7 @@ static struct gdsc video_cc_mvs1_gdsc = {
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.parent = &video_cc_mvs1c_gdsc.pd,
-	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | HW_CTRL,
+	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | HW_CTRL_TRIGGER,
 };
 
 static struct clk_regmap *video_cc_sm8550_clocks[] = {
-- 
2.17.1


