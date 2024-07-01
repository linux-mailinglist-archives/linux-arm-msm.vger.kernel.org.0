Return-Path: <linux-arm-msm+bounces-24846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D918791EA2A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 23:23:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67913B210C1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 21:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB43084A28;
	Mon,  1 Jul 2024 21:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h6ZuW//0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901C42AD0C;
	Mon,  1 Jul 2024 21:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719869017; cv=none; b=sAqECb2KnZnMU1OnvE7zYBLKYD86tswYqWRfQXmrb2v8dVBCYTaWmNWNE5c9FzNFyaKMbSW69k46IyYnPCsnCrqdSeadGJlmxtlZxM8R1UJGQkhf7RECqWYtJs0mxIx9yIwpmQjnkdnZlpoQJPZ3/PEW1VOfhzUTkpnvGALVJO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719869017; c=relaxed/simple;
	bh=8qrfPf3F6v7hO0SCjLxB5J4FQJf/JokEiBuHsjg88IY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ttBdG9vARTWcVSU6D6aY6qSlNSTqSR2rXzDb/A7N4ZSJ0TBL87ZcZLIYuC93LAM5J6IWuHTqUAXg7s6LGvLYenhezzkU/ZTDQjBPRn/wD40DP7YDmt2xsYh2dzrkufVCwk/Z98OFcylJAYnOeQF2WUfv3aaeHtCJNa2iHoBPxGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h6ZuW//0; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2c8dc2bcb78so2542400a91.1;
        Mon, 01 Jul 2024 14:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719869016; x=1720473816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kgp7NHRVTqgOOQSOalpQlbnN69Db7Yr6qntJTF+0wVQ=;
        b=h6ZuW//0jw9ZogK85OrGX7VsI7rGXjWLd4nCVYDuPbncDcNsuUsD75mc8KaLTj/nTn
         OAx/L7Nvanc5PFIM0ImyPaNPAXO6B1cI+fQnarfX5oL55GRal70bQmvVIX7uMh2nm+am
         F7VHB1OJryf1Rrsc/MGjK6pDPA7iH7qZXILfSgzx2PvNNUJaqhYo6e3XPaOQBG4p/Wbe
         LXUgiC1h0L77u+UNCiw7ogHGxfvxGaGcd/cNbjv18UHHLyM1oukwvUy9bQotwKKLMic8
         Q4wD/ujQKvm50SnGbFauew1M2EZwAt0BAccj0IsKYGWPtJKJvSWO9x8ya38uXqb3Z/RO
         30/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719869016; x=1720473816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kgp7NHRVTqgOOQSOalpQlbnN69Db7Yr6qntJTF+0wVQ=;
        b=KHVscZTbgO4K0QMn79jrLoOKLC9KAcE9STXPTR19x9taYSAV8q74rw5tmkO1OAEY8k
         wWrbuncc8gLm0VssYByPVcJC5QxxlSAF+Xqc3INbhe4QWyL9aTj3UanD9z0DNmkLfwzX
         w7xWi9sEsjz0LQjF+TmEfZ3O2tbnH+rpBtgufLw9zCxe+RUzTGMIpUddxrn+vdZg6xBO
         nptfnDDMoEM8MFyBlt1+wBPQrQ/PiN056A7NxCwusddMT7hLaN+AbVp+Q+MNVjDZZrTZ
         J4c2zYdfpox2oGXLvqlD/52KSHAjd2oSRBbynxNBPTMY4snSMQtlwtRcrm2U5x6GaX1T
         U5YQ==
X-Forwarded-Encrypted: i=1; AJvYcCXopiwChPc76MiloKFb2IZzKWkJaaW0uEnOs+0fRzDYPm1/PBZa0XqiEXvaNPs/z3OQy4CGEJBRPALbWzG3tk8L3YXp1coXjHB1aKTv7GC7zyuz7hVyDQRa990Ha+j73a4nX+a2I+WrLTzLUQ==
X-Gm-Message-State: AOJu0Ywsoywza8p7a3lv1CMiQCZPQHotC7uxIK2iOnKvCQOtwTkLRkL9
	xAOdbOY2FQDJjYhvSWhDEVxmLb+t6EQ5PBfxRni7+cZcrRshaf8e
X-Google-Smtp-Source: AGHT+IGEfZTBckuXSprd/rSjhMFhdz8yGzcw7MjpySN/S0Tzj8JLrZKwOBsz9eoR0yvCrECy77vyxw==
X-Received: by 2002:a17:90b:4b48:b0:2c7:e24d:f695 with SMTP id 98e67ed59e1d1-2c93d715ec5mr5682410a91.12.1719869015621;
        Mon, 01 Jul 2024 14:23:35 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91ce43303sm7263491a91.17.2024.07.01.14.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 14:23:34 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	kernel test robot <lkp@intel.com>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/a6xx: Add missing __always_unused
Date: Mon,  1 Jul 2024 14:23:29 -0700
Message-ID: <20240701212330.426399-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

The __build_asserts() function only exists to have a place to put
build-time asserts.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202407010401.rfunrBSx-lkp@intel.com/
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index bdafca7267a8..68ba9aed5506 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1249,7 +1249,7 @@ static const struct adreno_info a7xx_gpus[] = {
 };
 DECLARE_ADRENO_GPULIST(a7xx);
 
-static inline void __build_asserts(void)
+static inline __always_unused void __build_asserts(void)
 {
 	BUILD_BUG_ON(a630_protect.count > a630_protect.count_max);
 	BUILD_BUG_ON(a650_protect.count > a650_protect.count_max);
-- 
2.45.2


