Return-Path: <linux-arm-msm+bounces-79872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A74C24D6F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 12:49:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B431542560C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 11:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B24346FBE;
	Fri, 31 Oct 2025 11:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hlp8vBse";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ayuBRYAi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE27346FA9
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 11:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761911308; cv=none; b=UFKIhO6LL7O0tiY3p/7xH74gmuwUSRp1LbUrYaEeB0PNk4JHmPkSJaAYNXnQoH3ELw/r6SkJp/F6dfaD00BSX04frYk3BOYZO4epmxQ0o6QH7kwo5nyRr0Dirr11yxLvE5uDcCdldwM3YOLqlgRQ02Wi1g1PKeUykwBl5QwU5tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761911308; c=relaxed/simple;
	bh=IjhQRZlTTXmUt5sgJp27pvl7YrbqCsNF6Y9gX3XiQ7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ufMtAuSLoFqKrazI1RdaWRG5x09hZKt0rPmMXVbvVlcO+obBgliDJN9XWHE+fyuhxyzxoX9xSc98oaHYGlRljBOYoKp3sHMFQHJfSCMD9UJrf0Z2nO3+Q7DZM0hwM5XmO5RrDNhUJRp5qF9czSDgNaEUP2d6sctD7tEMbZeJb5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hlp8vBse; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ayuBRYAi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V9jZSa2471666
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 11:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qgwrHL4mIWD
	XlhnJhcTW8PlWmQLURwHl1NklGm/TfcM=; b=Hlp8vBseqWneaa3Km3YHyMxDWMo
	whU9ic2x/1hC24GHsLsmsUbosJj3nd9VXL+g5NDsl7hznzKjYpo5CwaF/MVSPudy
	GUn+bw5/S76LMKbgi0IWRW8gcCGNc1YZ7nu0zoG6BvmtaF9xpQegsZ0fh4zrIzCd
	zYmMxr4wqQMaJFf/UqgCpIKSEE1qVIBakmPoKCJkanZ0dROvqVpR9jBr7bw99c7m
	WmMndsI54i2eLfRdlVXM2wppes+Xd5NgAFFLUtsndkgyI392aNlfmpY56gPWrq4T
	8wcwpb6q9xkwOxM4YzLFXau/ffY5zUzD2Y2RSk9UYSz8VkXSNvSvUu7Z7Nw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4trv0a9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 11:48:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e892acc0b3so53417951cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 04:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761911305; x=1762516105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgwrHL4mIWDXlhnJhcTW8PlWmQLURwHl1NklGm/TfcM=;
        b=ayuBRYAiSxg7cGxCeK8xF6WFtD/AaF2Zw3NZNI2RRp/1O9/3Htk5ch3zQ3gz9055u4
         B+qXfxrMzxvAZ8bTxd/ghPmBFMxrHQmrDonkwDlH5dB9hZFf0I3xyHj29FEzpbAQI/L1
         FqdU5jTXjqPdU48nyh+GNjXhNte/a0SIoVT3iQi2BdXDh/bRlEvdxvUnqnWyH43HIUH8
         icmXRMoDOSXq5iCsj0Wa6tJifezctdKuil+hLyQ+Y2ShM6GGOGM6Xn1g1hzdb7ZtUQpM
         tYlVB53kacYanUaJd7OpX60oHm8VK07s+WtJfBZRuKytzzvCY+mR3JUVwRCAuqwVbsZq
         xOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761911305; x=1762516105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qgwrHL4mIWDXlhnJhcTW8PlWmQLURwHl1NklGm/TfcM=;
        b=LcTiMeZaKVlDvnWQJLPnDqqMybLV6g86oIPeHvTe6dievoAnOErqHW4kwTF6gQR6Zp
         BoWyhNdCqsKv7r4ih0+boBoBkCKA8AnoYj89MKBAS0/hPDBmMdsnk7NQCNFIi54NEdDn
         l0iHp/pE8msao+kuOCSMTTRn17Zey7LxlZcgj3titiREbCb37ZkjLodIC/ELV/tYYltx
         3x4abyF7EAFf2w5zqeRikgK5RqDLRXw41LqSTzu/nqL45cP0pRaEdTfFh99PFyRIVwcO
         YtLtSo5pJqzV4T9NSWaQczRM4HaY0/A8gdJOCCz74N0rQ+MgGYDXB7g1yo3CGFMlH8Or
         L47w==
X-Forwarded-Encrypted: i=1; AJvYcCULTidIXE7f05J1BOexG7pc9MajCZHr0ySEv3AIMGX4keLK2oyTbcABobEazakeW5hJS+enp9ozwp/C5CXW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8SePJaoSmq46nF8eJ/KW2SFSmkewlAGtH4hHQy3y7xekmCcyN
	EL3+RdYmM8t+3EhCFjpZH6s/zUhl++WIJLW5Bxhd0EFVh6LngAQxKTjbmw1PsBvjhU1rgULu5sE
	Wj62X+CVE4SoQYblepsTUpqlx+k/qVhX1VFK8BbhD43pN7R84Sf2UEgMDhlOs39NQtKgU
X-Gm-Gg: ASbGncuTuui6bZacthtIHC23xnjvwz3AhfxAQ9u6l7w6JW5VHzzfcKI0PWWRlNyJeHu
	ojZMKTxu+PDGmYehyJYxCjmqVAqBX4kT6rLlZWnpM1rS2DAgTA9EfRDtvTYGziaoLpWmuNr9tO5
	e4cM0ncBaeJ+CNGdHBOwpeism2+BOXyzTWEGFAuMvshkjpnAaTRav0/cCViN52frG7AFoDkskgp
	Co9L63QT+YhDyF//tDpvXZsMtcpkbOoN1h0lSRRRGIWKo/hIQVhTnMtptK5cZHQ6i6t89vXbKzs
	v5t0ApkwMxrzVYfty15trnLP84+jnUqVdyDdT1jgAayRBwPzJ5MziRppj2hPAzfs47HVJ+3r2nB
	+OOHEAHEgBK9d
X-Received: by 2002:a05:622a:5817:b0:4eb:a33e:6e32 with SMTP id d75a77b69052e-4ed30d56c17mr37055031cf.14.1761911304750;
        Fri, 31 Oct 2025 04:48:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6Uqx/qmZA1dGwjlYoTU2mJZKz2ZexJxlDQY0bz74P1DlKsZ4lpSFPWVkUeabKZk6Rn7XNfw==
X-Received: by 2002:a05:622a:5817:b0:4eb:a33e:6e32 with SMTP id d75a77b69052e-4ed30d56c17mr37054601cf.14.1761911304312;
        Fri, 31 Oct 2025 04:48:24 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47728aa915asm86831165e9.16.2025.10.31.04.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 04:48:23 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, broonie@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alexey.klimov@linaro.org,
        konradybcio@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH v2 1/6] ASoC: codecs: lpass-tx-macro: fix SM6115 support
Date: Fri, 31 Oct 2025 11:47:47 +0000
Message-ID: <20251031114752.572270-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031114752.572270-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251031114752.572270-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: JXrDbDc5h36VmzqfobepTEbUrpvkLKLM
X-Proofpoint-GUID: JXrDbDc5h36VmzqfobepTEbUrpvkLKLM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEwNiBTYWx0ZWRfXz1dBPPglWJb+
 Rh4NCFxUOFHJC2dJwTNA6lBrku+dHPnefy7gwxPWr/9EZBr/3CgiOK4VxW7e/3ucotNNLcyvskN
 Sa6W7aV670AH5nmqHzVJvEhXAyjb79WqiDOpmfQpaNmfVMPLtP0e61dyUCbWJ8Tub2x5aQ1p7i4
 VtGfmIqZZLoKgw/mJTV/obvF+7Fy0kFBhUsPwY+ZqeP47QbSuIvi0NO3P5UJFgLiXOiwDddJqaz
 vHG7A/1dnFxWxfc4NLghrPeLdfBFDfAKabaoQ4SghJh/O0lswn974xi2yM5gTqlbweZZlwsypTB
 g+Sn6pyjifYYiccHJEegZ1BQG/haN8WMToz7HiumRzh/9wObyp3HBhK1WgfGvPP94tR/4mAVYNV
 Ra51AexpfMBSB9Vv9Ymya0QZStrllQ==
X-Authority-Analysis: v=2.4 cv=XoP3+FF9 c=1 sm=1 tr=0 ts=6904a209 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wdEHzOyfiJQDvapTZ2sA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310106

SM6115 does have soundwire controller in tx. For some reason
we ended up with this incorrect patch.

Fix this by adding the flag to reflect this in SoC data.

Fixes: 510c46884299 ("ASoC: codecs: lpass-tx-macro: Add SM6115 support")
Cc: <Stable@vger.kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-tx-macro.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 1aefd3bde818..ac87c8874588 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -2474,6 +2474,7 @@ static const struct tx_macro_data lpass_ver_9_2 = {
 
 static const struct tx_macro_data lpass_ver_10_sm6115 = {
 	.flags			= LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+				  LPASS_MACRO_FLAG_RESET_SWR,
 	.ver			= LPASS_VER_10_0_0,
 	.extra_widgets		= tx_macro_dapm_widgets_v9_2,
 	.extra_widgets_num	= ARRAY_SIZE(tx_macro_dapm_widgets_v9_2),
-- 
2.51.0


