Return-Path: <linux-arm-msm+bounces-77039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A2625BD3EE5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 17:12:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 87EAB4FDFDF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 15:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5454730FC0F;
	Mon, 13 Oct 2025 14:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JteukGf+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF27730F81C;
	Mon, 13 Oct 2025 14:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760367218; cv=none; b=C3jobz/G4IMB0pGNNmyaaEHAn1cFvnD3xMXsPycC4K0VuqN+/UBznfljdPL5s3Q84gcdSxHjKUiKx6lVRQJkqZW60mS4jUHdI+SDygImApCOb4eRUAO4Xi3ucr0QfphdOVbNmVIoPjqEWhtPHQMYhp4pbKag8DI1NNJqOryf91s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760367218; c=relaxed/simple;
	bh=e4T7LPUbIHtLPZPOz4IcjnOvaF6mhfvysu9DDxU3CAg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BlHrh2pCpWNJIteQQZiZ4lpo0En2FCarynN8WFHvcE6o1dDCyLA5PsckRRhXVfKDFfmLmbuFMs5QvYS+1Vh4kkod+/wsby850e74ZEREl6h3Lfb+xlYSVAiJT7cCWNsIztFk71Jwh63qOinDE+IKTOMu1BeuhGaxB08/xM77/I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JteukGf+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DB20Uj030097;
	Mon, 13 Oct 2025 14:53:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RmgTP14ONIy
	D3sDFsckOay5yPsxM/Z5Sbq1xzUIZ7UA=; b=JteukGf+gl22xg6oErAS/KkcJj1
	u/EMvlVnl7g1uId/fK+VVw6tiPVsLgFGXFJw8X5iEuof0V+gkeSl1Apz34ijA7Lr
	g3Fe/GJwfVCxPqRNH2sDk4g1hsZy0S+8HPLkU3xMlTdR6pQSaA5ifOTo52Zyj7uP
	RMoHK6EF2Stdqm4XjYACb/2Kc4a+KKZUBk8+XcpNjizj0NrysK6EZNnmaI0Jh7iu
	a0myn7cQW2i1e9FeEjTakKngAeIvhDHY68xrgr2oA1C/mLCUVH4RlrAajQwKLphX
	q9I4I9HdBZ32MnsBQc23qNQf7vaRaJtMzvCeFwiWGHlbpOg5IxdpA8v3J6Q==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0n011-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 14:53:30 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 59DErREu026035;
	Mon, 13 Oct 2025 14:53:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 49qgaktjeg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 14:53:27 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59DErRtQ026026;
	Mon, 13 Oct 2025 14:53:27 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-rampraka-hyd.qualcomm.com [10.147.247.88])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 59DErQPd026016
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 14:53:27 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2305851)
	id D9C445C8; Mon, 13 Oct 2025 20:23:25 +0530 (+0530)
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com, Sachin Gupta <quic_sachgupt@quicinc.com>
Subject: [PATCH v5 3/4] mmc: sdhci-msm: Add device tree parsing logic for DLL settings
Date: Mon, 13 Oct 2025 20:23:15 +0530
Message-Id: <20251013145316.1087274-4-quic_rampraka@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013145316.1087274-1-quic_rampraka@quicinc.com>
References: <20251013145316.1087274-1-quic_rampraka@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXzn/wRlPpkDqX
 FIExDWiEg1ddNLcKwNCB1pvzMkZqqwUsGl/KBgQwOTcV8jVI2v3XxYrCr74tmbPXW5w45GMpTEW
 WIlWYzBCuAAouR6MfAllRbFHEhXxACcghIoEQP1BFnCSF9I6y3B9S37MsZvzDxGltcOlyBRf0se
 gKnoExY3PZF72sPj43K4wt1YGSdo9NF8XAeyq9nMNq80SNCA3mVGi3NMDaA4E/e5dHNht6WP0Gw
 Q9lKq7VM2R98Tl85mCOb/5KCePoLT8wBNLaWvPudRkPMmwt91M0xrzcPx/s+qAQehgTt5MeFHiv
 2hFv6OJyusvcAnu7EdiIYBKuckgzSWyoCqzwOaqZvVZ35LoDlgbtOZawBYUmze0zGxp0MuXZVOG
 QpYtTEewtavr2FjyBP5JPWtkr8yqyQ==
X-Proofpoint-GUID: W7yzqBr4Hy-hVI1qPB4ept_pmNLX3PLD
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68ed126a cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=ofWALSsdreNL5dRjaDMA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: W7yzqBr4Hy-hVI1qPB4ept_pmNLX3PLD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

From: Sachin Gupta <quic_sachgupt@quicinc.com>

Parse dll-presets from dt and introduces the capability to
configure HS200 and HS400 DLL settings from device tree.

Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
---
 drivers/mmc/host/sdhci-msm.c | 38 ++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 423e7cccab7d..8038b8def355 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -266,6 +266,19 @@ struct sdhci_msm_variant_info {
 	const struct sdhci_msm_offset *offset;
 };
 
+/*
+ * DLL registers which needs be programmed with HSR settings.
+ * Add any new register only at the end and don't change the
+ * sequence.
+ */
+struct sdhci_msm_dll {
+	u32 dll_config;
+	u32 dll_config_2;
+	u32 dll_config_3;
+	u32 dll_usr_ctl;
+	u32 ddr_config;
+};
+
 struct sdhci_msm_host {
 	struct platform_device *pdev;
 	void __iomem *core_mem;	/* MSM SDCC mapped address */
@@ -274,6 +287,7 @@ struct sdhci_msm_host {
 	struct clk *xo_clk;	/* TCXO clk needed for FLL feature of cm_dll*/
 	/* core, iface, cal and sleep clocks */
 	struct clk_bulk_data bulk_clks[4];
+	struct sdhci_msm_dll dll[2];
 #ifdef CONFIG_MMC_CRYPTO
 	struct qcom_ice *ice;
 #endif
@@ -302,6 +316,7 @@ struct sdhci_msm_host {
 	u32 dll_config;
 	u32 ddr_config;
 	bool vqmmc_enabled;
+	bool artanis_dll;
 };
 
 static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
@@ -2531,6 +2546,23 @@ static int sdhci_msm_gcc_reset(struct device *dev, struct sdhci_host *host)
 	return ret;
 }
 
+#define DLL_SIZE 10
+static int sdhci_msm_dt_parse_dll(struct device *dev, struct sdhci_msm_host *msm_host)
+{
+	int ret;
+	u32 *dll_table = &msm_host->dll[0].dll_config;
+
+	msm_host->artanis_dll = false;
+
+	ret = of_property_read_variable_u32_array(dev->of_node,
+						  "qcom,dll-presets",
+						  dll_table, DLL_SIZE, DLL_SIZE);
+	if (ret != -EINVAL)
+		msm_host->artanis_dll = true;
+
+	return ret;
+}
+
 static int sdhci_msm_probe(struct platform_device *pdev)
 {
 	struct sdhci_host *host;
@@ -2577,6 +2609,12 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 
 	msm_host->saved_tuning_phase = INVALID_TUNING_PHASE;
 
+	ret = sdhci_msm_dt_parse_dll(&pdev->dev, msm_host);
+	if (ret == -ENODATA || ret == -EOVERFLOW) {
+		dev_err(&pdev->dev, "Bad DLL in dt (%d)\n", ret);
+		return ret;
+	}
+
 	ret = sdhci_msm_gcc_reset(&pdev->dev, host);
 	if (ret)
 		return ret;
-- 
2.34.1


