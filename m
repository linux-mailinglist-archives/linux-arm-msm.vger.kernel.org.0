Return-Path: <linux-arm-msm+bounces-85573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 800C8CC8DD7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 17:49:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9BD4B3074FD2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 16:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A753612F9;
	Wed, 17 Dec 2025 16:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cyIBGjY7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N5xJUTbX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E766358D2D
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765989314; cv=none; b=Xyy4vU3jNXh9vIowSeCuQHkj/eMyyCKmqMXtY5qE+tWCjsXbTjEPCKIbbS7lGR5ODE7yE8rbLqYfldrOAVLRLNl4M54pKZR669/nk1ZVZkRjujAK1sDxHmuAv5zMIa6rLEuZHUnNpZ2p/mA1WPO+koR73K/edQwIpWVHhTCpabo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765989314; c=relaxed/simple;
	bh=yBYzqc0S1JphVHuD2j55BlKNRj4RzOO+Sg8ufDQtOo0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eaZ76VG5S0j5CUhJUNCGQSEkw+bqZPMiKml/oIOkmu9fk7+e/UPF8UbA+qiyyD2WI2Evhvr2AGAcMWRX0zqFMszbczSigMHz19Guud+j138aTiCMxt1K8pDmICJpsyPuxpq+U72OCAVNzrEcOX0hibaP7IkaO4CqTZuYejjMJTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cyIBGjY7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N5xJUTbX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKm3X2465100
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:35:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IGO99rWItnnwo77g8rlfsZqn5NHrWegTLAN6ef6NdU4=; b=cyIBGjY7ANvNA+F5
	LJrlVHP63kNG7nisScP5ZdNcrl9T6qC/Hg2Rz1ucGlj4RwZ8vZxqQzm71QaaGd4O
	/3Lvao4/3HXaQR0PCA+uLMWS3o4eFzYbqNfNTuogdUAM2rnPwldVCQy2iGBNeook
	60HcQDD0Qemff/elvDJtKKAWpdNyPHAvgTrxFEIGW56gkYSKqET0/XU/az26LoxA
	bDFI1RUMyLCr5KdL9FLYwZ8SONt93f3lZ2YlP8bE8hevkWRioBDVfLk4epmypFEg
	KgxRHYerq9hs/NJfO5jroqYcWwGugjlSe76gfX6DIVARnKtZF7HlEn8X8JFsJm9b
	yypnvw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fe2b7jh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:35:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a13be531b2so41964685ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 08:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765989312; x=1766594112; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IGO99rWItnnwo77g8rlfsZqn5NHrWegTLAN6ef6NdU4=;
        b=N5xJUTbXD/j9a5nnRkmfZz/FfWclh0BWpqJ6PVYGUjvFiPTgocdU/YEHyzcbNoQY3W
         4Pvgbv1nSE/X/9o1wJ4g6CJytmyKDkumj3qUdWOUX5WGLhSeqIcuQ3SRzqPUND7lnnbR
         Bg+lEBG5YukZfVhJlLm+xrmDFeCK9E9/xC6GvuoKEAKZUUGziUwtk5Oq50Cr0xdkol3f
         yTkTbG/dpHEpnP6/DGyj2RDQzoIXNyefBqBV6sZlNXxmVf7qB76lRlAlY6t1Gs1u+OV2
         crL56VboI7Ar0MjWeUuxoSc80PaGIMJvyooEXbH15DXYHH7qq/Q/NRDwLFvk9eIza9P+
         nD0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765989312; x=1766594112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IGO99rWItnnwo77g8rlfsZqn5NHrWegTLAN6ef6NdU4=;
        b=A8T+VulFVLU3mdJ2jGvxcXLxx/fdvqxie/lmW2o2EMRgDGqZuN3AykiE7OXvdqGwvT
         rznaDEUlnUMK1/Q8BklxYDBEwolxhm3fV2YzYQCfexc7GChuoOd8WBlpGBzt3bB8RvyD
         i0vmWQxbLGcFHey5eS8qUKE0c8VLzUayY7oPLrqhNViQTW9bx8iY/zHQGyWRZG5KuSh5
         VQtUEaZlTYCvrmdT5xNkDd28r2n04RZbHw1aJ8jSfDtwpGKLKsTduvyB3LSAkzEI2I7h
         /GTfqgTmieSX8BIyLn04DoC4ThXX/lzTU1Mq/l0E+YWkmluFyZ0Ks2q3JaMQ5PiDyqie
         nCDA==
X-Gm-Message-State: AOJu0YxJEabvG7s53YUiELUH4UqRX5WxbjIpL+CpsQFSKNGY4fE7Uydd
	/sqC62CQDQUGJH91aEnZSDo55oU8PRiOM5CqpMGamIHTPmGLNwX1OkSxLOmaIniNnDp+xKbDotI
	4bBJ9Al9h/DEvB+c0zQNe6aSNbeZe49wEwXFmwz5t+FKOMp1rC/T9TS7vHjcwW9YRxlld
X-Gm-Gg: AY/fxX4zLkHlnJ/o3dODtpCDZDAed6/2AklS6AvYrZBY/0fenyf9L52Upnk8Z7eH6/R
	Kpey4gq220oL/52WWOYQeEfHP1GA/F79I4u8rtxu0rRqXw+xB8+NUgGukiHvkKTz0CPlT33nFWd
	akWRNZbIgwwdoIsXb5r+l8UA7D5mJbhkek91vD/vjF+DS2IWe3dyaWezr7XuVMtPEbketk96PFh
	ogasRjOXH3mu9Z1Ta6VvMTWuGQEsnn6+UBQQlDyApJwUHJ3jlHbu5CtRTQIcY9WZ4umkb6okmtY
	kq9MVKPkbOkwj1P4vH106o8bN/pOgKfalSsrurrJAOVlGzI+F5+GL18YYdpJU8GUTaJ8ljnBqkl
	598dMJ4BbabZRjkcZl88yjD0377kptQz3/gGX
X-Received: by 2002:a17:903:3bad:b0:297:d45b:6d97 with SMTP id d9443c01a7336-29f23e3618emr197363715ad.14.1765989312018;
        Wed, 17 Dec 2025 08:35:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGu76/RdEU0SDBR8aBaXkqghR90u41/dQnfZUGn0J4HlRjXSeRxIKQx+zyA6K+BSJUGHSMFJQ==
X-Received: by 2002:a17:903:3bad:b0:297:d45b:6d97 with SMTP id d9443c01a7336-29f23e3618emr197363235ad.14.1765989311371;
        Wed, 17 Dec 2025 08:35:11 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9b36af7sm204721055ad.18.2025.12.17.08.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:35:11 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 22:04:38 +0530
Subject: [PATCH v9 02/14] firmware: qcom_scm: Remove redundant piece of
 code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-kvm_rproc_v9-v9-2-ab7ac03e0ff1@oss.qualcomm.com>
References: <20251217-kvm_rproc_v9-v9-0-ab7ac03e0ff1@oss.qualcomm.com>
In-Reply-To: <20251217-kvm_rproc_v9-v9-0-ab7ac03e0ff1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765989299; l=906;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=yBYzqc0S1JphVHuD2j55BlKNRj4RzOO+Sg8ufDQtOo0=;
 b=/2jf6vhjy4QLGEOUszAhuO/B64Iqi4w47ebi05Xomx0kqSrrIt2AibMsclR/gJU8gCF/b+VKt
 sPH2d2qYjiJCMwLNWI/qf5tj5R8+TQ0ctn0KvFVsmp6EWCXAH1faTHK
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: 2g7c9UQCm493G05rgYCy-w21WdC11RIl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEzMSBTYWx0ZWRfX2rYMNqrEjRFo
 3JeqO6YQnYJecYkJhax0tvAoI+OS2RpvyIsYR2y04BuLbs5fTKp1TS3RbbRzF/BJ9OM98t3Eb1W
 8IkTgbmefx/4uyXCu+jEMhupNBdObBirJY4PmjEiqcSqZOxhLSXywrB+frUgX01CVhe5ymoxNoM
 /LPOMRDghixB7awoTxAnJkC5TPxqdngazfEv5yLpSLUQltlVIQrdn2iotoyaAJ7j90Viqub4buV
 XEL+ao4WdP5wfrsURUA5KG7U2Whjf5oXa9igzmJ2Tyt4zH803TcAzFDmZFL2eDhWEcbslUHezlZ
 PUY8aMmJHIRKP3sZVlm8ngptXZh1l3giD7kAF0TpyGZs5mDtt78OlQrVeOQL/Ygckr5RiOnLvQV
 Oe70s6u8SlaUOzEK/xQ0+utTjZDCjA==
X-Proofpoint-ORIG-GUID: 2g7c9UQCm493G05rgYCy-w21WdC11RIl
X-Authority-Analysis: v=2.4 cv=HpN72kTS c=1 sm=1 tr=0 ts=6942dbc0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pWxEDRe995Kf1ot4LjYA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170131

The qcom_scm_pas_metadata_release() function already frees the allocated
memory and sets ctx->ptr to NULL. Resetting ctx->phys and ctx->size to
zero is unnecessary because the context is expected to be discarded
after release.

Lets removes redundant assignments.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 1a6f85e463e0..6461408c58a3 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -650,8 +650,6 @@ void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx)
 	dma_free_coherent(__scm->dev, ctx->size, ctx->ptr, ctx->phys);
 
 	ctx->ptr = NULL;
-	ctx->phys = 0;
-	ctx->size = 0;
 }
 EXPORT_SYMBOL_GPL(qcom_scm_pas_metadata_release);
 

-- 
2.50.1


