Return-Path: <linux-arm-msm+bounces-13740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0453877060
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Mar 2024 11:31:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47D081F210AD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Mar 2024 10:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89940EDD;
	Sat,  9 Mar 2024 10:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JMiqMNdB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE155C8B
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Mar 2024 10:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709980299; cv=none; b=CQcibbBiy/VQmmGkIKWIxjIM4Bm2fnjhzZGnOioY4lstVa3CFCQEgMM8kpZ/WKnKB+iMlxU8JIzoPGzWvpmyFCs7FJw49z850VAvBQzPDX1S0D8ivUep0W9EdoY34Ber1awQnIou5djp/7zEFVoi6hMui7D87TOvW5vfSOrmpwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709980299; c=relaxed/simple;
	bh=Z+D0Xck92zqsjG+KbQH6+5R/W0ZnQtKYMm51vgFTlkY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fs6f8PMwZyiy0vNeu8e8j6IePVSAhjpFkOWI4Rma1LFsdFgG9gmt6mfpWIWuRG+evsWHIb1MHpiLuJKKr1UeaD5mDC01UEsgRv2xMlHR4NoC4K0/DM3Fgdv0INwxLT7lyVHTaRleKhj+lBzbO1N+XI4kTn6gedym/+TS4nRTWD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JMiqMNdB; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d26227d508so39212431fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Mar 2024 02:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709980296; x=1710585096; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mwu7uG+pdqNKrhzZmBEjpkJLspquFl8V/3yQZhhNxuA=;
        b=JMiqMNdB0Y3y4wuzU4dScf70ijpUkvsacMcLmG/z4LsI+NYyLyJXt0qE0DbKpE7LLD
         Ugxl5Bh6gLGYGlco4CpxCgVb4Q/XSQVbNfWS/pzGJDkfXsBZcEUaEcoIkmQTh8PlWbxL
         LUpeod9m8ufYfGB0Sx+luX3xtUNaBrKRAkln96xcr0oBWh+FIKSJjZauETVlV8vnpeiA
         XiKd8SrJMyMOhlrHQPDHzstuzELZ283jUIwCxqz/oiwV22mVxQ2yA1uSeQl+6wPRv3E/
         lHRfqW2xmoNY1kBEa51P0Do/lmdLjhPcatgbUKId/N1zMABAW7XPiaIP5HIBnyAzpkil
         jpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709980296; x=1710585096;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mwu7uG+pdqNKrhzZmBEjpkJLspquFl8V/3yQZhhNxuA=;
        b=CMFaqrZPyG2GXkShsbgjzOZxhIw5ALXlvHhp8rn+rk+W0yMiUNEvLuADYTVtYK/JlH
         Y7i7fZY8Kdl3QTdCxBKyASrQdGzORIPb8VD6q3xMyIvJiPCPq4TrE7o3i4oQLtEdLhMn
         i5cx/4GQFGGTZzIHRDsCf1ceQEDXea0eh9O4M/6swsbTsOHgGVV4Vxb3x1ph7zIzoGFM
         GXnUsYrFBemyZ0oJ57lXXwmy3YW6Vd+nsB99Gn+I3KhIm9e8P4wS8PKZs0TaUUZ2VcU3
         OQlwMZeZgeWJQ2KiNQ62Imt9bABYg9DeoBKBbFlruGmxrhDo4t6D9qTBXf2xeFQrzm4L
         e4eA==
X-Forwarded-Encrypted: i=1; AJvYcCVxCTF5htlG+r1B8sdkuLh2LF+XtJdbr5a5MJ7oMSuRoI11C4cLVIudMfGH0Y0jNZKQVsnQFYPR0aGzA5+Qboj2JW59zsTms9PU9S9QQg==
X-Gm-Message-State: AOJu0YzH6P2NXs73UZ7rf+Btzo66yVMszE1PEFq3E6f/CkD/423WmqSJ
	RI78JSoxj22MOcsShskpGIFF53VyglnimHm3QyvB+L6wmqdJ+erjKEnAN6FU7Yo=
X-Google-Smtp-Source: AGHT+IGq4dI7t2fxNBuykTOQKeEoc0OK5JWQBh2V6+QG59K4Bby0WJyTYiRP0VIEcXkQjUXjIF4bZQ==
X-Received: by 2002:a2e:924c:0:b0:2d2:bdc2:2f03 with SMTP id v12-20020a2e924c000000b002d2bdc22f03mr1020703ljg.31.1709980295567;
        Sat, 09 Mar 2024 02:31:35 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y5-20020a2e3205000000b002d31953bc30sm245301ljy.55.2024.03.09.02.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Mar 2024 02:31:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH RFC v2 0/5] drm/msm: make use of the HDMI connector
 infrastructure
Date: Sat, 09 Mar 2024 12:31:27 +0200
Message-Id: <20240309-bridge-hdmi-connector-v2-0-1380bea3ee70@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH867GUC/3WNTQ6CMBCFr0Jmbc1QoIgrExMP4NawADrCJNiaq
 SEa0rvbELcu39/3VggkTAGO2QpCCwf2Lgm9y2CYOjeSYps0aNQlFlirXtgmd7IPVoN3joaXF1V
 TUVclGZNbhLR9Ct35vXFvcL2coU3mxCF1P9vXkm/RD3v4g11yharB3jRFVaE2eJrZdeL3XkZoY
 4xfPDAXtsAAAAA=
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1978;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Z+D0Xck92zqsjG+KbQH6+5R/W0ZnQtKYMm51vgFTlkY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+obq9Y2ruMMX6d4iX7q2Pw6QHLGNc5zhaq3o7ImP+w71
 da9a6ZGJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmwrKQ/Z9Bb74SK3favq/v
 F7Xej/Oo2/9nr4zdatn3h256qJ9c+vxLtL4243avxr61EY7H0uvP5hy9dvilQ8CXVat15RjPOxW
 GL03Km/vxc/kqdj0rySz+NavkhdpaOnjf+nz/dnlZ1ZZdwhatfXKJWadVEuY9/q2ceJ3L3sONe0
 YAV+xCucxFcTq56Z//LHzMr9dXGx9xd8He44xFOysO/WKM926dGbFXJOhDP7OnrbnC3f18KxbUN
 ahpep5a/HqZYnGz+Vth0852xdD1H3Xaevx85WRzWadsP36wySWu8OHJqg2Bbhsn2EfO17qi1HJ4
 cZDKVue8786HZj6Wk7RzWtdg7JFZVB52aUaMl8qEK/kTAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

This patchset sits on top Maxime's HDMI connector patchset ([1]).

Currently this is an RFC exploring the interface between HDMI bridges
and HDMI connector code. This has been lightly verified on the Qualcomm
DB820c, which has native HDMI output. If this approach is considered to
be acceptable, I'll finish MSM HDMI bridge conversion (reworking the
Audio Infoframe code). Other bridges can follow the same approach (we
have lt9611 / lt9611uxc / adv7511 on Qualcomm hardware).

[1] https://patchwork.freedesktop.org/series/122421/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Dropped drm_connector_hdmi_setup(). Instead added
  drm_connector_hdmi_init() to be used by drm_bridge_connector.
- Changed the drm_bridge_connector to act as a proxy for the HDMI
  connector  infrastructure. This removes most of the logic from
  the bridge drivers.
- Link to v1: https://lore.kernel.org/r/20240308-bridge-hdmi-connector-v1-0-90b693550260@linaro.org

---
Dmitry Baryshkov (5):
      drm/connector: hdmi: fix Infoframes generation
      drm/connector: hdmi: add drm_connector_hdmi_init
      drm/bridge-connector: implement glue code for HDMI connector
      drm/msm/hdmi: switch to atomic bridge callbacks
      drm/msm/hdmi: make use of the drm_connector_hdmi framework

 drivers/gpu/drm/drm_atomic_state_helper.c |  25 +++---
 drivers/gpu/drm/drm_bridge_connector.c    | 118 +++++++++++++++++++++++-
 drivers/gpu/drm/drm_connector.c           | 143 +++++++++++++++++++++++-------
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c    |  96 +++++++++++++++-----
 include/drm/drm_bridge.h                  |  82 +++++++++++++++++
 include/drm/drm_connector.h               |   9 ++
 6 files changed, 401 insertions(+), 72 deletions(-)
---
base-commit: b5b59b6c8b64e33de01434afd8f4297be175f62a
change-id: 20240307-bridge-hdmi-connector-7e3754e661d0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


