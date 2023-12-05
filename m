Return-Path: <linux-arm-msm+bounces-3381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5703D8044EC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 03:31:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11E0F2812E2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 02:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC0DECA4C;
	Tue,  5 Dec 2023 02:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CI8KWCCE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CAB0129
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 18:31:53 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50c0bd61d21so4719e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 18:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701743512; x=1702348312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DbHE9BPTRIRsV88TvG0gZTWaeA9wHAPMM62YddZwnZA=;
        b=CI8KWCCETthlaqdMkP6nEjpI3Dlc8nA71wD9xBIP4YZw+Zf/eVhgf0LBJZdDetCYT1
         wkOy2uyS9m+mrCPZCDeL8OG6YBPLww3gWyIr7KsWoGRlurhCvFm0Q4rTphjk6Zpc3HnA
         LlacfimKcbqwwSRMhyr6I3vMprgJ6JSbe2RRHYdacJsuF+XheW+++lDvHuCi/b0kqlWA
         WQqewax7n1bUz9LrD6u1wsTYtWgEFZVTI7P8I6xieCrenkejBThGH/HedD++maX42Yj7
         Me/l1LSCxvS5jMywWXiyk3eWad6+UFLVC3Tsq7O4mM9GM2e1MBIl7kh5bu1WQ0CIDDxx
         LQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701743512; x=1702348312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DbHE9BPTRIRsV88TvG0gZTWaeA9wHAPMM62YddZwnZA=;
        b=Fv1W0aD9tRni6hRBWEqFx1saLM6ci8OgukGw1tHTejOMwLZZCfrROqyie+RVLvhB1D
         oU5iFIoFnz7Ecr1SuvuXsM2Pa6x0cAK+x+o2TI1B7ckGqOwL1tqRQBVPwTDuOXt8/rxU
         DQVi9H8C/NsVk0UcrrV2WhOhcQNywix1nX1GBNkd3oQ7uOm2ZYbOs3L57pkFBN/J3WHX
         7E/ZusnTGedz8JFKB5gOkdGkAOpmH9m3QE9z7Kh5F9eTBnd/SFmd609KZ05zookC6JCG
         Ztpb2Hh2TS6oAyW1oXPEspZ/T2txu+NSg2ePgCFksLTtWSKEc52aubwiu1DEYeajOxGC
         XVBQ==
X-Gm-Message-State: AOJu0Yxr6rIYUVp3r35fG1AzQO0u1lxppn4pmCEalxPDLovlJtiiuThn
	8PnCiZPG2lzNHkpxJl6aNmmzdw==
X-Google-Smtp-Source: AGHT+IHj4RrgA3yIRfjkHr/FC4YWFuT0bc/fAnNvvSdZ66FbSu+DwF4JqrgODiqGTpqRbe66VifBVg==
X-Received: by 2002:a05:6512:3ba0:b0:50b:fe77:196c with SMTP id g32-20020a0565123ba000b0050bfe77196cmr1069018lfv.27.1701743511658;
        Mon, 04 Dec 2023 18:31:51 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t10-20020ac24c0a000000b0050bc57ec288sm1414726lfq.44.2023.12.04.18.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 18:31:50 -0800 (PST)
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
Subject: [PATCH v2 0/2] drm/atomic-helper: rename drm_atomic_helper_check_wb_encoder_state
Date: Tue,  5 Dec 2023 05:31:48 +0300
Message-Id: <20231205023150.1581875-1-dmitry.baryshkov@linaro.org>
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
function accept drm_writeback_connector object and the drm_atomic_state
and rename it to drm_atomic_helper_check_wb_connector_state().

Maxime suggested that the function should take drm_connector, but I
think that drm_writeback_connector is more appropriate, following the
purpose of the function.

Changes since v1:
- Make the function accept drm_writeback_connector and drm_atomic_state
  (Maxime)
- Added a patch for VKMS to move atomic_check of WB path from encoder to
  connector helpers.

Dmitry Baryshkov (2):
  drm/atomic-helper: rename drm_atomic_helper_check_wb_encoder_state
  drm/vkms: move wb's atomic_check from encoder to connector

 drivers/gpu/drm/drm_atomic_helper.c   | 16 +++++++++-------
 drivers/gpu/drm/vkms/vkms_writeback.c | 27 +++++++++++++++++----------
 include/drm/drm_atomic_helper.h       |  5 ++---
 3 files changed, 28 insertions(+), 20 deletions(-)

-- 
2.39.2


