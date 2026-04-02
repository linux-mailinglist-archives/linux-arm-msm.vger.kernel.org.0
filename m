Return-Path: <linux-arm-msm+bounces-101469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJ7gK0clzmnElAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:13:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90185385B73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 10:13:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7102430172E6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 08:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E56EE3A5438;
	Thu,  2 Apr 2026 08:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QVOh9pWE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R3kuIe8b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337F13A1E9F
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 08:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117510; cv=none; b=TW/NE/lK6/5XXbWNWRKN6CxtXY2SDYgNn3FoqjhuWyzHGLDx4Zwn7MtbvATkUq0RvI2Q8UBZ9o05MpWmCITGNDowzvdFDsEwLhE6uGSMPY7LcW0m6H41S8ponRJ8ovYDWcMTHzbYYDA2GhfHYNfFQfIzTbcvUMe0qG44Z1+BGyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117510; c=relaxed/simple;
	bh=aiDV+ay9pDagfXi99dECc3+gFHUApEvFgcp/SMLLkOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s+7s5ujk7Tt3nvLfYcgxlGpOy8V/NwVFXpKHzhsVyS4Z3QG3tPUR/GXbspdwR4e03FyIJOAxF0uvVvHneu1wY3QM0gaiNKYM4r8hlzvCMvKWWOyeJYDV8tagxRuVvOxh3w+HFpTdmNIFhtNE7rZ9iU1+3wYrQ3u1zw6fgYnDh1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QVOh9pWE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R3kuIe8b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6324QwZj1551693
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 08:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yFv97piS34p
	vw8S7ZuPziYbAwBwFldQJ4NalWJR5jGw=; b=QVOh9pWEICPGgTVQyCUf2lFQUB3
	/3lHUE8RrAhf1r49B3XSffGuoEHAWWsQ1tp7fV31ETW4u8Clx3bL3vnhauJY0P3B
	YtWDeAS3hwXMj3EmEfFVIdye/XfKu1KB4GWS6jEmz4bHfyUfy5hIhz4JW6j/2O7O
	p1pFOy3NT4JtoYhBFwFYjfHfrqtdkucq95sX1a5IaPuoYdtGh/WwtutHvD2bP+l+
	wLoE/aiWO7Q9KycepcdLkYu9w3ZZRuDzb/KsmpHXFikQ5hWIQ5JOV+CHlzvTLV29
	2EwTfnpAN2j0umYyEKwGPkgr8U4jqSsK9XP5vjfPKHWMxhKqNRvXYSQbr8g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9heerwcj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 08:11:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cfc1634e43so60777985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 01:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775117496; x=1775722296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yFv97piS34pvw8S7ZuPziYbAwBwFldQJ4NalWJR5jGw=;
        b=R3kuIe8bKjjXm0vU2ggqOTTFVcPQ5cQefR1J+4rD9jfYqwyoJ9hi+X4RJC3iJuixgm
         WpW8WKrhmUuSe1m06UhwGf8Q3cydwEZo89sVzHjdF8gCcMq42k+OO+YGzpJEp9wJqYV9
         3t/0WSdXnDX0Ljfd1DQD6uLZyZiPwu9Pw8bY34TCoeTGwteH07Z21DgM2nXO2AWQFp4w
         DxIV/1vNH9ZuBq5pDtVJC5L5KZAJintNdxLh95NpPweiu9oa9E/W2CR+XtK43PIBpDdh
         uvnGqsfxBY5moTaGg56+pVoCdpTtkkyzJf9t3HC3kZUVM3Rba7CLnkeLZUtpyuILJ7WI
         adhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775117496; x=1775722296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yFv97piS34pvw8S7ZuPziYbAwBwFldQJ4NalWJR5jGw=;
        b=E82uzoXeaH1q/e1R8fkZkV88czu1pvep089fB1403sydyvHcTyiu1HRy4iWpuD9Ev5
         lJV5bQIiEMIfknQ+p4RDEYDzaJZDUZwulZnbkwn1HnbxaAU8XIwb2SiUgLRGHhSx1x6q
         hIT7HqL9pwqwkaNzvgmNd2o+A1qtAz+tfFdQLZhPlbGLNqeQ/eDa41n6VoTbJ+EZu5Px
         HspleLl5eKPv8B5kdF8FODv5SWAQawoWDY0/wCS6YMrwkbUgkn2cnz061dZMUiRnqIUF
         Kf90gU2xvKyvH6eAhdN8YwGYR1oYBq+NqAd16jOZh9zqBz1dYRy7VInNxIFYVoeN3h1m
         6Oqg==
X-Forwarded-Encrypted: i=1; AJvYcCWWIWHJy1eVO8U6jfgQy8Jp+/jaa6hl7qRizCEmZ7PG2CSwvjMWz2C3BC8TqHnfupBzew/PD+TR4u0/JvbF@vger.kernel.org
X-Gm-Message-State: AOJu0Yxey2l+RVENEjajitANTBA6+GFdcBgDvintry34rwELuv0kZeLO
	iBcwEh+scQ/AZirPx9cX57QrelfUzj1+zJUe3fT4Eti0RWYhsPVdgiQiV4HFN572muAup9FloOC
	46xyI/jUdGfkZ+l/xrSnisxmlmYUQl+WNIZPpVwWoCX6NWYZcSJWomjBAqO2vT8N3VdYf
X-Gm-Gg: ATEYQzxrqLt+i4YwT0UBqgpk1Vc5gz2LJJ43G44QsCcSk1O4CctusFr/hsZWem6FkPB
	E6h0vyJrXco3Fumsd7Gpylao+raaq+WglsFeUul7PYLuJHz/y9JIs3trCunj5kXofGXTOwleesS
	idltVILKlvq+Du20BYM51WRlq5BZjA+CzKgXFPEZVTsKuf0JA6YlpAVSwL0lEy3TR+hN7MXnFF6
	OltgWm9igIJVcdA9HLukI0mqm2oy4Dmvy4Sw+XFop2oCOens/XtnCmzMSx4qtWnTiFzw4DPq6/5
	w0W1WfK9cBl9pw5f9W/2V3wvLibOU/gnTS8lDXb5+GaGHhd8t4nNXS7S2/XWX4lfr8omgoLcgAJ
	DMKTycGkfrBwdGPwIHzmQHM830kIVA+98XhH35tkVDuO9DYmGbeYJK40=
X-Received: by 2002:ac8:59d6:0:b0:50b:4d74:6614 with SMTP id d75a77b69052e-50d3bd9e18emr90671191cf.63.1775117495862;
        Thu, 02 Apr 2026 01:11:35 -0700 (PDT)
X-Received: by 2002:ac8:59d6:0:b0:50b:4d74:6614 with SMTP id d75a77b69052e-50d3bd9e18emr90670831cf.63.1775117495403;
        Thu, 02 Apr 2026 01:11:35 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c3a01sm5712604f8f.12.2026.04.02.01.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:11:34 -0700 (PDT)
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
Subject: [PATCH v9 05/13] ASoC: qcom: q6apm-dai: reset queue ptr on trigger stop
Date: Thu,  2 Apr 2026 08:11:10 +0000
Message-ID: <20260402081118.348071-6-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: D9SsRjXjHClUGhAoWI5Zk-AKibnc6FhS
X-Authority-Analysis: v=2.4 cv=VY36/Vp9 c=1 sm=1 tr=0 ts=69ce24b8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=w9bA4Yi6UXS1dLCTJJEA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: D9SsRjXjHClUGhAoWI5Zk-AKibnc6FhS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA3MiBTYWx0ZWRfX1G2cWP2wEmtV
 /z6FH+SrSeNImC7uj8OnOZ0T/TF2BF+EgerGmWNtoQzZHh08ibe3ZbfR/r9EJ81urxId786q4pt
 ep8H3TMG37Z3AtQYTeVRGagA3ARTZsxbUuJBw4r2boxBfahs6TSIeRXqTuzosx9Fr3AccISdRs9
 CYeiVhdhAC01WYCLjh2B5gnRittFikgVLDOewqR/x0L17QYugJMIOdgWDYH6NuU0+zn/vlDFzUS
 oKTuW7+OdFAzIiJ9D14lbKkbQJiL6oUXQS9lQ+teEm4B1tcJbrEJH28EjCj28ZI0pBH9XR9gyHW
 prWcaixsViP1JQt5s8r+Z2FuhX1AKRsTX7/tOILkzX56BaUXYLaqBBR9qpqBKl8H1TCZqML0McP
 2TBicR1g4JB3B34HQbdcmHg/JQt9uMBVHetVGX1LOnxMJ4fDlAbGtx34NMK/2h+6XVYvU+sOKDA
 zbDPmyeSHLf840qHHsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
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
	TAGGED_FROM(0.00)[bounces-101469-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 90185385B73
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Reset queue pointer on SNDRV_PCM_TRIGGER_STOP event to be inline
with resetting appl_ptr. Without this we will end up with a queue_ptr
out of sync and driver could try to send data that is not ready yet.

Fix this by resetting the queue_ptr.

Fixes: 3d4a4411aa8bb ("ASoC: q6apm-dai: schedule all available frames to avoid dsp under-runs")
Cc: Stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 1 +
 sound/soc/qcom/qdsp6/q6apm.c     | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 306e928e7b49..292be457764f 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -317,6 +317,7 @@ static int q6apm_dai_trigger(struct snd_soc_component *component,
 	case SNDRV_PCM_TRIGGER_STOP:
 		/* TODO support be handled via SoftPause Module */
 		prtd->state = Q6APM_STREAM_STOPPED;
+		prtd->queue_ptr = 0;
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 2dc525c8be42..5751e80b3b92 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -215,6 +215,8 @@ int q6apm_map_memory_regions(struct q6apm_graph *graph, unsigned int dir, phys_a
 
 	mutex_lock(&graph->lock);
 
+	data->dsp_buf = 0;
+
 	if (data->buf) {
 		mutex_unlock(&graph->lock);
 		return 0;
-- 
2.47.3


