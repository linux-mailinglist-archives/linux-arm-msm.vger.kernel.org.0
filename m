Return-Path: <linux-arm-msm+bounces-40626-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF3D9E6067
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 23:22:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D34528411C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 22:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD4D21C3C1F;
	Thu,  5 Dec 2024 22:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="askbjCWr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8BC1BBBF1;
	Thu,  5 Dec 2024 22:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733437332; cv=none; b=NouVG7UUc09h6oLgxw9x0zgsgUQLEY/ayTXOPE3Zd6Cy7LwWpIMAmUK5UQw5MK6e6bOTgPkyT6jtfcCNykuAwj9I1/1bUemxp8J40XdIRpmOKOVd8ZERy4GaJU5jvVZs4OhcTvN2W0JvFgWlXY1m2rpM9AzKiXCr4B7b3tm9uZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733437332; c=relaxed/simple;
	bh=t82vRrD6unr/xrJVlts5wpsmomQrJ3XxRMWJ6iiZEKY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CnV44ioX1cK7Qq6MRtFQfIArAgFfW3oqyIcW9tM2BqSZfGLFdgTzv/3w44gQbb7HU80U9aa43IzFoaxMLzPwZ0e/SGoFeSm7fGlsC30POzygB5XxvfYpKwXxpkZXPn8HdOJGOo/d6llRtpNzQtDn2OLb0vBOqw7rtDM9dJvKJU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=askbjCWr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaNKh003810;
	Thu, 5 Dec 2024 22:22:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oEHKbVwkFtPhnMCvlskLSf
	JguaxofIzLV8n80Bz4s3A=; b=askbjCWrU2O1LIIaqAlu8AfhvDOrgN79lRc0ws
	NiTftRIylVa+d5ndiYHJ/cgu+FpY6kPhjr+A6R9/IP2xN5cHxAz62KLNZGFB1A/n
	U0kFP8N/9kEvAj2DS8hLBTln3PYDkEb2vlfKnkW2zJtrMDB0FgPEkKgyuVhykBix
	xQ1fKM/zIXJr8HiKWZUqUHPx8OlgXg8OmTonlQSQnjKj2VHF/J8JH9YNx4hFDbDI
	6yWN05ThnOZJTcZDgktqcPbDy53uS+ben3EbZqH/8vHu8+HHjpL+zkrtySM2YeTO
	LdtKmD4Rnbva2N+cKqrw/pOSqnzA41E+jkrSqHO4kuWj19Jw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bbqm1hy2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 22:22:06 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B5MM6OY028834
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 22:22:06 GMT
Received: from hu-c-gdjako-lv.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 14:22:05 -0800
From: Georgi Djakov <quic_c_gdjako@quicinc.com>
To: <andersson@kernel.org>
CC: <sboyd@kernel.org>, <mturquette@baylibre.com>, <quic_mdtipton@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <djakov@kernel.org>
Subject: [PATCH v3] clk: qcom: gdsc: Add a flag to skip setting power collapse bits
Date: Thu, 5 Dec 2024 14:21:56 -0800
Message-ID: <20241205222156.1880299-1-quic_c_gdjako@quicinc.com>
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
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UCQxtff08_J3EJV2FNb8Vu1hkXK5TRad
X-Proofpoint-ORIG-GUID: UCQxtff08_J3EJV2FNb8Vu1hkXK5TRad
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 impostorscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050166

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
v3:
- No changes

v2: https://lore.kernel.org/r/20241009151657.1041691-1-quic_c_gdjako@quicinc.com/
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

