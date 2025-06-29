Return-Path: <linux-arm-msm+bounces-62998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED6DAED0B3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 22:18:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 070B61896060
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 20:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EB2723D2BD;
	Sun, 29 Jun 2025 20:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cptCQ7V/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA7923C519
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751228191; cv=none; b=I+61RMUTMtg/TPxrXJAbhlvY/UbVgxCgR3ATbx7boWEqVO1yPU5hBb3jevr4uhUj9r7GI2wEgot7wgu8yr5ftcoi0dUa0l5DZZsaNI74rZVIcr6ry1G3Ui44JKgzFUl/B0ZRL3746O4LKmWF8zFSG3yYQ+3JkO1J0E30DMs4EkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751228191; c=relaxed/simple;
	bh=yPGRVEN5atAh6PvikGlnpquu59gk3d9csrYniAxJMwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NmLWhEspAj6kjHGfukhMHb5pXhv+DnaPrDXQw21E8g/Iz+j3PQwdWaAI66NtBY7Rd55usK1+oyZog47hzcjojzLhkPJuaBQNwLlQ8jgQAlCd6jDfFZdGfqHMDJNGPC6footnFO1CdyWEFidaFqjlzeQfm31Wzdji4dXxFH0r+Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cptCQ7V/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TKFp2j027250
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ffNCZ5XDzp7
	SJXui2zRh3gHkvyLV2Hk4elpuiMMFAxg=; b=cptCQ7V/UaSf41bot/BCXpSb/O7
	zGjHRoToexfZbF9EGRuBHy6S3Qmaev5wqQHdm/ackLxP/lIyV9MA2wMZH98pZaFV
	c1cV9vPNabQcrDakkZ6wpASLRiUaQ+hGqL7d0MHg84EhiMtoQcdrhp6A8Y/u6hcV
	hxB8w0NF6PTzald/ZgoL0SOQtNjed7ZpfvTVy4EWVD6jDtqt8w0ElxJWGBSI3csc
	y4ZD+/yMvwk0XXp/NVMPonvGVK7OVoM5KFBlS0qqx1LbN8OgqhGzKbsQozpgXTVo
	0dlXAtOXA+p5iLBTVC/spC+nmowlruX/g4woWCp+NLWL/f8eQeYREpPgAaA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9jpth6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 20:16:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2356ce55d33so50546715ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Jun 2025 13:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751228187; x=1751832987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ffNCZ5XDzp7SJXui2zRh3gHkvyLV2Hk4elpuiMMFAxg=;
        b=srW5VXrG48d73pRp84kQF2Jq4GJp5acqUTSyQJGklNKVFkyvqEFYflJCJADWJH2Thd
         IEHvG+QNrTQYNgQBbz2c1ubNtAfw1SYoRid/cmAHAVY4LhFrqbPYFeSO6HfZ/ZGb2D5X
         V34yd3GBBBBRK77grWJnuyc5vnRYSzPB9d4sayx7tUcBRmj1qokjujYDYJe0uK5nHWDk
         PDFjZDsYRBgyELKqL9FDtO+yYpgEEOYhYyYLkerMv+uckOvrKzbwFKXoz2dtkJFAuZ1R
         4L2ZLcrpKzVc0E2wUbQsbrhQpJlcN4EqqmUes828XeKAv4HVS3kB+qiNGIA+P1+u8JZl
         spNQ==
X-Gm-Message-State: AOJu0Yy40HGaecplm9OdH9QMj7y09e7kysFXfOEqqlv7sU3mVnumlWid
	Wpcl+IJV+/qe7C+H4YNGG7oV3JU/+DwkUSEh5lDRQScXJfk9tYaNVTcauLLHqW/il8kd55Hx6OA
	9M5ErCA0KMy7EltxYP61DdenlhMyAecGltyTE83EpSdrg/VcyERtIcIhYdtQH1l9ZS8NJ
X-Gm-Gg: ASbGncsJMNffIFJBx1SUp6ZTJSOSf31ZwHWIbQ/WGelUMtxM+Ti8ZWb2ISZDZ2m+H3t
	VbWTkgPQ2XcEUoD/RgF3GiE1f9qksPIdVHAOo4ABDH0749DxGhz+TNPL6bRzRz7HZt4ntcU956Y
	RbpfY34XPa4uh0zL3QdeX/N/Zoez3gs+DSLf7csfTHHz/0/hFhZLmjg7cbjl+SR0jNl4AGvrsXy
	jhl9eaQA0ruXBYHVzrYZgWlFr9f5oBvHrEUESaI6rxXlDu/k6oxZv9HGA7J86lM13aHk5TVH2fY
	lp19BN/0CVAlH7w1MzJ2BxVpisV/ylvbjg==
X-Received: by 2002:a17:903:98f:b0:234:ba37:87b6 with SMTP id d9443c01a7336-23ac40dee6emr158250355ad.17.1751228187293;
        Sun, 29 Jun 2025 13:16:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7o0RW3N/i13uGyAhfRSsSBpZ5aa7CUOvpIC0IKeEOln+PijIG1fotDAm70TiEAzh7du2ksQ==
X-Received: by 2002:a17:903:98f:b0:234:ba37:87b6 with SMTP id d9443c01a7336-23ac40dee6emr158250075ad.17.1751228186812;
        Sun, 29 Jun 2025 13:16:26 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39b95csm66144605ad.139.2025.06.29.13.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 13:16:26 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Danilo Krummrich <dakr@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jun Nie <jun.nie@linaro.org>, linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 11/42] drm/msm: Stop passing vm to msm_framebuffer
Date: Sun, 29 Jun 2025 13:12:54 -0700
Message-ID: <20250629201530.25775-12-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI5MDE3MiBTYWx0ZWRfX4S+Qg72PjblW
 cd2lvxSDKGFaZASvMHg84FqFfCGCVjJurUrds2AFDNf4KEuTho2A9BQ7v/iOa7bGwQy+dXeVxAR
 FwVrH6LaKAH5PsJSX/N/UtczmdfiQCdai+TsRPVJwvbrSPHOk+6yeA9N0vOl/Zl+EagPzRXeLdL
 BtJHLVKHLBtyPBNAEisxpFzAo73BqdanoWHUVupGs4n92wzuV1/+L6n3Roi5lNYVLTt0KhN/px9
 J/hDnsaYOptC4Qg0MRxrqxvlyq2cYBhAG3bMXRY3V14BtrkvFL/0iPNWyLrR2x3jFq6s+UH+a65
 1lthjJ9xDrxYdkYPFxNQl5w+aglIEmAC2olrIcX23FDZklRQZvpURUBtX+rll3QwSWb0CvZZx9P
 TaQ3zVhtUJV4fkYAL8WvqZR1AyA9FDRqlsffbq+pWwmxf8Rnyh8bWtsGVAlnju7j/lMSA0U7
X-Proofpoint-ORIG-GUID: m0Jbp_zLUAXD62L7z34A1ABMYG1PS_A_
X-Authority-Analysis: v=2.4 cv=Tq7mhCXh c=1 sm=1 tr=0 ts=68619f1c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=HL1_eh3RQQ0Sznupcm4A:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: m0Jbp_zLUAXD62L7z34A1ABMYG1PS_A_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506290172

The fb only deals with kms->vm, so make that explicit.  This will start
letting us refcount the # of times the fb is pinned, so we can only
unpin the vma after last user of the fb is done.  Having a single
reference count really only works if there is only a single vm.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Tested-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Antonino Maniscalco <antomani103@gmail.com>
---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 11 +++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   | 18 +++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h   |  3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 20 ++++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |  2 --
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c    | 18 ++++++-----------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    | 18 ++++++-----------
 drivers/gpu/drm/msm/msm_drv.h                 |  9 +++------
 drivers/gpu/drm/msm/msm_fb.c                  | 15 +++++++-------
 9 files changed, 39 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 32e208ee946d..9a54da1c9e3c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -566,7 +566,6 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
 		struct drm_writeback_job *job)
 {
 	const struct msm_format *format;
-	struct msm_gem_vm *vm;
 	struct dpu_hw_wb_cfg *wb_cfg;
 	int ret;
 	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys_enc);
@@ -576,13 +575,12 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
 
 	wb_enc->wb_job = job;
 	wb_enc->wb_conn = job->connector;
-	vm = phys_enc->dpu_kms->base.vm;
 
 	wb_cfg = &wb_enc->wb_cfg;
 
 	memset(wb_cfg, 0, sizeof(struct dpu_hw_wb_cfg));
 
-	ret = msm_framebuffer_prepare(job->fb, vm, false);
+	ret = msm_framebuffer_prepare(job->fb, false);
 	if (ret) {
 		DPU_ERROR("prep fb failed, %d\n", ret);
 		return;
@@ -596,7 +594,7 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
 		return;
 	}
 
-	dpu_format_populate_addrs(vm, job->fb, &wb_cfg->dest);
+	dpu_format_populate_addrs(job->fb, &wb_cfg->dest);
 
 	wb_cfg->dest.width = job->fb->width;
 	wb_cfg->dest.height = job->fb->height;
@@ -619,14 +617,11 @@ static void dpu_encoder_phys_wb_cleanup_wb_job(struct dpu_encoder_phys *phys_enc
 		struct drm_writeback_job *job)
 {
 	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys_enc);
-	struct msm_gem_vm *vm;
 
 	if (!job->fb)
 		return;
 
-	vm = phys_enc->dpu_kms->base.vm;
-
-	msm_framebuffer_cleanup(job->fb, vm, false);
+	msm_framebuffer_cleanup(job->fb, false);
 	wb_enc->wb_job = NULL;
 	wb_enc->wb_conn = NULL;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index d115b79af771..b0d585c5315c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -274,15 +274,14 @@ int dpu_format_populate_plane_sizes(
 	return _dpu_format_populate_plane_sizes_linear(fmt, fb, layout);
 }
 
-static void _dpu_format_populate_addrs_ubwc(struct msm_gem_vm *vm,
-					    struct drm_framebuffer *fb,
+static void _dpu_format_populate_addrs_ubwc(struct drm_framebuffer *fb,
 					    struct dpu_hw_fmt_layout *layout)
 {
 	const struct msm_format *fmt;
 	uint32_t base_addr = 0;
 	bool meta;
 
-	base_addr = msm_framebuffer_iova(fb, vm, 0);
+	base_addr = msm_framebuffer_iova(fb, 0);
 
 	fmt = msm_framebuffer_format(fb);
 	meta = MSM_FORMAT_IS_UBWC(fmt);
@@ -355,26 +354,23 @@ static void _dpu_format_populate_addrs_ubwc(struct msm_gem_vm *vm,
 	}
 }
 
-static void _dpu_format_populate_addrs_linear(struct msm_gem_vm *vm,
-					      struct drm_framebuffer *fb,
+static void _dpu_format_populate_addrs_linear(struct drm_framebuffer *fb,
 					      struct dpu_hw_fmt_layout *layout)
 {
 	unsigned int i;
 
 	/* Populate addresses for simple formats here */
 	for (i = 0; i < layout->num_planes; ++i)
-		layout->plane_addr[i] = msm_framebuffer_iova(fb, vm, i);
+		layout->plane_addr[i] = msm_framebuffer_iova(fb, i);
 	}
 
 /**
  * dpu_format_populate_addrs - populate buffer addresses based on
  *                     mmu, fb, and format found in the fb
- * @vm:                address space pointer
  * @fb:                framebuffer pointer
  * @layout:            format layout structure to populate
  */
-void dpu_format_populate_addrs(struct msm_gem_vm *vm,
-			       struct drm_framebuffer *fb,
+void dpu_format_populate_addrs(struct drm_framebuffer *fb,
 			       struct dpu_hw_fmt_layout *layout)
 {
 	const struct msm_format *fmt;
@@ -384,7 +380,7 @@ void dpu_format_populate_addrs(struct msm_gem_vm *vm,
 	/* Populate the addresses given the fb */
 	if (MSM_FORMAT_IS_UBWC(fmt) ||
 			MSM_FORMAT_IS_TILE(fmt))
-		_dpu_format_populate_addrs_ubwc(vm, fb, layout);
+		_dpu_format_populate_addrs_ubwc(fb, layout);
 	else
-		_dpu_format_populate_addrs_linear(vm, fb, layout);
+		_dpu_format_populate_addrs_linear(fb, layout);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
index 989f3e13c497..dc03f522e616 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
@@ -31,8 +31,7 @@ static inline bool dpu_find_format(u32 format, const u32 *supported_formats,
 	return false;
 }
 
-void dpu_format_populate_addrs(struct msm_gem_vm *vm,
-			       struct drm_framebuffer *fb,
+void dpu_format_populate_addrs(struct drm_framebuffer *fb,
 			       struct dpu_hw_fmt_layout *layout);
 
 int dpu_format_populate_plane_sizes(
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 6d47f43f52f7..07f0461223c3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -646,7 +646,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 	struct drm_framebuffer *fb = new_state->fb;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_state);
-	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	int ret;
 
 	if (!new_state->fb)
@@ -654,9 +653,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 
 	DPU_DEBUG_PLANE(pdpu, "FB[%u]\n", fb->base.id);
 
-	/* cache vm */
-	pstate->vm = kms->base.vm;
-
 	/*
 	 * TODO: Need to sort out the msm_framebuffer_prepare() call below so
 	 *       we can use msm_atomic_prepare_fb() instead of doing the
@@ -664,13 +660,10 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 	 */
 	drm_gem_plane_helper_prepare_fb(plane, new_state);
 
-	if (pstate->vm) {
-		ret = msm_framebuffer_prepare(new_state->fb,
-				pstate->vm, pstate->needs_dirtyfb);
-		if (ret) {
-			DPU_ERROR("failed to prepare framebuffer\n");
-			return ret;
-		}
+	ret = msm_framebuffer_prepare(new_state->fb, pstate->needs_dirtyfb);
+	if (ret) {
+		DPU_ERROR("failed to prepare framebuffer\n");
+		return ret;
 	}
 
 	return 0;
@@ -689,8 +682,7 @@ static void dpu_plane_cleanup_fb(struct drm_plane *plane,
 
 	DPU_DEBUG_PLANE(pdpu, "FB[%u]\n", old_state->fb->base.id);
 
-	msm_framebuffer_cleanup(old_state->fb, old_pstate->vm,
-				old_pstate->needs_dirtyfb);
+	msm_framebuffer_cleanup(old_state->fb, old_pstate->needs_dirtyfb);
 }
 
 static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
@@ -1457,7 +1449,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
 	pstate->needs_qos_remap |= (is_rt_pipe != pdpu->is_rt_pipe);
 	pdpu->is_rt_pipe = is_rt_pipe;
 
-	dpu_format_populate_addrs(pstate->vm, new_state->fb, &pstate->layout);
+	dpu_format_populate_addrs(new_state->fb, &pstate->layout);
 
 	DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
 			", %p4cc ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 3578f52048a5..a3a6e9028333 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -17,7 +17,6 @@
 /**
  * struct dpu_plane_state: Define dpu extension of drm plane state object
  * @base:	base drm plane state object
- * @vm:	pointer to address space for input/output buffers
  * @pipe:	software pipe description
  * @r_pipe:	software pipe description of the second pipe
  * @pipe_cfg:	software pipe configuration
@@ -34,7 +33,6 @@
  */
 struct dpu_plane_state {
 	struct drm_plane_state base;
-	struct msm_gem_vm *vm;
 	struct dpu_sw_pipe pipe;
 	struct dpu_sw_pipe r_pipe;
 	struct dpu_sw_pipe_cfg pipe_cfg;
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
index 7743be6167f8..098c3b5ff2b2 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c
@@ -79,30 +79,25 @@ static const struct drm_plane_funcs mdp4_plane_funcs = {
 static int mdp4_plane_prepare_fb(struct drm_plane *plane,
 				 struct drm_plane_state *new_state)
 {
-	struct msm_drm_private *priv = plane->dev->dev_private;
-	struct msm_kms *kms = priv->kms;
-
 	if (!new_state->fb)
 		return 0;
 
 	drm_gem_plane_helper_prepare_fb(plane, new_state);
 
-	return msm_framebuffer_prepare(new_state->fb, kms->vm, false);
+	return msm_framebuffer_prepare(new_state->fb, false);
 }
 
 static void mdp4_plane_cleanup_fb(struct drm_plane *plane,
 				  struct drm_plane_state *old_state)
 {
 	struct mdp4_plane *mdp4_plane = to_mdp4_plane(plane);
-	struct mdp4_kms *mdp4_kms = get_kms(plane);
-	struct msm_kms *kms = &mdp4_kms->base.base;
 	struct drm_framebuffer *fb = old_state->fb;
 
 	if (!fb)
 		return;
 
 	DBG("%s: cleanup: FB[%u]", mdp4_plane->name, fb->base.id);
-	msm_framebuffer_cleanup(fb, kms->vm, false);
+	msm_framebuffer_cleanup(fb, false);
 }
 
 
@@ -141,7 +136,6 @@ static void mdp4_plane_set_scanout(struct drm_plane *plane,
 {
 	struct mdp4_plane *mdp4_plane = to_mdp4_plane(plane);
 	struct mdp4_kms *mdp4_kms = get_kms(plane);
-	struct msm_kms *kms = &mdp4_kms->base.base;
 	enum mdp4_pipe pipe = mdp4_plane->pipe;
 
 	mdp4_write(mdp4_kms, REG_MDP4_PIPE_SRC_STRIDE_A(pipe),
@@ -153,13 +147,13 @@ static void mdp4_plane_set_scanout(struct drm_plane *plane,
 			MDP4_PIPE_SRC_STRIDE_B_P3(fb->pitches[3]));
 
 	mdp4_write(mdp4_kms, REG_MDP4_PIPE_SRCP0_BASE(pipe),
-			msm_framebuffer_iova(fb, kms->vm, 0));
+			msm_framebuffer_iova(fb, 0));
 	mdp4_write(mdp4_kms, REG_MDP4_PIPE_SRCP1_BASE(pipe),
-			msm_framebuffer_iova(fb, kms->vm, 1));
+			msm_framebuffer_iova(fb, 1));
 	mdp4_write(mdp4_kms, REG_MDP4_PIPE_SRCP2_BASE(pipe),
-			msm_framebuffer_iova(fb, kms->vm, 2));
+			msm_framebuffer_iova(fb, 2));
 	mdp4_write(mdp4_kms, REG_MDP4_PIPE_SRCP3_BASE(pipe),
-			msm_framebuffer_iova(fb, kms->vm, 3));
+			msm_framebuffer_iova(fb, 3));
 }
 
 static void mdp4_write_csc_config(struct mdp4_kms *mdp4_kms,
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 9f68a4747203..7c790406d533 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -135,8 +135,6 @@ static const struct drm_plane_funcs mdp5_plane_funcs = {
 static int mdp5_plane_prepare_fb(struct drm_plane *plane,
 				 struct drm_plane_state *new_state)
 {
-	struct msm_drm_private *priv = plane->dev->dev_private;
-	struct msm_kms *kms = priv->kms;
 	bool needs_dirtyfb = to_mdp5_plane_state(new_state)->needs_dirtyfb;
 
 	if (!new_state->fb)
@@ -144,14 +142,12 @@ static int mdp5_plane_prepare_fb(struct drm_plane *plane,
 
 	drm_gem_plane_helper_prepare_fb(plane, new_state);
 
-	return msm_framebuffer_prepare(new_state->fb, kms->vm, needs_dirtyfb);
+	return msm_framebuffer_prepare(new_state->fb, needs_dirtyfb);
 }
 
 static void mdp5_plane_cleanup_fb(struct drm_plane *plane,
 				  struct drm_plane_state *old_state)
 {
-	struct mdp5_kms *mdp5_kms = get_kms(plane);
-	struct msm_kms *kms = &mdp5_kms->base.base;
 	struct drm_framebuffer *fb = old_state->fb;
 	bool needed_dirtyfb = to_mdp5_plane_state(old_state)->needs_dirtyfb;
 
@@ -159,7 +155,7 @@ static void mdp5_plane_cleanup_fb(struct drm_plane *plane,
 		return;
 
 	DBG("%s: cleanup: FB[%u]", plane->name, fb->base.id);
-	msm_framebuffer_cleanup(fb, kms->vm, needed_dirtyfb);
+	msm_framebuffer_cleanup(fb, needed_dirtyfb);
 }
 
 static int mdp5_plane_atomic_check_with_state(struct drm_crtc_state *crtc_state,
@@ -467,8 +463,6 @@ static void set_scanout_locked(struct mdp5_kms *mdp5_kms,
 			       enum mdp5_pipe pipe,
 			       struct drm_framebuffer *fb)
 {
-	struct msm_kms *kms = &mdp5_kms->base.base;
-
 	mdp5_write(mdp5_kms, REG_MDP5_PIPE_SRC_STRIDE_A(pipe),
 			MDP5_PIPE_SRC_STRIDE_A_P0(fb->pitches[0]) |
 			MDP5_PIPE_SRC_STRIDE_A_P1(fb->pitches[1]));
@@ -478,13 +472,13 @@ static void set_scanout_locked(struct mdp5_kms *mdp5_kms,
 			MDP5_PIPE_SRC_STRIDE_B_P3(fb->pitches[3]));
 
 	mdp5_write(mdp5_kms, REG_MDP5_PIPE_SRC0_ADDR(pipe),
-			msm_framebuffer_iova(fb, kms->vm, 0));
+			msm_framebuffer_iova(fb, 0));
 	mdp5_write(mdp5_kms, REG_MDP5_PIPE_SRC1_ADDR(pipe),
-			msm_framebuffer_iova(fb, kms->vm, 1));
+			msm_framebuffer_iova(fb, 1));
 	mdp5_write(mdp5_kms, REG_MDP5_PIPE_SRC2_ADDR(pipe),
-			msm_framebuffer_iova(fb, kms->vm, 2));
+			msm_framebuffer_iova(fb, 2));
 	mdp5_write(mdp5_kms, REG_MDP5_PIPE_SRC3_ADDR(pipe),
-			msm_framebuffer_iova(fb, kms->vm, 3));
+			msm_framebuffer_iova(fb, 3));
 }
 
 /* Note: mdp5_plane->pipe_lock must be locked */
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 761e7e221ad9..eb009bd193e3 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -274,12 +274,9 @@ struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 int msm_gem_prime_pin(struct drm_gem_object *obj);
 void msm_gem_prime_unpin(struct drm_gem_object *obj);
 
-int msm_framebuffer_prepare(struct drm_framebuffer *fb,
-		struct msm_gem_vm *vm, bool needs_dirtyfb);
-void msm_framebuffer_cleanup(struct drm_framebuffer *fb,
-		struct msm_gem_vm *vm, bool needed_dirtyfb);
-uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb,
-		struct msm_gem_vm *vm, int plane);
+int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb);
+void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb);
+uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane);
 struct drm_gem_object *msm_framebuffer_bo(struct drm_framebuffer *fb, int plane);
 const struct msm_format *msm_framebuffer_format(struct drm_framebuffer *fb);
 struct drm_framebuffer *msm_framebuffer_create(struct drm_device *dev,
diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 6df318b73534..8a3b88130f4d 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -75,10 +75,10 @@ void msm_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m)
 
 /* prepare/pin all the fb's bo's for scanout.
  */
-int msm_framebuffer_prepare(struct drm_framebuffer *fb,
-		struct msm_gem_vm *vm,
-		bool needs_dirtyfb)
+int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 {
+	struct msm_drm_private *priv = fb->dev->dev_private;
+	struct msm_gem_vm *vm = priv->kms->vm;
 	struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
 	int ret, i, n = fb->format->num_planes;
 
@@ -98,10 +98,10 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb,
 	return 0;
 }
 
-void msm_framebuffer_cleanup(struct drm_framebuffer *fb,
-		struct msm_gem_vm *vm,
-		bool needed_dirtyfb)
+void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
 {
+	struct msm_drm_private *priv = fb->dev->dev_private;
+	struct msm_gem_vm *vm = priv->kms->vm;
 	struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
 	int i, n = fb->format->num_planes;
 
@@ -115,8 +115,7 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb,
 		memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
 }
 
-uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb,
-		struct msm_gem_vm *vm, int plane)
+uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane)
 {
 	struct msm_framebuffer *msm_fb = to_msm_framebuffer(fb);
 	return msm_fb->iova[plane] + fb->offsets[plane];
-- 
2.50.0


