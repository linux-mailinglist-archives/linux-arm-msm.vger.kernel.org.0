Return-Path: <linux-arm-msm+bounces-17290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 593D08A2068
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 22:47:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1323281EFB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 20:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B841757D;
	Thu, 11 Apr 2024 20:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gj7wHnzZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B561754B
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 20:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712868445; cv=none; b=ONehOoJEqZAeE7OHTv8//Bhumt76zInZUanhkl7pOR2tRcxwQmOSg1bdsUamwR/UqukFgBuPoW2aa12EvwW9GxeuTSa3dLPDA42PooCAfBwXVJ1IHTyvRBAMPp/Mad5bB0jPXuOTgY6AuTuClX9K+jlbjM2VWS6isNshO+/IZ7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712868445; c=relaxed/simple;
	bh=1jGscWygSPpyVB90quhNp5N8DN2RuihnZeSHorMACJA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=JonpiEmIrXJL0Zz5vVKzxdlunvL68zgA2soXLAkJKi9J7z0wSo3BYZQpLgAwm1dl8KiGT+H1CMKzV3zBnFaBYBPjiKGAI1TyjBU1mmqhb04AqFReQddF9a4CKS8viGhGfIeKtxXnhdntR15SrYBITJjd9VrrqTGhZWdsh3J7dac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gj7wHnzZ; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-56fd7df9ea9so241393a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 13:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712868442; x=1713473242; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pNvwduxpSq9WO+e0WyOpsKd++VksO+huhp6HjRMGyn8=;
        b=Gj7wHnzZznJOtcX2VbNXHIoUS3gqogcYj3AI1NEgitzaZYiiXF/CUYhxpnBZMdlmqb
         PGpqyZeHhIeZA3b0qo4knV3585G3moNllluRQcqCEzLee55D2cR97/L7nUiYgNIfO6Qw
         /SOKtl2N5ewBDdngsOTiCpNrOpmWFWDMWivvn2cnMtxxVQYWptS/QEdqEs1qnAPbaFg3
         /syuP9HErXnsP9SYQeycRkUm25oKKUoFLrdR9XfonNHB83yd6Dyv8rXFl+Ottz58fclP
         j+bWte/JK8+AD+i2o1uwn+HH/f+BYN52tw5gVMMYfTnT3TxENaXTM8+XZfW3jTD17jjx
         PqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712868442; x=1713473242;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pNvwduxpSq9WO+e0WyOpsKd++VksO+huhp6HjRMGyn8=;
        b=D1jWuNQ4EidUAm4V8EwaGLED5SYIxDHgH7qQdFPtGylR4mJkhxr7laasyGBhjDQjNr
         pDqUYmuJ2f24zsMJQD4xMMi/jSk9I0+ZmmWjJ9Mc4U8t0PsDW41TbWY+44BYkzyEGFsd
         bepYmy5ndpf27mS8oBTAIt48lw7nnwOdah/Ef82DGuZE4CKcNu4YICOIYdovKEC2tMOD
         YNhIXTKwyHvai77hBC6FKT9Cc4yYJxPnmCrXXOOBAl92O4PvcKYRNgy9BXUnCSpAk4TV
         6cf12LQ5XGL9rt3O5EiQAXTOyN8m5Nme3YhckQ21qtF5razpU5BFf+zxt7kuQbkgP9vO
         0rHA==
X-Forwarded-Encrypted: i=1; AJvYcCWcEGaCW469NxtaifjugZZOVXfHWGBN5fcmTWVVBOYiMAe9E9atDFQT00nxT8TPg9f5ML3vTQs5ZXNxGK9BBgJIhCI1C+8dz9pBUrMk3Q==
X-Gm-Message-State: AOJu0YyDpv7QAlwH1UtCa5Rp5nJ6sjxuI2NH7qEExH7iYgXAVxzVjwRl
	Li6F/e1P/Msy0BVTJby8ybTahI3bkon5re1rGgRwigTnpfjZU1H0ZIzIxERq4FyJs6Rw5wJ2Yas
	sTOZmzy+tUID1yBh+t6wqN/v75c8wWWeH
X-Google-Smtp-Source: AGHT+IEXC8vd601g34DAlg+5kxr80HRO5E3BH8JsV/SefNBnF2wjRLMMLGOX8rcfSfcyTwdASctFl8TSdN66D0UF2Co=
X-Received: by 2002:a50:931b:0:b0:56d:f5ff:83ab with SMTP id
 m27-20020a50931b000000b0056df5ff83abmr572001eda.39.1712868440830; Thu, 11 Apr
 2024 13:47:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 11 Apr 2024 13:47:09 -0700
Message-ID: <CAF6AEGvFwRUcHGWva7oDeydq1PTiZMduuykCD2MWaFrT4iMGZA@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2024-04-11 for v6.9-rc4
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, freedreno <freedreno@lists.freedesktop.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Dave,

Fixes for v6.9, description below

The following changes since commit 4be445f5b6b6810baf397b2d159bd07c3573fd75:

  drm/msm/dpu: capture snapshot on the first commit_done timeout
(2024-03-04 11:44:03 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2024-04-11

for you to fetch changes up to 9dc23cba0927d09cb481da064c8413eb9df42e2b:

  drm/msm/adreno: Set highest_bank_bit for A619 (2024-04-05 11:24:53 -0700)

----------------------------------------------------------------
Fixes for v6.9

Display:
- Fixes for PM refcount leak when DP goes to disconnected state and
  also when link training fails. This is also one of the issues found
  with the pm runtime series
- Add missing newlines to prints in msm_fb and msm_kms
- Change permissions of some dpu debugfs entries which write to const
  data from catalog to read-only to avoid protection faults
- Fix the interface table for the catalog of X1E80100. This is an
  important fix to bringup DP for X1E80100.
- Logging fix to print the callback symbol in the invalid IRQ message
  case rather than printing when its known to be NULL.
- Bindings fix to add DP node as child of mdss for mdss node
- Minor typo fix in DP driver API which handles port status change

GPU:
- fix CHRASHDUMP_READ()
- fix HHB (highest bank bit) for a619 to fix UBWC corruption

----------------------------------------------------------------
Abhinav Kumar (1):
      drm/msm/dp: fix typo in dp_display_handle_port_status_changed()

Dmitry Baryshkov (3):
      drm/msm/dpu: don't allow overriding data from catalog
      drm/msm/dpu: make error messages at
dpu_core_irq_register_callback() more sensible
      dt-bindings: display/msm: sm8150-mdss: add DP node

Johan Hovold (2):
      drm/msm/dp: fix runtime PM leak on disconnect
      drm/msm/dp: fix runtime PM leak on connect failure

Kuogee Hsieh (1):
      drm/msm/dp: assign correct DP controller ID to x1e80100 interface table

Luca Weiss (1):
      drm/msm/adreno: Set highest_bank_bit for A619

Miguel Ojeda (1):
      drm/msm: fix the `CRASHDUMP_READ` target of `a6xx_get_shader_block()`

Stephen Boyd (1):
      drm/msm: Add newlines to some debug prints

 .../bindings/display/msm/qcom,sm8150-mdss.yaml     |  9 ++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  4 +++
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |  2 +-
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   | 34 ++++++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      | 10 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |  8 ++---
 drivers/gpu/drm/msm/dp/dp_display.c                |  6 ++--
 drivers/gpu/drm/msm/msm_fb.c                       |  6 ++--
 drivers/gpu/drm/msm/msm_kms.c                      |  4 +--
 9 files changed, 63 insertions(+), 20 deletions(-)

