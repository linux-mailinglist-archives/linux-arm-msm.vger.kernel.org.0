Return-Path: <linux-arm-msm+bounces-43055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CFB9FA3DB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 06:00:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C806B166AC8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 05:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C77241CF8B;
	Sun, 22 Dec 2024 05:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VuDMzE1M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC4151C4A
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Dec 2024 05:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734843650; cv=none; b=u0uMjc9hjZuvGUp2A4uskzF/XAe6HVn+/QBJE5M7TYeTHws/7rJxfZldMtR84eVnxpaQ7cslJc9A3asXICQjyhNcCyglV+fsjTAIgrjNjAy6gd5vZRHqUhZKp8/1IKqsAA4eWv9S97F5OGnSwzTZhMLswTw75EWQSL51Itd61aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734843650; c=relaxed/simple;
	bh=unP1mi0lDmVyY/G4o1Fv207l8KYkoozAQlq0PR4KOl0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hz6B8P2g1BZjK7Gsh4kzpuiH3viLg1zW/W/lswHjT/awIq+r0zJU2t+p33pzxHw+LwbHaiAKmOiV1A9duAwpOURUY85w5o6NZlPY2C8L0SscQXLepewjElCvCgU3SZBetAF2ct2EU5mY26enwSh6WiYWK+/9W50mT+/JSCdT904=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VuDMzE1M; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3003c0c43c0so36063371fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Dec 2024 21:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734843647; x=1735448447; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ynmJbSQJ/vTvam/arHMNtuCjd4OwDdBr2+aikpRGxU=;
        b=VuDMzE1MASMwjm1u5rJZrVmOHRvXrBJJjhYUlWhojA0it8AvQjFl020yrBDaAUginl
         yAGHahQcuAQhwpHq89J0hYQlJdPLgGeucuHxdpGPBUOJgNURpNt19R1GxU+568NeZo4z
         3Smerk6QRsECcLw6PWhPgjN2mPG2Bq6gaSPi7gdKRP95uhQDLOQJHdPsfmB7F26ro0Os
         Pe1bDIdcpcCBt34IsfSajA1BE8Ns5jwtbK7OHRUmq6DhB2O5+XASJ3FO9HCUzPO5cKWD
         z2n8lY7n9uCei8gMYnCWVaqQSq8H2TU7yqErPgONm9rurV+CciuQ6uxY0JV2VoGwWoyw
         z+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734843647; x=1735448447;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ynmJbSQJ/vTvam/arHMNtuCjd4OwDdBr2+aikpRGxU=;
        b=q2mnKyUsBJFs4cgwLNovsVraOKL7vzs/ZQA8rdCI5GkPvxTUEyQO+ebrdIkvrrihRA
         +l0TZ2VASSFNYJF9ckmhgQODIE2qogbGdE2KTZGX9qTZoUd01pEzYTg7uivNDkOyRnka
         uKW+g6or0FIuECy3VUSpa1r4vi7iUkj5S+AECaWgkR6zLI5LuLPZZsFCoKwCWwD+JcE0
         qNhv2ThbHMnQ6pVXXk0EEJWk4odbNk41rTqNyw38D+fysucqUcf98/y5YiQTObdr0XEf
         WqrUahM2uCLWS5BmsZSG85qBMg482l+nfGkAoeyscSRWbsyBIRHrSE87BRHT2Hpgj3HL
         Treg==
X-Forwarded-Encrypted: i=1; AJvYcCUYPIC7zIaPNyXTVx0UQbpFmHDRAc9b2gwa5tOWtzuhDw0yFRywvEskll29iwpIBqbIjufL1kJfbZXecf9P@vger.kernel.org
X-Gm-Message-State: AOJu0YzvlD0lDQUsBZh+pqxnURfls2jlQW4LMO2pbELJ4MsNyZVkFmll
	lE1sZhl8UPmLkw64wCN2e83036MvJ7s4yzlxUVUeS2oYfjG3lV8PfUmYtYJpFGpOzVtW4IJeoKW
	w
X-Gm-Gg: ASbGncsRox+ZLftywGQcZASQPitvCE3qVLuPQZslG6V+XXyxSp1I/SRgesiR7NK2gNw
	5jqdTox2P8jT+gpweHmcrNgIhWNnmA7+TVdfmFjO0GJA5qf6JbYTQqn4qs4Ze5SmieYm5Xoj2IU
	tFWxy4DJMtJI7x/5dTHGzZcSO5a3B3Db4XtmArgXZ2FWcfxRU0wPSgRPxKSvxHB5JcdYQUEbd4B
	7OQuXP1A35Yw9rtYsNBcnkTw9r3K3KkhghtjLYHWtPZpF4cX81IMbHc9Gqk1aXU
X-Google-Smtp-Source: AGHT+IGEtIN1HRZCkOhk1Tp0HXuUe5zoi5sLX29TjPa/TQ+C5QNKxvwhm4lSJfabOKQMJlXDnpqq4Q==
X-Received: by 2002:a05:6512:1110:b0:540:75d3:95c0 with SMTP id 2adb3069b0e04-5422956b7cfmr2458832e87.47.1734843646780;
        Sat, 21 Dec 2024 21:00:46 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832c05sm887145e87.276.2024.12.21.21.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 21:00:45 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/6] drm: enforce rules for
 drm_atomic_helper_check_modeset()
Date: Sun, 22 Dec 2024 07:00:40 +0200
Message-Id: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPicZ2cC/x3MTQ5AQAxA4atI15qYRvxdRSzQogtGOiJE3N3E8
 lu890AQUwnQJA+YnBrUbxEuTWBc+m0WVI4Gyih3RIRsK7LacePqWYIcWFVZWQ9MZS8FxG43mfT
 6n233vh8nIYnsYwAAAA==
X-Change-ID: 20241222-drm-dirty-modeset-88079bd27ae6
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Archit Taneja <architt@codeaurora.org>, 
 Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1969;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=unP1mi0lDmVyY/G4o1Fv207l8KYkoozAQlq0PR4KOl0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZ5z7EyHx7YlQHa66O5+YOr64ki12FqQYJ18so
 weZKkJwspqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2ec+wAKCRCLPIo+Aiko
 1fsJB/wNUD18E43T1sVut1m8i5ugdFUtQ+pRvb0bmm4Vh+jqrEMoq1xbprDEFZ1QC9rfNAq8uuX
 1T90Ldfx51Ojq9nTw0MgdFMAjyJqKkJFSxn/Ny2MbAU24M+ypehqMXd1kBG2TZ/UEotxILVmi7p
 KIUPGwlQ8CgevHybIzAVCyfLsvVhzhhyUAxzQ+kUS2/CS01UeZB2dYpXkrC7uZDuq5OHqZIJPbD
 JpYFSKIeIrFHNL4HFQm+Ul5+jrtRvgTJE2PKxRKaDtxoSM0ADcXean1cp8h5QHU2jC59bYCOsXN
 PqgJlueC/k2KRVNZlCenU6kljQuBN/wdHtTuApU+n++uxAst
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

As pointed out by Simona, the drm_atomic_helper_check_modeset() and
drm_atomic_helper_check() require the former function is rerun if the
driver's callbacks modify crtc_state->mode_changed. MSM is one of the
drivers which failed to follow this requirement.

As suggested by Simona, implement generic code to verify that the
drivers abide to those requirement and rework MSM driver to follow that
restrictions.

There are no dependencies between core and MSM parts, so they can go
separately via corresponding trees.

Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
Link: https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (6):
      drm/atomic-helper: document drm_atomic_helper_check() restrictions
      drm/atomic: prepare to check that drivers follow restrictions for needs_modeset
      drm/msm/dpu: don't use active in atomic_check()
      drm/msm/dpu: move needs_cdm setting to dpu_encoder_get_topology()
      drm/msm/dpu: simplify dpu_encoder_get_topology() interface
      drm/msm/dpu: don't set crtc_state->mode_changed from atomic_check()

 drivers/gpu/drm/drm_atomic.c                |  3 +
 drivers/gpu/drm/drm_atomic_helper.c         | 86 ++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 82 +++++++++++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26 +++++++++
 drivers/gpu/drm/msm/msm_atomic.c            | 13 ++++-
 drivers/gpu/drm/msm/msm_kms.h               |  7 +++
 include/drm/drm_atomic.h                    | 10 ++++
 9 files changed, 192 insertions(+), 43 deletions(-)
---
base-commit: b72747fdde637ebf52e181671bf6f41cd773b3e1
change-id: 20241222-drm-dirty-modeset-88079bd27ae6

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


