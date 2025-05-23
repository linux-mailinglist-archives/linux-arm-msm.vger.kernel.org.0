Return-Path: <linux-arm-msm+bounces-59211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DB7AC219B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 12:58:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B67B9E35BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 10:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3393522AE41;
	Fri, 23 May 2025 10:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="W4tr4F1D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9252A2F3E;
	Fri, 23 May 2025 10:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747997879; cv=none; b=ZsmwBxcsPM3sbypUXajxfuv6vK8no5R9o1JkBAsfPqFf9Cw4wkA2iNkSB8HvMh0WfyIK5JB09ibx9yTfpqZZgAUPaYRAEQDQv6wm/ifbB3ODeDpKXucx6/+6w8lpTAfmSnK6WtrxRP3aVO3svrRDuEWDUCIKvpmxzI5BRlvqoco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747997879; c=relaxed/simple;
	bh=eNjcos0NlbOJRaNZfbKdcj5/us1uOFrqo7gmhlSM1rk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=iWuzVzcsaPrwFIgNMaHFVz/kw7UdKzCOTHuCEW3562CW5P7ILZX6nvyW5B1SxCpGj1xLi4WiN1cS/hV0WE+fnKdFr3l3K5NMwsRlov48In0EQNNij0GorDmEA6NawsY+UlG8YlxB5IIIFQjRYYOjNGd5B/RY2pJUakHEv1T2C4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=W4tr4F1D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N3RKxb021305;
	Fri, 23 May 2025 10:57:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=I5i/UQxC0uQXPBB2wkv7ae/MBTDHGdPcc7FcBtn9HZk=; b=W4
	tr4F1Dh0OzHxEu/y4sjbK/06XijDt4oRzgDTjQbxycL3A6gd1AojTVVXdFaQ2yti
	zJCYTEeppsTCiOI7bSxjIQrmqW2m6VGOK/dmxXBxHnuI3xquglzNOHw9BOMnBMYn
	o83iE/wO7wpgTjI3TkBREXwSEd348cXhZ3cFoAOAipjOKvz88nSlWlpzqzxcm41+
	ymYu1kVTrE86S6Dq8n9V2TCzCYeBgLBbIQRBP59OxnFR5pwuURZDiQMpgyYDYsrX
	8pIzPRVPj3bZccD2FRrcWr7nRqTudGOJJE2Rj1CwbUHbkd8M3+EkYI95xes10DZn
	jIycXfyU7aI8s6AhNY6w==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s9pb8476-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 10:57:53 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54NAvout027527;
	Fri, 23 May 2025 10:57:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 46syn0udnf-1;
	Fri, 23 May 2025 10:57:50 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54NAvoY8027520;
	Fri, 23 May 2025 10:57:50 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-sartgarg-hyd.qualcomm.com [10.213.105.147])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 54NAvo82027519;
	Fri, 23 May 2025 10:57:50 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2339771)
	id 889E7608B7B; Fri, 23 May 2025 16:27:49 +0530 (+0530)
From: Sarthak Garg <quic_sartgarg@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, Sarthak Garg <quic_sartgarg@quicinc.com>
Subject: [PATCH V2 2/3] mmc: sdhci-msm: Limit HS mode frequency to 37.5MHz
Date: Fri, 23 May 2025 16:27:44 +0530
Message-Id: <20250523105745.6210-3-quic_sartgarg@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250523105745.6210-1-quic_sartgarg@quicinc.com>
References: <20250523105745.6210-1-quic_sartgarg@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=WJl/XmsR c=1 sm=1 tr=0 ts=683054b2 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=6IzwJGZMB4z6bUhVws4A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: YAAU82MjciFZpsg7eZ8RnxQPX0-mAEJr
X-Proofpoint-GUID: YAAU82MjciFZpsg7eZ8RnxQPX0-mAEJr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA5NiBTYWx0ZWRfXyntTJg29j/LM
 rVBEqWouiyGxNXXtejam8q5y0xzIYn8NfjMb2bsZllknJN6tU+JWTS46thTd7PVK0wrEG28lz7p
 2HsBWdAjflwIEMLaRs/vTUNqowqqRjd88fTawqrk2xBU9Fv2iQTc7YIoJPt6Fmo/hdsLZNfBWE5
 kvjxaBL5i/3VObzhWF9D50PGBvqrI6eMMP1x6+Oq4rR03XmgYWqLLh4FQvlqFfCDTcZAkEIAjBQ
 JSu7//jsrLBKXXPFQG52EMcbTv4mADuwSU8DqOl7hbeu+YekCYy00BO+oVn+b8wDasrK9trmyzJ
 t2rJui9qFtIorFFJFBzhe+9mYuZ8sQFc3OAvrTjZiDrIuHW9epspJH5iVUWz455CPEAWBzacLIV
 LyGqBu6tJ4rIWB+XCyVNspg0FShon+uffyzvU3CJl23tTOu4H/qWC1koCGGyUKVOOJ0j5Fnz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230096
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

For Qualcomm SoCs with level shifter delays are seen on receivers data
path due to latency added by level shifter.

To bring these delays in normal range and avoid CMD CRC errors
reduce frequency for HS mode SD cards to 37.5MHz for targets which has
level shifter.

Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
---
 drivers/mmc/host/sdhci-msm.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index bf91cb96a0ea..4ab8640a9b64 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -147,6 +147,8 @@
 /* Max load for SD Vdd-io supply */
 #define SD_VQMMC_MAX_LOAD_UA	22000
 
+#define LEVEL_SHIFTER_HIGH_SPEED_FREQ	37500000
+
 #define msm_host_readl(msm_host, host, offset) \
 	msm_host->var_ops->msm_readl_relaxed(host, offset)
 
@@ -262,6 +264,7 @@ struct sdhci_msm_variant_ops {
 struct sdhci_msm_variant_info {
 	bool mci_removed;
 	bool restore_dll_config;
+	bool uses_level_shifter;
 	const struct sdhci_msm_variant_ops *var_ops;
 	const struct sdhci_msm_offset *offset;
 };
@@ -296,6 +299,7 @@ struct sdhci_msm_host {
 	bool use_cdr;
 	u32 transfer_mode;
 	bool updated_ddr_cfg;
+	bool uses_level_shifter;
 	bool uses_tassadar_dll;
 	u32 dll_config;
 	u32 ddr_config;
@@ -375,6 +379,12 @@ static void msm_set_clock_rate_for_bus_mode(struct sdhci_host *host,
 
 	mult = msm_get_clock_mult_for_bus_mode(host);
 	desired_rate = clock * mult;
+
+	if (curr_ios.timing == MMC_TIMING_SD_HS &&
+	    desired_rate > LEVEL_SHIFTER_HIGH_SPEED_FREQ &&
+	    msm_host->uses_level_shifter)
+		desired_rate = LEVEL_SHIFTER_HIGH_SPEED_FREQ;
+
 	rc = dev_pm_opp_set_rate(mmc_dev(host->mmc), desired_rate);
 	if (rc) {
 		pr_err("%s: Failed to set clock at rate %u at timing %d\n",
@@ -2420,6 +2430,13 @@ static const struct sdhci_msm_variant_info sdm845_sdhci_var = {
 	.offset = &sdhci_msm_v5_offset,
 };
 
+static const struct sdhci_msm_variant_info sm8550_sdhci_var = {
+	.mci_removed = true,
+	.uses_level_shifter = true,
+	.var_ops = &v5_var_ops,
+	.offset = &sdhci_msm_v5_offset,
+};
+
 static const struct of_device_id sdhci_msm_dt_match[] = {
 	/*
 	 * Do not add new variants to the driver which are compatible with
@@ -2430,6 +2447,7 @@ static const struct of_device_id sdhci_msm_dt_match[] = {
 	{.compatible = "qcom,sdm670-sdhci", .data = &sdm845_sdhci_var},
 	{.compatible = "qcom,sdm845-sdhci", .data = &sdm845_sdhci_var},
 	{.compatible = "qcom,sc7180-sdhci", .data = &sdm845_sdhci_var},
+	{.compatible = "qcom,sm8550-sdhci", .data = &sm8550_sdhci_var},
 	{},
 };
 
@@ -2551,6 +2569,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 
 	msm_host->mci_removed = var_info->mci_removed;
 	msm_host->restore_dll_config = var_info->restore_dll_config;
+	msm_host->uses_level_shifter = var_info->uses_level_shifter;
 	msm_host->var_ops = var_info->var_ops;
 	msm_host->offset = var_info->offset;
 
-- 
2.17.1


