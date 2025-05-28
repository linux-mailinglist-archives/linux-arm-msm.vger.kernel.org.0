Return-Path: <linux-arm-msm+bounces-59667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC196AC656F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 11:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 335EA18893AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 09:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 385052777E3;
	Wed, 28 May 2025 09:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="hRTybPp9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F5827605C
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 09:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748423607; cv=none; b=LkZJAkzHnsa88Uu4hTqfx8hV3gErOrA1AXjyia0FUQcoC+BnfMAh8sj2CY52sszRvAl480Mjs5X0tpnvfvtop2Y4XFj+Q1pLEAKoE6Pv1sbhjqZVAKf40LHnMfwW+l4cUm6ZzgeQ/TI93TvfXMTpXINNnosBu2Ai9BC/3d0vWlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748423607; c=relaxed/simple;
	bh=QuxGTqqothVZH2FAvFReMIkwuLRVVEuwxWMwdi8wepo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ly18fIJYtAwXZqAmjip0yqzcAX1BHQVWSnnB20imZaFAmvST9+cWDOotOw+iQuBtODKePaX2IlBCIm+MwC3I7YiOFXzYbsqmtUM7kvMLtDYP1iV0jGbcrYwa6gs8rbL51GO/BPKxotgi4bP8yiXo7noYGPgCpc9p86rlGJ36Xww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=hRTybPp9; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-441d1ed82faso33287035e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 02:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1748423604; x=1749028404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qE1J46FoBAJitXj1m8vWSPEGkQ+jGKiXPyegG+/SpTI=;
        b=hRTybPp941osT43T+25TpvGocYru36wo07MXWgVB3GjtLbwGp4oOCkPrs3AqumjUMB
         YZyBZW4ynuPle8RAtYRg8c1ptdYc0CoM6529o9+J14X7AFJnAydU+0z8GR8e2Td1i0QU
         1dOO9fDTyoUIfv9S0F8zc/QB+Hbuyv6XTHE14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748423604; x=1749028404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qE1J46FoBAJitXj1m8vWSPEGkQ+jGKiXPyegG+/SpTI=;
        b=VRpY/02Q1IwgD18ZDdaOzLTOtacbPwd9/xMUuRCsj9tgCXK8F66JsV/Lv85QUf1gie
         eCJ9G7KYgTZlt/QxGki+wXmNjy9T0dpG2U+P6HFNWMcUb68k9y/fCsKOQndF5ptbBUYw
         ETxRkhFucYat8VH25b6mRCmLSESBxCWAV6f12DIs9a2z+wGw6eH6YtPwTloL6sCxqt3S
         tUAHaTSX07GqLv6KtxCiFauIOzCA+7o1L8guDDTuiXf7ITTgaj72xPHY2Bn9eM7vlWvZ
         5GMD86DJox216NL+8U+dlvWLyT6SHe20L8KHhZPKxusHlkNNRRjqKSFj/9ACtxgGU3lZ
         4Tqw==
X-Forwarded-Encrypted: i=1; AJvYcCXPLruivVAq7VaZl/btU5Mjmf0sA+cZkgvaPh1INHJ1cH1qnvp6MomYwm393/DJMR/w1Elto73lSW1jF9Aw@vger.kernel.org
X-Gm-Message-State: AOJu0YxgXlu+uFEbJT4INDBWplz5BgaHU9qB8gzgGU7bqgYbm5eG1gZB
	2VaPL9A+tCQoV3Kk/ZLFbSDYivKIHTNV9Oww34gl7XBWZnekl8i5it8rUc29N0X/Qw4=
X-Gm-Gg: ASbGncudI0RqPB8Vqno6Fx3ZOXKgvnnMKjQM8YLWWv5gwi7Q87RETKEvgL6kgiZno7/
	s8RecBzeaXSJKKi62j5dZ9MC1M6qVcWuag0dxmkym9VK0NeYUrBSrBMQnZVidSuQkmokvrG04S6
	VW2l7+1e3snvSOD9D+Z4vN7Tc/VTD5vcMwPW8xvsPHct/ovxdIQOcUwVRY5w+Dxzw+lqlmF996i
	RXvDBqgT6hfEwk+2Zhq4Lu12DYoyE34HJocByI7v7vcvXz2Iaa9TdWHsAEvpqNmwBykBP7kh4N6
	8pgLmq6z+izjHNeBaLgvRBjRYyslsUu0YjiRZiEi8jn+MqnVynYPqFiPZkPt8+Y=
X-Google-Smtp-Source: AGHT+IEl4ra8RUOaI+5/H5P2jSSuex3Nu8eBIcc9Q+A1x9PSyFfWR4vZKMKNUZELTXvYj6FyAPzHSA==
X-Received: by 2002:a05:600c:35d3:b0:442:f4a3:b5ec with SMTP id 5b1f17b1804b1-44c9301650cmr163046715e9.4.1748423603663;
        Wed, 28 May 2025 02:13:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4500e1d85b5sm14811715e9.32.2025.05.28.02.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 02:13:23 -0700 (PDT)
From: Simona Vetter <simona.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: intel-xe@lists.freedesktop.org,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Carl Vanderlip <quic_carlv@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	Simona Vetter <simona.vetter@intel.com>
Subject: [PATCH 4/8] accel/qaic: delete qaic_bo.handle
Date: Wed, 28 May 2025 11:13:02 +0200
Message-ID: <20250528091307.1894940-5-simona.vetter@ffwll.ch>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
References: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Handles are per-file, not global, so this makes no sense. Plus it's
set only after calling drm_gem_handle_create(), and drivers are not
allowed to further intialize a bo after that function has published it
already.

It is also entirely unused, which helps enormously with removing it
:-)

Since we're still holding a reference to the bo nothing bad can
happen, hence not cc: stable material.

Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: Carl Vanderlip <quic_carlv@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Simona Vetter <simona.vetter@intel.com>
---
 drivers/accel/qaic/qaic.h      | 2 --
 drivers/accel/qaic/qaic_data.c | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
index 0dbb8e32e4b9..7817ce18b8f2 100644
--- a/drivers/accel/qaic/qaic.h
+++ b/drivers/accel/qaic/qaic.h
@@ -213,8 +213,6 @@ struct qaic_bo {
 	bool			sliced;
 	/* Request ID of this BO if it is queued for execution */
 	u16			req_id;
-	/* Handle assigned to this BO */
-	u32			handle;
 	/* Wait on this for completion of DMA transfer of this BO */
 	struct completion	xfer_done;
 	/*
diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 1bce1af7c72c..797289e9d780 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -731,7 +731,6 @@ int qaic_create_bo_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
 	if (ret)
 		goto free_bo;
 
-	bo->handle = args->handle;
 	drm_gem_object_put(obj);
 	srcu_read_unlock(&qdev->dev_lock, qdev_rcu_id);
 	srcu_read_unlock(&usr->qddev_lock, usr_rcu_id);
-- 
2.49.0


