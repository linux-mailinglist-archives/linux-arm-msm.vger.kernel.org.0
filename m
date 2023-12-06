Return-Path: <linux-arm-msm+bounces-3523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31105806BA3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 11:15:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB43F1F215C0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 10:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D99F2D043;
	Wed,  6 Dec 2023 10:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yjas3BWW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15FA518F
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Dec 2023 02:14:58 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2c9fdf53abcso7253561fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Dec 2023 02:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701857696; x=1702462496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F0q7XUDhzaMOZKwK/U9NUPrOCd+WjD1tbsbFwSHG0q8=;
        b=Yjas3BWWMyxe8u66487slqciRPRVCndYg7i+c3/gd9Ee53RjLP113cbWjr4/DA6poT
         2YYElTylC+oBqqdILzbqqU7MuEx1qIH2bm37Zq9kf2ffyDIGXXeNAAd6gyNqrIXuUJMk
         8Hz2H68QgHMY5egiQ0VDGaNnR0LfAhY77nchG1Lk6ob4y2qkmI2cMtrJXONVspDHN15w
         fuo02hNrs2TbkierNNDlqBZUzr6TvXd6CPjxyIV4Wm8qpW/HMKpYvsNvCe0jJSeDUyHv
         +r9nTYyxDsAOSb8ZzCIhfAZXrL19+Iqi71HaxGBcgYffJcpi38oLJoTI+gbJrge/6NMf
         MbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701857696; x=1702462496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F0q7XUDhzaMOZKwK/U9NUPrOCd+WjD1tbsbFwSHG0q8=;
        b=esyIDD7BwFXeKJ/Rk4OcC+O+91yBzvcl8a14Z2RYalASuXkcCpOt+4YbyJoTNYg8OM
         0zUd8XDoK9+q9uFG6E+jDR5YCeMAG8xXjMzjEjAUOJMsEMaSJxys8DOiemuvB0JQWLqL
         2PcXqLTIT49yxplvsDoDggFYXyl+rpLNYWVvWbTi7GP2r2FVEsMz7j9H+0mI1bDC0Mc4
         yfPX5baOa06D9vbJG+i/TJAyA7o6KT/cDu1/jm68P7eGilrTsVodyDyiNlzEA5Z89LR9
         HKZx1jZXTOTWJGHBFVIf/kGi9rue20VYjQcJBeW9C12eLZFc3sg3IglECRZYlTOnIvIA
         qRZA==
X-Gm-Message-State: AOJu0YxVlOvBnqvZlOPlw73o5lDCNAadPdEq12I++etVAaEiWolLo9yY
	LxyySg6mrg9/qPDlH5I5rKxYng==
X-Google-Smtp-Source: AGHT+IFfEsB482WXWBkGa7lRzgwjsje7EsqALaPTbxoFRxxsL9ZnfVH2CwoU2HQS3fRCcJBk72H9ww==
X-Received: by 2002:a05:651c:14c:b0:2c9:e81e:81ac with SMTP id c12-20020a05651c014c00b002c9e81e81acmr552024ljd.11.1701857696297;
        Wed, 06 Dec 2023 02:14:56 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f1-20020a05651c03c100b002c9e6cbf78esm1519012ljp.19.2023.12.06.02.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 02:14:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
	Melissa Wen <melissa.srw@gmail.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
	Haneen Mohammed <hamohammed.sa@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 0/2] drm/atomic-helper: rename drm_atomic_helper_check_wb_encoder_state
Date: Wed,  6 Dec 2023 13:14:53 +0300
Message-Id: <20231206101455.1664463-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function drm_atomic_helper_check_wb_encoder_state() doesn't use
drm_encoder for anything sensible. Internally it checks
drm_writeback_connector's state. Thus it makes sense to let this
function accept drm_connector object and the drm_atomic_state
and rename it to drm_atomic_helper_check_wb_connector_state().

Changes since v2:
- Make the function accept drm_connector instead of
  drm_writeback_connector (Maxime)

Changes since v1:
- Make the function accept drm_writeback_connector and drm_atomic_state
  (Maxime)
- Added a patch for VKMS to move atomic_check of WB path from encoder to
  connector helpers.

Dmitry Baryshkov (2):
  drm/atomic-helper: rename drm_atomic_helper_check_wb_encoder_state
  drm/vkms: move wb's atomic_check from encoder to connector

 drivers/gpu/drm/drm_atomic_helper.c   | 16 +++++++++-------
 drivers/gpu/drm/vkms/vkms_writeback.c | 25 +++++++++++++++----------
 include/drm/drm_atomic_helper.h       |  5 ++---
 3 files changed, 26 insertions(+), 20 deletions(-)

-- 
2.39.2


