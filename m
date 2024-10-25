Return-Path: <linux-arm-msm+bounces-35752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 415269AF60F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 02:20:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 058662829C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 00:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1199BA45;
	Fri, 25 Oct 2024 00:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oRSWFq+p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6265221
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 00:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729815618; cv=none; b=ZZGOE8RTsVyNxGGw+YCqJ3OeMUIu9VHmLIfJRuByLnvtME81lC4chMUn+9qKbabiVwjW4Mzbg+ieSOzU16UZEq5sif0fyf3v2htsDj2wXAlonx+mlN9twamFg0JuidPPKN39B1CZtBc3+EsK9wyRGRrYYt9gTP4mgV0KMJxzH5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729815618; c=relaxed/simple;
	bh=gEmPtzvaszc7tBoZ+Kp2glF1v75duuWmxH0rar9ZL2I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Jt3gatT6o+Y8wKPwLW+ALtGXPJL9EyIjFqyA0MkD7BOPV+soUdHlUYPng/05sGoAnu7vmHjLfotGheNI5PFQVCDEuFQ0i3QqbAGByNU35KlMbe4VeojO6TsoDNkAoDQYzYNFOWWvbqlBVm+qw423jh64PIBXCCag0i2uGPXIEQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oRSWFq+p; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539f6e1f756so1772223e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 17:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729815614; x=1730420414; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PnmCf8UPcSyAfAGwfD2QhUDxxiR4XEmMmwHKfvOXzzg=;
        b=oRSWFq+pjWOECM6qYKg31h+WG9wZmHAlQZKg6PRzP2YQ33lSG1uL20xA7rJ98Vztxp
         qvRXpRi4Md/n4m1HjCAvl8FIxRj9EWMieb9QHrLxKqsrWexsFDUi1GEz9iU/tsVOJLpK
         QK1DUdKWD/EGYvr/3nUDHXEfZzoi/Xl8V9fQTbPWrGo6u8hbbAn9AGbItjGtYXru684y
         qd93+5P66nAM/VA2sjZ5MGkQOECS+9akS1WCMe+397tqeULOXEBKz/wndXYzPgn5jA+a
         Cqa3YQ6nVO0fJpFjbwi0xHrg5Z2rTlc7ng3A073Pij3nd4Fwjly4RrUR322h+1WYRCF0
         GTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729815614; x=1730420414;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnmCf8UPcSyAfAGwfD2QhUDxxiR4XEmMmwHKfvOXzzg=;
        b=scV5RJnQ+NbGt2x8S6LrRzpIO0tDz0nRmc99FTmlHtVOb/H+EqCThUJjMs4PpYU+YR
         mO4BA9cJVzxBN5xnW4f6R5MYv0AtmIB7YG7UPJhrB4KIalj90YKd0TcpKGiGtM5p0yKe
         drxiMfr/b7FiKWObd+fAST9H3/h2D5A+QdzhkwcE6vN/vi/X8FYu/N/ggTVZydUB+5rF
         kRI1hG6GCUbC5D7wWMT12bGVONrg7WtI3r+aj5104ZmN+grb7fdTNML3kxQLfevygMNQ
         TEzdMMscHAIXk9vc7eEJs8WrhrN5uttZzhEEJGcPeVIUBUtmbeVDJd1PQ+3Mf+rcmyA0
         8cWg==
X-Gm-Message-State: AOJu0YyovdIJhPhfiT5EzDatb/AEFc2FeeYzWJn4CnFzhQWHOTt5DPFV
	zAfhxyZNt7zYpoTiR/QeEmKbXRpzYKShQrfurMvhl2F1AU/HcYmPJs+Beg50rOo=
X-Google-Smtp-Source: AGHT+IHLpRs6BD0MjhLwqVPzLq4Gx5AH71ZiAkGzGzmIGfEwt1PSjS+GdrikSxEbJnMQsFEW7o7wqg==
X-Received: by 2002:a05:6512:224e:b0:539:8df0:4d3f with SMTP id 2adb3069b0e04-53b23e8eb2fmr2794295e87.40.1729815614174;
        Thu, 24 Oct 2024 17:20:14 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1b05b3sm6227e87.161.2024.10.24.17.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 17:20:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v6 0/9] drm/msm/dpu: support virtual wide planes
Date: Fri, 25 Oct 2024 03:20:07 +0300
Message-Id: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADfkGmcC/2XOQQ6CMBCF4auYrh0yVKjiynsYFq0MMlGpmUKVG
 O5uNTGauHyL9+V/qEDCFNR28VBCkQP7Pg2zXKhDZ/sjATdpK426QKMNNNcRIssw2jPcuCFwRK1
 bF8ZWiCrdrkIt39/kvk67FX+BoROyX2iVF4ioc5OtKl0WFeTQXHiQKXNWptCdfNydubfiMy/Hl
 9pxGLxM785YvuxP0vo/KZaAUKasCg/ObRz9YvU8z09Onz5F9wAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3971;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=gEmPtzvaszc7tBoZ+Kp2glF1v75duuWmxH0rar9ZL2I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnGuQ5m3pKr0kVzZWcLNSXGtuP2iShZ+NFs+nUm
 cNQz2jOLu2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZxrkOQAKCRCLPIo+Aiko
 1ZcIB/4/OOVahVWSiMTDscfmUCJ42RxQjj4h1oDljs2JXJjgQ1ZaFC4wToBo760ZJ0QAHvIVeJS
 yMaq1YaFiiqtCKzzQUk/0kNtT6KE79dfG9TieZAUgvTrI74aInsl3fVbmGDoEi90A00aEuyS+Uw
 0H3L9EBhVlsSFftt2av/HQtAzdEa1QE+WbmvoHQMAJACTBdpoerWd1Qhs3MD2UubJl+L//yMLw6
 /d615HK1Y9J3xVkq8bJJ0b5RaSsv0FAsTo0aTKUNAILkICfAxF2IBLtx4iDBg+Ck6n9kBU+jkq3
 h1hFD/3zmRHj0m82JdhdZw1aMHtSlsWmG7enF4twcOyVxtnZ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

As promised in the basic wide planes support ([1]) here comes a series
supporting 2*max_linewidth for all the planes.

Note: Unlike v1 and v2 this series finally includes support for
additional planes - having more planes than the number of SSPP blocks.

Note: this iteration features handling of rotation and reflection of the
wide plane. However rot90 is still not tested: it is enabled on sc7280
and it only supports UBWC (tiled) framebuffers, it was quite low on my
priority list.

[1] https://patchwork.freedesktop.org/series/99909/

---
Changes in v6:
- Renamed dpu_plane_atomic_check_nopipe() ->
  dpu_plane_atomic_check_nosspp() and dpu_plane_atomic_check_pipes() ->
  dpu_plane_atomic_check_sspp() (Abhinav)
- In dpu_rm_reserve_sspp() replaced hweight usage with explicit type
  allocation (Abhinav)
- In dpu_plane_atomic_check() set r_pipe->sspp (Jun Nie)
- In dpu_rm_reserve_sspp() check hw_sspp->ops.setup_scaler to rule out
  SSPP blocks with unsupported scaler blocks (RGB, QSEED2)
- Link to v5: https://lore.kernel.org/r/20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org

Changes in v5:
- Dropped extra dpu_kms instance from dpu_plane_atomic_check() (Abhinav)
- Use DRM_PLANE_NO_SCALING instead of (1 << 16) (Abhinav)
- Dropped excess returns documentation for dpu_rm_reserve_sspp() (Sui
  Jingfeng, Abhinav)
- best_weght -> best_weight (Abhinav)
- Moved drm_rect_width() call back to the the patch "split
  dpu_plane_atomic_check()" (Abhinav)
- Got rid of saved_fmt / saved dimensions (Abhinav)
- Expanded the commit message to describe SSPP allocation per CRTC id
  (Abhinav)
- Added comment on why the size change also causes resource reallocation
  (Abhinav)
- Dropeed several last "feature" patches, leaving only SSPP reallocation
  and using 2 SSPPs per plane for now. The rest will be submitted
  separately.

Changes since v3:
- Dropped the drm_atomic_helper_check_plane_noscale (Ville)
- Reworked the scaling factor according to global value and then check
  if SSPP has scaler_blk later on.
- Split drm_rect_fp_to_int from the rotation-related fix (Abhinav)

Changes since v2:
- Dropped the encoder-related parts, leave all resource allocation as is
  (Abhinav)
- Significantly reworked the SSPP allocation code
- Added debugging code to dump RM state in dri/N/state

Changes since v1:
- Fixed build error due to me missing one of fixups, it was left
  uncommitted.
- Implementated proper handling of wide plane rotation & reflection.

---
Dmitry Baryshkov (9):
      drm/msm/dpu: use drm_rect_fp_to_int()
      drm/msm/dpu: move pstate->pipe initialization to dpu_plane_atomic_check
      drm/msm/dpu: drop virt_formats from SSPP subblock configuration
      drm/msm/dpu: move scaling limitations out of the hw_catalog
      drm/msm/dpu: split dpu_plane_atomic_check()
      drm/msm/dpu: move rot90 checking to dpu_plane_atomic_check_sspp()
      drm/msm/dpu: add support for virtual planes
      drm/msm/dpu: allow using two SSPP blocks for a single plane
      drm/msm/dpu: include SSPP allocation state into the dumped state

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       |  50 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  28 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |   8 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h    |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h        |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 539 +++++++++++++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h      |  18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c         |  75 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h         |  27 ++
 10 files changed, 606 insertions(+), 155 deletions(-)
---
base-commit: 2261751d5f2233a7a5d4791d6d13a0271e838ca5
change-id: 20240626-dpu-virtual-wide-beefb746a900

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


