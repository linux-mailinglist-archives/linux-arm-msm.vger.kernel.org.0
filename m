Return-Path: <linux-arm-msm+bounces-69719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED172B2BE6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 12:06:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A5AC563800
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 10:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C3D321F3D;
	Tue, 19 Aug 2025 10:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nES4S8Yd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718792C2375
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 10:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755597732; cv=none; b=dl8qBoegemmpSGN0jZp5oExGjctP34XBKuhokpAIMnVbkNiU/e5TgZS5QBEP5PrOb6p0cNMCU9BkchRC+02H2PNEYLRT+8HMHsAOzFL90wtxZ8KsELZ4mfyDnt+8ToQ5APStJ14Q4qI6E++xOO7hkh04Mc1Qq3iEsxdMn5iqzPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755597732; c=relaxed/simple;
	bh=ZMDj79JNuxpPNuBtieYFiO7WSUV+XTuIRsLUot9Amxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jmESiBzMKDkB/R0ccw6QCcRT/wA+BExs6xUxsh0C+Cw/CaOEArbdt/Ps0Hdj44IEbqeLHQlJPZ0Pe20wXclI8qaqM3lNEnKsO7y5XSllPyK0Gmt4oL5LWV83tBVZws/oSgMJiiFlhf+GKj6PAQ30J9URfEM3PDgSY8aNgrIC9iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nES4S8Yd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90fgb007332
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 10:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7/8Lx/VqzWp
	eiHTffLhRucXrEdQ6j6on3fcQCwM7QKw=; b=nES4S8Ydz8XSEzazIWEdvJ9j75c
	JH5sCNrxH3NhpsNFIL2RNH8dNXaJUjusDsjIUf8XT3NMOxIYMj2IoPM3ztLbiOc0
	0Q7RHSKz4Nd9CQQioLPWgo6iBztBO2ARbuhcbcbxXvzINXxQeZ4ziinMegGJ7DJo
	z9gV1isaJGBgsP/1R8C8v0nHEKlIp6afwmxiRvp793TnmZ5utFzVZtPONwecjwIk
	tI+euaGa9iB4SVxQ4UVYK/w9J9FW1XppOTCUGAXUQAT7leUBrxyuP+x/e39d08G6
	v3rU2zW+tl3G1jgOnjVl8yBOrZ8xjGulexL1q6n5g0jQU0wL17rTvRC2Lvw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj7484e8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 10:02:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e8704e1baeso1573813285a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 03:02:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755597728; x=1756202528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7/8Lx/VqzWpeiHTffLhRucXrEdQ6j6on3fcQCwM7QKw=;
        b=ZzsBPnqyC5ckjA7tuI4F9+lVdyFWt4TpOoXEYkKMEO2XreQQtCX32GZ7RL002+/19V
         CjZiYGD7wZ1tWfDBhjV7hgLILvr1LNK/esVRkKLxP6xB0uIBGNuwsTZyID+X4BrsJnDf
         yaqOYBg/Sjf69zTwICaI4v8PHovMZcR9NJwWQRwRi+VAteor4EO6RWwKPUgqbFJjF3ka
         5il4bb7WcQ5KNTTpKetDatgtCAdEgu2ayEVGygWqO0ij5YMjS8bCIYqOCZPtnuH1jV9J
         1KqzcuXSx8Zo8ILc4lVC0Zz694m2OzO6nczCqqjfoSGi9VorZszmPaSRwmW4/9ftEkAK
         1Ihw==
X-Forwarded-Encrypted: i=1; AJvYcCXJKaWdCzjcsZUILpsnR7GuqwuHwFVmblhWm7i8dcilxW64zbVJ2Ef+uEmf+55xp5bls7ha47ABwBtj1Wvy@vger.kernel.org
X-Gm-Message-State: AOJu0YxNkBJ3/o7CkH3ktspchdD0VVAWqkyGIMkJ6vDdg49Fg9aT54jq
	Hb7MtsaVYm7Rbh+7jNqRZiFx0M6ySBbBnqDdHcql18aUlkfm/7mW25SW8iet901xOeO+8f39AaN
	aJMdU/iSkX5ecOruXq9fpMHcy9jtKGqMJe4liKSbzri4r+vZG/o5Sugon/y0nUUThOKYBAItEf3
	OC
X-Gm-Gg: ASbGncsQwIO+r0WvtT/0EOg+vbg/twyC3lYha31jwIURGg6+UbPxB0MUnPt65OGSLBR
	LzAwD/oRdjlKDgMuo7paH384hiDm/12LIpgbIjPDcl2sHOXgZwku5tPEbiw8iEmnYGwvWwnygKW
	FFklx76/OesP70IBWqdoryI0ghYqhWpGe3Pdmk5GxN40ksH/4vOwtyL/qJXldcjmWOSs2xl4OiD
	Y2RZ1zJ7ju6MP7brNzlRr6nOe08jhsvl+DquRP0SBpPcDiIqKn9DFIeiW3i7k1xJQhIzT4BKhAU
	RzpnRPHn3uSNd61JJnKe2bNyaXBZ6/gMhRQ+fknn3+xJIITgwXn+lQ==
X-Received: by 2002:a05:6214:5194:b0:70d:6df3:9a7d with SMTP id 6a1803df08f44-70d6df39d8cmr4692376d6.61.1755597727403;
        Tue, 19 Aug 2025 03:02:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWh5qhTWgsqfNEZP+cI13i59i9FkibSaIL6ON7kG82mV1vAsa6wXLKX/gdx47IIO4me3XByw==
X-Received: by 2002:a05:6214:5194:b0:70d:6df3:9a7d with SMTP id 6a1803df08f44-70d6df39d8cmr4691766d6.61.1755597726583;
        Tue, 19 Aug 2025 03:02:06 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c78b410sm216169635e9.24.2025.08.19.03.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 03:02:06 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RESEND PATCH v4 6/6] ASoC: qcom: audioreach: add support for SMECNS module
Date: Tue, 19 Aug 2025 11:01:51 +0100
Message-ID: <20250819100151.1294047-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250819100151.1294047-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250819100151.1294047-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Aa-q-n3wGduPBTcXJuibI-AdOXNQ7JK4
X-Proofpoint-ORIG-GUID: Aa-q-n3wGduPBTcXJuibI-AdOXNQ7JK4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfX3+SDKerFwLx9
 pAyn+HekMXDBv97EiRZU/zUZfXpVo0WlM0Vcj/q2iDItPpF03RWcev20tazMUEsNIrvDCN5ICuj
 7nXdZfj/H3yld5MFj7AzEuni2vCKyssweBG4syJ43XQEhm1HJ2K6++3Uz8m5ntU+0FFlNI365+7
 V5+4DdWnDIooHJo30gLOQlCQTeFNzE+4ErQdvi4/Oqsdm7ZwX+l3j+eE2xMpT6Ki8ZHDLPe2+MW
 bOQDdjDJYcAIUGNglUcz8pZbyqU69LXZFM5xgsJ4n2z8+SJiVizJpAJqDVtn5/dcEmnxOI1Vf1d
 cVc+BEH4xEHa/bTzqRKqSDnPjLsw9dUFoXLc30UJIWLscmzKRBB9ZB33DHLymQlzkm1QbuX4iUN
 DCot73hi
X-Authority-Analysis: v=2.4 cv=MJtgmNZl c=1 sm=1 tr=0 ts=68a44ba1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=oi9uD5rjtjE88QS_ecgA:9
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160033

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

This patch adds support for Single Mic ECNS module, used for echo
cancellation. It also makes use of audioreach_set_module_config to load
the calibration data for this module from ASoC tplg file.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.c | 27 +++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h |  1 +
 2 files changed, 28 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 4ebaaf736fb9..f4c53e84b4dc 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -811,6 +811,30 @@ static int audioreach_gapless_set_media_format(struct q6apm_graph *graph,
 					 EARLY_EOS_DELAY_MS);
 }
 
+static int audioreach_set_module_config(struct q6apm_graph *graph,
+					struct audioreach_module *module,
+					struct audioreach_module_config *cfg)
+{
+	int payload_size = module->data->size;
+	struct gpr_pkt *pkt;
+	int rc;
+	void *p;
+
+	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+
+	memcpy(p, module->data->data, payload_size);
+
+	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
+
+	kfree(pkt);
+
+	return rc;
+}
+
 static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
 					   struct audioreach_module *module,
 					   struct audioreach_module_config *cfg)
@@ -1247,6 +1271,9 @@ int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_mod
 	case MODULE_ID_DISPLAY_PORT_SINK:
 		rc = audioreach_display_port_set_media_format(graph, module, cfg);
 		break;
+	case  MODULE_ID_SMECNS_V2:
+		rc = audioreach_set_module_config(graph, module, cfg);
+		break;
 	case MODULE_ID_I2S_SOURCE:
 	case MODULE_ID_I2S_SINK:
 		rc = audioreach_i2s_set_media_format(graph, module, cfg);
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index e4babf9a44ff..790fba96e34d 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -27,6 +27,7 @@ struct q6apm_graph;
 #define MODULE_ID_CODEC_DMA_SINK	0x07001023
 #define MODULE_ID_CODEC_DMA_SOURCE	0x07001024
 #define MODULE_ID_FLAC_DEC		0x0700102F
+#define MODULE_ID_SMECNS_V2		0x07001031
 #define MODULE_ID_MP3_DECODE		0x0700103B
 #define MODULE_ID_GAPLESS		0x0700104D
 #define MODULE_ID_DISPLAY_PORT_SINK	0x07001069
-- 
2.50.0


