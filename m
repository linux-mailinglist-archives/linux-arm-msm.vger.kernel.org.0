Return-Path: <linux-arm-msm+bounces-41477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5356F9ECCBC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 14:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81C881660CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 13:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BBF223FD23;
	Wed, 11 Dec 2024 13:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H0OqHUZQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7D11C5F1C
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 13:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733922271; cv=none; b=OFdArgZ9bVb0QXEyZNv/4kSJas6jKywhLX+spLlzI7Mr8kTLe3qeUxtprGwgzdOqYBbmiHDSTH3EqDr52zeJCBKiX8m6c9Er+lLGs9BFR1XXlZPgZiD/X1bS4tNzteMGRz2KZGKCEJf/wj8yJqELZJkleCmRCgcL8mpLSMxJvtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733922271; c=relaxed/simple;
	bh=4SL3oSOYfNGgaeWhz9HDRuhRuGic1VpdSQb4rkQTyyA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GmXN3vRYyL1BQDEl1wzVQOPcG0HQx99f0aUoqqDH28dojCsmidORQCpeLG+ZsTjPKL4zdgwNxGEwfkuRByNUJ8L1kRjVA4NvU/CgUOqN+k1F1ID3SLdIjF1mdKpxtgSJo6jPUmnCQnfl2Asy5GUEAL9NDYOWu5BBMKtLEFS1+NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H0OqHUZQ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4361d5dcf5bso7314195e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 05:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733922269; x=1734527069; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YpUlzLd4DTvOwWsmuqzajXz424W9CnL0q6rjmHsBkGw=;
        b=H0OqHUZQvOuLRBgSTFGCu0yYJ2AWs6QmONkOJkBu/JW3l9efDZJ2KqvKvNSWm8D9KE
         ErhoNuWQD/wWa72SMQvvdyiXlINr1KTmQTuodqKdHvpUUTOEKyImUdZ2Qh27IkeZrfV1
         UXKCpT0pxdzbk/3x/lFzQWXi3B64qUnlVgIw1W2+AnEweygP5aWhGHbUiCTdblRNjU+M
         Ww4hYdMuteP9mRSRHG6zOaumE81U0iV3Oy6s2nL4SHU3pRXtxCsypDS3avXwo6odN+jr
         YH63xkVdt5RAE3Y+kwFi4btDIjwP/W0srFDZyn8R0rS/thajXflmtwsJZLvd5pt8bKIY
         x2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733922269; x=1734527069;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YpUlzLd4DTvOwWsmuqzajXz424W9CnL0q6rjmHsBkGw=;
        b=M3HFBW4cRvesoghQZKF5l5VlQoKcSvOJV6uiFllXQcbhKNcHvM/MuyJXSGOOePaB59
         ANSd2WpmUYZXXDYDRe4Mur/a/2NzDBdMMJ5/Pzr4F6cwYPI7dd6s+yQcScJ7SMOG/Nz8
         UMAvc3dQOp45VHRRNvKr2+cMt4KvRu8Ffb+d3nuDU8Hm7RJ8hvWAaoUV2QeY3lOL5B3K
         hjzAFPLHD2e2jVNvuUIerVCvbr8moCDAVSGLeTyS3qjuZctR4edrU9a/Q6DQ6k+fg4sA
         +aF059G0zBHlkYpIdIIPGmgfqFzTrluNz4y7CHJrXnk6LuCxKJVfOVo8y1hg+F05Pi85
         ufFg==
X-Forwarded-Encrypted: i=1; AJvYcCV9zdcforr4VV9Kl2XX6RhuKasVnFFDdBjtZo+4dpV6PI5Uot0Xxv2fUWQlm6QIKHWWxtxcz4Qt+GvsD2SM@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+dR5N9K9BCov3p66RlOBEaafGJD3ePyHrtHWfTE6FBLhYtTVZ
	Otc2jsivJXq4UT3RXU3RJ8XDLJltIGH+Iu3SpOfnL8q+9+ANLzmjsfM5DHokRvg=
X-Gm-Gg: ASbGnctDuE3ih8yevDGaGBFv69nYrm3BUwLX2eFXtF21L45n6sRJZuAXaYYCRbGMQCo
	GdsescvGgoWwn0hxuYZMNEo08t8n+TuDp/xEC38Wiy49hWWkREztF613fZUHrC95n2Cajx9HA5J
	goPJdNC0vtfju7nraTqQTGYKU1mjHaDlmYRXnVgof21m7Pr0QecWvn+KHcDkPexKJ+aMrQwzF30
	ZToHfdMhDIH2aXbccRXlRtYwP2tL816V0bxIwFqQWSmZ7OJl8Yqbg==
X-Google-Smtp-Source: AGHT+IGPWcM8yhYn2nQJ26y7MGhayOqx4M0waL4G4OgaFUlHH0NcR4gyX+40Z605D2RCeHuL57tWCQ==
X-Received: by 2002:a05:600c:5122:b0:436:1b96:7072 with SMTP id 5b1f17b1804b1-4361c393b80mr20312535e9.5.1733922268551;
        Wed, 11 Dec 2024 05:04:28 -0800 (PST)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3878248e633sm1288081f8f.4.2024.12.11.05.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 05:04:27 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v2 0/4] drm/dp: Rework LTTPR transparent mode handling and
 add support to msm driver
Date: Wed, 11 Dec 2024 15:04:11 +0200
Message-Id: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMuNWWcC/53NOQ6DMBCF4asg15nIZslW5R4RhWHGYAkvGlsoE
 eLucThCyv8V79tEIraUxKPaBNNqkw2+RH2qxDhrPxFYLC1qWbdKNgqQHWAElxxoRFhyjgyZtU9
 RM/kMLiBBogyquYzYDQZJXkX5i0zGvg/r1ZeebcqBPwe9qt/6j7IqkDBqMwz3W9eZVj4X6zWHc
 +BJ9Pu+fwHZAlYD4wAAAA==
X-Change-ID: 20241031-drm-dp-msm-add-lttpr-transparent-mode-set-136cd5bfde07
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2672; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=4SL3oSOYfNGgaeWhz9HDRuhRuGic1VpdSQb4rkQTyyA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnWY3PEZV7dIYTv5NvvJXM3bZDVMPWNYimil7AK
 wt2J3+5kbiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ1mNzwAKCRAbX0TJAJUV
 Vo+dD/4p2AWAAkQ6OSPj6dUqNsHrnpSa3jbwEi3CcIbbOwg6w5LxgpXI1osFK7ghd4bn6Ig6n5S
 pkj3wHywKPBCxJWqi7jKnnXgs4PPIqNxpCHODl3GGC0ezCO/PxMQoWLEJk3U1iqzMAQ8s07ZYk8
 eKoLR0VebD1mor9uLs/eXYrB29VgU0MNkN5fs+BEGX6nsuBgwbdM3GmYtUPTLkEfEOi22PHwVS4
 gDPbedPBwC5WMRxSa8EdC7qa20EENKBjYe+FyaV6eeFmRvLeBfVTy9VPrkEHNz5LEsHtBwZHCPs
 RxzQCDlf68mEMVviyJdoDZAW89YbVdYIzast2OTufD+bjaHiIVMe9jnCrJ66jiISmBR/YbtkC37
 Xi3KfJgqkohhzIxprEkUZfWGQcz/OnGu5jWK1SvNA7gvBIFKoiLWEsBLqspRundFegj1qn9x1+u
 kflAoK89iwBD29SohLCrpT7nZjXFMnav0IzlAYtHm8nkrLhgQyBa4OmzGf2In0itA2XPtPLZJHT
 dLANf/svi+j8riF7VblBUUzP2+UWOrSR+NyFXKT+Doeo8vHdqHXYOpnh5u+ONAM2RYVy7fp+zEj
 H+q2xUnOn+t8VXv+cYKRkUi4CNeG251xYVZBGERrDrq19e/P5l3Og1mTiByzs6/33xy/qkECKYM
 ZLJitm6X2eAAmrA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Looking at both i915 and nouveau DP drivers, both are setting the first
LTTPR (if found) in transparent mode first and then in non-transparent
mode, just like the DP v2.0 specification mentions in section 3.6.6.1.

Being part of the standard, setting the LTTPR in a specific operation mode
can be easily moved in the generic framework. So do that by adding a new
helper.

Then, the msm DP driver is lacking any kind of support for LTTPR handling,
so add it by reading the LTTPR caps for figuring out the number of LTTPRs
found on plug detect and then do exactly what the i915 and nouveau drivers
do with respect to toggling through operating modes, just like the
up-mentioned section from DP spec describes.

At some point, link training per sub-segment will probably be needed, but
for now, toggling the operating modes seems to be enough at least for the
X Elite-based platforms that this patchset has been tested on.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v2:
- Added new wrapper over the set_transparent new helper in order to
  move the non-transparent disable and the its enable->disable sequence
  mentioned in the DP standard section 3.6.6.1 entirely in the generic
  implemetation.
- Switch all 3 drivers to use the new wrapper.
- Fixed the return value of the helper to return 0 on success and
  negative value on error.
- Added explanation about the transparent/non-transparent modes into the
  msm dp commit message.
- Dropped the condition for non-eDP in msm DP driver since it is allowed
  to try to get the number of LTTPRs even on eDP and it will be always
  0 anyway.
- Dropped the RFC prefix
- Link to v1: https://lore.kernel.org/r/20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org

---
Abel Vesa (4):
      drm/dp: Add helper to set LTTPRs in transparent mode
      drm/nouveau/dp: Use the generic helper to control LTTPR transparent mode
      drm/i915/dp: Use the generic helper to control LTTPR transparent mode
      drm/msm/dp: Add support for LTTPR handling

 drivers/gpu/drm/display/drm_dp_helper.c            | 50 ++++++++++++++++++++++
 .../gpu/drm/i915/display/intel_dp_link_training.c  | 24 +++--------
 drivers/gpu/drm/msm/dp/dp_display.c                | 17 ++++++++
 drivers/gpu/drm/nouveau/nouveau_dp.c               | 17 +-------
 include/drm/display/drm_dp_helper.h                |  2 +
 5 files changed, 76 insertions(+), 34 deletions(-)
---
base-commit: 91e71d606356e50f238d7a87aacdee4abc427f07
change-id: 20241031-drm-dp-msm-add-lttpr-transparent-mode-set-136cd5bfde07

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


