Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1393A7C6237
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Oct 2023 03:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235257AbjJLB3O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Oct 2023 21:29:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233269AbjJLB3O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Oct 2023 21:29:14 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8501898
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 18:29:12 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5031ccf004cso600936e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 18:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697074151; x=1697678951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1LZ/fmrZeDBE6BtfmuHqkriwEyl/J2HH4t6ZgQ8OUD4=;
        b=dAQsIjh76WkpkXvkOVfbXhxmNQDp8EVmhSmbsH4+mvKYleLKv+aixN/4c6sJApY7mV
         0Z/vtdmo8OxrNqPO/owl2DYntYYGS074wip6njUxsFL4/gvJPjZBKdB72OB9SXLkY+bL
         Qbq7SMp3Lpb6kmKu/1c9HceStuo1+CP95sxhIp70qY/PjaiKf1vuNWaK5I5Fzzkrswjr
         dV/jJfrSID4z08+l+fIomzjM4rwyZUCNXJ51GuoHUkJU94893v+pGZFdS5n2iWN9A3Zs
         Kx850Ipt5LUhNunyb7/KeHv8lnKYnf11UKN76DjvmzC0fCdeh/a1wOksNpQc35D9wBj6
         YIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697074151; x=1697678951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1LZ/fmrZeDBE6BtfmuHqkriwEyl/J2HH4t6ZgQ8OUD4=;
        b=bmPNeQ4jHFvQxDeUOwwoFzKw1bhhaBCeejejLRVrYFZJjvFuMqcUcVLaMzJx/aMX9K
         5QJ9W+hQ6QmP8i31vllDsQnw1i41y3WfsILOp8sYxlxwjSjbQGc69BCnVl9U7plX1ent
         DWzrSih4IzuWtkNLFNc5P/joKR0vjKAdr1zGxQmKzkii4U94NxSTIV7Vq0NDQ5qhr8Fk
         1w7RlsuwPHIsIQ76r7YETdEZJ3FlvfZYeR6sQ8oKEgRKdB/vdRwknKM7q5UJQTfGtpRG
         Wf9FJ6W9boahhgMNUwyk4xONLH12pYYLPgdrXghw6UIaXbPhVEmZZHSFQq7Tzsi6LAYV
         8qdw==
X-Gm-Message-State: AOJu0YwYCg51Z8Xut7ZANGNAS/mzUPjio7zlV4QvjNbMYnouKAO/Mtuj
        jhk4QBTeCSyG0aB+gHF+/km16w==
X-Google-Smtp-Source: AGHT+IGIhydsigk/7G8XsFp+TM/XUj2EU2zE5Yu3YD+5mM3M3/pAT5rjdqpKvpH16nV+s3xX+P+7Gw==
X-Received: by 2002:a05:6512:220b:b0:500:a66b:b189 with SMTP id h11-20020a056512220b00b00500a66bb189mr23826766lfu.51.1697074150778;
        Wed, 11 Oct 2023 18:29:10 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k10-20020ac2456a000000b004fe3a8a9a0bsm2526588lfm.202.2023.10.11.18.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 18:29:10 -0700 (PDT)
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
Subject: [PATCH v2 0/2] drm/msm/dsi: fix handling of TX DMA buffer
Date:   Thu, 12 Oct 2023 04:29:07 +0300
Message-Id: <20231012012909.450501-1-dmitry.baryshkov@linaro.org>
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

Fix two issues in how the MSM DSI driver handles the GEM-allocated TX
DMA buffer object.

Changes since v1:
- Dropped the unused 'priv' variable from msm_dsi_tx_buf_free()

Dmitry Baryshkov (2):
  drm/msm/dsi: use msm_gem_kernel_put to free TX buffer
  drm/msm/dsi: free TX buffer in unbind

 drivers/gpu/drm/msm/dsi/dsi.c      |  1 +
 drivers/gpu/drm/msm/dsi/dsi.h      |  1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c | 16 +++++++++-------
 3 files changed, 11 insertions(+), 7 deletions(-)

-- 
2.39.2

