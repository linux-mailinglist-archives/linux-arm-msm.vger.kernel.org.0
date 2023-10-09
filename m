Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9381C7BD6FD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 11:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345753AbjJIJ32 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 05:29:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345690AbjJIJ30 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 05:29:26 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B7848E
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 02:29:25 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50437c618b4so5377944e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 02:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696843764; x=1697448564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TFZSXyW7mDU8fLlg9Pjl2rgEx6FwL8TS6MLs3Q8UKXw=;
        b=Q5FNuVuN4+2wGbor69R137Hx3lsJ9rK+X81Sa7pWSdIZptljx80h5/KlOI9qDEw821
         kGaBSmFl8TxR9KcU13se+JLdSpTKLt1Qr+K97RNiWEND3VJc6WNnuLSxUi2byvNsjY6q
         wYul1Qu1FuHthRlLTGrsbnynIdc2/GtxH52vo9O5luTHi06kX6dv6LcBRvMSYOI1FYnj
         wfZub8MAPYcQ7MAnCddwbJYk7zhgP4enerq7S93u2It/h7Cw3jwrewIkwo8OLm0Ek70U
         4fS48sWwJNYo8zKAU6+L/YfxfXoA2+QROeVsS8LYbPXeEJ3vmkMABWkW8N6xxSkeYbj6
         vQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696843764; x=1697448564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TFZSXyW7mDU8fLlg9Pjl2rgEx6FwL8TS6MLs3Q8UKXw=;
        b=nIq0f05nKr5EVwLs9EU+5LhINdYRndMrtkwbPrDVWULTDuP2A8NlYoBGEgxg/8USNR
         Du9D4Cg8IZsjhzEhYMed4I5S2J3goZL1AeP4BO52qElF9rAMXKc2Bep8Fg2RNBVSpOWr
         qjqu8WABYiEuQD+HPAguCG0aA+b7qp73VeflbgcoE1EuLI8Z/8hcy8n0F+qKx2Y6pUyG
         izoO+gfnn3+CyQTLAfUuZMrNtNMCIe3dp94BvNQssPViPKowaJoZXtTFfsv0XDAdGXZE
         fXKi8h/fCwk8KkcZbU1DYcRL7ijCqZTvQA0zHXvTUU4FIU62gxxDrlVv+FdHm8mxdgEx
         cWjg==
X-Gm-Message-State: AOJu0YzKWZgxa2wcb6gMCCRxnCQJZ3Nl2lh3mWQhGnV3LxTRLlI7EiKs
        78cbpZl5aF/iNvPU74E/f2w8HA==
X-Google-Smtp-Source: AGHT+IFM7Nc4d+4AL5b3aumuZpOu+FLtAHAHH85cINd1L6VlfgbTJxvBv2rLW6PbBbCcEomGQhU9Rw==
X-Received: by 2002:a05:6512:1153:b0:4fb:7559:aea3 with SMTP id m19-20020a056512115300b004fb7559aea3mr15444325lfg.39.1696843763703;
        Mon, 09 Oct 2023 02:29:23 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n24-20020a195518000000b004ff9ab6463fsm1377495lfe.87.2023.10.09.02.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 02:29:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm/msm/dpu: remove dpu_encoder_phys_ops::atomic_mode_set callback
Date:   Mon,  9 Oct 2023 12:29:19 +0300
Message-Id: <20231009092922.2590891-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The dpu_encoder_phys_ops::atomic_mode_set() callback is mostly
redundant. Implementations only set the IRQ indices there. Move
statically allocated IRQs to dpu_encoder_phys_*_init() and set
dynamically allocated IRQs in the irq_enable() callback.

Changes since v1:
- Split trace events into enable/disable pairs (Abhinav).

Dmitry Baryshkov (3):
  drm/msm/dpu: split irq_control into irq_enable and _disable
  drm/msm/dpu: split _dpu_encoder_resource_control_helper()
  drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 79 +++++++++++-----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 11 +--
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 93 +++++++++----------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 57 ++++++------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 34 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     | 74 +++++++++++----
 6 files changed, 204 insertions(+), 144 deletions(-)

-- 
2.39.2

