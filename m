Return-Path: <linux-arm-msm+bounces-108144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PHUNWbbCmog8wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:27:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A25569AD6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7025A3038C58
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 09:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80413E6394;
	Mon, 18 May 2026 09:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MnyhI2N1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WCwEXlTO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD043E51F9
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 09:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779096239; cv=none; b=C5h0L1qJWI/9Ke0eZBlUZ/p+xhXcGjJcUQ+Yspmfp2M5EfDEIFbtgSvtKwKRMTmEnsPIyIAXFWWrpMCyTPQBeUGoLjMkX2N8+AXxlPvm9x64ZBU+NfWd4Spv+4aLPW0d14+luX2J+0zx/Y61YjHByJ96R47NzMmrxslw40wdIqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779096239; c=relaxed/simple;
	bh=RCs85gMYZ1p9MuIk2+VubwPsJIHZd4Qgpqt8dbtEJpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N3sCai2GBGaJK9yp6WM4l7ZdNbeq+YpHOWFeAMzIg8SvgDHDiQRAtZ769IeQJlfm/BavC+EwiiXk05SaHxuNaCH4FDf1NpAoRzEIlzigWo9MwxUhLo7CQRO4WYssTgyTw0nBPXBauzXQfWbFUyQcuH8ujJ8NLOS12ZXfB+Bxm18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MnyhI2N1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WCwEXlTO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I5e6Bx2847489
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 09:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=s/uuIZd9tj7
	QhjDlqlxXE48EZqcvyagv3QTAGMpzuIA=; b=MnyhI2N1cFnaVI0OIWEJRYbrl5D
	vyg/05SnXAb9BXCaEZ/Up0ZBwfOkn/Xyb5ZzMkOmA563fVpJYRhqiyQFi+RM9G7I
	hqpM0GsoV0I4kyE/ZeEhjZRx6caUFUNyezoqRLaGAxrTjQoOAVkc2dhH6aY8Fjzd
	admrMs0awSJRoqrL9AbqPRzq4WiDM54dRr1avmikdvycZh9RZ9GH5muvVBF4q4Uk
	fW3UPcmmGH/DbwNLH6Y4Dn+Jw4fcXtPCfeRsnGp6YXudRkrEB+gb09cxUHmQPiRd
	dZ+nyUntNteX5VFCCNIwRqYZyQPIBnRCJc+M2aQwWD4PPifVqf24C2SWglw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hv7wkxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 09:23:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-515224a8aa0so19287771cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 02:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779096235; x=1779701035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/uuIZd9tj7QhjDlqlxXE48EZqcvyagv3QTAGMpzuIA=;
        b=WCwEXlTOb0GMmX22or4eV0qY7WjjxdAARTUPwJXFgQJEXTfAv1UzUKJElfuJpJgyg/
         ZfR2QMKdtdedUrZC8NMPHy5lpCY+l0dcvB79ayop6dIP+v5aZeET+mIDGiDFNrxzhVCV
         /M5/U9vrZrg3v01awoZRXRaklvECOlCzsO+aKwatZmeF4qHbpXcpWiTmV+Vfya3fiQcF
         nxsKKqnVpc03m3A0lwMsx9YhyugrsPKtXuJ9MW3M2iicY5+KESp5msj9PnkCpFfQHROg
         TxN9HMzUoJ5731bdyzVK0R1CQypSJwfNnM7WK546/ofMas9LGCpF0rlg4Kr4QiS87nmr
         U3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779096235; x=1779701035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s/uuIZd9tj7QhjDlqlxXE48EZqcvyagv3QTAGMpzuIA=;
        b=qAjJ58QvrPNQG3G8Xjdas/kLc5WSRqt4BY/AIdmKzQk74QA5lCLBz4+o3MYmyMQS9Y
         p9RkWmig2zXdNjK8dGPEkdL2+OLsYDG0qUw3kwyX/wt2uDwCYpAa0/ObSgUcGf2kTYWX
         IajcLxfi2gOBnEeDn0WMReqQnQX/Xauc7GVHn9/nkNt07snL0TaEo8LT51iV9/94MJvb
         N3zdI1862qNYAbHCVuF+ZsPRGYR5UhAWnx1/ofNJRpecT6B+djFuy9nB2XOqsSgiivfK
         8gi+SoHymh8CAcLfHHuongrDWQ4uAuoDnrVFy3lQ9GnZPQvZzVVQDnUm5khiDD0RxTiC
         sdsQ==
X-Forwarded-Encrypted: i=1; AFNElJ+gbpvM1QPLGrsRa1/PUCj6xm0SsiO22L1IpZOd8mF3FSE5TwxdEr7b920ufpCuk+Zjo4HYm884Fzq7ooo3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6a3KxCT7R+of9YWXKJ0+wZ4L/5QOJVW0U3r5kKImyHl/aekYM
	Q8fmr8ds5kddNR20mR/8YYUypjwWdGgb3r42DtTJpjiidTEOHCjegwoXyWUjB3Tv1HzCshcuPwZ
	lg9gJWTRYd8npt6NVw3U5XFRuCM73uZqxdtQjZlR1lpSAFLYCxEgajkR8A3jCrldZOSxv
X-Gm-Gg: Acq92OE8i/BqZsBALFLzN5xnKrcZ8bq3oGyipsP2Tb6NCfQ8u7mDuFpfItX6TpuPARw
	SQNWFWabV6mxGiLAkzms4YqzTVLxiJgpTpWlTqoY1CVRXPTt3y9LCBWNdPiCVU2bIgOSpOE0INM
	JOWJlhLcojy3kPMaudUvdmacv9ulbU1bkET+u5xnAfPN39VbqCLy1CTF9VJqZ5XiNXPiBh2Tvxx
	ktS2eIPWage9p5GZEQa6SzMkoiPGhXozIAlRfHe/7RPoK4u6zS/cAaK2hckxRKgeRl7RZKEl4dP
	+1QEHPVqGYLRNoPeOCmeew+jV4YtGlohp0TT/GHu0dwLA31jpmHz7GXpA9Qui1RsXvEJPauTkem
	1So45DemNvV4O3AhEJ4PaTJ6UiAPFwgqdaAttNaY8msymqQByrM/7jKM=
X-Received: by 2002:a05:622a:2514:b0:509:39b5:a97f with SMTP id d75a77b69052e-5165a0a37a6mr197720931cf.29.1779096234949;
        Mon, 18 May 2026 02:23:54 -0700 (PDT)
X-Received: by 2002:a05:622a:2514:b0:509:39b5:a97f with SMTP id d75a77b69052e-5165a0a37a6mr197720721cf.29.1779096234552;
        Mon, 18 May 2026 02:23:54 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe0fecsm33265900f8f.26.2026.05.18.02.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:23:53 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: jens.glathe@oldschoolsolutions.biz, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        val@packett.cool, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH 2/5] ASoC: qcom: q6asm-dai: close stream only when running
Date: Mon, 18 May 2026 09:23:44 +0000
Message-ID: <20260518092347.3446946-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260518092347.3446946-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260518092347.3446946-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA5MCBTYWx0ZWRfX4MjukUYzrzkh
 4WlQMsQThY8LaFfTFiNBfiekTgR7S5LyN/JwMX6hdnrq4WHF8Sk+GQt1TGc1PnWa1z6WEvUZ01y
 18MjiEeS9mctGIp/O3CsrqnASRYJ3k6hrzYvJglv782gjTnsnuduDMEVg7VuW1GJ+nA7h+CEySj
 oVpsYCrfIhhW9DaQEx7WcHd7x0PLgFvZQ20SlcqGH13Wia/uWXfPwNG2dS1wPeWbYonPBsIvFor
 ZoW7mrymUrt3FIJqJwmZ+pL1AXlME3PE0JaIx+J6Mo1UTlDIUqldHGgCdAteHd0+yNom2YhxJRS
 j/8g6TDpfLk2RGBr26p5F/DSIq0k4X7K2MPayNBS9htSz+8BuY/LatsPp2bz3PmL+95EnjQajsN
 Mo2B7NXejm3BxODt92My0TiLodH+gzJnGOJKn5t4jXRUEAtnXhclye+PyUAv3K9LzC2DMBr/XkK
 YoSkS2zqm3/Jli5mvkQ==
X-Authority-Analysis: v=2.4 cv=a8oAM0SF c=1 sm=1 tr=0 ts=6a0adaab cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KnWeaZq26ommGgBC8l4A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: DC2FycyU4Lhpwx8siw6dFE2m-5LK0k5w
X-Proofpoint-GUID: DC2FycyU4Lhpwx8siw6dFE2m-5LK0k5w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180090
X-Rspamd-Queue-Id: 34A25569AD6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[oldschoolsolutions.biz,vger.kernel.org,gmail.com,perex.cz,suse.com,packett.cool,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-108144-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

q6asm_dai_close() and q6asm_dai_compr_free() currently issue CMD_CLOSE
whenever prtd->state is non-zero.

After prepare() closes an existing stream, the state is updated to
Q6ASM_STREAM_STOPPED. Since this state is also non-zero, the close and
free paths can send CMD_CLOSE again for a stream that has already been
closed.

Restrict CMD_CLOSE to the Q6ASM_STREAM_RUNNING state so the command is
sent only when the ASM stream is still active.

Fixes: 2a9e92d371db ("ASoC: qdsp6: q6asm: Add q6asm dai driver")
Cc: Stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 56f0d8913904..ef86b5b9a951 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -455,12 +455,12 @@ static int q6asm_dai_close(struct snd_soc_component *component,
 	struct q6asm_dai_rtd *prtd = runtime->private_data;
 
 	if (prtd->audio_client) {
-		if (prtd->state)
+		if (prtd->state == Q6ASM_STREAM_RUNNING) {
 			q6asm_cmd(prtd->audio_client, prtd->stream_id,
 				  CMD_CLOSE);
-
-		q6asm_unmap_memory_regions(substream->stream,
+			q6asm_unmap_memory_regions(substream->stream,
 					   prtd->audio_client);
+		}
 		q6asm_audio_client_free(prtd->audio_client);
 		prtd->audio_client = NULL;
 	}
@@ -670,7 +670,7 @@ static int q6asm_dai_compr_free(struct snd_soc_component *component,
 	struct snd_soc_pcm_runtime *rtd = stream->private_data;
 
 	if (prtd->audio_client) {
-		if (prtd->state) {
+		if (prtd->state == Q6ASM_STREAM_RUNNING) {
 			q6asm_cmd(prtd->audio_client, prtd->stream_id,
 				  CMD_CLOSE);
 			if (prtd->next_track_stream_id) {
@@ -678,11 +678,11 @@ static int q6asm_dai_compr_free(struct snd_soc_component *component,
 					  prtd->next_track_stream_id,
 					  CMD_CLOSE);
 			}
-		}
 
-		snd_dma_free_pages(&prtd->dma_buffer);
-		q6asm_unmap_memory_regions(stream->direction,
+			q6asm_unmap_memory_regions(stream->direction,
 					   prtd->audio_client);
+		}
+		snd_dma_free_pages(&prtd->dma_buffer);
 		q6asm_audio_client_free(prtd->audio_client);
 		prtd->audio_client = NULL;
 	}
-- 
2.47.3


