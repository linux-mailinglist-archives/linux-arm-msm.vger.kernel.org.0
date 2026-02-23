Return-Path: <linux-arm-msm+bounces-93753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGOOB8KXnGluJgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 19:09:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 953BD17B47C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 19:09:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C57883058E1A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 18:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B6933B6C0;
	Mon, 23 Feb 2026 18:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NQCq6Q+O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cuWZtmid"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9E033BBB8
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 18:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870083; cv=none; b=P72qkS9CZ+M9vSpbRZw5lYgSbuHw/K/eiGdVNJNU3RSmFonTZt+zG3NdlLy53C/8QuGdRr+Po7R6gjxtrvkqY3a4ZUtnsw5a8L4Js5DjvfT1PZxmZnkucHpQrbpW6wPQpOohAy1MWqWmIimuhGnW/oPh0uGtgJKX2pFPf11kYC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870083; c=relaxed/simple;
	bh=KvhN5EIM3XXPaotrLaYPSuOdgBSYq4SNpSPqi8ZqfN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j16dKwoGeWqZAEfFbYh21R+bisinYu8/PAyyZgbgCLXxWnz8tsD2GyK2E1wktRcB29PXhM98GL+wmDahv5kcVs+eSltfnpp7G8bjDDFRx5/yeQzwvviK1eRc4gZROC6u01eHigDqmcWDPfoKlQWx9TIS9VEcev1z3OU5CDnaTFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NQCq6Q+O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cuWZtmid; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NGFHvP3936125
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 18:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=K4gYoo9JoJP
	OJ5mTuliJj+hphclVDgk4+5Zp53bnrEg=; b=NQCq6Q+O2FeHjLFGEWtVf9EKOMK
	svQJaP+fIfVj46ZNjebQtx25ni115KQASMvJPdDw8D3kJDsN/cjI6Pn9KulS/AtA
	W4KQkyzPIIKSmbwBVEUTNWxA7UpjKwkf58ZoGDpfEBBREm2fqT70hnZnSDePqtB9
	DNZdeAabpwvPqa0N7i18GmiFW9meLDuI83gl104ASSayZsAD0B77cFvY2WV5dFex
	tAG04zrddMw6zE8S+SGCgzQcWwQCxs1Iaw14gqwY1GK2OLZVjGaG7CsdOqXqYdjT
	0FDhV8Qua1GtkKGXZ8yf62h902dcZPlT7A3Ya8hW5tM3EIlCmgANBnm/Q0A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgt8mgchk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 18:08:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3b0d938dso4795477485a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 10:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771870080; x=1772474880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4gYoo9JoJPOJ5mTuliJj+hphclVDgk4+5Zp53bnrEg=;
        b=cuWZtmidmb+0Q2Yf7vwqK9ACnWVQAYc4/60wyD1oJiGuOsAjxdwdJs5LD5SwQtk1MJ
         BacmtfQTrVfpzuGI45rnwTaRa6x8xgmWrDuFpNJK81GpglmaWxxxwahiFKTnaGQtdm32
         J22ZrTO0DuHgDorL0H7FtozsuzgSp7WC/EChnbV7hukIs6pfPP/ujHQMHJXQr90Gx1Ln
         lw1y1pufRSTk51kQc48QRgwqYxl6xViSLrZNGOES5vjSbjR9QloHtKiTxC9PpVdvdXTa
         UASblWXoqTq6GteZwyDqKT575So8MjIIgdODgNy6zO47QeDKxpbqWM5nVrJfeesTmPkJ
         h0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771870080; x=1772474880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K4gYoo9JoJPOJ5mTuliJj+hphclVDgk4+5Zp53bnrEg=;
        b=ESU7/5va9mVe2PZ9YckEdrcyfkrkP6+E9UqfV5K9CYJZXcrUKlYFwVuBhZL875ujx8
         SJn/E91lz6W2r6wRRCxrL0sVlwlfHyVT7g8rYKnHUhOpn/pJlq2afCdryindiNM6dQFT
         t02AgvMM9coVSA5KPcoO9opE/2/Ci/kbQas9Vqgf0uA7H5q5B2S0Ut8606WZ6gRIOy/q
         S1twzde+z+wv+Imm1q6I5HJ3i7ACEc0MlQfEbz7mnhyv8It69l1tiv1kA4XgUj6FZEiR
         d39Tel2Aw24ahOMceH9YqhzOF4tRCB7foxEQ6NLljnH6jWzGqNqL7YKGyRTGFKaIwE8+
         jEkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpI1Cd9rq976IfUSlaviQRPEVQo31PNulZQBfvYX3b0XLkHcz2aZOcXw6CNiSY/Pxl8bzEJUT9JQ3IMjy4@vger.kernel.org
X-Gm-Message-State: AOJu0YxKwr6yZKGDmGw7Ap0f7H+CjubrZ1fBbwvmnNSNzdxaGDsV7c73
	ntQsyl7mTxc9LtR6jpTCzK1sZ7twZtlcb1xXK3JBBHOFRRVY0c1Xv3935vOHwwo+42k0B0z/yJ0
	VZqmthNrAULSRICUKYBFINtEF0uQnBvtqlczg1cqDqZ7C5aA1hbNIglfvYHEnOaRSvr/T
X-Gm-Gg: AZuq6aK1fDGNMxRiwQ/QH3dTrV4cRJUmTwdGOM42SODvobdaygb5cVWPjbT4Ax7zFAr
	M/meH+3FBY0bfZQBSQKBrD+6+7KFGlB9IYyy8IpVoAIauvib+u4ML2CVlTUERx5U9NDoFqZkxGr
	MwFOpY1nmIdNvtUy02YEP7c5CXLFJiCVblZst+VnGjRnl8GKwwgHnIKuByBshg0ULtZZtNbJtS3
	2TvOL7NwNmNg+oWt79/mV39VN+BGNw3Mlbb1hzcRK6WuQNZW4J9Br8IBk9a2XiSzIfRmLUtCBcT
	/+YdGSouxYMUBcM0Z19wDjHxDIhTyvRf0TfumtB3xUoUvYa8kzT5M/gb1Y1O32yTubsfvvGjrIz
	w6Vsh6K81yUl3IEnWOLBYuVxt7PRqn20DFBRYzYu32QAqj4oFrle7tcU=
X-Received: by 2002:a05:620a:f0d:b0:8ca:2a04:3ff3 with SMTP id af79cd13be357-8cb8ca03fe5mr1202491085a.30.1771870080396;
        Mon, 23 Feb 2026 10:08:00 -0800 (PST)
X-Received: by 2002:a05:620a:f0d:b0:8ca:2a04:3ff3 with SMTP id af79cd13be357-8cb8ca03fe5mr1202483585a.30.1771870079897;
        Mon, 23 Feb 2026 10:07:59 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d401aasm20458574f8f.23.2026.02.23.10.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 10:07:59 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v2 04/14] ASoC: qcom: q6apm-lpass-dai: Fix multiple graph opens
Date: Mon, 23 Feb 2026 18:07:30 +0000
Message-ID: <20260223180740.444311-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J/unLQnS c=1 sm=1 tr=0 ts=699c9781 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=M_mAHeyD2EURj3i0m2kA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: bhbyEzhxk2ka3vEGpSpBdyauHqemO_mv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE1NiBTYWx0ZWRfX6viZCQOXi09L
 GlxAZ4YIpa8d2X5EkydVH5tyZjy6qiNkTQBXaCkFGg/pMrTWUu6XnIkEr3w9t8l5nW3ly/Xw4Xr
 Ci8Ml4YCaK/JP7Z7Csgp6I/sLvnpWchlRtUjlPCaKaVFIV8foC8isB6piaFG6+6IYSlcNxE/nVE
 yGxqc4kgiMsBWeC7iAXB+Ebar/NObBWp/HC+wBSEm4wuS5uH19j7plq2nE2rtjOrvBHK9ESnnJR
 Wk4dFwqC5N4HjJOLzsTJtmnpsUYicNRbO5evE2JHCY51fkKEbWZ0xJhBrbEOHEJ3HXKAd5U+BTU
 WtkclCiShwS2WcjIv5lktbyIlqqQmA3mFheAVFwN3+Gx/BcASXxcxygt/Nz4Vudqb/VRqApR1aW
 tUQtQ5hpefTOmeWw0blPGxMUGifsf9uZLdbmZj6wPHvyuU0zu+WnUDZ83LxigLvhac2mE+7j7Oc
 MOS7lAcJ1YI6qyCLm4g==
X-Proofpoint-GUID: bhbyEzhxk2ka3vEGpSpBdyauHqemO_mv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230156
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-93753-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 953BD17B47C
X-Rspamd-Action: no action

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
index 528756f1332b..f68d4b4974f3 100644
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


