Return-Path: <linux-arm-msm+bounces-61683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A07B4ADE482
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 09:28:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F0E7173FE1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 07:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0818027EC98;
	Wed, 18 Jun 2025 07:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gS2VpFiW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2381E3769;
	Wed, 18 Jun 2025 07:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750231713; cv=none; b=dBpcSV9/fxd9M2fhRB4jz8+MzK2qqSoLulPgDdhNMUNLrV/JCWkdwmG61RUruULWU/FkaDDmFB1AYUxY2Si6qdtugj7bSPtsTQtmJssTXYOTJlmFyu58ujJuZhDHB21eKIyr6CBs4sbzNJFBtcDOi+DaXqee3uNT3RfK6u+kIgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750231713; c=relaxed/simple;
	bh=j7T4RCmlTXgVKzLCcUgiXlV4EZ/RVhIa7wLCrX0oMds=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K7obgkkwcdoQ4uvnGXF5jAtPgw6/InbfY00zj13Z1ev9u4L5DG7Xo7DuRL9w6cr7glKTVfFI7XTivkPgA2AdjiGfJncnjHyg7jy9yoB2qezpJ3/lsRdlmhB0fu2bZR83FBda2DTUGw9tzMnKm4zhsjWxi7+1++igrlrUiaECQJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gS2VpFiW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I1k35o024672;
	Wed, 18 Jun 2025 07:28:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8vsxZBlhE5Z
	Q93p3zKECfKGTMVUpC6yACQ9x1b1vKpI=; b=gS2VpFiW7zbzV2EHkjAEDQFq/Kc
	BJRpShlleU6zYAK24TI/xsMVSB29/Ja1YJnqTk1zaZTLyVTrAwQ/8mrdfmX6ucBC
	7kOX4v+5DFnZ/1a0clEcA0Wgm/ElL0WsO20taJAfC5n09zdpLObpaKuDOa2a3yiu
	aeUbcmVJ1pi4/8t7/yQXNe9yXo+dkPIcfzB16ZBy2UHFg06wi+2+miNEj59JgfoO
	GNC8UDc0YJ72N64ERH5dhvX2prVClpHDl4SkMS3l14QUISWsF1/RKLtja4vH0fEL
	xEWmDrZ6wq31DXb7/fBMqgo5H8fMiJxTinUEZdnWDp4CT4m9uhtyd8daNtQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792ca38p9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 07:28:27 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 55I7SNSj024601;
	Wed, 18 Jun 2025 07:28:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 479k1gnd41-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 07:28:23 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55I7SNEq024589;
	Wed, 18 Jun 2025 07:28:23 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-sartgarg-hyd.qualcomm.com [10.147.242.251])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 55I7SN4n024588
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 07:28:23 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2339771)
	id 435595C6; Wed, 18 Jun 2025 12:58:22 +0530 (+0530)
From: Sarthak Garg <quic_sartgarg@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com,
        Sarthak Garg <quic_sartgarg@quicinc.com>
Subject: [PATCH V3 1/4] mmc: sdhci-msm: Enable tuning for SDR50 mode for SD card
Date: Wed, 18 Jun 2025 12:58:15 +0530
Message-Id: <20250618072818.1667097-2-quic_sartgarg@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250618072818.1667097-1-quic_sartgarg@quicinc.com>
References: <20250618072818.1667097-1-quic_sartgarg@quicinc.com>
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
X-Proofpoint-GUID: Z_gBZDn3xXpiglgxJewKonxh87SEX79_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDA2MiBTYWx0ZWRfX93iAcyo39tz6
 p6qQGUyoZCAfY4KLY9CeX8VU6LeI9MXlWXaqUwgXRHjRxNHrpqZbiH4f3n6lhABY0h9PwsGR0gQ
 bDX9YXPy/I4PeZMOKXn1qq3kiCcaTv9LlJoHy3YHuLMI0ZU2tRgaa4QhZigN0TR1CmXNzde7w8U
 2aRWfAhekrfLr+vGmCiWOnGz4PCf6Jnx/1cRCm47s+3zQETXlyJiTw9SAwo46gsM8gelXhw3YJm
 4GAbZdHdRm6rW99fKp6e+sSH9m4nnR9DUt4Zjt4nEVuDd6Pb3etbm8lEUcOt/5+P4jkOPsGm+Na
 LfhcSrvBNN/7g15Te5w2ui8Iho/ndnZL0oKrUwRYyv3DLdivfgDZVNYB5e6Y7R5Rv8+NKaYhq4k
 MrxBy9TMAkDZ2lCxcAp1uRuL7z1U5LI4XxiTgqkzVAYQBrbqjKd31pkrgw4PVEOf4YX5wPmP
X-Proofpoint-ORIG-GUID: Z_gBZDn3xXpiglgxJewKonxh87SEX79_
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=68526a9b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=QyXUC8HyAAAA:8 a=nNGJRMnCL2qTWb1COHkA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180062

For Qualcomm SoCs which needs level shifter for SD card, extra delay is
seen on receiver data path.

To compensate this delay enable tuning for SDR50 mode for targets which
has level shifter. SDHCI_SDR50_NEEDS_TUNING caps will be set for targets
with level shifter on Qualcomm SOC's.

Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
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
2.34.1


