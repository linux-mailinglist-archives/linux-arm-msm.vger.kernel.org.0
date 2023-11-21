Return-Path: <linux-arm-msm+bounces-1255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA5E7F224C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 01:40:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2255D282807
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 00:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06CA4187D;
	Tue, 21 Nov 2023 00:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mm8duyBN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E333C9;
	Mon, 20 Nov 2023 16:40:07 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1cf6bdf8274so3213695ad.1;
        Mon, 20 Nov 2023 16:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700527207; x=1701132007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jX3faK+AMFkz5EzUhNwZ3WOkYHYBNnVAbiCro2CYjs=;
        b=Mm8duyBNT3XTOeAcI2tcxXC/Ow11iGujr7hM5Xk2DJzJ0JMhp1njIhR0OWbjpsBlyD
         HJ8T7bgBzIekFFZCso8rGz7+hf8l2jJ3a2D0XUO5BdCo7czFoIR2ifk6rJPAfxY4vvMA
         MQUUgjXhg8k46NvdsmHxB5bsQBijAlnj6sEk9VDW0gz8epSJ4IaFJFgSd1P6fmXNkKYM
         LyIiLeQBnnOXlRciWwQnP0op/GhcV0VXxr+EpTyz4EOLQg8NJt4Aiw5Dix+kTXb5BcMq
         cLAzhUoXtwigf7j5cXJjUoT1hrXfMnhF8TLtxD9Y9KxV0siFjTX/kF988UjGjIwxX0/d
         E53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700527207; x=1701132007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5jX3faK+AMFkz5EzUhNwZ3WOkYHYBNnVAbiCro2CYjs=;
        b=vyiSTdLdsXCYKXRa++8hdoo2riBLxXm7RWRQGAvzqqL9CZVKGjfpeJLna4mEKxBzGY
         MebxFa2CGIpJc3aTOXyzCDCoRCrmbUUBZKhbUW69q/RueR9bzKIfszcJZMWLREW+EsaA
         KFPeRbPiYfk44pnyzLlMYmyPpKRHIbfvRhKhbLzrTwmU8pXYdDfzlgatFq4dyAon56eW
         ++GfN6hlmmo8u5udJ+Mlh1YDlYhGFcqRPXnMmsdGWO2bggoOCLV4HDF8SN6/Q6l4xTUa
         9vh7friMEjh8eErf0wCerqG5UygSCw3Ivub+5Xcs+SJIx9qQyXDpYZeQ+ieAj6Yz6tyL
         jCXw==
X-Gm-Message-State: AOJu0YzejPaCeRXIh7zXNb0B5OVn94ukFTnidZv5VQ0zuxsEx+UhWfq6
	vUKsJxXE96VJkgWe5a7Ai5w=
X-Google-Smtp-Source: AGHT+IETWon82ZL/ytWmj4xSyjfByZsKMh66sDsxn7S+5SvQQISILbKS7mDD6lwKCFFqYymg/KaJsQ==
X-Received: by 2002:a17:902:ec82:b0:1cf:6e9e:aa34 with SMTP id x2-20020a170902ec8200b001cf6e9eaa34mr391433plg.3.1700527206924;
        Mon, 20 Nov 2023 16:40:06 -0800 (PST)
Received: from localhost ([47.215.232.245])
        by smtp.gmail.com with ESMTPSA id t3-20020a1709028c8300b001bc930d4517sm6624935plo.42.2023.11.20.16.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 16:40:06 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/7] drm/msm/gem: Remove submit_unlock_unpin_bo()
Date: Mon, 20 Nov 2023 16:38:46 -0800
Message-ID: <20231121003935.5868-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121003935.5868-1-robdclark@gmail.com>
References: <20231121003935.5868-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

The only point it is called is before pinning objects, so the "unpin"
part of the name is fiction.  Just remove it and call submit_cleanup_bo()
directly.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 996274ef32a6..2d5527dc3e1a 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -272,12 +272,6 @@ static void submit_cleanup_bo(struct msm_gem_submit *submit, int i,
 		dma_resv_unlock(obj->resv);
 }
 
-static void submit_unlock_unpin_bo(struct msm_gem_submit *submit, int i)
-{
-	unsigned cleanup_flags = BO_PINNED | BO_LOCKED;
-	submit_cleanup_bo(submit, i, cleanup_flags);
-}
-
 /* This is where we make sure all the bo's are reserved and pin'd: */
 static int submit_lock_objects(struct msm_gem_submit *submit)
 {
@@ -313,10 +307,10 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
 	}
 
 	for (; i >= 0; i--)
-		submit_unlock_unpin_bo(submit, i);
+		submit_cleanup_bo(submit, i, BO_LOCKED);
 
 	if (slow_locked > 0)
-		submit_unlock_unpin_bo(submit, slow_locked);
+		submit_cleanup_bo(submit, slow_locked, BO_LOCKED);
 
 	if (ret == -EDEADLK) {
 		struct drm_gem_object *obj = submit->bos[contended].obj;
-- 
2.42.0


