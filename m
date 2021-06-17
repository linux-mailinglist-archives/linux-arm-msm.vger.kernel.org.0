Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 950533AB56E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jun 2021 16:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231196AbhFQOLU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 10:11:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230484AbhFQOLU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 10:11:20 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 669D2C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jun 2021 07:09:12 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id b37so9156878ljr.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jun 2021 07:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OcvYXvvlVYeL9756xuKyQfsfVibJtIpmm8tnGhiSsFo=;
        b=KhZep3BslUxz+3xsZvo6Z/Yyk3DmRKr+i0q6JZgu+dnIuQT/ITq7o4Z/9QgnEDTrc5
         hSYuosp6Get0mB/weYIj9TWmKOWqLFVo1/ytl4p+WKZsD8w8reI1pvfCZ9KuScZd9aZd
         xyS6o43Z/BkVF5h+1hdrjP9a7Ktp7Ga8kjfLsU5dRGsPQPN4DQ5SsIVGFU6BAD4qIhJ+
         UE8Bz97L8zmVmiaKAX4MmqEAMfWt5I4x1eIpXmVjgzaNxAEq0Y2OEcBQl+v3ZdoKRZz7
         ber3gW3L6fPLXUUK8NWEgWcKLCiyF6QOtiK42PkGwRjI/r6RZG189iZzdlxYZQZQdy28
         +GyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OcvYXvvlVYeL9756xuKyQfsfVibJtIpmm8tnGhiSsFo=;
        b=IznvucWV0lUfHPhtIZYNhxOVhA/hsBxLPagwKLoNCE3l/gdaOJcxC9fEoDQqKp6xa1
         BRP+mNZ6ZaTtmniRpLhhj3nW1akWnva6n8H0RAJAJsSTf7L0gbaBNsx1nDsOJ/mVK7jP
         tLxU/CcOtc6RJhB38QIN95M47dBGLyh96IB+6ve0fSn+AsQX4UAW7+LP5aUbN1OlFxhv
         L96s8xllO0VOANw23PKkAvUVsTnT1oFvRIHg+Rs36CxNd8owhXaWh+A4685UKixBZieS
         yasft2zfSPTl7U2QBWSDFlt1mh+27Q5XkmHzRQ81URzXNvwjQWKVfiDudSgogSnRrt+a
         L8Cg==
X-Gm-Message-State: AOAM530JsBdL2E0sQe18WOVERdes+Gasg5Bj7zXZDweHJ5cfcegs9r6r
        Wr4MlHfYaUPbtlMwtYfoF0h2SA==
X-Google-Smtp-Source: ABdhPJwcQUwrzzHgbibZIWWeJayKD33olGUt8NtQnYHgCsSgRXDc0XEtM2RhUEw060syZVDBe926tQ==
X-Received: by 2002:a2e:9cc3:: with SMTP id g3mr4819609ljj.366.1623938950459;
        Thu, 17 Jun 2021 07:09:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f23sm592471lfm.128.2021.06.17.07.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 07:09:09 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 0/7] drm/msm/dpu: merge dpu_core_irq into dpu_hw_interrupts
Date:   Thu, 17 Jun 2021 17:09:01 +0300
Message-Id: <20210617140908.412298-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series reworks DPU's irq handling code by merging
dpu_core_irq into dpu_hw_intr, reworking/dropping irq-related helpers
and wrappers, etc.

Dependencies: https://lore.kernel.org/linux-arm-msm/20210611170003.3539059-1-bjorn.andersson@linaro.org/

----------------------------------------------------------------
Dmitry Baryshkov (7):
      drm/msm/dpu: squash dpu_core_irq into dpu_hw_interrupts
      drm/msm/dpu: don't clear IRQ register twice
      drm/msm/dpu: merge struct dpu_irq into struct dpu_hw_intr
      drm/msm/dpu: hide struct dpu_irq_callback
      drm/msm/dpu: remove extra wrappers around dpu_core_irq
      drm/msm/dpu: get rid of dpu_encoder_helper_(un)register_irq
      drm/msm/dpu: remove struct dpu_encoder_irq and enum dpu_intr_idx

 drivers/gpu/drm/msm/Makefile                       |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c       | 256 -----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h       |  30 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 111 ++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  66 +----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |  99 +++----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  56 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  | 306 ++++++++++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |  92 +------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  27 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |  25 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |  49 ++--
 12 files changed, 383 insertions(+), 735 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c


