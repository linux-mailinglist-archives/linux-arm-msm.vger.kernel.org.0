Return-Path: <linux-arm-msm+bounces-21767-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 284238FCEED
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 15:19:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF69E1F2947F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 13:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65FA119596A;
	Wed,  5 Jun 2024 12:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q6ShRD4+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7977188CAD;
	Wed,  5 Jun 2024 12:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717591573; cv=none; b=OVwNc8O1VD0DupLhmk9bBrD4MIghU2adQHLxuRuZFcgrQy70JpWv3oyPmdX/kNxodO02MzG1ZFoShvICXSGadDn7uNRSdBYsnqVhgMc0mC7l4+5Z/BI7V0Vekrft5+RY9gsJJO+wwzLdOIRWY0c6lEES/5q3p1Y8tq0Xfxprg3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717591573; c=relaxed/simple;
	bh=Ch3CWjOSmEjNjTZ7SHlJr5S6yjUweCAKcDHefoaSG9M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jAKvKLIn8kHOumNuzMfU3FgtvR6HyAxMosAlGldE4GECHkr+PP0NBLU3jron+rm6rhgbslzdrek1PNyvcd0L5NW+eaqB8L+1E1qyR3n7/hprbUNPaiZvo9cupnHmjZN+lzxSW/V92RdSjOVdLfNQQBzbhdMM/GoBiNUcj/aFKw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q6ShRD4+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 455B1Zbn031042;
	Wed, 5 Jun 2024 12:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TdtnQX3UxdvebW48f7tnydCq4mOF0SfKR6i6gTwXTPw=; b=Q6ShRD4+Dsucax+4
	UBpogMenfCZkF11L0b3sFekhHbvg3b+SRw1LVBsf/7jkpoGAVI7rEqcWLBgqGGpq
	bFpD18GhEXHFt0k1gMHM+Tt78bS5/+QQtgCz+pX9vvhvW7bDKboVXW46V/pIqaOF
	6LmsMcgraTM0rRLwcHeynZNalR70XuQh1Z3yXJPcO+BAP3g4Dpfjac/eEF8eWUoO
	nZ1vDQmbDdB4f552ZxOiz6UIe1SGPnqRHhVDMUFjdj8UUk2C7axIi9ZiC2jJsRX1
	1mL/2+2ATHrsYw9rYtcbwFRjtXIMdEitCmw0/WJpCIfmMsP5J0vTF2BVGbBBwfai
	ozLXIA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yj87rj0ra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 12:46:04 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 455Ck2Hh022087
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Jun 2024 12:46:02 GMT
Received: from luoj-gv.qualcomm.com (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Jun 2024
 05:45:58 -0700
From: Luo Jie <quic_luoj@quicinc.com>
To: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <p.zabel@pengutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_srichara@quicinc.com>
Subject: [PATCH v15 1/4] clk: qcom: branch: Add clk_branch2_prepare_ops
Date: Wed, 5 Jun 2024 20:45:38 +0800
Message-ID: <20240605124541.2711467-2-quic_luoj@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240605124541.2711467-1-quic_luoj@quicinc.com>
References: <20240605124541.2711467-1-quic_luoj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QmZqDMvj5JrJlXHLZDWronzWIEE0bwTt
X-Proofpoint-ORIG-GUID: QmZqDMvj5JrJlXHLZDWronzWIEE0bwTt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 mlxlogscore=889 adultscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406050097

Add the clk_branch2_prepare_ops for supporting clock controller
where the hardware register is accessed by MDIO bus, and the
spin lock can't be used because of sleep during the MDIO
operation.

The clock is enabled by the .prepare instead of .enable when
the clk_branch2_prepare_ops is used.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 drivers/clk/qcom/clk-branch.c | 7 +++++++
 drivers/clk/qcom/clk-branch.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/clk/qcom/clk-branch.c b/drivers/clk/qcom/clk-branch.c
index c1dba33ac31a..229480c5b075 100644
--- a/drivers/clk/qcom/clk-branch.c
+++ b/drivers/clk/qcom/clk-branch.c
@@ -191,3 +191,10 @@ const struct clk_ops clk_branch_simple_ops = {
 	.is_enabled = clk_is_enabled_regmap,
 };
 EXPORT_SYMBOL_GPL(clk_branch_simple_ops);
+
+const struct clk_ops clk_branch2_prepare_ops = {
+	.prepare = clk_branch2_enable,
+	.unprepare = clk_branch2_disable,
+	.is_prepared = clk_is_enabled_regmap,
+};
+EXPORT_SYMBOL_GPL(clk_branch2_prepare_ops);
diff --git a/drivers/clk/qcom/clk-branch.h b/drivers/clk/qcom/clk-branch.h
index f1b3b635ff32..292756435f53 100644
--- a/drivers/clk/qcom/clk-branch.h
+++ b/drivers/clk/qcom/clk-branch.h
@@ -109,6 +109,7 @@ extern const struct clk_ops clk_branch2_ops;
 extern const struct clk_ops clk_branch_simple_ops;
 extern const struct clk_ops clk_branch2_aon_ops;
 extern const struct clk_ops clk_branch2_mem_ops;
+extern const struct clk_ops clk_branch2_prepare_ops;
 
 #define to_clk_branch(_hw) \
 	container_of(to_clk_regmap(_hw), struct clk_branch, clkr)
-- 
2.34.1


