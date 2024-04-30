Return-Path: <linux-arm-msm+bounces-18925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D748B7040
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 12:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A65E2285A9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 10:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B52C12D1E9;
	Tue, 30 Apr 2024 10:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FKJD6ZLH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD3D12C482;
	Tue, 30 Apr 2024 10:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714473855; cv=none; b=Y+bmKhH+sp+vgOGFsU3KQCpNq/PAZeAl7fZmLxf2vMPqwjHdtl1nNlVa1bcEH1mxUaQbHG4DD1Ku2JvpcJf3HKdC4ZmtOFn51QhpwPR8kssXSSsChMvAv4nsXiqwAnuf34e3G+7xg0aR347dlrdM2WJSAR0alPQXZdPhvY4qZPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714473855; c=relaxed/simple;
	bh=BkeGv58H7hX42ZZyfz12hF159QXBbD9WS0RfM/g8QWY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qQ2q702BofoBuxXGIRXWtRdeojNNZsvUIg3e1Af/PfT2DRvEVWznwvjwhCURlpkLnuITvtgnbhtyif5HzVqQzVnzOk1Tu6bkOEXnAzdS0ejng0thbPvs/vYUaAkdmjhhy4Ul8CK82piAeHzgXOJiyI+G64B9FxrFFlRPD7KweUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FKJD6ZLH; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-41c7ac6f635so10845975e9.3;
        Tue, 30 Apr 2024 03:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714473852; x=1715078652; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bb8GnDW6+qLtihXTN4x3JzTwOi6ozU0H7JsWN5IeQbY=;
        b=FKJD6ZLH8Q71s++SUx1x3TVFewzeE5J5GwXN9pX7KOLFFW6K+W5n6AWqeit+VOHZmE
         EWJsXXBsGQg60UYtcgDT6GozP4Ezor7O+Gol2BZBZbTweMHWfjajzvN/mWucAG8X/Cxw
         S2BGIoE9vrujpCnjJY0tB7B5oPU3+IZ6fiXscYVnARzR5d/cynjmHEfXwDVRHHhwr+hy
         kkKQs8sDSKr9ToFO5gJxpEmQu7wkXvipk/PwU6UrhUsj9jExZt5U03aF8ntV5rM0nD3r
         +QGkk0A9LwFQZbrKPjUSwVJLOijGPzuYq8oYBSAoL4Tg8g0gaFOHpuhbNvi1tXMpVo9M
         rM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714473852; x=1715078652;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bb8GnDW6+qLtihXTN4x3JzTwOi6ozU0H7JsWN5IeQbY=;
        b=tsiRL31/bRo+hUH2Zps9/aKnpBk60ANK+//YdQ0cAcRWK6OF2AOdHuuN84YxVE6pOB
         /4o9OOjEO1u0kXTR7yH8e6E2VtHpATVzgzTMWwU5uBtX9wJw5wif8HNEWyMpDd1h2iQU
         xdC1w5phQK4RSfAmepaNk9UMKEPw4cIWYo6ilAmtTgsQWx3WJEon3GpSoltqzCf0TeJ7
         enllsm38jubjrS3tlvt8X5ACDExIUX3ZVhL+v1TmYQmdz3sixlrhJ/Aw1M7MD3PRuNIS
         LIQq2hyKrvc1pTSnKPqHZSRJb9H4ZkqZ39+b9zdLUpEiKflY5frI6TfBQaDHNe4HugVl
         XxHQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4uRc214kQ9iQAl7GUq6LIn/YP5bMZF+CkALzuGCIJax7maCk3k9hCrp2vbz7DRjPQLlx9KSvLAP5j6W5re9wlbaljqkXfsHW7iA==
X-Gm-Message-State: AOJu0YxP5QNI+gB8ytPEMGEwJQwRoYt6n9bP2xwnDX1Z7clkqFO3QdqF
	hGMf6S02SOKuzzXG5kYufb21bXHPc0ohHfiS+w7TuQIwfq7V2m3947eKqZeW
X-Google-Smtp-Source: AGHT+IFqLW5D8CyBedtTDksYWSboxdk0BrvqkpEgaJplE9H86m7tUMUz1Yt5dTLGZc/+W9vZvyjCSw==
X-Received: by 2002:a5d:6da5:0:b0:34c:b2bf:25a2 with SMTP id u5-20020a5d6da5000000b0034cb2bf25a2mr8723929wrs.65.1714473851633;
        Tue, 30 Apr 2024 03:44:11 -0700 (PDT)
Received: from [192.168.0.20] (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id p8-20020a5d48c8000000b0034af40b2efdsm23595951wrs.108.2024.04.30.03.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 03:44:11 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH v3 0/6] drm/msm: Support a750 "software fuse" for
 raytracing
Date: Tue, 30 Apr 2024 11:43:14 +0100
Message-Id: <20240430-a750-raytracing-v3-0-7f57c5ac082d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAELLMGYC/3XOQQ6DIBCF4as0rDsGB0HbVe/RuBgRlaRKA8TWG
 O9edOWmyz+Z+fJWFoy3JrD7ZWXezDZYN6UQ1wvTA029AdumZsix4AUqoFJy8LRET9pOPbTGlCR
 RyVw0LH29vens9xCfderOuxHi4A2dnXRdCFlkOQpRKYQc9IeaxsXIH/1I9pVpN+7cYEN0fjn2z
 bij/6fMCBykQtK3SqlWiRNVb9v2A9N+czftAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Jun Nie <jun.nie@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714473850; l=3705;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=BkeGv58H7hX42ZZyfz12hF159QXBbD9WS0RfM/g8QWY=;
 b=izjmuSdR+NaWlJwWY8d37ssrBiSBBeoJFanp5OwmSsVl8LUnFSe5R69hA1oHgh4okSygwNy1/
 eWA3IijDusYDPdsAhVjIheRSDbx8oHefZgjNc8MmKhtPYvThBVtwOaJ
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

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

Note, 'drm/msm/a7xx: Initialize a750 "software fuse"' has a compile-time
dependency on 'firmware: qcom_scm: Add gpu_init_regs call' and it
depends on 'arm64: dts: qcom: sm8650: Fix GPU cx_mem size' to avoid a
boot-time hang. The commit the latter fixes, db33633b05c0 ("arm64: dts:
qcom: sm8650: add GPU nodes"), hasn't landed upstream yet, so we can
avoid regressions by merging it first. I think the rest of the series
can go through drm/msm for 6.10 after we land the first commit in the
same tree as db33633b05c0 to make sure linux-next is never broken,
although we'll need Bjorn's ack to land 'firmware: qcom_scm: Add
gpu_init_regs call' through drm/msm.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/28447

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

---
Changes in v3:
- Formatting/style fixes.
- Fix RB_CMP_DBG_ECO_CNTL write on a730/a740 and add comments from kgsl.
- Link to v2: https://lore.kernel.org/r/20240426-a750-raytracing-v2-0-562ac9866d63@gmail.com

---
Connor Abbott (6):
      arm64: dts: qcom: sm8650: Fix GPU cx_mem size
      firmware: qcom_scm: Add gpu_init_regs call
      drm/msm: Update a6xx registers
      drm/msm/a7xx: Initialize a750 "software fuse"
      drm/msm: Add MSM_PARAM_RAYTRACING uapi
      drm/msm/a7xx: Add missing register writes from downstream

 arch/arm64/boot/dts/qcom/sm8650.dtsi          |   2 +-
 drivers/firmware/qcom/qcom_scm.c              |  14 ++++
 drivers/firmware/qcom/qcom_scm.h              |   3 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 102 +++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |   3 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |   2 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml |  28 ++++++-
 include/linux/firmware/qcom/qcom_scm.h        |  23 ++++++
 include/uapi/drm/msm_drm.h                    |   1 +
 9 files changed, 173 insertions(+), 5 deletions(-)
---
base-commit: 7e6b8924568d1aa476b77323df8d2bdd31bd7257
change-id: 20240426-a750-raytracing-dee7a526513b

Best regards,
-- 
Connor Abbott <cwabbott0@gmail.com>


