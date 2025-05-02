Return-Path: <linux-arm-msm+bounces-56550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B3CAA783F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 19:09:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F2447A8E91
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 17:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 174C2267713;
	Fri,  2 May 2025 17:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dj/ChNLK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A2126A1C1;
	Fri,  2 May 2025 17:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746205699; cv=none; b=r3r8+5l6F7T9sNqmRjGDAqoRwUdA8qAoO02mVeg0h+WbBvoJ+e2hHjDp7V9NsCaA07Zonc1b+skg+m4pxPJrwIU+UFa1/AqYsHLOs6r5rwA8pcbtBsFKMuXvlkujgyUehXDhBRlb9FuASqX7unIUfTNCro6YtOKVK8Zy19WlWpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746205699; c=relaxed/simple;
	bh=V8c42ToE53u4EzIBKNHkOhDJybrEWeX5QGoGp8mh/ZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=le3fVBbSlVVl1VuHaFNbKnBVMnixq6+E1vxlCbmjuuJ8jM8Agd/mWbyaRa7lv5LEe8NcpzpDxEawIQRAwjtV3U9LSGoTqKG/I9GjVgXJAVpvmReom2TECOguuesTO5Xul8UUH6T33Hc831FLnHxCwl18LIbJ53Ybh4yTBmk50Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dj/ChNLK; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b1a1930a922so1681712a12.3;
        Fri, 02 May 2025 10:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746205695; x=1746810495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5PtOzJz3dhv1LS9QV7CQZ1khNGE/TmCpgM2HiFcWd9g=;
        b=Dj/ChNLKpZlAzudGowd47EchTYW9V+cIRRh/Ry8VYWWu7hSdolh29PPXOngycWgct8
         Z1UvJSEpxOBUQy5KwDV7sGTtC5DTn76+yXYJngOLE3pVCXq2RVothT2C05Ebzv6WPnIe
         2jdccQHgwobl+csDVHVi/H0Qu1SS04JqEEqC4JL29y2p8MozLeuqzrUtZ/ci7yMcg2J9
         /fflJ245EbBiFPmuBf90F80jw7Z4NexZpP0peCxSEdTuL1fGmO4mMAQAmNrNQV7yHzMU
         9QCT+O/V6VWaxJDcBD0FDlbvS4muQ2x2JlpDhUxnWtX8ddrRfHhrUuTxdsLybL8D0QNB
         su8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746205695; x=1746810495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5PtOzJz3dhv1LS9QV7CQZ1khNGE/TmCpgM2HiFcWd9g=;
        b=A4OuW3iHr7HbqFfcu9WDGNGPzOLtgiSp8+TlOid2gwMswdqfD0kM9RjnK9U6Ny8vuu
         CknTdqj4RBv+W2wY4cSC0UMoRhfj0tl00wUFtXXjL2Lut46VxRzPtjngRyQvegB+YVrm
         Zpj4+gbF87tYZZc09eEBxzomTfcp41MiEaiH2rHxgWUNPGkenGSeeS+mFFc+vQGm6Hh3
         snoHD5TIfcDn4pvkD/MTZt1CqJlRfi10x/v0n9NOlAjPmNQwaQ6gaSWcCljtZ8Km90Kt
         9qYQlCEYcP5qLufVJkIe+SxDKMecJE8dLmb2/MQCgFZNO9z/YbHPnT5TdAM1sMwZBhF/
         sCPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUhpcLE4B+bM2JyXuqdb0U45OyRpyDrmGDnTM2d31bUc+SDVOmpd5SMcg/bN2dbhDxTaB2xnRVAgQMx/ZW@vger.kernel.org, AJvYcCW9FGVBk6uRQdZGuS26btf4uL4coMgBS1YpjoEghSzhoG4gVxq+T2fPuTXzin57ylbjxsyC6MiZkC8Gj+tO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/4D1r67nKbcPP+lIPDX3Pq1WHHDW+AUgw1oyLTKTPjufQCFIl
	8r0pa6Z1z55GMOn8SDwTEUZ/GdtFwVWWsFVqTYIFP7iWP7c8ikmZ
X-Gm-Gg: ASbGnctsUmqRtnzoFZ9rlxIaT39FmCnkypSB8y4c5NrOB/PEbfXjJpJFEqzm3JFdXaF
	ocAHDbX+7LwBrWYjCkhe2XQ/X4VMK3CCZMCmroBcaMvgDVSBFlT+xNQII63EZVh0XQPdEIj9rDG
	CGoaRJ3oA1/6KszDlvruIE8fA7iy9+GMxw8kc6SdnSqgyfxju+PkrQ9EGjvBoMuZrokaBkiUAuQ
	ZMrFbHAat2ePRq1yDidiju8HvKorU8hWDC1pPlEEHUdIL5zx0qGkny9IS1msnWl8WAvgPZqb3kc
	529GGmF/CPlLk5lRwG0CD0yaeuO+shrVoA+MEDjVQ3FxCyiiNi3uuQqgC4UQhSPsJbm4b1Nuo7p
	UzJPQgF78Rne4r7o=
X-Google-Smtp-Source: AGHT+IEV6072yDB1x80AxlO1aLc1UORrnn0sL6jFnqhqEJMjlD4zz10B6ZPHsaG9im4IGER8ZuKyZw==
X-Received: by 2002:a17:90b:2ed0:b0:2fc:a3b7:108e with SMTP id 98e67ed59e1d1-30a5adf7bc5mr79832a91.4.1746205694820;
        Fri, 02 May 2025 10:08:14 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4745f93asm3276787a91.3.2025.05.02.10.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 10:08:14 -0700 (PDT)
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
Subject: [PATCH v4 10/33] drm/msm: Don't close VMAs on purge
Date: Fri,  2 May 2025 09:56:37 -0700
Message-ID: <20250502165831.44850-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502165831.44850-1-robdclark@gmail.com>
References: <20250502165831.44850-1-robdclark@gmail.com>
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


