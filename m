Return-Path: <linux-arm-msm+bounces-1393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FD17F34A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 18:13:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E06792828F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 17:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9841168BD;
	Tue, 21 Nov 2023 17:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XxNBfzrK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 700381711
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Nov 2023 09:13:15 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-543c3756521so8006359a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Nov 2023 09:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700586794; x=1701191594; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tfrKxQU+NNoEgEsTzhWUkNf39I3RD72xOvaEb8T1Q6Y=;
        b=XxNBfzrK5aQMwNa4Y6RJtCXlVMCY/k7RqowwxZ1Fd6Ryp0eMt14y3VvQNFSS0Sb3mw
         Q3a8dFHwNKnaS8rWo5I91FAsGEpxmoRA6TNCHoiTmgHqUooxXGeA7qpi1TM8rtsbRO0U
         PgOVJSty31BTL+fo8WcwX0Yrr2dVrNcaK35YwH+rb2VZ2/qRaZzGDd4pQ//9Do53XpN8
         Q9nbA//69IU0X8zthL+MpjkWQ8D74HBYR1h0A3OoyADouZc2MRSVI6IhgJJ5a+fUW8Q2
         jNmVd2/zG3P+tGu03qvaWqVekvC2W+IYHVzciueZEjD0G7/hQQveAHLd6DopRZONvcYn
         pqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700586794; x=1701191594;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tfrKxQU+NNoEgEsTzhWUkNf39I3RD72xOvaEb8T1Q6Y=;
        b=r0Ge8FQBFPRFv8P2esLPiGBQhz6Ehh9vNY0NS9DPwmd3xMH0mo4vPfEmoFS/Y2ac8O
         aCphu548wcv4GHbxXOISpzsakc3Vy19NyRoG4J3X/IfxTxOfqFUiHaZ0uUJuL90BZKT6
         e5fQG8jhi3r/hDV4JvuFXDMczIFx/ZQu5rbX4byQBXSSXqAMCUA/L7MDwTOr0blfM9Au
         uq+ywxrNE/jUpb8XWZ0ysshXdlhli2Xo/4PRpmgHUC3J0ZbASv0rpgX7C4cYVzBnVoN/
         KE6iMYkpPc/+4kBULy/Z1yDpaoejt8yvkOt7BvedJDGZIMmV1HLB94uniC6qCur5n/wm
         iKRw==
X-Gm-Message-State: AOJu0YxdzW6eEJirQ/kwHOp4eKeNOJyH4rc/Ehx5cHiqOn9pDxTrk+9Y
	oFWwFwRxUy950MPCQRFI4Mqv4CaTODQdg9396aA=
X-Google-Smtp-Source: AGHT+IHVKdbANVF0O868LMUeMnwzlbjGCJCKaJOT2Q+jF/7i+A0oTP25OuFrrkLpZkfRP2d4cGgDDzeMfznicLPIAXA=
X-Received: by 2002:a05:6402:3d9:b0:548:e8aa:dfc8 with SMTP id
 t25-20020a05640203d900b00548e8aadfc8mr2020104edw.32.1700586793501; Tue, 21
 Nov 2023 09:13:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 21 Nov 2023 09:13:01 -0800
Message-ID: <CAF6AEGtkna3P3mvaF53n2ARJACaXQU+OFfShayTrsUVmqCOmNQ@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2023-11-21 for v6.7-rc3
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, freedreno <freedreno@lists.freedesktop.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Dave,

A few fixes for v6.7, description below

The following changes since commit b08d26dac1a1075c874f40ee02ec8ddc39e20146:

  drm/msm/a7xx: actually use a7xx state registers (2023-10-16 09:38:56 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2023-11-21

for you to fetch changes up to 56466f653cb59a8f46e991ad1e285f43afdca7d4:

  drm/msm: remove unnecessary NULL check (2023-11-17 15:32:49 -0800)

----------------------------------------------------------------
Fixes for v6.7-rc3:

- Fix the VREG_CTRL_1 for 4nm CPHY to match downstream
- Remove duplicate call to drm_kms_helper_poll_init() in msm_drm_init()
- Fix the safe_lut_tbl[] for sc8280xp to match downstream
- Don't attach the drm_dp_set_subconnector_property() for eDP
- Fix to attach drm_dp_set_subconnector_property() for DP. Otherwise
  there is a bootup crash on multiple targets
- Remove unnecessary NULL check left behind during cleanup

----------------------------------------------------------------
Abel Vesa (1):
      drm/msm/dp: don't touch DP subconnector property in eDP case

Bjorn Andersson (1):
      drm/msm/dpu: Add missing safe_lut_tbl in sc8280xp catalog

Dan Carpenter (1):
      drm/msm: remove unnecessary NULL check

Dmitry Baryshkov (2):
      drm/msm: remove exra drm_kms_helper_poll_init() call
      drm/msm/dp: attach the DP subconnector property

Jonathan Marek (1):
      drm/msm/dsi: use the correct VREG_CTRL_1 value for 4nm cphy

 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  1 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c                 |  3 +--
 drivers/gpu/drm/msm/dp/dp_display.c                      | 15 ++++++++++-----
 drivers/gpu/drm/msm/dp/dp_drm.c                          |  3 +++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c                |  2 +-
 drivers/gpu/drm/msm/msm_drv.c                            |  2 --
 6 files changed, 16 insertions(+), 10 deletions(-)

