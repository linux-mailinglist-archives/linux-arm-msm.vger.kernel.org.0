Return-Path: <linux-arm-msm+bounces-30438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 574549691D5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 05:23:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75C741C20837
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 03:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A333D1CDFC2;
	Tue,  3 Sep 2024 03:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E5BGTtNZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A58E1A4E6A
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 03:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725333778; cv=none; b=oiq+9L5MrGfq/K4Zh5lsgXNaaHzgd5EWeqnHGU0jXTPKhK8NfJX76pLxervXBmYpXOeYn4AAUMxwpLVCtA/to8hX7kTR/D91LgHJwf7E58De8eDa8UTFTfnFBQPq6AUWsbqCIjcz4lQDnf/OHYQlYEUvAj2d5BCtCTxu3U61k4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725333778; c=relaxed/simple;
	bh=BWVEJP/ONJMOkJpUbz8o2AZX8ZM3XLIHEzcDCb2AhdY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RpDmt6Q0yh3lv7FyTqaFd9B7DKztZra9ejoFKVDfkz54VqEukHZuOATTqSaZS1fUg/KK7hkUnfn2TEXeICKdoOq8ThxGl1aKax8UHJcC6Z6E3GNApzMKtLRGq0vYTKKDxZwYeuUdeA4IE1IqHzTo91efjNiroVbJvzXZPK9vaOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E5BGTtNZ; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f4f2868621so51132211fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Sep 2024 20:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725333775; x=1725938575; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k86P+NeDmsIICrQRJRBhlplxtE6L+zqQWOXWus04Fdk=;
        b=E5BGTtNZE2ZpPoQz0q+E2FeKPFf8X1tPcKXszFLcht04C23E7aNPI4yBv6SmFmlmAd
         z5k/8fQlHyOi630N+37JELQD7YlmkaAaNBrIdIua8mA5BLSvjlrIAf0d1oMU4GNJ36n4
         7GJrdtDuUu8Op85qQfvrI1v/kfRDKiUoenZU2EidRYgVm05ANi1QvvWSmsMITjfQKhWK
         H7UdduwQYdDodRTlH03Wc5Tf3xI5e+Z+jMPCQj44zmrf2FwXgkV4zPw98OQZ2H5zaXhC
         p9mIjdADo4WpOXW6jvV2dx4RADOda+8wgQxWtVil1EtvG7hMWpjqj/5fZkjB9fIYp2P8
         Gihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725333775; x=1725938575;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k86P+NeDmsIICrQRJRBhlplxtE6L+zqQWOXWus04Fdk=;
        b=Tj00N6dd4/lop/3m5cURrSDcRgRq6ha78JSqIQ+IfZQphvr5lqFBnk8QcrNQnD/+pK
         FBqVJBbygHmvBKRzmMZV9831UGMwu9QZb/XO/iBKx0SSffN4uCPSf3onaf9hIA2qbcX3
         EEenVtHmDmWv+R2ZTp4niVTAt2cqoMFF1/NgtDrueS2DW4OyGNsWN3dsMPnjFvxp19Z3
         0I0Grd+RT+pdNHDXeLO+jP3BRqlJyJm9xuELrNE8eXYlBSLVe8a4pDCq5eH2vP8n2Xsx
         mA4lPJ14atesd+3uG1l+JNh91iC6CLmjPJ2rTerIq6ILA3pVk3BIcihPwvO7Z3dP24yO
         FROA==
X-Forwarded-Encrypted: i=1; AJvYcCUlJqtrq7FmBAnt7y6TziyLcnd0fdnj9KsX4Y32deqJGOjvJekaZfTT1f0aUUN/3vAd4nfbH9O4mslD5LIp@vger.kernel.org
X-Gm-Message-State: AOJu0YzcwiYlsIRL8b8XffcTlts+lRQXctUJk8TDefzXLpSCU52epVe/
	zuyvitHuFBQo+EtZE5A+gcttDDK6vZnj6YiFgHc/IuwJFIDBtcrv1CyVCzTBiks=
X-Google-Smtp-Source: AGHT+IHup46cN3yQHFtBvP4UoyD6AAcxffm5fZhZ+b6e//DT+N4kqwIf/Nd53QViZRdsD52isOP+xg==
X-Received: by 2002:a05:651c:1545:b0:2f3:fd4a:eac6 with SMTP id 38308e7fff4ca-2f629041d3dmr51981481fa.18.1725333773785;
        Mon, 02 Sep 2024 20:22:53 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614ed15a5sm21003961fa.8.2024.09.02.20.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 20:22:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v6 00/15] drm/msm/dpu: be more friendly to X.org
Date: Tue, 03 Sep 2024 06:22:43 +0300
Message-Id: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAOB1mYC/3XOTU7EMAwF4KuMsiYof840rLgHYpHGSWsJmlE6F
 NCodycdCVFUZfksv8++sTkWijN7Ot1YiQvNlKca7MOJhdFPQ+SENTMllBFadhwvH/w9Y+QhT4k
 G/kl4HblVFnU4ewTlWe1eSkz0dXdfXmseab7m8n0/s8ht+iu6hrhILjiKFG2fOtkn+fxGky/5M
 ZeBbeSi/hgrdItRlZHWJ1ACzuDtgdE7RpoWoyujXAx1yQXn+gNjdoxqMmb7RuguSI1eezgwsGe
 gxUBlQEh0nUGrTfrHrOv6A5TtRzLXAQAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3939;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=BWVEJP/ONJMOkJpUbz8o2AZX8ZM3XLIHEzcDCb2AhdY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm1oEH5JMLUNrrzbgK45w6apcf3EfatK6LZJ3+E
 wRkqZlhv4KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtaBBwAKCRCLPIo+Aiko
 1ZJvCACvXSgRM4G9ST5s8TaC31WE0fKnDcQ0H1u6rQ3/pxZUKfiW47dfvrTwZt95w12HY7xl+ON
 FL99dIjwvpPWzRTpQn+j+JyxNwl2fZvI22I0Vns1aE+vysbwV+e2etagCv/szbCYxEla65PgIBQ
 Iq5PdYToIoYR43LuQINahbZFRW9XxRJs+tqCcEaLf4nx0jaF0Fl5ZGiU9hJ0EIrUum3JYrnRs6B
 YQfhNXiHxY12T9wp/cFC4HFy5XhTrpveTfVOvJ3FHHUU7CySnQKlS99Y1xw6j8tNEdBxQuH/bk6
 78iP3jx6m+RYBdqGMhI67lz17s4U9Xk9f3huV+VKzCNEIUcy
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Unlike other compositors X.org allocates a single framebuffer covering
the whole screen space. This is not an issue with the single screens,
but with the multi-monitor setup 5120x4096 becomes a limiting factor.
Check the hardware-bound limitations and lift the FB max size to
16383x16383.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v6:
- Fixed the commit subject of the resource assignment patch (Abhinav)
- Reworked resource assignment to dpu_encoder_phys in
  dpu_encoder_virt_atomic_mode_set (Abhinav)
- Fixed num_dspp check / hw_dspp assignment (Abhinav)
- Moved dpu_encoder_assign_crtc_resources under the needs_modeset()
  check (Abhinav)
- Link to v5: https://lore.kernel.org/r/20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org

Changes in v5:
- Fix crash in the writeback code.
- Link to v4: https://lore.kernel.org/r/20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org

Changes in v4:
- Fix handling of the not visible planes with the FB being set, as
  detected via the kms_cursor_edge_walk test.
- Link to v3: https://lore.kernel.org/r/20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org

Changes in v3:
- Reoder the functions to pull up a fix to the start of the patchset
  (Abhinav)
- Rename the _dpu_crtc_setup_lm_bounds() to
  _dpu_crtc_check_and_setup_lm_bounds() (Abhinav)
- Make dpu_crtc_mode_valid() static.
- Link to v2: https://lore.kernel.org/r/20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org

Changes in v2:
- Added dpu_crtc_valid() to verify that 2*lm_width limit is enforced
  (Abhinav)
- Link to v1: https://lore.kernel.org/r/20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org

---
Dmitry Baryshkov (15):
      drm/msm/dpu: make sure phys resources are properly initialized
      drm/msm/dpu: move CRTC resource assignment to dpu_encoder_virt_atomic_check
      drm/msm/dpu: check for overflow in _dpu_crtc_setup_lm_bounds()
      drm/msm/dpu: drop dpu_format_check_modified_format
      drm/msm/dpu: drop dpu_format_populate_layout from dpu_plane_sspp_atomic_update
      drm/msm/dpu: drop extra aspace checks in dpu_formats
      drm/msm/dpu: drop msm_format from struct dpu_hw_fmt_layout
      drm/msm/dpu: pass drm_framebuffer to _dpu_format_get_plane_sizes()
      drm/msm/dpu: move pitch check to _dpu_format_get_plane_sizes_linear()
      drm/msm/dpu: split dpu_format_populate_layout
      drm/msm/dpu: make dpu_format_populate_addrs return void
      drm/msm/dpu: move layout setup population out of dpu_plane_prepare_fb()
      drm/msm/dpu: check for the plane pitch overflow
      drm/msm/dpu: merge MAX_IMG_WIDTH/HEIGHT with DPU_MAX_IMG_WIDTH/HEIGHT
      drm/msm/dpu: sync mode_config limits to the FB limits in dpu_plane.c

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  34 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  68 +++---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  37 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        | 243 +++++++--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        |  30 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  50 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |   3 +
 drivers/gpu/drm/msm/msm_kms.h                      |   6 -
 14 files changed, 201 insertions(+), 295 deletions(-)
---
base-commit: ecc768a84f0b8e631986f9ade3118fa37852fef0
change-id: 20240318-dpu-mode-config-width-626d3c7ad52a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


