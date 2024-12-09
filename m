Return-Path: <linux-arm-msm+bounces-40961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F749E8ADF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 05:59:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50B791881408
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 04:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60AB519D070;
	Mon,  9 Dec 2024 04:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VT6l33l/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD69119A2A2;
	Mon,  9 Dec 2024 04:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733720256; cv=none; b=IW1+sPWjvRtxAxNwXzKp1mqbjxmur144uOIfH13igXn7o4Ttp73hNI7dRF9nqCrS6Q97TizoDJ1cxlGzX7GZ7hg99DtIb9qyZqnLeVPkN6UWJQPjf2lM9+TrGMKUa8CtEhpOKMcquKephWURyC8nLvzAxfyVx2StWYxuQJdtNuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733720256; c=relaxed/simple;
	bh=/80D6SSlGn7n1xvUC5voFQwABZp0R2C/r631Sf2IRfQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Da5Mq8FmWfCr2O9VmcA8tld5O43e2JIrkmYiHMBSGGWXwWQkYxr+ZLEBvrpXRKaHmmVcChjJK7OMKkcoVFPBUIdmwYkCLsWvJisKrwx8ijt9Y3qb6w+gyKFHAPV1v0+fwCBZ1jHL7RLV0kUGRXJh2+lQoqbokQs5LaeGB/Q0rpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VT6l33l/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B8NbqAe011600;
	Mon, 9 Dec 2024 04:57:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l/1hRtL88eL8s2U9Di8ClmmpZhI+xqSo8rdmBhnrAjc=; b=VT6l33l/sMjBW/RD
	3i+gmn9DzivUi1H2qYFUUNcfvQ6O50YDcI79CzSVS6kiEj7Bkd8hXOZVwly0I2H1
	HxqbTM3MkZN3kbBG56X+sH7i5JtSyWprWNrcT9kOXlthWu8lJ9R5xZp1ooRzOAK+
	2Y/uerchp0m2sqTw1TddaBdoTCanMkeU++q0xHH1sYO0mrhFQJV2l+TLYVKRDUkw
	5+S7i4Whg7BMWtj132WYdzTDNjY795riLQ0QoTPFFirvFUZT2Z2KW+7uWDb4oL3l
	9hJ8dgmIFOchX78+mmhgjMUWJSFxrgsEYNMIQ3LQLALE0y77MuGb65LFR43cm1QA
	0MnqKg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cdc6begx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 04:57:16 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B94vFwr002856
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 04:57:15 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 8 Dec 2024 20:57:07 -0800
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
Subject: [PATCH v4 4/4] ASoC: qcom: sdw: Add get and set channel maps support from codec to cpu dais
Date: Mon, 9 Dec 2024 10:25:51 +0530
Message-ID: <20241209045551.1404782-5-quic_mohs@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241209045551.1404782-1-quic_mohs@quicinc.com>
References: <20241209045551.1404782-1-quic_mohs@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: j9QdmluwBAZY1dHJQw1b_MIcyZ2ppLLL
X-Proofpoint-GUID: j9QdmluwBAZY1dHJQw1b_MIcyZ2ppLLL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090038

Add get and set channel maps support from codec to cpu dais.

Implemented logic to get the channel map in case of only sdw stream and
set channel map only for specific cpu dais.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
---
 drivers/soundwire/qcom.c |  5 ++---
 sound/soc/qcom/sdw.c     | 34 +++++++++++++++++++++++++++++++---
 2 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 86763ba3a3b2..eb0cf725872e 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1276,11 +1276,10 @@ static void *qcom_swrm_get_sdw_stream(struct snd_soc_dai *dai, int direction)
 }
 
 static int qcom_swrm_set_channel_map(struct snd_soc_dai *dai,
-				     unsigned int tx_num, unsigned int *tx_slot,
-				     unsigned int rx_num, unsigned int *rx_slot)
+				     unsigned int tx_num, const unsigned int *tx_slot,
+				     unsigned int rx_num, const unsigned int *rx_slot)
 {
 	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
-	struct sdw_stream_runtime *sruntime = ctrl->sruntime[dai->id];
 	int i;
 
 	if (tx_slot) {
diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index f2eda2ff46c0..d4d8ed46e6ff 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -25,7 +25,9 @@ int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct sdw_stream_runtime *sruntime;
 	struct snd_soc_dai *codec_dai;
-	int ret, i;
+	int ret, i, j;
+	u32 rx_ch[SDW_MAX_PORTS], tx_ch[SDW_MAX_PORTS];
+	u32 rx_ch_cnt = 0, tx_ch_cnt = 0;
 
 	sruntime = sdw_alloc_stream(cpu_dai->name);
 	if (!sruntime)
@@ -35,9 +37,35 @@ int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
 		ret = snd_soc_dai_set_stream(codec_dai, sruntime,
 					     substream->stream);
 		if (ret < 0 && ret != -ENOTSUPP) {
-			dev_err(rtd->dev, "Failed to set sdw stream on %s\n",
-				codec_dai->name);
+			dev_err(rtd->dev, "Failed to set sdw stream on %s\n", codec_dai->name);
 			goto err_set_stream;
+		} else if (ret == -ENOTSUPP) {
+			/* Ignore unsupported */
+			continue;
+		}
+
+		ret = snd_soc_dai_get_channel_map(codec_dai, &tx_ch_cnt, tx_ch,
+						  &rx_ch_cnt, rx_ch);
+		if (ret != 0 && ret != -ENOTSUPP) {
+			dev_err(rtd->dev, "Failed to get codec chan map %s\n", codec_dai->name);
+			goto err_set_stream;
+		} else if (ret == -ENOTSUPP) {
+			/* Ignore unsupported */
+			continue;
+		}
+	}
+
+	switch (cpu_dai->id) {
+	case RX_CODEC_DMA_RX_0:
+	case TX_CODEC_DMA_TX_3:
+		if (tx_ch_cnt || rx_ch_cnt) {
+			for_each_rtd_codec_dais(rtd, j, codec_dai) {
+				ret = snd_soc_dai_set_channel_map(codec_dai,
+								  tx_ch_cnt, tx_ch,
+								  rx_ch_cnt, rx_ch);
+				if (ret != 0 && ret != -ENOTSUPP)
+					goto err_set_stream;
+			}
 		}
 	}
 
-- 
2.34.1


