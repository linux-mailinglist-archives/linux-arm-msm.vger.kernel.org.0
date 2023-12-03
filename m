Return-Path: <linux-arm-msm+bounces-3138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B28802381
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 12:53:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A19F8280CA7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 11:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78DB3C143;
	Sun,  3 Dec 2023 11:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZDx1foKS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DD5EBD
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Dec 2023 03:53:18 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2c9f62fca3bso8690301fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Dec 2023 03:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701604397; x=1702209197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p+lPohBi/ZxoOWEwMqklXE78q3N8omeUQljRY/SKmPA=;
        b=ZDx1foKS560hML+GzKvIf+oxaZLByi7nmf+IghMvfrZFjcVwFa8hLjoSO9H96tIzyV
         s20gEZczHqhW6XFxQhHG7zLz/J+PhQr2Dw+Y+WSBIWSV2yljGCE4m6f5b02dvX8qMmw1
         vgExTQ/CIkNBUqJ5pOma8IqtfhryBjZBdd0GNRWD5hbJjmMbv1JKeWK6Z1yfEN6uFXif
         bMblp8D84dry3T6RzRMRLNUr6dgPxkRCy6RxR7dxRLh4dYgw3j6PVALF+oaPAQecSvz+
         rPNx677TfSE7gJOJkj9kGL6wHreqZbTeBHbxfJ8TGAIQ+5zgaNfnikPYQZeuHMA3A61q
         +j5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701604397; x=1702209197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p+lPohBi/ZxoOWEwMqklXE78q3N8omeUQljRY/SKmPA=;
        b=Ur5El6DNl1rnC8zvTFPwikwoqMikgxHXo+BHDZKjG+4WSrR4nSyZE0pgN1hdupt+Po
         RQdKJHKdviSRYR+gjB69zVzsRbbfp65af2cF8i0DHaj/IeUO0G2mGmCGtADpXoLgtH19
         irKbHKoYo6Rv8q8Cb/tFREjIp3qrTb3ZZu4bSpYWupfl4jIgjevzs5qBqe/ZrlL40o79
         22Akefq/fKaJCL2Qof/ogdAx62VFAJ5xcItXzqlRKfrPFScivH+VH7JGbFFATlZzNp13
         rEu/6bLRaY9FdS2cOnaUcEZmbW1CbyKxpZrh2mhmn68LiNf7PDUM+rNwAKZllX+8RB/i
         tRlw==
X-Gm-Message-State: AOJu0YxHybjdDrBUgo3viEBrFHn4dnl2rgjSRpPgDXMPGGETy3GZCn4P
	uVl36MLFQDLMgFI8o2WBGRbW0w/W6lqPZ5UVSpY=
X-Google-Smtp-Source: AGHT+IEX8KqcCeITGDqjCPGan5WOV95qsQaT/IZAMSQd/9QNkAU6y90+zhFGlVygmZEqaicsSHKynQ==
X-Received: by 2002:a2e:381a:0:b0:2c9:caf4:18b0 with SMTP id f26-20020a2e381a000000b002c9caf418b0mr1904893lja.41.1701604396691;
        Sun, 03 Dec 2023 03:53:16 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z5-20020a2e9645000000b002c9c21d01c2sm900437ljh.101.2023.12.03.03.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 03:53:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH RESEND v2 0/3] drm: introduce per-encoder debugfs directory
Date: Sun,  3 Dec 2023 14:53:12 +0300
Message-Id: <20231203115315.1306124-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resending, patch 1 needs review from DRM core maintainers, but it got no
attention since October.

Each of connectors and CRTCs used by the DRM device provides debugfs
directory, which is used by several standard debugfs files and can
further be extended by the driver. Add such generic debugfs directories
for encoder. As a showcase for this dir, migrate `bridge_chains' debugfs
file (which contains per-encoder data) and MSM custom encoder status to
this new debugfs directory.

Changes since v1:
- Brought back drm_printer usage to bridges_show (Tomi Valkeinen)
- Updated the drm/bridge commit message to reflect format changes (Tomi
  Valkeinen)

Dmitry Baryshkov (3):
  drm/encoder: register per-encoder debugfs dir
  drm/bridge: migrate bridge_chains to per-encoder file
  drm/msm/dpu: move encoder status to standard encoder debugfs dir

 drivers/gpu/drm/drm_bridge.c                | 44 --------------
 drivers/gpu/drm/drm_debugfs.c               | 65 ++++++++++++++++++++-
 drivers/gpu/drm/drm_encoder.c               |  4 ++
 drivers/gpu/drm/drm_internal.h              |  9 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 45 ++------------
 include/drm/drm_bridge.h                    |  2 -
 include/drm/drm_encoder.h                   | 16 ++++-
 7 files changed, 96 insertions(+), 89 deletions(-)

-- 
2.39.2


