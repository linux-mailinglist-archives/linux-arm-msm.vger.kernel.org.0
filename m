Return-Path: <linux-arm-msm+bounces-48631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E18A3D601
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 11:08:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 553433AECF1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 10:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4007A1F0E24;
	Thu, 20 Feb 2025 10:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KelmmAXL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2E11EC00F
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 10:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740046089; cv=none; b=M7Zg7FL+/XyzS3WKTpd0ELWeeth7MFV7u0RaMYZm/5XSxyyKb8DcADxnPPDdT5jXW55lVduW03kXbQWmNg3VPCB5Ml25O7qqXRMnuN7X2H2aMRux+fJD4A2AxUsZTXh5EFxK8d3YuJoGScZ25J3sy5qZvaCV9pyupO2L2mMBdac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740046089; c=relaxed/simple;
	bh=lZ+poUcsGaFUUbHXQn1jSPCAMiMLRg/1oYtrAb7t0FE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mHsM1gWGkIZPq0VrSVVcQIZXoQDtiwQln2QDzinW4DvNIC7ssfpY6qXtb4c6z/9FKjhivkcdUNJbFa8TJlApWH3iLxRhLUWjskh+Pcn9PZHykRKSjMU0cKByPzyIwyPdTs7V+c//8uHrnX+ixWCWuNPrweuoX/rQv/H8RQEpN3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KelmmAXL; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2fc0d44a876so1133780a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 02:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740046087; x=1740650887; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O/4TEs4cPoG1AcM4+yxLSv0REuXRrTGKT4YLCRC3ZSk=;
        b=KelmmAXLnqYHu+PHOSx5y/pQ+r/zFeNhNVJKL23N7nxsK580Uu09xXH1cxN7k/JNsP
         6gzd3AamwQARqywzFQGFNmaIKU1wGLs2sA0v1u0oGABNnzLaB48bZ0110mZbb11JOdOg
         ASCJGLmRmHRd1Vy4mNiTBpfBSQxKT5HTSWFs/nchrXijQiRiIbmSJrl4aAmQ4KyWq+/L
         XhR6OivDAwBSgKocke7v4pCuPp15zOdHopVFg56I9MzV6UWVbh0k6lcQmaIUuPpy3rqX
         +LD5FzyIE+xf/jAirUPWK8EZYOcjPWFxnJtU4WtwlrmAf6S+I3nfOm19jDK1GarEMEN7
         MtLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740046087; x=1740650887;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/4TEs4cPoG1AcM4+yxLSv0REuXRrTGKT4YLCRC3ZSk=;
        b=H63HWRx+rovo5natrQC2Jw8/TohkMS7AmZL6dYoDDj6cMFd9Zzd/iDz0CcM2Zu7Gjx
         gJ5GnwZTbvBmUjcEm8yWnR4C7FZ5GskImjbzWvYmafLJlhqGxvNPJqU9+KHIz8I0Newv
         WRClY+XU9I+C1UL2hDumDgvkwwt9tH47eJHDmoNEe0iNHo6dhaW64AWxE1dx045SCfqd
         8djkGkTY5To6W6RG9s1v70koiyqDz25Fdc812WU2Xa84hyH1ncH8sv6vGeVWxsMULNiQ
         1nBCowEFoOkYmkZK1xn4KDiyL2sFWbSI1ITLokhBkbo/7qPCvMeiCIbsfmt5pD9XCj/4
         p6jA==
X-Gm-Message-State: AOJu0YzsJMv70D/epL9CRVzKTaeFDuHOZdLXN3yftSPuDy3gp/tUykc/
	oBSJ1Zi5XnKH6fA3mzc37/JOKobTJJi1AQWIjhuCR6a/TD8iGKG1Odev9VUJv6o=
X-Gm-Gg: ASbGnct7z8yC6TFjSRepOcaIvo8DQycvaxI1TI3tU/Zh8Q4YzeBloHHKcp6KkFT4xFN
	zORvoIxn+iDzuIJ6hqdSXbqMftPPKd0pJ8sjT1tCYINSR+6x5rwTAL2DKJYsIXvvJC/7q+yMlKS
	ODQQa6zqcM1MrMHz3ibhaOms5pn7DyTJqUROXDzqXDHykHoB3ESaP9eWUI1eUGPpAVl8oKfIX7k
	rXkDkF54Rj0Q2KKXbG5BLKHLMN09eTFV3fTecupwGVryPDaMgzbfFs663SUv5Cuz5wT5L7dqyeo
	aghenR237Z8X
X-Google-Smtp-Source: AGHT+IE4Hnx3iwIdTTQMv1etNjaKK2fbBl3p4LS+dGKDHiLfiUb9a4DuJMquOBV5Z9uPvqneJ57u1A==
X-Received: by 2002:a17:90b:3b92:b0:2fa:15ab:4de7 with SMTP id 98e67ed59e1d1-2fc40f10763mr39959135a91.12.1740046086882;
        Thu, 20 Feb 2025 02:08:06 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98b3305sm15304645a91.6.2025.02.20.02.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 02:08:06 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v2 0/5] drm/msm/dsi: Add DSC support to 2 panels in dual
 DSI mode
Date: Thu, 20 Feb 2025 18:07:51 +0800
Message-Id: <20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPf+tmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1MDIyMD3ZTSxBzdlOJM3WRTMzODZCOjRDMzQyWg8oKi1LTMCrBR0bG1tQA
 5/tdMWgAAAA==
X-Change-ID: 20250220-dual-dsi-c5660c22a661
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jun Nie <jun.nie@linaro.org>, 
 Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740046076; l=1838;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=lZ+poUcsGaFUUbHXQn1jSPCAMiMLRg/1oYtrAb7t0FE=;
 b=gVYCs4tCVL63DS0T89O4NzqVIwKEcs/N4UZrpeCdVcmN6sQ+aapzx/p58uvsnYolbAvacke1A
 irHVh7r6j7bAoG48rVQuFuCWdkYRRk/RpT90O2QhyOagQh8LypEsFdG
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

The 2 DSI interfaces may be connected to 2 independent panels in dual-DSI
mode. Device tree binging is added and frame width for DSC is changed to
support the usage case. Support to multiple slice per packet is added for
the device setup to test the usage case.

This patch set is split from the quad-pipe patch set v1. It is also dependent
on Marijn's patch: 
	https://lore.kernel.org/all/20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-1-9a60184fdc36@somainline.org/

The change vs v1:
    - Add device tree binding for dual panel case in handling frame width for
      DSC to avoid breaking existing dual-DSI case.
    - Leverage Marijn's patch to configure proper slice per interface in
      dsi_update_dsc_timing().
    - Polish commit comments.
    - Link to v1: https://lore.kernel.org/all/20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org/

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
Jun Nie (5):
      drm/msm/dsi: add support VBIF_CTRL_PRIORITY to v2.8.0 controller
      drm/msm/dsi: check DSC width for the bonded DSI case
      drm/msm/dsi: support DSC configurations with slice_per_pkt > 1
      dt-bindings: display/msm: dsi-controller-main: Document dual panel property
      drm/msm/dsi: Support DSC for dual panel case

 .../bindings/display/msm/dsi-controller-main.yaml  |  8 +++-
 drivers/gpu/drm/msm/dsi/dsi.h                      |  6 ++-
 drivers/gpu/drm/msm/dsi/dsi_host.c                 | 54 ++++++++++++++--------
 drivers/gpu/drm/msm/dsi/dsi_manager.c              | 12 +++--
 include/drm/drm_mipi_dsi.h                         |  2 +
 5 files changed, 56 insertions(+), 26 deletions(-)
---
base-commit: 53d2d43787aa9a7daf91d2421033528c2e186be8
change-id: 20250220-dual-dsi-c5660c22a661

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>


