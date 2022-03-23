Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAA424E5068
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Mar 2022 11:35:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243576AbiCWKhU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Mar 2022 06:37:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243573AbiCWKhT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Mar 2022 06:37:19 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8CE94DF7B
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 03:35:48 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id q14so1195803ljc.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 03:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tbeye8khzGhcPEDC/HTAHCn/sJ3nc2ZI8GUHgmrO/Fg=;
        b=Xalt9QgnnPgRqt6/0m66oDRVYcV/RfbGkVZfkhCZzERUPlSE662rE/bVVdH8YTqJ6T
         GFgjSizGQ4JL+exBF60iYc/UnwjeJGwOp5vq5a7ogule/diU3KGatneXCuNNFddDUP4R
         AfWdLu6btYKSlxloxDotsTGVvek32NBIKtaAI8+4yq2wrMZspxvKbWGL4xzhhipovMCJ
         /DjhS/fsLiyV7a3gRb8s4xHgkhDS77zRox+AsRGSONekz0SIFL8ojMQrg3iYaHkvhdVS
         JdLljJCv9EhThmoJ9wQcShAHLF+K95yry3ZCfjDzQRUfjv6kjqJJ4rqNPlQuteI6tGih
         UYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tbeye8khzGhcPEDC/HTAHCn/sJ3nc2ZI8GUHgmrO/Fg=;
        b=aCrMlzGWh7ZebGAaWGfPAHGpv6NOt1/sE/XRO3Ie+rGBv5RhMkvmGZRK5FqtI5VqrW
         B8D5efF1HLRdEgnZvA9wVTPyI5gGRZdhWE8r/JEyOakV7KSpevFtI1McMzAkjxmftl9a
         SJEGXeg7ob7+/1oqRFMYqDPO9/SiqnOEKnot7B5QTZzFaPJumzj4IQrxoIEkpBL+9Qgq
         g81SAzMbqWm6KU3IiUFrE8cCK1apcdNDekAx9adR4VxCmFujcWKXKGOPR24glHL9eY2Y
         5GekWvwFdG/4bLKUTAvkNvr8vC+fg9+ylLXjPbOBKRPRaA6VlulGvNG7y+JVb2JAqqIx
         DJKQ==
X-Gm-Message-State: AOAM530mLCT291bj044wq9Ek24be5SWn96Nhs92SBlAl0JNKWphpcl4b
        3/mfSTjpv2cwdKvLCp2HkZeChw==
X-Google-Smtp-Source: ABdhPJzNiquXcLkI5UZDh0uZxRq3K4dBplcwBBoZeeH3s049AeRE7bx6DChkTZiA2YBJ3hP6KJZGyg==
X-Received: by 2002:a2e:8786:0:b0:249:8620:36fd with SMTP id n6-20020a2e8786000000b00249862036fdmr9519577lji.461.1648031747250;
        Wed, 23 Mar 2022 03:35:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x14-20020a056512078e00b004481e3198cesm2491058lfr.142.2022.03.23.03.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 03:35:46 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>
Subject: [PATCH 0/3] drm/msm/dp: simplify dp_connector_get_modes()
Date:   Wed, 23 Mar 2022 13:35:43 +0300
Message-Id: <20220323103546.1772673-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

As noted by Ville Syrjälä [1] the dp_connector_get_modes() has weird
on-stack interim copy of the mode. When reviewing the mentioned patch I
noticed that the rest of the code in dp_connector_get_modes() is weird,
unused since September of 2020 and can be removed. This series removes
dead weird code leaving dp_connector_get_modes() simple enough.

[1] https://lore.kernel.org/linux-arm-msm/20220218100403.7028-11-ville.syrjala@linux.intel.com/

*** BLURB HERE ***

Dmitry Baryshkov (3):
  drm/msm/dp: drop dp_mode argument from dp_panel_get_modes()
  drm/msm/dp: simplify dp_connector_get_modes()
  drm/msm/dp: remove max_pclk_khz field from dp_panel/dp_display

 drivers/gpu/drm/msm/dp/dp_debug.c   |  2 --
 drivers/gpu/drm/msm/dp/dp_display.c | 11 +++-------
 drivers/gpu/drm/msm/dp/dp_display.h |  5 +----
 drivers/gpu/drm/msm/dp/dp_drm.c     | 33 ++---------------------------
 drivers/gpu/drm/msm/dp/dp_panel.c   |  2 +-
 drivers/gpu/drm/msm/dp/dp_panel.h   |  3 +--
 6 files changed, 8 insertions(+), 48 deletions(-)

-- 
2.35.1

