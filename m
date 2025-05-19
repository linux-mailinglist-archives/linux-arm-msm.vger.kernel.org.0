Return-Path: <linux-arm-msm+bounces-58550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF594ABC6D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 20:07:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5C124A4BD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 18:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 001F228ECEB;
	Mon, 19 May 2025 17:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jq8jX7cu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CB928B41A;
	Mon, 19 May 2025 17:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747677535; cv=none; b=DsLStdQ07yS8hnnvFnwJwlMAJTiddeSIH3CQ2pk9ErJWlTYZGVk2T9FVvnQlKPtaWquPPxdmufusZT8njQa4iYOS6FK1fQ6+o3amYqvT6r2rIZH31JUx/WzxAvs3sz9qb9ZrulzfBi3Z+Y0jamL6l7AvmIsSYOU72mf0zHeVM+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747677535; c=relaxed/simple;
	bh=dZeh/4kjMkBLMWW8F9qQId+qkvD2LeT1midcpI7kIPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=APTbAp+ugaOjrrZhoeXdrg3bKJCxUoFjdFLghQLOplgoFRzBPmGKEigZFYLQYqrUaYT2DSzTv13lrDDNjz90+msEZl3I0puxS/QNZZxDODBa8/tnOMQZKty8BMeeb2Bx1k50kx0ZnVWmGPjwvtzj74bsP2lhUvJR7Ax8R8Y7bFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jq8jX7cu; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b0b2d0b2843so3643720a12.2;
        Mon, 19 May 2025 10:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747677533; x=1748282333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oIwfIWvXBx6mekDHf0vT/9qUv4fpUfLK8aMEarZbbCM=;
        b=Jq8jX7cuZMBnSVAI8AhoTo+hA8UsWyQ+MPLfg7scCP9wOtV4g/2JxlU3yHh63xpZv0
         oOsBLYCvXQItfbzo4OwnyzqeGKnR5yfrmfbOgb1966eq/7dWDnEJfNbQw/zRGx1RPFcd
         9cEY8z60N/21gAONQphXdt3WmxV2syRxsfuxCuedX8nPgGBHAMus0lWDP/Fe5JOCExfL
         nDecOWazqc5Msh0iGbxZVYj/XDKadfNXA3QsaSCBO6/dmdsHcNmps38t0GHkF/9NsabZ
         9ZxoSdJIV3iDCemacDMF8L8P3yhc/G0J9V4tALayjMxIHgMrFwM5Pr5K8Dr9V0aaWi1U
         3lLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747677533; x=1748282333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oIwfIWvXBx6mekDHf0vT/9qUv4fpUfLK8aMEarZbbCM=;
        b=PHHmlDg6ZO2H8rTLgMZq8cLOX4+n/Pl4VymcYxOesSPgZlzyMxKLhPCnAp/1JAk5YI
         l+XtUhbMzGLyeMG8BmvzT4K3BSZXus5uMzThTK4ajgJXVenx1KRos046VyrM/Jb8RJFZ
         dNqXGFY/BmG8Gx1YyvMyK/ddbcbq08x/7DwXcHBeQ3wz6CPPU71vHzdu+43puVBFedkk
         euIGHGVTHqv2GAy/f5dkB9CT7Am8O/ZFhtVyb9ma32isk2G7/S2rK/IZIsC2WCFejRys
         dIZpVFwyBRBx6DLXwa9YzHfn9GMiKsQPVdua4ejReLJAL5TD5wCCITZP6qQR/lHBxCjj
         12rw==
X-Forwarded-Encrypted: i=1; AJvYcCVGFL5Mo+nkRi+PK1hLDQGVR/9AHHP1KGLaGqojY4zJ1DIu4xzqxvFHDmVMvHjaI5XKGK7nflKZ07EPKsYP@vger.kernel.org, AJvYcCXtIgWNlT4rSpVTaFroruibamWivub7BQN7aEKhUTNWSEIKotL/w0tB1uBPt6AjrrEnfzaIXV3vdSxb/Crv@vger.kernel.org
X-Gm-Message-State: AOJu0YxnYzXpNtNLlJTAvp+q8p0FeX76+pP0zlicsBm9d/1glqHZuvSg
	cFf7jUcGIEJvbS3QekaFbJYlje0dCVvLCA+/jzdXIxbx3Q/qzt9HM+gv
X-Gm-Gg: ASbGnctnlfS8kGIgvfaDNWYk2AHyYPTRMvLn08jfdQ9wAuZnWkJDUGZVoXgy0+4io2D
	36losCVauDNXUvA5ERMTSu4Mjuc6zmKOM9DCQp9R1+9gVI11xeVVD6kZ01TciaSun92nrZovzWb
	jEf1MNgOn7Yz7lIfGIewg0TpWQBQeJ7NqS/6XoA9vsp+1C624WZ+ibkcnrmqsePs9K50RNVng9I
	bvRmC3yy3lNEH+znFdtiCjYiaiR4QleinKoT4bshKCTHQsoEx34gRhEv2pVSv6ClSGYv1dZupUr
	OEk+sy/2UEoEsSBQXIPekFhyNU13kovEIL3JvI6vkN+rMJ4NAenpHgX7+xfTAJVWoB1+F/LeFCm
	7CiqkJTYXOTCMOcaIKHIE+NyUOA==
X-Google-Smtp-Source: AGHT+IGfHK87+UE6VTN287V0vY7+k/TNhX8IQ3w/Y0PFM/77BawdCwWPSjEqLHc3oa7QBi1AS6OLAA==
X-Received: by 2002:a17:903:32ce:b0:220:ca39:d453 with SMTP id d9443c01a7336-231d43a3e56mr178577335ad.17.1747677533475;
        Mon, 19 May 2025 10:58:53 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4afec8dsm62997475ad.92.2025.05.19.10.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:58:52 -0700 (PDT)
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
Subject: [PATCH v5 39/40] drm/msm: use trylock for debugfs
Date: Mon, 19 May 2025 10:57:36 -0700
Message-ID: <20250519175755.13037-27-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519175755.13037-1-robdclark@gmail.com>
References: <20250519175348.11924-1-robdclark@gmail.com>
 <20250519175755.13037-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

This resolves a potential deadlock vs msm_gem_vm_close().  Otherwise for
_NO_SHARE buffers msm_gem_describe() could be trying to acquire the
shared vm resv, while already holding priv->obj_lock.  But _vm_close()
might drop the last reference to a GEM obj while already holding the vm
resv, and msm_gem_free_object() needs to grab priv->obj_lock, a locking
inversion.

OTOH this is only for debugfs and it isn't critical if we undercount by
skipping a locked obj.  So just use trylock() and move along if we can't
get the lock.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 3 ++-
 drivers/gpu/drm/msm/msm_gem.h | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index bdc99aff3130..f10de8915ecb 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -922,7 +922,8 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 	uint64_t off = drm_vma_node_start(&obj->vma_node);
 	const char *madv;
 
-	msm_gem_lock(obj);
+	if (!msm_gem_trylock(obj))
+		return;
 
 	stats->all.count++;
 	stats->all.size += obj->size;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 1e9ef09741eb..733a458cea9e 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -280,6 +280,12 @@ msm_gem_lock(struct drm_gem_object *obj)
 	dma_resv_lock(obj->resv, NULL);
 }
 
+static inline bool __must_check
+msm_gem_trylock(struct drm_gem_object *obj)
+{
+	return dma_resv_trylock(obj->resv);
+}
+
 static inline int
 msm_gem_lock_interruptible(struct drm_gem_object *obj)
 {
-- 
2.49.0


