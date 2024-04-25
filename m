Return-Path: <linux-arm-msm+bounces-18564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0C28B230F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Apr 2024 15:44:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F87C1F222AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Apr 2024 13:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8779C133993;
	Thu, 25 Apr 2024 13:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GE6VUFy8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8950149C4D
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Apr 2024 13:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714052687; cv=none; b=s/QIla1GKqpIZcQf5DbVbDSWB3fU2zDoKP+KHzy2f2hNlmG4YbOGCN6cHOu54YaQN1IAAvtbbJu9SALnAyU3jOiC48nc0aVSM80/CfWzqqnq9c5S05KbyZQSbFYJg2oh/J536Bp6sZJVloycpbWUOYqBxTkgQ+I9YSqEa06K1JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714052687; c=relaxed/simple;
	bh=Y1dA+dggciOFqaAQ94VzrpuqIwRMpYxGgAY3L59cobU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oQMeBjqp8Eu31Gg2lny19VE6QIdjfJXTZMWYQsKbWI+W8h9YvBpsetCpu4TEegR3DjB8MX+3G7phxbIkY199tlsCoRuSdpyva5DDk2QN4KF4PVL6FUaD/k/uVvr7PGh4spdyOYHssLlGRgpVyw1LJpBQniafYkJ6R7zquRCWwEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GE6VUFy8; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4196c62bb4eso7838105e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Apr 2024 06:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714052684; x=1714657484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qoEMADvMjWj3xeGnJPbLimlzA6/nm9cxyaovRQ7wvgQ=;
        b=GE6VUFy88J9avAT0y3pl5+4i/S8FqYnJk4oj544k6Orw6TH7JucqEpRWZyT/0zILJc
         7SADguchRTQ9PUondjTtQGFyli8d9HUXYwSL76VZxO9K+YhvhwfQ5ZaAtNqXq5n47rYh
         QABLPgn0LmC9vk/a8wXM+YvEPMJ57eInxLW/B9oHCMf0JtqNTA6D8/kMAjZcpY3v5zro
         7QSpNSOai+GEN6Oq/d0+KKW29NpAP+V0KWlrGLiUPG6zLeDoLN3Nhy8FWA2saflVRpzl
         V9kpT/K6/jszt3whe2EJsUOpHm8x4Mr/iuPdZGh0k5NIc3lIN/DRPYDQcfwHVGI3mxnp
         TDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714052684; x=1714657484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoEMADvMjWj3xeGnJPbLimlzA6/nm9cxyaovRQ7wvgQ=;
        b=L2lzV2vimPkSRhvyamrC1ETt1Nc2ujoVESH/XZnkXJK0fHPH9eCpc8kIDDMn+qkyAr
         Kgk77nOoGtIp3FC+4IHySPTKDLB806tbn3+VApFmS+leaRoFVnWh53CEB8TDrWXtlyBU
         kxG3oMX6Knb3QzHJl2WDyqKrVJRfrRPL9PCJ6WUJCL8qA2h34/04MR0aYfDW0ya3+ieL
         AU6L00zkdDTnzCdrRAAdrbbod5BIo+VU63Lx+dfr4e52Cv1WXvhpyivTiwtN9tK9tdeo
         IEdZ7+xmZwK0W+Su102V8eDVH6/e2kVoRr1hjCu9su1KxIF2mnO9vNJSdwkBnY9kluVq
         ovkw==
X-Forwarded-Encrypted: i=1; AJvYcCWyFusjtBuoUZ2lIHo46EvOu6JmDx7gaLEYxFmUJxLHHu6IhA5HFXqqshz9I9sRnntqpuNyQ3SlfpuD4qHGC5AJq92wIr+AvcFrY4CPpw==
X-Gm-Message-State: AOJu0Yxv9SzJQeVA/zjsIpC8Byz/rsb1JiI6uDfRpNNqBQ3mcgl3Dx82
	+V6nH38NemMnKbMZm3ZP/b0c8KcfFluZKxE1CA4Z9tiWinZ9ip52
X-Google-Smtp-Source: AGHT+IE5SABtnMFpdtnqjwHpqsEeIm2ZZLuDFDsoeynZvy6crf1faYiT9YDQ1min2Ft8ld+JrMFuXg==
X-Received: by 2002:a05:600c:45cf:b0:419:ec38:f34b with SMTP id s15-20020a05600c45cf00b00419ec38f34bmr3481391wmo.20.1714052684027;
        Thu, 25 Apr 2024 06:44:44 -0700 (PDT)
Received: from lucy.. (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id bg11-20020a05600c3c8b00b0041a9c3444a6sm11235579wmb.28.2024.04.25.06.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 06:44:43 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org
Cc: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH 0/6] drm/msm: Support a750 "software fuse" for raytracing
Date: Thu, 25 Apr 2024 14:43:48 +0100
Message-Id: <20240425134354.1233862-1-cwabbott0@gmail.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On a750, Qualcomm decided to gate support for certain features behind a
"software fuse." This consists of a register in the cx_mem zone, which
is normally only writeable by the TrustZone firmware.  On bootup it is
0, and we must call an SCM method to initialize it. Then we communicate
its value to userspace. This implements all of this, copying the SCM
call from the downstream kernel and kgsl.

So far the only optional feature we use is ray tracing (i.e. the
"ray_intersection" instruction) in a pending Mesa MR [1], so that's what
we expose to userspace. There's one extra patch to write some missing
registers, which depends on the register XML bump but is otherwise
unrelated, I just included it to make things easier on myself.

The drm/msm part of this series depends on [2] to avoid conflicts.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/28447
[2] https://lore.kernel.org/all/20240324095222.ldnwumjkxk6uymmc@hu-akhilpo-hyd.qualcomm.com/T/

Connor Abbott (6):
  arm64: dts: qcom: sm8650: Fix GPU cx_mem size
  firmware: qcom_scm: Add gpu_init_regs call
  drm/msm: Update a6xx registers
  drm/msm/a7xx: Initialize a750 "software fuse"
  drm/msm: Add MSM_PARAM_RAYTRACING uapi
  drm/msm/a7xx: Add missing register writes from downstream

 arch/arm64/boot/dts/qcom/sm8650.dtsi          |  2 +-
 drivers/firmware/qcom/qcom_scm.c              | 14 +++
 drivers/firmware/qcom/qcom_scm.h              |  3 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 97 ++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  3 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |  2 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 28 +++++-
 include/linux/firmware/qcom/qcom_scm.h        | 23 +++++
 include/uapi/drm/msm_drm.h                    |  1 +
 9 files changed, 168 insertions(+), 5 deletions(-)

-- 
2.31.1


