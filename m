Return-Path: <linux-arm-msm+bounces-73014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2494B522C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 22:48:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B18191CC01FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 20:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A82D322A3A;
	Wed, 10 Sep 2025 20:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nRKQfVNs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E092B32145C
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 20:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757537086; cv=none; b=oSvVDhdV72xIzImnl+sBx1Cu1MHge9vfLTaxFcspfSfMqhZa/1G+QDDxy2NkDTVitwPe/ScAgv+RhrCWpqSft38D/lQERgkaurhz1moUknMVReaE6sRG0JUSFoA7vq8hvEw/DIV0PeUxOC81X3HhI0F4qEdSRpNUV6iE3qeYbQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757537086; c=relaxed/simple;
	bh=ptvCQ44pDwO+JsrlkCUxCIV4rlpZnxasfp9TCljvBM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JOhmjYu6v/PVofwK2hEhAjE8aWxZPCZiUiikQ2g/vyY/HFe8i4Kt3aWTrL51JWS0iEEJJqSM8e/s92MW4Q0gKz8LRFbBdQsbtDEgTjQFJvngg/b53qHJinIG1z3RlyJTHaokGhyR9iGsbix4oZwJcghW369foYRgDFO7VZCbDJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nRKQfVNs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgEmv024531
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 20:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b5j0ANF9uGLsHOzn+Dz0rArXdn90tufLs08oVyQ3FJw=; b=nRKQfVNsE3VcO2Qd
	3Mnz11ZDL3KXX8MDrf7rtL9XD58FYDHKV11lPEf9QnhoSAzhrpsx/0N3KlYnHsqT
	+W1rdFCTsPLIOMxqjxASVRXaJquU+Hiv5uxn8+o4D5+IzwLLyxWdZYhdTYxzEcEP
	l7axTMGpqOTDHsfQVgcoDhRUCI56UFDMEB1hPnEbBeuX9r8WT/FlkaDVPIO+etyh
	CaIcxi9dlWwqy6PwNn6j7Se42XwLOms0hwXqjMlJSTYxLT2Mt8rDD+Yr/P4bbpgo
	+g2T7tEjFd4b3Ir0W1SZY/Qyb6g1xW7vrrhKXV3bwCWWBL5c0jNXkWVXYVkv44DF
	ZQrlgg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8n962-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 20:44:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32db3d5f205so2660562a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 13:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757537082; x=1758141882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b5j0ANF9uGLsHOzn+Dz0rArXdn90tufLs08oVyQ3FJw=;
        b=vu81WhOdcmYvlanCBom9Mt+uRT6SwOCTvAt2l1N5CTyqiSy4U38RDZPCPhnxMO14WV
         H9ES6nMpr5LmE7vSfWrzaUTpTJA5GubTvMNNY6E95/WzuLeuqZ8+Ftj2EaalaQmP++I6
         dG/0InmsRUDKNjJLDrGoWnuUxNsWrDYzCrHrdkH9F3btRErnZiOxWqwI8gzg0D3rs696
         TF9KJSGXzv7ZfScZblPBQo3LXjVzxpzhXtAmv0Cu2CCVk+y+PHGdhQp/pYxruP3DW5mi
         cG5tgdg3fXBIfZ6QxMcmg0s1cndz7RaZy5YctaCSPyt7UoEbcSTKEPBShqS+8aB3XcmE
         3kkw==
X-Forwarded-Encrypted: i=1; AJvYcCUG3aEJR3ExPEtP2h2F1EDBvVJhZ4bFw3cRmdfHHiUPM+AcJykpjWzs9l4oiWAPUL++hYMB7lw3Y18zzOD+@vger.kernel.org
X-Gm-Message-State: AOJu0YzKWHSji8214KGWcLpw32hzlii7Rh4Oi7V0vfkIZyMHuZfHzEgC
	XXk6ZI65TNbArMBCAfTMaTREoA07pfvfKEnVzcgHsErFHPiumDhs1dQgpMT9T5zeXFlrVV+AaR/
	LNJoay1AP3hJGNPGL7YrcG+m3BC4/BSb8/NCgUItMQq4fkmt85MaAjnq1hCcvsPyHN9GM
X-Gm-Gg: ASbGncv0/JjyR5I9VQyXTMBb+eL6p/r6F/pZFe2tKGd+2q/1pzpJTJ1Ye01K9w8hZ94
	eNTEpgc6mefblLsSN9PKb8Ndu5Bi55FI7BcjAMl0eyf0n9iANfHWWcIdnJoAcqXj7B1mugCqNML
	7EHxnvSHpNkwN30rnFdgPkokChyWhbL4LiU8oOklDhm3cBQrCR1YOz6npj5On0sQvu0PN1ooyum
	mhy+9ZjoAqUOKLe6qOBnsi1T4/vWTvDJXnSPl0YwNiO9KuIKRASzML+8bSodnL/JCqj/nm0P9Rv
	FCk5xrR/qAalmgpf6S7YHPeqr4I8ONfpbkNiLFTuHJ1xwfjp4iwZnPqQbZ6LgLki
X-Received: by 2002:a17:90b:2788:b0:329:ca48:7090 with SMTP id 98e67ed59e1d1-32d440df06fmr23284160a91.37.1757537082395;
        Wed, 10 Sep 2025 13:44:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrr/ras/Xa2STSpUl7+3f4rSITLnWKAYz06qyu08j95UISULF1Zn/GfVdsvegQxaSC1gr7FQ==
X-Received: by 2002:a17:90b:2788:b0:329:ca48:7090 with SMTP id 98e67ed59e1d1-32d440df06fmr23284122a91.37.1757537081972;
        Wed, 10 Sep 2025 13:44:41 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dd61eaa42sm46771a91.5.2025.09.10.13.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 13:44:41 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 02:14:06 +0530
Subject: [PATCH v2 3/4] drm/msm/adreno: Add a modparam to skip GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-assorted-sept-1-v2-3-a8bf1ee20792@oss.qualcomm.com>
References: <20250911-assorted-sept-1-v2-0-a8bf1ee20792@oss.qualcomm.com>
In-Reply-To: <20250911-assorted-sept-1-v2-0-a8bf1ee20792@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jonathan Marek <jonathan@marek.ca>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757537061; l=1809;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ptvCQ44pDwO+JsrlkCUxCIV4rlpZnxasfp9TCljvBM0=;
 b=p663AlNIchQH8zO+l/OyM2INEDZQkWgx4XF4P+iNm7GhxMKHLnpQ/hNRhJJy3/OfjlqGk5qXS
 8h0nxAwt9qOAMSb93F2TMTo0diyYp4LMOMFaNcj6yaONVPmM7ECIguw
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfXxKQvdVrVLo3h
 SOUNil+obkTV6csuSxa63a3NjKTC3+qGu6K4uTm/1+L+JdEn/jLnvxVb8sk5mqRnH0eh4u1z8ox
 FfQ3iVHhUvp4CQRyKvSZkVVc9dI3hS5DJhAfMp7A98cD0AK8P1Bj2Hhu2TXf5g18ocTN+Uaw6l5
 ggEX6X5lJ0jaRIIBDicwzl7nN5VNevFMdUTckMAGqRXojyQHJiYaf3zNsOqhLHdTY0Aa7zrJaaT
 /gYXVH/uYgXGt3Bz0qFNvMtLqnz1FR1HfyFpEitH+l5ZcXYA+vN+kJJNwxWlgr74YMsYPVbqdsz
 ifwqu1c/1UTM5DpIzDDdx8L27736iFd7xS8CsjR+1RMQ5D1ScH+B6QrTcd1m6jWNgrMRk+9zfxf
 kr6+9LKu
X-Proofpoint-ORIG-GUID: 1ygqImULWR1DKFa8g923QKUu9L9ZyCsR
X-Proofpoint-GUID: 1ygqImULWR1DKFa8g923QKUu9L9ZyCsR
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c1e33b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=5u7-6dn6khLgd3CzhdsA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

During bringup of a new GPU support, it is convenient to have knob to
quickly disable GPU, but keep the display support. This helps to
fallback to 'kms_swrast' in case of bootup issues due to GPU. Add a
modparam to support this.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 50945bfe9b4992118f23db3cd17ac348be9f9c9d..28f744f3caf7c59412aab06f912cd09a01e185ea 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -24,6 +24,10 @@ bool disable_acd;
 MODULE_PARM_DESC(disable_acd, "Forcefully disable GPU ACD");
 module_param_unsafe(disable_acd, bool, 0400);
 
+static bool skip_gpu;
+MODULE_PARM_DESC(no_gpu, "Disable GPU driver register (0=enable GPU driver register (default), 1=skip GPU driver register");
+module_param(skip_gpu, bool, 0400);
+
 extern const struct adreno_gpulist a2xx_gpulist;
 extern const struct adreno_gpulist a3xx_gpulist;
 extern const struct adreno_gpulist a4xx_gpulist;
@@ -184,6 +188,9 @@ bool adreno_has_gpu(struct device_node *node)
 	uint32_t chip_id;
 	int ret;
 
+	if (skip_gpu)
+		return false;
+
 	ret = find_chipid(node, &chip_id);
 	if (ret)
 		return false;
@@ -404,10 +411,16 @@ static struct platform_driver adreno_driver = {
 
 void __init adreno_register(void)
 {
+	if (skip_gpu)
+		return;
+
 	platform_driver_register(&adreno_driver);
 }
 
 void __exit adreno_unregister(void)
 {
+	if (skip_gpu)
+		return;
+
 	platform_driver_unregister(&adreno_driver);
 }

-- 
2.50.1


