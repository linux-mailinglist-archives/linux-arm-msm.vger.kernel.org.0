Return-Path: <linux-arm-msm+bounces-101468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOK+GDAlzmnElAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:13:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDB9385B4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:13:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B1C4C3078B9D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 08:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF0B93AC0DE;
	Thu,  2 Apr 2026 08:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VunrPcgz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ax1EiWH7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB263A16BD
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 08:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117510; cv=none; b=oTEDh5j2TW/E+eFDgCKEni4IsdBnKXe4VzISqhfddJB91Un/22O2Kl/UK7DyRi2e9ScFIi06dOwczjOzW2FFlwNds2wzvYA3OUXtrQPctJRkNEKsi75nA7gMv+7DA7BuC5ERIRXZjsBKMK9AtK0fXJLwb2n39jvy9b1jrAZR9jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117510; c=relaxed/simple;
	bh=Nn5W6j2KgfG3MXrQpHQ1hcxXhxv/yUbhKAiv5Knj23A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aq7XWz3SSKqBFvehNix3Md4Q0rDq+VxxREiM78BxIPYSriOYdcS7J3ClJsTR39UJd4wGEgAZTDTBoqJlp0urJAgMBxR6ZvO66+KD6wOXhkIduY5jXm+TgZJx24j5SOT7uv0phFyb6uG4ThlS6nJVr1aZAJiPRQb8cMJA8QPu3M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VunrPcgz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ax1EiWH7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6327HGGF3044207
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 08:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=it+OAEpYU8v
	0MR39X1WR6T1UKdIHL61i+TcaqL8baj4=; b=VunrPcgzCR4Khhq5LSz9P3y5QWz
	rd3i7ujxBJdTYvcqnClTpViVW2hCkxj0siCNTQmKHHrJiMNo86Att8TNMcEMV9KY
	8oNUeU6gaxrC+uq3T+Wo56M4427r45hc2qLxYjK4WWYgpbmgNarClxWyQfeJHFV0
	LBVpODUNzfsA/qekN0Ti4c2YE3E4Yn+EFOg/2v8VuLE+dBfVJKAW7Jyi72OQmo0b
	AmtdYp9wjFCTQBNiBQlyUUQ3tqds/b4Zsr79+hdimJdY+wXayXiEujNRJKlY8Rry
	EOBh2O26HPZffO6iy71w9w+mRz1rzdk/2Qb1D5bq9Ci4MrAt3/aqQgBsUcg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9483uuqp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 08:11:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5093a985e21so16339511cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 01:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775117494; x=1775722294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=it+OAEpYU8v0MR39X1WR6T1UKdIHL61i+TcaqL8baj4=;
        b=ax1EiWH7sS+miN0M3o/OGtuXIKfiJrkJPHNejtx56wmvOv8ZP9EGs0IyqgCWGAUsbw
         kcD4pXhDAE2/jZMbX4HzO3SYW4OZn+adGyo+YC/CdynJoSZ01/MIYKMIlmtY0a9tc5Vb
         ApX909+XWEmiaxywD/GmrB0b7W+4OMFlrmrcv6+uJrSGycKs1YvqA8ZHxBfvb9ergjq9
         3owJEckXynyL/gWDwpHu2oJUgZ/vT3ictMWgLmtd4bJ0seHfzmzZs8QoVG+6+8RighFd
         UMGmtnQcVAXTJOgkaOMkkKKIq1ZCCLEIdfV3v1PsaFJvWHQerBqXgSAnpKqKZuP2S4A5
         TgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775117494; x=1775722294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=it+OAEpYU8v0MR39X1WR6T1UKdIHL61i+TcaqL8baj4=;
        b=Fj8Kjhms5C2AqAb2p1STD3N4becJ/8dWqtenuBxh9DNNPnSYhNRQFsL4I8wlti3If3
         K/kqGpWQL6ItQB+KgZXnMqzW5rao3qqGRsauilCnsgIILZMXPukVIT2Ft6TK90ZqRdn8
         t3fkFeWTi3ctto/oPuwVXZ22LD7L6eXEr4y5kuPGqQPkm6G2hNEru/7oZl/Ps4qXMHJz
         RcXZFhxipKL9Jo7r4zVXslMor5JF7dKbOD5ZcjGz9jruLgJ+gG+0o3Onrkqo4ai/EgeU
         5NEZHISO5beb+akSQJeU1yLOE+ACB/IoCs3wX2X1W3zX2XputBGjzfOn/r7BXLPzLyZG
         qsQA==
X-Forwarded-Encrypted: i=1; AJvYcCVhpSGFee2MycWSiX9SMXTlu408DjSCFdSH4kx+n4OtuzvfP3aNJi2aO25E+dJBd85uxquLgKXedIKB9HxX@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2N/6479CI/A3XtV5vwRpu89qvy6UJ92TE7czU5JuxsN1TVx8V
	3vT8807LOJQktqELjDTxxfAB2qQ7CFH4FAspmAKP6zpy63jWXYe/LV9/cHzrOlj3lBxO9rMsGNF
	YyDnBuMy+iujo61qzw40pl4kRI9NbhvIQ/d+PiaqtjbWEtB9etf2YAfJjlOhLu1LKnvU3
X-Gm-Gg: ATEYQzy9RT/+LQ2+mffSRV9LerU+PHGeDYu5ChAfpwY+mnGoDZzyJUDCGgLjmXDyoDA
	MdOkLGLNnkrLAfJ2LCmhRZh29VnnWPvO0HL4SnWjWWNBDemBuNIt9+I3PHt3YexLl/njQVRV1Oo
	x3U8iBw9eRPA4Q4Gj98ii4Om4l21hpskt1ufV5R78SAMMZZ3QGKAacmCJh4FLLV5C9hE9a0OGai
	1EtA2uSKWTlcbRkaQvkUF6XkTX9yztSxE6gmx57S11prRSEjjdiHbqxk6tLMmIp0ZR3y4nJ7kGQ
	2nUqMaxwLJ66iqr5GvAZDdbvu6Bt0bDwFeV9NqOeAWs5RkeDDNz6tOMZ5N+WAl72rzcAuwirbCd
	O56Nwpv1IlG6IBD14Sb+9wTuMYkJ5XpCZshCbZ21PdH8y2OzufWrQnpU=
X-Received: by 2002:a05:622a:1e89:b0:509:1cf9:ea09 with SMTP id d75a77b69052e-50d4c1176c4mr34007021cf.67.1775117494373;
        Thu, 02 Apr 2026 01:11:34 -0700 (PDT)
X-Received: by 2002:a05:622a:1e89:b0:509:1cf9:ea09 with SMTP id d75a77b69052e-50d4c1176c4mr34006791cf.67.1775117493979;
        Thu, 02 Apr 2026 01:11:33 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c3a01sm5712604f8f.12.2026.04.02.01.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:11:33 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v9 04/13] ASoC: qcom: q6apm-lpass-dai: Fix multiple graph opens
Date: Thu,  2 Apr 2026 08:11:09 +0000
Message-ID: <20260402081118.348071-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260402081118.348071-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RYydyltv c=1 sm=1 tr=0 ts=69ce24b7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=M_mAHeyD2EURj3i0m2kA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3MiBTYWx0ZWRfX+mp0IXEfiQ38
 93mfG+Mtd0uNn/VERDeTLsTY6S5Us2gL0ulEzHCK4XBoAVK1d+vqeAmytNf7b7nLvGJZlf0FKh3
 HTjVDktGcyqj7GUlL8M3QdfbvHeI4oGMWFxTTV7JHFtqX/CRL0EesF0IF3YeJbFnXZm2FJ670AS
 3iGHWn99ayi67nPtDyEJ/gKSLjE0/XaX2u39TIsQFuWTqtjKD/TP1PicqYwS/JCzXBL+VW4y/9e
 d5Y6io94or99F0/9R4uf4/9c9rV3QKEl5K4yknBORJ5eZ4cGkcc2GZJ7xG+sFIjucSO0EhKfvJD
 AOlUPWVO4Azp9seK9M0NhSX1Hy/AmBUgU32w40+YzYUJ+HrcQv+jQr8aiSbLb5CHtimOl1WO1bH
 Uof7X3p99N9On2+BxXhLg1mUNgEjJCRlnoQvI5YCo3VCCtMqBFSJ+Rph4Rn1bPSToCJ2muJMGIs
 pu6pvUODHYXDja7riqw==
X-Proofpoint-ORIG-GUID: nflPQnUKhFk_DHZtr6Z3IVdMD5RCXwnn
X-Proofpoint-GUID: nflPQnUKhFk_DHZtr6Z3IVdMD5RCXwnn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020072
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-101468-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3DDB9385B4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As prepare can be called mulitple times, this can result in multiple
graph opens for playback path.

This will result in a memory leaks, fix this by adding a check before
opening.

Fixes: be1fae62cf25 ("ASoC: q6apm-lpass-dai: close graph on prepare errors")
Cc: Stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 5be37eeea329..ba64117b8cfe 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -181,7 +181,7 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
 	 * It is recommend to load DSP with source graph first and then sink
 	 * graph, so sequence for playback and capture will be different
 	 */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK && dai_data->graph[dai->id] == NULL) {
 		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id);
 		if (IS_ERR(graph)) {
 			dev_err(dai->dev, "Failed to open graph (%d)\n", graph_id);
-- 
2.47.3


