Return-Path: <linux-arm-msm+bounces-69570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FCFB2A29C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 14:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3180206A94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 12:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25EBB320CD2;
	Mon, 18 Aug 2025 12:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="My1q/iSZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4523A32039D
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755521469; cv=none; b=BlRbEtNMhF0NMEZOAY7uFEuvbEX66xQYYVblRaCiN3dMjkxyN1IqDkAyLD4xVtjsw+vaj8FK+n7ADepJeDZOgcMYvVBptP+EzI9dX3E9U3RY3atAmntHc0j+hcX0rMjbz/16Wlq5kbg7vsxUzbNMmQNrDFyyI/q/xcZXecWggtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755521469; c=relaxed/simple;
	bh=06kAT+9DrliAjxRD7QFhFtzFqp9qtzZsrREwZHXF9Ms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CnjfOdthF0Mw9n6Vba9QtexBoWfpokgAH3wGemYWWrXhGwOb5B34PaVQ6D+agMB2/Bua1nb8lSP9MSc9fjEXBgHhQMFWrG2EDGyeI9boZ3HmMtTwHiDoP/5hn45WOXdzAFioPIxcznz/1xAd9o0PFGHLRix9u54vMOqWGDXKZmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=My1q/iSZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8Iv4x031445
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:51:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PlcrtGDGu73
	MEF4667+AotAmjGL1GbqsP/mPC9bHYeU=; b=My1q/iSZ0h7R1V3/B1w25B0bTwH
	bE/QQmbScQxfXO41caU6nU63cgk1aGK4M9p+8/wWNh7UZ1XDSjNIdjmO17yLP6z1
	YHFNC3tZVKJw+iXz9TWEaVCNEACSOaVvVl+0+RIkYJOUu0IcKrcA6FfwuPcwlX4x
	COMOM5jMq19yg4OqSibBbZEo7IDjtolLPSdGAYwE9xOOwYryQ3u7fIhZjlqYJUeW
	q51VG71Cv1AFDcCIL343sausMyjAycSmQL5/E4FiL0w3UFM4N6m36yP9Ql1QPAP7
	Za5pWyDP4+R6ZVeQFCFpAQ8ynP7ObKGqUqjrDirXFfOasLTFurNKnf/HdSw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjrfvpf7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:51:05 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a88dae248so89583296d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 05:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755521464; x=1756126264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PlcrtGDGu73MEF4667+AotAmjGL1GbqsP/mPC9bHYeU=;
        b=L+vi/VrUzmN8tl+N8xsCS2xdOCpFaRse6R0njCP1cQO3+bUXk7RCgTPLUDxYD2EkTy
         oLxW6e6pRyA1rK8AS2O58xEfVRGfNeHCyp8/K62dmyscoRZ6maGERhp13HH6nTQmAhqY
         vUbCm6Uv7w9M0uQcGzfVGkNHIvIJYfOTTUaWEZjTjBCW0XF+WaFsat6vPAoV25z7fT3q
         GvmhHp1OR9lDjdEmJUIboOkrouvXoNHD4K4PTnvG0qkQ0W5IQScQLADtlMajUE6HSJqL
         v21FfAJ/9bJWrGTvjWIt/aozbAEjoksm1S1Xoum33oQ9VI1w0KBbS6a0GioI1f+LFhC6
         /9mg==
X-Forwarded-Encrypted: i=1; AJvYcCXtl/6okeL5aV3/XU+BCUxfOqgmlmZjqwvBn1FScF8WS7mvs0eTB40bqWTdeP/L/rKJY87+8Th8kOI0yVvw@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi+YPmi/nZ8k4foQzheJv5XnJ0Bg0xmPgLwanwIHx9ETNDz+Gw
	yvQcfjso5diXIhoRsARusHxvastIxa4daNTz1nAYUgiEwvuApwjx3Ws8RNLmCGO1G4JireifVhI
	k1M282ey+YsJC8gR3/xpB3VynrJ0RpypB2dG0z1XVnNt6jkUF2nju76z8SdwD5xHdd8B4
X-Gm-Gg: ASbGncvyAZLpnMr/jInFyOQoIqMUudLkQetJjGdhvwqBnL4nvIO0mTM4r/NG8fVBrEe
	SdHsJsDbrOHXvPjgkR+oMSqDxblmYd62Zti0CkGo1l6goigfJWflwqrnkGB6W2sSzDLGUysfPiX
	/YtzhYTdsJnFiuJhkHFaojEqOvBbXEgBYV6laZyPrBk5c+P00dBZdTyGCToM/i+mSkKZuEeMu8M
	jZz7P0y9OOXpVhaZEhUhaPDmpJKadnF0Szb/+5nx8kgJHBmKrkmHcX+zXIbmD8b8mo6mC0i20eE
	yU7RVimZ4jPbND2BUJpyVQmGNcmO23pCrdrRN9FM6CbAjSUUPAfukQ==
X-Received: by 2002:a05:6214:76c:b0:6fa:a5c9:2ee7 with SMTP id 6a1803df08f44-70b97d50e1cmr200097356d6.8.1755521463590;
        Mon, 18 Aug 2025 05:51:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRYOz34pRV/ltjYsz0g4ZxkrzJ3SwXSzKHny2OsO5Kv+nDB7W2cT9y7QPPd0Q6h+ip7T7tdQ==
X-Received: by 2002:a05:6214:76c:b0:6fa:a5c9:2ee7 with SMTP id 6a1803df08f44-70b97d50e1cmr200097056d6.8.1755521463076;
        Mon, 18 Aug 2025 05:51:03 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9b27sm12537347f8f.44.2025.08.18.05.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 05:51:02 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 6/6] ASoC: qcom: audioreach: add support for SMECNS module
Date: Mon, 18 Aug 2025 13:50:55 +0100
Message-ID: <20250818125055.1226708-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250818125055.1226708-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250818125055.1226708-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: AyX2i47YgJ-TW9RHzsK61WSfjVnrLtm2
X-Authority-Analysis: v=2.4 cv=YrsPR5YX c=1 sm=1 tr=0 ts=68a321b9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=oi9uD5rjtjE88QS_ecgA:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzOSBTYWx0ZWRfX5afOwcmWhEHf
 Y7T7A8HE/fbTbRCI/emmZkgjH1Siww2N+/KFha3eCKoZuD4k+hhnZb2pwFqee2KAp/unWTRmuV3
 W/DHsAnCIv1wcWORZ6TFFXHSEWl5BVP+IvDY9hunwBMfNI8QDDSl8JIIOi6Iou1xFCzFmtrIRwv
 cCtK2SPEm8SaYd5dNXQy4XCe9CWhX7u2muCFH4gig6vPdg1iCC0iXvZXJhgeh2vSeRuS7WkkipA
 6IZ7asry26+pshCpdkwV8p/klF/y7ryMQlgPTr07os8AryoVeX6CyeQxgc1jK/OkEHl6c21ONmZ
 YbtCFLW5zyJ8Gx65zbi4Lxd9dAYdOz0gqjpS3yfVqo19ch8qCjAN+2xTDhea/NMs8UMOiXKoGUR
 be04d6ez
X-Proofpoint-ORIG-GUID: AyX2i47YgJ-TW9RHzsK61WSfjVnrLtm2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160039

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

This patch adds support for Single Mic ECNS module, used for echo
cancellation. It also makes use of audioreach_set_module_config to load
the calibration data for this module from ASoC tplg file.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
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


