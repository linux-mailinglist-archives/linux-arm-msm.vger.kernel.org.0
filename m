Return-Path: <linux-arm-msm+bounces-14513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1900D87FE9D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 14:22:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4402C1C22B70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 13:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B3580028;
	Tue, 19 Mar 2024 13:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z8xV9uAl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813FF3FBB9
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 13:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710854528; cv=none; b=PupjnqYzGkkiiBDQIJIPVoGyj0DzR2FiGU4USfWhXwY1LQIfUXs36Ux128Td+LC/oRyhov1G2Wk+beB0y5uIguWHDpb4ZWERK7R48FMbKBopcGqFzI8zK/B8JCAFGvWhwVR82tVb1JRaEhScbRNCS3qyVXgaJ5Z0v4dFHCjB6JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710854528; c=relaxed/simple;
	bh=vEwF8PeSZna9nyompVbo2D0ZcBnEt90ZIcLtzS4Bm6w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZwFr61nTWovAA4X5ceoSzd2c7SUbzunjJxkjXePjKucSqkE9PxfZuqrFTJuINlLvFDufGMcWuRkqQ0Wx48RDYtaQYp3KQ1FpEyHTluQSElQQHveonSUJLB95bbOwxUaV+FYIA/E3bbCcm5YOA9FSGCHReo6gAtt9Fnq4/Qxgig0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z8xV9uAl; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d49f7e5c2cso36938491fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 06:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710854522; x=1711459322; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bozLgVEsHwe94zFSCLw5L7te+ic20oRug81TlWIaqUc=;
        b=z8xV9uAl5MGYvd+HzdM0Fg3YdqQapbQRtaTyvFb2THuzVw+RGnCOoENC3KgcILy3Jw
         iuanHbUkQ0owNU93eBpd4hSyjOkhHUHpT/SoJKgkoayiWSmYKIaL4CulrtEP9E3vhYzR
         nQy6VW5EePe6AXTdIsioLeXR2BzZOgq1tHxwyB0gcAnWGowopdzlFIJSKAQzuHZhNFBT
         O5TOZK01MaPwemGWVpp+619IU7zynR3WO9V8YWMJ7CM3+KH3lhqDZWupYsFTLbJcnjoE
         q/I7HLvnxtcgSlmgM0PkTVyk76RgRhazcbY1LTTspYLk8O2DXNNC+7Q4X3ovLkK2RbXK
         XIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710854522; x=1711459322;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bozLgVEsHwe94zFSCLw5L7te+ic20oRug81TlWIaqUc=;
        b=BKtPApnruGNjKkZTAKqvt+3UWoAdZIeCTk6eBSPqXtZ47+9aUJOjQrqGp6L1UsIhnL
         yrQKHS/s6ux5WhYql1puZ4Dw4HZ3WL92ltALUr1YBGYepE2CvaaZcs/wlCUoHsAJfA49
         wHFsJHOIVEnhz7zaxBzH1eQDZW1ZSauHp2FVAxz1ZOUDMvCkqspVwMCMWWppOavwhExl
         GPtN4UEKkQxkd5nZQ6qFOxLeOWFagivii/m5eKYPjEc0K2frybEvIlhH/kGOm1w7Q+Xq
         DbdEowPRi7MlQi1LhKD/dZoDWB7WMW+wStMfRJRUMpY/JkF7z2uNYX3jSrUfMoB1tHHf
         Vy8A==
X-Forwarded-Encrypted: i=1; AJvYcCXij17Cx9HMu0+j6OqmDPt7RjwXDFyVOWmr1zjFS+2ckgqZr/3/SAYwXJ1ml0xLccKXxge9KS1rFqUsDpfTvr3KPj9IHmqAst8B2Mla4A==
X-Gm-Message-State: AOJu0YzEfCJJk/Q/8jTmaJgIoTqBMgjdFtlfmVJb1FflmemSpWqag/pZ
	AnF3upr5O+SNWAbj2F7qCxpgDFO2hBBKmklybUYq7SLrerWxbvRLobepizsmjok=
X-Google-Smtp-Source: AGHT+IGC6bucP3tsOwv8jCC11mr1M3U8g1c6PjVup2qX0GFAfX3rE4RaAkHuMb0ok0C7hrmlqSXgUg==
X-Received: by 2002:a05:651c:8e:b0:2d4:9936:a45c with SMTP id 14-20020a05651c008e00b002d49936a45cmr6235663ljq.41.1710854521621;
        Tue, 19 Mar 2024 06:22:01 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j7-20020a2e3c07000000b002d435cdf2adsm1826148lja.111.2024.03.19.06.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 06:22:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/9] drm/msm/dpu: be more friendly to X.org
Date: Tue, 19 Mar 2024 15:21:58 +0200
Message-Id: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHaR+WUC/x3MSQqAMAxA0atI1ga0dcKriIvSRM3CVlonEO9uc
 fkW/z8QOQhH6LMHAp8SxbuEMs/ALsbNjELJoApVFbrskLYDV0+M1rtJZryE9gUb1ZC2raFaGUj
 tFniS+/8O4/t+4zKbnmcAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1897;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=vEwF8PeSZna9nyompVbo2D0ZcBnEt90ZIcLtzS4Bm6w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl+ZF3wFpasaqjdm/4ur/9DTow0nLUrxTvBCG91
 EYn7Cju/4uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfmRdwAKCRCLPIo+Aiko
 1fLGB/9kmw1QZW4GgH7KifImPbi6NW0/CaWZFUkI0zWssY2OAeLsste9Utpbnpjf5onfGSd+hJE
 oj/v+ixuwL3Bza1W8Fvj4juZGgSKM17pnzG/Db+k7vzTFTPNoq9hnvHE8KWQhgmI0z+2P7NsSdO
 8Za2RPquLLCHSfXTFbkmCYrkxRc7/7hlzzeTinXHNXZU2Bwtqx9L0vwe8I9OLzfQyBnIfHvpgFD
 dpEE5TSdVxvg94KL00zy1PHE7XG0konZwllPLhmOiwEZ9RzUgI0e60/E0H5AZplSj5ieWYaUDb/
 SVZEcWzFVrhkoPo+reKO88vf9Mr1vnwpswHc2ToGwVWBRNPV
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Unlike other compositors X.org allocates a single framebuffer covering
the whole screen space. This is not an issue with the single screens,
but with the multi-monitor setup 5120x4096 becomes a limiting factor.
Check the hardware-bound limitations and lift the FB max size to
16383x16383.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (9):
      drm/msm/dpu: drop dpu_format_check_modified_format
      drm/msm/dpu: drop dpu_format_populate_layout from dpu_plane_sspp_atomic_update
      drm/msm/dpu: split dpu_format_populate_layout
      drm/msm/dpu: move dpu_format_populate_plane_sizes to atomic_check
      drm/msm/dpu: check for the plane pitch overflow
      drm/msm/dpu: drop call to _dpu_crtc_setup_lm_bounds from atomic_begin
      drm/msm/dpu: check for overflow in _dpu_crtc_setup_lm_bounds()
      drm/msm/dpu: merge MAX_IMG_WIDTH/HEIGHT with DPU_MAX_IMG_WIDTH/HEIGHT
      drm/msm/dpu: sync mode_config limits to the FB limits in dpu_plane.c

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 17 ++--
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        | 92 ++++++----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        | 23 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |  2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 10 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          | 37 +++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |  3 +
 drivers/gpu/drm/msm/msm_kms.h                      |  5 --
 10 files changed, 75 insertions(+), 126 deletions(-)
---
base-commit: 8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
change-id: 20240318-dpu-mode-config-width-626d3c7ad52a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


