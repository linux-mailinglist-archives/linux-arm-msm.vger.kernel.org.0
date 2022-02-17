Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F14DB4B9783
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 05:16:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232096AbiBQEQi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 23:16:38 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232046AbiBQEQi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 23:16:38 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57AD623BF30
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 20:16:22 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id j7so7628417lfu.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 20:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=loQg9Lv88UsmY/ReqbxoXCP0a5sJwzcAHa4A0tvMWIs=;
        b=AzFuca5fyFdYdw6eKegri3YbNYkKo9TFBMH08tlGI52ZWeHBe3m0WtmMjkOzo7fH2M
         GtneKaRdUQVuePkl4ZqLFqTN+5BtdGE9lyc9tq+NcwbciJjhcW9FciRpVSdSXAqwpjL5
         T/FX+3TorFhs+7M34ym/rHtn1PWNPGDfp9OfG3TUk6GyUhV9owo9yehPlR3r5F9PYM1F
         oZ8r85FnlxXWRxgghC2IYcKfn3c71EO4qgrkhtqZW8P/cOgpBrI+bPb1A28NYJg5iuzH
         siXGcvYeI+LhQK9kgFRcolK+E5alJ8pfSlx1cjn2lIB7FS4d1ndG0onXCMqrhrYlrx7d
         EREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=loQg9Lv88UsmY/ReqbxoXCP0a5sJwzcAHa4A0tvMWIs=;
        b=6xuqVZQCdgerGT5nwElOcKOq7RDR5gZbw8i+5rH050hq0SaC9eY6I9y6s/FUk1gecF
         DEip7WQV/UVPcm+3dfseMxshZG8R98Qf8GBr+lzvn7FRha1wG9WfgFXOS9DtjFvEZfkq
         /ij9IZQaRwLDK1kv4RyRCdepazGFgWjvM6EnTKZZqrgJFxQaeDc3hXVm1s6Ac+2I7mfu
         aKf07dYFnQBdHS9FpfmFZB3JXFhePAhrxHoIk/DcBBGiYRb8uPjvLPQk372wcHEFpnOe
         MwCIT1xUSVTfngy9CrYczmUiX8WX89IpKmHGld4vOleoxR1HmS8lcyhIaEI15jDkefTg
         MuMw==
X-Gm-Message-State: AOAM531POtYzz/0FH/TSvd3zwUhrFNEcPAd2RG7fTh0HABN66gdSwef+
        5U53LG0SlqIwINo2a1WTUnU73A==
X-Google-Smtp-Source: ABdhPJzv6IBL1HyDtH61+hP/wrickUo3bZOpYpC+2wKeBUBv/f7w4xTwO5LGAfQpp0lz9BxE1BABVQ==
X-Received: by 2002:a05:6512:3ba2:b0:443:6701:bb04 with SMTP id g34-20020a0565123ba200b004436701bb04mr787098lfv.644.1645071379010;
        Wed, 16 Feb 2022 20:16:19 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k16sm2452349ljg.25.2022.02.16.20.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 20:16:18 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/6] drm/msm/dpu: simplify IRQ helpers
Date:   Thu, 17 Feb 2022 07:16:11 +0300
Message-Id: <20220217041617.470875-1-dmitry.baryshkov@linaro.org>
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |  53 +++---
 10 files changed, 193 insertions(+), 398 deletions(-)

-- 
2.34.1

