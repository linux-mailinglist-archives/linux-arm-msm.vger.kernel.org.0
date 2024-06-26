Return-Path: <linux-arm-msm+bounces-24302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE70918463
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 16:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 673041F28612
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 14:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B14B21891D7;
	Wed, 26 Jun 2024 14:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q6hRucI5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CF2186E2E;
	Wed, 26 Jun 2024 14:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719412415; cv=none; b=SYmPg7LxW4kXVBqamnZ4kMYhJ2zBMdld8CZs/Fki1HcSdUOusYHSO8nmEisi7atjzPJayEK2fnCNcvdf8wPoQ9ymtPG4jJMqhHMLhmia43PQiHvsKWJbKRSQC7A+x5NeRUiAG6TXirLyO3EykZkiR2k0tCsnLmB8U0mUezMZmss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719412415; c=relaxed/simple;
	bh=qRw1CRjvWLNCfhRMn2+0YPhXoanNZsoMyEwfAPbwYYw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h2EOA+RdHcj8PlLsvdHQEaihADe1SU0mn1g9EVnNzJVls2xfHnMZsHXcwVns2R0+OuoIYplfL0xJONpxfN7vi4VtQTr79zek3binU36VvJ83GNFNeCZbnbkQAXNm/6Twug2p0M/DZ9wffmYH04iqC8zyY/HKIDwiQnt6yspm/sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q6hRucI5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QAftLZ026701;
	Wed, 26 Jun 2024 14:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sRDISOtsgYG
	ZLorHuzmVniDY6Pw7rzzSntxx60yJ3TQ=; b=Q6hRucI5ShuBVkMf8D+D/SNAMQl
	qF+3U4BK/HrZFDQGx9/n8YRvt0FVFZvjytcsGYBseu3vq0hujXrZNZzp2ioXPP3D
	n0fdY5wfnZcPCdfaAoWfxCB3+r36eXKWciz3SXgLr/CMyoZiHX5A7fj7Tr0OqWxl
	phe8TOD1Cy+7GozZxj02v/YYNIrM10UvK2N8iUfEGUlxOTbrLu/NvAeA+jM3Zyb/
	IU8fCEqGHmGK5hIi9CCaptNBY39wdgkrLnrqRGA1e7GTJziQcigZIry+tW8bmIrA
	GHba4HPaGPznhB66A9thbdEySugK+VeG0chbtJYYyg49slpjtLZJzUE55AQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywnjs1k2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 14:33:08 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTP id 45QEX1H7025744;
	Wed, 26 Jun 2024 14:33:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3ywqpkv29e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 14:33:04 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 45QEX3iN025795;
	Wed, 26 Jun 2024 14:33:03 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-devipriy-blr.qualcomm.com [10.131.37.37])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 45QEX3Qw025789
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 14:33:03 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 4059087)
	id 8458940BD0; Wed, 26 Jun 2024 20:03:02 +0530 (+0530)
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
Subject: [PATCH V5 1/7] clk: qcom: clk-alpha-pll: Add NSS HUAYRA ALPHA PLL support for ipq9574
Date: Wed, 26 Jun 2024 20:02:56 +0530
Message-Id: <20240626143302.810632-2-quic_devipriy@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240626143302.810632-1-quic_devipriy@quicinc.com>
References: <20240626143302.810632-1-quic_devipriy@quicinc.com>
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
X-Proofpoint-GUID: z5rgDGQpLqtNBAEd-loLrGN61a72f7do
X-Proofpoint-ORIG-GUID: z5rgDGQpLqtNBAEd-loLrGN61a72f7do
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_07,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 mlxscore=0 suspectscore=0 adultscore=0 mlxlogscore=975
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406260107

Add support for NSS Huayra alpha pll found on ipq9574 SoCs.
Programming sequence is the same as that of Huayra type Alpha PLL,
so we can re-use the same.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
--- 
 Changes in V5:
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


