Return-Path: <linux-arm-msm+bounces-78534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBECC00765
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 12:27:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD9F43AA04B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C82AC30BB85;
	Thu, 23 Oct 2025 10:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ifzfmThc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDC030C62E
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215169; cv=none; b=eNWL3RYLV+PDSKorrLgaqvDw2qs52SvXhhkmmjEn7cxMSfo1ZWbL6umHFNcTbW/s/jBHGCevc7tF2VKo+iYVlGHCTt2mzGPY/LFuSIhPL2p1fyTImKZ6uHPl8y/hNK4ZBPDWRROVgUhy4Ci3wGm5rPSFiygHu4pSHEruV0IpaCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215169; c=relaxed/simple;
	bh=ieJ1PEQ6GbV1MRYhe9aHXa9mk9fDmXMMbeDZ+4DJtuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WsRdPZIHyILzng9HUknxnHm7aKivieW4XTPt4Fs5b0usggOTRIFiyo/QCIVNP3d3ZmQ9KqSUNlhXFpADo4DOIUAaBXgmPqeS69YkFWmGXTOz+eegGpdciXHg3+8UpzjaWJHAfCAGirVnf0v60FfaIrlMjXrW8+sJEc6T3SID9Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ifzfmThc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6Kr8v025821
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+DNR7aXOr6C
	c8NhWnDKFKEl9U/PHu41xc4EUdoSLJW8=; b=ifzfmThcG0p0X7YOEeUnP+XljfS
	WO2XQKlwqTnnXn1akur1Ic5qkCTs1RjnOJa3COpOuSgtppo6kSPxo8jWDpStYD8e
	AzJ2PAIpkTjRKTFivjHv43C15ycm6rN6X1c24J67Uj5cyJdP91n6Ytf12jJyZOny
	oByygkd4k9BdEzjvmufOBGBrQzyB2bZRAzDN49KVvBEuDIH8T6n9k0yH5w0Y4h9/
	I52MlJO9GBQknL+GNSFOa2DPB3qCa8b0DWuciMwTS1xCDyudKKnRAnXLFnoOJFrP
	Hof8GPy3F8hkSTMY2AXKK5ZpUhNrfd/Vq5k+wokt19w9sAzqF0s2kZ/ss5A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42kfu1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e8b8db4a35so19128871cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 03:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215163; x=1761819963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+DNR7aXOr6Cc8NhWnDKFKEl9U/PHu41xc4EUdoSLJW8=;
        b=Xa00M/w3AD8GRc1E4u0m5j/fyiPayRwSjI1Ojzbdo3xWxJ+BPlY0v++e8HMG2uV04K
         f3w96iGLU7z/G58MW+T0PV8ENxIcIIsi0sPh9XD009wWSOXrG33DRkRlVkPtDHB6uofU
         s5/NM1ClGwYMViuut5zaPVARCK04DJiDh8yZ3ZTRxDU25VIyC6sEnqfApfVTvXbhFyfH
         x1S2LFs0ylNz98/9nevrwIw7nXCxcq6e40zCjBT13CM+9foh377sSGWSAiurpCkyEocJ
         bT2SzNGfo+UHd8+T0fnjvdcq2mvFrzA2L77lmLwZJXf972kBxPLbGhVZDpT/JE/wUQtL
         EnjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOeQDVusI2bDjzYVOh2CrbqCDtH+SCClyRJA+doNF/iarKjhR7SIH/SjeiL/G5XgdPSEnA+hBkzohIxrPS@vger.kernel.org
X-Gm-Message-State: AOJu0YyygKFidKNdcXjBUeJvrsm/0G2OzFKFhNZieL50fBqK19vYzbJ1
	n4DBiT/p8Vudir/KTQztPIFYeiWXaJRGHDIxE11fWlSuhfX1bARN7drFxF4mUsaZsVvSbivpXu6
	tbC4vnHC4o2Yv5VmreNdVweCRGhGTdfJCQga5a+zk1It5qgK4AGrIGlDvkKOps5rBK2Qv
X-Gm-Gg: ASbGnctHmBwS2T11vwdo9D9qeqDbWRxk71lkFbHg9uQ4X8XaOu0ZGHLTCmOznhOdHUB
	R1V8Oi59aA6+usuMeJs5V6Rb62FuIafmuv/WjpMR138SRzVKan/LgCQczpBYLqAP2ewzJFWYfPH
	wgPLgjJ0OxQFhH9MtrKlK9cSX3srdnNdmNxCUX2hAdFbAQrznWeFngDXZjD1MMYzYhlgmWRVXCU
	zfZtQ8znso7Z5QMsw9d+8WvMqpCQVyXB6aVM6e3FE24eI9ECprYbmbfoFrn3evUOjLstchNB2hj
	b9M47hYs+tpQ/XzI9AI+YUz8vLTjiYPNIE2M8+WvBJQ3UhvrkiSX1ZDlkAUfG8sDRtmip53yZFq
	H9eyZKlh2SOv+
X-Received: by 2002:a05:622a:198a:b0:4cd:53ea:2346 with SMTP id d75a77b69052e-4eb81056553mr19376191cf.19.1761215163465;
        Thu, 23 Oct 2025 03:26:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGLrq11of8oaXYjc2gxcB149UaqLBVuJAPIgO2WDbhf9e7h/dtIgGOKVO0dmmn98IJDw5XQA==
X-Received: by 2002:a05:622a:198a:b0:4cd:53ea:2346 with SMTP id d75a77b69052e-4eb81056553mr19375951cf.19.1761215162837;
        Thu, 23 Oct 2025 03:26:02 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm92220685e9.3.2025.10.23.03.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:26:02 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2 06/20] ASoC: qcom: q6asm-dai: schedule all available frames to avoid dsp under-runs
Date: Thu, 23 Oct 2025 11:24:30 +0100
Message-ID: <20251023102444.88158-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023102444.88158-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251023102444.88158-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8DEBk8E5feTCTMKapkHIwNBP5EVW4Bpv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX9aEBnwRlX1Xk
 57EVXRsyYCnhJU+41u9oAymcMZBio6yr4dXJNDbCACbWDjtDnvQiOAzhl+N9ur+ymFRPXJCGQ3Z
 +ilRAG1VMIs3HR9cUR+7gM/Ik9LGQW+559EpqSpDOmQ/Lq3Axd+cNrXbRmVz+YJCF5o1QvbFBnI
 hro84bnGWFi7OjyBMSfBW8jOBFx3HAslobyDXyT2ptXz+ft5MxyKfBVxtxciNPxUWfrHOwoENjX
 wMRYYuNCiPXUwoN1K+TYnPjKwEQ0TPCBwRd7TAkOW1KKdBtNG4LgIS7gX43ypjnjSSSD0uCyUms
 sscfXDgLbjO3LTmwvL0FL6AL8/5/rHwbntrm54Hn0GxntGgfi8f0DmUuIKyYasPVFjXptxJ9GSJ
 gRTE8Kgyu5+EjyijjUdCGNEkEesQjA==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68fa02bc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=Towqb0HgaKl9JIg5mcAA:9 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 8DEBk8E5feTCTMKapkHIwNBP5EVW4Bpv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031

With the existing code, we are only setting up one period at a time, in a
ping-pong buffer style. This triggers lot of underruns in the dsp
leading to jitter noise during audio playback.

Fix this by scheduling all available periods, this will ensure that the dsp
has enough buffer feed and ultimatley fixing the underruns and audio distortion.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Alexey Klimov <alexey.klimov@linaro.org> # RB5, RB3
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 34 +++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 0eae8c6e42b8..db2ea8973ac9 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -64,6 +64,7 @@ struct q6asm_dai_rtd {
 	uint64_t bytes_received;
 	uint64_t copied_total;
 	uint16_t bits_per_sample;
+	snd_pcm_uframes_t queue_ptr;
 	uint16_t source; /* Encoding source bit mask */
 	struct audio_client *audio_client;
 	uint32_t next_track_stream_id;
@@ -85,6 +86,7 @@ struct q6asm_dai_data {
 static const struct snd_pcm_hardware q6asm_dai_hardware_capture = {
 	.info =                 (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_BATCH |
 				SNDRV_PCM_INFO_BLOCK_TRANSFER |
+				SNDRV_PCM_INFO_NO_REWINDS | SNDRV_PCM_INFO_SYNC_APPLPTR |
 				SNDRV_PCM_INFO_MMAP_VALID |
 				SNDRV_PCM_INFO_INTERLEAVED |
 				SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME),
@@ -108,6 +110,7 @@ static const struct snd_pcm_hardware q6asm_dai_hardware_playback = {
 	.info =                 (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_BATCH |
 				SNDRV_PCM_INFO_BLOCK_TRANSFER |
 				SNDRV_PCM_INFO_MMAP_VALID |
+				SNDRV_PCM_INFO_NO_REWINDS | SNDRV_PCM_INFO_SYNC_APPLPTR |
 				SNDRV_PCM_INFO_INTERLEAVED |
 				SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME),
 	.formats =              (SNDRV_PCM_FMTBIT_S16_LE |
@@ -182,9 +185,6 @@ static void event_handler(uint32_t opcode, uint32_t token,
 
 	switch (opcode) {
 	case ASM_CLIENT_EVENT_CMD_RUN_DONE:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-			q6asm_write_async(prtd->audio_client, prtd->stream_id,
-				   prtd->pcm_count, 0, 0, 0);
 		break;
 	case ASM_CLIENT_EVENT_CMD_EOS_DONE:
 		prtd->state = Q6ASM_STREAM_STOPPED;
@@ -192,10 +192,6 @@ static void event_handler(uint32_t opcode, uint32_t token,
 	case ASM_CLIENT_EVENT_DATA_WRITE_DONE: {
 		prtd->pcm_irq_pos += prtd->pcm_count;
 		snd_pcm_period_elapsed(substream);
-		if (prtd->state == Q6ASM_STREAM_RUNNING)
-			q6asm_write_async(prtd->audio_client, prtd->stream_id,
-					   prtd->pcm_count, 0, 0, 0);
-
 		break;
 		}
 	case ASM_CLIENT_EVENT_DATA_READ_DONE:
@@ -311,6 +307,29 @@ static int q6asm_dai_prepare(struct snd_soc_component *component,
 	return ret;
 }
 
+static int q6asm_dai_ack(struct snd_soc_component *component, struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct q6asm_dai_rtd *prtd = runtime->private_data;
+	int i, ret = 0, avail_periods;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK && prtd->state == Q6ASM_STREAM_RUNNING) {
+		avail_periods = (runtime->control->appl_ptr - prtd->queue_ptr)/runtime->period_size;
+		for (i = 0; i < avail_periods; i++) {
+			ret = q6asm_write_async(prtd->audio_client, prtd->stream_id,
+					   prtd->pcm_count, 0, 0, 0);
+
+			if (ret < 0) {
+				dev_err(component->dev, "Error queuing playback buffer %d\n", ret);
+				return ret;
+			}
+			prtd->queue_ptr += runtime->period_size;
+		}
+	}
+
+	return ret;
+}
+
 static int q6asm_dai_trigger(struct snd_soc_component *component,
 			     struct snd_pcm_substream *substream, int cmd)
 {
@@ -1215,6 +1234,7 @@ static const struct snd_soc_component_driver q6asm_fe_dai_component = {
 	.close			= q6asm_dai_close,
 	.prepare		= q6asm_dai_prepare,
 	.trigger		= q6asm_dai_trigger,
+	.ack			= q6asm_dai_ack,
 	.pointer		= q6asm_dai_pointer,
 	.pcm_construct		= q6asm_dai_pcm_new,
 	.compress_ops		= &q6asm_dai_compress_ops,
-- 
2.51.0


