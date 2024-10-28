Return-Path: <linux-arm-msm+bounces-36172-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB159B31BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 14:32:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BBB2283C30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 13:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77CE31DA636;
	Mon, 28 Oct 2024 13:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="V+rAA768"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C58F2AE8C;
	Mon, 28 Oct 2024 13:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730122357; cv=none; b=W1ERa3yaciFUn0QdwbDZntNGSa06LPyQXX+i6yamxCmkocF6lzIbd1ZhNtFAw2DGYEGkRx7EesNyK37NveG/52GkbepZHRpmRTtMM5kiaRnX94wLFsnCwEpWpGoRe8TGKXHWorKW9l7Zg/EP2L5KYVxTJdckF/0VfJkKYheV8II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730122357; c=relaxed/simple;
	bh=mAVtPpFrOmntFy105e+C6qV9SzAVVvKPyvnFgnACSWo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HP6I/e9jVjMKL99sPWX+A5cLk+zcGofUo9+cje99eXuv/lreq0szBMsydzc4fYLaGhPbknAcxJA9FDBRbekZJQL3tyXvcrG2ggMeeUBIU3JNC7qqVbxoz/mkc3Agpw1jAS97kjcXatVjkXiZRE3kLjcCO2lw258/Yj78huVHZFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=V+rAA768; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SBBSUA011999;
	Mon, 28 Oct 2024 13:32:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zqHPxMXHqfi7NVSYF4HguTwkrEuZ+fhq5q7
	oUKBkW2Q=; b=V+rAA768WUpGYq2wt6gzKONP3+lj3VVWyvmF1TCM3B9pivBK8O1
	UKUT8q/YmEkrekCcgne4vGXDF/7e7JrC2QC91RqH6ET6J8vMQPHrepziUUKS3bFF
	0Yi9aHPvzT+pW1FRkwv5pBOqEMc14hdectJtyDq4PRsrKAFMFxj1+wGVzTCozsBr
	caBInd8qkj3vgd+kIQOP98DQXZxxDEFeuia5WscunRcrDKzVj6tejHZYG4kRpt0m
	g6sEIDpCAe16ZI9BGx/Br1R+V/7RLcBBztCC6VNrNjVrJt0NzfnPApKzn9RmWszg
	ged/XjjnRmnbPD21T5OvZ+S2vp97hpX6wzQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gr0x53u2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 13:32:27 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 49SDWMRS001726;
	Mon, 28 Oct 2024 13:32:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 42gsgknrpx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 13:32:22 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49SDU5KD031754;
	Mon, 28 Oct 2024 13:32:21 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 49SDWLIV001718
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 13:32:21 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 6AF74593; Mon, 28 Oct 2024 19:02:20 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [RFC] remoteproc: Clean rproc-driver-data for each instance
Date: Mon, 28 Oct 2024 19:02:16 +0530
Message-ID: <20241028133216.3711914-1-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.46.1
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
X-Proofpoint-ORIG-GUID: nl1GK8yeN5dG0oCs4N7mMDTO87nB92sV
X-Proofpoint-GUID: nl1GK8yeN5dG0oCs4N7mMDTO87nB92sV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280109

Currently, all Qualcomm remoteproc client drivers have data structures
with many common fields. Clean these data structures to categorize the
common fields and create macros to fill rproc-driver-data instances.
This will help reduce duplicates and make it easier for developers
to fill data using the macros.

Currently, changes have been added for the PAS driver only.

Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 737 +++++------------------------
 1 file changed, 129 insertions(+), 608 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ef82835e98a4..58311c9ad609 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -819,613 +819,134 @@ static void adsp_remove(struct platform_device *pdev)
 	device_init_wakeup(adsp->dev, false);
 }

-static const struct adsp_data adsp_resource_init = {
-	.crash_reason_smem = 423,
-	.firmware_name = "adsp.mdt",
-	.pas_id = 1,
-	.auto_boot = true,
-	.ssr_name = "lpass",
-	.sysmon_name = "adsp",
-	.ssctl_id = 0x14,
-};
-
-static const struct adsp_data sa8775p_adsp_resource = {
-	.crash_reason_smem = 423,
-	.firmware_name = "adsp.mbn",
-	.pas_id = 1,
-	.minidump_id = 5,
-	.auto_boot = true,
-	.proxy_pd_names = (char*[]){
-		"lcx",
-		"lmx",
-		NULL
-	},
-	.load_state = "adsp",
-	.ssr_name = "lpass",
-	.sysmon_name = "adsp",
-	.ssctl_id = 0x14,
-};
-
-static const struct adsp_data sdm845_adsp_resource_init = {
-	.crash_reason_smem = 423,
-	.firmware_name = "adsp.mdt",
-	.pas_id = 1,
-	.auto_boot = true,
-	.load_state = "adsp",
-	.ssr_name = "lpass",
-	.sysmon_name = "adsp",
-	.ssctl_id = 0x14,
-};
-
-static const struct adsp_data sm6350_adsp_resource = {
-	.crash_reason_smem = 423,
-	.firmware_name = "adsp.mdt",
-	.pas_id = 1,
-	.auto_boot = true,
-	.proxy_pd_names = (char*[]){
-		"lcx",
-		"lmx",
-		NULL
-	},
-	.load_state = "adsp",
-	.ssr_name = "lpass",
-	.sysmon_name = "adsp",
-	.ssctl_id = 0x14,
-};
-
-static const struct adsp_data sm6375_mpss_resource = {
-	.crash_reason_smem = 421,
-	.firmware_name = "modem.mdt",
-	.pas_id = 4,
-	.minidump_id = 3,
-	.auto_boot = false,
-	.proxy_pd_names = (char*[]){
-		"cx",
-		NULL
-	},
-	.ssr_name = "mpss",
-	.sysmon_name = "modem",
-	.ssctl_id = 0x12,
-};
-
-static const struct adsp_data sm8150_adsp_resource = {
-	.crash_reason_smem = 423,
-	.firmware_name = "adsp.mdt",
-	.pas_id = 1,
-	.auto_boot = true,
-	.proxy_pd_names = (char*[]){
-		"cx",
-		NULL
-	},
-	.load_state = "adsp",
-	.ssr_name = "lpass",
-	.sysmon_name = "adsp",
-	.ssctl_id = 0x14,
-};
-
-static const struct adsp_data sm8250_adsp_resource = {
-	.crash_reason_smem = 423,
-	.firmware_name = "adsp.mdt",
-	.pas_id = 1,
-	.auto_boot = true,
-	.proxy_pd_names = (char*[]){
-		"lcx",
-		"lmx",
-		NULL
-	},
-	.load_state = "adsp",
-	.ssr_name = "lpass",
-	.sysmon_name = "adsp",
-	.ssctl_id = 0x14,
-};
-
-static const struct adsp_data sm8350_adsp_resource = {
-	.crash_reason_smem = 423,
-	.firmware_name = "adsp.mdt",
-	.pas_id = 1,
-	.auto_boot = true,
-	.proxy_pd_names = (char*[]){
-		"lcx",
-		"lmx",
-		NULL
-	},
-	.load_state = "adsp",
-	.ssr_name = "lpass",
-	.sysmon_name = "adsp",
-	.ssctl_id = 0x14,
-};
-
-static const struct adsp_data msm8996_adsp_resource = {
-	.crash_reason_smem = 423,
-	.firmware_name = "adsp.mdt",
-	.pas_id = 1,
-	.auto_boot = true,
-	.proxy_pd_names = (char*[]){
-		"cx",
-		NULL
-	},
-	.ssr_name = "lpass",
-	.sysmon_name = "adsp",
-	.ssctl_id = 0x14,
-};
-
-static const struct adsp_data cdsp_resource_init = {
-	.crash_reason_smem = 601,
-	.firmware_name = "cdsp.mdt",
-	.pas_id = 18,
-	.auto_boot = true,
-	.ssr_name = "cdsp",
-	.sysmon_name = "cdsp",
-	.ssctl_id = 0x17,
-};
-
-static const struct adsp_data sa8775p_cdsp0_resource = {
-	.crash_reason_smem = 601,
-	.firmware_name = "cdsp0.mbn",
-	.pas_id = 18,
-	.minidump_id = 7,
-	.auto_boot = true,
-	.proxy_pd_names = (char*[]){
-		"cx",
-		"mxc",
-		"nsp",
-		NULL
-	},
-	.load_state = "cdsp",
-	.ssr_name = "cdsp",
-	.sysmon_name = "cdsp",
-	.ssctl_id = 0x17,
-};
-
-static const struct adsp_data sa8775p_cdsp1_resource = {
-	.crash_reason_smem = 633,
-	.firmware_name = "cdsp1.mbn",
-	.pas_id = 30,
-	.minidump_id = 20,
-	.auto_boot = true,
-	.proxy_pd_names = (char*[]){
-		"cx",
-		"mxc",
-		"nsp",
-		NULL
-	},
-	.load_state = "nsp",
-	.ssr_name = "cdsp1",
-	.sysmon_name = "cdsp1",
-	.ssctl_id = 0x20,
-};
-
-static const struct adsp_data sdm845_cdsp_resource_init = {
-	.crash_reason_smem = 601,
-	.firmware_name = "cdsp.mdt",
-	.pas_id = 18,
-	.auto_boot = true,
-	.load_state = "cdsp",
-	.ssr_name = "cdsp",
-	.sysmon_name = "cdsp",
-	.ssctl_id = 0x17,
-};
-
-static const struct adsp_data sm6350_cdsp_resource = {
-	.crash_reason_smem = 601,
-	.firmware_name = "cdsp.mdt",
-	.pas_id = 18,
-	.auto_boot = true,
-	.proxy_pd_names = (char*[]){
-		"cx",
-		"mx",
-		NULL
-	},
-	.load_state = "cdsp",
-	.ssr_name = "cdsp",
-	.sysmon_name = "cdsp",
-	.ssctl_id = 0x17,
-};
-
-static const struct adsp_data sm8150_cdsp_resource = {
-	.crash_reason_smem = 601,
-	.firmware_name = "cdsp.mdt",
-	.pas_id = 18,
-	.auto_boot = true,
-	.proxy_pd_names = (char*[]){
-		"cx",
-		NULL
-	},
-	.load_state = "cdsp",
-	.ssr_name = "cdsp",
-	.sysmon_name = "cdsp",
-	.ssctl_id = 0x17,
-};
-
-static const struct adsp_data sm8250_cdsp_resource = {
-	.crash_reason_smem = 601,
-	.firmware_name = "cdsp.mdt",
-	.pas_id = 18,
-	.auto_boot = true,
-	.proxy_pd_names = (char*[]){
-		"cx",
-		NULL
-	},
-	.load_state = "cdsp",
-	.ssr_name = "cdsp",
-	.sysmon_name = "cdsp",
-	.ssctl_id = 0x17,
-};
-
-static const struct adsp_data sc8280xp_nsp0_resource = {
-	.crash_reason_smem = 601,
-	.firmware_name = "cdsp.mdt",
-	.pas_id = 18,
-	.auto_boot = true,
-	.proxy_pd_names = (char*[]){
-		"nsp",
-		NULL
-	},
-	.ssr_name = "cdsp0",
-	.sysmon_name = "cdsp",
-	.ssctl_id = 0x17,
-};
-
-static const struct adsp_data sc8280xp_nsp1_resource = {
-	.crash_reason_smem = 633,
-	.firmware_name = "cdsp.mdt",
-	.pas_id = 30,
-	.auto_boot = true,
-	.proxy_pd_names = (char*[]){
-		"nsp",
-		NULL
-	},
-	.ssr_name = "cdsp1",
-	.sysmon_name = "cdsp1",
-	.ssctl_id = 0x20,
-};
-
-static const struct adsp_data x1e80100_adsp_resource = {
-	.crash_reason_smem = 423,
-	.firmware_name = "adsp.mdt",
-	.dtb_firmware_name = "adsp_dtb.mdt",
-	.pas_id = 1,
-	.dtb_pas_id = 0x24,
-	.lite_pas_id = 0x1f,
-	.minidump_id = 5,
-	.auto_boot = true,
-	.proxy_pd_names = (char*[]){
-		"lcx",
-		"lmx",
-		NULL
-	},
-	.load_state = "adsp",
-	.ssr_name = "lpass",
-	.sysmon_name = "adsp",
-	.ssctl_id = 0x14,
-};
-
-static const struct adsp_data x1e80100_cdsp_resource = {
-	.crash_reason_smem = 601,
-	.firmware_name = "cdsp.mdt",
-	.dtb_firmware_name = "cdsp_dtb.mdt",
-	.pas_id = 18,
-	.dtb_pas_id = 0x25,
-	.minidump_id = 7,
-	.auto_boot = true,
-	.proxy_pd_names = (char*[]){
-		"cx",
-		"mxc",
-		"nsp",
-		NULL
-	},
-	.load_state = "cdsp",
-	.ssr_name = "cdsp",
-	.sysmon_name = "cdsp",
-	.ssctl_id = 0x17,
-};
-
-static const struct adsp_data sm8350_cdsp_resource = {
-	.crash_reason_smem = 601,
-	.firmware_name = "cdsp.mdt",
-	.pas_id = 18,
-	.auto_boot = true,
-	.proxy_pd_names = (char*[]){
-		"cx",
-		"mxc",
-		NULL
-	},
-	.load_state = "cdsp",
-	.ssr_name = "cdsp",
-	.sysmon_name = "cdsp",
-	.ssctl_id = 0x17,
-};
-
-static const struct adsp_data sa8775p_gpdsp0_resource = {
-	.crash_reason_smem = 640,
-	.firmware_name = "gpdsp0.mbn",
-	.pas_id = 39,
-	.minidump_id = 21,
-	.auto_boot = true,
-	.proxy_pd_names = (char*[]){
-		"cx",
-		"mxc",
-		NULL
-	},
-	.load_state = "gpdsp0",
-	.ssr_name = "gpdsp0",
-	.sysmon_name = "gpdsp0",
-	.ssctl_id = 0x21,
-};
-
-static const struct adsp_data sa8775p_gpdsp1_resource = {
-	.crash_reason_smem = 641,
-	.firmware_name = "gpdsp1.mbn",
-	.pas_id = 40,
-	.minidump_id = 22,
-	.auto_boot = true,
-	.proxy_pd_names = (char*[]){
-		"cx",
-		"mxc",
-		NULL
-	},
-	.load_state = "gpdsp1",
-	.ssr_name = "gpdsp1",
-	.sysmon_name = "gpdsp1",
-	.ssctl_id = 0x22,
-};
-
-static const struct adsp_data mpss_resource_init = {
-	.crash_reason_smem = 421,
-	.firmware_name = "modem.mdt",
-	.pas_id = 4,
-	.minidump_id = 3,
-	.auto_boot = false,
-	.proxy_pd_names = (char*[]){
-		"cx",
-		"mss",
-		NULL
-	},
-	.load_state = "modem",
-	.ssr_name = "mpss",
-	.sysmon_name = "modem",
-	.ssctl_id = 0x12,
-};
-
-static const struct adsp_data sc8180x_mpss_resource = {
-	.crash_reason_smem = 421,
-	.firmware_name = "modem.mdt",
-	.pas_id = 4,
-	.auto_boot = false,
-	.proxy_pd_names = (char*[]){
-		"cx",
-		NULL
-	},
-	.load_state = "modem",
-	.ssr_name = "mpss",
-	.sysmon_name = "modem",
-	.ssctl_id = 0x12,
-};
-
-static const struct adsp_data msm8996_slpi_resource_init = {
-	.crash_reason_smem = 424,
-	.firmware_name = "slpi.mdt",
-	.pas_id = 12,
-	.auto_boot = true,
-	.proxy_pd_names = (char*[]){
-		"ssc_cx",
-		NULL
-	},
-	.ssr_name = "dsps",
-	.sysmon_name = "slpi",
-	.ssctl_id = 0x16,
-};
-
-static const struct adsp_data sdm845_slpi_resource_init = {
-	.crash_reason_smem = 424,
-	.firmware_name = "slpi.mdt",
-	.pas_id = 12,
-	.auto_boot = true,
-	.proxy_pd_names = (char*[]){
-		"lcx",
-		"lmx",
-		NULL
-	},
-	.load_state = "slpi",
-	.ssr_name = "dsps",
-	.sysmon_name = "slpi",
-	.ssctl_id = 0x16,
-};
-
-static const struct adsp_data wcss_resource_init = {
-	.crash_reason_smem = 421,
-	.firmware_name = "wcnss.mdt",
-	.pas_id = 6,
-	.auto_boot = true,
-	.ssr_name = "mpss",
-	.sysmon_name = "wcnss",
-	.ssctl_id = 0x12,
-};
-
-static const struct adsp_data sdx55_mpss_resource = {
-	.crash_reason_smem = 421,
-	.firmware_name = "modem.mdt",
-	.pas_id = 4,
-	.auto_boot = true,
-	.proxy_pd_names = (char*[]){
-		"cx",
-		"mss",
-		NULL
-	},
-	.ssr_name = "mpss",
-	.sysmon_name = "modem",
-	.ssctl_id = 0x22,
-};
-
-static const struct adsp_data sm8450_mpss_resource = {
-	.crash_reason_smem = 421,
-	.firmware_name = "modem.mdt",
-	.pas_id = 4,
-	.minidump_id = 3,
-	.auto_boot = false,
-	.decrypt_shutdown = true,
-	.proxy_pd_names = (char*[]){
-		"cx",
-		"mss",
-		NULL
-	},
-	.load_state = "modem",
-	.ssr_name = "mpss",
-	.sysmon_name = "modem",
-	.ssctl_id = 0x12,
-};
-
-static const struct adsp_data sm8550_adsp_resource = {
-	.crash_reason_smem = 423,
-	.firmware_name = "adsp.mdt",
-	.dtb_firmware_name = "adsp_dtb.mdt",
-	.pas_id = 1,
-	.dtb_pas_id = 0x24,
-	.minidump_id = 5,
-	.auto_boot = true,
-	.proxy_pd_names = (char*[]){
-		"lcx",
-		"lmx",
-		NULL
-	},
-	.load_state = "adsp",
-	.ssr_name = "lpass",
-	.sysmon_name = "adsp",
-	.ssctl_id = 0x14,
-	.smem_host_id = 2,
-};
-
-static const struct adsp_data sm8550_cdsp_resource = {
-	.crash_reason_smem = 601,
-	.firmware_name = "cdsp.mdt",
-	.dtb_firmware_name = "cdsp_dtb.mdt",
-	.pas_id = 18,
-	.dtb_pas_id = 0x25,
-	.minidump_id = 7,
-	.auto_boot = true,
-	.proxy_pd_names = (char*[]){
-		"cx",
-		"mxc",
-		"nsp",
-		NULL
-	},
-	.load_state = "cdsp",
-	.ssr_name = "cdsp",
-	.sysmon_name = "cdsp",
-	.ssctl_id = 0x17,
-	.smem_host_id = 5,
-};
-
-static const struct adsp_data sm8550_mpss_resource = {
-	.crash_reason_smem = 421,
-	.firmware_name = "modem.mdt",
-	.dtb_firmware_name = "modem_dtb.mdt",
-	.pas_id = 4,
-	.dtb_pas_id = 0x26,
-	.minidump_id = 3,
-	.auto_boot = false,
-	.decrypt_shutdown = true,
-	.proxy_pd_names = (char*[]){
-		"cx",
-		"mss",
-		NULL
-	},
-	.load_state = "modem",
-	.ssr_name = "mpss",
-	.sysmon_name = "modem",
-	.ssctl_id = 0x12,
-	.smem_host_id = 1,
-	.region_assign_idx = 2,
-	.region_assign_count = 1,
-	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
-};
-
-static const struct adsp_data sc7280_wpss_resource = {
-	.crash_reason_smem = 626,
-	.firmware_name = "wpss.mdt",
-	.pas_id = 6,
-	.auto_boot = true,
-	.proxy_pd_names = (char*[]){
-		"cx",
-		"mx",
-		NULL
-	},
-	.load_state = "wpss",
-	.ssr_name = "wpss",
-	.sysmon_name = "wpss",
-	.ssctl_id = 0x19,
-};
-
-static const struct adsp_data sm8650_cdsp_resource = {
-	.crash_reason_smem = 601,
-	.firmware_name = "cdsp.mdt",
-	.dtb_firmware_name = "cdsp_dtb.mdt",
-	.pas_id = 18,
-	.dtb_pas_id = 0x25,
-	.minidump_id = 7,
-	.auto_boot = true,
-	.proxy_pd_names = (char*[]){
-		"cx",
-		"mxc",
-		"nsp",
-		NULL
-	},
-	.load_state = "cdsp",
-	.ssr_name = "cdsp",
-	.sysmon_name = "cdsp",
-	.ssctl_id = 0x17,
-	.smem_host_id = 5,
-	.region_assign_idx = 2,
-	.region_assign_count = 1,
-	.region_assign_shared = true,
-	.region_assign_vmid = QCOM_SCM_VMID_CDSP,
-};
+#define RPROC_DATA_COMMON_adsp                                              \
+	.crash_reason_smem = 423, .pas_id = 1, .firmware_name = "adsp.mdt", \
+	.ssr_name = "lpass", .sysmon_name = "adsp", .ssctl_id = 0x14
+#define RPROC_DATA_COMMON_adsp_mbn                                              \
+	.crash_reason_smem = 423, .pas_id = 1, .firmware_name = "adsp.mbn", \
+	.ssr_name = "lpass", .sysmon_name = "adsp", .ssctl_id = 0x14
+
+#define RPROC_DATA_COMMON_mpss                                               \
+	.crash_reason_smem = 421, .pas_id = 4, .firmware_name = "modem.mdt", \
+	.ssr_name = "mpss", .sysmon_name = "modem", .ssctl_id = 0x12
+#define RPROC_DATA_COMMON_mpss1                                              \
+	.crash_reason_smem = 421, .pas_id = 4, .firmware_name = "modem.mdt", \
+	.ssr_name = "mpss", .sysmon_name = "modem", .ssctl_id = 0x22
+
+#define RPROC_DATA_COMMON_cdsp                                               \
+	.crash_reason_smem = 601, .pas_id = 18, .firmware_name = "cdsp.mdt", \
+	.ssr_name = "cdsp", .sysmon_name = "cdsp", .ssctl_id = 0x17
+#define RPROC_DATA_COMMON_nsp0                                               \
+	.crash_reason_smem = 601, .pas_id = 18, .firmware_name = "cdsp.mdt", \
+	.ssr_name = "cdsp0", .sysmon_name = "cdsp", .ssctl_id = 0x17
+#define RPROC_DATA_COMMON_cdsp0                                               \
+	.crash_reason_smem = 601, .pas_id = 18, .firmware_name = "cdsp0.mbn", \
+	.ssr_name = "cdsp", .sysmon_name = "cdsp", .ssctl_id = 0x17
+
+#define RPROC_DATA_COMMON_nsp1                                               \
+	.crash_reason_smem = 633, .pas_id = 30, .firmware_name = "cdsp.mdt", \
+	.ssr_name = "cdsp1", .sysmon_name = "cdsp1", .ssctl_id = 0x20
+#define RPROC_DATA_COMMON_cdsp1                                               \
+	.crash_reason_smem = 633, .pas_id = 30, .firmware_name = "cdsp1.mbn", \
+	.ssr_name = "cdsp1", .sysmon_name = "cdsp1", .ssctl_id = 0x20
+
+#define RPROC_DATA_COMMON_slpi                                               \
+	.crash_reason_smem = 424, .pas_id = 12, .firmware_name = "slpi.mdt", \
+	.ssr_name = "dsps", .sysmon_name = "slpi", .ssctl_id = 0x16
+#define RPROC_DATA_COMMON_wcnss                                              \
+	.crash_reason_smem = 421, .pas_id = 6, .firmware_name = "wcnss.mdt", \
+	.ssr_name = "mpss", .sysmon_name = "wcnss", .ssctl_id = 0x12
+#define RPROC_DATA_COMMON_wpss                                              \
+	.crash_reason_smem = 626, .pas_id = 6, .firmware_name = "wpss.mdt", \
+	.ssr_name = "wpss", .sysmon_name = "wpss", .ssctl_id = 0x19
+
+#define RPROC_DATA_COMMON_gpdsp0                                              \
+	.crash_reason_smem = 640, .pas_id = 39, .firmware_name = "gpdsp0.mbn", \
+	.ssr_name = "gpdsp0", .sysmon_name = "gpdsp0", .ssctl_id = 0x21
+#define RPROC_DATA_COMMON_gpdsp1                                              \
+	.crash_reason_smem = 641, .pas_id = 40, .firmware_name = "gpdsp1.mbn", \
+	.ssr_name = "gpdsp1", .sysmon_name = "gpdsp1", .ssctl_id = 0x22
+
+#define RPROC_DATA_COMMON_FOR_SS(ss) RPROC_DATA_COMMON_##ss
+
+#define RPROC_DATA_FILLER(target, ss, dtpid, dtfname, lid, mid, sid, autob,   \
+			  decshut, loadstate, regidx, regcnt, regshd, regvmid, \
+			  ...)                                                 \
+	static const struct adsp_data target##_##ss##_resource = {             \
+		RPROC_DATA_COMMON_FOR_SS(ss),                                  \
+		.dtb_pas_id = dtpid,                                           \
+		.dtb_firmware_name = dtfname,                                  \
+		.lite_pas_id = lid,                                            \
+		.minidump_id = mid,                                            \
+		.smem_host_id = sid,                                            \
+		.auto_boot = autob,                                            \
+		.decrypt_shutdown = decshut,                                   \
+		.proxy_pd_names = (char *[]){ __VA_ARGS__ },                   \
+		.load_state = loadstate,                                       \
+		.region_assign_idx = regidx,                                   \
+		.region_assign_count = regcnt,                                 \
+		.region_assign_shared = regshd,                                \
+		.region_assign_vmid = regvmid,                                 \
+	}

-static const struct adsp_data sm8650_mpss_resource = {
-	.crash_reason_smem = 421,
-	.firmware_name = "modem.mdt",
-	.dtb_firmware_name = "modem_dtb.mdt",
-	.pas_id = 4,
-	.dtb_pas_id = 0x26,
-	.minidump_id = 3,
-	.auto_boot = false,
-	.decrypt_shutdown = true,
-	.proxy_pd_names = (char*[]){
-		"cx",
-		"mss",
-		NULL
-	},
-	.load_state = "modem",
-	.ssr_name = "mpss",
-	.sysmon_name = "modem",
-	.ssctl_id = 0x12,
-	.smem_host_id = 1,
-	.region_assign_idx = 2,
-	.region_assign_count = 3,
-	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
-};
+RPROC_DATA_FILLER(common,    adsp,   0,     NULL,             0,     0,  0, true,   false,  NULL,     0,  0,  false,  0,                      NULL);
+RPROC_DATA_FILLER(sa8775p,    adsp_mbn,   0,     NULL,             0,     5,  0, true,   false,  "adsp",   0,  0,  false,  0,       "lcx", "lmx", NULL);
+RPROC_DATA_FILLER(sdm845,    adsp,   0,     NULL,             0,     0,  0, true,   false,  "adsp",   0,  0,  false,  0,                      NULL);
+RPROC_DATA_FILLER(sm6350,    adsp,   0,     NULL,             0,     0,  0, true,   false,  "adsp",   0,  0,  false,  0,                      "lcx",     "lmx",  NULL);
+RPROC_DATA_FILLER(sm6375,    mpss,   0,     NULL,             0,     3,  0, false,  false,  NULL,     0,  0,  false,  0,                      "cx",      NULL);
+RPROC_DATA_FILLER(sm8150,    adsp,   0,     NULL,             0,     0,  0, true,   false,  "adsp",   0,  0,  false,  0,                      "cx",      NULL);
+RPROC_DATA_FILLER(sm8250,    adsp,   0,     NULL,             0,     0,  0, true,   false,  "adsp",   0,  0,  false,  0,                      "lcx",     "lmx",  NULL);
+RPROC_DATA_FILLER(sm8350,    adsp,   0,     NULL,             0,     0,  0, true,   false,  "adsp",   0,  0,  false,  0,                      "lcx",     "lmx",  NULL);
+RPROC_DATA_FILLER(msm8996,   adsp,   0,     NULL,             0,     0,  0, true,   false,  NULL,     0,  0,  false,  0,                      "cx",      NULL);
+RPROC_DATA_FILLER(common,    cdsp,   0,     NULL,             0,     0,  0, true,   false,  NULL,     0,  0,  false,  0,                      NULL);
+RPROC_DATA_FILLER(sa8775p,    cdsp0,   0,     NULL,             0,     7,  0, true,   false,  NULL,     0,  0,  false,  0, "cx", "mxc", "nsp", NULL);
+RPROC_DATA_FILLER(sa8775p,    cdsp1,   0,     NULL,             0,     20,  0, true,   false,  NULL,     0,  0,  false,  0, "cx", "mxc", "nsp", NULL);
+RPROC_DATA_FILLER(sdm845,    cdsp,   0,     NULL,             0,     0,  0, true,   false,  "cdsp",   0,  0,  false,  0,                      NULL);
+RPROC_DATA_FILLER(sm6350,    cdsp,   0,     NULL,             0,     0,  0, true,   false,  "cdsp",   0,  0,  false,  0,                      "cx",      "mx",   NULL);
+RPROC_DATA_FILLER(sm8150,    cdsp,   0,     NULL,             0,     0,  0, true,   false,  "cdsp",   0,  0,  false,  0,                      "cx",      NULL);
+RPROC_DATA_FILLER(sm8250,    cdsp,   0,     NULL,             0,     0,  0, true,   false,  "cdsp",   0,  0,  false,  0,                      "cx",      NULL);
+RPROC_DATA_FILLER(sc8280xp,  nsp0,   0,     NULL,             0,     0,  0, true,   false,  NULL,     0,  0,  false,  0,                      "nsp",     NULL);
+RPROC_DATA_FILLER(sc8280xp,  nsp1,   0,     NULL,             0,     0,  0, true,   false,  NULL,     0,  0,  false,  0,                      "nsp",     NULL);
+RPROC_DATA_FILLER(x1e80100,  adsp,   0x24,  "adsp_dtb.mdt",   0x1f,  5,  0, true,   false,  "adsp",   0,  0,  false,  0,                      "lcx",     "lmx",  NULL);
+RPROC_DATA_FILLER(x1e80100,  cdsp,   0x25,  "cdsp_dtb.mdt",   0,     7,  0, true,   false,  "cdsp",   0,  0,  false,  0,                      "cx",      "mxc",  "nsp",  NULL);
+RPROC_DATA_FILLER(sm8350,    cdsp,   0,     NULL,             0,     0,  0, true,   false,  "cdsp",   0,  0,  false,  0,                      "cx",      "mxc",  NULL);
+RPROC_DATA_FILLER(sa8775p,    gpdsp0,   0,     NULL,             0,     21,  0, true,   false,  NULL,     0,  0,  false,  0, "cx", "mxc", NULL);
+RPROC_DATA_FILLER(sa8775p,    gpdsp1,   0,     NULL,             0,     22,  0, true,   false,  NULL,     0,  0,  false,  0, "cx", "mxc", NULL);
+RPROC_DATA_FILLER(common,    mpss,   0,     NULL,             0,     3,  0, false,  false,  "modem",  0,  0,  false,  0,                      "cx",      "mss",  NULL);
+RPROC_DATA_FILLER(sc8180x,   mpss,   0,     NULL,             0,     0,  0, false,  false,  "modem",  0,  0,  false,  0,                      "cx",      NULL);
+RPROC_DATA_FILLER(msm8996,   slpi,   0,     NULL,             0,     0,  0, true,   false,  NULL,     0,  0,  false,  0,                      "ssc_cx",  NULL);
+RPROC_DATA_FILLER(sdm845,    slpi,   0,     NULL,             0,     0,  0, true,   false,  "slpi",   0,  0,  false,  0,                      "lcx",     "lmx",  NULL);
+RPROC_DATA_FILLER(qcs404,    wcnss,  0,     NULL,             0,     0,  0, true,   false,  NULL,     0,  0,  false,  0,                      NULL);
+RPROC_DATA_FILLER(sdx55,     mpss1,  0,     NULL,             0,     0,  0, true,   false,  NULL,     0,  0,  false,  0,                      "cx",      "mss",  NULL);
+RPROC_DATA_FILLER(sm8450,    mpss,   0,     NULL,             0,     3,  0, false,  true,   "modem",  0,  0,  false,  0,                      "cx",      "mss",  NULL);
+RPROC_DATA_FILLER(sm8550,    adsp,   0x24,  "adsp_dtb.mdt",   0,     5,  2, true,   false,  "adsp",   0,  0,  false,  0,                      "lcx",     "lmx",  NULL);
+RPROC_DATA_FILLER(sm8550,    cdsp,   0x25,  "cdsp_dtb.mdt",   0,     7,  5, true,   false,  "cdsp",   0,  0,  false,  0,                      "cx",      "mxc",  "nsp",  NULL);
+RPROC_DATA_FILLER(sm8550,    mpss,   0x26,  "modem_dtb.mdt",  0,     3,  1, false,  true,   "modem",  2,  1,  false,  QCOM_SCM_VMID_MSS_MSA,  "cx",      "mss",  NULL);
+RPROC_DATA_FILLER(sc7280,    wpss,   0,     NULL,             0,     0,  0, true,   false,  "wpss",   0,  0,  false,  0,                      "cx",      "mx",   NULL);
+RPROC_DATA_FILLER(sm8650,    cdsp,   0x25,  "cdsp_dtb.mdt",   0,     7,  5, true,   false,  "cdsp",   2,  1,  true,   QCOM_SCM_VMID_CDSP,     "cx",      "mxc",  "nsp",  NULL);
+RPROC_DATA_FILLER(sm8650,    mpss,   0x26,  "modem_dtb.mdt",  0,     3,  1, false,  true,   "modem",  2,  3,  false,  QCOM_SCM_VMID_MSS_MSA,  "cx",      "mss",  NULL);

 static const struct of_device_id adsp_of_match[] = {
-	{ .compatible = "qcom,msm8226-adsp-pil", .data = &adsp_resource_init},
+	{ .compatible = "qcom,msm8226-adsp-pil", .data = &common_adsp_resource},
 	{ .compatible = "qcom,msm8953-adsp-pil", .data = &msm8996_adsp_resource},
-	{ .compatible = "qcom,msm8974-adsp-pil", .data = &adsp_resource_init},
+	{ .compatible = "qcom,msm8974-adsp-pil", .data = &common_adsp_resource},
 	{ .compatible = "qcom,msm8996-adsp-pil", .data = &msm8996_adsp_resource},
-	{ .compatible = "qcom,msm8996-slpi-pil", .data = &msm8996_slpi_resource_init},
+	{ .compatible = "qcom,msm8996-slpi-pil", .data = &msm8996_slpi_resource},
 	{ .compatible = "qcom,msm8998-adsp-pas", .data = &msm8996_adsp_resource},
-	{ .compatible = "qcom,msm8998-slpi-pas", .data = &msm8996_slpi_resource_init},
-	{ .compatible = "qcom,qcs404-adsp-pas", .data = &adsp_resource_init },
-	{ .compatible = "qcom,qcs404-cdsp-pas", .data = &cdsp_resource_init },
-	{ .compatible = "qcom,qcs404-wcss-pas", .data = &wcss_resource_init },
-	{ .compatible = "qcom,sa8775p-adsp-pas", .data = &sa8775p_adsp_resource},
+	{ .compatible = "qcom,msm8998-slpi-pas", .data = &msm8996_slpi_resource},
+	{ .compatible = "qcom,qcs404-adsp-pas", .data = &common_adsp_resource },
+	{ .compatible = "qcom,qcs404-cdsp-pas", .data = &common_cdsp_resource },
+	{ .compatible = "qcom,qcs404-wcss-pas", .data = &qcs404_wcnss_resource },
+	{ .compatible = "qcom,sa8775p-adsp-pas", .data = &sa8775p_adsp_mbn_resource},
 	{ .compatible = "qcom,sa8775p-cdsp0-pas", .data = &sa8775p_cdsp0_resource},
 	{ .compatible = "qcom,sa8775p-cdsp1-pas", .data = &sa8775p_cdsp1_resource},
 	{ .compatible = "qcom,sa8775p-gpdsp0-pas", .data = &sa8775p_gpdsp0_resource},
 	{ .compatible = "qcom,sa8775p-gpdsp1-pas", .data = &sa8775p_gpdsp1_resource},
 	{ .compatible = "qcom,sc7180-adsp-pas", .data = &sm8250_adsp_resource},
-	{ .compatible = "qcom,sc7180-mpss-pas", .data = &mpss_resource_init},
+	{ .compatible = "qcom,sc7180-mpss-pas", .data = &common_mpss_resource},
 	{ .compatible = "qcom,sc7280-adsp-pas", .data = &sm8350_adsp_resource},
 	{ .compatible = "qcom,sc7280-cdsp-pas", .data = &sm6350_cdsp_resource},
-	{ .compatible = "qcom,sc7280-mpss-pas", .data = &mpss_resource_init},
+	{ .compatible = "qcom,sc7280-mpss-pas", .data = &common_mpss_resource},
 	{ .compatible = "qcom,sc7280-wpss-pas", .data = &sc7280_wpss_resource},
 	{ .compatible = "qcom,sc8180x-adsp-pas", .data = &sm8150_adsp_resource},
 	{ .compatible = "qcom,sc8180x-cdsp-pas", .data = &sm8150_cdsp_resource},
@@ -1433,35 +954,35 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sc8280xp-adsp-pas", .data = &sm8250_adsp_resource},
 	{ .compatible = "qcom,sc8280xp-nsp0-pas", .data = &sc8280xp_nsp0_resource},
 	{ .compatible = "qcom,sc8280xp-nsp1-pas", .data = &sc8280xp_nsp1_resource},
-	{ .compatible = "qcom,sdm660-adsp-pas", .data = &adsp_resource_init},
-	{ .compatible = "qcom,sdm845-adsp-pas", .data = &sdm845_adsp_resource_init},
-	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &sdm845_cdsp_resource_init},
-	{ .compatible = "qcom,sdm845-slpi-pas", .data = &sdm845_slpi_resource_init},
-	{ .compatible = "qcom,sdx55-mpss-pas", .data = &sdx55_mpss_resource},
+	{ .compatible = "qcom,sdm660-adsp-pas", .data = &common_adsp_resource},
+	{ .compatible = "qcom,sdm845-adsp-pas", .data = &sdm845_adsp_resource},
+	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &sdm845_cdsp_resource},
+	{ .compatible = "qcom,sdm845-slpi-pas", .data = &sdm845_slpi_resource},
+	{ .compatible = "qcom,sdx55-mpss-pas", .data = &sdx55_mpss1_resource},
 	{ .compatible = "qcom,sdx75-mpss-pas", .data = &sm8650_mpss_resource},
-	{ .compatible = "qcom,sm6115-adsp-pas", .data = &adsp_resource_init},
-	{ .compatible = "qcom,sm6115-cdsp-pas", .data = &cdsp_resource_init},
+	{ .compatible = "qcom,sm6115-adsp-pas", .data = &common_adsp_resource},
+	{ .compatible = "qcom,sm6115-cdsp-pas", .data = &common_cdsp_resource},
 	{ .compatible = "qcom,sm6115-mpss-pas", .data = &sc8180x_mpss_resource},
 	{ .compatible = "qcom,sm6350-adsp-pas", .data = &sm6350_adsp_resource},
 	{ .compatible = "qcom,sm6350-cdsp-pas", .data = &sm6350_cdsp_resource},
-	{ .compatible = "qcom,sm6350-mpss-pas", .data = &mpss_resource_init},
+	{ .compatible = "qcom,sm6350-mpss-pas", .data = &common_mpss_resource},
 	{ .compatible = "qcom,sm6375-adsp-pas", .data = &sm6350_adsp_resource},
 	{ .compatible = "qcom,sm6375-cdsp-pas", .data = &sm8150_cdsp_resource},
 	{ .compatible = "qcom,sm6375-mpss-pas", .data = &sm6375_mpss_resource},
 	{ .compatible = "qcom,sm8150-adsp-pas", .data = &sm8150_adsp_resource},
 	{ .compatible = "qcom,sm8150-cdsp-pas", .data = &sm8150_cdsp_resource},
-	{ .compatible = "qcom,sm8150-mpss-pas", .data = &mpss_resource_init},
-	{ .compatible = "qcom,sm8150-slpi-pas", .data = &sdm845_slpi_resource_init},
+	{ .compatible = "qcom,sm8150-mpss-pas", .data = &common_mpss_resource},
+	{ .compatible = "qcom,sm8150-slpi-pas", .data = &sdm845_slpi_resource},
 	{ .compatible = "qcom,sm8250-adsp-pas", .data = &sm8250_adsp_resource},
 	{ .compatible = "qcom,sm8250-cdsp-pas", .data = &sm8250_cdsp_resource},
-	{ .compatible = "qcom,sm8250-slpi-pas", .data = &sdm845_slpi_resource_init},
+	{ .compatible = "qcom,sm8250-slpi-pas", .data = &sdm845_slpi_resource},
 	{ .compatible = "qcom,sm8350-adsp-pas", .data = &sm8350_adsp_resource},
 	{ .compatible = "qcom,sm8350-cdsp-pas", .data = &sm8350_cdsp_resource},
-	{ .compatible = "qcom,sm8350-slpi-pas", .data = &sdm845_slpi_resource_init},
-	{ .compatible = "qcom,sm8350-mpss-pas", .data = &mpss_resource_init},
+	{ .compatible = "qcom,sm8350-slpi-pas", .data = &sdm845_slpi_resource},
+	{ .compatible = "qcom,sm8350-mpss-pas", .data = &common_mpss_resource},
 	{ .compatible = "qcom,sm8450-adsp-pas", .data = &sm8350_adsp_resource},
 	{ .compatible = "qcom,sm8450-cdsp-pas", .data = &sm8350_cdsp_resource},
-	{ .compatible = "qcom,sm8450-slpi-pas", .data = &sdm845_slpi_resource_init},
+	{ .compatible = "qcom,sm8450-slpi-pas", .data = &sdm845_slpi_resource},
 	{ .compatible = "qcom,sm8450-mpss-pas", .data = &sm8450_mpss_resource},
 	{ .compatible = "qcom,sm8550-adsp-pas", .data = &sm8550_adsp_resource},
 	{ .compatible = "qcom,sm8550-cdsp-pas", .data = &sm8550_cdsp_resource},
--
2.46.1


