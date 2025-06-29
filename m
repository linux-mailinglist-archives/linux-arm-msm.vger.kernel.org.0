Return-Path: <linux-arm-msm+bounces-62934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B280DAECD20
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 16:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31C803B3320
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 14:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694651E32A3;
	Sun, 29 Jun 2025 14:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JJSAR4tE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC59A226520
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206030; cv=none; b=G9boEoZq5vp07i/XGA10v2SexsawuQbGiv7Qtmo+kedpM7UQsRdkAWT3xN2xe79EBbzVzOZRiO3y+qYNl47YRNNMHP+2Qd8lWzqshU94geqQevxR5CqD0x4RPLJVEOXqNZ3uFPBkxm+JdRe7coweOD0TTcwGNyh0ZdbD73BHC5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206030; c=relaxed/simple;
	bh=8HUCsu07hAS/bP/QpqqCRLMr8xpiWxvBNsplcx3L6YU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TdSujsJKI6Y3ltU370NiJe3BAmVGw6nEt1P2cPV5Zqax9jshMmIae8gnaYg/r4YT63/K1qPytunCitQmmGUgo+5+mk/0QcSDvtbZeE1hn5fHntp7g3U+lLrnC5gTQSXv+U496swKkee3VsWm7K1aBjw7CDxOvwsb1NOSVOw3c+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JJSAR4tE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55T9ZHbW021635
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:07:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/I8w26relc0
	8VGTXOUezTNb1wMArJgWD1sc2fjaEtTk=; b=JJSAR4tERUHwHwcadQJAfq5Q4Ua
	p0kSHSAWTYEHTVrc3octjQkZXECoUrtgSHD9JZKNY7VohX2hAvtwB16FLQ97wHl3
	EPGWRWHhGOhro8CYGSKUFIlMzPjGrhxU+iSCTfgkP51EYqkPGJMPXk718ZZdGBgk
	FNfGSQfvF8dD6KV4q4mindWrASbL/geWg+0uTpPCTTpWxUUfMnw63geI9xePVCaj
	dJjbuGaAeBneAhjFHD8MLiIIZy1iUFoKIqooIsfgoaL6JSTFNAWmF4HJG0rLuUim
	iVpyNiMq03kgEqMTjnmN2r/AfElSoZxZJgo7CFksbIID3YoUsU0DT9ZU+wg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9a5us-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 14:07:01 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-748f30d56d1so1822172b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 07:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751206020; x=1751810820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/I8w26relc08VGTXOUezTNb1wMArJgWD1sc2fjaEtTk=;
        b=d6ILooiGD4/SZq6eyRoHhRZ7+qeLknJ0XkaI9px5ktBv8pGLfreEUas5DpBK5hMH9f
         xM9+oADmJNvysp8M1q5ReesnzE7JzeOXPn07VRNXFuaQyzGKm8PUWJ7i26WmVcX9FKdQ
         gb00GK/pUTI8uzkMS0yfPGAsYlIl1KIYBTSoi20rAK9h++c/rmOgGrzm3Wkxcz90JyFr
         nlCgPfKIwBvSAtINGSXUCPw/5+3SWFkkJsAGHDLVBMg7MXfYX5jAJH5KytgSmPtThUDl
         TcIRM2Uf2wMNcie+jqds05zXnXcKv0/9DDgyQhaibj4N0uUJ5PQr8kCpxYHwE7GupLVR
         ntaw==
X-Forwarded-Encrypted: i=1; AJvYcCWhq1FQpR6rEdZXahzAI46nXbzZNjHqiRNOrN0xIADJ9FrvX1/naoDdhs8AGvByAY8OGBO75MNj2RHNe5rq@vger.kernel.org
X-Gm-Message-State: AOJu0YzucfWmRNgWK6ADZfOivHzQYTyQteHLQ/OSNydB8XDUfI/y6Jz+
	JGt2pL02mUk+oXwyTGfscXLquEGXMm4CgCpNYh3mPuVP2RNOEM9RKXTrBwDL3eAHXBFNqub/ogO
	KDfN2Fp+vg+EuzkUY5ZMci4TsYWBiZdHCHbJogM9EyO558YQf3yv7qtJaoXs9EzGkky0W
X-Gm-Gg: ASbGncv7g+tnsyOsuHJQIgdZ8WomN8yO58A2bJqPPVx/JknZ0leQpMONUUncZQa9AYW
	QMZZ35lX0EPz070OuXPtLH1w9FvMO9ooECRxQGSliwvUEo7ohLHDFLWkg9zGFb6bvdVhzabZcni
	KyBqK1U5dIyUrQYOs2P+gJmd8hbC+gavDjpXHniYDD5yONjR+MuQtZEygnWydFmJyCJsOhXx3t7
	UUMB+CithHXeSlniik6Q6El6QcHgs6AHPnkbPM3dJWxWyJ8EHDFAig0NEqfVArDmSBWLsfbYZUL
	+0tzI4ZqFMGaAL5QE8Coc6LCm3QwUhej
X-Received: by 2002:a05:6a00:2ea7:b0:748:2b23:308c with SMTP id d2e1a72fcca58-74af6f445e8mr12526309b3a.14.1751206020523;
        Sun, 29 Jun 2025 07:07:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWD00aCTKp3rmy1fVmYh7PmkKjE2n/hAouI0pUy6N9MI8tjXuNWwJzmYWFZ+STLslS/wIm7A==
X-Received: by 2002:a05:6a00:2ea7:b0:748:2b23:308c with SMTP id d2e1a72fcca58-74af6f445e8mr12526273b3a.14.1751206020100;
        Sun, 29 Jun 2025 07:07:00 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af5574604sm6982706b3a.86.2025.06.29.07.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 07:06:59 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Danilo Krummrich <dakr@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 01/42] drm/gpuvm: Fix doc comments
Date: Sun, 29 Jun 2025 07:03:04 -0700
Message-ID: <20250629140537.30850-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
References: <20250629140537.30850-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68614885 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=5Yek0j1-lJT91Je3aSMA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: VHpGJ6TQqnuwKZr9dk5qkICHrNoiF_ME
X-Proofpoint-GUID: VHpGJ6TQqnuwKZr9dk5qkICHrNoiF_ME
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDExOCBTYWx0ZWRfX1/fykxEPGcQg
 fjyVzdQnnP2F/huRe/Wj+evCZgEtvI7G2jP/egvQ806tF2RP+SOhRPsDIUZj5UfpWqRzJj5xP1W
 d/WFGnboMth3Q3OXSIkzG+QzJ5yPeh7gD2A7g+y6z+L4BXVqPdAzYfxEla2OsrAtBNmf1bnZT67
 LsBQmLpGyg1dgZ2mKc5Sc7VA4zGjmiysYpdqFN8gKMe6kx58SboDYhZYm+jQK+4IlFF6W6ZROER
 ahK+yTiteRNMG/UJEdfYb8Ywae4OTBN84fP+hA2PAlFsEbMliWPvkCXeHMG7qzUyqdymr1oD1TY
 Pxs5aBVysF3EvVUiCHECotse+wgu+ukGIjR672gco2Os2iL94d3QnEfw6UBVqf7GnMcACtRvBjK
 /C856GL1dbRq39BoA7sffH2uSG9YLPUiFcBv/z7RetKtNYsWbuwocutUx2kbl+ScIHRP7aw5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290118

Correctly summerize drm_gpuvm_sm_map/unmap, and fix the parameter order
and names.  Just something I noticed in passing.

v2: Don't rename the arg names in prototypes to match function
    declarations [Danilo]

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
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
2.50.0


