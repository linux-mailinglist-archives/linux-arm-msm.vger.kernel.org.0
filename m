Return-Path: <linux-arm-msm+bounces-83858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A01C93E1B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 14:18:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E6A75347C92
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 13:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C51530F922;
	Sat, 29 Nov 2025 13:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZhFb6lKn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ACKHnII2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7AC2E283E
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 13:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764422297; cv=none; b=G2YmlVa0bYk6Aqx3BtcmrTKngmxLSX+lToVp1bsD2T0LbcW+SX123zcXyrMzt2vequ/fbv5Wmx2Qu0dvM5sw21+3IKLeV+utOUo0tVQPKFpSDpGVkZ4xTM2yk1hn+qwfBiKcWg41Ek402SuKVUbqg8lw0o6JMPCwOJf1xGN5gUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764422297; c=relaxed/simple;
	bh=x9vtLXfXzdPDIM01j+riInZ7EHgzllLsAHPJN+4rMdk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X7LYjzt9AXZmjy9AAELFqxlBXWe3Yf/7CCqUIaP0Yy88gUMc1CHM3CXYfZhRd4MWyjFJdrRBbT6T9cden/Cr+dtNnM53dwvEOyA8+6RmI3ymVbapoM27YLWDtGisMLqom/EVjHJrduiDEopAEd9chB4uROAnsnyxANIMyyhTZD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZhFb6lKn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ACKHnII2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AT6xmED1693726
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 13:18:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tZdI4KwvA+/rcyU/a5Z2diTmh95gzReC/grImFy8oOU=; b=ZhFb6lKnzkGiLDuh
	XvDj2B6Z5JPDtS1n0msQiSSrhCAT9wGEcCHDn7I6TsJNEHFDwtksye2Yv7pkAdR+
	XvOun3nQ1pBZI3LDwdnxaSdJp7wqYNthRwXK+EIhESQ6SKJ2AvU8hVoGTWuBitTO
	e8GOxqetdZWHvQT3rrH2ZUyM01ZhlvD5m3v4ROHhg08pzxDLFE0Usw9D/YbLmNHx
	zMGtxw5pG1Pd7v6saZhijtQgZpUfka4cXFkli7N55B5Y9MFY4NRo6duac0Mz26h6
	UCdekOy/sOvlqqkMHmPQgAgr4kr9Jqm8sjQfxg9tiO9Pl1CYHQOzhcMCEvBMNbuC
	2JzQPA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqt468m82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 13:18:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b19a112b75so479215285a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Nov 2025 05:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764422288; x=1765027088; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tZdI4KwvA+/rcyU/a5Z2diTmh95gzReC/grImFy8oOU=;
        b=ACKHnII2lUf2LgHxdv52HC8XbvD/UVlFyqcCnCMVVeCLC/neVrXoYNo+6wzm71tWfK
         jdU8f3Gh0I+sdcfBTc2G63uN3mqWmzCQUL1eCWA3PiBSekTPIk/GzvvFeK7jUyElLye4
         aJeqFOLD8+6lrJsdRFhoBPfQjyG+f8ps5MXv6NpitM720szzQ0AmhHJI6oQcjtHSK7ff
         0lOol4c8VeQPvooytxmSZnwcxMEOcsaajz6qVQNeFoRSez2VXzaCYz+NDnSaFprCd7wb
         +xAh9MPKamSRXfOU7Cj3Eu4xWXVN/MFJ6xQMh4RPGIW1zv4jEGLkPVeb+EzvBdR+nMgg
         ko0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764422288; x=1765027088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tZdI4KwvA+/rcyU/a5Z2diTmh95gzReC/grImFy8oOU=;
        b=iz5R2vtaU3gQCPAipb6pgmXyPWgAfKt7ZeXoIeP2U84lekiZwVihhp95Xy1bDJHvsa
         vvNLgdzexz+WLbC4ifxcoGH8sXIO25YZMTuEsqtKZcKuQb8latP16zzxAFehbxPQpiUM
         wA0GalAIQJjHKnmC4mpBjPVgSi552xNt9Lty+3Bwiydge/Mi9In3qZ9F3IKP5d1laX8l
         aGqxJlA2wmZ0gXENZMmm5G6IaeT6hQ5y4jdO9L7O/7TuKKdyuivtfwE3C6Zv6JsfO6c/
         BXGPMh+kZcxY6wcyQm9urRQ9r/eG3UDLbdmiIDZ1aerdJadRHh7gEno5YwF87p9aHpO4
         /I/w==
X-Forwarded-Encrypted: i=1; AJvYcCVqbBJP1fnTNg/9WSot4F+h/4jYJ7hjOjic/BN1Ere9o2GJmPKHtiJJOw11GM2mTAJHbOLJBoq0/z8HIiRM@vger.kernel.org
X-Gm-Message-State: AOJu0YzbqbTyhpdPOv+XeEb34w/f6cE1NOxmbG6SRGssR2pS+qGInV8h
	Y857m9RshAUMuhpSRRoWPMxyOKHGyeiWUiWseMEDpuTTv14WGMNjtacMCwKajFb0PrXZtwTFcEG
	NvTFm2jIwnZUY8Qvyq7uR++JPhpaMtxzPEzcrGa+yyfLnC/rMl9FGGS7/EQFER9cUQoov
X-Gm-Gg: ASbGnctkXB8X7EtfjzhjxpQl1yAMOjT9ibxMQmyHyit4dKCUMnpTCSzdo6ZeK11j7q/
	j+eadbWZWfTPzIX9WwgfgawRho2kvVZm/4Ld15Dfvrh2DPw3loo2gkfag+Ghfw29i4dRkErOIfi
	ui3i47W3SO0cQSZCiDB4LNKWadnaNe/a0Sdd/UfvqtUDeFLZvcu0vYdYehRA6c0AfthFNJN00AO
	ia0uvgLxYoJMrevZItVyz37g89Yet3mQW6Ye+IukREy94Gmnk18PAmR7gVsNIxgF18Xw2a9eJco
	6do2keEpDP23lOWF+ygnuzkXg+JVms10exLQ6SP+HTleYtwMTlne+mBYQOv4P+fNr+W/kownRIX
	CX3hU1tcBKH7C7aSh/vn5ITzdNG62+CmkbQ==
X-Received: by 2002:a05:620a:40c3:b0:892:ce2b:f84d with SMTP id af79cd13be357-8b33d1f05c4mr4102206985a.33.1764422288350;
        Sat, 29 Nov 2025 05:18:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH5tY6ebmJtGqCyfgXdxSwaxTDwXXKyfw+fj/QGY6k18f5MfeED2Tz9aIlMysPzC/z/UAqkmg==
X-Received: by 2002:a05:620a:40c3:b0:892:ce2b:f84d with SMTP id af79cd13be357-8b33d1f05c4mr4102201085a.33.1764422287827;
        Sat, 29 Nov 2025 05:18:07 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5163903sm723233866b.7.2025.11.29.05.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 05:18:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sat, 29 Nov 2025 14:17:54 +0100
Subject: [PATCH 2/6] ASoC: qcom: q6asm: Fix confusing cleanup.h syntax
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251129-asoc-wrong-cleanup-h-can-people-stop-sending-this-without-reading-docs-v1-2-c38b06884e39@oss.qualcomm.com>
References: <20251129-asoc-wrong-cleanup-h-can-people-stop-sending-this-without-reading-docs-v1-0-c38b06884e39@oss.qualcomm.com>
In-Reply-To: <20251129-asoc-wrong-cleanup-h-can-people-stop-sending-this-without-reading-docs-v1-0-c38b06884e39@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2363;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=x9vtLXfXzdPDIM01j+riInZ7EHgzllLsAHPJN+4rMdk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpKvKHOGB7XVrfrOoQU0ZIGpIbWVAtgd3UgWUV3
 0lxoSPPWlqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSryhwAKCRDBN2bmhouD
 1/gHD/4mhpePBUHZKY/6cj/Xw/wgxSk9sxiAromZPPkzhJdObb4LNusWmshHJ5rTJkknLqj2joA
 1tq8bIYVHRqBOHn6VgMQrYGWp1rj+lk1FXFEV5xx6R8DJEMuZJXnweVZtwjQMzqWCg2HxI+BCjM
 Te/czUYchFWcYho5G28gw0Gt+Qchz9E/yhOGFXfLqTsDYtAT8eqyuxzwNwpM8WkBB1THmVJCmGC
 w9+X6TA60e4BZKdIa3YteLolWCD2Ns+xZ5h+aOMsipAawkogiO09BTAcXWOF1KNvyN0qLhy5ejA
 MIYdmG2D60knDSzNmgrv9/paPzFlITdq6LlDhSM+QrGX8qXj/9+RXgJEVmY7sSeuvVx+0NaefxD
 iG2G4vtuh6HvaYNd6GlRdiwbniauwgcEdJiROcWXjU0IQ+JjWWgn9PAz2UfksqZ+gT8p3GUrI6R
 f0HhtdYbynsanZOdfUd2xJxRWmKh37JFalp6KZqgb+bZh2eZZEGwb/N1kHOEk00rIFyXAtRJuRX
 m5RHae6ieuAwF6HYkw9e+OQKz0PK30A0w4VhIq7x8GjFvM1ORHvToquG5OVo2XHeQEpwYNGhyMt
 SptKAEofoxw2Ii33y5EK4CxCiNcuiQUbJ2nbufc0jdKHUGK0UL8KHFJQFocmUkitnIEOJ1r4K0o
 5JoKNPbTk098BRQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDEwNiBTYWx0ZWRfXzopEevjK9B0m
 S6ebfIyx4/CZiIVaagIw2uWE1DpnFGWQI9yPNhpdN7n4/06AUSPArhNEkzoZUsUxvOGhzBuqqEH
 X9oEQXNrznz17C1EYkB/Os7C1XB3lYUZbv9VFdS/veyLYPZdmknF+LROSuOJ/NeTcn159Qf5gaF
 cQ47Rs+lRSCBboZJjPAyhYSY5008OypawmoDOjF0/Xc02qg4Bey/+W1BBwj39mwL6pChJOGHKpQ
 Bgp8XKE46eamR6zqkbBfKsCrIGlmcOuEx0u0e/oY1zPWrZAAG2U6tHwiLxJVCZgt5uqOr8jQ55+
 NbXpcap6EOGLfL5TYX4S01mcqzFtE9V0CuUKycoXr8gpoafHwNArygcjZminNl1b9dwsbt+hcri
 80nJpD3NqFEqPry0n2KmhShpN9H5gA==
X-Proofpoint-ORIG-GUID: RC4EHUU-69MFG-06zd1a7eSBb9syjY15
X-Authority-Analysis: v=2.4 cv=aO79aL9m c=1 sm=1 tr=0 ts=692af291 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=4IEakBAXEm9B9VIJy2sA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: RC4EHUU-69MFG-06zd1a7eSBb9syjY15
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511290106

Commit 6e00112d31c8 ("ASoc: qcom: q6asm: Use automatic cleanup of
kfree()") did not make the code simpler but more complicated.  Already
simple code of allocation and free, without any error paths, got now
declaration with one constructor followed by another allocation, which
is in contrary to explicit coding rules guiding cleanup.h:

"Given that the "__free(...) = NULL" pattern for variables defined at
the top of the function poses this potential interdependency problem the
recommendation is to always define and assign variables in one statement
and not group variable definitions at the top of the function when
__free() is used."

Code does not have a bug, but is less readable and uses discouraged
coding practice, so fix that by moving declaration to the place of
assignment.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6asm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index e7295b7b2461..890a1f786627 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -335,7 +335,6 @@ static int __q6asm_memory_unmap(struct audio_client *ac,
 	struct q6asm *a = dev_get_drvdata(ac->dev->parent);
 	struct apr_pkt *pkt;
 	int rc, pkt_size;
-	void *p __free(kfree) = NULL;
 
 	if (ac->port[dir].mem_map_handle == 0) {
 		dev_err(ac->dev, "invalid mem handle\n");
@@ -343,7 +342,7 @@ static int __q6asm_memory_unmap(struct audio_client *ac,
 	}
 
 	pkt_size = APR_HDR_SIZE + sizeof(*mem_unmap);
-	p = kzalloc(pkt_size, GFP_KERNEL);
+	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
 
@@ -428,7 +427,6 @@ static int __q6asm_memory_map_regions(struct audio_client *ac, int dir,
 	struct audio_port_data *port = NULL;
 	struct audio_buffer *ab = NULL;
 	struct apr_pkt *pkt;
-	void *p __free(kfree) = NULL;
 	unsigned long flags;
 	uint32_t num_regions, buf_sz;
 	int i, pkt_size;
@@ -447,7 +445,7 @@ static int __q6asm_memory_map_regions(struct audio_client *ac, int dir,
 	pkt_size = APR_HDR_SIZE + sizeof(*cmd) +
 		   (sizeof(*mregions) * num_regions);
 
-	p = kzalloc(pkt_size, GFP_KERNEL);
+	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
 

-- 
2.48.1


