Return-Path: <linux-arm-msm+bounces-85457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3633ACC6EEC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 11:00:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E26E83088187
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 09:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D0E324B09;
	Wed, 17 Dec 2025 09:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NIiKTInG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="He5g5nwh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A8133506C
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 09:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765964776; cv=none; b=gCVqKHlrEGjoOHp18Qh9cXrwOxwJe5Qf0u3p0Kfe6bjieXXQvHYC16/8flz2Bo57ozOAjTqGbNi0O1VYoGSXmCZS8hQqmD30FjLG6L0yl64Uxfhbjfkm7bYY3Kw2YnaaHRlKWYpHHbmyLWH2H02qdra7pzcs8B7bx18FRsMDw5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765964776; c=relaxed/simple;
	bh=C5jTB6u/iPGWZJLucmw+nDd7E0P12QEw8yvsWTZHFhI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NyNTOLAvtWYkZPfu52U9D94Fb2bM380c3DuRcc3SoHcEOtm6M97iiAQ3ffZVnp0d1oML8lviXeb1Giir9ETz0cKgoigf6oZq4HeyB+iHB7CBry/W2lQP8Tdv2gwWxgGLNzwu63Eh88KfNUJ7Q1nXCcbqagbbhLwe0nmK3BWjWyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NIiKTInG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=He5g5nwh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3FWwJ1281968
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 09:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=auNSLQbYHwi+XzWgHuBAIIyBjjt3Spa3XFf
	A9lCDs+8=; b=NIiKTInGKKsqcFP2ZcQ0DP3P04nar/fMHChkR/WFEAin1WQmb8J
	BtkswnmneGVJtIhRTQQlgdrBiyTDcDxPGXKCkvNTRTWp9UaGslGC0QxyuNeASsnT
	5Ry8aeRscS2RVda7zK0TT+EZ3Up/o64IPjh+X7h5q8El7MqtBI45NWfcCt/DFEdn
	ytSOXPLUIArsQSRPyZoxdJrFr3E1P/lWZasxZcjgmI0ZdOzwMBeKcoUyRJCpRQJr
	JplFls+Y0+f/xZOekCGEYpzyB7C8JlCIXNR7PWsQHLkNhFYsIRvpuqHJ4VMFrdoO
	N5SjAElfhFEnfP8mJUgyoVtCJlDFqUPTI0A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fe29wpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 09:46:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed7591799eso120563421cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 01:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765964772; x=1766569572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=auNSLQbYHwi+XzWgHuBAIIyBjjt3Spa3XFfA9lCDs+8=;
        b=He5g5nwhVIBPIk6mo8zvQNjqZR0/Llja2XvVjhsbLBOxHyR+5URN66AUsYID76aJGs
         ph82S1vIDCQKMpN8w6QSBEk2mlLxTBZgrd8iseExvyqC1nD0P7Ca+WU+fFJqBmk6YxU7
         d/6pKpBB5cKMxfSnZKyu6ywKa22GxmRTgeNtKFjXOxCcDInDSmaGfhx0cUNxNxdU9iLh
         7dKQJ79ZBBpsyuAFB8ufzE9wdBR8Nxr76inpWvBCfpiPfEbfwXf1GFeBW8TlF5r2GozJ
         VH2Ni6WnwqWez+GDiSp/ZxWSnoADEx6/kiTsL/U6j04i5QXXWvDgAewLpyF/TLuA5ek9
         Mu8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765964772; x=1766569572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=auNSLQbYHwi+XzWgHuBAIIyBjjt3Spa3XFfA9lCDs+8=;
        b=PYaraPL1PJKXhaJqaj7XUIrLSks0QM8m5+mSPbaIxFn8+Du8QTjzUA2dHw76KvBS4J
         M1l+rV/Bk/kMpFhPaYAx8yBM3Qs1bZlb8CeuShD/1tr7egP/jkFfXFkoFlqQNsCrdgx1
         W8dOu9UsFyjElOH5iVStjAX44yJC/eABtFOXDk7mZg00ujrP+vjDNZpHhcGa+JvN5SL5
         DJnlDRBexqPIjISZdg1Uqy1wmLAARxdYhZcsxKu5nQoicLEdibJxfX4knx5tZ9Fi9Di4
         upUAWrDqOOWUd14e5KVmf6uvvEyDoeCLX72GDh93TolcxjoU5YuX2GEdSQFNRnf4+mA5
         eC2g==
X-Forwarded-Encrypted: i=1; AJvYcCVgs7E7n0H52r9SC9TUXy+6TIVSsZVmdQcAwuyNQQoZNNfOwhfTCiLZbO0+nO4LKl+cqJH57od7OPNf/ZVJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyFVzDBySbwjE7rmN3ORftgJjlUmW6NTPFbBnVOOpXernqk8cMr
	3S/0Z7HRTasxgkCclwwORfNr+xfa0XKQlu89XADICkcWrkFtvkQAUF2t1JUdKwCEGfLrZCpekAx
	yfLGClZ4FBhnWJ748DaQvtzOMxibLWb/6tJjSdrQZdtjjsQDsBhFPnxDPXuEt87eMh90frnxrQT
	D6
X-Gm-Gg: AY/fxX7hf/vyZbY3ol8zOuLPWGDLMZOKfN5ax0hnosLM5O2z/itGrKf4wq0+0/on2Qp
	kdpOCuvmMiEnAq2d8T200RyVVilCWpVij6Prakzz08ffedoGTLxCK8++OpolEKDARoKWFci45kw
	wNNRiip+qfJ3m56NxGWwoSQFlhwxSkopvZgL3iQ3i+LI5fNDpHhZe/fm052fq271CNTUbIrnCqM
	MaPwSjCum2AB8+M37VDAAshN5AgmNmCXirI8BblYdQnZB28Qh8ZQMrPr2aF/b4nQqDBQqnkDBXO
	lGGExwxeFC46Ymk0e4IYRV7Mhehc2qUyOhFRzlgSeTqeDdn/JVSLvEA1CMSY9aBzDwyK2x5+DcQ
	zy2BBx3wB6yT+3DuOmjBjo5Ih
X-Received: by 2002:a05:622a:14cd:b0:4ee:49c9:a923 with SMTP id d75a77b69052e-4f1d05d0ca2mr221694461cf.56.1765964772206;
        Wed, 17 Dec 2025 01:46:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7mhOzHEn4F2LlEoDp2/Tw+Waa0DTW1eqOT6mO3D1sgs9nqFNd6ZEKzScuc/IgUFQVWD79pQ==
X-Received: by 2002:a05:622a:14cd:b0:4ee:49c9:a923 with SMTP id d75a77b69052e-4f1d05d0ca2mr221694241cf.56.1765964771741;
        Wed, 17 Dec 2025 01:46:11 -0800 (PST)
Received: from quoll ([178.197.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7ffacd9192sm356502466b.70.2025.12.17.01.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 01:46:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 1/2] ASoC: qcom: audioreach: Add support for Speaker Protection module
Date: Wed, 17 Dec 2025 10:46:03 +0100
Message-ID: <20251217094602.55117-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2964; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=C5jTB6u/iPGWZJLucmw+nDd7E0P12QEw8yvsWTZHFhI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpQnvaAWMb5eG9Sd7md5DdPVmByl7DMIulN+tdB
 sOTW+hh/iSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUJ72gAKCRDBN2bmhouD
 10JzD/4vLaQk22U2DlhGX6L8iERNM+L6wOX0X1QcCZYwxAyz+YXFLI/AOiyb/2imODMqpDKaSx9
 VoIKpmm7oT82ZVCCzsRI03Z/5TNo2L4XKZQli/dsZ9Xo3K2KxDs+fWqiOWjleBl4qoJMfO36aRW
 8Mk8a28SSOvY27D5+hb+ymvYxSThi4AmpkdWmYV9VhminCScXRf0qbhzKz7JCIPdPFRX5smui3j
 EqY4H2ThJ2/AgM+myqwAM1dQ5lKfbyHqIXcgs/R9HyWNWVnvUb8r9DAYsyc8sUKLYnxilhHr2la
 dNi0PHXgbyemxQPUxKOK3ZsCLyoK8bcg4Dp9YTRzcHeBX1VEuXESxU/Zk+eUAY7POz2jHjYsN/f
 CC/TEXWNjjp//D9Fuinlvvz/mvGwBpW678VmNH5qNp01O05emxNt8dKXjWHCeciFaXM/yHVAwo1
 6KhQL0Cx2vfykoOjWUXthxS/zC7kTPZHVLEexbA2seXXHxRvo1FOYq0LXTMV5Nnj+VspYbRTWR6
 qL6TAjNB9/uywIhF7jiUQKGASxh9OyzBl7Om4Bch6+ZbLknzdPyc0NmD4ODU5tDLSZsSbfnueDE
 p5UpV6nQ/ZvI3uTvFq4i3eiz6dn2oZ0tA0IvcoOAwEsWEj8Ypdoi2vGtZaz5zM4L0+eLdhvAl8Z GztxeUMbSEr9ovg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Pni8EYwfTM_SnqTCXbflVR4qhIG-qEAY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA3NyBTYWx0ZWRfXxwtSuN4xjKCB
 fl542FnO0wXu2x3dJjmmWz6OTMUNgk6N6Gs0fYN1OSYJA1INhizH12EhXWEN6GPzRjgKIohPuwp
 mF/V9Q0t6+idd1WPUht9JDZojRYy9TmqBEx9jOCxZudxbR/6mZj2qzfk0KvGWiH6GSKIIUqyS9K
 qnMoqeBCbbNHXsFRSZiKbRqHBS9bCcBaZKx3EpSmqoJNazHx/ME4kC31MOvKsVqscdMspchmUIu
 XzHHp17KF69cbIaR7jPV7HrgsHIw1LJvGutHLMThr7Jbtg6deXbvMmOOUoT/wZEI++nvuyQVts6
 2JUCmfQsu2we21DbVpdr5K5lW+kB2IQ2WruFeYI0f2wuW9kdHKFXhz9SzHyM4ANb5jIrQ5+dDe/
 lPrhWO1F59PYmD255hlzLuNtwqFg/g==
X-Proofpoint-ORIG-GUID: Pni8EYwfTM_SnqTCXbflVR4qhIG-qEAY
X-Authority-Analysis: v=2.4 cv=HpN72kTS c=1 sm=1 tr=0 ts=69427be5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kRHUT8tQ9wNbg4cJUFQA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170077

Speaker Protection is capability of ADSP to adjust the gain during
playback to different speakers and their temperature.  This allows good
playback without blowing the speakers up.

Implement parsing MODULE_ID_SPEAKER_PROTECTION from Audioreach topology
and sending it as command to the ADSP.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v4:
1. Rebase so it can be properly applied

Changes in v3:
1. Add Rb tag.

Changes in v2:
1. Add and use PARAM_ID_SP_OP_MODE_NORMAL
---
 sound/soc/qcom/qdsp6/audioreach.c | 13 +++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h | 12 ++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index f3fa0a5b4095..c32a5ee801e7 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -1192,6 +1192,15 @@ static int audioreach_gain_set(struct q6apm_graph *graph, struct audioreach_modu
 	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
 }
 
+static int audioreach_speaker_protection(struct q6apm_graph *graph,
+					 struct audioreach_module *module,
+					 uint32_t operation_mode)
+{
+	return audioreach_send_u32_param(graph, module, PARAM_ID_SP_OP_MODE,
+					 operation_mode);
+}
+
+
 int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_module *module,
 				struct audioreach_module_config *cfg)
 {
@@ -1241,6 +1250,10 @@ int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_mod
 	case MODULE_ID_GAPLESS:
 		rc = audioreach_gapless_set_media_format(graph, module, cfg);
 		break;
+	case MODULE_ID_SPEAKER_PROTECTION:
+		rc = audioreach_speaker_protection(graph, module,
+						   PARAM_ID_SP_OP_MODE_NORMAL);
+		break;
 	default:
 		rc = 0;
 	}
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index d1b60b36468a..19828b4accce 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -31,6 +31,7 @@ struct q6apm_graph;
 #define MODULE_ID_MP3_DECODE		0x0700103B
 #define MODULE_ID_GAPLESS		0x0700104D
 #define MODULE_ID_DISPLAY_PORT_SINK	0x07001069
+#define MODULE_ID_SPEAKER_PROTECTION	0x070010E2
 #define MODULE_ID_OPUS_DEC		0x07001174
 
 #define APM_CMD_GET_SPF_STATE		0x01001021
@@ -559,6 +560,17 @@ struct data_logging_config {
 	uint32_t mode;
 } __packed;
 
+/* Speaker Protection */
+#define PARAM_ID_SP_OP_MODE			0x080011e9
+#define PARAM_ID_SP_OP_MODE_NORMAL		0
+#define PARAM_ID_SP_OP_MODE_CALIBRATION		1
+#define PARAM_ID_SP_OP_MODE_FACTORY_TEST	2
+#define PARAM_ID_SP_OP_MODE_VALIDATION		3
+
+struct param_id_sp_op_mode {
+	uint32_t operation_mode;
+} __packed;
+
 #define PARAM_ID_SAL_OUTPUT_CFG			0x08001016
 struct param_id_sal_output_config {
 	uint32_t bits_per_sample;
-- 
2.51.0


