Return-Path: <linux-arm-msm+bounces-52006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 942A3A692A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 16:13:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9EC08A61C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 15:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 888C422171C;
	Wed, 19 Mar 2025 14:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GhPx2u2i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0009E221564;
	Wed, 19 Mar 2025 14:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742396170; cv=none; b=DWa9sK50p0LddgjlN7Zp2DfbxTZpnXk42a5H1LuMWytDMVBeyF6OuPPv6v+8+nVdAh8aE8c6S7k6WdlgITEeTa7q7Gb/SYRFEzgYs4fS2pmiQ4OrXn0Oy8A2MyCMkAegulRz2OWDQa23rP+lqjv9Po6FQaIIKWuH+Bq3qeUqi6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742396170; c=relaxed/simple;
	bh=1y5twiBp7POs0SWhseS4srdcj4CBuZy/9jxK1Aa6mhc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=euQRtgw4tlX0+uzmbCUefwZ/P+spSgRGCuifxpHSPpJ9AWjamoA6VSWL/XnZmvXK0DA1PFMF5MysezT8NbxfDBYV4n/Lwkg4i4nyFAwH9kZaN8FovhmouPeP+ibD0IA+136+p5v+xiZEqSUx0ZyjoinT+YhzfLaCRVWpPv503zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GhPx2u2i; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-223f4c06e9fso14559835ad.1;
        Wed, 19 Mar 2025 07:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742396168; x=1743000968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syWTjTZ+GTk6yKure/ngwPwmYsSOIjhNb/4/wpDEG8U=;
        b=GhPx2u2iPTfaZns5/2FckqoVQrIbxfooeZPorolaqKpistKsgg7Ht038Cp5rKZkeUG
         0mdDN9xiaNoewkPXRBuyopWQveUT7v3V5ZcuZPo9ZOSG9zWSLuLXCzNqfAaXqmM/tk5P
         jKrC67eVUvudJKmZljdiYaVjq8574T4fogMyWNuPDInkg+5DhfHRf8ZEbnv/nTU8T5J3
         GQzWAfxvIJQRtZT50oPV13Jb26Pd+8pedandHUiyko4ORqseV+0Y+eQiOqtqlK1KJwTE
         GzeOzP0rCf1rKn7g2ReMknZgwk7qITfD0B4FS/zg4qEPTCGs97q8CtrWEZ15IDNIap7G
         uLQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742396168; x=1743000968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=syWTjTZ+GTk6yKure/ngwPwmYsSOIjhNb/4/wpDEG8U=;
        b=vIYpIvu4ncatqrE6bVQd0oX167H8SSJDBkedO9veUOn3+9lDHwKaWDRi+BeYH+uJRk
         IWCikrjDoC46RB7r7m63NIbfGUttoQO10VtowHedtAOmOnGQBgUzVB9D64rtfMJsZivN
         WbUMi9qPFiW22iGUhmygMPjwFvKcfHOXFmgq3Ghf+Xg9tYQv7Y/Cf9yk01eDfmwOgc3G
         moFPv9qoazNzyoEzLMxl1c+rLlfIP8DyxKtEE43Cj9TgHXGQL1Y21F60YglH2Qe0Yqc2
         Q8WsHMZzA4pvM+cENl8svISbAo+ZH+lix33ERkOAu2aTikm2DvDKBz81UbqqBXPKN5b3
         b7uw==
X-Forwarded-Encrypted: i=1; AJvYcCXNY5/QDhO/LdbznG7Hs4ctsTzjAnPWCUq1YYUxfz8qx6dZR0mkgKi45IeW/x2uuwBfDmTZnJN3xP0U50+7@vger.kernel.org, AJvYcCXrMJwTBOSlnX++V8o4KgrH/BXPuDQPAfyQj15FUZFZh+cqLa453mAO0WCcaCKRasZYxIIQzZH7LGa6m8CU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrv0DLUkZQYtZYr4OAqU59KfKRc/iMqHE7X+BCDZYNgJXirY1E
	Vs5zZ0F2L8HlCduzUf8rCZt4qsLstFaIpi0qqKQdOMy9T1axUnCD
X-Gm-Gg: ASbGncuqU/5dgMWGw3kk3e9D6rSa5MUm77k7/Rs7xNUCosUD57FG/g1+9sdbAfW20W7
	ZUbwYtlPrufhYLx93jgM2NJGJJMBymnESWm9LvAg1HmNAn10OQH7hjDlZzWSnKbiBg/+FmKy/cS
	oiUWLApT34FwFfg8FMbEpOlJeiAPF7LSTt61Cz3o+i6KzGUjX6PUeMk1rbbBtfLF5ovMGE1/Itz
	ljrB4DoRXZGvyMqyIb30kd8trtXwOgLx8wBCBS9r7fmwCj6xcCf24G13vHjbnL8RX5kRMqgDcM5
	uGXmJXxSOclY5xOCxw3nrOEYg/ZkFXhoJ/HJpP+xmigH0H/+5KO3KM2+/8kPISPP+H1JSd2HJLH
	iulIOdy1wJWmNvvuek6MQY/S9jpFdDQ==
X-Google-Smtp-Source: AGHT+IFcSZWcMU2Da/pZDo0aJtfjbW4/N0GwYAaFsHrjzlIK0U6ajFL0qhqT1uK3MnFdyHG3KtGiUg==
X-Received: by 2002:a17:902:c950:b0:223:fb95:b019 with SMTP id d9443c01a7336-2262cc4a926mr120904215ad.24.1742396168054;
        Wed, 19 Mar 2025 07:56:08 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a448fsm114995215ad.72.2025.03.19.07.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:56:07 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 33/34] drm/msm: rd dumping support for sparse
Date: Wed, 19 Mar 2025 07:52:45 -0700
Message-ID: <20250319145425.51935-34-robdclark@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319145425.51935-1-robdclark@gmail.com>
References: <20250319145425.51935-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

As with devcoredump, we need to iterate the VMAs to figure out what to
dump.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_rd.c | 48 +++++++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index edbcb93410a9..1876b789c924 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -372,25 +372,43 @@ void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
 
 	rd_write_section(rd, RD_CMD, msg, ALIGN(n, 4));
 
-	for (i = 0; i < submit->nr_bos; i++) {
-		struct drm_gem_object *obj = submit->bos[i].obj;
-		bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+	if (msm_context_is_vmbind(submit->queue->ctx)) {
+		struct drm_gpuva *vma;
 
-		snapshot_buf(rd, obj, submit->bos[i].iova, dump, 0, obj->size);
-	}
+		mutex_lock(&to_msm_vm(submit->vm)->vm_lock);
+		drm_gpuvm_for_each_va (vma, submit->vm) {
+			bool dump = rd_full || (vma->flags & MSM_VMA_DUMP);
 
-	for (i = 0; i < submit->nr_cmds; i++) {
-		uint32_t szd  = submit->cmd[i].size; /* in dwords */
-		int idx = submit->cmd[i].idx;
-		bool dump = rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
+			/* Skip MAP_NULL/PRR VMAs: */
+			if (!vma->gem.obj)
+				continue;
+
+			snapshot_buf(rd, vma->gem.obj, vma->va.addr, dump,
+				     vma->gem.offset, vma->va.range);
+		}
+		mutex_unlock(&to_msm_vm(submit->vm)->vm_lock);
+
+	} else {
+		for (i = 0; i < submit->nr_bos; i++) {
+			struct drm_gem_object *obj = submit->bos[i].obj;
+			bool dump = rd_full || (submit->bos[i].flags & MSM_SUBMIT_BO_DUMP);
+
+			snapshot_buf(rd, obj, submit->bos[i].iova, dump, 0, obj->size);
+		}
+
+		for (i = 0; i < submit->nr_cmds; i++) {
+			uint32_t szd  = submit->cmd[i].size; /* in dwords */
+			int idx = submit->cmd[i].idx;
+			bool dump = rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
 
-		/* snapshot cmdstream bo's (if we haven't already): */
-		if (!dump) {
-			struct drm_gem_object *obj = submit->bos[idx].obj;
-			size_t offset = submit->cmd[i].iova - submit->bos[idx].iova;
+			/* snapshot cmdstream bo's (if we haven't already): */
+			if (!dump) {
+				struct drm_gem_object *obj = submit->bos[idx].obj;
+				size_t offset = submit->cmd[i].iova - submit->bos[idx].iova;
 
-			snapshot_buf(rd, obj, submit->cmd[i].iova, true,
-				     offset, szd * 4);
+				snapshot_buf(rd, obj, submit->cmd[i].iova, true,
+					offset, szd * 4);
+			}
 		}
 	}
 
-- 
2.48.1


