Return-Path: <linux-arm-msm+bounces-41791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF38F9EF206
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 17:44:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F183189EDB5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 16:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF28C23DE82;
	Thu, 12 Dec 2024 16:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VGgmxxLH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB9922A1C0;
	Thu, 12 Dec 2024 16:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734020742; cv=none; b=a1uDBUUQsSjW2AdCcuigPyrsNnGowPv5tLN9vrisAMNgqVUbDyitGwjjSp99icTpz2l6xg23s+CgZ6JiJpdSFMB7liEYyfSnRTH+h8mhMEhlzifEmAt7MjFHY6jTNTallPXi9tPXMfZdcPk4jGLbXmuf40RokHXYpkXehClzd0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734020742; c=relaxed/simple;
	bh=/80D6SSlGn7n1xvUC5voFQwABZp0R2C/r631Sf2IRfQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oWQ4t1IZy9eaYqEdgMnbnb5VZtTGYY+BnEpB2S1b/VPzLIoquzoW/uVown5N2TS/IFdVNI4u/uc/nhAA0h4hfDUPUXyYnfSye2z7so0dDzyy6M8/E71Oi8CSthcJK7P0axBk3b5ocbpW6dfwTYsm+juPdxoOovgr3TGtkbgh+sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VGgmxxLH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC7wX6T030073;
	Thu, 12 Dec 2024 16:25:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l/1hRtL88eL8s2U9Di8ClmmpZhI+xqSo8rdmBhnrAjc=; b=VGgmxxLHRhTgBPwy
	kQzOKPGCTEe9BwccXSYWlHgU0xwjRNq1MZ408UopA8jJt/fAvGjji2w+jcyV6bW6
	0C7gghUksGBPkGMmxVBvpvsaYrtJzzkZpunD4Gn8ik4kaW6GN9wuWiNB2vMsigw/
	3rFOZ+xpe8O3wmfDIKYYcsn89YZsD1Z1y+pPpCwGbk2WHtw+YiJ/096qQ1ywOONl
	VVp3kbiJ51pkBXdww+FRKHTEeAS94PQApgZ74KvvwrnBFGoTUKAsZ5GSV7tqr+m6
	fS7RJmYkDbkbcnIdaxFazFJBlgWvKrGuYKhDd7M8mf+3FelZBEAKiDM+l9gSPjlU
	m9q5gw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43dxw4byye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 16:25:29 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BCGPSk8014761
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 16:25:28 GMT
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 12 Dec 2024 08:25:21 -0800
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
Subject: [PATCH v5 4/4] ASoC: qcom: sdw: Add get and set channel maps support from codec to cpu dais
Date: Thu, 12 Dec 2024 21:53:34 +0530
Message-ID: <20241212162334.36739-5-quic_mohs@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241212162334.36739-1-quic_mohs@quicinc.com>
References: <20241212162334.36739-1-quic_mohs@quicinc.com>
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
X-Proofpoint-ORIG-GUID: CbMJFmKfZ1pk65Ju96SOug-iGSAyq2jh
X-Proofpoint-GUID: CbMJFmKfZ1pk65Ju96SOug-iGSAyq2jh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 clxscore=1015 spamscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120118

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


