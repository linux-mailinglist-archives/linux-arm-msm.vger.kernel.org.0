Return-Path: <linux-arm-msm+bounces-69715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D877B2BE60
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 12:04:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F9137BD23E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 10:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96779320CB6;
	Tue, 19 Aug 2025 10:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fCySFX0l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9535A31E119
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 10:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755597728; cv=none; b=PWswF1weRmsCPqjbyX4qC9diibqgLXHmEmMRFNhQrx3tRDJTtLNyv7GISE8CHsp51bXiaQKwKxckIJ4kLXDTVBQ6/aV+EJ1Xdn0uppCvMj4Dx3G3scwRwMFra/4Qs1kGZYQGN5k4yn2shJ6AweTFW/rMKGFc/s9z5bUl1dtE+Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755597728; c=relaxed/simple;
	bh=qwuYqZpPtHuX/2WTSLKobMX+4muge/nS9jt2JifQjdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=doZWy5ZYZ2M5l0UlrJ4iqYukNmB3ZpxZyPovBgfAYtyJPIE8ZFg8+WMW3ghNXqYxVdBAXGnnWivpmeGuEqxXJppbMCTOTgz+7603q0tFj2ouwB5qiGliWgm3ZKVR/kL1wyU+vcCNIruMhFNP7NF/UN8A1OipyimBFEjgWZFIKr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fCySFX0l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90fZa004523
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 10:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JQBp3mqbspP
	8PIJt9/SllqFn7BROE0fyDwOwOB0VX5s=; b=fCySFX0lBg0IF8kYEhPZSBx1NXy
	UtuWMpj/JL1ANNPTGLiSk9ATBo1G4+2bmbER22ZIJKm2KaGlRo2EWMJzF0Phvcck
	bygvV8eRWqc+Wc96WGyG6f9SQngJ6IaQSnuTJ68oFmyJWMslGe/BMxZ75KMo6+e5
	AEoLzYZJrZ436itcTEzqeSOY4zpYbttZ9kymm2cISb/O2eF6IjdaHvs6oCuPSw6J
	ChPT41MJmp/xjU3jIMxTiekkfoLOF7JRJU0sML4WZE8UqllyNDkULgZFhnnazW7L
	IWtgHXLYSv0qMoYvYsy2lchjt8s4iC2U/4vvL/t8tP3xpewbWcxZ7DgOpKQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh0783nd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 10:02:05 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70a9f6346f8so109414726d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 03:02:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755597725; x=1756202525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQBp3mqbspP8PIJt9/SllqFn7BROE0fyDwOwOB0VX5s=;
        b=Q0RlXq6vUoulO2hmKzmBOFpqEAYySfPJEIvEr9uPJgZ++Bu8xj1sZZtBc9CprtewvJ
         rXwlbm0IeFOvM1PkntG8hwC8JbKhkifIoif3p0V9L6cuw36XA0bhNd7cbPQP+SxHdBmD
         mNwpimm0nFX7UM1Kflr2puNNk01GKMxy9NoCCPBEix6mfVHLiIftDgYuPXdlRsCQyXzN
         Ov0w5vItt7je5iuZsEJAilw9tBF2v572dm2PuzuvtFigBB0CDevw0TLxIiLk2Aw/5Euy
         v610RUBHWGeceiMB3XV3CZiQ17Cek/j2gYFjTZ0X9fLVifEuIW2WcTwudHG6HiUSQGVX
         GAoA==
X-Forwarded-Encrypted: i=1; AJvYcCWRowoTAwGLvu67zn0dC1dLCuW7qSP06B9zDPyg8DRoycU2RjrntRZSf2V1w+SduR50iqSeMmBXUd4KNMc7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8Fo+6PYBdTdOAFvmIHEzUDapI68a/ofwTMAoYjpJlqt1KYdDp
	mbMd4FHIiI+awxNfMUK2Ndo26JAqvu4CecUI0ynaH+CCE1sNcVIMh0v2rOAEYS7lUYYqZmWPPGL
	pCj/Gs/kzzInb7l3U/kBTFEqf8kpRGHgTuKl1BrBePdBAwSKdCivXA8fjx6PFzOz8hoLY
X-Gm-Gg: ASbGnct7jYGE0xS21MG9cD2LpYivPpWmcDJ0BQuipmen2S131gfbRmXMP/4HarZfLd9
	AFW6GCEaesAmAdHG4SSDg4ZNMiJSrODvN/Af+NWa1S03jzw071U9zeY135dUuT0EduZiSn6sgRr
	GKUsSRkAWu8xpa1zx3imt9mqcZR7d4bVWiQWdfuiDR9GTdzZjt4FC197Age0bMODlF2TAqt9c9z
	bky2XmUj/aAo+xWPsFJW5TshiqLtE1odMx33cR6idC5Et4YNEV+tvEmPU+wDmH/CeKdxNFYAqOF
	vhiPOg8VZQBtLYDyHBYfXKM3F3LklNy9JvOhEwtRA6dLVy9QSPQLlw==
X-Received: by 2002:a05:6214:4111:b0:707:6306:28bf with SMTP id 6a1803df08f44-70c35bec101mr20644686d6.36.1755597724645;
        Tue, 19 Aug 2025 03:02:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDnsU777ceQUX7Q+wc1HqFoZgcHCLcDM2iUFymWXoFmtr9FsHvy0tyalhDLoICjH/DbldWzA==
X-Received: by 2002:a05:6214:4111:b0:707:6306:28bf with SMTP id 6a1803df08f44-70c35bec101mr20642666d6.36.1755597722416;
        Tue, 19 Aug 2025 03:02:02 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c78b410sm216169635e9.24.2025.08.19.03.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 03:02:01 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RESEND PATCH v4 2/6] ASoC: qcom: audioreach: add documentation for i2s interface type
Date: Tue, 19 Aug 2025 11:01:47 +0100
Message-ID: <20250819100151.1294047-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250819100151.1294047-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250819100151.1294047-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: H7S8g7DgFX89Qx9stwv4lJZJT5G6b6pn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX/zxyOUSOjEAK
 +qJXpQtOlGL/ym9U5bNqf5hHfzTW3Ppf+kT/NZF91bBalyz7bvks6mleh3Z9GTV6F7BC3r3Xmrb
 z0V8rxcCcv9T6Cd6/jhz8zFy2wdHNf4UN0vKlGNmT/N6FFCsSgjqJucbn9o4SvOEw7mq8YxUtmQ
 4d009QVpcXBlf9vsbliA1tmlwP0J6SKY0rKgeA+GIqL/+zdOvssetGasvwPK582QjFO4Z9/aLns
 AxNrSYuMn8ccjEfxbZJgJb2sB2Svf95n22Lyox3BVNc7h9ZHG+PFBDdBpSPFY1sjeXSGrwnkR1W
 2t3EvGYWa8b00bDu86TMo9n7SqAeB3tgIPw+7j1bFULTIASlqs+kTPpfKvmjr4lCtDkFeDF7XX0
 kmXwi/K3
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a44b9d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=FY2npp4C09wRtmNKfY8A:9
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: H7S8g7DgFX89Qx9stwv4lJZJT5G6b6pn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020

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


