Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1338F7C6130
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Oct 2023 01:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235217AbjJKXjZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Oct 2023 19:39:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233796AbjJKXjZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Oct 2023 19:39:25 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6846B9E
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 16:39:22 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2c186ea81c7so4732911fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 16:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697067560; x=1697672360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k9ZbNL2ZO2xnYw+f/qXgIy6W1+ECSK31UMyr+/My700=;
        b=FZELL5pLvoNxVkwkPCUDYv0MJmtKiFmpyoAWeRM+vkY8qcrTi309QgdtA4LXEKfeyc
         UzT1SCpavGrzcJoYyJqImCy2Sgx2FbTVNWCL7MnTMx1S2rfPPwOYEto8O9Yhh7ORXB3M
         Bv9CRGuhehk+Nmb1HKCWgtbcdWUdDZbFkxFudUAGepSqYmGGT9/216PgxoZCjbTaMKHI
         iP/FAbf/H0aoTu7siBiQ5YXLThEml2x8aaMGw8MD0tQGLbEKe2McIv73jXwk1v0kWFuW
         XxWyOQqfbhNOBuDN92LA+ucprMULnseCjZFUducG/j7DH6GcruFiXtnFWPz+p73FeNw7
         rjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697067560; x=1697672360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k9ZbNL2ZO2xnYw+f/qXgIy6W1+ECSK31UMyr+/My700=;
        b=YOoscWPOGYxhC1kkBy1UxlDmJA+jr5SXoouCOc13QBnRayRl3X1mj0/voJ9NjrkS9O
         fkMnHrMhFFAUW/e03KMawxMY75huKuPkThS1a0bRwGmnrWG4RQpIsQGVbEaeoVozSr9b
         cjjZx6qibfHuaqzG3FktLgnYdW0QKG9yiyUsPKQDND7e1F5jJIpKgR/pjvBYyp8ZCfnR
         Iy1GAvHiddrt4qKoGpymh2HKtVp3RGwvVzrUC5qSY4BZcf6IPys840uxvwx+arS8gmlC
         zqTCsEr3HpeOULY9cWXYVeifOLGIWTrCJq9Cn2ZVzfvbRjRsNJ4f1AJOnho81F8oDvJP
         si4g==
X-Gm-Message-State: AOJu0YyK7LroeVM/qcHoeNqXHT2ghzbuBIe9AJnvjRjOB6iv6P1731Lj
        f2ZJDIzABOp3QuoDhQmO4tED3Q==
X-Google-Smtp-Source: AGHT+IElT7AQoWznFRUzefnPxjuyk/f4YoUnTLHexKJLP0Tp7XWPjqhbr10/ecYGLyY7bzUkIUh3WQ==
X-Received: by 2002:a05:6512:282b:b0:505:7371:ec83 with SMTP id cf43-20020a056512282b00b005057371ec83mr22292485lfb.48.1697067560648;
        Wed, 11 Oct 2023 16:39:20 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m27-20020a056512015b00b0050567cdb8f6sm2466032lfo.239.2023.10.11.16.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 16:39:20 -0700 (PDT)
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
Subject: [PATCH 0/2] drm/msm/dsi: fix handling of TX DMA buffer
Date:   Thu, 12 Oct 2023 02:39:17 +0300
Message-Id: <20231011233919.410099-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix two issues in how the MSM DSI driver handles the GEM-allocated TX
DMA buffer object.

Dmitry Baryshkov (2):
  drm/msm/dsi: use msm_gem_kernel_put to free TX buffer
  drm/msm/dsi: free TX buffer in unbind

 drivers/gpu/drm/msm/dsi/dsi.c      |  1 +
 drivers/gpu/drm/msm/dsi/dsi.h      |  1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c | 14 +++++++++-----
 3 files changed, 11 insertions(+), 5 deletions(-)

-- 
2.39.2

