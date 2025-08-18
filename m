Return-Path: <linux-arm-msm+bounces-69530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D396FB2A07F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 13:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B1A75602C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 11:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F02826F289;
	Mon, 18 Aug 2025 11:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aye3wiGc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA46231B116
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 11:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755516507; cv=none; b=EaR3PL4FOIaiEwPW5NopldYC3WflO1HygNmHOa8AmaziacGA/ebv53vpjPhhx6Gtrm10a2JIeP0yRfVwCA9gMbFtY4v12mx+R3VnKBXc+oz4LJbM4re3FfUMZ64klc/Iye5noEwfHZejW0mtdHaipObWNQt1aHhowpD+vpcAxLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755516507; c=relaxed/simple;
	bh=MVknS7fZsBbltlMguf8cAS8VVN8wV1AijKC/soz1lsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PGa6JcKDJuGaZZ2fFm16N/3PtgMI9WSCAw3xG+XOUktitDEklFTmmuEEmoanuxDErpWxjKT6xmsdYdiCXnbMqO1dV+X6WBfIX3uVuM2fUvKhZ4scA8MamoQpfHw1LLekzshVTStAliCwFT+pEgUze8fbsTlAGy+ilEGLKSLLt6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aye3wiGc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8CdPU001578
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 11:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nGgpd8ySRMJ
	cXDU8t26AMIBMPUh533T65jXYhrJ/7+A=; b=aye3wiGcmc5q6fFsEO62PaZwnBj
	+jNxBTGVAWa7nD0inxIKSmCHDHHntpZ1+mZZ+0gqjsGBnulhXn2kx3haRe8tIl59
	dke1FZnjdynlxJQdirlrbw5/UbnjclKvj/4B7myMXbJyMz83dQ8JEEI2Y4vyR2OV
	JQgdAxoQiMrTSJ+COoDnH/yDvGxs4AlGf3HTR6i3IDChzMXkNy5nBSRk7GRVnazE
	70E5e+0hwcv6XZady1pnh07Pi4c+L42lJa/zLfOjdfFUDD2VbInrbUwEJCbVoKzs
	L4ySZy43quyOZVQRvjyZRqIkolXm3gA8P74ZURZgv+6X0fm6RHY7nlpf0NA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk99mbfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 11:28:24 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a928282a3so146909656d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 04:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755516504; x=1756121304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nGgpd8ySRMJcXDU8t26AMIBMPUh533T65jXYhrJ/7+A=;
        b=jLtgqAHjC201VYgjFl40NNMQlHoRYy5/YNIHgImLvk5PDMNhm6YaJGWAt4R6WdyENB
         l5P/yHD1VIa5kYWqSC4CFAkjP7C7pRrzj6uJm0cG4EjkZ+YPRcLTdPawhl1kC3qXWWfk
         J+XedW2Y+CiYWJCLhMBso1Ls4Ak1j0ZFnVFm3FEI70D4T2C+wPfd9XRzODyZJqzuWmlv
         bPdwB/gOaDegLj1odPV6vT63PEtpaSvagIowZdCmkhIh5tLuz5aVbYI+kDKNBV2xhxmp
         NUgdinIE3hvCTTTLsK5X7s4viZklMmm//oqU6xcfFS/qC6mHdxj5xyN0QAPLYYm/2Wqy
         AL+w==
X-Forwarded-Encrypted: i=1; AJvYcCXu9vpQHfOOmd30sXRC7SUizFdFHzTfwoNpkt80R7HupMyv5KgyjO7NvyqnstrKTLzDYAaoaAqpOBEJAgCE@vger.kernel.org
X-Gm-Message-State: AOJu0YzoxPogd6ZYK77y2248FljswUJl7eM9SbPKojE06leMjxwL0fuu
	C7nk309UB/km0O/temufgiHF3qFYQSQE0jrff8LceYlKN9gTuH+hql6suwcXZSC+EM7z7ALZ7gL
	4vyVTlGDkI7vvPhP5uGjhiL0pOsuUGlOQ4GolPew+/yZ8joD3O4w6rjp3Ctt3IY7DR8w2
X-Gm-Gg: ASbGnctVCPuyPrqm4W0Brhhb8jdUv4TpfaFUUJ+bzORcXW4gybr0lSDmBwbV6rWErsW
	69G+eS+zfCInDKYBbX5tuG1w/C5e7iyKkAxrbB54iRf3wxThAeYnEWy4fdOIZCw1wDh/OTRlvqN
	uO2Yx0+fTolU4S9lY+6IwloUByeWZid7iu2M8oFQ3gCZlorWsgwGE87iRClOCN0ZU0VffX1Kgo+
	S3z4YWCtUGcJ/1k2ejl2GVxL9h/iaTM4z//nrVSOFLy+kwfzNiYHfTw8YM4/caE/gt8yrsm1qSf
	/rggFXxqAG4uoTNIdBzx3yh5Z0kJWheCC+UgFH8r9z4dzOwqKO37lA==
X-Received: by 2002:ad4:5946:0:b0:70b:9f86:5fbd with SMTP id 6a1803df08f44-70ba7caa8c0mr143184176d6.46.1755516503592;
        Mon, 18 Aug 2025 04:28:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEN4KALdHu1FLJQrv5AAJZwm4Wvz/EYRkjjHtCXUzU5NOxtj3D/IbKu1Mfi5H6ZZfGwGqtzew==
X-Received: by 2002:ad4:5946:0:b0:70b:9f86:5fbd with SMTP id 6a1803df08f44-70ba7caa8c0mr143183766d6.46.1755516503003;
        Mon, 18 Aug 2025 04:28:23 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a22321985sm127555275e9.17.2025.08.18.04.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 04:28:22 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 2/4] ASoC: qcom: audioreach: add documentation for i2s interface type
Date: Mon, 18 Aug 2025 12:28:08 +0100
Message-ID: <20250818112810.1207033-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250818112810.1207033-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250818112810.1207033-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PF2mb59tvrt7nOcOBBUQbqcHlArk5ZwU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0NSBTYWx0ZWRfXz31DCuoCgy3X
 e0FldPBWihk/4H7OWpY1hYGciu2f2j4cHPfdFlocThHk5ywdqF09LOWcZKO0NtKQbQrGuzWcV2w
 HcOff549q85oltW0BPYAr3P4GcmRJTNcEd5erfUxgLtlrrzB1Rcfonalogavd82RLBfRIoVuexU
 PNaNQhJdOZKHtSc8TEk5+JxQOVeEQv1FiyftcfWX51/8BmCGdXMl8g2iW7uEUPhZlmb324RGhhV
 V0vTpH6PNObTAnxS0P65bKEz9PPAR7CzzX7+x45b5uYDzjGvjbzLuzMKVcevJUYb7siyP2kMOUw
 mJCzKvHQRKSmqnbE9nHauUz4MX5uBok3f4KNavcuLTkUIZeqV2r62aGCCojqIQlIDeZ11NDT6hv
 vzpE80Qb
X-Authority-Analysis: v=2.4 cv=IIMCChvG c=1 sm=1 tr=0 ts=68a30e58 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=8DVPAwtwuvfE0Os7CJ0A:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: PF2mb59tvrt7nOcOBBUQbqcHlArk5ZwU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160045

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Add documentation of possible values for I2S interface types,
currently this is only documented for DMA module.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/uapi/sound/snd_ar_tokens.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/sound/snd_ar_tokens.h b/include/uapi/sound/snd_ar_tokens.h
index bc0b1bede00c..3aa5f4928a2b 100644
--- a/include/uapi/sound/snd_ar_tokens.h
+++ b/include/uapi/sound/snd_ar_tokens.h
@@ -118,6 +118,12 @@ enum ar_event_types {
  *						LPAIF_WSA = 2,
  *						LPAIF_VA = 3,
  *						LPAIF_AXI = 4
+ * Possible values for MI2S
+ *						I2S_INTF_TYPE_PRIMARY = 0,
+ *						I2S_INTF_TYPE_SECOINDARY = 1,
+ *						I2S_INTF_TYPE_TERTINARY = 2,
+ *						I2S_INTF_TYPE_QUATERNARY = 3,
+ *						I2S_INTF_TYPE_QUINARY = 4,
  *
  * %AR_TKN_U32_MODULE_FMT_INTERLEAVE:		PCM Interleaving
  *						PCM_INTERLEAVED = 1,
-- 
2.50.0


