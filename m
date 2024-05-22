Return-Path: <linux-arm-msm+bounces-20191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EDD8CBF7D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 12:51:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9059B20AA0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 10:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F13EA823CC;
	Wed, 22 May 2024 10:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UhzD32wq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C72079B9D
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 10:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716375061; cv=none; b=qPN8YuDjD/yeX/xrv9nyCTinoDed3yrw7RS341KcWpENNEBSNyPvEe6WlxKdiQPwW3te3eguks6EL+Tx2nsByYM70xo1bKmE3f/6nVd8X+utb0RqW3RDfAU8850daAUJWhI9SVXIM++eOnpHJh39fStw/+2oGCcZkzepbpba5xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716375061; c=relaxed/simple;
	bh=eIKy2wBcaIR5N0rjjHKg6yf8hYS5copaiT9LRBhrUSo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WSUVN9PotwOX2D3902uFiX8eFWFVeURA7CFKfflzoYZ3yXDY0uuK7IKs6+9TNhjBmXUqn5X93fLr4j0d5Rha4znEjBlDUXIpCVhcAHa9mhN6xTF5UG79q2DMyL4P7gQ8CxZZJQrjkayUAYAVGRa4e+7pfcpqsCqn6HWG4TPQFsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UhzD32wq; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52232d0e5ceso6479754e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 03:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716375058; x=1716979858; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WLMrKIIqKe3GpiO1YTS+FO5sczDX1G6WDYwUlpVeq9s=;
        b=UhzD32wqVCdPYnXvuAos3WGOeLl5Qwe4gWkKHsH1FzxtRXvpu93vvXWxXcbMSI9K9I
         S6L/OGrjAFKWw+vG4yN0tfxAPKWOyqfdt0G9Ks7n9Es+4IbDd0Zy4y3JYRS50ALSp7Vg
         rVsSbsN7MgjlIAC9qqjHZMpOatYVQllJA7aFNkABXbnq2GcqrF1kugRD4kxtLZ0625HZ
         238CJyJ3uc9huHcUAXL6XVs3I5RNglyDynRQ0mypk9DhkakJ2HHtvuvm2Cu7qiLVsij9
         u//IYSOsgluobp25DVCwRjzkQIyeW45KpEOP3XRwjaS1zSlUMLyT4tfL0x7QpLtG/lKb
         wHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716375058; x=1716979858;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WLMrKIIqKe3GpiO1YTS+FO5sczDX1G6WDYwUlpVeq9s=;
        b=tpYq3wd6/1NMxV7ym9vnOL7CGkfNvKGXCO7BWJJP1OOwUKJUx0b9cCiOjQ6eRWV31S
         ZFL9Opmt2HQeugMrBcFcbjSOlIjAlRYZ1JSFNaBhkyTJ67lgzPQnCjyF73TNxlhJBsy4
         lFRva+sKb1mKt4rPM/o9Kr/AXhAKvEWyylUaGDjqu8Aw2FvAB/LE1nLlvJ+layY3umuZ
         pt4jiu4Fx5ZedeQ788AEcr/O8BZRn/HfQ5briMqkxGEhwIt9K/H8zf8w3nK87MqdAy2q
         gHI7W+8Kg4AcMiSy1IKFks6xBwwmrfWZT3Sjlk2p80LFs9Lf2mxK96CviJTroUpWs35U
         OaJA==
X-Gm-Message-State: AOJu0YzOfV32ejMLrmJFs+hkPoHAq1AdMgKm5wssbfmeGC+2NQXMquT4
	YtMy9ZwvzJIyZ6lgC4FNBQaVeBHpyIxPMvknkKYwVwBbqxtBV8+g5qB4atJ2mUgXFA7LNDR9wpH
	t
X-Google-Smtp-Source: AGHT+IFh9Ye33hh7xt+BanfOhr8q/w6KH/QL7wGsUwxCgNJjCTFqNI8vXbmEH4ajxIiyKiqGhLoWpQ==
X-Received: by 2002:a05:6512:10d2:b0:523:8712:f500 with SMTP id 2adb3069b0e04-526bc1810f6mr1046685e87.0.1716375058192;
        Wed, 22 May 2024 03:50:58 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52431778ec8sm1279126e87.194.2024.05.22.03.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 03:50:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 00/14] drm/msm/hdmi: rework and fix the HPD even
 generation
Date: Wed, 22 May 2024 13:50:52 +0300
Message-Id: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAzOTWYC/zXMQQ6CMBBA0auYWTukTqUSV97DuCh2oBOFkikhE
 sLdbUxcvsX/G2RW4QzXwwbKi2RJYwEdD/CMfuwZJRQDGTqbmgi7gDEMgnEKyLZxTeDWeTZQikm
 5k8/vdn8Ud5oGnKOy/z+scdaQqWuy1cU1ZPGE5TbrWrVe1xxfabm9ZfSaqqQ97PsXAveJhaIAA
 AA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2022;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=eIKy2wBcaIR5N0rjjHKg6yf8hYS5copaiT9LRBhrUSo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmTc4PNbnq5cIBEGub6xOmedby/kcYkUvbbLmhO
 AEslgI1n0eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZk3ODwAKCRCLPIo+Aiko
 1WckCACArlw5q/C37Z6bmwDWaXeoQ0NFyUTYd5pocPEs8HlMv2q7iBQXrz0+pMKOHggj4qOcFKv
 XV3tFqoL6QEJwoy/3vrKvpRT1ei8t5V6WbZEPitVNUsyqY4/5pr9Fo1BMEcdZU2uzReMit0bCfk
 z60XGFUlGeGNQFR/qItE6Sp+S5jruxvwqrnDqd5UTGi+EgW5P4vAE8wgEhtn6N21wfU4VKDBhhf
 5HxWnrepdSUG/gMvjaCTwDKlqvjV8g//n0dcYwR1Z/RZDPRUOLDQ2fH/3kLrXhjwc30yMJrmTL2
 86IP5yUP0ZlRm9b7OkU16/iXCqSTQEDhSiUp2/To9h2y0hyX
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
Dmitry Baryshkov (14):
      drm/msm/hdmi: move the alt_iface clock to the hpd list
      drm/msm/hdmi: simplify extp clock handling
      drm/msm/hdmi: switch to atomic_pre_enable/post_disable
      drm/msm/hdmi: set infoframes on all pre_enable calls
      drm/msm/hdmi: drop clock frequency assignment
      drm/msm/hdmi: switch to clk_bulk API
      drm/msm/hdmi: switch to pm_runtime_resume_and_get()
      drm/msm/hdmi: add runtime PM calls to DDC transfer function
      drm/msm/hdmi: implement proper runtime PM handling
      drm/msm/hdmi: rename hpd_clks to pwr_clks
      drm/msm/hdmi: expand the HDMI_CFG macro
      drm/msm/hdmi: drop hpd-gpios support
      drm/msm/hdmi: ensure that HDMI is one if HPD is requested
      drm/msm/hdmi: wire in hpd_enable/hpd_disable bridge ops

 drivers/gpu/drm/msm/hdmi/hdmi.c        | 145 ++++++++++++++++-----------------
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  26 ++----
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |  80 +++++++++---------
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 142 ++++++--------------------------
 drivers/gpu/drm/msm/hdmi/hdmi_i2c.c    |  14 +++-
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c    |   6 +-
 6 files changed, 157 insertions(+), 256 deletions(-)
---
base-commit: 8314289a8d50a4e05d8ece1ae0445a3b57bb4d3b
change-id: 20240522-fd-hdmi-hpd-e3868deb6ae0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


