Return-Path: <linux-arm-msm+bounces-28999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E0A957250
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 19:45:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87A501F238E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 17:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 597A3188003;
	Mon, 19 Aug 2024 17:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kosuAoUn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EDE188CC7
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Aug 2024 17:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724089498; cv=none; b=QZjS5gG/3DmVYZPxKG+fOBedctjmaASbN3V/pmP/OG2XykXTBOEHsBNDpn3fS0i25yanuCJRg8cPGLDumdSGJBYQSBOWcFgyTw+Q8VhsV2r+67opON1+eSWA5gffiisRp+FEG4ernr6edp9n8SvJHjslQY5HNRSktLa9xsdbgBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724089498; c=relaxed/simple;
	bh=/C4h0ZjTOtvWsCLc2SqGW5m6M0l7WwDl/wLkRMPcAiw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Jn4fl1A5Y7xSg5GsDHmRETlHjc15eplh1IPod1BZMdX8VwM+tOMknX2HBOV9pXfHv72se4em73PZPTAJRN/DDDYyM5JT+LHuzEO4oeAI0qZ9AOJGW9+sbPN7Nr9XsHNUq4+Mtvy3y/kENto1aslRWdgZVRjxJeS5Zd4MLg2XKhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kosuAoUn; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-44fe58fcf29so25988751cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Aug 2024 10:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724089495; x=1724694295; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wgl1BIT1Iozvq+rn/hswreZzgz/VlUWJ1e7JlV7+eKs=;
        b=kosuAoUnFOeAMJ+8/1YPj7B/kNisEpOGGrOJdMkXjBtWUaALiqM1fT6q6C+Kql2ebD
         x2RjBYBMmEEJK/Fj9saIHAHIdddx3HF2flSGyk9Wnk7Iqzh6qGf+RkgH3QZk6QGxHVd1
         sx1XzB/xa2PdwIfnaPYduxNnqvREhe810SUsxryIgkOhqArgw+ZtBbJxoQIz4F2hXgEd
         RV48Jd7NOk9cI4FdvEnzpMinEKUR82y2wUm6Zy3p9kP9EcvNvDbMZMPgFI/CCg2S1Lyn
         IRi9sydoHVtQJlyJCyQmaN1UdvjQC4lQeR5zcnmrmgmQ20L/uHyRoQKZqmIry5uAXGWh
         7bsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724089495; x=1724694295;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wgl1BIT1Iozvq+rn/hswreZzgz/VlUWJ1e7JlV7+eKs=;
        b=RKPKQdGhu3BAujjLbGkpnmmcQYjP/e3cajVCMLlnQ9ARakA2iQNCV0vQu2s1HYX7ja
         X1VArOgtnoei0rQ3BBzUqy2RsBGwE+hFDRITj6nsPrpSdMDX7CcWiEfTFIwkEwiHbbk2
         jaj5wZLiwSKZtU9Nb6EebprKd2UmtyDsECUlk2rOinD5Xi3fdQki9iFoI8uH9NI//dXc
         tlfajbesDG+9KJiSVCzF2SMOZZhPXCn7LkUCnZgnSYpkyURPeiVA931mZkKyJSMGTk2s
         X4nT3Qf+oA8SYRsZbpvk9GRA1RMr6FpwGC09XoVgLg+jrzu+I70EVSXdotJ9hzThUk83
         VbMA==
X-Forwarded-Encrypted: i=1; AJvYcCVPOtxIxBhrltBVANmoQ7Au4lzMLXXTgUBrswxTvaKwJWQMOwBCKcRp5+vpWMBfk4AJ05hH94O0pjsgdzBNcVem8vRC4O8m3/j8IrXQSQ==
X-Gm-Message-State: AOJu0YwX+N9A/sfFDMWP8U+I8qgi3xpCrrcbAjegMMt5Yr1IY6zAAnWR
	hK8WdLLOpVcxQJVR5o/gYqTzPRejoNnY4u3Ro7IebsHYHkRCefN0tQdftPR2Iv9qv1+e7cVFkQ/
	cN+EmskQVwmUGj+3B7kdlghOjw50=
X-Google-Smtp-Source: AGHT+IHUDWyeHAWncFwmJ3gO/XndoAN8ewNPeGsyFPpfqXOgHze3iG++N1bdhT8TIQWKdZvcy9tcj394w7QRjDtw8nQ=
X-Received: by 2002:a05:622a:2486:b0:451:c93a:5aa5 with SMTP id
 d75a77b69052e-453743ac25bmr164309471cf.56.1724089495295; Mon, 19 Aug 2024
 10:44:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 19 Aug 2024 10:44:42 -0700
Message-ID: <CAF6AEGvxF2p3-AsjUydmSYrA0Vb+Ea7nh3VtNX0pT0Ae_Me-Kw@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2024-08-19 for v6.11-rc5
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
	freedreno <freedreno@lists.freedesktop.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Dave,

A few fixes for v6.11, see description below.

The following changes since commit fe34394ecdad459d2d7b1f30e4a39ac27fcd77f8:

  dt-bindings: display/msm: dsi-controller-main: Add SM7150
(2024-07-03 05:57:35 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2024-08-19

for you to fetch changes up to 624ab9cde26a9f150b4fd268b0f3dae3184dc40c:

  drm/msm/adreno: Fix error return if missing firmware-name
(2024-08-15 10:12:07 -0700)

----------------------------------------------------------------
Fixes for v6.11-rc5

1) Fixes from the virtual plane series, namely
   - fix the list of formats for QCM2290 since it has no YUV support
   - minor fix in dpu_plane_atomic_check_pipe() to check only for csc and
     not csc and scaler while allowing yuv formats
   - take rotation into account while allocating virtual planes

2) Fix to cleanup FB if dpu_format_populate_layout() fails. This fixes the
   warning splat during DRM file closure

3) Fix to reset the phy link params before re-starting link training. This
   fixes the 100% link training failure when someone starts modetest while
   cable is connected

4) Long pending fix to fix a visual corruption seen for 4k modes. Root-cause
   was we cannot support 4k@30 with 30bpp with 2 lanes so this is a critical
   fix to use 24bpp for such cases

5) Fix to move dpu encoder's connector assignment to atomic_enable(). This
   fixes the NULL ptr crash for cases when there is an atomic_enable()
   without atomic_modeset() after atomic_disable() . This happens for
   connectors_changed case of crtc. It fixes a NULL ptr crash reported
   during hotplug.

6) Fix to simplify DPU's debug macros without which dynamic debug does not
   work as expected

7) Fix the highest bank bit setting for sc7180

8) adreno: fix error return if missing firmware-name

----------------------------------------------------------------
Abhinav Kumar (4):
      drm/msm/dp: fix the max supported bpp logic
      drm/msm/dpu: move dpu_encoder's connector assignment to atomic_enable()
      drm/msm/dp: reset the link phy params before link training
      drm/msm: fix the highest_bank_bit for sc7180

Dmitry Baryshkov (5):
      drm/msm/dpu: don't play tricks with debug macros
      drm/msm/dpu: cleanup FB if dpu_format_populate_layout fails
      drm/msm/dpu: limit QCM2290 to RGB formats only
      drm/msm/dpu: relax YUV requirements
      drm/msm/dpu: take plane rotation into account for wide planes

Rob Clark (1):
      drm/msm/adreno: Fix error return if missing firmware-name

 drivers/gpu/drm/msm/adreno/adreno_gpu.c        |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c    |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h        | 14 ++------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 20 +++++++++++++++++---
 drivers/gpu/drm/msm/dp/dp_ctrl.c               |  2 ++
 drivers/gpu/drm/msm/dp/dp_panel.c              | 19 ++++++++++---------
 drivers/gpu/drm/msm/msm_mdss.c                 |  2 +-
 8 files changed, 37 insertions(+), 30 deletions(-)

