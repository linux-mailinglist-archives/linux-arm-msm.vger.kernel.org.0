Return-Path: <linux-arm-msm+bounces-47026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B465A2A775
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 12:28:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA80E164172
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2025 11:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 975BD22B598;
	Thu,  6 Feb 2025 11:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ku/eM1RK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71B322ACF2;
	Thu,  6 Feb 2025 11:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738841316; cv=none; b=Utj9Qx8uHL8CCcU9/D0FTNtWxahrVi60g/hKz1yxAtbSbUPXB15v+AxWgpaSKlB5i3xsLU1t/nUpqCOk+Hv8AqpZoW2NcXWGSsrAUXJRreGOIhFKbSav17bjEtAbXnToUU4nF/KIpT1kzCPSpLCWpxBhDRgSxHPNJgXxkTag5Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738841316; c=relaxed/simple;
	bh=bQno1xEKT067vGnwKFhWLIpLFTAbqDNiHrwCUnneeEU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qP/M7BAweofgtMYP87Ot0Mg8u80d74d6JyliTLdE+R0lGOgt4JFYze3aKZlAfvP4z9pWZcITnEdY/SdmToIisyYbWqdN4fZSq9xSC2AWI3RGybnoYUvKUOZaG3WgJgrlb1sSzTZYMcb2z+PeIc/ErEaqs58zUI+vmwn+13L00cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ku/eM1RK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516AEmqK022371;
	Thu, 6 Feb 2025 11:28:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dp1a0XO8qhJhnpjGP+DDMuaAcnBopAYQqncEHWWEO+Q=; b=ku/eM1RKEwQtS7I+
	m2E/PBWXzs8uueRTr8q0m/CFzLVyx1ub2qH+d0U3FWw/4UtS6oq67khpqAgM1oa9
	NZUdq9q6gc2V44sqEZ1qzvWphjBuujvHF1HAu/orP+vEhsvDNGwBLwjng/1vr75f
	eaITldrH/yX0WkW/tP41XvqUILexDQB+8o/t8FXm0+TeDYNkWTGDAdD0whUX7Cyg
	lOOkZMOyWD9rWDWvpSOqZjVFpv84DHGmmxGE5c7duXHD0FdlPA5IrLHPKMzuNPpq
	RyZCat5haROGqO5asRSmg09dPCqgC9aL3gyk1HMG00PjvLmCZSfH+eZLSI0ileJ6
	Ftmawg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mu5gg5gw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 11:28:15 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 516BNAQV017708
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Feb 2025 11:23:10 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Feb 2025 03:23:05 -0800
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao
	<yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>
CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Sanyog Kale
	<sanyog.r.kale@intel.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_pkumpatl@quicinc.com>, <kernel@oss.qualcomm.com>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v6 3/4] soundwire: qcom: Add set_channel_map api support
Date: Thu, 6 Feb 2025 16:52:24 +0530
Message-ID: <20250206112225.3270400-4-quic_mohs@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250206112225.3270400-1-quic_mohs@quicinc.com>
References: <20250206112225.3270400-1-quic_mohs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7TZnxNU2gFmvhi2pwW1cefNSy22r3VG8
X-Proofpoint-GUID: 7TZnxNU2gFmvhi2pwW1cefNSy22r3VG8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_03,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060093

Added qcom_swrm_set_channel_map api to set the master channel mask for
TX and RX paths based on the provided slots.

Added a new field ch_mask to the qcom_swrm_port_config structure.
This field is used to store the master channel mask, which allows more
flexible to configure channel mask in runtime for specific active
soundwire ports.

Modified the qcom_swrm_port_enable function to configure master
channel mask. If the ch_mask is set to SWR_INVALID_PARAM or is zero,
the function will use the default channel mask.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Acked-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/soundwire/qcom.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 0f45e3404756..295a46dc2be7 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -156,6 +156,7 @@ struct qcom_swrm_port_config {
 	u8 word_length;
 	u8 blk_group_count;
 	u8 lane_control;
+	u8 ch_mask;
 };
 
 /*
@@ -1048,9 +1049,13 @@ static int qcom_swrm_port_enable(struct sdw_bus *bus,
 {
 	u32 reg = SWRM_DP_PORT_CTRL_BANK(enable_ch->port_num, bank);
 	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
+	struct qcom_swrm_port_config *pcfg;
 	u32 val;
 
+	pcfg = &ctrl->pconfig[enable_ch->port_num];
 	ctrl->reg_read(ctrl, reg, &val);
+	if (pcfg->ch_mask != SWR_INVALID_PARAM && pcfg->ch_mask != 0)
+		enable_ch->ch_mask = pcfg->ch_mask;
 
 	if (enable_ch->enable)
 		val |= (enable_ch->ch_mask << SWRM_DP_PORT_CTRL_EN_CHAN_SHFT);
@@ -1270,6 +1275,26 @@ static void *qcom_swrm_get_sdw_stream(struct snd_soc_dai *dai, int direction)
 	return ctrl->sruntime[dai->id];
 }
 
+static int qcom_swrm_set_channel_map(struct snd_soc_dai *dai,
+				     unsigned int tx_num, const unsigned int *tx_slot,
+				     unsigned int rx_num, const unsigned int *rx_slot)
+{
+	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
+	int i;
+
+	if (tx_slot) {
+		for (i = 0; i < tx_num; i++)
+			ctrl->pconfig[i].ch_mask = tx_slot[i];
+	}
+
+	if (rx_slot) {
+		for (i = 0; i < rx_num; i++)
+			ctrl->pconfig[i].ch_mask = rx_slot[i];
+	}
+
+	return 0;
+}
+
 static int qcom_swrm_startup(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *dai)
 {
@@ -1306,6 +1331,7 @@ static const struct snd_soc_dai_ops qcom_swrm_pdm_dai_ops = {
 	.shutdown = qcom_swrm_shutdown,
 	.set_stream = qcom_swrm_set_sdw_stream,
 	.get_stream = qcom_swrm_get_sdw_stream,
+	.set_channel_map = qcom_swrm_set_channel_map,
 };
 
 static const struct snd_soc_component_driver qcom_swrm_dai_component = {
-- 
2.34.1


