Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8A1E519193
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 00:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243742AbiECWo0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 May 2022 18:44:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235702AbiECWoZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 May 2022 18:44:25 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1297B2DA8D
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 May 2022 15:40:52 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id c11so5951239plg.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 May 2022 15:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z4jQqLRjT5d2UYQiVLjONfc4f34INRSeov1NA+mVkes=;
        b=CR3c66gXlI7dp0GBAFTU6S4A96UiPfse88KiZYhRAnyvdsiEtq5+rIgzLTXLBAgAFL
         rU4spHhLilzT+XqFo07FtFJT+O0In8w0k8D2zdB9Dgl1tea50Azb8JKw4BpEBlbhl6BQ
         P8/vwL4+iRR/6ZBfz77yKapJZq/VOVXeRz+5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z4jQqLRjT5d2UYQiVLjONfc4f34INRSeov1NA+mVkes=;
        b=tWTH4ySEw/4D9N8ABdLxJ9YgGf8R1r5n6syHtvDxCRRq6IPVymTexSyizRQZ16LreV
         7srTyH+3xBvYbxI1/Eu2CdGU7niTza//k84CQYSuK1XQx3zeRP3ECTpobi0tmuygRXkp
         f5aX4xNWSMxWDvymEnjOucvVuJEE+tyVZQgmibOUXkAwJL0XSLEEOm3/9GMZ7UghBrqq
         LEU9ideVUCnOQkMdsOnifX9lXMjFtiUQJbAIzNAta3wuEJTiUggTxSGzgGaIDJmc1aPV
         NNApsPrAiCujt6LCOBaOWUFKiSo78eNxapWBYAOSmwqx2y0cwTtexzeh2WVLsadPinDh
         /15Q==
X-Gm-Message-State: AOAM531W9PvpbnCeXMs8/pFFzlNgsq1liCsi/gp+Jb5pkFcuKaar6I7e
        XRbR6UMmfMBvMmgLnA79v5092g==
X-Google-Smtp-Source: ABdhPJzYaUyozHYiMHueXIGD9R5owe6Q0eQLyLYo/8TUtTmGnNhSX5JUoZ8jDGchkO1aSnwI/fJfAQ==
X-Received: by 2002:a17:902:d1cd:b0:15d:1483:6ed6 with SMTP id g13-20020a170902d1cd00b0015d14836ed6mr19614970plb.58.1651617651626;
        Tue, 03 May 2022 15:40:51 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:93ca:84cb:c452:c0a3])
        by smtp.gmail.com with ESMTPSA id az12-20020a170902a58c00b0015e8d4eb27esm6803778plb.200.2022.05.03.15.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 15:40:51 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Philip Chen <philipchen@chromium.org>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Lyude Paul <lyude@redhat.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] drm/dp: Make DP AUX bus usage easier; use it on ps8640
Date:   Tue,  3 May 2022 15:40:27 -0700
Message-Id: <20220503224029.3195306-1-dianders@chromium.org>
X-Mailer: git-send-email 2.36.0.464.gb9c8b46e94-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch is v2 of the first 2 patches from my RFC series ("drm/dp: Improvements
for DP AUX channel") [1]. I've broken the series in two so we can make
progress on the two halves separately.

v2 of this series tries to incorporate all the feedback from v1. Hopefully
things are less confusing and simpler this time around. The one thing that got
slightly more confusing is that the done_probing() callback can't return
-EPROBE_DEFER in most cases so we have to adjust drivers a little more.

The idea for this series came up during the review process of
Sankeerth's series trying to add eDP for Qualcomm SoCs [2].

This _doesn't_ attempt to fix the Analogix driver. If this works out,
ideally someone can post a patch up to do that.

[1] https://lore.kernel.org/r/20220409023628.2104952-1-dianders@chromium.org/
[2] https://lore.kernel.org/r/1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com/

Changes in v2:
- Change to assume exactly one device.
- Have a probe callback instead of an extra sub device.
- Rewrote atop new method introduced by patch #1.

Douglas Anderson (2):
  drm/dp: Add callbacks to make using DP AUX bus properly easier
  drm/bridge: parade-ps8640: Handle DP AUX more properly

 drivers/gpu/drm/bridge/parade-ps8640.c   |  77 +++++---
 drivers/gpu/drm/display/drm_dp_aux_bus.c | 215 +++++++++++++++--------
 include/drm/display/drm_dp_aux_bus.h     |  24 ++-
 3 files changed, 216 insertions(+), 100 deletions(-)

-- 
2.36.0.464.gb9c8b46e94-goog

