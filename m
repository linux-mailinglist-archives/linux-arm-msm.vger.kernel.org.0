Return-Path: <linux-arm-msm+bounces-46072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF693A1B47C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 12:14:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 547883AAE51
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 11:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6836321A952;
	Fri, 24 Jan 2025 11:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DTZpmYIu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600C523B0
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 11:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737717276; cv=none; b=V2iz/PVqTRr36I4EF04HTeRBMDYFMYHkS5tP1gGaLERXAVUbLLHsLduqmpEFKqVEEqCX1qoPcfljuUcEUHHWUNKK0S1KJVB0NGYzKHI4HDqWli14t3+zYHWJjWrj9g4zLwpr5dVMONxo8aFMtS+/TK8lTXAUH4EQMbIW/JGHvlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737717276; c=relaxed/simple;
	bh=OpiIQKhcNoT2pcXvUCeespOUMvgnpvQ7UQxxU9Ketjc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TkJhffw905HYLjEBOfkau1CAPcOX3ODcEJy+7jDrwF6Ru3KNXx8TCInTqQfRaPHGqKbnxv8z3r2NKklbdmQiErwZlQ+fNU1GOx4/JPD1lhB3Wj5kiCzfbArQ3+8mknJS69J15P/wCz7R4IA6v1pzkYtDgL6oIZ0uUQJLiFM6H6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DTZpmYIu; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30613802a6bso20767941fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 03:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737717271; x=1738322071; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LyCh2co2HvzF8YB4tTCIA3m8yb9tduYDWXQJRjTUkgU=;
        b=DTZpmYIuI/XR4vrCkRhRnbb7Ma6ncmUtjMmPi5wHuZguXR/YA5UYMeh4lwr8DIitVz
         qwzUVsGTbVj+pqjQvnt4iWq3hkZW4KbNYqE3jLlhTEf2SkDHydLeFA7x1Hjl3X2qOXBB
         +MNcXniDrFK3JuaBW36lWGwA+a93GdaSrm7SEiCWUdWjVW/QtByftBSotjE6GQem6IwY
         jsiWCbtDbR5IjYsqup6+UidMczEaNo8+mi6tvG4m38W3OlWCS7RX/hiM4JCnam5l8n1K
         0PDLgIt1ZPsVmmy7jEZ5gDA7hkj7kz8BTDHG9v4YHivBywdlt0YfahQLNNwWwfT2Osh4
         EvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737717271; x=1738322071;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LyCh2co2HvzF8YB4tTCIA3m8yb9tduYDWXQJRjTUkgU=;
        b=idx9ac/PHoUkgiO8pm2sy8Gkdwhn+24Cikodv7jy65mrgoeGJzZqUDQr42NSVv0skp
         sQtDvUsQsWdQioPp8F6LIwIpi+ySP6IOuxbP3mu9grCU0gdMRzLX7puaW1JiRRoEcL35
         PzJDqK8y4E9kfp1RpAPY3AXvbVqQZ1HtA6AThY+Xdd2D2IW6JUD0Faq4ErTpbUikgPhh
         6Vom56ojfAx5JrcP9dbLv/QXWB4ux+Kgrml8l4lUzIA/55BelCQoZSDbMexapxZNCRRj
         Sfnq4JDjt6YPWCxMPFf7rVJGCO0tIsVHT5Sja/lJizEnmH3eIUnayHz4p5SOzti2KBeD
         e0Pw==
X-Forwarded-Encrypted: i=1; AJvYcCWhbfhRxyUw7pFzBSknfHNbXqOTV+WI8dUhlf2VPjTB83niatjJ6/BXUcTSelRiVMM6Ts956N97B8FVDyV/@vger.kernel.org
X-Gm-Message-State: AOJu0YzGs8z81EEpYKO/H3TH5cTO3Tnqzlj+NAcf5QHwzLyloXxzYVsM
	sjx4y/VMqPPT20ndtiWensehrvUwKcLVDyXISa67tMrxfRFeK8KxsLaTRWKFeUY=
X-Gm-Gg: ASbGnctQEM8bBpBvX4tqA4Fnl3NO/N9phB4PEO7PFmKVnq5uvRU/opq9w8PyCpSwksR
	4emOMfg8HJfX8bYuf4yNeZeDKjLFgaP2iFryqLCkmkV9mIsb/ru4cv3VfXsx6VSOx4dQIj7uFD3
	h1zF0adzgotx9X334Iooiekb27Xd6sLEwvlk0KJfMzHucsOd38W6x4CIw9JsA88Wkqv19EfWSay
	Aft5nGGRNblpyY51u6/l0kyO0JujLd7Yr1FHP1uwJ0uqYKPriycjex/8Nfu6y1WGgqTev0BxuTN
	uo6NybErZ/Vl
X-Google-Smtp-Source: AGHT+IFoNbxUK/2G34MFyhMrdJfvS1tCcfDhoh+IuspqzwkrE0uCkVu1DBJS2Mcfjmd/yuee9uL1Uw==
X-Received: by 2002:a05:651c:221f:b0:302:34da:ac30 with SMTP id 38308e7fff4ca-3072caa0b37mr132017841fa.18.1737717271258;
        Fri, 24 Jan 2025 03:14:31 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bacba5esm3289701fa.36.2025.01.24.03.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 03:14:30 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/6] drm: introduce atomic_needs_modeset() callbacks
Date: Fri, 24 Jan 2025 13:14:18 +0200
Message-Id: <20250124-atomic-needs-modeset-v1-0-b0c05c9eda0f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAp2k2cC/02O0Q6CMAxFf2Xps4tQUHC/YngYW9E+jOk2CYbw7
 06J0bee5vb0LhApMEVQYoFAE0f2Y4ZyJ8Bc9XghyTYzYIGHosRK6uQdGzkS2SidtxQpyXY46hb
 rSldDA/n0Fmjg+aM9dxsHuj+yPW1L6HUkabxznJSwwUnH0ey/Q9bPCf47KJEb1CUiynfIckjP3
 /u2aE69xUbTUU0I3bq+AB/3PmvZAAAA
X-Change-ID: 20250123-atomic-needs-modeset-8f6a8243a3f7
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Kalyan Thota <quic_kalyant@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Simona Vetter <simona.vetter@ffwll.ch>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2722;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=OpiIQKhcNoT2pcXvUCeespOUMvgnpvQ7UQxxU9Ketjc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnk3YUy/SptSSxfa7unzJaW4XkVKCxp42DKSXo+
 H/zIR+fvTWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5N2FAAKCRCLPIo+Aiko
 1RqjB/9hik2csnpKagfc4l6vaAEGXHOlJSRo3+qbDo95PTdip6kPT1+hisOnFKBhiKB8i+qCewy
 mmSuvtgx3t8Wcw7R3U5uwZlKWYp0rUIK2oHhjvTUBHrzYry/qk6tcFv4lt+n/ELOIvVXCFFqC3w
 xaHRjujTQ72+JqlND6FYo5paMDxND6aEeLpr41RDRQbJOMhcPDszRAQlrG+cC4mxrZzALUZP/Lj
 ljU236y6HOi9DET+sDuBGKdgwwGR1SFp3uVv6EYg5PS6A808SbAMQ4EPfDL+JANnLjC31ZQp6AW
 9MPA5C6mhlxxJCCQXI4Iu8szZb/Pkjf58pIZLVPm8GF+3aAg
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

There are several drivers which attempt to upgrading the commit to the
full mode set from their per-object atomic_check() callbacks without
calling the drm_atomic_helper_check_modeset() or
drm_atomic_helper_check() again (as requested by those functions).

As discussed on IRC, add separate atomic_needs_modeset() callbacks,
whose only purpose is to allow the plane, connector, encoder or CRTC to
specify that for whatever reasons corresponding CRTC should undergo a
full modeset. The helpers will call these callbacks in a proper place,
adding affected objects and calling required functions as required.

The MSM patches depend on the msm-next tree and the series at [1]. The
plan is to land core changes through drm-misc, then merge drm-misc-next
into msm-next and merge remaining msm-specific patches through the
msm-next tree.

[1] https://lore.kernel.org/dri-devel/20250123-drm-dirty-modeset-v2-0-bbfd3a6cd1a4@linaro.org/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (6):
      drm/atomic-helper: add atomic_needs_modeset callbacks
      drm/mgag200: move format check to drm_plane_helper.atomic_needs_modeset
      drm/msm/dpu: stop upgrading commits by enabling allow_modeset
      drm/msm/dpu: move CTM check to drm_crtc_helper.atomic_needs_modeset
      drm/msm/dpu: use atomic_needs_modeset for CDM check
      drm/msm: drop msm_atomic_check wrapper

 drivers/gpu/drm/drm_atomic_helper.c         | 59 ++++++++++++++++++
 drivers/gpu/drm/mgag200/mgag200_drv.h       |  2 +
 drivers/gpu/drm/mgag200/mgag200_mode.c      | 27 ++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 15 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 44 +++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26 --------
 drivers/gpu/drm/msm/msm_atomic.c            | 29 ---------
 drivers/gpu/drm/msm/msm_drv.h               |  1 -
 drivers/gpu/drm/msm/msm_kms.c               |  2 +-
 drivers/gpu/drm/msm/msm_kms.h               |  7 ---
 include/drm/drm_modeset_helper_vtables.h    | 92 +++++++++++++++++++++++++++++
 12 files changed, 219 insertions(+), 89 deletions(-)
---
base-commit: 0936f0e54426177b0f0263ddf806ed5e13487db6
change-id: 20250123-atomic-needs-modeset-8f6a8243a3f7
prerequisite-change-id: 20241222-drm-dirty-modeset-88079bd27ae6:v2
prerequisite-patch-id: 0c61aabfcd13651203f476985380cbf4d3c299e6
prerequisite-patch-id: c6026f08011c288fd301676e9fa6f46d0cc1dab7
prerequisite-patch-id: b0cb06d5c88791d6e4755d879ced0d5050aa3cbf
prerequisite-patch-id: fd72ddde9dba0df053113bc505c213961a9760da

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


