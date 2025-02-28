Return-Path: <linux-arm-msm+bounces-49785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C59A7A49025
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 05:15:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4F03188E7A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 04:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8661A8409;
	Fri, 28 Feb 2025 04:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x94cnj2b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4162619F47E
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 04:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740716054; cv=none; b=Mq4VBsUM+0nooT8LfKaD02pgywH9+f0BKzjnhQySJUMHgf484jVZF6lwcZbKXLS4Wg2mmSmX+C9KsGaijvIkhvHq8+DtdYYo0v+aBJwKVWSc1LvH6m61MTi2f8SRNv1JzPHc+IMZ0xWP1RBfw/fEYDAhcu7xC55ipm61yJiOWJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740716054; c=relaxed/simple;
	bh=rjQbFJKt8uwfUV9oU3NunytfIZ/1Q7onP6jZfvGFvm4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=N+rKbn4snE0nP0Va7f5wmaEyocY9IjYhkV/p4OMgPZMtNZm22Q7Rf0MYEdiRQBwgDEBb+Puxrn/7UmbvzbfURWXqykqjKp0vm74py/JJiTeDZ2WjiLUWW9nGyzLI/e9ckr/gW7WTNK/YoIDf2uTyZRyvZs5geQ1PpkdnLQqnis0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x94cnj2b; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54605bfcc72so3185349e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 20:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740716050; x=1741320850; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RYRf/zLltnVtwc/PiKXKoC5m7NP7923iyGmqrNy9Xgk=;
        b=x94cnj2bCffZaDK8uHTcK6dsBkMpVO5W8m8EckTNpKyvDUTVH1cxHn0iJZFyKVjBy7
         +nkP91/8beQh9ij3wF6o7bFjWAjAzOi2p+R6fHYZ9sEXaYMhVSaV5F5gHrTm3zwP3Yox
         oLFNQWkhB4ro/5YOggKAlN1uY5xw6/MMWu4mlt0FGeSyK8wAROAgFpM3nnA6u5BuN9nS
         6RJXMEhgMBRsIa65gtVwW2fsyLszdKK0/P25AiNZejBdBqzQgQC0jXGX/M5RYu/lI22l
         HKBu0/bUqko4oFqPbQZ1eX5pkKjFhTec9t4HT+EHQTITE3wJoqHypWZgP/m18dNgeIcz
         le5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740716050; x=1741320850;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RYRf/zLltnVtwc/PiKXKoC5m7NP7923iyGmqrNy9Xgk=;
        b=xCyfUVz8F4hLwUmj2p0mXz2BqxRyQlogMRlYjGM/AH7OneDrnBL/Daoay3ywZrg0n/
         vWShV1uJxal/O1vZx2qBf13ywATfjGrvA9tKsT7Y9iFu8szM9Z/tFQq1SQTH+yWMguV5
         y6ARv2neNcYf6XHO+Rg0Xgth6stz4XGDWdDHnjwhYdE7p1rHzTZpOK/dO5HIjjKi9c1Y
         3lU48b8C9f/bSlTzoaNb+OgSc8W4ioOUP+3J3+76j2sUW+t17MXmtJDKOJ6eIMudkbgh
         cnON8tl63MKW7gPzjAjgBXoqK+T64RzOWXkoIbuzQ1P+tz4d3AtS/AyAXSyC/YGNWi9x
         xGzw==
X-Gm-Message-State: AOJu0YwLELnTw0o1052ZEJb2i1AHrqiYBppzAQJbOkm0TI/pEcXGfB9w
	COmDOXVqas+K/XNh7WcFtmqwR+7QY1KaUS4ddqTeipal6n4AhqpiPQ137ygsZ44=
X-Gm-Gg: ASbGncvXM3JjD4sTKzXtvfQery2DfFej5tY3FmA3mfo1a7AXPvWCCIKP835IhDkrH1x
	4uQnvxd97muVzZYQ/Qiu88qFMz4cbnTVPKxjDCgMH5PRz6i7qq3LChh6WH9zh10Rfappnyev819
	CZaIFxfl/rwj/lhsP+lRAHRBoORPT8QK6sYwDPp9tPlVe07PMSV9zw6A20HZQDP8/KmGdfJNrvO
	AhV5QOx+oGOGCrb8ozlOdGQXNImemmG9LwwK4U7u6YgZLsNc1tBk44+sS/4utn/PeUe14M8bYuj
	e7YMGYRc2cDzZCz7vqmyQp2KM1wKAFD9XA==
X-Google-Smtp-Source: AGHT+IFYyLhYNpfXaS4jL/HpsUJ0xZQOZjeZq/epaIkKokVqfkpm7Y0S22x7xD4qJ7NVJT8Sc5wjfg==
X-Received: by 2002:a05:6512:224d:b0:549:5138:cb20 with SMTP id 2adb3069b0e04-5495138ce15mr116067e87.6.1740716050232;
        Thu, 27 Feb 2025 20:14:10 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549441262b9sm361101e87.0.2025.02.27.20.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:14:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/8] drm/msm/dpu: improve CTL handling on DPU >= 5.0
 platforms
Date: Fri, 28 Feb 2025 06:14:04 +0200
Message-Id: <20250228-dpu-active-ctl-v2-0-9a9df2ee5193@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAw4wWcC/13Myw6CMBCF4Vchs3bM0HCprnwPw2IsBSYhlLS10
 RDe3UpcufxPcr4NgvViA1yLDbxNEsQtOdSpADPxMlqUPjcoUjUpumC/PpFNlGTRxBlJG8NVrx+
 kGfJp9XaQ1wHeu9yThOj8+/BT+V1/lKJ/KpVI2JaGm5brphr0bZaFvTs7P0K37/sHX2ufra0AA
 AA=
X-Change-ID: 20250209-dpu-active-ctl-08cca4d8b08a
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2682;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rjQbFJKt8uwfUV9oU3NunytfIZ/1Q7onP6jZfvGFvm4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnwTgOUHIA7y+7bzE4ENr8zsm3pvkEKIXhJM6cH
 Z9EV2vc8AWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8E4DgAKCRCLPIo+Aiko
 1QRFCACybyvscFVesJkPTMRs/ZXr5pCs1yvnCMHJbYGI1NefVYeyf9MHMpblGNfrqVdi3f1NxY4
 rZBYjlRRtYEGPhZiKR9XyK6LuITtfHuqgzUY/KbfjzDEIUWgXrBk1LRM0kuQTnez8OoPb17FCs2
 CDiOJIPgVmkLkRKl9UFBcBB06DROCHkFCBraZAgTmOtz6Jn3xzBaBvGKwMTYG/gykdsV28EkTZS
 BnoK5iMiSx1Kvqz11MrKaTxC/vjYvVuv+FuzGDlTEVHv1M91xGwqizCoXo9M7Mk8A0F4Vx490Mm
 lTOQ37kKL/7RXB+I3tFzA9b47dwiK4ekDFoNq8zObWKbkt4H
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Since version 5.0 the DPU got an improved way of handling multi-output
configurations. It is now possible to program all pending changes
through a single CTL and flush everything at the same time.

Implement corresponding changes in the DPU driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Made CTL_MERGE_3D_ACTIVE writes unconditional (Marijn)
- Added CTL_INTF_MASTER clearing in dpu_hw_ctl_reset_intf_cfg_v1
  (Marijn)
- Added a patch to drop extra rm->has_legacy_ctls condition (and an
  explanation why it can not be folded in an earlier patch).
- Link to v1: https://lore.kernel.org/r/20250220-dpu-active-ctl-v1-0-71ca67a564f8@linaro.org

---
Dmitry Baryshkov (8):
      drm/msm/dpu: don't overwrite CTL_MERGE_3D_ACTIVE register
      drm/msm/dpu: program master INTF value
      drm/msm/dpu: pass master interface to CTL configuration
      drm/msm/dpu: use single CTL if it is the only CTL returned by RM
      drm/msm/dpu: don't select single flush for active CTL blocks
      drm/msm/dpu: allocate single CTL for DPU >= 5.0
      drm/msm/dpu: remove DPU_CTL_SPLIT_DISPLAY from CTL blocks on DPU >= 5.0
      drm/msm/dpu: drop now-unused condition for has_legacy_ctls

 .../gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  |  5 ++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   |  5 ++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  |  4 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   |  4 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   |  5 ++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  5 ++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  5 ++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  5 ++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  |  5 ++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  5 ++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  5 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          |  6 +++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c |  5 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c           | 20 +++++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h           |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c               | 14 +++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h               |  2 ++
 18 files changed, 65 insertions(+), 39 deletions(-)
---
base-commit: be5c7bbb3a64baf884481a1ba0c2f8fb2f93f7c3
change-id: 20250209-dpu-active-ctl-08cca4d8b08a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


