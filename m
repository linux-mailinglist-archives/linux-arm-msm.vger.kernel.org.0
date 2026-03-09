Return-Path: <linux-arm-msm+bounces-96124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOAwKZBurmn8EAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 07:54:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D245234753
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 07:54:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B5343052B8D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 06:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D89363C56;
	Mon,  9 Mar 2026 06:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iBcKiFzu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aZDmKguH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0E33644CC
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 06:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773039110; cv=none; b=LACFLKuoRedszK8AzTHgHj54U9v1s2hu58EFiD6E0IHpo4DwEi9zO4WFWwMNWgpSVRdX9myHAZxBb8jEfOrojNM1C+yVW0tBdbvChRiqfEcf4rxMkjjZ2jnsDgWUgCPViS68MSU2KNPw/fCykQLAUso3BVdcaBzXaDhgXr7FM6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773039110; c=relaxed/simple;
	bh=AhoflfyPSEypIadA7rENraHqNcIi0OFcEnzEL9v8we8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cJk7YbfpsqjNR9v2fbTnsLHT2mzcnse5t4sxDWAL8khWlNIEfa5SXJPpS0MeKPQ6gUi+c2NQRZHQiuC/s5j6yaDi8CHyhuKV+u0qg2/2Wzzw5xQ4IQyMZY/KteyJoyLRjvx6SQH0ZqHFdGM0w7iYD764CkdzaBlHacbkCiyCVfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iBcKiFzu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aZDmKguH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628Mnp7H2071120
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 06:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PS19lL6QwLa
	ikI1GyQO9iydtpc90HsQ6A4ACO7BE4wA=; b=iBcKiFzufATgRy1zoFZUpiklVX1
	gM/lcFTu0FiYJV9KviNHHAsDawcynm3Z9nGlgCyStSF9pnf6m+gK060G2KG2Jpw8
	s0ihg8zrNjyFIXgm7LFn9N0MABW8QjhjzIzJxvzEr1bRCrsl7+Tee00EGsA4hNnC
	dtP04U6bGsgR/hKhNEhI/B/Fz3lIzy6uIGA7d2A5QjEVKSvpz2TuVAJVQMZx4QMX
	/d5eYMTZ/iCegvUKnTf+QNsTDE8ktDyi7UvDZOBHKFN7ibU2x7RDoqgwH2f6Ukar
	zYh10Z0xdOIGradw1DWXyY0dLjmvTqRG4xAvJ2mETX5Yu4PaTnYgNFa88AQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crda9c268-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 06:51:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd84943c76so583905885a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Mar 2026 23:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773039108; x=1773643908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PS19lL6QwLaikI1GyQO9iydtpc90HsQ6A4ACO7BE4wA=;
        b=aZDmKguHDK330XP+2Q/TSicIxzwjNP4meONO/B19zt6XKNIRUbGoOsjtr3tQMOgLtM
         6BeWLw3Bh1IYYSsZqAKUsmQua+ObYNIAHXR87mlquMgmTrMyXwlECILaG/Lqv9dO9cJ/
         LgKBkcWWn05VEUpV9jtvc8ZzrNWEBObq5FT9sSBisRMI+8Nt00hdTI64BYAfCu5VzF2I
         V7DiOzSMgqoSqYBwtNduhuO5gCZoIvaGJUx+n+IiVIqNi17uWVB25JXop/kxFwyPXbKq
         a3qQ/r0BnoSda3WY3Sy/kl45uiqdwCFYGCtSxaSfHPRXyM1wVpDkr9Wdh/NT93GBf+9F
         Ybmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773039108; x=1773643908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PS19lL6QwLaikI1GyQO9iydtpc90HsQ6A4ACO7BE4wA=;
        b=p+qW++FKsLA92x9Z7sUtgBx1N7bmljjIL5esfjvV+hYwh9gONqYsi7Fju5ei/IpUkR
         SLOyKNZ/ij5hYE1nPGl/TruQFZ7rolVfynA5TOfDQLvPr0AXM0jaiu4zHhRaqzZmL3MP
         jC+ZEkU7AuLb97xb78LfKNBYcAjowJmkuekRLFX8nUj0jespWxY1Z6GjeZy3PCzbiw8I
         SwSHOQD+gOoXXWOSuB9fXqjCDBiNaR4Y/3vShjNi0+pYaN1xN66kJLRwIaVS8gDh9+Wk
         h/H1k1CllLdvSoI+1mnRxgQ7QJY/+2QVrvoS5piQ/k/LJB4PPi8D6LqGt/+LbxrLI7Oe
         FNOw==
X-Forwarded-Encrypted: i=1; AJvYcCX4j04AtBjE2S7GXYkTHSsGx88wiRNvZW6LWTO/y8+pyh4jrq4LdYXuODBTPjhZMzTTNbdckrgKWTNUdWB0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3idwozg+52qEwmtdOyleat/AYx6N/72c1zGpPjyHkyDDtlCDh
	NxrSKdACTTjSORbu05fTx5yy0REVNXheZ98aUpPT3L0nRXCqkWOAILJD6yJ+WOre2RLleKZf7op
	jWsXiECiWz9JkBcvqDho3E7IqrWZbb/UWEUz2eR/1d/1ahdA43VEs3dIuqS9dNiDwPcWm
X-Gm-Gg: ATEYQzzqUq13dud5R/e8GPhr9ktke/6rqmjiKvZfecWrPNMmOMaMePt4lW2AOvtVniV
	oXjXqBE5ihkrZSmX416HCHZPNp7zRcpT8u9WTzrK8k/jQUY8AliV9nkm/syBL4T0P2vW+my5cRt
	tjErnzPjVjwk2oQ05HfaP8QBuZzCPuPODA1hd2vZiz8WIAyhYPoB+hyUJNkfxI/e9jzsjEY/HKK
	tVHb+TDGLmwWv6lnjByVzF1Ow2dBnCBo24pK7sKUbXDl6fqhehdVljBjS2RePUURBNhM+5Hlg2J
	HrB5+rELJaVsQRQdyX51+6dg1uN9/Gksez69UMVSxqImC0j1EWglsXlBkXRiI2eEW/j6ArHsyf8
	pMax/m7Qp2oWt+iD+yPxV9NPxERADcvIS1B64JdO5jZiAqPuCvey0Pcg=
X-Received: by 2002:a05:620a:4802:b0:8c9:ea68:3bb with SMTP id af79cd13be357-8cd63528271mr1556211885a.41.1773039107776;
        Sun, 08 Mar 2026 23:51:47 -0700 (PDT)
X-Received: by 2002:a05:620a:4802:b0:8c9:ea68:3bb with SMTP id af79cd13be357-8cd63528271mr1556209885a.41.1773039107378;
        Sun, 08 Mar 2026 23:51:47 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48529f01997sm80449975e9.14.2026.03.08.23.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 23:51:46 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v5 05/13] ASoC: qcom: q6apm-dai: reset queue ptr on trigger stop
Date: Mon,  9 Mar 2026 06:51:29 +0000
Message-ID: <20260309065137.949053-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA2MSBTYWx0ZWRfX6+w+a0tLd7xG
 mQ3wFAlbJHxPoynfJAj6wHXbxqvLJxn5vlJCMyO9aIVm30AJ0F+91md10WA1LtDhiylGvOE6UMQ
 iQVUK/YdIfbZu0lf4AzWlOBuuYAjg33YE1QXvAYhSJvyAD6eSosz35WXsxQzQoQqE8XN1pDmcpm
 I/evJpLVODgnkdpNEpzXFPEij+y1KRx/9wg8X4oeGjo+77jrk+KM/eKC8jhNkNpWqUwfRbINitn
 BYnYj7A2kYd18tuy5Zn09D13XkVuB/M2KxKMOBDKS9qUdXy3Gm1WaoMgooImtb5EPA/UA9OCQF9
 KJ7MaQ6XZVJmfhcu6CEIllOShAbNbtmpo+Aoowe05MOV8Qzvc/Vgd7vd2qWzI5UvnvAiB+cwOxu
 owpWGK2Pc8R3/CMHXpITeiHvriyQcoTa+6xqXh9qbzVRgC2+CDvxuB4A/wMJdVVrUnkgTDP9fVN
 BB7aANYPUQyB2YeL1fw==
X-Proofpoint-ORIG-GUID: B6Pk654Kgpc7f_2gLhoLSpJPBchKKoFt
X-Authority-Analysis: v=2.4 cv=QZtrf8bv c=1 sm=1 tr=0 ts=69ae6e04 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=w9bA4Yi6UXS1dLCTJJEA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: B6Pk654Kgpc7f_2gLhoLSpJPBchKKoFt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090061
X-Rspamd-Queue-Id: 4D245234753
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
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-96124-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.997];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

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
index de3bdac3e791..3eff45b241c9 100644
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
index ebd5e3ac0366..f190ad5e912a 100644
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


