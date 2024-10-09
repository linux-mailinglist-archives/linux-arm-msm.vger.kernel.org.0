Return-Path: <linux-arm-msm+bounces-33723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0449996FA4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 17:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10D281F21937
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 15:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F521A2630;
	Wed,  9 Oct 2024 15:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ieyltvha"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1359199EBB;
	Wed,  9 Oct 2024 15:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728487042; cv=none; b=tmvrugcPoj3za8hM0OFB2xioslembSPWPgPKOv9hkWjblsrn0MgRqgOewHTwckMiFhtX4nq9yuw/gYM+4Cu+Tmt35dzpx4Tg7RNhigSdYaowzoM0+e7UFgA/19E4fyZxgvIGwIRoNNYdMYQYdRYsXqfd9zG0FDBGftTvQ0SHzaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728487042; c=relaxed/simple;
	bh=WLojZZYXzfe5edF9vk2kQJor7cJAz9LslNX0G2dll9M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uHWP1+v0lSBohA7C/dgVGvMjoi/CITYd11prHHEXp4LQS1wR/jL+kxxV8zaDzw72YZGDgX/Znt5B5ZzsDcZO3Y8RTWUXU+1cQ8TKfrreSnpjWN8P39yUgA0PrQyWa64dBk6jveQKR/PGJ+c0HDqEe36PN2hxR5MPgDCRWBSs/5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ieyltvha; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 499EDuAo029264;
	Wed, 9 Oct 2024 15:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rnjpDLptlJg6UhO6AX9ItO
	4+PywHkmUkQrE1B6tEy+g=; b=ieyltvhaPkBOLGduck8iY4B6PEM+r2xchzS4N4
	dr/fSQ41mHQDAgn1H5g8j5gZyhDm7CJcIFdWH9LBOWupa2vcNF1YGnEp3nLWpRRh
	IcAsezpgVHM2ZWpkO3UKGBLIRWUs8ji5ybZS4b0eJyUn5RUSnbZ1Y4eq68z3GUSb
	8JPA4QjG/chTbEKq/PqVcp1Y901lRlwimYQ0gBiAApoGjeNZdIArqFASdUo5CMPV
	wTY2vtoQSdsspgFTDgeQO7Xq0Do+x4bXdzB0kGF9Q5LjL82xx3Z8+I9im9il0Hn+
	YIA1Dz6ku2jEWuK+9bzjbT6tI+x/4wWklT+jiRyQ/iBWqdYg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424yj0591x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 15:17:06 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 499FH5FS013598
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Oct 2024 15:17:05 GMT
Received: from hu-c-gdjako-lv.qualcomm.com (10.49.16.6) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 9 Oct 2024 08:17:05 -0700
From: Georgi Djakov <quic_c_gdjako@quicinc.com>
To: <andersson@kernel.org>
CC: <sboyd@kernel.org>, <mturquette@baylibre.com>, <quic_mdtipton@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <djakov@kernel.org>
Subject: [PATCH v2] clk: qcom: gdsc: Add a flag to skip setting power collapse bits
Date: Wed, 9 Oct 2024 08:16:57 -0700
Message-ID: <20241009151657.1041691-1-quic_c_gdjako@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WIyPBUHUON1ykk4W1I6ykzSvYVIwmc04
X-Proofpoint-ORIG-GUID: WIyPBUHUON1ykk4W1I6ykzSvYVIwmc04
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=989 mlxscore=0 adultscore=0 clxscore=1011
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410090095

The sdm845 platforms have a hardware issue that requires keeping
some of the MMNOC GDSCs in SW collapse mode (which is the power-on
default). But if some driver tries to use these GDSCs and the mode
is updated because of runtime pm calls, we may get a board hang.
Introduce a flag to skip any updates to the power collapse settings
for the impacted GDSCs to avoid unexpected board hangs.

Fixes: 7bb38c20f2b6 ("arm64: dts: qcom: sdm845: Add DT nodes for the TBUs")
Reviewed-by: Mike Tipton <quic_mdtipton@quicinc.com>
Signed-off-by: Georgi Djakov <quic_c_gdjako@quicinc.com>
---
v2:
- Pick up Reviewed-by tag
- Add Fixes tag

v1: https://lore.kernel.org/r/20240813120015.3242787-1-quic_c_gdjako@quicinc.com/ 

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

