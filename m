Return-Path: <linux-arm-msm+bounces-66368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDE3B0FC8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 00:13:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 86BEE7B2097
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 22:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A446027146E;
	Wed, 23 Jul 2025 22:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WH2Qal3p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280A71E7C08
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753308784; cv=none; b=tsbsE9cJQ2cLVCFhYZY2XAcSF4/sOO5uuwHEsIbrFKXG8j1ILXmn6VBV//fKMVKRC/uJjqgWuVaSzp6tRUSZ28iRlB3TVI9mRe02JfnSaEtpL+O3xN+aa2b6SbnEUnNgeNExcl4czMY2z7tiIOoeu+8Sp1raJkB5QKrOehEdwwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753308784; c=relaxed/simple;
	bh=kU5tnUZsyEuyHklDhh5yeQn+qDm5dvdkXwyv73f959s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gvW3TYh0CJ61+w2jPwOUGjsBy5pIbtBV5grEFN7hLSdVSWj4Br9GHSID4B5csfDznlGE4C6PKvftJVWYx4Jj72BsEjfvSv2+e6M34XVKnPoi4fY2NY+NHqC2R5n1brGKc2UIsuif1kzYDKOuG2IP+NjIuHvkoDgO8DJz3mN8l30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WH2Qal3p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NH87th024377
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:13:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZELAXz6pi1p
	iurD84MhBWtClaTyOdSezyB1Jeim0QzA=; b=WH2Qal3p+RSmJGpTQU+BzLQTAhR
	xcroTPq2W4RSLcU9LWJ6C/zOlzRsFj1FyvukNxvSsU3I0Vr/syn8YWXUHsZiFrz5
	qN3S0IehHR60iwRZmiHZk6+FHE6phaygUMYvtaTbTw4R272AEBtlSCyLN4yXKutb
	z3o0Ods6XELRTtIV2KhB4dFk61xQMfnp2exYrruytEZIBE/y/fZOGZKWH3QFcsn9
	GXKePkOQ06I3WqQk5LgK0WOe1Lrh52QSHhS749CryYQbX7IqJ3es1JnzqBtWuk/v
	ZrMq6f7vX9yF/DgkXHLVkI08bMqeRgmwbHaDTv8lrLEI5+aR+4ibuiNqCug==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3esfxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:13:02 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b3beafa8d60so489789a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 15:13:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753308743; x=1753913543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZELAXz6pi1piurD84MhBWtClaTyOdSezyB1Jeim0QzA=;
        b=dw82kCbYOgsvgOvGB9Yn3R5fu8pkiFE9Fadav9uohZB9s5goRz0IAShDHq9PjwDOT8
         Y8AzFvyxy42/0eu0jY3O+aX/BnNIpbOpebDK3r3enf5vn6Hlk2ckJ0qOr2vJfb3QLE/k
         vO3adVXsdGulLpAFPoj26/rC8B8vQLAtARd5dmcYAydMBYNdQBgshvNNStC8Y9/SgOym
         vMUqDeLvPW3ihN8pKIl067SOKAFTBevFqWLASiQM63O9Z5Wt85cvAauqwq3ISFCOOyma
         c2BiO+41f8BJuw/GqZLXIs2bJtYzHR4gbrRhPAe4jMTq+VNw3Ddu3i0xqurRGjG7lL4Y
         I7TA==
X-Gm-Message-State: AOJu0YwKFNQYNcFgwbTTQ6upKiLsGWZwNyP3RPK/aoNIFVV1qsA0tOFg
	Gqvswa5/3Eh2++M/RpQO033l3s0ATBwcZZ4f8A1v4PHsF26NEvRYBy8xJ6aR2hPAm954c9Jh6vm
	X7I2JxfTOP9ataxsa/pl3JSeaxuK/pTmI57AxiMdsnSjzkTcR9kjvcePBg6T21zDJFuT3
X-Gm-Gg: ASbGncsicLdjPm1Mo1wmiessxsioXzqurc0218sUbYeWMBU91WpwxjYKYVRVwjb9UCO
	i9PtRFC/zDOvRVnReL7wGpgo8VOBnya/6F3f4y4CGN2yiFZjRgKS+qnAyo7VOuxfsUR+OSugGCf
	d3TH+i+qPIQLbakDd6miI1U88Je1Yjyf6P66VBhgHcT3Mn6/M6hUY3vbu9yLmy2n7L/SQJL64rw
	3jnGjLlxFWXn28UBZZ81oPpcJoS5nFRmOuPKxKvF/dGGd0fU27UVGrNQxXrNyefJhulCMzWzAqV
	hg5dnexrjg5y0MbpvOSZRSzrmWRzVj2Rkp+ihNwCiXVvXsuTBTc=
X-Received: by 2002:a17:903:3d0d:b0:23d:ddf0:c93b with SMTP id d9443c01a7336-23f981b5ff3mr53931495ad.37.1753308743462;
        Wed, 23 Jul 2025 15:12:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPg+91DANEGZGB4JkXB+cUWEzypyPnxOCrFXbrqyTcN8cw8Ruqrae2h0FkcANM7PlMM5SM5A==
X-Received: by 2002:a17:903:3d0d:b0:23d:ddf0:c93b with SMTP id d9443c01a7336-23f981b5ff3mr53931225ad.37.1753308743040;
        Wed, 23 Jul 2025 15:12:23 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa475f3d3sm644605ad.40.2025.07.23.15.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 15:12:22 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Danilo Krummrich <dakr@redhat.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS)
Subject: [PATCH 1/2] drm/gpuvm: Send in-place re-maps to the driver as remap
Date: Wed, 23 Jul 2025 15:12:11 -0700
Message-ID: <20250723221213.36325-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250723221213.36325-1-robin.clark@oss.qualcomm.com>
References: <20250723221213.36325-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: tmQ1ymJu3bdKeqyK3g-fQ0sINrjW-eeY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE5MSBTYWx0ZWRfX7pQi3+ezG2kZ
 M8eJx+2kLLmGbtV0Xr/4OE3siLwlpjimr9ZqJvSpKEshJBATx3KrqaEQL+mfKkWBTnL2VXIWMCq
 1x7jVvvikfJ1ECY34YYbn+D8/kWMmIYXyogQnVslEqm1WOsK8wLmzlgzYGujMoulyzDZUKaUrUN
 HbE+2yeGBsPt71ZzDCVAXUd9sG/+91S9z8ai6beCPM5gqHzpWnyRO78W8wGy1Z8fORqkSogQW3o
 Nv5gvM8FxmsKNL/AzuCFeyori65ONQuiKl5IiXh9sMuMGqh/o+yl57SlbOzwmScLOa5XimDscI1
 rjhzdbtzWpTIE+ue4Zy3T2Xij2rEaiUEgugnXGxuDj1nEBEfPbxCjEk8ixSmvQHI/Kd/iCYbVW4
 usFtxjadKvJKbwvvtpdLhyaFylzq7TjaYl6yd1pzGyqT23UFw50sE6e/tDCHU/vlPAVYzYiV
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=68815e6e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=kOSSLaVpcPouW256lEMA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: tmQ1ymJu3bdKeqyK3g-fQ0sINrjW-eeY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230191

The 'keep' hint on the unmap is only half useful, without being able to
link it to a map cb.  Instead combine the two ops into a remap op to
give the driver a chance to figure things out.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
In theory, drivers should treat an unmap+map combined in a remap step
the same as discreet unmap+map steps.

AFAICT nouveau is only driver using the keep hint, and this was missing
for the remap callback.  So I've added that.

But this is only tested on msm.

 drivers/gpu/drm/drm_gpuvm.c            | 21 +++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  3 ++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index bbc7fecb6f4a..e21782a97fbe 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2125,6 +2125,27 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 				 offset == req_offset;
 
 			if (end == req_end) {
+				if (merge) {
+					/*
+					 * This is an exact remap of the existing
+					 * VA (potentially flags change)?  Pass
+					 * this to the driver as a remap so it can
+					 * do an in-place update:
+					 */
+					struct drm_gpuva_op_map n = {
+						.va.addr = va->va.addr,
+						.va.range = va->va.range,
+						.gem.obj = va->gem.obj,
+						.gem.offset = va->gem.offset,
+					};
+					struct drm_gpuva_op_unmap u = {
+						.va = va,
+						.keep = true,
+					};
+
+					return op_remap_cb(ops, priv, NULL, &n, &u);
+				}
+
 				ret = op_unmap_cb(ops, priv, va, merge);
 				if (ret)
 					return ret;
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 48f105239f42..c3e3a15eb3c8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -820,7 +820,8 @@ op_remap(struct drm_gpuva_op_remap *r,
 	if (r->next)
 		end = r->next->va.addr;
 
-	op_unmap_range(u, addr, end - addr);
+	if (!u->keep)
+		op_unmap_range(u, addr, end - addr);
 }
 
 static int
-- 
2.50.1


