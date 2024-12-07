Return-Path: <linux-arm-msm+bounces-40859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 490B39E80AA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 17:17:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AD8328308F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2024 16:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17B9D15382E;
	Sat,  7 Dec 2024 16:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BirfkY2j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9B514F9D6;
	Sat,  7 Dec 2024 16:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733588242; cv=none; b=aw2+qhWYvChTo7OMlVcXs79dDqOzhRIOb18fYEBE8omro2FELO9vkTjoQgU7CxQLnRRlTZlxGKWB4Im3boY0lLxegcpoinMuLW9gC96UGz5Jn0l3a9Mfuvg1UEkJdvLXKPzeqVQ/y5YUHcS9k+pFb0QbVMuT6BIwFEyygq04z2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733588242; c=relaxed/simple;
	bh=DQfBvjMzBz8ecm4yJsv36Y0t3lgtWsL8E6OSrojhqG0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QiPDwW8JnpHdHfK+EACd4z0P5/9qhiKqxCLWKW5mlc6cbCtFBmFucUBiyK7pWCT0PNMC/FU16sER98htJA+adnKUGbLMOLKYJe7NlTMxP0zcsr+sbXof09K4DR6VkL9Ftf/fh1L0sX8gtcjY7HRlhWJWXETF4wYZ5R7yEVVZV30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BirfkY2j; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-725db141410so204960b3a.2;
        Sat, 07 Dec 2024 08:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733588240; x=1734193040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQgFzaGycn/HJR1rBYagqMMFKjXleXPjXG3RiZU2xbE=;
        b=BirfkY2j65tWBX/x6YnBJIGJYNROQ4u95xGblYtNnjMurhZzf9xAOooIlRSekB97U1
         J26wmtZ7PpHqP9fPnrjgWoqTl+AdxZuLc2CBBJErsZPmMVCtofh77U2F+TVjV3ZIgh4O
         Xs+P+FEE0G7Du/ae7FtHuZBQu4rQEvtZ/QKeajYw39YF6IUYBOksb6fd/DE/COHQyGMQ
         QyNG7ifLvCFd4g6eI5Gv8OFWgfxOdU3REidUIzP0+fmtr/Xcitp7RLgUyXzrxeFXfVOq
         NraEayOWjr2Z286UVDERB3/wPPJDvsQ3h3RuStMSK/OAx6Orf9qQ0tIy0FCwKHsmuBuO
         ljJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733588240; x=1734193040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aQgFzaGycn/HJR1rBYagqMMFKjXleXPjXG3RiZU2xbE=;
        b=nnQ4auJwLo3detqv1qJCYp3EXUclKMrbWfHk0HH1itLocFaw+7AkOX5ZRCtDC18KTh
         fXV1bgiP6ecr+2V5mJOnB1z9ztPWw6p8Zj6NPB+XNqHnrGsl59HIIT8zFSr4aa7NJG5E
         Ymf/7YgKtTA1J3tnkCJBc+MakOCQnrOa5TpdmRQq6Y/lMwC0cjH6DOQLRmjgoGbdcOIl
         sg4xxZUizNHO7vZxU80+VAWsc/gUmHknoVCtcAbZCAmVA5RF8ZVW7gxoRqW18+s06CyS
         pXDUEUI6xKUFF7BhVuHVfprhxbB9t8RFG+8KHIKcr9dtdzLokcBbJzoaV8T36SZfS8Ym
         seJQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5RrJdl49/f1ZiTwTPzNH3wucx0CuDoIGBb8WKp3jE9sRkHKQvc4sfpgP4dIYQOMqZripCdiZm1xOta/Ef@vger.kernel.org, AJvYcCVhI74q7O97LNuROCKmV95wsjnuceoO1JHsM0L3p8Z9m5xXcTmwFgNEPyPRoLMi2N3yPFnirOfoq96klJqd@vger.kernel.org
X-Gm-Message-State: AOJu0Yyefbbl71VD3pTKVIkxnlEWNYfq4cy+5KY3kNMuQf83mh4wnPx0
	48zXonUp4GwyfgaXYPnBOOBUDl3OqUsdIuR51blwAe1Btk72U0Fe
X-Gm-Gg: ASbGncuvDTZxJmLX9+eYJuEAv+SzBrAxMeEhfdAN9nUgN8UpXG+MfUOAiQwvvF6R13C
	rB27Kg1tTABIj81Oe+xrt+Arw3E4AYT1jnP9dXBSnMYqk3rJtZwS5y6+jN/+4eNz1Ba+hYuqtkj
	20xHYR2AoXW6sW0xVoW79YioFtc9qSzJZJ65NOyUtYrBVHV7Vx5fyoS66hMEIzGE0qq8b4J+XlQ
	1nunywDIu+1VA9HSHBOLEWsdxR0FPtzX+EBcvreVtLNDOdnVGJ9bjlmj0RCxnxEjxonuyRncBZb
	ueU9KYRI
X-Google-Smtp-Source: AGHT+IHUEDls1d5ZD4bWmKwHTYFRuuM8ju54qCGhC+KSoPe/9G4tXm/AdkfqFY2cobSLPNQUQAXelw==
X-Received: by 2002:a05:6a20:158b:b0:1e0:f472:e496 with SMTP id adf61e73a8af0-1e1870a75abmr11348864637.4.1733588239829;
        Sat, 07 Dec 2024 08:17:19 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725c8865ee1sm1874143b3a.137.2024.12.07.08.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 08:17:19 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Rob Clark <robdclark@chromium.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [RFC 03/24] drm/gpuvm: Remove bogus lock assert
Date: Sat,  7 Dec 2024 08:15:03 -0800
Message-ID: <20241207161651.410556-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241207161651.410556-1-robdclark@gmail.com>
References: <20241207161651.410556-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

If the driver is using an external mutex to synchronize vm access, it
doesn't need to hold vm->r_obj->resv.  And if the driver is already
holding obj->resv, then needing to pointlessly grab vm->r_obj->resv will
be seen by lockdep as nested locking.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_gpuvm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 1e89a98caad4..c9bf18119a86 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1505,9 +1505,6 @@ drm_gpuvm_bo_destroy(struct kref *kref)
 	struct drm_gem_object *obj = vm_bo->obj;
 	bool lock = !drm_gpuvm_resv_protected(gpuvm);
 
-	if (!lock)
-		drm_gpuvm_resv_assert_held(gpuvm);
-
 	drm_gpuvm_bo_list_del(vm_bo, extobj, lock);
 	drm_gpuvm_bo_list_del(vm_bo, evict, lock);
 
-- 
2.47.1


