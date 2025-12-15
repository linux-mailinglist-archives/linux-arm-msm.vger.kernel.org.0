Return-Path: <linux-arm-msm+bounces-85231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5151FCBDB5A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 13:09:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB466308E494
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 12:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0347F32D431;
	Mon, 15 Dec 2025 12:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UUW8Oref"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6B232F74F;
	Mon, 15 Dec 2025 12:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765800038; cv=none; b=ADLWFp66DbXoEfad8WqxiMdfUWSsG0FhIgfhc0Avox2V3JqzIBkSfwdRdnB4hNSUewbhWXIOQutuvADbz72SPM//xXFuJgmSedwIOw1iWfhTozbPY5IHOTyGFKvOZQBc6eJRkP6WVvc8pHpdO29dLNXy7LLQnxSjfGaDgXEW+Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765800038; c=relaxed/simple;
	bh=5qCRSUjAO06fYx6lL7lpWK2WxN7JxKbdFFz+jca7bwQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gp9g7qimAiN0zAJUKuWczWclRDz/wWAJ0YbEGdG30Z7GYjU8p770+JO+rRtg4u7FgcWmgc+aHpUp8tDOQml17I5LyCoq/EBaDvc1+sr4XiB4PtVvIijIjrPIGMJAbzN9BtC1obPUPBjdBkbysg8vkZUBjUqTrRQXIKZYlZFQvQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UUW8Oref; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BFANrB9136457;
	Mon, 15 Dec 2025 12:00:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Mu3crfOmcqd
	u3Uvn8DStIF+9uk9zlDZw2cXqKD78TRM=; b=UUW8Orefe0lkvfV6tMCnkNTrMjz
	jjqbqIkn1gQ/q9T08IBuFqxDmMZve+RKSVIU66HM/elbMaHaKOng6qrxSHFJUWde
	diIqn50VeOrQX36oEsFQR+JXHOg4E+fsln0tqx/KjJektZsYcRuEuHem+6eBoMQu
	dHGD2V50A+oKXhwKDY9uVSW2GwgBsc9npK63Hx0ECtQJM4E49o/nU/EGpsJDUREl
	dviPc7ysjnyZlFRtoAvoJ+KvFwPp+UcyglAJulBtLs66+7YbZB8+XdFdyZbzCvQw
	PInavvRIytFjQG6Sj0gOrqJAH8yK/kqr27RE7UToAF5/mX5Cm5SfaTpSamw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11c6mfuu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 12:00:33 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BFC0TXD029131;
	Mon, 15 Dec 2025 12:00:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4b117kxe3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 12:00:29 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5BFC0TVQ029126;
	Mon, 15 Dec 2025 12:00:29 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-rampraka-hyd.qualcomm.com [10.147.247.88])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5BFC0SmS029119
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 12:00:29 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2305851)
	id 1F9895D6; Mon, 15 Dec 2025 17:30:28 +0530 (+0530)
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, quic_rampraka@quicinc.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com, Sachin Gupta <quic_sachgupt@quicinc.com>
Subject: [PATCH v6 4/5] mmc: sdhci-msm: Add Device tree parsing logic for DLL settings
Date: Mon, 15 Dec 2025 17:30:08 +0530
Message-Id: <20251215120009.3877889-5-quic_rampraka@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251215120009.3877889-1-quic_rampraka@quicinc.com>
References: <20251215120009.3877889-1-quic_rampraka@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=actsXBot c=1 sm=1 tr=0 ts=693ff862 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8
 a=ofWALSsdreNL5dRjaDMA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ZI9rN5u8boiT6vOpev2JMVH9oQMpDpUZ
X-Proofpoint-GUID: ZI9rN5u8boiT6vOpev2JMVH9oQMpDpUZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDEwNCBTYWx0ZWRfX8/t8AEqpAos0
 jDy8Yj3yP4gN+3e0f0fILSiRCUiKMXTenLJHPxN93aioSw9kv11/OcBWGX40USpZsVw94G4dFZ+
 UOmFxiJ/c0CV/6MzzAd9whG7ifG5c0PiiXq4da9X6fxJdY3EZnMH09oVEh6YTc8+K4JRxkN3iON
 5fFtWTC5RcWoF++BMqJcXthHDaH/tj+4YEDKkwRvMteHWOvxgDywehKFIdwh5peuqd9sGsQK3/M
 DAatwg5oy6bFQ2jI9oYtjAqD/2HUnE4F0XStlvgAyETkAmwPxi1kQ/Ig3/0lLz87SJwk6/AKzYD
 ZGs1SUCwHswkotNSkSANpX+ggHNcL5krga+C/VYeNhOQ5tnk3JF1DcdzSx6feTR+mHRjsp+9JC3
 +pC5j7e9wOKa3aUQ8vgo3oNzJiUQCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_02,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150104

From: Sachin Gupta <quic_sachgupt@quicinc.com>

This update introduces the capability to configure HS200
and HS400 DLL settings via the device tree and parsing it.

Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
---
 drivers/mmc/host/sdhci-msm.c | 41 ++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index dc79f828522b..1fcd92158bee 100644
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
@@ -2534,6 +2549,23 @@ static int sdhci_msm_gcc_reset(struct device *dev, struct sdhci_host *host)
 	return ret;
 }
 
+#define DLL_SIZE 10
+static int sdhci_msm_dt_parse_dll_info(struct device *dev, struct sdhci_msm_host *msm_host)
+{
+	u32 *dll_table = &msm_host->dll[0].dll_config;
+	int ret;
+
+	msm_host->artanis_dll = false;
+
+	ret = of_property_read_variable_u32_array(dev->of_node,
+						  "qcom,dll-presets",
+						  dll_table, DLL_SIZE, DLL_SIZE);
+	if (ret == DLL_SIZE)
+		msm_host->artanis_dll = true;
+
+	return ret;
+}
+
 static int sdhci_msm_probe(struct platform_device *pdev)
 {
 	struct sdhci_host *host;
@@ -2580,6 +2612,15 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 
 	msm_host->saved_tuning_phase = INVALID_TUNING_PHASE;
 
+	/*
+	 * Parse HSR dll only when property is present in DT.
+	 */
+	ret = sdhci_msm_dt_parse_dll_info(&pdev->dev, msm_host);
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


