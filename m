Return-Path: <linux-arm-msm+bounces-23715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7B0913664
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 00:02:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6E451C2167C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 22:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DF537442F;
	Sat, 22 Jun 2024 22:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uCbOxzJI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF3E22075
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 22:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719093743; cv=none; b=pqYV3P/4V+RYWvawPmRxWHnk9of5TJqqYd6+gOpH4DyHSc/H/Jw2q3vWtguLZCqc4aHQFdAr1vJajnBV9g2RHGE3JvewlTvy8LsFDAgNGSNO7KyVf8D1c2zF9UrZcLhtQdJ4IZGKcQYZbKxv5ksgEdHfnMQdi0pnuSNcO2qtLC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719093743; c=relaxed/simple;
	bh=md7jhGKlOM+w6BZGeSXbU5W/Ury7H26Ee1cLS6Zhie8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VszG2Eal3+y6HVKen5tFDxuqDnmN7MHi4Q4dZb+YW5N1iPW28xF7NMaqZ5emZhX1k3YNvkycrHBBCPHvXvr2WtpLXjo/qKLr1J7TeoMF2tO31MBis0yKL4ns+urSj4wO5w2OG8Epjia3dRmrMnZ0eIX838NgIwhxgWBlQxmSoac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uCbOxzJI; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e72224c395so32864441fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 15:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719093739; x=1719698539; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=64LEVOrzgJygsjtslXFVKLGh/ZheVk3INSmy/1YhYkw=;
        b=uCbOxzJI6TAxnSYrfZNTHOQPSu5SzqvrBMv0NsE1zdU8TBTmMXxkEssmpExNJfrucJ
         Bw0bbTByhXJ67FUz5+w2J0wtwhhvEaDdyDKxmushv4B75aqK0eeu3SfXVRWE4OtQ/A6O
         TUvqheET14qcfkBdeXvCbyvnMCrNRKckK3OvtG4IV//ii0RVf0tWLHAyl4v6a99PmLpe
         bHCufAqbDO3ibULdw+lMi5xqhsC+UTvLz8zDqsVUbnJ9vNjXMBsHk5VWxiS0bHCMFFWl
         POmk4EYXLeMdz2SqSoDheNreawGgDLOXZHrqgMt+kN9+zxvmewiXAotBLrAOzigPkO/s
         KH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719093739; x=1719698539;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=64LEVOrzgJygsjtslXFVKLGh/ZheVk3INSmy/1YhYkw=;
        b=XTP210WrovR7nutqwmwPmJkL4kc+uPbwa9mawgOA20NaIvPNp/Xhzh1RJyxo7SBw6z
         JonZ4uZdbIhsK0ASvpWW0AFXbtJjrS8Sx7wF7payBCHINyXKdYx1gCM2+DAhJ6ROgPep
         hBK1FIIF6NR71rr3FlyKZEiQ5xxBIEmEi+ziebkBbjaXtir7uMLzvvgq+Fpt2ddEJl7r
         iu1TWUZKS2ytBCNKIdfWpQrtdTr5WZWp/eWGM4EaocFkyYgRb1G9mDsH8ZT7wdt7DCZM
         DEQfsL0xZqJva4sI0ui1hp7mZAqHG+ui/6dlYBKlNb2+9P/adj7li0QDhz6e3lMkwLWD
         qKfg==
X-Gm-Message-State: AOJu0YyyYJx275om6Q+MqAYa5dy00lmB7ibKurxNGzAnla4/9Jlo9Sr+
	ypLpKYlpZ24JuG/Psfqn31XUsUs0OzwU11ZvBvk9bPfeJtR+gu4+sWQTvnugSmI=
X-Google-Smtp-Source: AGHT+IFzw1Gde3mqgvpH02c2bEnsd2XzVkvI/ckW5BdDtV7OdSLIwXAknbswVRWdkUx8lVNsTFkqhQ==
X-Received: by 2002:a2e:9b96:0:b0:2ec:51b5:27c8 with SMTP id 38308e7fff4ca-2ec5b2dd919mr4402111fa.32.1719093738992;
        Sat, 22 Jun 2024 15:02:18 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec55e56ea5sm2502051fa.112.2024.06.22.15.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 15:02:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 00/13] drm/msm/hdmi: rework and fix the HPD even
 generation
Date: Sun, 23 Jun 2024 01:02:13 +0300
Message-Id: <20240623-fd-hdmi-hpd-v3-0-8645a64cbd63@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOVJd2YC/23OywqDMBCF4VcpWXckndQLXfU9iotoRhNajUwkV
 MR3bxQKXXT5L87HWUUgdhTE7bQKpuiC82MKdT6J1uqxJ3AmtUCJV5kjQmfAmsGBnQyQqorKUFN
 okiItJqbOvQ/tUafu2A8wWyb9NZQslESZ56iysqhQwQWSNvOSNZqXYJ8+3l9u1Owzz/2OWhdmz
 8vxMOJO/z8TESS0SjamKdu8LenXqbdt+wA6tBkA7AAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2240;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=md7jhGKlOM+w6BZGeSXbU5W/Ury7H26Ee1cLS6Zhie8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmd0nnTufW95SKrWHG++JrkElcNx7EBZ3GYA5ZK
 eEmok9E3huJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZndJ5wAKCRCLPIo+Aiko
 1a1nB/43/0cvVcvVPP66ncByrT/vuYcbf93n36kaGSRPKfwc5DTkD6ZP8YbZ2GZWCEjmuFAjcei
 xG+NELoKKs6eBl6UY2Qon1D7sdAdMeuHryhVtlnnibcD4CijmzE9TvJuQKHWn3/2O6yD7F1m5xv
 1xyuyE4E8HkdofF5v9dUHqC+MgzUwek10sGEqkQy7lxXRfhX6vYt3BpSaS40w6B/g5zSuRkuP9F
 Flct+homaAFDXF8JnhfgkoZdXnsFzkO+NOG4aorJ3U5QwdAH2HBbgrvK/ECdYqobyTlF5QUJwMb
 YT742rOpCkTthSXvw7ar8rFrJZCkiib8SS1EUU58pOnDAOl7
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The MSM HDMI driver is plagued with the long-standing bug. If HDMI cable
is disconnected, in most of the cases cable reconnection will not be
detected properly. We have been carrying the patch from [1] in our
integration tree for ages. The time has come to fix the long-standing
bug and implement proper HPD handling.

This series was tested on msm8996 and apq8064 boards. Previously HPD
handling sometimes could trigger in the CRTC event handling, however I
can no longer reproduce it now.

[1] https://lore.kernel.org/linux-arm-msm/20171027105732.19235-2-architt@codeaurora.org/

---
Changes in v3:
- Rebase on top of linux-next
- Dropped the patches that were replaced by the HDMI Connector
  framework
- Picked up the mode_set -> atomic_pre_enable patch
- Link to v2: https://lore.kernel.org/r/20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org

---
Dmitry Baryshkov (13):
      drm/msm/hdmi: program HDMI timings during atomic_pre_enable
      drm/msm/hdmi: move the alt_iface clock to the hpd list
      drm/msm/hdmi: simplify extp clock handling
      drm/msm/hdmi: drop clock frequency assignment
      drm/msm/hdmi: switch to clk_bulk API
      drm/msm/hdmi: switch to pm_runtime_resume_and_get()
      drm/msm/hdmi: add runtime PM calls to DDC transfer function
      drm/msm/hdmi: implement proper runtime PM handling
      drm/msm/hdmi: rename hpd_clks to pwr_clks
      drm/msm/hdmi: expand the HDMI_CFG macro
      drm/msm/hdmi: drop hpd-gpios support
      drm/msm/hdmi: ensure that HDMI is up if HPD is requested
      drm/msm/hdmi: wire in hpd_enable/hpd_disable bridge ops

 drivers/gpu/drm/msm/hdmi/hdmi.c        | 145 ++++++++++++++++-----------------
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  26 ++----
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |  73 ++++++++---------
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 142 ++++++--------------------------
 drivers/gpu/drm/msm/hdmi/hdmi_i2c.c    |  14 +++-
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c    |   6 +-
 6 files changed, 150 insertions(+), 256 deletions(-)
---
base-commit: d6beed9e425d272d4a332e6ee684ac457f91b570
change-id: 20240522-fd-hdmi-hpd-e3868deb6ae0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


