Return-Path: <linux-arm-msm+bounces-63824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA3BAFA093
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 16:53:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A72251C21814
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 14:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14BA91EDA0E;
	Sat,  5 Jul 2025 14:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EMwVlEF3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91ADE1E1E1D
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Jul 2025 14:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751727172; cv=none; b=F5DPg9AMdIb5KaIiELJIi+GURmsAdnTvJufMbYFkPnt4GoqpMNpIGPNPVnKs2kjKaS5cdFCM9+Lr1nRkKhtodG1Ek1TxUTr3JzR53qWNxzV2fLjRY+jnvN2eZXsLvkv6uJ10itntMy89XBB+w8CRDxuXsecyUPUIpIrUPgnD/gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751727172; c=relaxed/simple;
	bh=u+70PA6lxbtmPFc5dpKzbLcjYJ5WBLyvQ+6eeiM749Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DSOo31BWb4fN19+QjAuEYoqtd433mpkZzxMNFH+GlspIZbOUY+La2PG1zyXlFLgPf0dYrq70l9YdNRMY1N5umJjBpm94jpA8fdGBPgoXWfFpIiReC/0OEYQ/12MPrtkMOpqhqQY7fJSVW53rNGR3mlhxC1cGYcQATdpzDAVBJuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EMwVlEF3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5654mZce017343
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Jul 2025 14:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Nk90VOiEFug
	0vYkjADFImbzNB5RgGN7Xu9yxpfyqjMo=; b=EMwVlEF3LV1v+XqxGnc0prQi2ce
	POIJRSVXse1eRxSZLHLYXK4uhri57YWRiws8HBkYAgd/otBUdtDpq975Qs5VnOT/
	22aWWmtroGWckkzEUr9q9AS05TrBHqJSiuqwbOUDxcVDfHaLsCZTJDwUIORNXBwO
	wqrBt5BAYEf/IzKlQsPcsZUiNJwNh/qF+Gpav1WT+T0WUIBi99bH1EOn+5da9zHO
	ntWFIGsIxMauQVN7I/L1zLIXjimxjFHQfJddcYFvXM/IqwurSbUI8mEie+IS8kIV
	JCFAoYXcH7L6SYK5PddG9ue5MMUt4eZS4nTZ3RlIGR9FsSSQmHevh+L47Pw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pwbd159h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 14:52:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235e1d66fa6so14155965ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 07:52:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751727168; x=1752331968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nk90VOiEFug0vYkjADFImbzNB5RgGN7Xu9yxpfyqjMo=;
        b=OLkbgL6ppU2OTEwKRM2FUZTEmHJGB44wMa3DJdrKdcxXr55UWaoOcPsCXPStYW2HC5
         j/zrjDomEYG/t4WcHklEfNwEvmUMxYM435SJkMMj8mYCtjKW/c/WvaEvc0HuBdBLzO7+
         HGrtlcPzgZvMuASCnWyBYnMjLsIRzvNOc47LAD+Ojy8T5N7hvHQ08v/zjSsm/Yra+XJ6
         Evx9Z/XcEDSrlCdiCBw55yvjbonggACv89psMY2WqA/KO3D6VLIQFdnE8zDu1kWBvL7I
         ikgtfmX5Bg8p9QLtS4r0jrL/JkYUngQgflKT95C5PU2i/xEBhOW7/RChIGTDv8eNqeeE
         TtwQ==
X-Gm-Message-State: AOJu0YxOnY7hzXTxLv5/vrfDInV5xIGBXD0X70b/g93gv+CGUsw4r+/i
	7G9l8hWZExtriMTWwtR5Z6ooLQjic0cMyXy7x7/0aNvCNWoD1re2eL5RjKKj2TSFg5RrgwYljfn
	8yUjyqSIyuBJU8bhcLWuZRmMz9W5eJQFKRN1rjwdaDzvRvyASAescG25clBAzbtd/ufYx
X-Gm-Gg: ASbGnctfKeGP2GTu222jHhuq6P6mibfTjty2xin2HMSHwSFsyFWdMozzLgal4P/6/nJ
	ciNfpohYEF/+Lznsvk7JPbe++i13oN1jrMOEpichnZP3/1gM3s/lIBBHex8+xF1tRTAdrKvunTl
	PFuwoXwYqFUCRL64pZREz/ujZtGKm/NfP0q89BG81mDBJnNixi+ZZL3W/sLBDYsh+7lDT0/iPe+
	CtL5gQeUUOVeVOGgofX608XI+faa1z4J3HOEneTfUdrTMCmOk+5JXkIcNc+xqF7uttTv6+8AY1y
	jLf2eIG7tryB42n8JiP2Tgw85DnL8X7YpA==
X-Received: by 2002:a17:903:41c1:b0:235:f51f:c9e4 with SMTP id d9443c01a7336-23c90fcbe60mr34277765ad.12.1751727168479;
        Sat, 05 Jul 2025 07:52:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGecKCCmRq5wXE4HczwKGdy/aWs+wh50ypGWsS+hlioJO5FRxk3SoGiY7wXQgs9u1NiDjqw0w==
X-Received: by 2002:a17:903:41c1:b0:235:f51f:c9e4 with SMTP id d9443c01a7336-23c90fcbe60mr34277465ad.12.1751727168075;
        Sat, 05 Jul 2025 07:52:48 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431a38fsm43137835ad.4.2025.07.05.07.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 07:52:47 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm: Clean up split driver features
Date: Sat,  5 Jul 2025 07:52:40 -0700
Message-ID: <20250705145242.781821-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250705145242.781821-1-robin.clark@oss.qualcomm.com>
References: <20250705145242.781821-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GkZfAMh51g532l0Du756EMr_15s26M6t
X-Proofpoint-ORIG-GUID: GkZfAMh51g532l0Du756EMr_15s26M6t
X-Authority-Analysis: v=2.4 cv=e/kGSbp/ c=1 sm=1 tr=0 ts=68693c41 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=udmpUeRRehRK9BJah1YA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA5NyBTYWx0ZWRfX4QLs6AAMa98c
 94WgqXbjaBRb/6lpwq9miF7u2IGZrpd3aOMK1i3hZ8ReJWPQVMooIEhTcJRUrwldSKSmYIAApwX
 uD8RdHY72ns7kRDEws8WWNpjt/eIAgv1iHCxLQjSO+aG5tlvawJYp5hRmUbuodQb9VpGvMG440B
 PCQFGu6x/+FOGbGP5uII+8Xd1OcG1mW9qgexOEvlV04UfuP+PVVUfsCXRc7JclxppAm60xio9TO
 ZDrI7SULOrLXQ2UNZ2+7CDjVgRSPMuofHTPly1AnjDJjGII13Pesy1rVo4r8yk/Q0Y4MLRU2clF
 fSuLJLMEZ9+8sTSNKnefZokXKK2Dz7cGpEGh3l/lM/NsrHg8p7gbM7lumGVgAITEXAcehiiqyJr
 Z2xaQKt5hXl89XjxR1QIdq7HRp1073GeomR/5Exb9QJQyl4cOLSikge9s3P8tm8nzo58Xg9e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 phishscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050097

Avoid the possibility of missing features between the split and unified
drm driver cases by defining DRIVER_FEATURES_GPU / KMS and using those
in the drm_driver initializations.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index b6efc5b9933b..5695de1bbae2 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -816,14 +816,21 @@ static const struct file_operations fops = {
 	.show_fdinfo = drm_show_fdinfo,
 };
 
+#define DRIVER_FEATURES_GPU ( \
+		DRIVER_GEM | \
+		DRIVER_GEM_GPUVA | \
+		DRIVER_RENDER | \
+		DRIVER_SYNCOBJ_TIMELINE | \
+		0 )
+
+#define DRIVER_FEATURES_KMS ( \
+		DRIVER_GEM | \
+		DRIVER_ATOMIC | \
+		DRIVER_MODESET | \
+		0 )
+
 static const struct drm_driver msm_driver = {
-	.driver_features    = DRIVER_GEM |
-				DRIVER_GEM_GPUVA |
-				DRIVER_RENDER |
-				DRIVER_ATOMIC |
-				DRIVER_MODESET |
-				DRIVER_SYNCOBJ_TIMELINE |
-				DRIVER_SYNCOBJ,
+	.driver_features    = DRIVER_FEATURES_GPU | DRIVER_FEATURES_KMS,
 	.open               = msm_open,
 	.postclose          = msm_postclose,
 	.dumb_create        = msm_gem_dumb_create,
@@ -846,9 +853,7 @@ static const struct drm_driver msm_driver = {
 };
 
 static const struct drm_driver msm_kms_driver = {
-	.driver_features    = DRIVER_GEM |
-				DRIVER_ATOMIC |
-				DRIVER_MODESET,
+	.driver_features    = DRIVER_FEATURES_KMS,
 	.open               = msm_open,
 	.postclose          = msm_postclose,
 	.dumb_create        = msm_gem_dumb_create,
@@ -870,11 +875,7 @@ static const struct drm_driver msm_kms_driver = {
 };
 
 static const struct drm_driver msm_gpu_driver = {
-	.driver_features    = DRIVER_GEM |
-				DRIVER_GEM_GPUVA |
-				DRIVER_RENDER |
-				DRIVER_SYNCOBJ_TIMELINE |
-				DRIVER_SYNCOBJ,
+	.driver_features    = DRIVER_FEATURES_GPU,
 	.open               = msm_open,
 	.postclose          = msm_postclose,
 	.gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
-- 
2.50.0


