Return-Path: <linux-arm-msm+bounces-3034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 474F6801EB5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 22:40:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78DF61C2037B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 21:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E84F621A1D;
	Sat,  2 Dec 2023 21:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lPsi1VHX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73DBCE8
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 13:40:19 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50abbb23122so4586653e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Dec 2023 13:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701553217; x=1702158017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SBC2etg0t87/NEQAbw4GxIuosiaBjUOZpDVVT0P9EvQ=;
        b=lPsi1VHXVf9nG5KkuQvL/kc/1dP3aRzcytyqeb74k/4A/yoYyyYOhCtbGnBTjupO2V
         a9Vq5Tc1hSJV1ujB5lzSnKuwEPvccaJLrhSEzu+RVZ1aaoMGkeFESPZGOi/PgP2JOFZZ
         2jsrSw2itL29w1NgJN0nj2p2hzaN7wE+1I5W7j+1EImDxNtRff9gZ/moWwbxKwosDKKX
         JVCf6Y5YSlQNVyRJAn33gjNlBXKUDK/42Ij0cilJSyVSXp7aWb75witbbbB81cn5ajIU
         8L5DnMGXqLFC52ap1+wCAL5ysWb5+8kaXmM1bQ7rp+Z7kMgAW8kZSANXTl8mGOOpEwo5
         25mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701553217; x=1702158017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SBC2etg0t87/NEQAbw4GxIuosiaBjUOZpDVVT0P9EvQ=;
        b=fmxW/jVKVSA2Vx5yPcXy/SEC4p5+XOE55zuWxwRCUUuM/2isCdJ2xz2y3YYW7oOKzD
         1cqdOGYrCUo4prdEXyIP0pUiI22KN3z13JyWiR+mG6nUxmtdzYwYqcu+sv7SCMBcPZHT
         NePsDh5FNaaoV6Yx261+hDnFbvO7Z4mnK0MkdbEA4UgWY8v214AX/OyybN0rnyiD8LkG
         ILicNOiC5KG28POnsWiZ2OcJ2S7TjRWoWNQ+aE9t2x6flDQRIs/oA+c13Gj6B09+leH9
         jExyqS3dgwX+D/+6iHYqh54AHOc3pOabTkDQPjca8HVhac6Pwwf62HUNXfTQBtXYA6Ka
         14SA==
X-Gm-Message-State: AOJu0Yw0pRjG6E96AzEZ/lwnDHb/MGXbAmLxQxo0frv2hBHkLaIstZSz
	ZVbdagsYgLiImped5VFh5LEv4bckUcLlknUd0O0=
X-Google-Smtp-Source: AGHT+IF5YX9R0gQVH2TWa8b1HlMk/s4pSRy3Qk5p94J6OHigE3id3WsnP2AAZXxSg9IBfJW/WuFa/w==
X-Received: by 2002:a05:6512:3086:b0:50b:cb52:3c2c with SMTP id z6-20020a056512308600b0050bcb523c2cmr2452649lfd.29.1701553217543;
        Sat, 02 Dec 2023 13:40:17 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f24-20020ac25338000000b0050be6038170sm282996lfh.48.2023.12.02.13.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 13:40:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 00/12] drm/msm: fold dpu_format into mdp_formats database
Date: Sun,  3 Dec 2023 00:40:04 +0300
Message-Id: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During the review of [1] Abhinav pointed out that mdp_rgb_formats and
mdp_rgb_yuv_formats arrays from patch 1 are directly based on the struct
mdp_format formats array. This was true, because MDP4 / MDP5 drivers
used their own (small) list of supported formats. The DPU driver,
supporting more formats, had larger database of the formats and their
properties. While we don't have plans to expand MDP5 formats support, it
make sense to merge these two databases into a common dataset.

[1] https://patchwork.freedesktop.org/series/120377/

Dmitry Baryshkov (12):
  drm/msm: fix BPC1 -> BPC4
  drm/msm/disp: add mdp_fetch_mode enum
  drm/msm/dpu: use format-related definitions from mdp_common.xml.h
  drm/msm: add arrays listing formats supported by MDP4/MDP5 hardware
  drm/msm/dpu: in dpu_format replace bitmap with unsigned long field
  drm/msm/dpu: pull format flag definitions to msm_drv.h
  drm/msm: merge dpu_format and mdp_format in struct msm_format
  drm/msm: convert msm_format::unpack_tight to the flag
  drm/msm: convert msm_format::unpack_align_msb to the flag
  drm/msm: convert msm_format::alpha_enable to the flag
  drm/msm: merge dpu format database to MDP formats
  drm/msm: drop msm_kms_funcs::get_format() callback

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  22 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |   4 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   | 658 +-----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h   |  23 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   |  16 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   | 123 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  45 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  17 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |  22 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h     |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  75 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     |   6 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      |   1 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c    |  89 ++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |  16 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      |   1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    |  98 ++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c      |   4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h      |   2 +-
 drivers/gpu/drm/msm/disp/mdp_common.xml.h     |   8 +-
 drivers/gpu/drm/msm/disp/mdp_format.c         | 611 +++++++++++++---
 drivers/gpu/drm/msm/disp/mdp_kms.h            |  17 -
 drivers/gpu/drm/msm/msm_drv.h                 |  64 ++
 drivers/gpu/drm/msm/msm_fb.c                  |   2 +-
 drivers/gpu/drm/msm/msm_kms.h                 |   4 -
 30 files changed, 884 insertions(+), 1065 deletions(-)

-- 
2.39.2


