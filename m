Return-Path: <linux-arm-msm+bounces-34627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF6F9A100D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 18:48:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65D751F2157A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 16:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B8D520F5CD;
	Wed, 16 Oct 2024 16:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HBWInXG6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3CB20C03A
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2024 16:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729097301; cv=none; b=DWIzUzQKOyhq4ocmFxC4hzRk7jMihCVJbeIw3fzcOhM0JHUSyXSN4N9ug+egjao30s7QLKvIoUOR/gBc9GtnBTfFSokmDAIvUqYbeiX+GP3M3/EPpHgjjHtSzJX8czmPzGFzG/NdJMDakdiAJ+GLi6P7qAnFhyWxXepCkzBytS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729097301; c=relaxed/simple;
	bh=1buzKDDUvHAm0BFmegVg73RDlcF2iIc2GLIZ5uMXWWE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=MnTHF523ZjWh38sbNfcUwRldagsvxHlWM79pcwAE+GNGrszIHF7Jwjsfw0Q6Wqdoc+6cOwVCq6FutkM/sLqXMUsSE2TsfS/IhA6LsAl8LsrG1mLcziWnoFjJ9jwuOTwN6Cg0UInlc+F5NuzzCtCtezlGhUF+TPIOG+7KeOJWriQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HBWInXG6; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3a3938e73d3so360815ab.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2024 09:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729097299; x=1729702099; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FnOzc/HN0SAiUbTsStSbFnNR06opn4+9p90Mwo7rsHM=;
        b=HBWInXG6KTzwV7t8LqBw8EG6DKht9KNCRjHjm5uWlyzdbSnpXRAFVkHvK85FQZuV5r
         tDGdPQwHccyrzkWGFYspA6UZ1EuyioZ46V1tOUiV1DnMNrCiJy3nuaatcfjPF62upvhv
         CZgvNfA5QDE+nzaMK5xiUTOd8eoqDJDkTFy3WHKUVRJNSDEUOstG4YBMEAbYVXa0901S
         vjn8MUYNMrrCxIcenzCL7IMi+ZoXBx8n0NpNeT2nkfOvhxdLNCalS4kL9afVis2KUemJ
         0nIl0/6mJijGE2vJKtCd56PqrSdnWTJRJ8Wk0WWfpBUN9zO/no/hNUpilXmjgP5sUCvU
         8ImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729097299; x=1729702099;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FnOzc/HN0SAiUbTsStSbFnNR06opn4+9p90Mwo7rsHM=;
        b=Yrc5L/zB93k2Un3uxPhaBBPTN/Lfpwe0lhlzXmAQF7IkETtkl/mPBOyJNphlz8qP9g
         ENDA36RypCKk3I3McNtIXrZQ+kUfdn11MS5daEJAdB4twEWiOvalWKBMQSNn+/REUqyy
         mEor/+c1fxZD8kzmh7rXICvvW2y+LAtMX1jDmrWqaoSDK7K+lG1iE2NmfZZZdq4LbURI
         +YnVM40zRurBFj1QgQp2WwRKZOvApnimNqltGWJ1oaVbtyyHOnRVjsL86ubhq2VWwaCm
         bGlWcuzkQMsLxJ2CK8IlY7nt5VpK5k/c/GPuAmIRp+uC5Wq3/jxavzOAssP9X3QD+tv6
         DnYg==
X-Forwarded-Encrypted: i=1; AJvYcCU6cFspmBT/KSTaEO38m24kJNPGHo6UF1h8mC7WkrBSMw7jtL/h8j3L0yj/cjNnBTM3nLD4XLHGeCal15H6@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4RagLYGJAxZA421RpGk08D6Vwd+Ds0GoiYEIrSXdLtd0HnxXg
	qLU4g6snBGKy7yic9ffTg047SbhcZn9VVbFFki8n6N5HO7UA0MYhZWc6z2B6qrzhM98cP82hiKK
	OuuezWPi/L1+7ZkeAVijXLU6zt5w=
X-Google-Smtp-Source: AGHT+IHNIu60KcbuEcAqnZIAwcjakWjSZZvuFyc4t/al0ks/MvRG1vvC7yPjvgTLtnB88tUv1khfr1F0DM7GNiWgBao=
X-Received: by 2002:a05:6e02:20c2:b0:3a3:4164:eec9 with SMTP id
 e9e14a558f8ab-3a3bcdd63b4mr152137705ab.14.1729097298826; Wed, 16 Oct 2024
 09:48:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 16 Oct 2024 09:48:06 -0700
Message-ID: <CAF6AEGsp3Zbd_H3FhHdRz9yCYA4wxX4SenpYRSk=Mx2d8GMSuQ@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2024-10-16 for v6.12-rc4
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
	freedreno <freedreno@lists.freedesktop.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Dave,

A few fixes for v6.12, see description below

The following changes since commit 15302579373ed2c8ada629e9e7bcf9569393a48d:

  drm/msm/dpu: enable writeback on SM6350 (2024-09-02 02:53:44 +0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2024-10-16

for you to fetch changes up to 77ad507dbb7ec1ecd60fc081d03616960ef596fd:

  drm/msm/a6xx+: Insert a fence wait before SMMU table update
(2024-10-15 17:18:16 -0700)

----------------------------------------------------------------
Fixes for v6.12

Display:
- move CRTC resource assignment to atomic_check otherwise to make
  consecutive calls to atomic_check() consistent
- fix rounding / sign-extension issues with pclk calculation in
  case of DSC
- cleanups to drop incorrect null checks in dpu snapshots
- fix to use kvzalloc in dpu snapshot to avoid allocation issues
  in heavily loaded system cases
- Fix to not program merge_3d block if dual LM is not being used
- Fix to not flush merge_3d block if its not enabled otherwise
  this leads to false timeouts

GPU:
- a7xx: add a fence wait before SMMU table update

----------------------------------------------------------------
Dmitry Baryshkov (4):
      drm/msm/dpu: make sure phys resources are properly initialized
      drm/msm/dpu: move CRTC resource assignment to
dpu_encoder_virt_atomic_check
      drm/msm/dpu: check for overflow in _dpu_crtc_setup_lm_bounds()
      drm/msm/hdmi: drop pll_cmp_to_fdata from hdmi_phy_8998

Douglas Anderson (2):
      drm/msm: Avoid NULL dereference in msm_disp_state_print_regs()
      drm/msm: Allocate memory for disp snapshot with kvzalloc()

Jessica Zhang (2):
      drm/msm/dpu: Don't always set merge_3d pending flush
      drm/msm/dpu: don't always program merge_3d block

Jonathan Marek (2):
      drm/msm/dsi: improve/fix dsc pclk calculation
      drm/msm/dsi: fix 32-bit signed integer extension in pclk_rate calculation

Rob Clark (1):
      drm/msm/a6xx+: Insert a fence wait before SMMU table update

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 16 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 20 ++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 68 +++++++++++++---------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  7 ++-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  5 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c  | 19 +++---
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  4 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c           |  9 ---
 8 files changed, 89 insertions(+), 59 deletions(-)

