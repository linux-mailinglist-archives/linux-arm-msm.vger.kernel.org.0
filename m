Return-Path: <linux-arm-msm+bounces-28369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A923195044E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 14:00:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64E04287656
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 12:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D057819412F;
	Tue, 13 Aug 2024 12:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VFz1nV5c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F7F2262B;
	Tue, 13 Aug 2024 12:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723550432; cv=none; b=VHj4e5vzpu+fHozxI9R+8RXubleqvg8BMRSrNwsfzf3Bnw/x40LVLYzxYUoEM2dwSxil4WNl0d3hMsfCZy0Ndg5EzqhvrpRq1R3kgF2VEofE8F7QlEkmJH7zlsFC6zeKa7NVFNcT40Ms81dgthztnYdQH1paRXMYU83etSlkp8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723550432; c=relaxed/simple;
	bh=P2P+IPK8OxVaTbE+VHwERMLUnrzgIBP1sGkCKZ2Re0A=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Qb/tIJZlSjnsqfQQmTojZNcvLxvco3ZDF/8ZMCe+/3NgB2S0Spfm9yHij88QxVNbWy64ouYSI12nX0V9X7z5+sXK6Zx2LvmtzILrVmm4EMMXOPJsJUgeE6DOf7M0H+5mE1YDk/fCL0v8dgoBWpBEu+xc2ox0Hc/fMH3i6HDrlpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VFz1nV5c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47D55Q64022221;
	Tue, 13 Aug 2024 12:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fOmxoSF/1d1Ywg0TZfCBTQ
	F5UTf7/BQy0/K6Nqag4VI=; b=VFz1nV5ca3/z6CIzbOavUpfBpm77MwYS4RP0Km
	LKgmiiIJvsNreQIMuuN5Hn7lvMO/+Nd9k6oud7CQ/DT99iJjsELqeRuq10CV9fVJ
	xlWfyNNSCmVUQBMNUnPHA6wLbMlY1oYa22g6omwX1LqfFeQPjXkks8IRT7+k5NwR
	MrNs45pkZx5O0oe1RJZ7SWmzmqCuaZCgpgYrVqgwIGqkQWw0hta8ZvMcWsrdNaA8
	PnQrosBXkTPgyHXHJ+i44Wukwhzd1Xi0HO6iWPHlnuDBZ4Nav5Yq7v0jGKN/6XBe
	JpdSV7CTZtmOw5YK9wKon8h5CLRXOmj9BpQDq3EjQnO8CKrw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x1g7yhu3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 12:00:26 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47DC0Pjs032627
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 12:00:25 GMT
Received: from hu-c-gdjako-lv.qualcomm.com (10.49.16.6) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 13 Aug 2024 05:00:25 -0700
From: Georgi Djakov <quic_c_gdjako@quicinc.com>
To: <andersson@kernel.org>, <quic_mdtipton@quicinc.com>,
        <quic_viveka@quicinc.com>
CC: <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] clk: qcom: gdsc: Add a flag to skip setting power collapse bits
Date: Tue, 13 Aug 2024 05:00:15 -0700
Message-ID: <20240813120015.3242787-1-quic_c_gdjako@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6EY5uqp18Z8sonNckYy2CGEkqNJOqTa3
X-Proofpoint-ORIG-GUID: 6EY5uqp18Z8sonNckYy2CGEkqNJOqTa3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-13_03,2024-08-13_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=819 mlxscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408130086

The sdm845 platforms have a hardware issue that requires keeping
some of the MMNOC GDSCs in SW collapse mode (which is the power-on
default). But if some driver tries to use these GDSCs and the mode
is updated because of runtime pm calls, we may get a board hang.
Introduce a flag to skip any updates to the power collapse settings
for the impacted GDSCs to avoid unexpected board hangs.

Cc: Mike Tipton <quic_mdtipton@quicinc.com>
Cc: Vivek Aknurwar <quic_viveka@quicinc.com>
Signed-off-by: Georgi Djakov <quic_c_gdjako@quicinc.com>
---
 drivers/clk/qcom/gcc-sdm845.c | 6 +++---
 drivers/clk/qcom/gdsc.c       | 3 +++
 drivers/clk/qcom/gdsc.h       | 1 +
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index dc3aa7014c3e..019b780e31c8 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -3503,7 +3503,7 @@ static struct gdsc hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc = {
 		.name = "hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE,
+	.flags = VOTABLE | SKIP_SET_COLLAPSE,
 };
 
 static struct gdsc hlos1_vote_mmnoc_mmu_tbu_hf1_gdsc = {
@@ -3512,7 +3512,7 @@ static struct gdsc hlos1_vote_mmnoc_mmu_tbu_hf1_gdsc = {
 		.name = "hlos1_vote_mmnoc_mmu_tbu_hf1_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE,
+	.flags = VOTABLE | SKIP_SET_COLLAPSE,
 };
 
 static struct gdsc hlos1_vote_mmnoc_mmu_tbu_sf_gdsc = {
@@ -3521,7 +3521,7 @@ static struct gdsc hlos1_vote_mmnoc_mmu_tbu_sf_gdsc = {
 		.name = "hlos1_vote_mmnoc_mmu_tbu_sf_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = VOTABLE,
+	.flags = VOTABLE | SKIP_SET_COLLAPSE,
 };
 
 static struct clk_regmap *gcc_sdm670_clocks[] = {
diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index fa5fe4c2a2ee..4b83cec9137c 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -121,6 +121,9 @@ static int gdsc_update_collapse_bit(struct gdsc *sc, bool val)
 	u32 reg, mask;
 	int ret;
 
+	if (sc->flags & SKIP_SET_COLLAPSE)
+		return 0;
+
 	if (sc->collapse_mask) {
 		reg = sc->collapse_ctrl;
 		mask = sc->collapse_mask;
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index 1e2779b823d1..6bb7e023a19a 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -68,6 +68,7 @@ struct gdsc {
 #define RETAIN_FF_ENABLE	BIT(7)
 #define NO_RET_PERIPH	BIT(8)
 #define HW_CTRL_TRIGGER	BIT(9)
+#define SKIP_SET_COLLAPSE	BIT(10)
 	struct reset_controller_dev	*rcdev;
 	unsigned int			*resets;
 	unsigned int			reset_count;

