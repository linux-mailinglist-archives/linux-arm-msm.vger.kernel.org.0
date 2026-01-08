Return-Path: <linux-arm-msm+bounces-88026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 082CCD01B04
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 09:57:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29B1F3029B8C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 08:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9CC23590CC;
	Thu,  8 Jan 2026 08:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EEBYl6Kv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PyZy7E1I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E099F357A45
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 08:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767862665; cv=none; b=jJovABuIrYYe5e6XjOi+HPF/Q+MilTNXM5hNuGGgySD0rEwiDqhLX0aOg+o6zy1ySdCF5Hdlxyw7iqdesQPVntP/7AefDDZKNmT4SjHWDepgOH3gGEu2GwKTR02riOYAX7bkgCeH/yFgpotGy9EA9dYYtOVpFaqPSnJzr/qFr84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767862665; c=relaxed/simple;
	bh=lT56rcO/2wjclbI67SuJRUAAr4AVOFYX1OPiKxP0VqQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FardSUroMNAgBDgSwl2AVIphy+km0bvdiKhF+yMF1ysDVg9ktmup3g0/x7CcX3gGhXvC8DPIbPiOfvIP4ejAtBpXyeHl58VAlEJruKLySdHPM0MRqq+cmVe9NAR1dELxz0ye0597Frw6bBULA/FKUDjbvxJX4JE4DJs+Y5qJCws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EEBYl6Kv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PyZy7E1I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6087t3rj2239483
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 08:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z3dXAwZWQrX
	iznkoQcO7REoUwgPXToMeXoe6XzLEAy4=; b=EEBYl6KvoIoXRs1gtt7AnVm2KvL
	7QB60ZZCQAY83/RkQikpbqT81WdjFOfaIi7maOlknf8JZfjxJMb2b7ksj+uE75uz
	6I8fKvDwDahSxLqemigUlAp35wQ5TVKUd7w34TrF//eFoSUlYz4G9cnXj2UaV8dL
	ZuGA3mdCM1AdozYJWEPCTMom/BAqf3+Es23IywaReZIeCOkM9gKTEbHAX2gd9SAj
	7gjsxVWaPhdw2XNlWfdABnnXSF8u4egnN1M2wZBjdNN+Q3++0nk0BtBCBc8FHZJx
	CExANVrHuHbRpr1Fjn94ATa+8Ak2WDHO2lnugqQXYC4K3up3alM3yFu35Cw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhqwg3b2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 08:57:33 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8887c0d3074so69482146d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 00:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767862653; x=1768467453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3dXAwZWQrXiznkoQcO7REoUwgPXToMeXoe6XzLEAy4=;
        b=PyZy7E1IuNbn+ffOOzvZixmSL7e6Un9lNa5VFtKbNFj6dBhmWttUrc6RqAXpQqINe+
         e8LKrTyRZgF+BhasMbd7JzyYp3dr5XyJiUrMUxSKFOqmh5PB9/PpOT7qeNkHU82JcxC9
         7NLjNQhq+zPb+3JXb7QOH7djzAY87vMj+C358oEGZUhJaeTFXErRdAE854JPPJyYdrUO
         +Eh5eulKJ/yiI7blRxmngltkCdxZ2zSgrpfHlc3OTnqgf7aGS3x301ma7SypUX2JStt6
         KQ1bAynxVKu1QVSTmaiSEvyrxPRFnsRoXBduIRujjMYRb4lrd88RdM/xCg0Ybk3mTc9O
         Ugpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767862653; x=1768467453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z3dXAwZWQrXiznkoQcO7REoUwgPXToMeXoe6XzLEAy4=;
        b=W+wu1/VVVGPMHasqDQJJvarDoiorrCBEc+d/kIExIAdYMp95UVZ2ejbeazPKFHPk8Q
         6C8zkMrp06FvBShS6heFHS06/3zNubDbhd5G35Vaimtgyqxqbs+NPaYavVt8UZDDXN2e
         gemaDBd+t8qjfnjBVWOm5lArHqLjGTUwN0JqVEIoCcDgbKCeWIvACB2dHTuzjUuxKf7S
         l2QjoewBEF1aJHUBdcgGAC9PLCAHbzh+XGSRgDO1XuH9NlgGaPncChLao9V2iVQOvP/e
         tp26Jg+YVPgzApP3WDbmyqja3OQNuopMi7vZbNxb+cmTEkSxz5Sve0THTPpY0ByOmQ6L
         BMyg==
X-Gm-Message-State: AOJu0YyFrfyOHvAOt+Nc7AFk3VIrpxkPzBQDcoJNJaBguo+rt71gg6da
	Ys7DFtdeLCCQ+kV6hc2SzpDoF9klz33i6I1jM8qCgpcCMshbhSuc/EQ1KZ1HAxdQLuFSFTecfNK
	PekWrZU/m77m2dRFM8uLJeC5Cx+H1cicGTFTCtcJSN8Ql3KNlLeeq5shF2ksukL9tJwZT
X-Gm-Gg: AY/fxX5YRIsZj5Ya6gBxGt7zsojtpZhY6cXHSZli42BMBn0ohTvuws1UaT+j5gMXk5t
	RTvETO9KzqKNmFfvNbGUfz9alqDoDEhgVMxVOcZXHVANbw9Wq+JgkHwOEigJEJ9eVHbVecfrADM
	aoRdCNPDlMsp/4ohJ1Yn64e0tpwBsLoRnIgWPtLUJXoB6xT5TLoUfOybD94J+qqKb1woVaM8uvq
	V6NX2Q6tCh0fOrNTsw0tVmLzZO4j2vSjHqdeOsoB69Dv/ETA1RBoWQlXlTPBTUo/o0y7rj6n9rS
	XbOLFhnd4luF1kgrNx0dLrTATzvqGhy3x+SpDy2mUrHRdBMBEENUIFKXUwsfGPnJvL5xx4VeY76
	zE7bujmeMXp0Dj1hXre14q5gJzkQHAT+bg0XHB1kSa1vgpWPwBABcRMJlXBR9iqLiP58=
X-Received: by 2002:a05:6214:4113:b0:890:8244:1eac with SMTP id 6a1803df08f44-890841af6d4mr74582816d6.29.1767862653055;
        Thu, 08 Jan 2026 00:57:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/Evr+b0nr4KGzD5p/6Wv1eoS+TOm0VkfP2EcZzyUCS11BVsI7wQRinfhjGKtU/zIVgywDBw==
X-Received: by 2002:a05:6214:4113:b0:890:8244:1eac with SMTP id 6a1803df08f44-890841af6d4mr74582696d6.29.1767862652628;
        Thu, 08 Jan 2026 00:57:32 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770cc7eesm49680326d6.2.2026.01.08.00.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 00:57:32 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH v5 01/12] dt-bindings: display/msm: qcom,kaanapali-dpu: Add Kaanapali
Date: Thu,  8 Jan 2026 16:56:48 +0800
Message-Id: <20260108085659.790-2-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 24RtBu04UaCb5oA2LlgMEfc3KmASol5O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1OSBTYWx0ZWRfXyGvdYROKzABl
 K98ufPGxN8SdNiEpDuq+PGKdqi9gUqxSwTMbpMiuxvXoD8Fzdu4RyPwJQkdqq30sDH3FkzlNaXd
 Gggl0S8aH0iauFHvy8a50nx6Tn6vq8TMajZ16LBj4/AWamUepAS0LcRGSd4PwUjxtOuzYZ6quS/
 16sampGclWY13mdWI22WYza0ypuvQPPYfMd8jHFziLyBfMCSuZYCxmxGBFQDPGlLCmWqoC0GSm0
 XXumJNYAZx4GYON/xuI3TIfWBU3P9dfXjhpihF9lJfunHegXE6tvoFp0mqXeFPSqs/vNb6RaaCr
 JRXwi4qF+tLmKmMCVvPpojz8IYI0MLDUvHiTddTttLrQNbd28JqsgJFaFvbytTJUhzPraYn/Vwi
 lHoxYdZ9wzN8xb4vynpLM0DkQrdq7IVZLJzbkMnHuRnUtW11kl25XMBX3Y9XJxilSSmZohjT8hF
 81VQG61uACJvPyyVQRA==
X-Authority-Analysis: v=2.4 cv=Pa7yRyhd c=1 sm=1 tr=0 ts=695f717d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=LEfPF28z9Y6gGZEU5FYA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: 24RtBu04UaCb5oA2LlgMEfc3KmASol5O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080059

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add DPU version 13.0 for Qualcomm Kaanapali Soc. The Kaanapali
DPU and SM8750 have significant differences, including additions
and removals of registers, as well as changes in register addresses.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index fe296e3186d0..e29c4687c3a2 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -16,6 +16,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-dpu
+          - qcom,kaanapali-dpu
           - qcom,sa8775p-dpu
           - qcom,sm8650-dpu
           - qcom,sm8750-dpu
-- 
2.34.1


