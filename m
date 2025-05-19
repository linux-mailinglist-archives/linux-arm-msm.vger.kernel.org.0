Return-Path: <linux-arm-msm+bounces-58523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 294C8ABC670
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 19:58:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA7544A36FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 17:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B81528B40D;
	Mon, 19 May 2025 17:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YjjVgnxj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB9B28AB12;
	Mon, 19 May 2025 17:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747677293; cv=none; b=epZ+wrFZH/BEtaEIQ5/ZA0XzLffjttJ3/zOKFlhdEvl588KF6OMTYz20nBiKgUFLS6A0j9lVK0XlmHBE8pKCHCOXSlvvbmnm5et1fhJo2dolgtg/TEs2eQJkHvl3EoR3MtJWp/TF/00ef41F7h1CsX6WeEw8dmyIQdH0jBdZSmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747677293; c=relaxed/simple;
	bh=V8c42ToE53u4EzIBKNHkOhDJybrEWeX5QGoGp8mh/ZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u4fL2NH+IbkpoYrQkkoD3Lr0E1D6UImdl0MplmyvQBgmjGCGXiYVCbwa+wqm7UX31hVKSRAcK3oEHQsuNhhNFulyJvQZYP8Rck4oh9QiM1YVnP8hYSZS/1UhPGtLw3UQ62SGXIJS3+wu4swnJLVkLH+UlB64wvWuJiw6nTFgKqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YjjVgnxj; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-30e9b0f374fso3267579a91.3;
        Mon, 19 May 2025 10:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747677291; x=1748282091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5PtOzJz3dhv1LS9QV7CQZ1khNGE/TmCpgM2HiFcWd9g=;
        b=YjjVgnxjDD9qNLzesxzd5Qg1t6V5vwDgD2ziWCIeDXuElMVxMvB7mGqBr1gmMFu557
         PJ7MrLSJBihI377AZSXAmvdRZ+qsOwBI0svyN07AvCBo57cEeixH/cT31fx9kSmRpOXf
         iTDb2Ukq13W7nFVzXn2fttCKrsk8vCTNTiXG+QUlIiz2ZxbBLyAZRYVPwuzS6ruYzbVQ
         4fJb73nNATHbdIoI2K2EN17jT64p0GPhheeD6OJxz56LcOVu4XPebNS8l+xickoAck8t
         Fy0s+Dd7s2TFcju46yPCqQIPdmhVHfPesw3JjDXsnWgePq3nNoNIKCjnnk0Xrztwy0H+
         h/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747677291; x=1748282091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5PtOzJz3dhv1LS9QV7CQZ1khNGE/TmCpgM2HiFcWd9g=;
        b=igHDzMS1LVRZuxu6JHHf+PJJlVD7afu5FOqU0xuZv63+7SwW29FsuXF4ymJfWtSxK+
         CfchJVh2DTkMbVRtUf/NLfzRK0ApB6ayCVPxdCGT569yQrlzUwCwn/lsRYzsU5kRIF7p
         DsbPfbo+cyNm+dWMlZKpXRece+NGJiYA7ht2gAcmygjR6RYAgaDn2bqVL040EjuP3WKc
         bsbvBfzyKHI2+ytrmsLB7SxRTzSIGVjGCNi7UbuRu4lixjzgMrBxwfv0viSfT/FAWqtA
         SjbS7neXmwC8kdZFIVGePBJUiL9XxFmIueiMrI48uxFCuIquT4IBuOrS05YUIWj5wpcr
         dxyw==
X-Forwarded-Encrypted: i=1; AJvYcCUJqrcrXWZVqeIdX/tnr+RocuzdbUU5+VKtNLOaksXDOsOvNuIwu1ebT1Ju0GiizOQk1THTrY89O0AeTq5E@vger.kernel.org, AJvYcCW7Equqvz+zLLEWBNyO4tL5mB7Qtz75hSAMknCxY6SEe23f3RJX5PzTAzlIT58TL7oyG0Sorb/pIievPfqA@vger.kernel.org
X-Gm-Message-State: AOJu0YwwejXM/s9HKblAnSkAehn7EROkHffOwm9XDkQRiR2IhI1m0vTW
	0XQE0OaDNx9IAYSQ3kjN8HyF3ZgtU0SpbraToRIC/JvougQzyxYe5Rro
X-Gm-Gg: ASbGncsFxSRKMUUz7AmTX/f3aZqjH58ycuD+KPA/I0ZBE1ryaLflgbgfoX4pLL1cm5u
	tqKH6sMc2S6ep/3IEXoGYec0OyKez5NOhlEzquvwxW0PnoQBYv8WhvM2Ux4uohBmP+rl0QZ7/1O
	QyVPV6+cypOJUte0Odx+VoAwzawEHWYSgIUDdwE6GCqdH1GEHIR84JqA2hzbNWCIUJ6MhulJCCn
	FxSqkyJcT3+MFkVx/nxPaNav3dF9inIQH/BUKUdzmK6zUihIPyl8M7roxsVhDf2ar3q6dbqOZ/F
	AS7ILDYmaVBH1qaZdjIHdXdARiNoem0iVB/ymDs3sfz2hhVaLrMxwELicCW2WOglvMqfV4Fu4nN
	Sn4XPpj1gQkzv9cFZFQNFVtR9Jw==
X-Google-Smtp-Source: AGHT+IHpowPNebnU683NUJPLBntMDJlNddUI7cpcwZOKdAqHjpaQb88DRHEFLqSJ3HYORfJyQtdfDQ==
X-Received: by 2002:a17:90b:3905:b0:2ee:5bc9:75c3 with SMTP id 98e67ed59e1d1-30e7d501dd0mr18086643a91.5.1747677290931;
        Mon, 19 May 2025 10:54:50 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e833da84csm6741686a91.10.2025.05.19.10.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:54:50 -0700 (PDT)
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
Subject: [PATCH v5 12/40] drm/msm: Don't close VMAs on purge
Date: Mon, 19 May 2025 10:51:35 -0700
Message-ID: <20250519175348.11924-13-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519175348.11924-1-robdclark@gmail.com>
References: <20250519175348.11924-1-robdclark@gmail.com>
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


