Return-Path: <linux-arm-msm+bounces-45983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBC7A1A47C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 13:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98F19164318
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 12:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C001D20F09D;
	Thu, 23 Jan 2025 12:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K5m3D+qm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DBC20E32D
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 12:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737636301; cv=none; b=XsLkxVnsH6qhUVoQ6NG6SQwIeud7mQhfQIP4JA2iAaEq6MjCrBevknl3tQDiPyLULsKibial3d5AgEf8lOOC19ZPx5fXwm3GDoWkOlm9Qwj4Z3NDvHB2M4qmtr90593IdMD0O+ytKIbjnXDqOG8Dk4djc5XXUL/CSnaH8A1aQVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737636301; c=relaxed/simple;
	bh=Nyit5/PcakRGG2zBgKaMVblTWEFKcp9Xc8vegGFDe/8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SsmVeQwNdE98trxNkvR0PaGVtDFmzpP9ynmq/8dnBabcGELTWV3eV8LCpUaMrLsrvNz5wJ18XDbdfpcMRJFJfDR2l7jkqh4aySc9L5MXZW6nQb3Q2HD6StWro/4zwDiDGPxjoiT/g4TL34Rpu8X7lnMuez/A7j97MtVIgolt2Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K5m3D+qm; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30167f4c1e3so8343031fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 04:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737636297; x=1738241097; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VBGx0pJ6DuzAZ6r4ZXbTDW8cZT3/l1BOJrqYDAamGOI=;
        b=K5m3D+qmibuXUahEyekcrhHGvOS+tYehSuGVC2xbtEK5GOwh7h/344yVGgyHR5avob
         KIBedr29fF4CusynNpjeMm5j/VDYw3/Gqc3kwzhgYsiHqvS4WvCda+2g2miYu+TVWVSb
         5J9kb1eEMqOdlg5ipX3hFHd8thG9vpynta0iWUIQWzrhqv5Btrera2xwXtV+O1iQFEaQ
         s7Q1PkvhM9yLMfZcAoXgudHrC/LbK9ZH0CqCBBw0pnpL1sxyggv8kQs/zyY2rfjk3Xl/
         iWOQ6B9+oU4f3/IUBMEKNxw/0rvVmnNtOuWFkR85fKftLPuzosJ0ynxH9Xl5uYTn4WOU
         zv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737636297; x=1738241097;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VBGx0pJ6DuzAZ6r4ZXbTDW8cZT3/l1BOJrqYDAamGOI=;
        b=BtTBfbraHuUgbGoAWUsZu+eimso4fdQymg7B23UyENAkiSoB6INkJzTp2DML3TlqG1
         9ji0M+W3PiVwYBHK54qdCSW8GbKzyQpreFlcJKBeW8PDCFfDzwJDvryTsDEZ2U6EHNOA
         W3cw3ozShZq0sC3zZcycjHNaauIA3dWKk0/n6A1N088pOBrjTxkAzdlXNTxGzt1ZP1Df
         dwoZ68myJerlYYUeeNMx5n+2sOaYd4enlgAIJ9Tg+q1DyMMwduRwxnaEa+mrRGHUn7j7
         avA+ZvfHwMSkuVIOiKrRAKDsS3IcM+QsixhF8lJegVnSB/AhEnrMkDh90UqnXbB42JqT
         a/og==
X-Forwarded-Encrypted: i=1; AJvYcCXsf+wN1oSmvJ+8al5PM4fjXzKqr1uuXiGMjWTJG+oJ4T2Oa/CXKb08dBku8AkyI9omHsSzRvW7AH+FkcC5@vger.kernel.org
X-Gm-Message-State: AOJu0YxhZ23RrCPyr1YaVvaC8VKL/50M5PtDR0e4FKvpa1+5YE7UJNZC
	ByBGktsfxUga0EHiK13Ncl9pML4BE9Px6Nx/ShHPBiwiavAX7xsCHBmg3W31pnM=
X-Gm-Gg: ASbGncshJkZoRKjR7qJNbZa+lDITVE5A6P1AEy0wmv9PELkgtroP4PvnzBbvU7GhBj3
	P90H+L+LXC9sxOeok7pWmt0dZ6dfkhQuNlHwbWO0bLyr7q53/6ZdpiHxEwXzI667+/O9DY0pb6l
	oLFO6wkwcqJA2Z/qa18J+xCWP1b4rP6G7hZ6L/gekfU9YgqrS5enhomCzGeizqWwtDeKA3ewjx4
	at+hfcd1rJZ+6gSyvlbD5uaIpbkzQ2xn4nT6aioOAGAwgP8XlP+2Tcfk5D83+5g4mC9AB7cik8Z
	Kgm6IDww9o7H
X-Google-Smtp-Source: AGHT+IG3iLOKNh57If1JEXvmH21GHFRde3bWIOleZOnKeL2gbIgpP2Dn8w8RPp/ksU6ITD/Az7ZXuQ==
X-Received: by 2002:a05:651c:b12:b0:304:d31f:2fbc with SMTP id 38308e7fff4ca-3072cb817c5mr88941861fa.36.1737636296655;
        Thu, 23 Jan 2025 04:44:56 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a4ed6f3sm30351661fa.86.2025.01.23.04.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 04:44:55 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/4] drm/msm/dpu: follow rules for
 drm_atomic_helper_check_modeset()
Date: Thu, 23 Jan 2025 14:43:32 +0200
Message-Id: <20250123-drm-dirty-modeset-v2-0-bbfd3a6cd1a4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHQ5kmcC/32NTQ6CMBBGr0Jm7ZgyKj+uvIdhUegIkwglU0Ikp
 He3cgCX7yXf+3YIrMIB7tkOyqsE8VMCOmXQDXbqGcUlBjJ0zYkInY7oRJcNR+848IJVZcq6dVR
 aLiDtZuWXfI7ms0k8SFi8bsfFmv/sv9qao0HDZWFvF+64rR9vmaz6s9cemhjjF2e5JLCzAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1665;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Nyit5/PcakRGG2zBgKaMVblTWEFKcp9Xc8vegGFDe/8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnkjnGAk6lcw+a8f/ppbmRkD0F0hPL6Y0pGnznE
 +MxVqrv8Q+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5I5xgAKCRCLPIo+Aiko
 1QivB/9Eq+ovxg6lDDNzT97VfEQQ7kaJEY5IZcFlgG/479UoUWv985tRuy+PlAKkkG7Dx4s7UKi
 VBtKSx3gAw57qmEzAGQ2go8ZdLW1tdI0VSfNBG7TlitMgm8LoS4UkK7NP7quElO2IMzVn8KX/lb
 7WDKrkVkiijoehCceTzrd4ru4rrMdU+kYQOBP/Lskd9+nSPZmBqj7bFWH6KP0Cvv4Gw/f6zuwmf
 pI0/mEm/MIt4PKaezagw5UFmVps25Ru0fNYgGPg7zRs/pQAxGFZ9lMc/EOhaBjXAqehLR4MT427
 cxfNUja7++zAivWmtaNYUWo6JK8zIlXRzpX6DK5XgISn4omr
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

As pointed out by Simona, the drm_atomic_helper_check_modeset() and
drm_atomic_helper_check() require the former function is rerun if the
driver's callbacks modify crtc_state->mode_changed. MSM is one of the
drivers which failed to follow this requirement.

Rework the MSM / DPU driver to follow the requirements of the
drm_atomic_helper_check_modeset() helper function.

Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
Link: https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Dropped drm-core patches (one was applied and another one is disputed)
- Link to v1: https://lore.kernel.org/r/20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org

---
Dmitry Baryshkov (4):
      drm/msm/dpu: don't use active in atomic_check()
      drm/msm/dpu: move needs_cdm setting to dpu_encoder_get_topology()
      drm/msm/dpu: simplify dpu_encoder_get_topology() interface
      drm/msm/dpu: don't set crtc_state->mode_changed from atomic_check()

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 82 ++++++++++++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26 +++++++++
 drivers/gpu/drm/msm/msm_atomic.c            | 13 ++++-
 drivers/gpu/drm/msm/msm_kms.h               |  7 +++
 6 files changed, 101 insertions(+), 35 deletions(-)
---
base-commit: 2c38461deb29fda236f40950f24d898c49b04e71
change-id: 20241222-drm-dirty-modeset-88079bd27ae6

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


