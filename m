Return-Path: <linux-arm-msm+bounces-108145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPpxFH3bCmog8wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:27:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A7599569AED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 11:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18841303EF5B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 09:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4FA43E63A6;
	Mon, 18 May 2026 09:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bDV6s7SK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UP2F1COC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E443E5ECF
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 09:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779096241; cv=none; b=scXJMFSznp9fvOseO6ywnIhk7BacUN39vKffoX99VSNovNadHCIDHyXqIStPuu9YSzZ7F8W4zWLRQmmovdi5BxdBYOj0yqUfTNmwqZ1EV9p176q9QX/nXGhbXJm/L13geOWNBIGRnYX/viae5QnPyBXKByHxjN78jDOYr2EqfxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779096241; c=relaxed/simple;
	bh=ZygEn0EETQGqYGeHUWtAH/6JmsqAEExRFa3DDJxxyDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XKBwUOM50jSrWQpuG4XpYTMwiC3DqVzBQadz4mI817X0TJ9K6eGyA849LmxDhFEGTaSVoz3y3Iz8TloCob68ZGUqrwsomjdIGojRxmgdnNbW1bc/aEWDn6HNNsyfhYsnqKR35kWKqNw7pZe7msiar/Ylp2L6yN19oG+seZZaSpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bDV6s7SK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UP2F1COC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I8QTLg3269301
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 09:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fcKyMgNIlAn
	wWT1JTHrlq9inj+SGc4L28t2ADtCeMQ4=; b=bDV6s7SKHuIlUgZWt2rrYvB6Ei3
	iREAyzldM+vRMMxNypLteb1tkyKUP1K17m7A1pKp9O0tvaLk2NRp6dt2YmdvSqqV
	PIOjRbiSAvWZthzB4zhSlx8KD1r0cFoILIp+9sD35sPX6vXtLxjamOZkLlB/K1h2
	igblBXQZbDnYSid+2ZsS/2EGdI4kNodvDnOG+uEBauVjXNK4kx0IJTwJFsfcnQtD
	lJ+C/c7vJZtESgo3/Saz/N68KeSOCz3yncm4oe3jTBB7obF2Ah2nN88BfI0XGwu3
	ipDf5JJjTM9oCELTH4r1yXCP2Ejdm/NkYhMGCnJ2QJQLpKCHRLiA21UOWMw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0g5p6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 09:23:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50da529ff48so63547051cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 02:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779096237; x=1779701037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fcKyMgNIlAnwWT1JTHrlq9inj+SGc4L28t2ADtCeMQ4=;
        b=UP2F1COC3/xuzMqCZNo6IkfBVEALNbwKhwMu8xOc1pVZ0ojF5ebn/EoCsDCBgelMA5
         DnrIAgDfi3jv0DFagQ0E1zmi21D3eI12zy3K05VNmuqdE7jbuOW8p9Am0GCs6f6g8yJc
         RM2l7dd76u8++W2yAAQUcT3ZyeyhYV5/79iO9Fp7r2x2F2q7Kf3JfnbojZqN3uJ9D23L
         R/kVNA9AuPUZdW25MEQUm8ujRBStU6qLQgZSr0WbUnWO4h9mYCCq/3khaFX9FMtzsXYc
         Ma2xsbbtSUYxCUk7cQy2j+M5r5tTacJ4yJnT3s8+vZncnyPPqnFcEvmQH97AAjgZfFwg
         gQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779096237; x=1779701037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fcKyMgNIlAnwWT1JTHrlq9inj+SGc4L28t2ADtCeMQ4=;
        b=BtuxclJWMvdVAulkrKVbzS3nwq0xFIcM/9U7Xo5sfkTZq/UDfXTY8DHfV4yzXYpi5u
         hXGmzBHFA7Rn5MmAQV4SMN6Vn96xgZSH5caHRRly1kprxq0KFDj6zuvedACBxCO8J0wa
         7IRB4JcQVfq5zImKkZq46eXocVVM/VPd9ly8BmqGmtiFh/VdXjcBlkSXbAHU2Or0L+oJ
         y7DAy/pZXDGTap8mvUV3uyYYXrTZDRiAP05f2KHeOObMKow0XJLabHhC3amKc2nYMK5+
         EJDlcDGTTgY12FuyNsGrTBYIDYZFx1AxOlRxO04eqRedvZO4xQdNPkFixKN93a9CIR6P
         +3YQ==
X-Forwarded-Encrypted: i=1; AFNElJ8+1uH5neaxTQkAAPQAB/7YPDHz2g4vr6XgyuyMf/oAugiT933Wdc9305q9caZni35t5wge1lz0NsxsR4md@vger.kernel.org
X-Gm-Message-State: AOJu0YyxIhS1Z6zeYNHCaBlOF3uY1QkMNoZMuWfG9qBmQ0H4mM38kElP
	Q9EqNmTrbAm7PFfWjSzx7DkqVTYU1eifW+3W89f3ZLC2iK5hlEaHFwoBOHTB4n5gWduX80H2o1b
	kwQ961rGIrLc7H9cJFrjpzU9QCIp+DlXtAg4lcVAC9ToHJf4NGgXK/j+UgaDw5p6kEtQf
X-Gm-Gg: Acq92OEhLPVNH+tFpsBKM+hwqob3nQ8ILYG72ohxrUrZ5VppESptFqS9F2eetH41b2i
	i+BdqB9zk4riLEH6h8zZ1H4ITOWDnPipPb9j35Qt6TWz+eJmoqAP749SNsz7xzvtYMLosGTzC4W
	ESql0am4hCNzGDjoOiTl+uwpT7VpderYrPWn/kB60O06p7w8yyjPCPl/+EJ2fAN5vR6FmzFd17j
	3H6+Y0UQA6IP/sCFIxQ1bWnd6bwXRfd3bzhqrwQi3zDiSA8+TtlGXL5VbAXzQhISNVuJ+qfuDNa
	oeIyGNWOy0mAmyz/YTV4A7cZ6+paaALv4eB9bQZkrQez5mwfiu1b3/4Hbp2IzH1+UK73POnQjaa
	H624asTP765/TNLxQy00fQZoMDbVt6jVnYBrFQ6AO7c5j+SLsgeoVCmA=
X-Received: by 2002:a05:622a:1f16:b0:50f:bc57:d69 with SMTP id d75a77b69052e-51659ed0e67mr188582831cf.0.1779096237536;
        Mon, 18 May 2026 02:23:57 -0700 (PDT)
X-Received: by 2002:a05:622a:1f16:b0:50f:bc57:d69 with SMTP id d75a77b69052e-51659ed0e67mr188582571cf.0.1779096237068;
        Mon, 18 May 2026 02:23:57 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe0fecsm33265900f8f.26.2026.05.18.02.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:23:56 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: jens.glathe@oldschoolsolutions.biz, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        val@packett.cool, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 4/5] ASoC: qcom: q6asm-dai: remove unnecessary braces
Date: Mon, 18 May 2026 09:23:46 +0000
Message-ID: <20260518092347.3446946-5-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA5MCBTYWx0ZWRfX48p/+35nNbK4
 /l+7Gu+g7EoJrQo3C/S7Zo5e2EkdbYIEF5mx7mYMaVxXLdLO4T2ejlKIb+VyxQ61sPCdyet3wGZ
 YATr91izauzVjFTOwFt8jC9o1qhV/WYP/yi37EsYTg4pCd2Uuo/1T/hPzQTgl5xifMr0pUm9ncy
 HdNBOCGtaGlBFkD1fFMCcyTcbJ3WBHLnPrRpjNSrq7wBFiN5SaOn/XzPD/KYcQlb9rwK78YOoUP
 RXfwKc/4cY3xGmMa+zGId0+lBdtwKH5qJ6CiKYoAhYRuc/tYVeyVX/gtO/5QSIgeQFvMgiHahye
 xds7fXBesIORDP71lzDqkK9Xy0ZK83VBgrJu0jp5qG70ux7VL4rOfUjDxYWowG6JNQgjI2efvKX
 3+0ghlIM8ZxK+i/pHbOmfPmdxjT+1DB6A6T1OAQCp/FiYkEL1sbF1R19PUkaf/It5ev58xR6tB+
 r+3c4VZqaP2MPij9SKg==
X-Authority-Analysis: v=2.4 cv=W7gIkxWk c=1 sm=1 tr=0 ts=6a0adaae cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=_k_GUD08GHZRIojl7QgA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: GLwTBLdxjHWa2r4fX-XneRJ2BT4p2Hsb
X-Proofpoint-ORIG-GUID: GLwTBLdxjHWa2r4fX-XneRJ2BT4p2Hsb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180090
X-Rspamd-Queue-Id: A7599569AED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108145-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oldschoolsolutions.biz,vger.kernel.org,gmail.com,perex.cz,suse.com,packett.cool,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The ASM_CLIENT_EVENT_DATA_WRITE_DONE case does not declare any local
variables or require a separate scope, so drop the unnecessary braces.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index fd691004a657..5774c2611197 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -187,10 +187,9 @@ static void event_handler(uint32_t opcode, uint32_t token,
 		break;
 	case ASM_CLIENT_EVENT_CMD_EOS_DONE:
 		break;
-	case ASM_CLIENT_EVENT_DATA_WRITE_DONE: {
+	case ASM_CLIENT_EVENT_DATA_WRITE_DONE:
 		snd_pcm_period_elapsed(substream);
 		break;
-		}
 	case ASM_CLIENT_EVENT_DATA_READ_DONE:
 		snd_pcm_period_elapsed(substream);
 		if (prtd->state == Q6ASM_STREAM_RUNNING)
-- 
2.47.3


