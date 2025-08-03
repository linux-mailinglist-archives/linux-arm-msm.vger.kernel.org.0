Return-Path: <linux-arm-msm+bounces-67559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C6BB19285
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 06:07:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12F37189A299
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 04:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F83289E31;
	Sun,  3 Aug 2025 03:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMM/8ast"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02130288CB6;
	Sun,  3 Aug 2025 03:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754193579; cv=none; b=kTHnpHGL7Z8vsp+dYPUwM/X+z6+B6YZgl/VH+uw5JrI+Cbmlt/Ch9TPQm77ztXPGLMmBELwuqpn8kDF6Nk7r3deYFbV6I+l57Wd479azcFwfIncJTDo35b7ee1sgNCetbmttuKD6E/jyncswGieyLAeRL3+Ug4UvUsyubu5k+jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754193579; c=relaxed/simple;
	bh=m6Xg+//mj9dpGiOrfICOJC0Zi1POUDB8RUeuevn2i4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZaqcNyLR2GiR4qjJebg6BUjlw6Rt3vDBQKj4f4qiJW4IqOOBc7MZh7OIttcjz3dYo1rGLPS4Dwx6X2PuC6iBn0A4y/vWdj5V2I/WfvnVmwD9iPr0ektH/CMIOck9eQQoZiCaFL3LkQJLpKqVXF3VrTEpKJ/KlIl0jFcKp0G/dpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMM/8ast; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3e3ee9c7815so14653695ab.3;
        Sat, 02 Aug 2025 20:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754193577; x=1754798377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QFh2RZochPrtpmKEJNCfPiOKK4EQdlmU3N2ti5dUWmM=;
        b=jMM/8astZLMCh7zI6U6Le/a6mF4Gc+rLirAmGCi6Oom4Bx9Bf2x9xV7ah+C0sEqcMt
         o/rMXV3oTsMYvFAuP0vD3NBrfRz+DncyYem1pKNt7pXcalXdy2mDxL64JF/zMP707DU1
         TLdcmHRRODWAfTVZSMRgJVEEmi+p03N3wsOr8LBL/VmB4mXboQ9GGXjU1sSB2L+4Orzj
         mZQlyA6jup9vVCWKLSZTDv1gxj6XvRop+sJarC1+kdGtRF6dLiGIRdeQSlrU4HGHGaDG
         uHZx1x9CrWuWzn2oO+1PtGaH3V4uhv/ehVPRrw0TvH14wTmUmp4LuNNklnrRgPgT7tLw
         zugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754193577; x=1754798377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QFh2RZochPrtpmKEJNCfPiOKK4EQdlmU3N2ti5dUWmM=;
        b=tTxYbzxZDEwJvFvtf7LZbwANKxzzT/U+/9LoZCfNVdcrM2nNdQVVZbOY2EKzQYE/5m
         8LgyaDsgaUD2iHrtKt4gvK44kxg/DKUviOGdXRqz7ybPlQFidqc78K3oQANrGr7d0JFo
         ImcSaPn0PSpKxSKXOQJky+o42V9OyNcDenCYPRVO/BugqYlJqA3Ey7WvpdtNnmQ0QWsw
         7uanO/U+dxlLJM5Qs5OEajEEKJvNzDAkuxVEsqYrmyAAiHhLmgrk4aYyVD72y3ATMRn8
         XTLUwxEBB6rSaqJOnwiOZAXhASnCGjEzXuhmYa79VToVB6zy5GrUO0B/HI5/2k8rkhuS
         gh1w==
X-Forwarded-Encrypted: i=1; AJvYcCVyleZfzx+gLlm427O/HyoFV5W4InNW2iHqE2S2woZVdUkikZ5G3++5LZeBHBT1jv9m+5jqzq/3UVoxAvLs@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg5BlYiseMLSrOcfZbzs35KuBm4bnCB9vOpkiD0FjhwimjiUDi
	u1mCwv3H28Jd2Ybrc8ayzPAiKh5RZmf2aMM0a0mQIZPIYs35SMTjChE+c/52eRKUu98=
X-Gm-Gg: ASbGncsw2cGoW+KPVRISKtdH2jsfM12ltGt1f4IRfYUl2InNWbnmoDde6YNtnErrHXO
	K843ou7ndBlqEqCTJ7SbQXWwZp5k3B5QfqK5z3WBBKcSLYRS/PP03q22O8WYmPryqnum5IwaJsC
	+Abzmgsn/c/EYkI6kGRNXW8rKDkOwMKHaVzkYoP/GthOs/PxAsAAfmJ98d96utKqmCpXD02Euhx
	cyU52dccB290Pff796UtQEuq5mOptvRDn67DwmFaqFnUGZ+eNK4BctFpMWkn8XqvqVHp2aOA+AY
	F8niPn4efKLM82FG5x3ZD/lLJRHrGxZ1efmxgsEy9GgzxCll7H3TmYZy9TqbP5wCqFPqfdIzvpD
	4DRFWKHItmu+6bG2tc9Bo9Ahtu00XtC/592bGdnw6XEGZT0Bbs4BL7UZQEHQqwsTkM+g1FEbbhH
	KEKQ==
X-Google-Smtp-Source: AGHT+IHpBDdR6FigTlQRJF71kEZPG5C4dRibFN0rdBgPoSfyb0NYf4gIgt2t1ZdaE/8lcZCX/fEPYQ==
X-Received: by 2002:a05:6e02:32c4:b0:3df:3ad6:bfb2 with SMTP id e9e14a558f8ab-3e416180bbbmr90758155ab.17.1754193576851;
        Sat, 02 Aug 2025 20:59:36 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:59:36 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	ukaszb@chromium.org,
	louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	daniel.vetter@ffwll.ch,
	tvrtko.ursulin@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	seanpaul@chromium.org,
	robdclark@gmail.com,
	groeck@google.com,
	yanivt@google.com,
	bleung@google.com,
	quic_saipraka@quicinc.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	quic_psodagud@quicinc.com,
	maz@kernel.org,
	arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	mingo@redhat.com,
	jim.cromie@gmail.com
Subject: [PATCH v4 43/58] drm-dyndbg: add DRM_CLASSMAP_USE to virtio_gpu
Date: Sat,  2 Aug 2025 21:58:01 -0600
Message-ID: <20250803035816.603405-44-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

virtio_gpu has 10 DRM_UT_CORE debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index e32e680c71979..4487b5a41cbda 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -48,6 +48,8 @@ static const struct drm_driver driver;
 
 static int virtio_gpu_modeset = -1;
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
 module_param_named(modeset, virtio_gpu_modeset, int, 0400);
 
-- 
2.50.1


