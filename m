Return-Path: <linux-arm-msm+bounces-24076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD2A915F70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 09:07:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC2431C22C69
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 07:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFDA614831D;
	Tue, 25 Jun 2024 07:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L1YxWDoJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6752D148304;
	Tue, 25 Jun 2024 07:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719299178; cv=none; b=hFBsvKwZhGiGzsQYbV4Hby9dOrh98trz5pvwa4SzCceZzW1UdNxhjAyhTAeezHoUVkSge6wH9FnbZlYVyCiWVwc7XH5JT3uFFHe+amMcW4hf4jhAmH4M0kmmDxcAudrvhtj0R3LfvpVdFIbvIjp0QGCpqWRbmvrO9+XH0fBGJtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719299178; c=relaxed/simple;
	bh=J1Xh8wHY5KHGAkvT5bUawwrn1B2sOQYa4yFvZGxHdzY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tleyK3sGTgS77deD3cGJRsBRlGHcsV2HgAry2JfbvLz1EbQxRnTL+khSfQpEnBNCmxaO/f8dNgk2w3hDtkxqcu4fPp/yQPl2yxZIglO4m9ug9wrQYiMWBLQO8ywtETmu4nw4gZTA8Err8Ro5cS71/oUbT3K8M47Vx0icnFxo99U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L1YxWDoJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45OJaDl4018110;
	Tue, 25 Jun 2024 07:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wR+tGUgXVQ8
	PC8XZKzP4jpzT7mipU2HMTsw8AphWcAY=; b=L1YxWDoJDmbvIqz+62une4tEOJK
	0YHagVK+BdPPdVKNMLdQyNQnjLXRkRfXbCbgq6SYQw0IsYn04M4XZGT1k9Noznqn
	p6t5gLCRgXCC+oOnbqrPn9HFX1l9Gi8p3t0KawNwfe1GMGkND2vmRUMG37pXwBEG
	TSGRDdDkRCD63L0CHkzAX/S3A9Z0lnAVUCZEfIfNISWwK43l4CTP/InRxPLWtd4W
	zmfI6qU8bVjFC82/jIYLjVY2yzRUzU+vvI2LRwPhrv5IWSFjshvGU1hMVwd13QBg
	c0SEj6QjuOJSOk6HeTayAkNTTnuG+3ujH3/0Kbeni4gkRj7biAVd4vFSKSQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywnm6nmam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 07:05:43 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTP id 45P75cQn013322;
	Tue, 25 Jun 2024 07:05:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3ywqpky2ue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 07:05:38 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 45P75c2b013299;
	Tue, 25 Jun 2024 07:05:38 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-devipriy-blr.qualcomm.com [10.131.37.37])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 45P75cA1013291
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 07:05:38 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 4059087)
	id D5D9540FB3; Tue, 25 Jun 2024 12:35:36 +0530 (+0530)
From: Devi Priya <quic_devipriy@quicinc.com>
To: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        konrad.dybcio@linaro.org, catalin.marinas@arm.com, will@kernel.org,
        p.zabel@pengutronix.de, richardcochran@gmail.com,
        geert+renesas@glider.be, dmitry.baryshkov@linaro.org,
        neil.armstrong@linaro.org, arnd@arndb.de, m.szyprowski@samsung.com,
        nfraprado@collabora.com, u-kumar1@ti.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Cc: quic_devipriy@quicinc.com
Subject: [PATCH V4 1/7] clk: qcom: clk-alpha-pll: Add NSS HUAYRA ALPHA PLL support for ipq9574
Date: Tue, 25 Jun 2024 12:35:30 +0530
Message-Id: <20240625070536.3043630-2-quic_devipriy@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240625070536.3043630-1-quic_devipriy@quicinc.com>
References: <20240625070536.3043630-1-quic_devipriy@quicinc.com>
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
X-Proofpoint-GUID: TvtmcRSCdEL7p0Xj1vGWTAI2BCH0vNdu
X-Proofpoint-ORIG-GUID: TvtmcRSCdEL7p0Xj1vGWTAI2BCH0vNdu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_03,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=976 lowpriorityscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406250052

Add support for NSS Huayra alpha pll found on ipq9574 SoCs.
Programming sequence is the same as that of Huayra type Alpha PLL,
so we can re-use the same.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
---
 Changes in V4:
	- No change

 drivers/clk/qcom/clk-alpha-pll.c | 11 +++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index d87314042528..b0471d4cf5e7 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -266,6 +266,17 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_OPMODE] = 0x30,
 		[PLL_OFF_STATUS] = 0x3c,
 	},
+	[CLK_ALPHA_PLL_TYPE_NSS_HUAYRA] =  {
+		[PLL_OFF_L_VAL] = 0x04,
+		[PLL_OFF_ALPHA_VAL] = 0x08,
+		[PLL_OFF_TEST_CTL] = 0x0c,
+		[PLL_OFF_TEST_CTL_U] = 0x10,
+		[PLL_OFF_USER_CTL] = 0x14,
+		[PLL_OFF_CONFIG_CTL] = 0x18,
+		[PLL_OFF_CONFIG_CTL_U] = 0x1c,
+		[PLL_OFF_STATUS] = 0x20,
+	},
+
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
 
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index df8f0fe15531..8f754057d9e1 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -31,6 +31,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_BRAMMO_EVO,
 	CLK_ALPHA_PLL_TYPE_STROMER,
 	CLK_ALPHA_PLL_TYPE_STROMER_PLUS,
+	CLK_ALPHA_PLL_TYPE_NSS_HUAYRA,
 	CLK_ALPHA_PLL_TYPE_MAX,
 };
 
-- 
2.34.1


