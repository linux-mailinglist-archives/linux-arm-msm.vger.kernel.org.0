Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD7D04B30D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Feb 2022 23:40:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236116AbiBKWkL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Feb 2022 17:40:11 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235884AbiBKWkL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Feb 2022 17:40:11 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07AF1D61
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 14:40:09 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id f10so19191467lfu.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 14:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mqrGjJky4QHW+nCXoO2D5B1Is7dfhEvVRFup6JlSelo=;
        b=tBIBK61QKzeRfYGXURoiPtSrXZUamLlmdY4J4hdjLaFSdkYAnb4XXKW2ZGhTZyEYku
         0FGQPpnxi0W0yUxDJba61130RA56BuDBBEFvGUAcxLHq3z5WCsliwSkR4RVHjhuivYfl
         r3iKJObj5Pw/ftV7cM2aHbvNl+rE8mNTqWU4FFfKEyrdnOUikYqROnfOZYKLLFGZd8mP
         wIPOP2MTmiH1ZHMFrmH7TuDJa2WvcvwApHMNjXa+otZnZVeDPdDULuXztPYAJfH4GAez
         NSH/sE+b0BaQhdoS/EZBenzTs/F8lYaszOLG/QrtZjglzy39FlrTuDT1zF6iw+PfNEhT
         lijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mqrGjJky4QHW+nCXoO2D5B1Is7dfhEvVRFup6JlSelo=;
        b=ToBikcUs3z4Xb4x5XPZzZqCwsAddmTm8b4H1ucaIoJctfxyuYJDSw7uI3gYEc6S3LT
         RGIphSS04pe09FCnNXAUYXJ68ep4Sbq5aCb/DujVbo+qpDpXcW2s+lpFe//GRokRjBA3
         Gh5jpRPgERqjGouvrPMaRf1f8E4igdbxMem4iz8l/2pOTfawV7SLYNUzjw0bLvuMSLuQ
         3s/eYRrZMjfNRtuWES0mj833wxokhHe0D5d16dxs57Y6IBg+ZWD+sDEKjjjMPhKOAYu9
         muJUN8RGcDPJ/5gko9gk0fWWWwz0Q+EnIzxsRSK3/M5OhGpmjg4U2tZ9rF/9p31NSYOy
         Nj3A==
X-Gm-Message-State: AOAM531wVcO2HtJYmIjgM6XxWIqODysBd4zAF4pCnVQc8vq5acCBNzbN
        ye3MvLlOYra3JWFIZ55Llt1PCA==
X-Google-Smtp-Source: ABdhPJxkNJ1LnV/L9NG6QflGexprn9zjVcmWDTASNxV9z8sUfjJcdg6L8KDp08gHHq+orYxFSMJBfQ==
X-Received: by 2002:a05:6512:e8c:: with SMTP id bi12mr2687360lfb.612.1644619207381;
        Fri, 11 Feb 2022 14:40:07 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a6sm3319983ljb.93.2022.02.11.14.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 14:40:06 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [RFC PATCH v2 0/5] Simplify and correct msm/dp bridge implementation
Date:   Sat, 12 Feb 2022 01:40:01 +0300
Message-Id: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
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

I noticed that commit 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display
enable and disable") conflicts with the panel-edp (panel bridge)
support. Both bridges will try to attach directly to the drm encoder
itself without forming a proper bridge chain.

Initially I started writing lengthy letter describing what is broken and
how it should be fixed. Then at some point I stopped and quickly coded
this RFC (which is compile-tested only).

Comments and tests (on both DP and eDP setups) are more than welcome.

Changes since RFC v1:
 - Expanded commit messages to reference possible setups
   Added details about possible bridges, usage, etc
 - Changed handling of errors for devm_drm_of_get_bridge(). Made the
   -ENODEV fatal for the eDP connectors only, all other errors should be
   fatal for both eDP and DP.

Dmitry Baryshkov (5):
  drm/msm/dp: fix panel bridge attachment
  drm/msm/dp: support attaching bridges to the DP encoder
  drm/msm/dp: support finding next bridge even for DP interfaces
  drm/msm/dp: replace dp_connector with drm_bridge_connector
  drm/msm/dp: remove extra wrappers and public functions

 drivers/gpu/drm/msm/dp/dp_display.c |  76 +++++++-----
 drivers/gpu/drm/msm/dp/dp_display.h |   3 +-
 drivers/gpu/drm/msm/dp/dp_drm.c     | 186 +++++++---------------------
 drivers/gpu/drm/msm/dp/dp_drm.h     |  22 +++-
 drivers/gpu/drm/msm/dp/dp_parser.c  |  38 +++---
 drivers/gpu/drm/msm/dp/dp_parser.h  |   2 +-
 drivers/gpu/drm/msm/msm_drv.h       |  31 -----
 7 files changed, 137 insertions(+), 221 deletions(-)


base-commit: 6aa89ae1fb049614b7e03e24485bbfb96754a02b
prerequisite-patch-id: 89e012b5b7da1a90cc243cc4c305400a4fafdf0b
prerequisite-patch-id: 0de618d54d5fea5b48c2b540c8731a1a7e2f4c15
prerequisite-patch-id: a9b1a27e9800626cc0ebc73291d65c2790670583
prerequisite-patch-id: 2067135baa2995fbcbfd6793b61e39027e6b7516
prerequisite-patch-id: 0591114f3c59f9376ba25e77e7a48daf90cf7aa6
prerequisite-patch-id: 684cf6c7a177cb7c6c9d83a859eec0acef5c132c
prerequisite-patch-id: 083313bc9b19fcf7fed78f63a3cb0752f54cec4f
prerequisite-patch-id: 6e46e24cd7471ba38679b3d6f99a1132fa1154b3
-- 
2.34.1

