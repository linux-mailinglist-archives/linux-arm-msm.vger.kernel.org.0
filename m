Return-Path: <linux-arm-msm+bounces-57912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E03FAB73C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:59:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 331DE16B009
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 17:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30EC428A71A;
	Wed, 14 May 2025 17:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OqbgB4Kz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACFE28540B;
	Wed, 14 May 2025 17:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747245396; cv=none; b=FEbyTUHBMI0/Pc629G7mRbEvQ4IK5p8865MHTP6r9ydzckSAvOEZQoAE8wDkH8M4FdceOTb944GUk8Olf3GD9osC3zVejCu2SQiTEZWA+prItXpsUltbr7dTOMVHbk442Yl8ow2GN9VIIba60ti+1bZPPBqXYEgWXTYmDCJuATA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747245396; c=relaxed/simple;
	bh=V8c42ToE53u4EzIBKNHkOhDJybrEWeX5QGoGp8mh/ZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GUUnTN3NPQeotOUHcYCklJglx0KzmSO69VEn9n7lQ/jrv5wpJZuW/S+wO47MFWbfqSjGfMFEbGDiMrX0P1kTmad8HsMohMtmcVlONgGNuzc/KG1+bJnPQBowBt0y4UjV+p9Op3RJ39NDvLmKyN4R3wkKAvtO2m8/0dVQw9YeIs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OqbgB4Kz; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so190527b3a.0;
        Wed, 14 May 2025 10:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747245394; x=1747850194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5PtOzJz3dhv1LS9QV7CQZ1khNGE/TmCpgM2HiFcWd9g=;
        b=OqbgB4Kzg/xdGA2hDy9QKY2vfU8CjjTITpFEWc6CVwYW0YbPibJBD9DK3d8m2fnX72
         ZQb32YAKnFHe1dG/dUWdJnqVWluFNPIwYv+R4DxxedN4zewBxoYFyuDOCjwX0p+baZ/q
         3abZgFvih5dleyR1cMFa9jXgWSf3SoMikHk9QZZkENy3r5Xwbz4pYHzaGnuJLfVIxaJK
         7TWZdqW2Eg4Y76lZDI5BFWbp6rpb3Twe1/Hfczlj0MliZbLQVuMQTo5nVkDIw3506dCr
         BlMHXoosSiyZr6wuu3oBlCI4ZGNgih5zq8fJVQKPd5Qc6b0BBWwOmR8JCJcKbkfnBAKJ
         l1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747245394; x=1747850194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5PtOzJz3dhv1LS9QV7CQZ1khNGE/TmCpgM2HiFcWd9g=;
        b=uRRCAKVeDIhXn0ywrAVKJRyjS146QED/N7//w6nE89488P23a368s8cNbLGKDuwosj
         BHEvgDZYmMqZ2rY5ksYc4U06emefurc6zKMi3UsK5zeihrG+JOKwEyHq/o3W36wiiitD
         V3xhRjM7cwli1flyaxWP7fyxr6RLl4CFJvhn/pO6pGB1FsNTqzEJH58GfqX2I1cykT8m
         e6TR8IfUPtlwgE3BJ0lB6JUem7InTWp8SGvA7mxbX9/DgmkpN1BfJsc7mGofbagWiYsi
         aXlZfCFboP7jyV/73p1yhsq4xRy7Ip0fAamPT3cZMvvDrkJjMG7tksvgrpLTZMf31wby
         tZeA==
X-Forwarded-Encrypted: i=1; AJvYcCXY/x/DsIEVCgU6INr5RHO7HeOqz+FI6cP284ZFvzITJjHvffOX/DmAnJzqejFIWi2K6Wp5SAWFFg1lWGfD@vger.kernel.org, AJvYcCXzHyMZwnEXeuDwnDizH0ldzL2XuT1bKQA/C/X7kiaHenxRgnhC3g5o/946QtN19VUN1Egnus4xNJRfYa5Q@vger.kernel.org
X-Gm-Message-State: AOJu0YzxMhkUsO+PRQReEEa1q+laJ6k1M95tQCBSxQxsMokmNtvw5008
	QZanw23e9EepD3MN7fzCFdOPvNm28gxDsSymjj309uQxM5+CciiO
X-Gm-Gg: ASbGncsc88JdGT05lY7S29eE7SWzGoP0OlWgdOVm1D5s38wBvbqQVtjBxVYcV06wAC0
	PaFT2COXpvnB1J58W7iLcEPPU16yC6pVvkKDdxzkPiRMunj9OyU1fys0Rlr0p6wd2V8Ag38I1yg
	MR6MolbxcOP97MIoR3TsFIEj5cJv+LGX5Xa1FHwDTrhfOhJxfOpPq3RLCWfaePAJkLFe42GT4CZ
	CWyZsUsLCQwAOqtIqk1sxDUcBJjvsK/3d6wUfrNtwmIM+P6zF2MfSFsPUdl7ygZSnmPqCVAOHat
	cvY68cx4rO9V0qaWjZRloI8rsMxdsQT3isZnUFz619r5r4I6cEkMwWr3g/twHnY5OBcbVFkpymQ
	EYtgalug+oGXI6hCcNHT2K39bVA==
X-Google-Smtp-Source: AGHT+IFjYrjVteYwXMT42fev71TvPXfnsKs9wRFlle4mc7tfIqXVcQzNh2N4X+20ZqWAPV8hLo3K2A==
X-Received: by 2002:a05:6a21:9999:b0:1f5:591b:4f73 with SMTP id adf61e73a8af0-215ff16e836mr7109817637.34.1747245393759;
        Wed, 14 May 2025 10:56:33 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742522ce92fsm7188374b3a.49.2025.05.14.10.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:56:33 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 12/40] drm/msm: Don't close VMAs on purge
Date: Wed, 14 May 2025 10:53:26 -0700
Message-ID: <20250514175527.42488-13-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514175527.42488-1-robdclark@gmail.com>
References: <20250514175527.42488-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Previously we'd also tear down the VMA, making the address space
available again.  But with drm_gpuvm conversion, this would require
holding the locks of all VMs the GEM object is mapped in.  Which is
problematic for the shrinker.

Instead just let the VMA hang around until the GEM object is freed.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 4c10eca404e0..50b866dcf439 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -763,7 +763,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	GEM_WARN_ON(!is_purgeable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, true);
+	put_iova_spaces(obj, false);
 
 	msm_gem_vunmap(obj);
 
-- 
2.49.0


