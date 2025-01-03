Return-Path: <linux-arm-msm+bounces-43823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2C0A003EC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 07:01:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A6003A3B40
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 06:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4A31B6CEA;
	Fri,  3 Jan 2025 06:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="T7zheZ8e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7F11B6CE7;
	Fri,  3 Jan 2025 06:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735884061; cv=none; b=tIwQ+GwfAlgD5bvWUTlbhtF9l4DsuzCNA3S0sT2t81Fmgthy5q3QT03PR0M2CUHXM1bMYmEh+GMgyvbJDQup085UcXf5UdgJBPBcVUNHmBtmWsn2I2BqLEwshnH/M9YjKyrL2t0Be7jUCb6H1qLguzu8yOutpBOhp8PcUSMHCv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735884061; c=relaxed/simple;
	bh=EtJNdqCdLTqmX6ETg4G+YzbTDImEI58wItIPOtzsPmA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cVfO5ZiNbriZ2dLG4FVmTYz5sCdrlz3e/XBVdvwBrqjaFeCsr1ATBUEVIZ4KtWIg0D+0hBcE0qhZVF9l9rnW79o4ELg0BqnDgJZWYnv0n/XTqco48bciV5TqRy2dgLTY7kQJd/cpK3BirUZBhyb7YSv97tUwjHvEQ21Uzxl/btk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=T7zheZ8e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 502Nm6V0009238;
	Fri, 3 Jan 2025 06:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h3cSWte3E1Zdsl62b8vd86GiM+roAILAjl583zt0Ek0=; b=T7zheZ8egckTQy0J
	5s3fbarNwe6+WCHAb/A1D9UkPQmzd8iEqXPdhV7+8JrmLyGTFAzv7yQfXtXb13EM
	+68K68EL6QeInTMtocCVN92vrRkZ9UI6opa2VBCTi9BRIyUL6cNAWD8fGdDN/i22
	dvIKDriQqAjAzcAtSBf5Pvzw1gPN1IhwkuZFV53FVMebCjlNKCIrIKICbD3oHsIP
	nx6/jgX7xBfr4JVO1Ki/rX9kw0G954H3c2PNpqZO3qFDNvjrYSPPoiIfVB5AqdvO
	2ohigJ+Fs/VAJk0ydGmQwrT2DlpU43O2Kr+xnuH3e/qho/4idQ1xCUsjo/WtuX/C
	TBZrhw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43wrefj6un-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jan 2025 06:00:39 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50360c6T030925
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Jan 2025 06:00:38 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 2 Jan 2025 22:00:30 -0800
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
        <quic_pkumpatl@quicinc.com>, <kernel@quicinc.com>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [RESEND v5 3/4] soundwire: qcom: Add set_channel_map api support
Date: Fri, 3 Jan 2025 11:29:13 +0530
Message-ID: <20250103055914.1835943-4-quic_mohs@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250103055914.1835943-1-quic_mohs@quicinc.com>
References: <20250103055914.1835943-1-quic_mohs@quicinc.com>
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
X-Proofpoint-GUID: Otxfmc-ldI3AS78eblR4HBaQgANq3BEx
X-Proofpoint-ORIG-GUID: Otxfmc-ldI3AS78eblR4HBaQgANq3BEx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030048

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
---
 drivers/soundwire/qcom.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index e00c5ac496a6..86763ba3a3b2 100644
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
@@ -1270,6 +1275,27 @@ static void *qcom_swrm_get_sdw_stream(struct snd_soc_dai *dai, int direction)
 	return ctrl->sruntime[dai->id];
 }
 
+static int qcom_swrm_set_channel_map(struct snd_soc_dai *dai,
+				     unsigned int tx_num, unsigned int *tx_slot,
+				     unsigned int rx_num, unsigned int *rx_slot)
+{
+	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
+	struct sdw_stream_runtime *sruntime = ctrl->sruntime[dai->id];
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
@@ -1306,6 +1332,7 @@ static const struct snd_soc_dai_ops qcom_swrm_pdm_dai_ops = {
 	.shutdown = qcom_swrm_shutdown,
 	.set_stream = qcom_swrm_set_sdw_stream,
 	.get_stream = qcom_swrm_get_sdw_stream,
+	.set_channel_map = qcom_swrm_set_channel_map,
 };
 
 static const struct snd_soc_component_driver qcom_swrm_dai_component = {
-- 
2.34.1


