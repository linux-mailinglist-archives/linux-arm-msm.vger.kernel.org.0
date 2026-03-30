Return-Path: <linux-arm-msm+bounces-100696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cE7DGfczymk66QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:27:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D80853571EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:27:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5ED2D30517FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 08:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD133B5852;
	Mon, 30 Mar 2026 08:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RIOZW2xA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dj0ePJC9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEDB3B47CB
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858917; cv=none; b=u5XbJlPK5+9nvXejtVqqB7A9xTFFawUJTXhodHC2oRK6F3vd7iWwJ3V7zK4CFwqA2j3zIg9JoW9yDWZyYrV23twp0zBVX+cE1xP8tmXvGsspMnrHRQZgywLgw38mnn1D/yJC40uojBmiNsA7eeuAEstXompVFQZCYISnjNXCySo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858917; c=relaxed/simple;
	bh=3nJe78cfkL1kyPmx34In1LIYXv2cp1Fw4uemtw2se+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DCfGIyuX2X3joF9oga3XzCucNFwhuENqbgbiL/SWsVmyaP8pqc9m0Xh6Ujq4zNV+WTBT3ZHVEIedSyXpCtQDY0RYh33T1/0EvjP+6GQGB3eSw5baKPVbkpB6UPs84hNTRrI2XGSeUPn/wVNrHWz1jAg/JvNPGH3TppClZ2B0F5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RIOZW2xA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dj0ePJC9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7ipqt3305051
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:21:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=M4hAckrjCeS
	PiOx0QjgRxuKhLYXUUzI3EfTDbynJbGo=; b=RIOZW2xACaETKY0eRKCB2sjsRCP
	KjBRShHQa0ritDRfFZIk2H386rB/cD9ECUcYl9viuAB8+2ZtxcgK+v4JiTZRWa7Y
	q78F0ZdEL0cHzLBpQw85ZVTyHYmeD283tsCewjirdtHy/e0bPMlK33hyLN/mM+EY
	GEZ/k/zMJOPXOmj5YS7USh1lNHgOL3vC+omjx8/OZgbXm9OJP8TNx2j32mV3Qdmj
	68gXXczdY56aeITu848jUhdMZ+jh4+w000HC4Sm69608JXV89iQXT0PL6xKDfTEK
	JvUtL8G57DnBlbVekuOhSh4WJgHgTu/zGoAfbMeRDwqBeCnc0nexnZgDELA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6ufmk8sc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:21:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b781542c1so100976151cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 01:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774858914; x=1775463714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4hAckrjCeSPiOx0QjgRxuKhLYXUUzI3EfTDbynJbGo=;
        b=Dj0ePJC9R1XPnlVIaRPb40oRqqp/UZZ9rc2M32dEL/2fYfrweyzo1jigmDxX6T7new
         GQvLRviFwFBTECpW47miz5708mGsCG+lyE1Zw9A27/R8EZU8tJf7fI0kuC6DsnmYbqDy
         DlMW+7sbK5kGYD1KfGuVa4YhEZGnckYmSxf+4i2uzKnszaF0j+cS75g/VTQgPbpRiinq
         2wFYy7FX9roDYQDFfZhu3Y8Z1lhqTyspT1dnSTASRU/cTcyq5Hi6No3ybxzveRozfn3m
         UasAIgoiLKqbD4pPJyvJMpAZpEw/o0kjDSoSrSxtLwVZ4Zp34ZpZcEAfZQUPzj/vPNtw
         iT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774858914; x=1775463714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M4hAckrjCeSPiOx0QjgRxuKhLYXUUzI3EfTDbynJbGo=;
        b=OLKVp8pefLrIXchPuCkR/AqlqGgVZBY1hjtVlgOkbIh09p1cSJgAdgqO3BjAv5vNs4
         oHaSVvS2muo01FKvuvgVFhnH1MEcH8a6GllGgqOMjtKCXYUbFzvdyt8PYvQDLp5+yJ+t
         PqY0Jjo0klypKHZrh2SR5ZNw5peNVR1L5+KH2UgJFRfcuXcsOsZzYM2HXibklh/ehDS6
         9EUEESqPWklD55YjEfalfPlr+uvq81xfd15PTd+VmVobTkC/+0/bRN5bYuqKaPLld8/+
         HGL6V66gD/UUQMbAz2JtqVwzesZJv5PbgriMKYDI1j7O8yrpgxLuJdddnX1C9rL8HYiN
         eQwA==
X-Forwarded-Encrypted: i=1; AJvYcCVFGxiAuITfeIB+Q+MJLtLDlKTCq30HVDZxAORPvG/4fnNR1MMI87Vu+atr1lcQIjqRGQgF80mfF+sgUME4@vger.kernel.org
X-Gm-Message-State: AOJu0Yzpt4GdJd31HhGlNUPTBjUrd3grOxpPteCoiE/E798U/AZHdoul
	0fQ6Vk+FXFdsVSUEnTPOZare/htGSTUvA3U08961tRje0htAZaxYVFIZzMGhu0KouV7l0kPIsj0
	zqA0Eia7QAuVtn7Lww8hDCrwiUiuvGf+nqNKiOBIAUhQnhfVFJ3/9hO8L8kxsU37avK+q
X-Gm-Gg: ATEYQzxCKs802UTjXjvUwviWS0BQei9yCsJlVH8tvajI8LKvTRxc4HhN2ZeAynOfoFL
	pFkUB9SFmu0tSrHY6Fp5A1RQEHE2C1pAsYR//cYJ9EhjUKkTRxtzhuUZHfMRCEn8NZUzl5zJcXV
	Rey/Jxc+1Z+9EBThm7tmWZhFwzYqRgYolLdieSW5zeTtRg1CRNrGvKg/HatdYkjfw3YZMSOOByZ
	GODPnCYgGx+bZoj/soUIuK2WK2eTEFfGoCTPQVOYj0zGlCgV3VKgU/iaiFa/35R2Vt5eS50NNPS
	Cd2rm2tBuU6P3E5YGf2Q7aSF1AmLhkk3WoWDlKtajlZHG5pwBl/EZGkO3JtrZztgv3u/HJQlAAX
	3Q4d93/DXTd3AHglclm2JuLEWMps6o34ITaurq78TiRJtYHvtKgmuyjY=
X-Received: by 2002:ac8:7d15:0:b0:50b:50bf:5bbe with SMTP id d75a77b69052e-50ba37fac78mr172230501cf.22.1774858913556;
        Mon, 30 Mar 2026 01:21:53 -0700 (PDT)
X-Received: by 2002:ac8:7d15:0:b0:50b:50bf:5bbe with SMTP id d75a77b69052e-50ba37fac78mr172230191cf.22.1774858913115;
        Mon, 30 Mar 2026 01:21:53 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf1db08e6sm26244773f8f.0.2026.03.30.01.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:21:52 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v8 12/13] ASoC: qcom: qdsp6: remove search for module iid in hot path
Date: Mon, 30 Mar 2026 08:21:04 +0000
Message-ID: <20260330082105.278055-13-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2NSBTYWx0ZWRfX3gtAlVkGrigg
 OI83DsoKKLhw+QtBK8jL4uuOtX6nB6MFyaauAVHmVg/emMVJ4l44y4uEZOfXFGXG98XwuLbc0C0
 Rc/ZVVyJfa4jGNbYgw9gdQfqgPLSi78IIuIhFkOubCTMuXl2zTP0rwrlMJ1wmSlrU6Ao2BLe8mp
 Mb4sj4IUkIdQ8NFmFrmMEGDswxjH61szTVwC0EXVCPzzFPpEInG9M0WMk5ScLOkL7SohMuzsJHb
 o5j8C4s0MnFxb02zXO1NBiVZYOnKzvaxe6uokXcZXkJ+Dqf4eLAZDbz/7V8y+sa36wdSEMfBqwX
 bUw+ibKzXtctEnec6pMdwiDAcZEGR6weO9YUnNjoismm7yMNpBecSmCqeYWAvGDEz+iNE6+Ijns
 7UfS5A2pqrXv6aFVRbjCru6WrL7KTuTjFvnBb2s5YpNnlbqH4FVuV6zusBSnagfTLiGf2TxpDe8
 iWpwxpvPN8KIPTq3VoA==
X-Authority-Analysis: v=2.4 cv=aOT9aL9m c=1 sm=1 tr=0 ts=69ca32a2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Ll4dbTg5roZnn8cDlSAA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: Ywg9Z6J1CxyR4sWiBrGxAnn9gQpQyU1c
X-Proofpoint-GUID: Ywg9Z6J1CxyR4sWiBrGxAnn9gQpQyU1c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300065
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
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100696-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D80853571EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove searching for Shared Memory module instance id on every
read/write call, this is un-necessary if we can cache the shared
memory module instance id per PCM graph.

Add new member to graph struct to store shared memory module
instance id to avoid searching for this in hot path.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c        |  5 +++--
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c |  4 ++--
 sound/soc/qcom/qdsp6/q6apm.c            | 14 +++++++++-----
 sound/soc/qcom/qdsp6/q6apm.h            |  3 ++-
 4 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 292be457764f..86d6438bd9fd 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -355,7 +355,7 @@ static int q6apm_dai_open(struct snd_soc_component *component,
 
 	spin_lock_init(&prtd->lock);
 	prtd->substream = substream;
-	prtd->graph = q6apm_graph_open(dev, event_handler, prtd, graph_id);
+	prtd->graph = q6apm_graph_open(dev, event_handler, prtd, graph_id, substream->stream);
 	if (IS_ERR(prtd->graph)) {
 		dev_err(dev, "%s: Could not allocate memory\n", __func__);
 		ret = PTR_ERR(prtd->graph);
@@ -496,7 +496,8 @@ static int q6apm_dai_compr_open(struct snd_soc_component *component,
 		return -ENOMEM;
 
 	prtd->cstream = stream;
-	prtd->graph = q6apm_graph_open(dev, event_handler_compr, prtd, graph_id);
+	prtd->graph = q6apm_graph_open(dev, event_handler_compr, prtd, graph_id,
+					SNDRV_PCM_STREAM_PLAYBACK);
 	if (IS_ERR(prtd->graph)) {
 		ret = PTR_ERR(prtd->graph);
 		kfree(prtd);
diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index e904066484d5..006b283484d9 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -203,7 +203,7 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
 	 * graph, so sequence for playback and capture will be different
 	 */
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK && dai_data->graph[dai->id] == NULL) {
-		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id);
+		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id, substream->stream);
 		if (IS_ERR(graph)) {
 			dev_err(dai->dev, "Failed to open graph (%d)\n", graph_id);
 			rc = PTR_ERR(graph);
@@ -240,7 +240,7 @@ static int q6apm_lpass_dai_startup(struct snd_pcm_substream *substream, struct s
 	int graph_id = dai->id;
 
 	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
-		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id);
+		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id, substream->stream);
 		if (IS_ERR(graph)) {
 			dev_err(dai->dev, "Failed to open graph (%d)\n", graph_id);
 			return PTR_ERR(graph);
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 5751e80b3b92..6a3942a1ed28 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -411,12 +411,11 @@ int q6apm_write_async(struct q6apm_graph *graph, uint32_t len, uint32_t msw_ts,
 {
 	struct apm_data_cmd_wr_sh_mem_ep_data_buffer_v2 *write_buffer;
 	struct audio_buffer *ab;
-	int iid = q6apm_graph_get_rx_shmem_module_iid(graph);
 
 	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_pkt(sizeof(*write_buffer),
 					DATA_CMD_WR_SH_MEM_EP_DATA_BUFFER_V2,
 					graph->rx_data.dsp_buf | (len << APM_WRITE_TOKEN_LEN_SHIFT),
-					graph->port->id, iid);
+					graph->port->id, graph->shm_iid);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -449,11 +448,10 @@ int q6apm_read(struct q6apm_graph *graph)
 	struct data_cmd_rd_sh_mem_ep_data_buffer_v2 *read_buffer;
 	struct audioreach_graph_data *port;
 	struct audio_buffer *ab;
-	int iid = q6apm_graph_get_tx_shmem_module_iid(graph);
 
 	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_pkt(sizeof(*read_buffer),
 					DATA_CMD_RD_SH_MEM_EP_DATA_BUFFER_V2,
-					graph->tx_data.dsp_buf, graph->port->id, iid);
+					graph->tx_data.dsp_buf, graph->port->id, graph->shm_iid);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -604,7 +602,7 @@ static int graph_callback(const struct gpr_resp_pkt *data, void *priv, int op)
 }
 
 struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
-				     void *priv, int graph_id)
+				     void *priv, int graph_id, int dir)
 {
 	struct q6apm *apm = dev_get_drvdata(dev->parent);
 	struct audioreach_graph *ar_graph;
@@ -631,6 +629,12 @@ struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
 	graph->id = ar_graph->id;
 	graph->dev = dev;
 
+	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
+		graph->shm_iid = q6apm_graph_get_rx_shmem_module_iid(graph);
+	else
+		graph->shm_iid = q6apm_graph_get_tx_shmem_module_iid(graph);
+
+
 	mutex_init(&graph->lock);
 	init_waitqueue_head(&graph->cmd_wait);
 
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index 5cf538397841..7c646ffcf956 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -99,6 +99,7 @@ struct q6apm_graph {
 	void *priv;
 	q6apm_cb cb;
 	uint32_t id;
+	uint32_t shm_iid;
 	struct device *dev;
 	struct q6apm *apm;
 	gpr_port_t *port;
@@ -113,7 +114,7 @@ struct q6apm_graph {
 
 /* Graph Operations */
 struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
-				     void *priv, int graph_id);
+				     void *priv, int graph_id, int dir);
 int q6apm_graph_close(struct q6apm_graph *graph);
 int q6apm_graph_prepare(struct q6apm_graph *graph);
 int q6apm_graph_start(struct q6apm_graph *graph);
-- 
2.47.3


