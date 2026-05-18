Return-Path: <linux-arm-msm+bounces-108143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJYEHTXbCmog8wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:26:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 209AF569AB9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:26:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8AAD7302927D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 09:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4686B3E5EE6;
	Mon, 18 May 2026 09:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F7y/Hyto";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JMF5LlhD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459DB3E5A09
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 09:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779096237; cv=none; b=q2lEasfKHuudIEqbTrtdVkjabsAw3kGJb2fOY3JUwl3XfpNZ3HBGGvw552iA0YAO15OUyST277XIzvr1gBB0AH58wh37ftVW1Dcdsx0gsYkydAnh0bd3fCxDHQxjZgzu920t6pVw+cHEDGzcDn3w/1mIf/UQQyMnetF4sbqHcpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779096237; c=relaxed/simple;
	bh=OartzHtMjkwbtY495zYmORd7DntitjwDcZpmsbrjb5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tlUmHfi/sYdG867Uny9swZUJxvdqdk/18qkZFuGacsBBJvxeetFzq69YOROHSisUSwc46vqjJaxzpVbUfrii74HyW4n0COvG4TeYz2vmuE4vIhje+JRibxu2IPx/uH5l0fyqS0j5Gj5M5YXPhwgttsMgyTlb0JR+oMAxNG58h3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F7y/Hyto; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JMF5LlhD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I9BNH62077474
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 09:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DEneedWpQwB
	+o3i2G+K+xijFiG8S93MO38MV8xEuYUA=; b=F7y/HytoopXeqf5NpwhfH8SiEDQ
	uhfuFuR5R8nHi8N3My7WO9PtB3ZLG14U0/ev2OspTDneEm+CqjbmrcuJKmKcVAJZ
	6iXprYaEDim8a503zvvZ0n78Yj6Ns4zlpHEKJYbtRAVIUiwMx3eNMEPBAmoC1RGj
	f0A/ym+whJzDgdptUqgOwN5i8g9KZBrgr7jqWgBB3GEgco0KSRPzV40ANobwTvip
	wsYNdUhqyGfzpQas7NAT/t8VY0heQSSyeLyRjbtslQbgLg7xK+goqGYUI8AFyqkj
	teZzy2TEOX+4KwDHbZu1rB0xVnmhxLqupncmGlyG0RWwFK4o/QVgvFKavlg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hv7wkxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 09:23:54 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8acaea1ffe7so68111056d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 02:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779096234; x=1779701034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DEneedWpQwB+o3i2G+K+xijFiG8S93MO38MV8xEuYUA=;
        b=JMF5LlhDp/XPYRbbf6GVldA3ysC9wy9ZdiGUairy2o9F6tHdOketLEZZMrLZrZNtfM
         2OdcwdQ3AxeHx4poCD7M7XvOX9EZ4SlxT0skc/1F5XE2Cc3lVlkZ3EGsWkU0ZWPrkp3I
         RLBFxrjA6byHTioigtN7svruD/4/RErI/7nJj4soKCQFd/+tVHEmPyZntXKXK/b+HO4J
         5oBgjuPYw2AZZInNseN2kQhy2DYZPZZUy8xbTb+jirWIiKjKw/6KXUud5acVuGc2kAqT
         6saK2jZCfSRHAqImyrcTLTFcC3fRc0UKYc6dWJEoAD/uFwB4PKmqwXmxfRhkLwBmkZOq
         7LXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779096234; x=1779701034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DEneedWpQwB+o3i2G+K+xijFiG8S93MO38MV8xEuYUA=;
        b=J3gbwCCz+EuFfsqdOqR+sWdFiG9xB3hGBjUAjacHQVSchJW1ZFy79BedqVT7tH4QKg
         gOKYERuR3GyTzhY9YEPVScJL8d+WJalCcsUCveuoB54XcycjfQoSY5m11VO55c1cefjG
         N9GeJlGhLwFm69bRAI59SrHiA7jY+XAKrGq4sI06CmADQ78YyoFIJZzrE+Vj/OCIdbRn
         pAN8cqE5BLjuL5tKLEfsDy6ZIRjsH0wRX67hM4CK0dFoLDlC1U+CmQ77eLj4oiNDbS2R
         ocTCbcUtetw+FWkMxn0bAFJqfqk2RqxgTwgHVj+jzg8BczqrUHqB/Az1U5SLTMKGpzzQ
         ZHAQ==
X-Forwarded-Encrypted: i=1; AFNElJ87KZaozXy/jOCQ28Zm5ocDa6gVKSzF2tOAIH5HYqUyz3lCK7jiNDG4SgDbrnNhaYvlK/CUkKgHDKoP6m55@vger.kernel.org
X-Gm-Message-State: AOJu0YwFpMlnwHtg05DfFS2UKcx5brlH2RDlaUnF8Br/6iMoABOi5fdX
	T9kFIS9AmDg+IPUciYBQ4W/YNLS+8DJ4fcGoKcqdV3QFIKWpgpF67It3QnCa9bnYKFhX0mPphh6
	dYLU6quQaXmdvP4OJGU5CDy1HbvhwF5Ej08/fOMZHKdi4Y/VjNwi1ENGiGqQQl7rw1ZIk
X-Gm-Gg: Acq92OGM9ojzUpYSwiXT7fxMtSVj/4pjDGQOeDAMy0UwVA+qbu4/unlv2LoZ805XSSx
	pu9QXoCZKzjsLAflx22221PRh2lTBr9986jQ4Oy9B4EjZ1BXCYBYbm0U6GWMFnsrxfJ7sh+Zw6t
	0YbXIgXqY2DIv41WSnG4RAGUgOKo3IgSR0DAKDriEhDCPd+psQxrDh3DlGbp0LhjWnvwdQtUKdZ
	GMI9vpXqCnSeUlPUNpr4Wz5qBNh8Cy4xbeVubeTTXkSBBO5Q66RYSUa2ZwoDOLFod9ydiADNxLw
	uyx4eBoWfrJQn1LGFSL6j3PhBVDMtxnvbvm6dozLyF9lzQ+lHJuAlUMnPEU8FvmSg2p5v1zAUCe
	VqUhhVKcDVv2Q6y1x1eQDxaZoeocrZKCj1i9GJDjEOTZbGxCtCn5uZi0=
X-Received: by 2002:a05:622a:1f96:b0:50f:ccdd:13f1 with SMTP id d75a77b69052e-5165a03f078mr203841171cf.16.1779096233783;
        Mon, 18 May 2026 02:23:53 -0700 (PDT)
X-Received: by 2002:a05:622a:1f96:b0:50f:ccdd:13f1 with SMTP id d75a77b69052e-5165a03f078mr203840921cf.16.1779096233343;
        Mon, 18 May 2026 02:23:53 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe0fecsm33265900f8f.26.2026.05.18.02.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:23:52 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: jens.glathe@oldschoolsolutions.biz, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        val@packett.cool, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH 1/5] ASoC: qcom: q6asm-dai: do not set stream state in event and trigger callbacks
Date: Mon, 18 May 2026 09:23:43 +0000
Message-ID: <20260518092347.3446946-2-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA5MCBTYWx0ZWRfXwnSgxnSDjQNJ
 MebWDD374QRL95/g1ww6NvNAZzFkvLhzvnh9h6MJdduvSJuCS/K4d/8mQAtz8As8v+vCAs+ekeJ
 XemtbwPBxuJkLlmwnGS3YhMS8i8pMprjix5Pg87w4RzHsH22IhhwTriA6j/jQRg3dRXfxu6bsh6
 zpdEh6Ss0Nfy0gYy+2sj2rwoJ4/4uW0Gaof/LrNL025bGe+Eg4G9KesgvzU7tzBOcnvFMlP7X0u
 qSkKc6t3ZjA//E1UyxVOFWJ8BX7YR8G97bT/iIQPi+DknvWCBNhQ+oxY4EAD3UzplqtXUpNB99Z
 hAdsNgWdVcHP0mp9BRCSonhhpZUX6jBR9iAJY4cs+AqvXSvvV7DJzwmRDv3GKOMetB+bQlSV/UZ
 cqFQht/W5O0y2sVlztK3Qn2VUsJnR95V1CV7XCXaPZmVHjWdLKuxJzvJbq7xbKpnYiw2t48KyRP
 L0BegURcfaXvwPj0QzQ==
X-Authority-Analysis: v=2.4 cv=a8oAM0SF c=1 sm=1 tr=0 ts=6a0adaaa cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=TpFDhmux8Oo1qIo2-XoA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: KSFVQO40XnPkJ8NjwQ9BtfCvVlU367ty
X-Proofpoint-GUID: KSFVQO40XnPkJ8NjwQ9BtfCvVlU367ty
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180090
X-Rspamd-Queue-Id: 209AF569AB9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[oldschoolsolutions.biz,vger.kernel.org,gmail.com,perex.cz,suse.com,packett.cool,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-108143-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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

The q6asm-dai stream state is used by prepare() to decide whether an
existing stream setup needs to be closed before opening/configuring a new
one. Updating the state from trigger or asynchronous DSP callbacks can make
that state stale or incorrect relative to the actual setup lifetime.

In particular, setting Q6ASM_STREAM_STOPPED on STOP or EOS completion can
make prepare() believe there is no active setup to close, which can result
in opening/configuring the same stream more than once.

Keep stream state updates tied to prepare(), where the stream is actually
closed and reopened, and stop changing it from trigger and EOS callbacks.

Fixes: bfbb12dfa144 ("ASoC: qcom: q6asm-dai: perform correct state check before closing")
Cc: <Stable@vger.kernel.org>
Closes: https://lore.kernel.org/all/afS7rTHdc9TyIeLx@rdacayan/
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 4f8f7db6c3d3..56f0d8913904 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -186,7 +186,6 @@ static void event_handler(uint32_t opcode, uint32_t token,
 	case ASM_CLIENT_EVENT_CMD_RUN_DONE:
 		break;
 	case ASM_CLIENT_EVENT_CMD_EOS_DONE:
-		prtd->state = Q6ASM_STREAM_STOPPED;
 		break;
 	case ASM_CLIENT_EVENT_DATA_WRITE_DONE: {
 		snd_pcm_period_elapsed(substream);
@@ -341,7 +340,6 @@ static int q6asm_dai_trigger(struct snd_soc_component *component,
 				       0, 0, 0);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
-		prtd->state = Q6ASM_STREAM_STOPPED;
 		ret = q6asm_cmd_nowait(prtd->audio_client, prtd->stream_id,
 				       CMD_EOS);
 		break;
@@ -555,8 +553,6 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
 			snd_compr_drain_notify(prtd->cstream);
 			prtd->notify_on_drain = false;
 
-		} else {
-			prtd->state = Q6ASM_STREAM_STOPPED;
 		}
 		break;
 
@@ -1014,7 +1010,6 @@ static int q6asm_dai_compr_trigger(struct snd_soc_component *component,
 				       0, 0, 0);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
-		prtd->state = Q6ASM_STREAM_STOPPED;
 		ret = q6asm_cmd_nowait(prtd->audio_client, prtd->stream_id,
 				       CMD_EOS);
 		break;
-- 
2.47.3


