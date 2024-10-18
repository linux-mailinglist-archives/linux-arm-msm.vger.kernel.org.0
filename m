Return-Path: <linux-arm-msm+bounces-35052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1399A4929
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 23:49:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 900B71F27256
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 21:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4984116D4E6;
	Fri, 18 Oct 2024 21:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r+qK6UDn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDEB18E368
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 21:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729288164; cv=none; b=ONanlooHjVRYsnJ+uWjg4yO7pS5In95SebQZyouLszvXGC3hp9K7eJoeDoWdTUUjyvRrZ/qYbMFcaZQYhUL527c1EUryXhB/cxyIm9w5K7XHzr6GT0A+2z4YVT1c8DqiE91KS9uupwDVrmgI8gmFob6ciw4ZWh6GG0aIjD2jtT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729288164; c=relaxed/simple;
	bh=N+kyiXcXGEQOjxyQVLv1O81JcpLhZLN4HcL9iV6FSeM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Tq5azh+j9twPzqIGFOuhImO9Qt6WJ2ycL9x9sbIqAsY1NIMy+w666J6m1RjEwWo6+0hZpY0O5SjbORDBkbKiBoxlpSxG3E3TeSYKi4TuyMoQ6NgNs+iEOn2s832Ar4UsvlQVsXsECV4fBRd/KgDr88t5nRWuBO3oxXX01dUNiKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r+qK6UDn; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539f0f9ee49so3019525e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 14:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729288160; x=1729892960; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2irfqM3Mz+ZCMqnLHdPvZOQQDp0yyhpcI0682bVeu5Q=;
        b=r+qK6UDnlcFbqrz5aA501GYf5pi+8d+x6SgvdJmW5TDnMaTh+B2RapjprwGuDOKHdS
         xhvj/sYXqU+IrGzDfi3J3GeDpioD1sP1nrf8CEsK+TvxQdGRP1nsSPp8yn2hCkeoa9A0
         MFdBpLF5m68yuX2xH/X18gnZdqdhy/VJiDRj0MFJrjqqddWzWF7xEHWI7XfKoXQ+o9N4
         yqD2I13aRIPk2w1H7FXcwtiJWo6nGHc5YEgFMo/Bsn4YycBxSzxzfCtM0fvWfLS0bNLT
         EoygLrk9J/yt00IdBDuSmeV8s4zzHw4KykKrmCQ4t6lOlgNANf1Di1b1y3RcIQ8Eapbx
         gATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729288160; x=1729892960;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2irfqM3Mz+ZCMqnLHdPvZOQQDp0yyhpcI0682bVeu5Q=;
        b=UG7ro2FOkr8oiazllSRjkZFctOxTcGcqvjJ7PeFf/VshQqnUXwxHLaXZBuFfewjCLU
         PdigZY8qk+M0ex6WVkZQ38seh9H9s87hFp07Frd5KCV9BlfRuH98ySMmv2E/CuOE30Zn
         6JmSDgWcB6NiY5TdRLbj9ovsRx0c8pRvk5saDRPutV4/V3Pnkt8jveFpifeVfiq3PQlz
         ghyvRTtJpYuGOmQVzqf/OigluttY/b8A+P3gjTeVWwZ3jlc4NUFVxsd+3Y8by+26ot3q
         xB/dIsS3zpkgzbDA1XwcDdct8+LxbkXI+lTmE6eNoo1SVzUJnpoZoHNJ7GWWJG4LaScq
         Us5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWsvR9fBrQ/Hyh/QrYuF42LGisMxdSu8tuxKye4WRRz7ybQ4HGUlVMkq/uXafeW0fCaCCSsTBb1SPLsKkhW@vger.kernel.org
X-Gm-Message-State: AOJu0YwI2K7NZ8s426DdFFKtz9a2DhzTaqurkJbu/yEHPkyPmR1qChNs
	S5Go3xUzy8T5bnlX2u7QdsEyh1StYqMH+ry0vivK0wBBd9LStcxA4IsWqPCLXwA=
X-Google-Smtp-Source: AGHT+IEbiJcmWXouY2jzgYsz1mAYDcJJqc+sw2cz5Y/7CShkoDoNITpXxcWA9aiNYwpu42eBhOkvxQ==
X-Received: by 2002:a05:6512:10c9:b0:539:fc86:ce21 with SMTP id 2adb3069b0e04-53a154d8042mr2351360e87.56.1729288159777;
        Fri, 18 Oct 2024 14:49:19 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a151f0ce5sm332088e87.181.2024.10.18.14.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 14:49:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/6] drm/bridge: add ycbcr_420_allowed support
Date: Sat, 19 Oct 2024 00:49:11 +0300
Message-Id: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANfXEmcC/x2MSwqAIBQAryJvnaCi9LlKtNB81dtYKEkh3j1pO
 QMzBRJGwgQTKxAxU6IzNJAdg/WwYUdOvjEoobQUcuAukm/2vbNWglvrRu216Y1HaM0VcaPn/81
 LrR/2t2sqXwAAAA==
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1747;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=N+kyiXcXGEQOjxyQVLv1O81JcpLhZLN4HcL9iV6FSeM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnEtfdCBDgl7FQjfXSf2tJ9+FrltUIZ2yvXc2UL
 nd4Mv5dt4KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZxLX3QAKCRCLPIo+Aiko
 1UoDB/9tf8rz41U8BqlfA2hhJZm+2syJYLEaVjFa1Q68ReF4WqMafeD1JFGZYEiZdh0oaUaiDfP
 hhq+PMs9h5dHSTS+TSGF3ZeOnxmgNKHqbDq4CPnPTvUFUNOu+2007NZuyiFoaUr7nNzLb6PFomT
 RdqDXDXXDHk0bim3SeSAg6EgK3aLzF3NSboFpb6qf/m6pO9109gTI5wDoYFGrH4I2jLo9b3LssZ
 v4OQU8lZDJMOfqHar2+H/ccgaTwC5zubTeJutpjk28IQyCs3DcQUMiwWBIigjVtXufF/0Q77KAL
 d7eFTwj5PUVZBXzIkOTMvfaRBjDkmalVhXaNrx4Qev2kHNye
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

One of the features that drm_bridge_connector can't handle currently is
setting of the ycbcr_420_allowed flag on the connector. Add the flag to
the drm_bridge struct and propagate it to the drm_connector as AND of
all flags in the bridge chain.

As an example of the conversion, enable the flag on the DW HDMI bridge,
MSM DP bridge, display connector drivers (for DisplayPort and HDMI
outputs) and AUX bridges.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (6):
      drm/display: bridge_connector: handle ycbcr_420_allowed
      drm/atomic: add interlaced and ycbcr_420 flags to connector's state dump
      drm/bridge: display-connector: allow YCbCr 420 for HDMI and DP
      drm/bridge: aux: allow interlaced and YCbCr 420 output
      drm/msm/dp: migrate the ycbcr_420_allowed to drm_bridge
      drm/bridge: dw-hdmi: set bridge's ycbcr_420_allowed flag

 drivers/gpu/drm/bridge/aux-bridge.c            |  4 ++++
 drivers/gpu/drm/bridge/aux-hpd-bridge.c        |  4 ++++
 drivers/gpu/drm/bridge/display-connector.c     |  4 ++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c      |  3 +++
 drivers/gpu/drm/display/drm_bridge_connector.c |  6 ++++--
 drivers/gpu/drm/drm_atomic.c                   |  2 ++
 drivers/gpu/drm/msm/dp/dp_display.c            |  4 ++--
 drivers/gpu/drm/msm/dp/dp_drm.c                | 10 ++++------
 drivers/gpu/drm/msm/dp/dp_drm.h                |  7 ++++---
 include/drm/drm_bridge.h                       |  5 +++++
 10 files changed, 36 insertions(+), 13 deletions(-)
---
base-commit: 7f796de9da37b78e05edde94ebc7e3f9ee53b3b4
change-id: 20241018-bridge-yuv420-aab94d4575de

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


