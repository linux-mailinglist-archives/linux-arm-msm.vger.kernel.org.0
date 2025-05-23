Return-Path: <linux-arm-msm+bounces-59212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6F0AC21A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 12:58:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E5BD1C04A38
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 10:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43FE22F76E;
	Fri, 23 May 2025 10:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CwIsoDcI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08778229B2A;
	Fri, 23 May 2025 10:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747997880; cv=none; b=Vo+vxbG0nrkkFyfz+ZUMIc0iRxTCFw8H0Mot/VRcbcztz4zxO6S52ceWYiO5tej0WZh7dxcnFxjFj1AImkwydCa246hsT9k/pzv4FlM44X5Ms+0ixNGWBjposqDQu06FJjwQJQvHWVFSFa5Jn5fqi8ed5BMIt1j/AGXe3TjIrms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747997880; c=relaxed/simple;
	bh=nHC5otpeY6WTObR7QcgCLssdNsy/5v2CnnOXdDsSqRQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=RV/XA4UcjxfnXq7q740fgLR1TWMI76+rYCoAtbB1zMdz9R6dvhcwqRk1ZzC6scMfXbpL5ZDahA4rLNYQ+2UGn33v58Wzovwjx9XEO8HaRMdMw3vbo9Dds/QdHgg3ncdIQYWLtr8VyGitmtQ//bss1b+1Iav6ZkVJSZIyj8tG6O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CwIsoDcI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N66Obb025025;
	Fri, 23 May 2025 10:57:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=9vOGCR27MpAMnkaSUwcyhGwe8JNI3nvZRgeBP8E37Yg=; b=Cw
	IsoDcIPDqUWioRH2HWPFxM/klZ1Yjslg9RWtl6YKeQ9ymoYyrgg1lRPNR8/j88Xo
	P/Pi6RW0ZZrcfqb14zZD8sKXKs4dzvcqQSu4KVUTV6iba88iz9ogmJPLx3ep0dpz
	/7Ezp/UrLlqGuUXoeBDplT7SAyiKhci5pF0y5yL2LqVDaUb3tyJf4lR6JGa555gt
	6NbutaIwsv/4MCCGTRmhuoaqKqirgEuE7fXF57mUa1KjwxE+9VfwvSVCsNO2W/xB
	2z7IKhDiM6GkhBue6gTQoqymp+Qgg6rUSM2Bb3947H5ej+4WKsSTs9fWzLAT17fG
	SXWnxhmUyEe0qDpRUkow==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf71m70-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 10:57:52 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54NAvnvD027509;
	Fri, 23 May 2025 10:57:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 46syn0udn7-1;
	Fri, 23 May 2025 10:57:49 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54NAvnvm027504;
	Fri, 23 May 2025 10:57:49 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-sartgarg-hyd.qualcomm.com [10.213.105.147])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 54NAvnjj027503;
	Fri, 23 May 2025 10:57:49 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2339771)
	id 82A24608B7B; Fri, 23 May 2025 16:27:48 +0530 (+0530)
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
Subject: [PATCH V2 1/3] mmc: sdhci-msm: Enable tuning for SDR50 mode for SD card
Date: Fri, 23 May 2025 16:27:43 +0530
Message-Id: <20250523105745.6210-2-quic_sartgarg@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250523105745.6210-1-quic_sartgarg@quicinc.com>
References: <20250523105745.6210-1-quic_sartgarg@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: d-QxgDDI196Gnm2tMPklGDKNJ7MqE9-r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA5NiBTYWx0ZWRfX5xWs51S7gQU/
 uqE/vimaP+h1aGPNO4fa3Ijp4ZFOBjEuOL/mpy6DKhB16drQl6DsE5e42VbSPosfO/AfHKDJb9r
 FpCjG01EPoXEIAKCqUymjMmwRg7pXhIYIj4NhVR8prZWoOYXb8xO7tWFCxpqYrbra1BwJ/jahFE
 0clbckAlKm91BEwozgJZ8bRoZN7YZTPMs/b8T9rUcvMfBHrRO7tAIT8pWXVcP1BD2GrajbkRDGH
 N1cDzMj6cG0bSVguKYwcUrEML2luzCdzWF5uUeOy9IaeSj3TUEWh38F/bSdpoSOmm6D3wgt6R+G
 2gyTJq3PHRQR1S9H/9kWN54JlPGqEBiQGsFk7SsgSFIF4lfy24eogdgQTS91Gt+CDoi96xEhQ/+
 XBiJOPKAxKTFF9+kAXJBSAd0RABX6M2/wmTiADZlhYAnSK5tI23IBRmffuYMbXzjSZF6Aeaa
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=683054b1 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=nNGJRMnCL2qTWb1COHkA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: d-QxgDDI196Gnm2tMPklGDKNJ7MqE9-r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230096
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

For Qualcomm SoCs which needs level shifter for SD card, extra delay is
seen on receiver data path.

To compensate this delay enable tuning for SDR50 mode for targets which
has level shifter. SDHCI_SDR50_NEEDS_TUNING caps will be set for targets
with level shifter on Qualcomm SOC's.

Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
---
 drivers/mmc/host/sdhci-msm.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 66c0d1ba2a33..bf91cb96a0ea 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -81,6 +81,7 @@
 #define CORE_IO_PAD_PWR_SWITCH_EN	BIT(15)
 #define CORE_IO_PAD_PWR_SWITCH	BIT(16)
 #define CORE_HC_SELECT_IN_EN	BIT(18)
+#define CORE_HC_SELECT_IN_SDR50	(4 << 19)
 #define CORE_HC_SELECT_IN_HS400	(6 << 19)
 #define CORE_HC_SELECT_IN_MASK	(7 << 19)
 
@@ -1133,6 +1134,10 @@ static bool sdhci_msm_is_tuning_needed(struct sdhci_host *host)
 {
 	struct mmc_ios *ios = &host->mmc->ios;
 
+	if (ios->timing == MMC_TIMING_UHS_SDR50 &&
+	    host->flags & SDHCI_SDR50_NEEDS_TUNING)
+		return true;
+
 	/*
 	 * Tuning is required for SDR104, HS200 and HS400 cards and
 	 * if clock frequency is greater than 100MHz in these modes.
@@ -1201,6 +1206,8 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
 	struct mmc_ios ios = host->mmc->ios;
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+	const struct sdhci_msm_offset *msm_offset = msm_host->offset;
+	u32 config;
 
 	if (!sdhci_msm_is_tuning_needed(host)) {
 		msm_host->use_cdr = false;
@@ -1217,6 +1224,14 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
 	 */
 	msm_host->tuning_done = 0;
 
+	if (ios.timing == MMC_TIMING_UHS_SDR50 &&
+	    host->flags & SDHCI_SDR50_NEEDS_TUNING) {
+		config = readl_relaxed(host->ioaddr + msm_offset->core_vendor_spec);
+		config &= ~CORE_HC_SELECT_IN_MASK;
+		config |= CORE_HC_SELECT_IN_EN | CORE_HC_SELECT_IN_SDR50;
+		writel_relaxed(config, host->ioaddr + msm_offset->core_vendor_spec);
+	}
+
 	/*
 	 * For HS400 tuning in HS200 timing requires:
 	 * - select MCLK/2 in VENDOR_SPEC
-- 
2.17.1


