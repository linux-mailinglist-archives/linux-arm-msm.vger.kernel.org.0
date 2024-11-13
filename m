Return-Path: <linux-arm-msm+bounces-37818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE42F9C77C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 16:50:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73EF6B305D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 15:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855B5158522;
	Wed, 13 Nov 2024 15:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lK7cZPYj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD680148828
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Nov 2024 15:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731512920; cv=none; b=MFuXmK2QdXhxemEKgGN31bH+f3tGzxD77VMayXZNdp0mu+pshleVHZPB6AtXcE4fs8Iww9hkYRVMK+VcPDi89b3FrjGwimGkmzpR2GZQaXlnShFezoF7pUS2hG8RgaWtYkXqHN0+YQJlA0ZQVI0WXc4G8jMCBMlOneoKfQ6bRXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731512920; c=relaxed/simple;
	bh=q5ar/iDTvRrWUmUGLZmHHecZgDsI6qhIEaT2LGKwJWY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HBR3arJv3493uqGWbVs3bq3lGIm42LBDKee4BVl89dWvCl0s2l3LNs0ngI+xGuzzdDI5kGOQkyfC+E3LA/wsW2UBEquXtiBhh4axBPY6pg9uEKRLqrnWW36YnmFJM3YN2zby5RkWsGFLLKdM9Klxyz40Ko+yAf3omo8S0F4ShWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lK7cZPYj; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4315f24a6bbso57099995e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Nov 2024 07:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731512917; x=1732117717; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IUw1QAWMH+tzja5s7eVHANVh4+/fXkKybRoiIH2f4Kk=;
        b=lK7cZPYjHKDvBcnY6yAbhSoQP1zYAyVR2eRczenLzotiDOY5+6A/LlTWZP/BSoq+iF
         9sdqeOP1t6ikJrodtMHzAgjst2S3q1fmN/LmV5n4PrwmLMQggtV7UfI+YhxZZ26ZuUk5
         LlkyH3V2e+2uWPUUmpA1a/O2YTKANe9IKsrCqy7eM+hfutmAWjtghBBaVxhFFV/eGrEz
         jpEYu5whFiI81E4hWEBlgeL5dKcaud9LZj5m9qcKi5YNEr+jss2itmgqge97lu6uREow
         PyJb8V80QeC0U1BsIJ6ZW077EGL4fmwwFcvv7aCr+s2Vhc+GW3i7JMt8arq/D1ZVghkv
         TPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731512917; x=1732117717;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IUw1QAWMH+tzja5s7eVHANVh4+/fXkKybRoiIH2f4Kk=;
        b=oB/E00ZLGjqajPRnUmtdClj6oUsASSB7sKjd5qRfudLv74yj/DjVi9tgmtywzljKPG
         ZXlyfxNmkHqUPNSkhomk/asN3S+wGqRkOEvTivDvk8XteVSPYTs2KBqEGGkc+CZcl5Zq
         GqqntTMyc/11N2wjc3+DOxRuCJQ8ERo2xZaIdTg3OryUHifa4BewWCam3jwqNlTRF3Xb
         EF4k+y+MzXzRHJC7pesn50XgkmgW7p2HWHNqYOgBfSy9Ah7IaDJS2ZhuyZXeYVjNGavY
         YozRKPrxXLr4ecMMOb5hhV5yxaI4s4SZiTye+AU9qtKm9FnYErMScAnLoVSJgCKaiCkZ
         INlA==
X-Forwarded-Encrypted: i=1; AJvYcCVu5u/cXt0/pqPqEV7L4TE3R/qK4t3f3TkN99VhaQ7ddEaqKelSdLE8ehhtWNMzbH9ASTmzAKjcIXX930zw@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7J7gAp5QEoq+nNcwbpJcA154hyOqIVkAa8wksl1jDKlGNgvxG
	Qs++HzZJeWpw4/RejaZP1eGJsTaoWzh6f8+R2efuomcsUSEtlOp4kaGt7nUFzd0=
X-Google-Smtp-Source: AGHT+IH0+AWN4BjMUB0SBHWOf+erLPiGOfP4Vhtzv6UNHG9sRcGrOAMATKFvSgWIXqDkAA6diXrhkg==
X-Received: by 2002:a05:600c:3b09:b0:431:3bf9:3ebb with SMTP id 5b1f17b1804b1-432b7518365mr174183885e9.24.1731512916955;
        Wed, 13 Nov 2024 07:48:36 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d54f772asm28445345e9.18.2024.11.13.07.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 07:48:36 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH RFC 0/8] drm/msm: adreno: add support for DDR bandwidth
 scaling via GMU
Date: Wed, 13 Nov 2024 16:48:26 +0100
Message-Id: <20241113-topic-sm8x50-gpu-bw-vote-v1-0-3b8d39737a9b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAErKNGcC/x3MOQqAMBBA0avI1A4kUVFsBQ9gKxYuE51CExI3E
 O9usHzF/w94ckweyugBRyd7NluAjCMYl36bCXkKBiVUKqVMcDeWR/RrcWcCZ3vgcOFpdkKdkVB
 KU96nOYTcOtJ8/+sWmrqC7n0/p3iwQG8AAAA=
X-Change-ID: 20241113-topic-sm8x50-gpu-bw-vote-f5e022fe7a47
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2538;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=q5ar/iDTvRrWUmUGLZmHHecZgDsI6qhIEaT2LGKwJWY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnNMpQHfZA+OfH5dhI3Gcmtq6DXWsnzInwZjcWDscU
 ZhNgKiOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZzTKUAAKCRB33NvayMhJ0SoqD/
 0Wl7nGwBx5diixbfRAKseyZLMQI98FN2EGblsvC/puVSEMBW18WDGREytVJd3yTHuJtPmFzmHyiLJf
 dLI0WQF51+NXC0ajolKmjb3KxPVgQtUHbj8G8wwdy87tzH6ZB2z2pPzQslSrfxu8mOPvZCYrp3rlRG
 JinePEUnhGB2j/k4cdSD3MS/ORJooFkaI3XgkpstUMFpkNcIt8WoJTjD+6r7JJocf8SWLVO2v2bExL
 pjAwc+ZQmPElvskwFp4bAD1vMzNGY32d1g4Pq0T+bWcF5rgLQ2MpiId3mgX/3/omDj6K9pNPgfqoxa
 ErNrYM0fHk7mxqLgKwCIZBHT8BJ+vETGWg6WR4JTuSyNtjQ9mC8KD8J4ND7xZHYV67ThTQQwZdUoPE
 jWsnFcw8soPKl9ODMl++OVEav9gJRd7PI5uw6K46CkhgtqHKI3Q0OrDQGVzAI8IgBvvG1dbWPEVhpk
 CCO5Hwo+8J7QGYqQDQ3I5hkeCOFxkwrKdrnGEKWS1xzH+V4tpoK6PdW8O6pgdXrjSzLQjVWZT+sTFP
 yW5atSi3PTIf1x//rC7Tfg9W6Jxm16yQ/RypoGo7uHDYdoRfMuBqOXJ1+tmF9+qCE7OpG+r5p683AA
 w52u68BWH5eDkEAYU+dDzq+srKhru5N6Pb3VmK2qWL9eo8G0NjbEKKZ6TQMA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The Adreno GMU Management Unit (GMU) can also vote for DDR Bandwidth
along the Frequency and Power Domain level, but by default we leave the
OPP core scale the interconnect ddr path.

While scaling the interconnect path was sufficient, newer GPUs
like the A750 requires specific vote parameters and bandwidth to
achieve full functionnality.

In order to get the vote values to be used by the GPU Management
Unit (GMU), we need to parse all the possible OPP Bandwidths and
create a vote value to be send to the appropriate Bus Control
Modules (BCMs) declared in the GPU info struct.
The added dev_pm_opp_get_bandwidth() is used in this case.

The vote array will then be used to dynamically generate the GMU
bw_table sent during the GMU power-up.

Those entries will then be used by passing the appropriate
bandwidth level when voting for a GPU frequency.

This will make sure all resources are equally voted for a
same OPP, whatever decision is done by the GMU, it will
ensure all resources votes are synchronized.

Tested on SM8650 and SM8550 platforms.

Any feedback is welcome.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (8):
      opp: core: implement dev_pm_opp_get_bandwidth
      drm/msm: adreno: add GMU_BW_VOTE quirk
      drm/msm: adreno: add plumbing to generate bandwidth vote table for GMU
      drm/msm: adreno: dynamically generate GMU bw table
      drm/msm: adreno: find bandwidth index of OPP and set it along freq index
      drm/msm: adreno: enable GMU bandwidth for A740 and A750
      arm64: qcom: dts: sm8550: add interconnect and opp-peak-kBps for GPU
      arm64: qcom: dts: sm8650: add interconnect and opp-peak-kBps for GPU

 arch/arm64/boot/dts/qcom/sm8550.dtsi      |  11 ++
 arch/arm64/boot/dts/qcom/sm8650.dtsi      |  14 +++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  26 ++++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 180 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h     |  14 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c     |  54 ++++++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   1 +
 drivers/opp/core.c                        |  25 +++++
 include/linux/pm_opp.h                    |   7 ++
 10 files changed, 314 insertions(+), 19 deletions(-)
---
base-commit: 86313a9cd152330c634b25d826a281c6a002eb77
change-id: 20241113-topic-sm8x50-gpu-bw-vote-f5e022fe7a47

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


