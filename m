Return-Path: <linux-arm-msm+bounces-108513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Ew+OItjDGpXggUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:20:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 643DB57F7A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 15:20:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A043C30BE897
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D677F4E3779;
	Tue, 19 May 2026 13:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c7owgYYD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZSebCpsO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2AE4CA260
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779196542; cv=none; b=bCOstd9ZlK1VaaoxI2nwZ3cvigH694yEQsjg2F3BwiTO0+QyPFfvwbf8KlEB6Pdq15YRRY7owAKs8z+8h6U8y39UIVBo0JrR7n2E8HPcf6P8gv8Csm3AcfFjGdn8kxZriDnIzX+r+ohfXwRH3KrYY9njVj/eNls7S6nGhCDT3tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779196542; c=relaxed/simple;
	bh=44/1jWStuIN39XJe/tAIOn4LtblZLVTLwgCuGYftWnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nWKvxxllrC1jzxXoqNJiU45DZ9RNcDKcWRig8IP2GKdZtMWHjh5m/rOJTqRNF7OKq788aqIpwmZExudjNjYMhkABDVlVz+fWW0Yayuaa8N0uAdrw0BJr4ol4k6Wqx7T28z5b876W0ZSaWe/P/14tIQSD6BHOmNvwwt6dODvAB0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c7owgYYD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZSebCpsO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9vEHA1055029
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=p2qDU3XsOH0
	nCkDYHDKlXqlRcWGH6pIgmdP22P1u+iM=; b=c7owgYYDYABqXArDDMg1UHrdgAV
	CqntPlNqw5QUByesxp/rvGGz0elf0k7tTG9qGjLfalwCYpxxA8nNadZXiCYxoDnP
	ixP6MVxBzEeCvFZBn9nROYTPkxdqJPyDJeVA1ehnLwnsO0g0wTKxiyPIj6C6ni08
	YF/OVSffsXCw7h8e4hneT3z5vfxG+/UQEGlsaYbBgIq+v3/M2/YNy0+abunrmQmT
	1z7ttqa1xyFIQpEB7dBor2KIke4BYf1ZkdVur1ycW7KLyTjpaKcGVIOL+1gngJUq
	lU2hepC9dGkB+cE6Yfgu5unTwDbOLYf2ylMhj0523qZKvVH7H9DjjrNiUOQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8nparr3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 13:15:39 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-575427e5360so3098831e0c.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 06:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779196539; x=1779801339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p2qDU3XsOH0nCkDYHDKlXqlRcWGH6pIgmdP22P1u+iM=;
        b=ZSebCpsO+kF0Kf9FnMfFHqaNg0TE8jKczkVY2QEZFd8nYpumEfQG1+qmHHwJkfF1id
         rEAER3XmgUPNw6g2g+1LcgEzaqF6+F41kLzhaOdZnQU/++03WLgXreJMXziGxX3R0Wd3
         z0rr6zxhybkHgpaKNL2jK8ZF830jGulZ+9ZI9FXIeVHnVLtxEepwbxEpZbZQ6tWh6XEu
         ctFReZ3lYSbwK6BYdWKYkviqihEWNaBc1MIUWh4yOxNXk5cTIGuReo6Xzak3RzE06xkr
         qrEbp5SM3z3F71dLjNeB9oFMcA8p/Cw4wf+61zK6jGVCf92qzqJVthR812fV4xc5V8I0
         uL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196539; x=1779801339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p2qDU3XsOH0nCkDYHDKlXqlRcWGH6pIgmdP22P1u+iM=;
        b=FtNqNxmVEXYXH3oK7afIclbKaJFC0LwjNjFzeNtmNvWBvc3R+wpGRHeKNb/hEDwKJJ
         Y19AffqprNBfDPtG1e4vlYIRIB9N67g8VZ8e/yKX837XNbM94B+xlTjQgBtwhDi1wRvj
         tukRxQyVPkMsYlDDvnfGo22Ahqt8KPz2bFZgNAg5KyNq3yV/LszRIJ9DtiuiqKzCU08h
         XF1ptNfDzyl7OPwG29F/M8a/MeqMcCjCDIEypCxC2weXosVq0rvGS4DEF9+KabvDEeY6
         ZpWBtfEnBVPnY+VsqnM+ny1QXTJCWZu0cfN2cHZv9oW2gcG+vl3Ja5aXaZCuhzjbx/u7
         hIig==
X-Forwarded-Encrypted: i=1; AFNElJ8vwUByzWDswPEm4DUHnJV1zdrb12eqcAsrv5Fjw+Ddq8Cw3kUYF1C1gi9nMPMgwWY/wbvO7R1BO/a1X0k7@vger.kernel.org
X-Gm-Message-State: AOJu0YxvPi+GhIeKeQPwTxKg91HSDM7Jn0lA4XGPKWYn9uLIfZgLwzvW
	5zixzSquqTY4rC2apUziR9rW0f6neV9PjdbxYc3zMaY1tRHKWKr6sZGgCiXK3xF1TmygD99nCaw
	/VS0dYElj4rkC0snt9Mztqcwq3WrZ7zCswB4ETIlRweUeQAo7DIuK9yXgAqtTD8Hv4aYc
X-Gm-Gg: Acq92OGkFDtPz05rTJJesjqtT1D3M1BspnETS+hQv2dqBwiZTDqZ+rm+OkfF2sZVG/I
	Q/K/iTbleWyoLSo1wH0R0W8IEyBoRPZGyyYeo0l8ehMlanZ1cgtlD6sKDk/UJHLVMaBgPQmhA8P
	jjUEpwG5erbHY+w7IC1FVFv9HUz6quIcLzoQheyShgfLj9M3nEVkpzA2LP2oYKFcc9ErvZ9WNMn
	VPemPtoSE/LoUwcdi6tC986kIdeiH/eZ4igGgm0w1R2v0VecBc0VO2kZltFNRs9jugSk5ssMznZ
	9W75Ptv814JJS1hDUzPmAnQ9YVIbvMmSCKtwNGCNOLjxJGParZM6DpgsC86c1tVj2xddynkoULO
	/BbweTKYCaBTgMmFOZzw5+2XZWHCf6LUbieOauKu4n+wBZ6hOF+eQkGs=
X-Received: by 2002:a05:6122:8b17:b0:56c:db8b:504e with SMTP id 71dfb90a1353d-5760c060419mr9942798e0c.13.1779196538618;
        Tue, 19 May 2026 06:15:38 -0700 (PDT)
X-Received: by 2002:a05:6122:8b17:b0:56c:db8b:504e with SMTP id 71dfb90a1353d-5760c060419mr9942686e0c.13.1779196538010;
        Tue, 19 May 2026 06:15:38 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm48018609f8f.23.2026.05.19.06.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:15:37 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: srini@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        mohammad.rafi.shaik@oss.qualcomm.com, alexey.klimov@linaro.org,
        ravi.hothi@oss.qualcomm.com, mathieu.poirier@linaro.org,
        verhaegen@google.com, andersson@kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 6/6] ASoC: qcom: q6apm-dai: add push-pull and watermark event support
Date: Tue, 19 May 2026 13:15:27 +0000
Message-ID: <20260519131527.4002526-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260519131527.4002526-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260519131527.4002526-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMSBTYWx0ZWRfXy9fJ7e8iu1Bu
 dE12SooBfoDtf+2G46bPu6Qjx6ZwrLcdBfWKJTaOYzYRhxaxW2yEpNOtO5xYobDizDLjXBWRx9G
 sGZNhRHKsB6n498ZI4r/uJR1mdxfSt95jEV6WoQwBhJ67qMWqfKyvorT0ddyTRUuqwn0/pBeiX2
 u/DM9iShy57K9A5TngLVKKIVFVTkxJ75B6NesUH3Bl2xLamGbwbHwi0jKK15tujBlcIaAx9yTKf
 BO3B+PHPBeAZjCOtDw9dKJpAIza4LQrBC5Ss41ufQlClrPL7gtDGwpsKP1ktYV4cOHImxehkUDE
 vGadu2EokOpYdXlLaDB/aYiYj+Bq0EYpqFyWhglSjUaBvcc/+tYGlb8Emq9hRY/Ffkaigmh/j8E
 frRu9IfJ5l7Wct9+B0FyuHJeHz2zpE7FKth8E7PIJiURLDiuYF8aO+/tBWDVFQ1CsJ2QRzqPF1y
 7UaOWknBQ2I0N5b6JNA==
X-Authority-Analysis: v=2.4 cv=NrjhtcdJ c=1 sm=1 tr=0 ts=6a0c627b cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=FoGQ1hqfDKlkNBk9xSEA:9 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: -S2rV52QOug6-OnwiEWv78dy0KKCZBnn
X-Proofpoint-ORIG-GUID: -S2rV52QOug6-OnwiEWv78dy0KKCZBnn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190131
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,linaro.org,google.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108513-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 643DB57F7A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Wire q6apm-dai to use push-pull shared memory graphs.

For push-pull graphs, configure the circular buffer and position buffer,
register watermark events, and use watermark notifications to report PCM
period elapsed. Skip legacy fragment queueing and ACK handling because the
DSP reads/writes directly from the shared circular buffer.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 144 ++++++++++++++++++++++++-------
 1 file changed, 114 insertions(+), 30 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 3a1be41df096..bf1f872a09f4 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -18,6 +18,7 @@
 #include "q6apm.h"
 
 #define DRV_NAME "q6apm-dai"
+#define POS_BUFFER_BYTES	4096
 
 #define PLAYBACK_MIN_NUM_PERIODS	2
 #define PLAYBACK_MAX_NUM_PERIODS	8
@@ -62,8 +63,12 @@ struct q6apm_dai_rtd {
 	struct snd_codec codec;
 	struct snd_compr_params codec_param;
 	struct snd_dma_buffer dma_buffer;
+	struct sh_mem_pull_push_mode_position_buffer *pos_buffer;
+	uint32_t last_pos_index;
 	phys_addr_t phys;
+	phys_addr_t pos_phys;
 	unsigned int pcm_size;
+	unsigned int push_pull_size;
 	unsigned int pcm_count;
 	unsigned int periods;
 	uint64_t bytes_sent;
@@ -128,6 +133,9 @@ static void event_handler(uint32_t opcode, uint32_t token, void *payload, void *
 	struct snd_pcm_substream *substream = prtd->substream;
 
 	switch (opcode) {
+	case APM_CLIENT_EVENT_WATERMARK_EVENT:
+		snd_pcm_period_elapsed(substream);
+		break;
 	case APM_CLIENT_EVENT_CMD_EOS_DONE:
 		prtd->state = Q6APM_STREAM_STOPPED;
 		break;
@@ -234,24 +242,47 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
 		q6apm_free_fragments(prtd->graph, substream->stream);
 	}
 
+	prtd->last_pos_index = 0;
 	prtd->pcm_count = snd_pcm_lib_period_bytes(substream);
-	/* rate and channels are sent to audio driver */
-	ret = q6apm_graph_media_format_shmem(prtd->graph, &cfg);
-	if (ret < 0) {
-		dev_err(dev, "%s: q6apm_open_write failed\n", __func__);
-		return ret;
+	if (q6apm_is_graph_in_push_pull_mode(prtd->graph)) {
+		if (prtd->pcm_size != prtd->push_pull_size) {
+			ret = q6apm_push_pull_config(prtd->graph, prtd->phys, prtd->pos_phys,
+						     prtd->pcm_size);
+			if (ret < 0) {
+				dev_err(dev, "Push/Pull config failed rc = %d\n", ret);
+				return ret;
+			}
+
+			ret = q6apm_register_watermark_event(prtd->graph,
+							     prtd->pcm_size / prtd->periods,
+							     prtd->periods);
+			if (ret < 0) {
+				dev_err(dev, "WaterMark event config failed rc = %d\n", ret);
+				return ret;
+			}
+			prtd->push_pull_size = prtd->pcm_size;
+		}
+	} else {
+		ret = q6apm_alloc_fragments(prtd->graph, substream->stream, prtd->phys,
+					(prtd->pcm_size / prtd->periods), prtd->periods);
+		if (ret < 0) {
+			dev_err(dev, "Audio Start: Buffer Allocation failed rc = %d\n",	ret);
+			return ret;
+		}
+
 	}
 
 	ret = q6apm_graph_media_format_pcm(prtd->graph, &cfg);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(dev, "%s: CMD Format block failed\n", __func__);
+		return ret;
+	}
 
-	ret = q6apm_alloc_fragments(prtd->graph, substream->stream, prtd->phys,
-				(prtd->pcm_size / prtd->periods), prtd->periods);
-
+	/* rate and channels are sent to audio driver */
+	ret = q6apm_graph_media_format_shmem(prtd->graph, &cfg);
 	if (ret < 0) {
-		dev_err(dev, "Audio Start: Buffer Allocation failed rc = %d\n",	ret);
-		return -ENOMEM;
+		dev_err(dev, "Failed to set media format %d\n", ret);
+		return ret;
 	}
 
 	ret = q6apm_graph_prepare(prtd->graph);
@@ -265,13 +296,13 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
 		dev_err(dev, "Failed to Start Graph %d\n", ret);
 		return ret;
 	}
-
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
-		int i;
-		/* Queue the buffers for Capture ONLY after graph is started */
-		for (i = 0; i < runtime->periods; i++)
-			q6apm_read(prtd->graph);
-
+	if (!q6apm_is_graph_in_push_pull_mode(prtd->graph)) {
+		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+			int i;
+			/* Queue the buffers for Capture ONLY after graph is started */
+			for (i = 0; i < runtime->periods; i++)
+				q6apm_read(prtd->graph);
+		}
 	}
 
 	/* Now that graph as been prepared and started update the internal state accordingly */
@@ -286,6 +317,9 @@ static int q6apm_dai_ack(struct snd_soc_component *component, struct snd_pcm_sub
 	struct q6apm_dai_rtd *prtd = runtime->private_data;
 	int i, ret = 0, avail_periods;
 
+	if (q6apm_is_graph_in_push_pull_mode(prtd->graph))
+		return 0;
+
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		avail_periods = (runtime->control->appl_ptr - prtd->queue_ptr)/runtime->period_size;
 		for (i = 0; i < avail_periods; i++) {
@@ -317,6 +351,7 @@ static int q6apm_dai_trigger(struct snd_soc_component *component,
 		/* TODO support be handled via SoftPause Module */
 		prtd->state = Q6APM_STREAM_STOPPED;
 		prtd->queue_ptr = 0;
+		prtd->last_pos_index = 0;
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
@@ -402,6 +437,14 @@ static int q6apm_dai_open(struct snd_soc_component *component,
 	else
 		prtd->phys = substream->dma_buffer.addr | (pdata->sid << 32);
 
+	if (q6apm_is_graph_in_push_pull_mode(prtd->graph)) {
+		void *pos_buffer;
+
+		prtd->pos_phys = prtd->phys + BUFFER_BYTES_MAX;
+		pos_buffer = (void *)(substream->dma_buffer.area + BUFFER_BYTES_MAX);
+		prtd->pos_buffer = (struct sh_mem_pull_push_mode_position_buffer *)(pos_buffer);
+	}
+
 	return 0;
 err:
 	kfree(prtd);
@@ -436,6 +479,25 @@ static snd_pcm_uframes_t q6apm_dai_pointer(struct snd_soc_component *component,
 	struct q6apm_dai_rtd *prtd = runtime->private_data;
 	snd_pcm_uframes_t ptr;
 
+	if (q6apm_is_graph_in_push_pull_mode(prtd->graph)) {
+		int retries = 10;
+		uint32_t index, fc1, fc2;
+
+		/* index is valid if frame_counter does not change while reading. */
+		do {
+			fc1 = READ_ONCE(prtd->pos_buffer->frame_counter);
+			index = READ_ONCE(prtd->pos_buffer->index);
+			fc2 = READ_ONCE(prtd->pos_buffer->frame_counter);
+		} while (fc1 != fc2 && --retries);
+
+		if (fc1 != fc2)
+			index = prtd->last_pos_index;
+		else
+			prtd->last_pos_index = index;
+
+		ptr = bytes_to_frames(runtime, index);
+		return ptr;
+	}
 	ptr = q6apm_get_hw_pointer(prtd->graph, substream->stream) * runtime->period_size;
 	if (ptr)
 		return ptr - 1;
@@ -468,7 +530,8 @@ static int q6apm_dai_hw_params(struct snd_soc_component *component,
 }
 
 static int q6apm_dai_memory_map(struct snd_soc_component *component,
-				struct snd_pcm_substream *substream, int graph_id)
+				struct snd_pcm_substream *substream,
+				int graph_id, bool is_push_pull)
 {
 	struct q6apm_dai_data *pdata;
 	struct device *dev = component->dev;
@@ -490,6 +553,19 @@ static int q6apm_dai_memory_map(struct snd_soc_component *component,
 	if (ret < 0)
 		dev_err(dev, "Audio Start: Buffer Allocation failed rc = %d\n",	ret);
 
+	if (is_push_pull) {
+		if (pdata->sid < 0)
+			phys = substream->dma_buffer.addr + BUFFER_BYTES_MAX;
+		else
+			phys = (substream->dma_buffer.addr + BUFFER_BYTES_MAX) | (pdata->sid << 32);
+
+		ret = q6apm_map_pos_buffer(dev, graph_id, phys, POS_BUFFER_BYTES);
+		if (ret < 0)
+			dev_err(dev, "Audio Start: Buffer Allocation failed rc = %d\n",	ret);
+	} else {
+
+	}
+
 	return ret;
 }
 
@@ -504,25 +580,30 @@ static int q6apm_dai_pcm_new(struct snd_soc_component *component, struct snd_soc
 	 */
 	int size = BUFFER_BYTES_MAX + PAGE_SIZE;
 	int graph_id, ret;
-	struct snd_pcm_substream *substream;
+	bool is_push_pull;
+	struct snd_pcm_substream *substream = NULL;
 
 	graph_id = cpu_dai->driver->id;
 
-	ret = snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, component->dev, size);
-	if (ret)
-		return ret;
-
 	/* Note: DSP backend dais are uni-directional ONLY(either playback or capture) */
-	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream) {
+	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream)
 		substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
-		ret = q6apm_dai_memory_map(component, substream, graph_id);
+	else  if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream)
+		substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
+
+
+	if (substream) {
+		is_push_pull = q6apm_is_graph_in_push_pull_mode_from_id(component->dev,
+									graph_id,
+									substream->stream);
+		if (is_push_pull)
+			size += POS_BUFFER_BYTES;
+
+		ret = snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, component->dev, size);
 		if (ret)
 			return ret;
-	}
 
-	if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream) {
-		substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
-		ret = q6apm_dai_memory_map(component, substream, graph_id);
+		ret = q6apm_dai_memory_map(component, substream, graph_id, is_push_pull);
 		if (ret)
 			return ret;
 	}
@@ -547,6 +628,9 @@ static void q6apm_dai_memory_unmap(struct snd_soc_component *component,
 
 	graph_id = cpu_dai->driver->id;
 	q6apm_unmap_memory_fixed_region(component->dev, graph_id);
+
+	if (q6apm_is_graph_in_push_pull_mode_from_id(component->dev, graph_id, substream->stream))
+		q6apm_unmap_pos_buffer(component->dev, graph_id);
 }
 
 static void q6apm_dai_pcm_free(struct snd_soc_component *component, struct snd_pcm *pcm)
-- 
2.47.3


