Return-Path: <linux-arm-msm+bounces-69697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFA4B2BD61
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 11:31:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A286521A98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 09:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5132631B13A;
	Tue, 19 Aug 2025 09:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XROCsWtZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87316274666
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755595621; cv=none; b=a1RUvzrdVyBg6Qs6XkSYwhSwePRjoZS/C1wlvJZNb6gTgxR4HxkLgzUmcQJz/qFhYTXHV05GiJvKGllWEmZw7BihWgLy8aBX3BLRyzAHKWZQ0tORDLYy2xVWjJc7V0eAValtjFbVVe3Xnl1HAMV1eUHdHsvvSKcbP0Pvq77pMHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755595621; c=relaxed/simple;
	bh=qwuYqZpPtHuX/2WTSLKobMX+4muge/nS9jt2JifQjdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lrYS4zwuEeToAwF19Qg7GMBB0miy4dbB04jWIudA8YHdCa9puVJ8lpjSsbk1x4wkrzsdJtS15hBemCC9I0k8UAPpCwCcZAqdzWHC9/UwbQTbhiyecOP0JJK861WnhmZnKb8NnI30ehZbKqH+9w9XHql/6QV0tcDLxGHOZMxcLVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XROCsWtZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90ZXx021775
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JQBp3mqbspP
	8PIJt9/SllqFn7BROE0fyDwOwOB0VX5s=; b=XROCsWtZdLU9OlrL9JXQ80VNU4S
	fV9cR27u+nJS/0bQgu9RLMZV4rbo6b6jM57Fxy+/AtPE/IOY6hPiFXlxQqOpZujI
	+3umOBaVK8DVMWbTTMULMW+yWFVcmtBC6cZFsApsewBs/u177n/cg9DwBboPiBe1
	EdDLmdANWI9UtDxav9JA8IUnF+s9Fn/zw9cO3sU1WtlyRccmjYXzAy+2LDWHjeT1
	x+i2DFr/ceCKZmCMuRYCLq6jwowte0AWuT4LccPAU/WHYk8xuh8QBFAOHZz5HBxM
	5FFhyU//w5EPwj4jgRgdoK1LECQGcOrRtrv3cY17JdFaD95XsZ08f9b4g8w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48m71cjq17-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:26:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a9289280dso109803736d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 02:26:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755595617; x=1756200417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQBp3mqbspP8PIJt9/SllqFn7BROE0fyDwOwOB0VX5s=;
        b=lKGGEEWjc+8zoPBSPt3CAqmx/r8Yxg5tYZE90DuxKbWGTCyIUiFqd16PXZGndY+B/s
         QzFYIqAw+9ruFAFMPPGArvF4T7BAK1lo7DqbRBMmBuFfDqRB+ZlsapZ6FYu2QyLAx612
         peXd8H98ci2ZUUYOxZDlTGSfFLE0n5ucI62RzwzKcsRz2TvlvtaIdw5E6Ofrdv2FfG7g
         NqBJPJuV3+fROKzY7cTgyRfYdqI4vXXy3NIM/+h9Fke9k0aocnxH3V2R1FAacdegFyu7
         DNkMHNKhTPgFz9vfkSr0tFYXS/ZJVaU+BBIBC6/AwAp/VQX3Wd0t/OtBGZUXo7s52/sx
         W3vg==
X-Forwarded-Encrypted: i=1; AJvYcCXtOD8SOSmyS3j7xAzGOut3qMbI3nG4E1qC3+kEvOBmZvMVMUg6TnN+nD46teOd1uqRNVrb8BnucQQukUaK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9K8O7wL2+lDbH9aTsL4P/j6AFo+jfYLSX4BLNLHrrUKvUy9di
	F6WrSZbAf1FUaRwbviYZSAnrneDnI+Itk4OUAZznVrPNMuUHqT1SJqmiOuLQbvmuUN3EPeQwlMz
	vtz3cVVBhtPhrtB7pqbBkdD5O1ho9CUBaPYIymvS27qeQxo/ZP0FNIW//2iDNx91v++g+
X-Gm-Gg: ASbGncsH4Tjzjq/NEYsbORleBi85TrvDSjdV3ZofCEnEbQuRAXdRJU0kArKW+YgfGns
	plH5RI1uEr4AHY+aUOfhEOaFQtDcJc6fnWXVIh0zjze/AZWogzabkWrsWVRpcczz9U//QRCecLq
	LC8QWYoQ+WdoF8ubwL/F0RR31zEyZjvkvDU57kIFfomq0DJd1pwqA9jRwRaSG0wREuQGKj3R/iM
	PaaN1D7jMfDRyFleTpbYv48WQ7Zkrd278RGghIXD9yVt0Eh1bXXiouz7T5P3ZHmHQSYpEGXoVXS
	68AILB/cMy9FfItiyO/drzKX0a4Iji+3VeCbJPdDvP2uQZ9601QjPQ==
X-Received: by 2002:a0c:f108:0:b0:70d:6de2:1b37 with SMTP id 6a1803df08f44-70d6de22760mr4529376d6.67.1755595617579;
        Tue, 19 Aug 2025 02:26:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzftwVvjZcbKx/aSVqHKdnD4XxyQfgbD2fI7yrWqryMV1/2Uiqfb40Par5qwmq0JDIgoaFYg==
X-Received: by 2002:a0c:f108:0:b0:70d:6de2:1b37 with SMTP id 6a1803df08f44-70d6de22760mr4529136d6.67.1755595617115;
        Tue, 19 Aug 2025 02:26:57 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077788df7sm2942284f8f.48.2025.08.19.02.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 02:26:56 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 2/6] ASoC: qcom: audioreach: add documentation for i2s interface type
Date: Tue, 19 Aug 2025 10:26:48 +0100
Message-ID: <20250819092652.1291164-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250819092652.1291164-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250819092652.1291164-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: zqL0BaYCPXg5XslA2Ktj0aDP3sxIuHsy
X-Proofpoint-GUID: zqL0BaYCPXg5XslA2Ktj0aDP3sxIuHsy
X-Authority-Analysis: v=2.4 cv=IvQecK/g c=1 sm=1 tr=0 ts=68a44362 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=FY2npp4C09wRtmNKfY8A:9
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDE0NyBTYWx0ZWRfX5PjIzKqKJF/o
 9D/Af6WTmauvY8x5b6PLC92FwXLiVS8wBzZqHaQJHdHiZv5qKuS2PFMXRbXnnNjtrNrB00Kb3Rl
 txjeIB3BPb2E7MfOGKVGZc1ou9ApMFwXlHo9hIO2y/Z8KHI6gX774mWccv0vvlcCDDsKtBPmMny
 M6Z1OjuGH/wG63BBVxlMNff2/YqZXvqHTNiJKvQoirqLeFH0YLdTR+wD9vM4+siOMu9W1xZB3YK
 vcsVO944PhYmf3V+N8JdT9HSUoDJV02EuDtur1B2g/yc6aeQqLxrI8gfJ5Li9tOwlvKPCCYWTDR
 hRlzpUu1+m1fBveZm0PNH75aH+/jzkT7UlgZ7CBhMQWxNXG6M732U+8yYKk1Tq9+F2sWzKftqWH
 SrIPTHBt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508180147

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Add documentation of possible values for I2S interface types,
currently this is only documented for DMA module.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/uapi/sound/snd_ar_tokens.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/sound/snd_ar_tokens.h b/include/uapi/sound/snd_ar_tokens.h
index bc0b1bede00c..92cf72a6fdd4 100644
--- a/include/uapi/sound/snd_ar_tokens.h
+++ b/include/uapi/sound/snd_ar_tokens.h
@@ -118,6 +118,12 @@ enum ar_event_types {
  *						LPAIF_WSA = 2,
  *						LPAIF_VA = 3,
  *						LPAIF_AXI = 4
+ * Possible values for MI2S
+ *						I2S_INTF_TYPE_PRIMARY = 0,
+ *						I2S_INTF_TYPE_SECONDARY = 1,
+ *						I2S_INTF_TYPE_TERTIARY = 2,
+ *						I2S_INTF_TYPE_QUATERNARY = 3,
+ *						I2S_INTF_TYPE_QUINARY = 4,
  *
  * %AR_TKN_U32_MODULE_FMT_INTERLEAVE:		PCM Interleaving
  *						PCM_INTERLEAVED = 1,
-- 
2.50.0


