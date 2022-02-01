Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3747B4A5FAC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 16:11:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234200AbiBAPLA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 10:11:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240103AbiBAPK7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 10:10:59 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5740FC061714
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Feb 2022 07:10:59 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id n8so34513845lfq.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Feb 2022 07:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n+XWFKjQgChx97avL0aqxgU2/eFh5KaAhUEhdZemIvY=;
        b=syYI5u7jGJa64rTZ/6eBp2jQjDoWdZxeq5JLcnmYQjgaGTT/2+dDmA2iicSrWve0jS
         1LcwzdKVfo9R430XB+ZvGn/M5hj68aACpYUd8D34wwKPD5EsfYgqqkpXsvfAhFbpnxcO
         HHEmaddyJUo7Q4d44rI61koB/NqFCU9lYFsqufcc9c3ZznjstJeAjHso9YiU0QsGbaXT
         fGhTQ/kHDru909RFVwhExDrA0oXoyGQjX8XPN9eaqI+OHkqbEuJVbsXaBGIDTOcRSICe
         QWM1XOguUg1f+TyAIBZbvdW7f/ciNwx4xpgqCLlZ+8SezCzU5dW8NkGC/h8eC6uXN0Np
         iIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n+XWFKjQgChx97avL0aqxgU2/eFh5KaAhUEhdZemIvY=;
        b=4W1MipwwrSN0AhUmrDg8dxfr6pSI+vP5BrnBNBlyfRao9TDO7iu9J5igG6OT1KGbJv
         eE6LbkWgMphK5nUO/hvgmkE01O7iRFwiit14/5XPjn4cf1tQdRV5o4TbPEvsR1mZBMJO
         y6yjR3KdkMLY+PoLh3jfpKSxXjw20yovAKG1APBTrxEFTOAazoI8kW7bZpV/rMOMTSgJ
         NjH5MW1/4jBfgiLUcbJwWedNo07t6IuvPnN5WJPwjp0DKPuOQAYmpyGPha1oDkzy1pUE
         K+EgdPTmzss3K1rwOgjTOaEZCO0JmUKOhQ7Y8FjRerYhYD1iGt0Ge6rKQh4P7SC9sgqf
         JO0Q==
X-Gm-Message-State: AOAM530848+AD4wkBh5ZTIyAMep6RStsbYSAaP9dkSqm+AiK6H4lDrmT
        +Y30cMAbQIGbLS4XqnmbrPo1LNC98rsEYg==
X-Google-Smtp-Source: ABdhPJy89zOj5NEP4rMnBJYkBvUs8qB3ABF+2GbRQvW4GRuFzkNl/ziHo8xrr/CQtUEAolRQKpmt1Q==
X-Received: by 2002:ac2:4e84:: with SMTP id o4mr20180667lfr.460.1643728257553;
        Tue, 01 Feb 2022 07:10:57 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y6sm1337723lfk.157.2022.02.01.07.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 07:10:57 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 0/6] drm/msm/dpu: simplify IRQ helpers
Date:   Tue,  1 Feb 2022 18:10:50 +0300
Message-Id: <20220201151056.2480055-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is the second part of
https://patchwork.freedesktop.org/series/91631/ reworked and cleaned up.

Changes since the original pull request:
 - Split applied patches
 - Add unlikely and WARN_ON in dpu_core_irq_register_callback()
 - Remove extra checks in dpu_core_irq_unregister_callback()
 - Remove unused arguments of dpu_core_irq_unregister_callback()
 - Clean the cb and arg in dpu_core_irq_unregister_callback()
 - Split the last patch. Leave enum dpu_intr_idx intact. Pass irq index,
   callback and data directly to dpu_encoder helpers.

Dmitry Baryshkov (6):
  drm/msm/dpu: remove extra wrappers around dpu_core_irq
  drm/msm/dpu: remove always-true argument of dpu_core_irq_read()
  drm/msm/dpu: allow just single IRQ callback
  drm/msm/dpu: get rid of dpu_encoder_helper_(un)register_irq
  drm/msm/dpu: remove struct dpu_encoder_irq
  drm/msm/dpu: pass irq to dpu_encoder_helper_wait_for_irq()

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h  |  32 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 112 +++----------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  43 +----
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  92 +++++-----
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  51 +++---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 157 +++++++-----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  27 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  12 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |  53 +++---
 10 files changed, 193 insertions(+), 398 deletions(-)

-- 
2.34.1

