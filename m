Return-Path: <linux-arm-msm+bounces-69552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 012FEB2A170
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 14:23:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C60CF4E2603
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 12:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5B7F32145C;
	Mon, 18 Aug 2025 12:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i4Okl02F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28A9320CC0
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755519778; cv=none; b=mqMzo34835x1mDiqPOCHADEdC0sOkBw5HKTKInGjXeEP/t14kR7wqvTOcftm1ioP0l9OQRkIkn+HR1RxatJSEtfh/XoIP92KxfXxLHWeQQ+57s/t8t3Vl6rsTxs9YdewAimmD2fSvCAq2PWSM2L3/i/HC25hDFKCdjFl5G/ngvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755519778; c=relaxed/simple;
	bh=JCKIVW3Vnp7HuLWLnbUgbVk+bUV6UaYytum8NP0pPgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nD86k1MGC1DAnGNQRLQp2lwOiSImVGUKDHRpriLrd9DqZS+LRrMESXS3mKVnpeTeIRp7UP/b8MRwdF36tlsK6iH5bf0bc4kKCWr1uwOlTLcg75fb/HlSiBIViKqITMdvc4qxVpoO5tLhQqC2Jn3LWI8veV+8da1qcXVjSHcIl5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i4Okl02F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8GXW5008400
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Q1s0Zyj4qhx
	N9eeMbMRlym+e7IsQucdcHjllLnnn6HQ=; b=i4Okl02FpVqyfsGJmwyYg4lkCrY
	djDTnu0DzZsndu5uWBIIr7ndJk91LF1s2j7dWyHB9ut6FnDZZ1umhzbikjSBoXce
	/G8ic68fqTY1UKTYiXk93PahNH91OQi4vy5X6gmz42CiWNBHLhm5VkRRRGIRK7XS
	MVWmX6XfYsoHsCeUw2LVbVA0bt4RvA5Zz1/GNoHMVywPFL8OjujH23yd2rbclo6U
	dsyYeT9PDkUmDOhbvxIdbQwq02Z5vEIIi3Cr86wMeDumbkOOnfkKLs7klbEeiEFc
	7inxbEHH8SXSZ3Bik5wtATp2oNMHz0xMmcynPffzsuHCbCVF/WQTVS/W+uQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jgxtcsn3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:22:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a88de16c0so98995166d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 05:22:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755519775; x=1756124575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q1s0Zyj4qhxN9eeMbMRlym+e7IsQucdcHjllLnnn6HQ=;
        b=IEjCioWwRGromR6hvIIz+HvAHTQKwkeDD1gxRmyyWe+1kqApJc7NxgvpZ7kATqAqyz
         +bQg4Danoi4n+dPG3HfGeFGXZYuN4suG13bvxOCA+DHSpUbDzd9Qb6eHSu2s4fS2pZBh
         Yb+pYLoBEGAG6klsyM21XWSmbKLY9TMlmKBGPEUE+cm9cX3nFrZxuJHzAYRFyyGgHcpe
         ap90rFcJs/lIoXKDGfw5EzwIZf96a4DAi+3xiBbOXiCeHhRGL0vCsHmPKMmCCvJdKlck
         I553ZZoi3JoWw/8Z0Oxzz5UO1CbPfSaaTDa4YWxhiAiIeaufcDBDR53se5Y5RovnWOk/
         yc9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXX5P0Y2sTzTGX3Ux/AMwIWfG0R/YAEOygfD3d3Bf58wZ9TZvXYPaAW3Tjwron/pPXGaAJMHcMkZ+ffg9Lz@vger.kernel.org
X-Gm-Message-State: AOJu0YzhTMLNVOFcI6XHI2/RmazQc0qVqqpIeMSpD1CdogxQd7hT7pR2
	3VsbasZboZdOrIITdp70LX6oWcJeCm2fB1ZqWZ2CpNT7k8Yzrw4FPYVreFPz7ugNAtjfL1aI1Lw
	ZySlcJzu2jB7sHs1Yzc0VwY+3Bso7wU1hOOQbtOI+n5daeafPe0zVrtv9xYXw/Xn+plL3
X-Gm-Gg: ASbGncsWzx82wWw3Q+htaWaAjaX2Y/ODpMtnGfrlGBCtBYpsDdQuFYFGZhr8Quzyai8
	k7EF5SWZXD/K5+Rr0dajgXSjah8pOyRYdsjiDITuYL6iNWQgsw+/MIFhWj0fbX5c+SeV9mZi379
	xlmM2+MkM6+BUoQZqo3bFn5+KjNbX2wxCa6S4LPLglZeCP0ba3pnqzgTIvbEhgXA32aUQO3lPhP
	TtYyF2pwAEhNyhnU8FAMFSmiGxo8DH+xHfoqepj5n3zWddAoNwAj2+PdIZWzr5gGTn8BT3C7lTS
	gbSd8UtQ4gSP/B6WRWoRcK1arhu7hdyTECoTtSRDST7nSdNw59HJvw==
X-Received: by 2002:a05:6214:20cb:b0:70a:cfa6:4028 with SMTP id 6a1803df08f44-70bb060c400mr102225426d6.25.1755519774801;
        Mon, 18 Aug 2025 05:22:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtod+zAN6dMjolYmwj14N6c1+Q0ATWvvWPcGCEBNXnfbj7vopuJbRImMQjax+QKZKBMkDymg==
X-Received: by 2002:a05:6214:20cb:b0:70a:cfa6:4028 with SMTP id 6a1803df08f44-70bb060c400mr102224866d6.25.1755519774299;
        Mon, 18 Aug 2025 05:22:54 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb653f657fsm12601563f8f.29.2025.08.18.05.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 05:22:53 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 5/6] ASoC: qcom: audioreach: sort modules based on hex ids
Date: Mon, 18 Aug 2025 13:22:39 +0100
Message-ID: <20250818122240.1223535-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250818122240.1223535-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250818122240.1223535-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: rKwCJSpo85OlJbNjsNk8-4-AhK91HoKQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfXykrHf8zKPNUy
 8cMNIEOIH7Ie4Fo+5fEMC77R0ALyqdFlNEdKA+qiMR609UYa2UCnxgHLHgR/Vz8sLltB3ecvvqa
 sHXJn199B+f9UcRs0UBwbHu6T1yMe5tr7nq+meq5Ni5E7qagOFu6s/SXpC8dCK/izo+BVjvJJ3D
 NJflmmXH4BH7mah7RNbIdkew0RlnI6y9HZyQ02NtcgiRfXniT7gCh5MdYSNddTuf8+V0imXHB2h
 qY5HsjpPWmO2re66rULTGxAlCPrK33H0l3QuOj8ui9sWtdFZlLifqt6GbxO2Nng3L1mOeaSGupA
 FWVhlF9LaKWgSSZ9DD/Jh3qAoSYyHDacUwdnUucpOzIbK+OQ0ZwEvyvmd4mjkAA6cgSoidXoy0C
 DMOclQZZ
X-Proofpoint-GUID: rKwCJSpo85OlJbNjsNk8-4-AhK91HoKQ
X-Authority-Analysis: v=2.4 cv=V7B90fni c=1 sm=1 tr=0 ts=68a31b20 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=8nb5IOs2KV4HrawvOq4A:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160020

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Sort the module defines based on its hex ids.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 512886042224..790fba96e34d 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -18,14 +18,14 @@ struct q6apm_graph;
 #define MODULE_ID_PCM_DEC		0x07001005
 #define MODULE_ID_PLACEHOLDER_ENCODER	0x07001008
 #define MODULE_ID_PLACEHOLDER_DECODER	0x07001009
-#define MODULE_ID_SAL			0x07001010
-#define MODULE_ID_MFC			0x07001015
-#define MODULE_ID_CODEC_DMA_SINK	0x07001023
-#define MODULE_ID_CODEC_DMA_SOURCE	0x07001024
 #define MODULE_ID_I2S_SINK		0x0700100A
 #define MODULE_ID_I2S_SOURCE		0x0700100B
+#define MODULE_ID_SAL			0x07001010
+#define MODULE_ID_MFC			0x07001015
 #define MODULE_ID_DATA_LOGGING		0x0700101A
 #define MODULE_ID_AAC_DEC		0x0700101F
+#define MODULE_ID_CODEC_DMA_SINK	0x07001023
+#define MODULE_ID_CODEC_DMA_SOURCE	0x07001024
 #define MODULE_ID_FLAC_DEC		0x0700102F
 #define MODULE_ID_SMECNS_V2		0x07001031
 #define MODULE_ID_MP3_DECODE		0x0700103B
-- 
2.50.0


