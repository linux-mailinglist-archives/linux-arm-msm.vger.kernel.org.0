Return-Path: <linux-arm-msm+bounces-62512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D19AE8D4B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 20:58:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33AB33B8C64
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 18:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3649A2D8DBB;
	Wed, 25 Jun 2025 18:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YtyuO8Jk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923992D9EF6
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877888; cv=none; b=J1ud9SOwfseo2V4onEb+OJ9moKffJdlKA8YyFcmPiVt2vrGsii5KOnOi6uJXHuGlL8J4IDSQNFRm5TwOo1qc1c/2jToumpp4+CTTaN5J5Wt05pKIDQ7Vg+ZZXSTv9lWJOVpz25spCnBG6YHL/7chNuI4zGEI65e99taxCAZspDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877888; c=relaxed/simple;
	bh=nXgUqQdyDTDmUCSlus96vQ7zp/8O8nNWvr6C6TQ8+ag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bh9N+xXmOHRAkaqUmC3ECgsIsvTecbxTPfG0p/a/kcpvpiI+CNaebznfICvfmWikY+GNagrCUzTb9x+lodQr3/uK+ciMioo2+QL2rJYpI+IIr1oGFtvW2I6CvJaJ53OxA7PYLu7LfKp3Dal5tQb9QLOr0OcBmzz/t355xT8sj9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YtyuO8Jk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PCH4Wt010397
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:58:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=C2Mw8hDedlh
	HIu8wE01JvXGicmu3xM3Nu6IiIJHmMkU=; b=YtyuO8Jk4sMJ2Ri/m2vw7QCCLe9
	tjKv2USWutaNQOLTXGaUx7HlhjrG9Q/96VntWuE7KCpdTkwXXe8t5N0cS75LuGYk
	s2JHO7AdW95w8iZgqvqjDnZNeRpWTloocpqwz//+wg2OZcct06JAJvdH8Kdscom5
	DrmM7SKvuYYwlZBPDdZlZlvFlfs3SOq25OId9IxsXTDcOdiDVpSKeoiFAB098n7p
	QTizKccSaKoGJekxblARNCidNcQ4Fg9VVBmVm4xhyg4ZNjPgyFhumRy3hBFUh91f
	GlXi4nMszFZxI61Mojkb3hAJGTgySUw2Itl0rebGrQlg/cwvU6K/XklOyCg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmtjww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:58:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-237f8d64263so1524045ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877884; x=1751482684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C2Mw8hDedlhHIu8wE01JvXGicmu3xM3Nu6IiIJHmMkU=;
        b=Vx5dhNCLbmt/Qz/0LQzXweOaa0iLyx/7gtVHgolFWZSwOmEaxHAPoqgNjsX7KFWALe
         3fHxZmD6GG38TeEYAu0d/XjjWR8buk4IZsFZuTjpEX8nUXGZJJKuSHUeZeznW/c6rZ31
         sH9tylI2O8HM2yXvGJT/rdZMd+08dr3ojJnT00zhtO52zbO8/+wfFkjjxNdiyY6w6OlB
         AsLf63QnLqWuAEY6jVlFmbNtYTfswxKX6xzXSmstQ4iEVInrJI9VKCeZLyRKr2Vg/MMU
         iyA7uQY7quD/RqKBJk/sBM+fo01z/kbCpPkFnITowNakra993lG2Tl8yUYlhMxmCkpSz
         4xxg==
X-Gm-Message-State: AOJu0YyNOnIvV3BMJqVIHFcAA6l5xR/rk1Voo1uuxeYecMv3KlOrv5O3
	krUkobnRJSiA9WNFxPlF1UHvm4WH/keQbXdhzWazWaHpA5ZBr2Clh7SjnPmFm/PHeCRDp9F4vKg
	VSgV6siEeN8V7IHF+5NJTn3TAR4BlWWEu0lMqi7NGnDQZi9yNm+Y0EagfZnuIx3D7plNjZTHwog
	HV
X-Gm-Gg: ASbGnct+7QGVxQwXaw8EG1h8cmCK5yVOfCYxudhxDrx+oN0TFXMqZEsQ58kEM7mBh/T
	Fs3dlBcw2ym0lD/zkq2u2541txYRs/89HkjZRBxmWEFzq0rNPKNxtKElkpLZdfUccf9tvLYjqTJ
	nKvVsVQB9nEd+475wtwqpCsN45a/x5bjaZC5/g80kuiRclTmvBygvo3oCmVhffq/QWtKmXY30HG
	gqTGnyQX/0cvwSzyDj29TdLy1GAPfGzNl6c9pqTXJo7cCpA00VhRLkJEYEMQ10yZeTZT3k05As5
	JkSLmZAwqk62hFRYl9GGK6Pqsuu9Q9g7
X-Received: by 2002:a17:902:ef4e:b0:223:65dc:4580 with SMTP id d9443c01a7336-238e9df10bfmr9537185ad.52.1750877884568;
        Wed, 25 Jun 2025 11:58:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPxt9zGsBsFtjOcbawB8rK4sT+s71VW3b7IpqZzz7IC1qwcaoAPSwP8cubRNnwku3ut/tWrw==
X-Received: by 2002:a17:902:ef4e:b0:223:65dc:4580 with SMTP id d9443c01a7336-238e9df10bfmr9536845ad.52.1750877884158;
        Wed, 25 Jun 2025 11:58:04 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86d5ea7sm137335695ad.206.2025.06.25.11.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:58:03 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Danilo Krummrich <dakr@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 01/42] drm/gpuvm: Fix doc comments
Date: Wed, 25 Jun 2025 11:46:54 -0700
Message-ID: <20250625184918.124608-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KLeo8QLJVt0-RwNSguqzCq-PjmYqFNEs
X-Proofpoint-ORIG-GUID: KLeo8QLJVt0-RwNSguqzCq-PjmYqFNEs
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685c46bd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=5Yek0j1-lJT91Je3aSMA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX1yfbq879gEgG
 iTd9pGG5DUYSEYvXcs0RpM2pfpMqoXXbU+VBx+7bV3pfLFKn3nj2eB3Zp31YyfrGnTXct5Oee8r
 Hjt0I5tWzDDC396r6h7yX0CwsXOE2wFIg9kcaBFYvNvI/xQyY5w+bLtE/tjxtDzSCOcaKzAzXNW
 aDFUMy5RbSaa6RBJhpUFqxcrM2ADXhYHMm9BEC+tsFq6rGWtErVagfaLPmhzuTKazRfeV31Uq+m
 WS9I1P7y193h89if3abYzcNtKOnF26/+VzI2LIHhz2+HD2vhdo97yg4vYIolGrkEidF5DxHQOIL
 k7QgCNgIjUj3Ydn1AZt36afcsVooLp0irWTY+TYT7WR4lfGHtm30lOrdkpa244qd221x9/4tHry
 fO0ALjUF/GtrGPJ5YfYtQy8mSEGPZpwm582NhJFrbmOPBAznXVLgoyMomGRGwAfrniQgWzgw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250143

Correctly summerize drm_gpuvm_sm_map/unmap, and fix the parameter order
and names.  Just something I noticed in passing.

v2: Don't rename the arg names in prototypes to match function
    declarations [Danilo]

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/drm_gpuvm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index f9eb56f24bef..0ca717130541 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2299,13 +2299,13 @@ __drm_gpuvm_sm_unmap(struct drm_gpuvm *gpuvm,
 }
 
 /**
- * drm_gpuvm_sm_map() - creates the &drm_gpuva_op split/merge steps
+ * drm_gpuvm_sm_map() - calls the &drm_gpuva_op split/merge steps
  * @gpuvm: the &drm_gpuvm representing the GPU VA space
+ * @priv: pointer to a driver private data structure
  * @req_addr: the start address of the new mapping
  * @req_range: the range of the new mapping
  * @req_obj: the &drm_gem_object to map
  * @req_offset: the offset within the &drm_gem_object
- * @priv: pointer to a driver private data structure
  *
  * This function iterates the given range of the GPU VA space. It utilizes the
  * &drm_gpuvm_ops to call back into the driver providing the split and merge
@@ -2349,7 +2349,7 @@ drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm, void *priv,
 EXPORT_SYMBOL_GPL(drm_gpuvm_sm_map);
 
 /**
- * drm_gpuvm_sm_unmap() - creates the &drm_gpuva_ops to split on unmap
+ * drm_gpuvm_sm_unmap() - calls the &drm_gpuva_ops to split on unmap
  * @gpuvm: the &drm_gpuvm representing the GPU VA space
  * @priv: pointer to a driver private data structure
  * @req_addr: the start address of the range to unmap
-- 
2.49.0


