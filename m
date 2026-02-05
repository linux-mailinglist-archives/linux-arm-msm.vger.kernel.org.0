Return-Path: <linux-arm-msm+bounces-91950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEE/EH7QhGk45QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 18:16:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DF27DF5C62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 18:16:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5D03305CDC1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 17:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10F5F43CEDB;
	Thu,  5 Feb 2026 17:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GgfHFTl7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HolfHozf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B636143CEC1
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 17:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770311659; cv=none; b=dpXSfUMEyJpCp1PQUcG1M+JlfxqUzs7SYRY1LxTYVaOjqYTvdDB5RPDerXlqCulrX6VzriJ2n8gMkyDQqcMFRBqCsHgTnY/SjYOXiOnRZuvaKs4AEisDFOKmfFEkrG4Ygaz0N3Gf9OnvxXLSVcf9WE//d064RFgK1oESNQaacdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770311659; c=relaxed/simple;
	bh=MELEMTjec5vaBpCEJT88+rEEETlPjpeLlEwa5LTMeTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZZ0dpdqA76ye8+um0H5seqZV1wl85MDs/zDRtN4GUxzQgL6pvQ8ibdVtaysYXF2x9ItIVx8MoICWO/2DKLAgxjZLB4aJNw/ofi2CTqfBR7bTGBBdr+UPbGEnixJZkRCZqNH+kbu/6hh9c328KM+1SWgaGhWhA7VB8lK+WwrUc/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GgfHFTl7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HolfHozf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615BeCSP2157858
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 17:14:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yYDv/MOnY4V
	DCdh1TrAl/JagxkvVShJkBH2OQjhFFyA=; b=GgfHFTl7zi5gWc1C0A55QfPlP6w
	SupVD9o1H7ev0947LZHADmeqINMslo0cGdmTAnKCYfdXVcPAw+S3PC0yqyYG6bqJ
	ZUtMCCvlEqV7TZphlOkgBw4E3NTSAjNTQQl2d7wIN3140/IkqK25Pri36f81mvnV
	HUM/a+uVLZUuzLJ062oHZMAlGhvbKOwsegARMOxWeZyowcwJROPJ2hKZnHwZWhXx
	VvtCv94DQUkp7OsD2C64bLHVASYA/DA4y3/sBpV+3PyBzVOfJFmY+ChAlfWYP7co
	c0smO6J285PJcDdeDkG6u247SL7F0RBCIpTTttceTlrKkGsQ92g0dJaaSlA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4gynttrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 17:14:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70b6a5821so291812885a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 09:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770311658; x=1770916458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yYDv/MOnY4VDCdh1TrAl/JagxkvVShJkBH2OQjhFFyA=;
        b=HolfHozfr+CdIoc1luGmwv+SLkltIJ6e23b0PaRTw9gRCc6Igpjn7PfXrdLeGpt6RW
         ICTo/uKu9fMGErYCeuzWUVuk8QnOxonqyRU86b13CGK5UxnWG7K376eYZYBgJt6oZBjI
         NDsO3tDEkqG2PtQJ3ps1wH0HeKQzYqjDIDiaPG3lXrxBQQ24ZFxzCiTx+FxxQer+VI/p
         H8bebAo9BfvWIaFRbJmNxjBq61qT63g03GTdvPyXf4phmsxw0pzgPwHgwV4Hk1FU2g4u
         nBcCuy4AHcQGt88CiHBx5QOvPdZy6LOUlkfnKg1dAheAeISTuLDtEQsc5IDb/bTn6PY+
         9oAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770311658; x=1770916458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yYDv/MOnY4VDCdh1TrAl/JagxkvVShJkBH2OQjhFFyA=;
        b=ugGiIjsUHpTXPzMnTxjiNnH6qlimqtEsRuQwGhjr9W/SKfq9obBXo2GtBkT+kxrbT7
         3HU4I0MeYOX14uk+W1W0xyzp33yOxFNRhOr4Th5ctpE1zEBx+Zolfo04jLVsbGmYZMNQ
         8HTUhN4hsl9O3QAMAOMjhnSXApVHpLprS/AG3lxc1tGDhddO87H7gomFNk5I31Dj9GI1
         24M59P4TESOlwBkrKi0tSFjsbAxaajKEvXF6DuBxnA91dVVkl/eJwInCGu0xqc5J0IDs
         BCl72jPB7owNqgPOR2K/z5caTqiqx8lKNNAbeYFyLllfZl3ppkHpZjNmBpRrdkcSQpbQ
         hSUw==
X-Forwarded-Encrypted: i=1; AJvYcCViVL6hYI11RSMHgb5fCFhyXd2/9KmPB7O+smd9hHx2vd1NkUv63KrNeOkNOWRRCUqBva+/ThGJ/ZjfBA+d@vger.kernel.org
X-Gm-Message-State: AOJu0Yy386x+UeIj7e0pkZal4upzRF4KDgBJd0lU+pPZfR1PIdMma/kD
	udpeccTcKn6QkYCyvtzKVGn0bdqPQPYtcrEWDMjwtUNUGKGRYeypluD7vfGHI88Z+zc/a1wCSyP
	ggIzW79cIk6bhEcTgL0z8coHwT/bd2RPFzhn9LvtuUqfnSwTvkpwHGwuvyu4besPWdesr
X-Gm-Gg: AZuq6aLpbvxyiMJmGXUGghuTNlFVGKLFyvSs+lVSmWUha3tqF/alOEQOjST0mJN/8yS
	Jwck41yn9O/Aw1ugwNghuMBGRBPHG8Qye0u7uN0kHHRLMNxlez19h4igNXFnRAcSjJaNofvXvrG
	YcWFMhhBqzAPauhKrTSOYI+do8CcLVcquM5CzJrlBwTJH8Fl1zw3nCKgNaAiedjYrJUp4p9T5et
	nBXlf/DObIPH0HgMHIIgMJrMsFV5CGrkRp2MjUda/hGZHa7LvWtI+PxKsah7weL1mbMMigfkDK9
	537tD5VAztk1yO9WDDhMJM53t8ipe2JbiS0cjlCsIdVy4voZ4292GzYQAEZPzwkOJuYsVZ+lfG0
	X+YMOeLYruc/p03ubyTN1rnf5/dcR2bS8je00yoaOC+I=
X-Received: by 2002:a05:620a:2550:b0:8c9:fa97:75ae with SMTP id af79cd13be357-8ca2f9fdd07mr921337785a.75.1770311658083;
        Thu, 05 Feb 2026 09:14:18 -0800 (PST)
X-Received: by 2002:a05:620a:2550:b0:8c9:fa97:75ae with SMTP id af79cd13be357-8ca2f9fdd07mr921332285a.75.1770311657542;
        Thu, 05 Feb 2026 09:14:17 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43618057f87sm14802849f8f.21.2026.02.05.09.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 09:14:17 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        cnor+dt@kernel.org, srini@kernel.org, perex@perex.cz, tiwai@suse.com,
        alexey.klimov@linaro.org, mohammad.rafi.shaik@oss.qualcomm.com,
        quic_wcheng@quicinc.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH 02/10] ASoC: qcom: q6apm-lpass-dai: Fix multiple graph opens
Date: Thu,  5 Feb 2026 12:14:03 -0500
Message-ID: <20260205171411.34908-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDEzMCBTYWx0ZWRfXwjm3ZHUlxrAL
 1goXXbA5nmnQgUZbsxuA/Ff5DTiB3qK5Z/snL/LYVW7WQSAXficbg1jgES4XRwEQp97eYe62r9P
 61c8r2k2JpPr2iUSTdbKGoRyGCdiUk0mfHWy9XY613A/cxCwlV01WdsYeYQE1qdnt33pnGUK6eZ
 mYzrpUKqTZ1iKiJQqiEaP82Bx78hYzzfBZMzrFMsqwEXtkCB8EnP0zUi3mNjM+c/UMXb71DQl1d
 axh4Wc6rnSVEfTmI4HYAFTpUaPe78VwBkaFIebmgeVUhpVSpRWWWadnDSwYMaZ0iBzsndDDoLDP
 ObS2oXQcAyShkrEbSpk1CJybGvCLxChvRX2u0cQY38OKLxc1BXFxmx9JdZdm9DBjLZvZwup510Z
 ZU27zfluWAErnbHcwTJFE/ahIkAR4pHUeAEW1LK7lNlvBwNL2mHhOBp1rGoUOv5ab2OsOvDqx5D
 8goDNu6oOlK6hH+hshQ==
X-Authority-Analysis: v=2.4 cv=GdcaXAXL c=1 sm=1 tr=0 ts=6984cfea cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=G9hKNilMzbK2xivVM74A:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: XhFeWl8HD64B_tnshF8dayTG-59uizQ5
X-Proofpoint-GUID: XhFeWl8HD64B_tnshF8dayTG-59uizQ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_04,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,linaro.org,oss.qualcomm.com,quicinc.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-91950-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DF27DF5C62
X-Rspamd-Action: no action

As prepare can be called mulitple times, this can result in multiple
graph opens for playback path, fix this by checking if there is already a
graph instance.

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


