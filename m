Return-Path: <linux-arm-msm+bounces-69567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D60F0B2A22E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 14:52:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3ED213A2062
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 12:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF89A3203AD;
	Mon, 18 Aug 2025 12:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y/5HYH3U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AD131E0FC
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755521466; cv=none; b=fkjYIe2uJbe6GIvKwWdZNmMzbF3PBcquXGolPuL9aZEjaZEl1xQo3zyTGBNfPR8zcG3bZhb5x+p7Ay8OWy7LgSOdcn3GqwVAMSu1uhMF4bwdN67on3mR1U1I8xpR2XnDvYMCcy1kZvkQDNo5OBm/n2uJ8UnlpwR/PklTdwAUqk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755521466; c=relaxed/simple;
	bh=Nxi0Bidenhap9cy9yhPxUe6B3/q8TTTaqSUBpij6HY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OVYDTYB9Rar7Ywd9v+NRKkHlaAUoerTGlZZUakNqbRdJ1WfGEm5/yUCRa5yemhyM6SWn3k8jg4aFLt/faw5t6vpaPXC9rmoSrGjh87MdB/9dekE/utJwowEzoTp1tY5z3RDvh0Ttk0pRcbMoZQQ2u7PLQ7weC4danoCVMEus+20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y/5HYH3U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8hKYh021396
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=THJxLq0EGFK
	SHTbEou4KGPig+UVopLb+QSBxv3D1Czk=; b=Y/5HYH3U8HCYy07u1PTCIT9+5wj
	GhdRbmRgQOxCpjwWSmISsUDCnnfP4Vra9KMnXTRrShMEWUWh0Gdkh28aa5sEq8Z/
	pnha+mdIFjS1Uv7Cm7JKaoMOx/iauyMXXgqQ99MrbPJ98mPAyHuhFlG40Ia7mbNk
	gfqPnkgHcd02mndnPJ7WKDjSqULhYX0Fb8UPAG0Q/q3RNVJKq7GKxl6y/TnMwfyc
	mx3XeJ65COEnrG11HYPAoHuDy6/WmkAEdnVDfAJJMTqbaT3tmfJpUiohuXMsBpYY
	O5AONcRu0Bs9Dd6dijGosu58ZWzyHQP10HIfpM1iE7c/IH+VkpitdrTMDJA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh074rsw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:51:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e87068c271so1200177885a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 05:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755521463; x=1756126263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=THJxLq0EGFKSHTbEou4KGPig+UVopLb+QSBxv3D1Czk=;
        b=PvY3zQl8ycMRMcOTy87Jpe8qh8bWDacEDZXqx9awNGVFCn8uuRmFrLQH+nbs0p5tI3
         5F3NO5+bQjhT1fbKcPtUTPaDiOGM2hEY2njVsCcqBqUXwVytAaO/Icr4PPaGghnfSul/
         tkWhiV5IM53mqLCK8aMDhQs4mu7pCDsnhJpeCW4VN5trtBZz+qzQl+uTsnhFZZnLjn04
         k39FYdCOSZkdrO+Kk7PE7fnG1SUmRcU69y6fyNvXJcW1zfmfEGWVglAXC+qkJ7AvDYHW
         AHZHey88ucWiQSfvL46+c9r/qYt6MFmsKUP1DLrhWVcpnWWFRo/f/JpgZ0l6LGNk0IE4
         ZTLw==
X-Forwarded-Encrypted: i=1; AJvYcCWqPIoQUSAx1jQMW0VEz2gNJC0JRgFDsQ+99ZCMKYXEh+pNOcmfjW3yZhUynGHC8dg44a0rcEV8jKPuzFoc@vger.kernel.org
X-Gm-Message-State: AOJu0YzIOdjYVYIzfQZFMT9ccz+bk8FxNUQtA434cx2h/d2umy97nL4N
	Y1nplWlDDD1R4A9N3Wa8iMzLdCYWpSzTJkvT7uN0mrT+b6Nn5C+5eHGKY1/kSaKP2Z5wS2JdZB2
	Qh+CGT6XBfMfBMhs5AI7hj+E68z+pfVySpfQw9nT/xtXSAtwlbRRBX7OWtioqZ5Q+hLmT
X-Gm-Gg: ASbGncskjaEeYgLdg6AdEBgKKq4ECdyX01dKHqagM6M0dAYx9KL0me2eAxD5SqiiMXk
	XTTX5PLrxWbP2lktQfsyYuFdE9YrAgFYSVApg3CACv+AGT02LEnYsQF1J5mOdH9lmxpZkGJQBfj
	bIBPbFE5JWAGAsQRgdzeXEcXHPBEluY0hMT88GNulkYKiBWCwgcDmAHRMamc6t9OwgYQiH1gu8O
	2VEiomh2qyIE5M24yxD+3OxM7Tfn7feIVAqjaGcWUuFQiMiiUYS0HBMeeJmCvKtIcmiCXdpktQr
	WuO2g5tzf0Uk8tStmcpFX+aD9iDWIJxdUgwbBJqN+rcCBt/jCSicog==
X-Received: by 2002:ad4:5ae5:0:b0:707:6306:28bf with SMTP id 6a1803df08f44-70ba7c0c9damr167850826d6.36.1755521462635;
        Mon, 18 Aug 2025 05:51:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGw2J2bQ08LkYou8sMxp36+xBcanOX9SVxq6Bkq4h+DIiG2jVnraa+J944RcLiyYyzlRt3cOQ==
X-Received: by 2002:ad4:5ae5:0:b0:707:6306:28bf with SMTP id 6a1803df08f44-70ba7c0c9damr167850466d6.36.1755521462146;
        Mon, 18 Aug 2025 05:51:02 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9b27sm12537347f8f.44.2025.08.18.05.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 05:51:01 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 5/6] ASoC: qcom: audioreach: sort modules based on hex ids
Date: Mon, 18 Aug 2025 13:50:54 +0100
Message-ID: <20250818125055.1226708-6-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250818125055.1226708-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250818125055.1226708-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: hI-RYORvyuSfgmngu96-mpQpJvmeiQKX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX43LakWkJqS7W
 +rr2I5+TO7u10JgmpdOcKJ8iQBA1v6sTaDRPKjOpFTgBdQBt0q+SYvQ8bofA62xq9EYowSnfyhN
 EebeudM0F6ktVbLX6aJHfldl+b4ShyZ0gzjOjIKa6QH2RUn07+3sH3eF2KCriTH9+Oh/c61sto1
 b/nQ+tDshM5EW0N2GuHd4DUJjo6JKXhN2ec2lA5wNsaGY74vh+XdgIeBwGCpu1wN/sn6CX98p1z
 8ftrsf8IDEM2dESngo+rw+93azkyEO90kyiCuWQ9mUT6hh87Z+Gnfcb6ljR2Ly4sk9IraEvIbue
 NgYKtFnanGIvE/LpqCooUTy6klKQTXIMoQR93JHr1/eDHNEHXekg6hmghrXX5gguN10tiFrWURN
 kSi/hJWJ
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a321b7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=8nb5IOs2KV4HrawvOq4A:9
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: hI-RYORvyuSfgmngu96-mpQpJvmeiQKX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Sort the module defines based on its hex ids.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index efc918452e2a..e4babf9a44ff 100644
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
 #define MODULE_ID_MP3_DECODE		0x0700103B
 #define MODULE_ID_GAPLESS		0x0700104D
-- 
2.50.0


