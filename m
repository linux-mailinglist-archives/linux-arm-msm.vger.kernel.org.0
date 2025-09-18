Return-Path: <linux-arm-msm+bounces-74017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B429B82CF2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 05:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16264179858
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 03:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79CCB245006;
	Thu, 18 Sep 2025 03:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VqnvnRXl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4DB24418F
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 03:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758167482; cv=none; b=ObJxaudzcZccEDg2uBfFn+XTWk1rcxHtH9tf8kJ0YaK0prdCkp8qgobGguZuk/qn9fuPs2xMgBLpMktcmj+EuOFpgAbkcG73hfgn3MVu4H/pcyzEVPo0oXJHXhH1o1SusBhqBOSgXrkFLU8kCysljz1XOWcsA3SqNE2m1XlyayY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758167482; c=relaxed/simple;
	bh=n1jsPxkiDoDjeGzSxaWrdwHm2EzDZrO/DhyX5ok9ZkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eiqK+lK4fbZF89i8SYkfB1hR++gF9sNai9zHv9ata65t1aJpCVUulreRlb/J9D/YOvCh2H7oi1Kly1xGmlj38q/H9HMGwqAX40F9+lGQgDL4+gaRkQb/tCJPspgxoLSmjbC3mzupeEtbNN2Svq1ynPDud6iSz6FduWeHvva0phY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VqnvnRXl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HGVNYs029614
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 03:51:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RkZe+kneCZcqUTCXv49AXWAvghtTrXyc5dpFgLO8PBU=; b=VqnvnRXlP6KvEO+S
	vWs5UjO9/qWSjXicrJPqWCIaTDXvc0wkf0cTG3PrHUVU8XjAb+9GYh8BSHI0QXZp
	8Tc1387V3r+kexpJvziCkqxIC3TfUwSKEgmPBYdhzvWHhdJpbffRpsJfdrm+gdFO
	6aheDDAJK4WdKZisnjsnhMe3034vxDTeGj7f0khE/cZwV5v6hGene++vu4Ikp7U/
	fSmjgm5PuJVX5Yt/kmgA7oq8u3sa07abNGfPSUv7b6bY4fj/YuXqnzUdL+V7B2n/
	hf61GQ1UxdjTyi5WqbEdZvvU2bE4+bzYkG/kKapICujal32/Wte/xT9+7n6yLYlj
	ZFG2jw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy0vrya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 03:51:19 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-78ea15d3583so8496836d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 20:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758167478; x=1758772278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RkZe+kneCZcqUTCXv49AXWAvghtTrXyc5dpFgLO8PBU=;
        b=ML0GNQbAjzKxev1YuQ2LlYfcj9jIeNDxszifgOadRNGZYFD4EQ94QdGyq1vES7o1To
         VHigjxDzeIlDrYpXCqt8ITHGFPLOyk7yM1+3vwSn0C7H/0qeZYoBIzetGosasiNlM7o3
         u2QW8fQoIs3GOqci4aJJACXg2KpIIMceDP7+opgYTQeF8jx2C30jqiwgdK0moCeeXm1N
         mdS2oYwAKS2fYhVTzEajNyQXTisIcRYlu54CSC/TGa9tfNLsKSoubJVskjQGorOlFlcD
         7g13mE78zpb3GLqSs2cial2+p8cwmhntcABzc2k1GaApOJW2A4+nyZpZ2ZvnSThKGQSY
         1zYg==
X-Gm-Message-State: AOJu0YwMjaZFouJwdKyAPaIY50wIl7qBN8cHiMW7Kr4MwmPTrbKjXPxK
	+yC5oeFQS+sVFzJhnSQU7vol46eKIDf0Em+ZBaHBAGSDOf3h5Pw8VPHD0+CRo85DA2LVSSMICgG
	bZFjjf8ozMiZ9EXO8fNc4aFV8qxcjtpb0Rj45xenb5XFJchs/A/Gnwtqt44QXuLTe1icT
X-Gm-Gg: ASbGncuPMOcriXslUlHkIx1rCvX4Jtn916RfNsZKpGEie18JnsUcga2VslnjpBF2LWx
	pXISo04rLhXX+l3+jvhiLfkRM3HFazZ4DRhouS+ZWEnvrxtJoow2XkS2KYH1/X4dA7Oct1bRtjf
	UALGlXbEOYB1EEVH4Lgg1DFnZmPjeF/f4ZyXBPjf+YxLS1gJRtJTXllB/3KJLhq9eRooE3BqJuL
	ffqpEqDaqRTkWiUI3wninkwsSLcpA24S3HZzAQOVll6ek+CHbGIcGJylJYYN02EYMfX7aMjla5m
	pyNTlqd00SXLpfDMGZyrjggSbPj15aJdX+iCY4+lJk2Lee8goJ1wEsENEdv1AivCjYbINMmU39w
	fIVBUovUAxwYBWDYhdW4Zw6TcjHbaAWoey//QERHHpveShCCh+cVp
X-Received: by 2002:a05:6214:4104:b0:721:cbee:3a5c with SMTP id 6a1803df08f44-78ecef1ae02mr47254926d6.48.1758167478139;
        Wed, 17 Sep 2025 20:51:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSx6ImXWka4qzu25nsGIPKG3jxYLOXD5VmYgqTlB6n69eBvtJTy4miHF7fghHQwXJ6uEWe3g==
X-Received: by 2002:a05:6214:4104:b0:721:cbee:3a5c with SMTP id 6a1803df08f44-78ecef1ae02mr47254786d6.48.1758167477633;
        Wed, 17 Sep 2025 20:51:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361aa38c4f7sm2799911fa.62.2025.09.17.20.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 20:51:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 06:50:22 +0300
Subject: [PATCH v5 1/5] drm/msm: correct separate_gpu_kms description
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-msm-gpu-split-v5-1-44486f44d27d@oss.qualcomm.com>
References: <20250918-msm-gpu-split-v5-0-44486f44d27d@oss.qualcomm.com>
In-Reply-To: <20250918-msm-gpu-split-v5-0-44486f44d27d@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1406;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=n1jsPxkiDoDjeGzSxaWrdwHm2EzDZrO/DhyX5ok9ZkU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoy4Gth5pDDKZjVIenXb81Ygke05JopoBwjyJK1
 zEuck0IZpSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaMuBrQAKCRCLPIo+Aiko
 1WQkB/4lg9tvQI4us/U5LqqNXJTGG36WkG5XJKtFnQcWFkKRzDRqk1ZNk4h9Mb3mPueYFIhsp8V
 BbzTyeamtCaqZ04D1qJMYL5eJwlgY4uL1spsdfLVR6Gi0qlqlEMDNidNoU4Dag9RWFOKia0N/Js
 Gr9EHf6lYOvHRjIiG1Hv8bT5u51c+GuTWMq9/QvZeSdizjJTeUSf87xvUG1VXyuLJALiOctg4RO
 okIthfyiGYNZm2Zl7TuRexJqoWjBn42AfFrtxnWDa4axY7m4DH+OLxrGjfVcNH6YSRarKwHvcKd
 ulw8+OVYkJs/GR3EXnuymyTQIpbFggCf3XuZO67duHMS3ilD
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: aj46h3kAHVKs4QIyfZucgR6KX7kDZcwQ
X-Authority-Analysis: v=2.4 cv=btZMBFai c=1 sm=1 tr=0 ts=68cb81b7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=NR_zzOBYvoclL3rq_QoA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: aj46h3kAHVKs4QIyfZucgR6KX7kDZcwQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX/+e53+ZkCBvd
 8egBJ0qhFEnpG09DT8XYK27/tDRJ/TlU/XRgf5A/JrLsXG9FzUE2mm+cV4JLry+nYrsv9gX/UL7
 jnUkf6wHAbT3GcyVT6t1N5QEnLK8mbHrf0KZ8ZaXRC705VyMGTEOKo1eMRGo1uqw1WkqtfooYE5
 6nGuq/UJ3PVPOts+ulCp6hyhcxFCzdhKp0OL7LMMHvU1PnvYFzbrgFTnuB5If+4EmEFDfo0qn6g
 K0v+0ZbdU2FoLzOJDpC0ekNhSXqm6QU5+pIL7LHVX0wkaD3mwd5qmXW8C2Y18AD97ClcVJaH7eA
 LS56NGRTDp1PYVkNkX/icIKgTYSIHliG4EUFoFnoMZuK0qOqzeFvWwTB1jDKEMqi3vbChFoG0Ny
 FDyVCy/k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202

While applying commit 217ed15bd399 ("drm/msm: enable separate binding of
GPU and display devices") the module param was renamed from
separate_gpu_drm to separate_gpu_kms. However param name inside
MODULE_PARAM_DESC wasn't updated to reflect the new name.

Update MODULE_PARAM_DESC to use current name for the module param.

Fixes: 217ed15bd399 ("drm/msm: enable separate binding of GPU and display devices")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 7e977fec4100792394dccf59097a01c2b2556608..06ab78e1a2c583352c08a62e6cf250bacde9b75b 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -55,7 +55,7 @@ MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disab
 module_param(modeset, bool, 0600);
 
 static bool separate_gpu_kms;
-MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
+MODULE_PARM_DESC(separate_gpu_kms, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
 module_param(separate_gpu_kms, bool, 0400);
 
 DECLARE_FAULT_ATTR(fail_gem_alloc);

-- 
2.47.3


