Return-Path: <linux-arm-msm+bounces-64252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0CDAFEB9D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 16:18:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12EE11BC1E25
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 14:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB8E2BE048;
	Wed,  9 Jul 2025 14:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ibxh073e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E53328DB56
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 14:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752070150; cv=none; b=d8cZa+tuOmEANggujBZ49FbdiDNH+AsWT6BBmqvPNklLHwzM+iDwiBq6QKUtjxViuL0z0uTIHG1ApaaNXmfLBcBv/On8O91pZA7Xh2Uljkr8W8x3PI6mxu0HopFSiQuNbBi7UYkF9Y1z0dB7ha/kNsguTT9zsBP307AftKyLfQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752070150; c=relaxed/simple;
	bh=/i+QrjsH0aywQwogwYh8FyRdW4rPjWnA8SqoqnQl3sE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j/I1JDezxsyS1Tkuf6Ow8TJOw5pibKjyq43OynRYOUeuaL8JA5AGDkn5DvTw1PCynnE4J+SzUKdDKvRJkbp8kD31fioSuDlfnIPLbauGcFKMxQEueg3oPYV6UIwvgGADcUUwTRnT+131drmbyd8+ZbongvixSmzEV/j3edl/E70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ibxh073e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569Cp9q3016847
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Jul 2025 14:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/d3R6mnm1I4BAdLDWhYywDzK+yEimTdQcJV
	Hid63KMc=; b=Ibxh073epcP9IdnE8N2pbRLR1mXt0xUZ+k93DUYGd7b347B/rCg
	fU5ccPD5xgjTmGZz4Zt4n5qNbi5SGS7n/uaqahry7eJ1RpUKASWtE4RYIWi3AZ5U
	V8wD0hbTnRs8XfcHEh3PgWFcLzW+06eCXrw1W4FHMC2Nr1Ese//OwKKXBfIFaBro
	cmjACq9x0lPUjE+MRUni7ZiTGqfIPl7hV4ogSmIBNOFf6zDYGeifKYfojpPkYlh0
	WqQcbj8qCHThegKpMZTD13I49WTE68ucClh8byMil5ljb6BEtQZs6ocvDNzUTQ80
	nAbnlA6neCFC8CJHo6Vivq1fKhViInDmdYQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smap1ack-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 14:09:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3141f9ce4e2so7828159a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 07:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752070146; x=1752674946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/d3R6mnm1I4BAdLDWhYywDzK+yEimTdQcJVHid63KMc=;
        b=hBPL/7PmdzvbbsAeqpg6Y/cRJQ+O9aETo8L91TdQsq4Kmb9JJxCygIB7z9kOYjMVWA
         lFmeIlMQECW/+hE+SwM7cEkKm2lSJxlwyw6o9+fYPcxgAc3mhYzBANE86Bk5wf/52oFL
         OoaQ+M9Xov0vI/S7qtJkzWQmZuAdXDTWPK8W1rZyAi7fXhuh5piMYR8RBA7tYjIj0ro9
         GzM2/19Ft6WDsRo2PlslINwH1fRK1U0dAClviA+hHHxa15DWF8t866vVHZvURvk3NjGi
         rliNoIHMwMAyH+YQU7Z4eqZNU3Dx4xgcSTyC8jTVXNqiogclX9QUldlUyjejfTmSwW0H
         ZQgQ==
X-Gm-Message-State: AOJu0YxgF4ESwjpeD1z3MywKS7FSmhdgYcAoSjtV+Ec/WS3IUHHhWTyJ
	TCOv5ilVEy9fY9GcJA2Rl7AO2B9udWhH8hG/vS3dkZmpPK87pNDqZ9emkNVonZ2l0UH9xF4vqaF
	t2Fx0z8qYVsjX4XapOqwlX5FpRM+WlEjib3xDsB9+cnsA3yUwSQmF12Cn3eG3i+YNekXjahDYAP
	A2
X-Gm-Gg: ASbGncvYGF+V1YB/Wtb5wiJUdYHHumxz74jqhrpgRquBuEUhllYBUEwdsxDLe03xBS5
	LYvNf+aY8BCQZEVd8ex+2Amrxb3jI6Vw/3MK9xSbt0ABjE8HnH9w+Eev8dlVXPk7Wqpa+sm2ngP
	i+/6yPAgDvnhSscSD8lVESRdrvpAGenpbI9cutHFRR93Ey8KClH7gwD2c9fEoqzqbEfSaL9Bmtf
	OjqHoYvmoV8KFPcqB1lree0jXYj1uvSf7yS5+AweeBYZiJoEk9PJ6BHB0HwcAqgyof7LxJ0Wexf
	StMZXLa+i/m6fK+UsWQFpoN+ZkPu1MfWZw==
X-Received: by 2002:a17:90a:e7d0:b0:311:f2f6:44ff with SMTP id 98e67ed59e1d1-31c2fdaefbcmr4683201a91.17.1752070146328;
        Wed, 09 Jul 2025 07:09:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMafukcX25WYJC16FEhi5PetBHsygYdFgLzh1SAK8KFse3W5EKQBerKIx1xEL84lugAaP6Ww==
X-Received: by 2002:a17:90a:e7d0:b0:311:f2f6:44ff with SMTP id 98e67ed59e1d1-31c2fdaefbcmr4683150a91.17.1752070145827;
        Wed, 09 Jul 2025 07:09:05 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3017ca4csm2200198a91.31.2025.07.09.07.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:09:05 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Fix build with KMS disabled
Date: Wed,  9 Jul 2025 07:08:38 -0700
Message-ID: <20250709140838.144599-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ar7u3P9P c=1 sm=1 tr=0 ts=686e7803 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=isCY8TonHXl0-fnU9HAA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: ycUYvf3dwbp8FRKF2adSII08l38cmX_v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDEyNyBTYWx0ZWRfXz1y5aChov3lG
 gbVFcWPaaSXybq93FX+38d2NP085VPSJhMPqiK9vLOTbhxXMvCMpCUNtXXVHcXMgsr55oDxZefH
 X57oO9hd+FJ2IYPZtqRuc8p7mqnnfF+zGDf4+ITTGfekrK1dM+Cb9Ag/bRq6aQoqPaYeKvpEvAt
 0+jlFp2bLjws+w2Fj7s5ZQjmWIMZKOkNd6uCO6wQw5eqhGjmHS5O+XyWolKL9WKQTJm8gEDzBN+
 vTkbhFYWQJmTmZxy1NEhLk7TReA4PxffelH3BbesJiCK6qUofjUiE1UdbtegF5ulWlBMLz7Z1cP
 kF423h1VKM1b3pwtgD7J7GynqpabuP7Ca/YVB/QYgkTJjYIfWcDm7bFf3T6hlJp+mOuljsTGq2Y
 Bzh8ewHmLUgn213FamWi/qkW0uO4RUknq5xOx7KO8Pk4GIlXq50+ecPjdp4fsSTj+6vSkBfU
X-Proofpoint-GUID: ycUYvf3dwbp8FRKF2adSII08l38cmX_v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_03,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 phishscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507090127

When commit 98290b0a7d60 ("drm/msm: make it possible to disable
KMS-related code.") was rebased on top of commit 3bebfd53af0f ("drm/msm:
Defer VMA unmap for fb unpins"), the additional use of msm_kms was
overlooked, resulting in a build break when KMS is disabled.  Add some
additional ifdef to fix that.

Reported-by: Arnd Bergmann <arnd@arndb.de>
Fixes: 98290b0a7d60 ("drm/msm: make it possible to disable KMS-related code.")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 33d3354c6102..c853ab3a2cda 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -96,7 +96,6 @@ void msm_gem_vma_get(struct drm_gem_object *obj)
 void msm_gem_vma_put(struct drm_gem_object *obj)
 {
 	struct msm_drm_private *priv = obj->dev->dev_private;
-	struct drm_exec exec;
 
 	if (atomic_dec_return(&to_msm_bo(obj)->vma_ref))
 		return;
@@ -104,9 +103,13 @@ void msm_gem_vma_put(struct drm_gem_object *obj)
 	if (!priv->kms)
 		return;
 
+#ifdef CONFIG_DRM_MSM_KMS
+	struct drm_exec exec;
+
 	msm_gem_lock_vm_and_obj(&exec, obj, priv->kms->vm);
 	put_iova_spaces(obj, priv->kms->vm, true, "vma_put");
 	drm_exec_fini(&exec);     /* drop locks */
+#endif
 }
 
 /*
@@ -664,9 +667,13 @@ int msm_gem_set_iova(struct drm_gem_object *obj,
 
 static bool is_kms_vm(struct drm_gpuvm *vm)
 {
+#ifdef CONFIG_DRM_MSM_KMS
 	struct msm_drm_private *priv = vm->drm->dev_private;
 
 	return priv->kms && (priv->kms->vm == vm);
+#else
+	return false;
+#endif
 }
 
 /*
-- 
2.50.0


