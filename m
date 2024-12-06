Return-Path: <linux-arm-msm+bounces-40742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D12779E6AAC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 10:43:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E14E16C38E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 09:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E25171F4263;
	Fri,  6 Dec 2024 09:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HNhRRJ3O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1124F1B4129
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Dec 2024 09:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733478197; cv=none; b=D/fiKeSpKI0hOrml9ctxq2Ehp/CpgCxf8Gi7Mrb0baWT8GD21RmgHC5FFHkeWqMlE9QGkZUBeziFUxyrYBprjLFREGU6vrmNVq8vlH4jpc3Klk1P4lxtGtsLJF1iWajR9Kj0chCZrGJwh/skn7Z5gCKIcqQZoe7326u2S5FkwmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733478197; c=relaxed/simple;
	bh=/vOUm2QLF9KTC3t0lXMssols8AsbLs9YQ26k7XYzTjU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=D4Sw7D+ZOLk4ZVuna9C00uKj2rSLjO2k5spdTlriFq9uIaIhBxEs/+31Ui1uEa4LSoZ8UaRYwechQ6cf0m8qhwCskN2uxeRHGIgqtmRc17IHFC3mMGFRMxtx0giEOHNLGNZUaKkoBlRK5psmvSNH4z8Dy5DA3DNHqiDy9NZ2dcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HNhRRJ3O; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ffc80318c9so16087611fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2024 01:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733478193; x=1734082993; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=18q4gQOuDIplzBrBAcJFu0OAO0g8UI+mX4z+LvhVWHM=;
        b=HNhRRJ3OuxUojmL0Vd623RrIL1XUH4gsKAAkF83lx8+PI1ZZnon5VSEDF6EPJj9vPg
         2KGKu6pZgS8vNdx1QMfc5isdwRRxuq2OYvFaK59IThkkg/NDTc9Y06jK/gpDqFL2EK/q
         9L18d+aeM6FiH5xRutp0g9sBtoNM7/wpxZJ5WsibtLPDboJ5j7cARJtqTmRlYjqHeB4R
         dY7qgXKmB1+b1YavEzKLb5QJHRSqUHkL/peZQbHkP1eMGAkUIDfXoht0QGpPziEmljig
         mC1mPbMP77O2Unp9Q+81z+PmkBBnKiqwMOHEXDeYR8XT2PfZkYzOl/f8qn7FQoYfZMZO
         ZIVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733478193; x=1734082993;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=18q4gQOuDIplzBrBAcJFu0OAO0g8UI+mX4z+LvhVWHM=;
        b=bfvgtRsDL0O/dsb+r+8P/yUJsTAAkSOac19O15NuzKh8NSUY1U2xr9kNlfBzaXRdIA
         DxrbAz+aXdTN8ZJcZEEAxx79NfHnL9SouEUxjfkLjGeRUTa9r6xfE51KL7x1kvs4qBAe
         pdnnvvGiuiFLEoNkayR9MCf82iB9GzP7GNHSG6kOd8AEkpeytpwFDBVKca6PGDAp3Wys
         kVvxhay87WTwvw0JRJCixc2rirH9illKw9a/zXa0CKpQpmyZqt8+INMW8djFlC1PIKDM
         bICZxieWb25vmrVnUZsoqv/vZERzp7I2LGwhwHttoUDqFDrgiXEewEWPXF3OfF7PVmIR
         n3rQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmRYKG2GvXCIbRkcoJmUP4rdsId3p7/rBnrj0LlnzBRYIKWLmWzzURxStRRSVfsgo2DXD8jo66K1RozNNl@vger.kernel.org
X-Gm-Message-State: AOJu0YwKbJChG4l37ATjgCNX5YHaNNShUGt1/njDci5YTC1NIkAy7DBs
	W5Z5YfAVfoqO+7mUYus61jIJbqBfEkzH/A+qnVRcExhJxyzNECCixH5HUMjZ5Ks=
X-Gm-Gg: ASbGncvTiKeC8BWRQO2TyzO6yQ7fo61yFPn1s6wxICqz5US3+NKItxoNSdChC47su02
	Zn+qS4113eykYpOGGgveQzEILYih+7jnyalPXf8YDZNn7PaXHcYpQaBIWZHL/snRfzMqyeJLaM9
	QKrVE+HJxSZTo/1AgJlO6BmgrP6qp0YBfvQTg8DhC1bZfZg53cjPsF/0ZeHKXqmSfNhvtQM2d8w
	pMgdw2dyTBqbyoZ4BJhwVJODkUebnS+62RgxviAE51fp4DShnm6HvW+zw==
X-Google-Smtp-Source: AGHT+IFlB2fuiknxBNErzknuRXx+qDTK7wodKTCgdmP8ceAx91Mtj3NnTnnSwVI5/Dq661IKM0tfTg==
X-Received: by 2002:a05:651c:b2b:b0:2ff:a5cc:3ede with SMTP id 38308e7fff4ca-3002f8aaa07mr7238681fa.6.1733478193192;
        Fri, 06 Dec 2024 01:43:13 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020db3805sm4128441fa.50.2024.12.06.01.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 01:43:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 00/10] drm/connector: add eld_mutex to protect
 connector->eld
Date: Fri, 06 Dec 2024 11:43:03 +0200
Message-Id: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACfHUmcC/4WNQQqDMBBFryKz7pQkGrFd9R7FRRqnOqBJmVixi
 Hdv6gW6+fA+vP83SCRMCa7FBkILJ44hgzkV4AcXekLuMoNRptJGaexkQh9DID9HQRo7nN4zrdi
 48uJKSzkayPZL6MnrsXxvMw+csvA5jhb9a/9vLhoVPpytXW0r61V5Gzk4iecoPbT7vn8BhEyW3
 L8AAAA=
X-Change-ID: 20241201-drm-connector-eld-mutex-8a39a35e9a38
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2527;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=/vOUm2QLF9KTC3t0lXMssols8AsbLs9YQ26k7XYzTjU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3rQcV3/Ndz5pfcma9y/9rZALvb68aKcpQ1RgqeV82p+B
 oaVTIjoZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEgtvZ/4c9Sqg0ZWr8pqe2
 fkq46C7R7Ij/0hcTXiY8DPrrL7Y/pKL1lvoDK/6HR5alBc0X5Ggz2Jz+bc2f84dlrj4WyjdgnWI
 wLbFsz9v5a1Qdd3iu2stq0ikxlfHztWlGzrHikix2G1iPKsfWnA19s5yxeH1g4QWnF1wa67bc0Z
 KN/LzKudOiv9Ul7W3Zs1sxt00qVB30ruomiS5ayfXM2/NSZuebD+aiptZpF8y0chTMFWd1ly3hW
 Oa6Q+X9pN3MPZPsw/tUuRV2S6WV6Glarp3s9r7EQOPWjoXzwnaJ/c46NqWN4Ujq5JZGX/uZbXkt
 E06rZAWXfTi43uT3vvWcH0J27OkpUHvg2uXdmTT5GNNUAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The connector->eld is accessed by the .get_eld() callback. This access
can collide with the drm_edid_to_eld() updating the data at the same
time. Add drm_connector.eld_mutex to protect the data from concurrenct
access.

The individual drivers were just compile tested. I propose to merge the
drm_connector and bridge drivers through drm-misc, allowing other
maintainers either to ack merging through drm-misc or merging the
drm-misc into their tree and then picking up correcponding patch.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Also take the mutex in clear_eld() (Jani)
- Rebased on top of linux-next + drm-misc-next to solve build error
- Link to v1: https://lore.kernel.org/r/20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org

---
Dmitry Baryshkov (10):
      drm/connector: add mutex to protect ELD from concurrent access
      drm/bridge: anx7625: use eld_mutex to protect access to connector->eld
      drm/bridge: ite-it66121: use eld_mutex to protect access to connector->eld
      drm/amd/display: use eld_mutex to protect access to connector->eld
      drm/exynos: hdmi: use eld_mutex to protect access to connector->eld
      drm/i915/audio: use eld_mutex to protect access to connector->eld
      drm/msm/dp: use eld_mutex to protect access to connector->eld
      drm/radeon: use eld_mutex to protect access to connector->eld
      drm/sti: hdmi: use eld_mutex to protect access to connector->eld
      drm/vc4: hdmi: use eld_mutex to protect access to connector->eld

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 ++
 drivers/gpu/drm/bridge/analogix/anx7625.c         | 2 ++
 drivers/gpu/drm/bridge/ite-it66121.c              | 2 ++
 drivers/gpu/drm/drm_connector.c                   | 1 +
 drivers/gpu/drm/drm_edid.c                        | 6 ++++++
 drivers/gpu/drm/exynos/exynos_hdmi.c              | 2 ++
 drivers/gpu/drm/i915/display/intel_audio.c        | 3 +++
 drivers/gpu/drm/msm/dp/dp_audio.c                 | 2 ++
 drivers/gpu/drm/radeon/radeon_audio.c             | 2 ++
 drivers/gpu/drm/sti/sti_hdmi.c                    | 2 ++
 drivers/gpu/drm/vc4/vc4_hdmi.c                    | 4 ++--
 include/drm/drm_connector.h                       | 5 ++++-
 12 files changed, 30 insertions(+), 3 deletions(-)
---
base-commit: 84e541b1e58e04d808e1bb13ef566ffbe87aa89b
change-id: 20241201-drm-connector-eld-mutex-8a39a35e9a38

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


