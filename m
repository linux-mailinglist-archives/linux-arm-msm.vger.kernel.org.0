Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 708213820EB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 May 2021 22:29:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233501AbhEPUal (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 May 2021 16:30:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233441AbhEPUai (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 May 2021 16:30:38 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AABEC061573
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 May 2021 13:29:22 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id v9so4401866lfa.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 May 2021 13:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yx7lyjus5tkXrUkQqZ06xZS0977rH25/5Uu8MUALxzU=;
        b=JjvEJePtFvg6AAjvz13dQA9K5P5LCJ7yAHnN1UxZkQdjwG2FLGCTAT7+H9uCwDrn0p
         CTC2Bas1BfLXW+zlEpl/ottJ82eFLrvtkw+pmQmadvVu3JlWrxcKtcnnKHOe6PD8hWnH
         XHhfnO3BMhUjmi2UIUGtWbbHnKjIdgRXSaVYWMV3lWMKUsMJqWN8fPMML+ZaocxswGXY
         LV7obEkUfbi5fGhQB4FTJy0ylFOXJ6oh9BWn8TPm2jcX4F1B8wyu0zXnLe0RnpK8izZs
         BQyFqSQb8zDVXIpQathzlqP69LBRJmk/+LPWIfUERGKncgegxGDhZRhGcHT5W2FEb+ye
         IWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yx7lyjus5tkXrUkQqZ06xZS0977rH25/5Uu8MUALxzU=;
        b=RVlPY8r+RrLVQ9+LbMOPQMicMfH3nI639bTNZ4TyVHhXxpFM9zk4FrwDg767nyq66s
         UgQf8OHB0/dNBMEdPpLLhem2qr81ypQHFvAoxoBgBsaekbpMo75A5HGp712hqWrVr9L+
         VvdA1uMtBubmAq/4PgieRRv9kMntHUKPmVf05fbM8/3QtECquYInHc9KvNTJUPioXaDm
         7sN8nR2vcFRsnfaIb+uUvPY/zwA1vLz59M4QyyMUpBR4IKnqvMeP3lfzQRKpPZjk9jU0
         53pLKxbZAvr8Sx6lPFdVC7KxE9UMcWdJvp00hLu4TiphMQqJ29ji6ohOBUozBWYUNP7q
         41IA==
X-Gm-Message-State: AOAM533O7WSzZD2RNnNNmw0WvSi8trNS99Acgcu2lrCdODumSeazsN/a
        2gT9ZuT/nLRwdnnWDhzdTQSfrA==
X-Google-Smtp-Source: ABdhPJyZknMufSGJqVoQHvCXUeuulq2yKpWMWfgmFYNb3IXMFAKxE+aZKJYQfq4GA7eA9EbT5pr2dg==
X-Received: by 2002:ac2:4f92:: with SMTP id z18mr38521595lfs.343.1621196960758;
        Sun, 16 May 2021 13:29:20 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id l10sm2629795ljc.132.2021.05.16.13.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 13:29:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/6] drm/msm/dpu: rework irq handling
Date:   Sun, 16 May 2021 23:29:05 +0300
Message-Id: <20210516202910.2141079-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Simplify IRQ handling. dpu_irq_map is a huge table consisting of all
possible IRQ entries (including a plenty of 'reserved' = not existing
IRQs). It is always used to lookup the interrupt index (in the table)
and then to use this index to lookup related interrupt register and
mask. For the long period of time these indices had 1:1 correspondence
to register/mask pairs. SC7280 introduced 'additional' IRQs removing
this correpondence.

Replace all IRQ lookup with stable irq indices, which correponds
directly to the register/bit pair. The irq indices are now fetched from
the hw catalog rather than being looked up using the hw block id and irq
type.

Changes since v1:
 - move IRQ indices to hw catalog rather than looking them up from the
   big dpu_irq_map table (as suggested by Bjorn).
 - add patch to squash irq enable/disable into
   dpu_core_irq_register_callback()/dpu_core_irq_unregister_callback()

Changes since RFC:
 - rebase on top of msm/msm-next to include SC7280 changes.


The following changes since commit f2f46b878777e0d3f885c7ddad48f477b4dea247:

  drm/msm/dp: initialize audio_comp when audio starts (2021-05-06 16:26:57 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git dpu-irq-simplify-2

for you to fetch changes up to ec3d935f9a18aeb3ebf5482eba7133cec020e047:

  drm/msm/dpu: simplify IRQ enabling/disabling (2021-05-16 23:19:56 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (6):
      drm/msm/dpu: merge dpu_hw_intr_get_interrupt_statuses into dpu_hw_intr_dispatch_irqs
      drm/msm/dpu: hw_intr: always call dpu_hw_intr_clear_intr_status_nolock
      drm/msm/dpu: define interrupt register names
      drm/msm/dpu: replace IRQ lookup with the data in hw catalog
      drm/msm/dpu: drop remains of old irq lookup subsystem
      drm/msm/dpu: simplify IRQ enabling/disabling

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c       |  203 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h       |   43 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   74 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |    4 -
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   40 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   33 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  202 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  | 1450 ++------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |  112 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |    2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |   36 +-
 12 files changed, 330 insertions(+), 1883 deletions(-)


