Return-Path: <linux-arm-msm+bounces-98942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNjKNOBgvWl09QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 15:59:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8378F2DC2D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 15:59:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8B01C30F0E13
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 14:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6DCD3C9EEB;
	Fri, 20 Mar 2026 14:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H0mudFIR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C6LhaE6P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FB73C942F
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 14:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774018175; cv=none; b=ZYY+S8EKx+KM0mybuN5Rt+JYegymZsZZF4UcPSaL33lhKyd3pG3wAm7UXFgqOTp90u1E12PUJK/8VEUVJNVADdInEKQaQVJ/iOUbYRyUh4vZgxfpWFcR2MdYucLr6ibpitckr5yfBj3kgQ03MjOY6T1hdKPdQ/+T/tRyJrS+rTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774018175; c=relaxed/simple;
	bh=uSbPbbEF96iO4/jDf1d3kH2TPon+s7DHfw5HFTuRwdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tnp9mVFlczhij7hL1XRR5S+qWlV52q4dz6jNT7KbQ3WBwvyspQ8fF4S9tJsNq+xFnwvR/WiUwP3fihikLSiqjgdGvuuEm3GILu5KLRxZeZs+mw94Dcd8qHtJoEKd8pDlzZzhNFn1Xn28eIRvPqTpZ+OibUwQ9plBzL3VLoTHYj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H0mudFIR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C6LhaE6P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62KEXcU2989463
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 14:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/jKQw8dGxLC
	6/wkqCmrBcQV0wz2LZBd3Fby8QVjVQNY=; b=H0mudFIR1/xHDAwKWwh7u3rW4UV
	0YoL2HXoCdZfXn3FcRnoYI9SiA52cx+zOE8LZfemtOw8MIsAmmaCbajCBT+UgLVb
	hBOfjxD+fS6ypsuDT5hlkO3CsTspZBKdfgMiZwx5j+BbfKwnZ04QndJR/ZHgYgnL
	nJdu7EeqVUOL6fROJWgJcNH8PvaDpjgr+ZpaxIkdsPRb8iJHlZx4x3qp+rbaFO1N
	McnwM6KtJoxpfg8x7SjvvU1rrEWsqQsi33wxvg9FNi5FF58fQGsyAetdkR0nr8M6
	DBjLiVU2s6I8Jfp2hDCpvQkjNaPyHL3CpltKY7Cna9fmFpYJrsKkD/EzTAw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0k0vbpvt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 14:49:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093b92f327so120858801cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 07:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774018172; x=1774622972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jKQw8dGxLC6/wkqCmrBcQV0wz2LZBd3Fby8QVjVQNY=;
        b=C6LhaE6Ps8jL1tckqKCjDmeMdUjVJAWHXlFVAcPnh/aVEJCmZu4JXG/PIJ4YACuAja
         eOW1vJ/eYeKYbuncY9BKnxZu3s+mEzPW0XG3CflvcPalT40THHLa/pnZhV3XX/GYIRyB
         J7rVHXVBswVcEchTlb1cl5+/8Vx0vdIlovSVRiEE39O2gI8cxxZvdItvyfCCZijju4Di
         Wjq25ie3fG45curUGmVvg5OFAfsUQ2pP0EhbO66By2HvpIsXBqQk6PyixzAvjjH6LQN5
         rsgB3l8LR36mxY3X3Cy/Hth09M6GnbHN6OjJ+S972Z2FXWu1+MXpKBf7aLifaJ7qzWRT
         u8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774018172; x=1774622972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/jKQw8dGxLC6/wkqCmrBcQV0wz2LZBd3Fby8QVjVQNY=;
        b=ADxDRg5a8ZL8N0Ke8is1ssaahl3FV7KvzubnH7ZmVpI4+a8payMUyOcyc7GrlnsRaK
         EPWQTQDS13GdNxCoCondYlwI4E0wtG8hWwv41YYSzfSJlci0ZZo0Gmgmdg6IEyiHEiU2
         15NHXZ1PDbRrnN71g9nqTmVB2OiHMzR99GA/Ie8U03oAFKXa4q9TveoOiiGpJmROyERh
         w470BFVlseMJj5XOb7VMETbecdti0bsZZheHhkLEFnQZPVSgaX/Hv+TyKwznMZDZK/C8
         lk5oab+yBmhN45CMYr1QQxN4JcFPPLgzRW6m7NyR8SC/tmbrAhDCYi0KHBoBv0K/wB/w
         vbfw==
X-Forwarded-Encrypted: i=1; AJvYcCXyW6fYgeLnPX6zX3ncYHGK8Y/lhEtWWVbd5sEtpZkRVuaSrkHJTspp+ZmDyCFWCFbTpgg6SmSvn8gZgH2M@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2WKH2D91eFCr0XnbvRW/m5u7ndDXTcHvhxhyrUnGu9khf2ANQ
	9l9HvQQicsoEjdJbrIs6J5udwY5dMGxEdks87UcD4UNQt1HAQlNnAAQbOkCYm4tsKERIorAYthn
	bM95A80K3i3iHqfgn+eXLH2AfXaDt1Y9w+t5+clEZbeduFrgSMxNmoNJcoZ2sInGq+M6i
X-Gm-Gg: ATEYQzwC0hpIfzJr/tvsFf1g6i59F22QH4e4eQuDw+VSbe3WkyYZnKvkze8L+tv6AIK
	LqR/XQahsBSQ/jVpVhbHKGFoKY2Zl5MrzHlZ5DvKH4jQvFqKwOg9oGzGcoouBuazWpUQePt5miK
	OXUWqGNrmC9vLaQbY7RDXNRyoMpP0K1+GziT/GS6XDnuWz7aTpX88b5IK0Ed7O7qfiRcyOCQTJC
	sPWFILUU/6b5GYfcDcj2fq0ZJg7T3FZu2Q6/AWikfhGgFFijXOHYNfffWj1eMbWjIDbSwEROdsf
	OeaOzIqaPYXw4J2OZ/v2wCrWGCmV/wAq6uO3fNMqjNWoT7TK6QBc5srd1CS6DF4H12A/1UUSDzV
	/iBor0kPz8nfOHfMEDA3cUoIFwDsUL0T5iOeqByfT+dSskwr16851lbI=
X-Received: by 2002:ac8:588a:0:b0:509:609:b2e5 with SMTP id d75a77b69052e-50b37453b95mr48199041cf.24.1774018171670;
        Fri, 20 Mar 2026 07:49:31 -0700 (PDT)
X-Received: by 2002:ac8:588a:0:b0:509:609:b2e5 with SMTP id d75a77b69052e-50b37453b95mr48198571cf.24.1774018171219;
        Fri, 20 Mar 2026 07:49:31 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff109b95sm47906825e9.1.2026.03.20.07.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 07:49:29 -0700 (PDT)
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
Subject: [PATCH v6 05/13] ASoC: qcom: q6apm-dai: reset queue ptr on trigger stop
Date: Fri, 20 Mar 2026 14:49:10 +0000
Message-ID: <20260320144918.1685838-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: a60fUUhVIUjp1g1weveu2I9_gmDskM-O
X-Authority-Analysis: v=2.4 cv=EcjFgfmC c=1 sm=1 tr=0 ts=69bd5e7c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=w9bA4Yi6UXS1dLCTJJEA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: a60fUUhVIUjp1g1weveu2I9_gmDskM-O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDExOCBTYWx0ZWRfX/7p6VkKGI40m
 WBMyw6E/l1kQmrOw5eI0LLcuA1bgPBs3DOFNps0uoX8p+nmcgvwCc+mVPIkef2RZi54SqKENVr6
 3szs9hWrcHD0eF0G3cF6OaLadd+77ka/N83vbvExKMtTqlzR+psbPHwgXadtG03OQUhSyneKbGT
 KAxbW1PexNAJ08Fguea1XYuAlrmZKJvc0AxOwCDmyOBrp+PdyJKofHl/OgChtdh1lMKmVP0RWJf
 Vrq0BB7J0y0izbAB9Jwyxmw2KuWD4+WmknSzDRIgXku/SxMfCWFt8e7FRGuSG/M2QF7osNwHjrj
 hge9sGNC7SD6+8yjkIwuvzGfEeWeW/cBfFfcswDX7Yws4YLoHaHHSj0x7yj1x73KVGGOR2wM5CS
 d+5c1EhJEtU2ag7zF6LtfPblsx8EX5jPmY6HSuKORqdmiGd2pW2LQUK4u9Chtn+FmFCs2DX2kdB
 Ki7FR+3fGw1ZFcLLApg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200118
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
	TAGGED_FROM(0.00)[bounces-98942-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.969];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8378F2DC2D6
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
index 1fbcbbf3123d..9d4cbe29cf94 100644
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


