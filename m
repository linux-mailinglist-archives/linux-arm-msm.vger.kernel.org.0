Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 337054B97B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 05:31:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233851AbiBQEcI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 23:32:08 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbiBQEcH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 23:32:07 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29FA71D339
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 20:31:51 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id t14so6438863ljh.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 20:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WNj42/lJdlgSodUSxPSjU0zf2PPxy6ssj0HPCjOotes=;
        b=KMNVQoLGiu3fPSXvGiW2dZFnJjLkltmuc4YS47xtoJ8v3QzL6SNdLxct2awfSjjDNP
         TcH5H2IlmM0xQdl/hRa5dJo4ajrqFEcb6AiaJKKh3dNuVJs1gsuJozQBkKY8mV3Ohozo
         oLJFI2YTcQzw2O2/+Ksc+PfFxGbBmgNQ7CSCe6f0tZj7rq0PZiaMb5Dny7RJfqIZs0RQ
         ZLUF2gJXnvGqSmk88+fFbfa0VMa+vdAmTk5yPdpwUG9rGAiTTHyt3kOSQHd58mM3bCUB
         tGGr3me/GhBFXLxSNgsmgur/LMzRPjGRMXLKWK7SQYEAuVPvjlaXJixyYzb/vQGbMOzy
         nLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WNj42/lJdlgSodUSxPSjU0zf2PPxy6ssj0HPCjOotes=;
        b=Ux+xFbo9Z+K1VO/IU/MwdltKhaH5+6mTOyn/vo1SRHUfAoaoOpFItKzAKky8x1t2Wj
         L2/k0G1VgIqPBBppQvXuxKQuqsue1JaqRKkIt2VXigzRuqbD+nuLRCzdiC4r2ti/YOSK
         U18g7c+ykm1ss56rgIvw5juIoJZb8HtN0mE1/BN2HQkUe8WCc7Zv56779eg9XnegnOre
         fPUfJrrFNTHrecpOYfhRy37tn4r5xdcZWA2EI0nZJCr/mUiG11BQSXteUZzt6TR7ykd7
         YbWupmaR42+I5VYLCw+C0SopGcAsuw8yU1frG4GnD77ct19iWGOvtGxsH9zRzcHA3WYT
         N5tQ==
X-Gm-Message-State: AOAM531eG2nNSBX9AzxVzyJGdbgR8Pro8p2i7QIxr5S+8pAw4HMy1wVR
        X6eNs8METq2RTcAlP3y3me2lXA==
X-Google-Smtp-Source: ABdhPJwnaCikXIxgUC8kjXsVHGKy7uZpNhrFPtf12oJlxW7wJ3rvfqN2M2wCLmApiOSDYSGfCsIsIQ==
X-Received: by 2002:a2e:bc03:0:b0:23c:af37:a6bd with SMTP id b3-20020a2ebc03000000b0023caf37a6bdmr980301ljf.14.1645072309302;
        Wed, 16 Feb 2022 20:31:49 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id l8sm1463391ljb.140.2022.02.16.20.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 20:31:48 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v3 0/6] drm/msm/dpu: simplify IRQ helpers
Date:   Thu, 17 Feb 2022 07:31:42 +0300
Message-Id: <20220217043148.480898-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is the second part of
https://patchwork.freedesktop.org/series/91631/ reworked and cleaned up.

Changes since v1:
 - Fix warning ins dpu_trace.h related to
   dpu_core_irq_unregister_callback event
Changes since v1:
 - Use ARRAY_SIZE() rather INTR_IDX_MAX when clearing irq arrays.

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
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |  67 ++++----
 10 files changed, 202 insertions(+), 403 deletions(-)

-- 
2.34.1

