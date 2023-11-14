Return-Path: <linux-arm-msm+bounces-649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 618D17EB9FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 00:00:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99A131C2090F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 23:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BB3526AD1;
	Tue, 14 Nov 2023 23:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="JPMeaHEt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F41D26AC0
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 23:00:19 +0000 (UTC)
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DF1DD1
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 15:00:18 -0800 (PST)
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-672096e0e89so35811456d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 15:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1700002817; x=1700607617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0WgbXh9MgeOn39Qx8ZOYsj5qd/Y25XhdC9fJIxz5E4s=;
        b=JPMeaHEtJ7NDiGCuGG7L3zYPhYKnjeorKMVsQFO94uHk0hFpXKKMADIynU7MKKPMVv
         CtIc2kqGrhd0kAyEs4Nrc3uf5UH1QY4lNZzfzRFVP0DpuaAVfRI9GXmH5oXasKPAtYNh
         X/ugvq2ZzCGmNh9w9LL9taAEYZcA/lt49dwp+OtgG1uq9VolHb6O1SMiodXfUPPA3IWl
         jvDf3eDfvtq9Fmq4yNdkcpQT2X5jMVt2QlUQKL93LLy5OQHwK5ywosDj4ebKhXV2/nYj
         PT6DIPi0ywa3cU6fchmLyl0nEEdd+HQW45wcehwWrMTR/dzv1FGxM24rI4caqe1h7kb7
         JGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700002817; x=1700607617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0WgbXh9MgeOn39Qx8ZOYsj5qd/Y25XhdC9fJIxz5E4s=;
        b=omdUtxzxb6ev8FzTjh7EKJVa/a78OiRUtfNuUEw+p0TTNkCPjHoKfToxSe+S5HPdRZ
         7Hdho5feFBSVcVF86R2+FrBZdUE3oHh+X2Z5NmtTT+0ATFU1SBTZ1mwUQM+FXYJRUZj7
         ctpbfv8QXu4cHPlDzxzQKtKwYmxJ2dqEVZdtE2GjeFJB0xo7BdXJhoc58Rz0oeYrX/uo
         6jqeqi72wfXL6fYN0Qj9twvOn//aCp1kI4tQXNlxJTg3NjTZyADEI/vs8i/Sw3mrJFZK
         eY0JyPFWwhMOJ9CWbpdJusgXpOe+Vyyu43E1N4UkJll+3vYfrTcrcCoAw71OXhhgpZX4
         Qpcg==
X-Gm-Message-State: AOJu0Yyrhils5hPcWLlEdoo0+wQPMvnJ5t70+3OQxR66y96ZiVQpkGdY
	wpg/UAavZMphXCdKEVVxVfCOWA==
X-Google-Smtp-Source: AGHT+IFnjqTgSRAEEv9oTG0p8gs1SiKRgR8rwDL76VdXJfcgXZJsNySy8WBq1Lpu5ZkIr/aU+PwDZA==
X-Received: by 2002:a0c:fd81:0:b0:670:710f:203a with SMTP id p1-20020a0cfd81000000b00670710f203amr3645510qvr.59.1700002817358;
        Tue, 14 Nov 2023 15:00:17 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id u2-20020a05621411a200b00674a45499dcsm25274qvv.88.2023.11.14.15.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 15:00:17 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Arnaud Vrac <rawoul@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Doug Anderson <dianders@chromium.org>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Jiasheng Jiang <jiasheng@iscas.ac.cn>,
	Kalyan Thota <quic_kalyant@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
	linux-kernel@vger.kernel.org (open list),
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Vinod Koul <vkoul@kernel.org>,
	Vinod Polimera <quic_vpolimer@quicinc.com>
Subject: [PATCH v2 0/6] drm/msm: DSI DSC video mode fixes
Date: Tue, 14 Nov 2023 17:58:28 -0500
Message-Id: <20231114225857.19702-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2: added new patches (first two patches) to get DSC video mode running with
the upstream DPU driver (tested with the vtdr6130 panel)

Jonathan Marek (6):
  drm/msm/dpu: fix video mode DSC for DSI
  drm/msm/dsi: set video mode widebus enable bit when widebus is enabled
  drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC (fix video mode DSC)
  drm/msm/dsi: add a comment to explain pkt_per_line encoding
  drm/msm/dsi: support DSC configurations with slice_per_pkt > 1
  drm/msm/dsi: fix DSC for the bonded DSI case

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  2 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 11 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   | 13 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   |  1 +
 drivers/gpu/drm/msm/dsi/dsi.h                 |  3 +-
 drivers/gpu/drm/msm/dsi/dsi.xml.h             |  1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c            | 50 ++++++++++---------
 drivers/gpu/drm/msm/dsi/dsi_manager.c         |  2 +-
 include/drm/drm_mipi_dsi.h                    |  1 +
 10 files changed, 58 insertions(+), 28 deletions(-)

-- 
2.26.1


