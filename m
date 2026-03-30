Return-Path: <linux-arm-msm+bounces-100690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBugNP8yymmN6QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:23:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BA235710A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 10:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F5193024A1A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 08:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 977B33AEF4B;
	Mon, 30 Mar 2026 08:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ODVRXoP5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TLhORz3T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907CB37F749
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774858907; cv=none; b=oFaRorcf7D+Eq2ARz5yEzQyAmtCgzznAMDMRt0LPwKHF4yD9LbO5qtEqCZ9TMtW3kB8TrU+Kr/oZow/AxxQJQq/+PqKXLivZ17zKroFDcNIDiaqxMRImTbfr5a+IedsDYny7ul8UbHLwQN/+1L/jT9VNhDEAdfh3PLmtcDRf6Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774858907; c=relaxed/simple;
	bh=Nn5W6j2KgfG3MXrQpHQ1hcxXhxv/yUbhKAiv5Knj23A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rmYG1b6g8ZL+emuxlgxfY4UNKyYd1EBuA1LxK61fdZz4w0MSJh+hioPTUulxSQM779fnGIpp/+h/RTk+76waZSV4fVEQQmyfVZerZCxX/1WDv68vyDLWRv53iXqLNAdVesi3y/AWA6OdxZuYKx8JVvtNH0lT+4/y1liVD6/t+Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ODVRXoP5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TLhORz3T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U6hawN842140
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=it+OAEpYU8v
	0MR39X1WR6T1UKdIHL61i+TcaqL8baj4=; b=ODVRXoP5DPzAOpeIcW0XRex9b9l
	CrEkwyNYBrFqKot1f6vuXl18YEpNr9OsG3mGouk+4ukkEjxlGVP0R6WSZLR5NSiT
	X2Q4yVm1Ewgj++zto+b0rLONXRoud0rVDYMwJ/65t+IHZ6XJzZrL2Cot8+Jt4W/8
	iriy+Qp52rESuU1nxHZ/PiAcuOq4gMARmx4AqX74edlPxp9EmEEZwJtvHZTeCa4g
	FYRgAOmqgSaiWhhvZPBWE+8lQLHQ7V/0U5GHATajY+uzBTIX2MqGA9pzsYMfIjGp
	nKn2mUFy1IbGxOIGL0PBrAM7wWqVi4wmW5qRgWuhyZT0qa3txTrSk96AUpQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d64pddh0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 08:21:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b3544bc7bso57241791cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 01:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774858902; x=1775463702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=it+OAEpYU8v0MR39X1WR6T1UKdIHL61i+TcaqL8baj4=;
        b=TLhORz3Te5ybLPk6+CW3DHK5CPoJZyeARZpyGTgeP+2hcStx0t/1QSZ+7qHMnZadaq
         PkRkL/2tfqIbCULRcvdjZfDlKay8AT7VTgnews4BWJjPw1XDCoWYCJaP7yt6XIfhCGuP
         i8Qa9guY0VlEASaIJUDXjnnopmdrq+YC7ZTMZFi4R0uZNiZ3EdAKdd/xq2tcJfr6uQxQ
         EhpWuE8uAH2bqnqwKAz/VUpNDvJq1cFPb6EAMmi1dZih2qvKBfayi3AMfaRkIpDKQu7S
         wtr6/9HwlitQAV5IPi7PKi+R3oTGT6AMduPu2i7VTxME1LEnjN+nF54Pj1kNW0BM4KQi
         3BiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774858902; x=1775463702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=it+OAEpYU8v0MR39X1WR6T1UKdIHL61i+TcaqL8baj4=;
        b=h8o1X2SDt2eTMFu+myx5XQK9Im3uh0fsxMusu8swZBAEl7P0iixYryt/52Yjz2RTxn
         nYXE+sO47qJMEKuhIJO9GnJqaINIDAEU4BYoUa5xigcBEpcuB/1haqgiA7BDGUkoLMCA
         251/IU1PzKVMn96r+QBPSWLEw85VrYDkzvwBCwGc5ufMuJtUFGdwQ3tT1n1YcJIFOGIP
         VErNSxkU5KlhLA90670L2Pd2s2Sic403v9xazBMSwlNB4LQpeztcL7iKPhOrwuJ+ItMX
         bOjVrMtgaxJ7tFfdsogqibH37fgW2pjsRAoLWN5NV2kr0YAeSna/naS1hDGjDd/BTGNH
         KTYw==
X-Forwarded-Encrypted: i=1; AJvYcCWl/zA+LW+6lK7QMkpmGpAyXVFWfjyA5LBQZL2mR11V+dLfGy4Ql6Z9wjwGyfOgLjV8ktoVGrLtzib5PvTA@vger.kernel.org
X-Gm-Message-State: AOJu0YycI8iGFITvxZ6dBcNAson2mLL2UFEmedpzd5sb66FwVPM8hcPG
	oTsreB5OhsbC5N3Qs0SJARrrhWkoz7s9KpQunQGXFCxKuM9AHpI4OHtiGiHUUwHC8hcgamrmz8z
	bzwh2Qy6IxuiBTp5kw8LmYYsQiG5ONXdnTWukjoAKHYcD36zA1JatOXL6EQXoY+bwyZRL
X-Gm-Gg: ATEYQzxB8x4VJeYh2IpYZtQEJjoFU06XLzHw3WF2fXRlCmselbBYqPbMcvqKvW4acPJ
	qig8oLrdQFuPekM9BYBy2ZcTCjaavjYsdukYKQyR9gEyh+JbElm7mFKMATDSH4TMurbqCqMPtGQ
	sPxUU1/fxFS4vOnQZuZ1WMKicD2Fs7KOjTktk4NAzMjGfxXm9KIUPGw8Ru0CeLdSeKOKGMvRJKo
	8AhV/R04LZdbWy+WYpZMWZOPdxbJ7IsSXtToDN0yy/lEqOTjUKr+8LlqYjR49muuHDChraKt0YY
	06bpNSnBy/8Qo2MGAdT15/xSLvuJr2tBJPyBiiW26jbmyZuLZf0aFahL69OJWOtM3Yh17nEviKY
	fMtiG5j7PyFxSs0IISuISEeGQb+1pkfqjpAQTr0jMhoU8f8z0iYP3PFo=
X-Received: by 2002:a05:622a:5a87:b0:50b:40a6:29b5 with SMTP id d75a77b69052e-50ba39186acmr156494401cf.42.1774858901756;
        Mon, 30 Mar 2026 01:21:41 -0700 (PDT)
X-Received: by 2002:a05:622a:5a87:b0:50b:40a6:29b5 with SMTP id d75a77b69052e-50ba39186acmr156494201cf.42.1774858901294;
        Mon, 30 Mar 2026 01:21:41 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf1db08e6sm26244773f8f.0.2026.03.30.01.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:21:40 -0700 (PDT)
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
Subject: [PATCH v8 04/13] ASoC: qcom: q6apm-lpass-dai: Fix multiple graph opens
Date: Mon, 30 Mar 2026 08:20:56 +0000
Message-ID: <20260330082105.278055-5-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: vjAmN5WIJa7ZjCAeU6ELkQuEwjtcYJL8
X-Authority-Analysis: v=2.4 cv=UZpciaSN c=1 sm=1 tr=0 ts=69ca3296 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=M_mAHeyD2EURj3i0m2kA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: vjAmN5WIJa7ZjCAeU6ELkQuEwjtcYJL8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA2NSBTYWx0ZWRfX5f675qFwgEQJ
 3YpKkL7kxFCWsdaXQJn6U48+OfEMOoD7DfEBDBpDh+PsMXq9NWDspDEMpvPT8l5K/4vUr47Kieo
 SnL3weLkkiDXIlTiCgKPjLOCaipHKoir2s++v/f7wxxAzeBxA00MLOBFnz2Fq7i2VjccODq+Ib/
 hgArQKUAgeL40NpsnAIisnFTUfxR1F7qwMLJgO8ElUtt8M+L/S3YqVnhXxxCFz28GqR+m/q0bGe
 nOOq5XPaFYa9V4AnoEwOSiucC+9zd3oi3nMTPVKSv4MxIUKcxgBzc516Wf8oxCEnvcbH4kUqJg8
 uMywez1x8STHWzdpXKOa3oT9mDlJ4IsYFawnzsekiqt6AYGOcTOJJ7KRRJ4MqbOxTiBRwoDdTGf
 aFpO1utFWzu8KPiFAnHrQGBMujTENiHT8tXe+xnAQVkEGw0V5P250ucObPWl3sAqZ5X1cKAQsXM
 uP2ClDyLsyRVfiZzQWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300065
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org,packett.cool];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100690-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 52BA235710A
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


