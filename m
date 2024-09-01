Return-Path: <linux-arm-msm+bounces-30355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E02529676DC
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Sep 2024 15:58:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52E581F21438
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Sep 2024 13:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DEBB17DFE4;
	Sun,  1 Sep 2024 13:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fpfklRr+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD7823776;
	Sun,  1 Sep 2024 13:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725199098; cv=none; b=SJuVcC4cOTbRw9eQJkb1pRehEEryvas0KDDQGQ8QMfMe9dy1qfmrPnYFV/eVov17fHQfKlyP8eIAfa6xou/DWFQEvZTXjZs6hPPpE4B5dknkOQjl0XYXGT7Ud4imCgzbECsCRw8LYpGmBLxqA18BwPTv/FhpKFRJR2Y/DD5Lfqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725199098; c=relaxed/simple;
	bh=7U5S3BcfrluzhcaFH6ZlRrmgiZYswEEz59+n3akw6cM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VOXIrNBqffIKLOyR9vCnVrOMdnrGw/3U3BcZSbftNHLyWJuP+xCt9nxofCFqLxNEZk9/T7h/Ej3RjyHfZ1pyk1BSH3DeKxQIQoJbRErLiGQT2ZsaMAK7vnIvj3+d8ERuY34lwTCPrJgrQsN8Ripn7LSCWfsJn0hBDkNNtyXsbI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fpfklRr+; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a86fa3dea99so186679166b.2;
        Sun, 01 Sep 2024 06:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725199095; x=1725803895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lqxrlwZgVOZrfaPkQI4LlyC8aVNLGRmKHeCXm7BpQqU=;
        b=fpfklRr+5OTUX2Fc8ttzSJpc+HE7BcmorNUJScfaR3m+lHH3ksVPrpDqJPF0AidyDT
         fV2c9sYlU+EPNa0WyMwNJ6nH+RbyOWPVvK03kIL1Z/Bzy0V1NDoW0dWU4iNoKNp2rvVc
         BhXFGff1d+gKa767cpeX+XXEoolnIMlMv2/uiVcCKr2y4IeAa5GNOfQgm/iMg3MdYWWj
         61F5TN2jlSZ2P3gqomVn4fcKS0OpnqSzs9HrFpnAGfsLlHUK0qpPe8g9GJi2zpOtcpYf
         WFtARJYnchcHOu/95Drne0RJyFit5n6sE/lAqsl9ytMHYmcnDdX3VA6DmGvijmSu2gYj
         MBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725199095; x=1725803895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lqxrlwZgVOZrfaPkQI4LlyC8aVNLGRmKHeCXm7BpQqU=;
        b=Lp77bG0KTDZlU7x8qPEK3oFrNw7RO9eDQMRdTVL43zIScTll5z8rLSE7ZR7DKClO1v
         tb3iVLaTn0neyY9hg+azRa+3qbsrOZWX2PDdA1EJj2/XASRisRj1r40oX8qDXq0N88Ak
         lXDqOrL2UDnHVlU1JgDc8jA7DwwC8e+NMqTlEwmiGz9UEUMPQGwrMzGLMJe/W3E5uT2i
         ssiyBaKtz51LQyqz4QOrYwGqdXcjDGX5slcr4xI0a8N1gd9GHwS7mcStvhwJm1DB2Iqz
         pgio/8dQ50AAjzFEwapxcseVAPGBtIUycfS9uS8vKQXjf5YPhoGcuYG9AkRaWIyzB9Ny
         yi2A==
X-Forwarded-Encrypted: i=1; AJvYcCVXNHu03v7EyVuK82TgaIW5vK80Vrq24h4DbC0mDgJDLGdZq5ZMckLICA+at48KtGBGt/MxRenTRyskRDSN@vger.kernel.org, AJvYcCXbbB8WRF/bMzkNUV5jnuJm5aps4a9c1sDvUyTFTlnrrSkJK3ERacgIjM8ApWSCui7H/R/8rZidiwZbor/K@vger.kernel.org
X-Gm-Message-State: AOJu0YzYwEk1T+SsnIt+n7wqIrT6Yd/g+JZZNGwjSvgsTZA0R3I3/AiL
	vo3nZ90jf9v9I7kZ+fxSy5PizFdZlPLsud7fEa4kYECgf3I5biBP
X-Google-Smtp-Source: AGHT+IGKf5lWnIdWvQXm43UX9gltPdmoOxHDk3rgMDtuWMcrI5JctjcMpoKubosYad2+GjDL5ZOL4g==
X-Received: by 2002:a05:6402:3506:b0:5c0:a8b4:3d92 with SMTP id 4fb4d7f45d1cf-5c21ed8ba82mr11941841a12.27.1725199094059;
        Sun, 01 Sep 2024 06:58:14 -0700 (PDT)
Received: from localhost.localdomain (public-nat-01.vpngate.v4.open.ad.jp. [219.100.37.233])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226ccff17sm4051295a12.73.2024.09.01.06.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 06:58:13 -0700 (PDT)
From: Vladimir Lypak <vladimir.lypak@gmail.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] fixes for Adreno A5Xx preemption
Date: Sun,  1 Sep 2024 13:53:59 +0000
Message-ID: <20240901135419.1075412-1-vladimir.lypak@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are several issues with preemption on Adreno A5XX GPUs which
render system unusable if more than one priority level is used. Those
issues include persistent GPU faults and hangs, full UI lockups with
idling GPU.

---
Changes in v2:
- Use spinlock to serialize preemption initiation in patch 3
- Added Reviewed-by on patch 2
---
Vladimir Lypak (4):
  drm/msm/a5xx: disable preemption in submits by default
  drm/msm/a5xx: properly clear preemption records on resume
  drm/msm/a5xx: fix races in preemption evaluation stage
  drm/msm/a5xx: workaround early ring-buffer emptiness check

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c     | 12 +++++++--
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h     |  2 ++
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c | 30 +++++++++++++++++++++--
 3 files changed, 40 insertions(+), 4 deletions(-)
---
base-commit: 985bf40edf4343dcb04c33f58b40b4a85c1776d4
-- 
2.46.0


