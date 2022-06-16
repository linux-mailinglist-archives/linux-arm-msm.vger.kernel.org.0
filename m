Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D735954DDC9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 11:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbiFPJDb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jun 2022 05:03:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376483AbiFPJD0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jun 2022 05:03:26 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0395A2F027
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 02:03:25 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id g2so789182ljk.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 02:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fV4e5YC9VYPaeaA3wYkEZj1J8lq/TEYTcnfqzS3h2eU=;
        b=o0fIZANVn9C9PV0ontkcAk6mmCC1Eso7Xx+wM30L4F+Nav7QGbwlKA9k4BAz9ScOvG
         N0XnfSxgcFtu/BNsn/gMY3F73M+Q2nGWdSsN5aKiGxhLVNpIW7rHyQiG4CdrSVcXCJ0U
         tQsehBpaRfefwBr+eTC4wl3qiQ05VuOdjsa9OnuCdl5alW7sC/IqR8bQDDGRLOBrXtb/
         +dICAGXXktHLx2oie+hiHxOfZUXNnUcMfbBa01ektqvVvn/buCJsClEsyezmCGZPLNCH
         CUaVUP7TCvp5mCevW+YeHBUXCAHxjCbO4d+eACyAubQsae1g+s4KwvQBJIuroVf4d0TR
         Jglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fV4e5YC9VYPaeaA3wYkEZj1J8lq/TEYTcnfqzS3h2eU=;
        b=KBiqKGQP0fbZ5es3TjvG1v+Sz2bIpOTegPcpajWBTB+xrRGg5hBR4BFKygRyqNqyi5
         OI/9QUgFD5GNIRkw3aseTKyX8LCBVSkmzspJq7axoF89zoEZi3YD+WIgfwfVFblsUGUc
         lJdN2rDowtwmvVGtEnU5U8x37clueFLAxYT25tdFo6WkHuPRZ7W4njE+WUWU91NmBufR
         vTZz41to27/U0+zPsCSWwRvX5nFqCcXnIOExRzuCfFEIwNUKZ9yab8G3EFZui3YZH7Rb
         3NJsQnfzRQCm+SOPorDB4F4Vhul5FQp0n5LiLqEe0m/OO9vCgIaa/Khpv384C46xZjWn
         kz9Q==
X-Gm-Message-State: AJIora+DNfDF9IJ97fJNWcOkYqwDXJk55ND4GGm3LjN9bRVO7kDrzKS2
        VLXUiUgr/biDIPVLTtTFSa+1RA==
X-Google-Smtp-Source: AGRyM1sZRCtLA14Wp6cT/661rkyn2DZwhIIVqJ/CT3dEJjmk0LvlNqAXGICx3umKnWixeyOI4AGQcQ==
X-Received: by 2002:a05:651c:545:b0:25a:45d1:4086 with SMTP id q5-20020a05651c054500b0025a45d14086mr1911485ljp.307.1655370202943;
        Thu, 16 Jun 2022 02:03:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j9-20020a2e8009000000b0025575338c41sm172573ljg.127.2022.06.16.02.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 02:03:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH 0/2] drm/msm/mdp4: rework LVDS/LCDC panel support
Date:   Thu, 16 Jun 2022 12:03:19 +0300
Message-Id: <20220616090321.433249-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

MDP4 uses custom code to handle LVDS panel. It predates handling
EPROBE_DEFER, it tries to work when the panel device is not available,
etc. Switch MDP4 LCDC code to use drm_panel_bridge/drm_bridge_connector
to follow contemporary DRM practices.

Note, this code has been compile-tested only. Testing on the real device
is still pending (and will be performed before the merge).

Dmitry Baryshkov (2):
  drm/msm/mdp4: move move_valid callback to lcdc_encoder
  drm/msm/mdp4: switch LVDS to use drm_bridge/_connector

 drivers/gpu/drm/msm/Makefile                  |   1 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      |  32 ++++-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h      |   7 +-
 .../gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c |  46 +++----
 .../drm/msm/disp/mdp4/mdp4_lvds_connector.c   | 120 ------------------
 5 files changed, 47 insertions(+), 159 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c

-- 
2.35.1

