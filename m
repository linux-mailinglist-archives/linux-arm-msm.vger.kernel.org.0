Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F166B56D0CB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Jul 2022 20:45:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbiGJSpn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Jul 2022 14:45:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiGJSpm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Jul 2022 14:45:42 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8619BF60
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 11:45:40 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id e28so1894281lfj.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 11:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w6H7AZgWHjuSnqSkX8Y5Hss8POYSqDNUbN9BjUh/yDM=;
        b=PL4jm3aHr8zv3Siu2NU0vyTZ9tXLSyocFJSVWzdqXUrieXJal8Ug+C6gobbwdWi+Pk
         z7PQbmHSJtYluNTxYqqf7UrwBkPBOIXrRMMekQr2G1idzUUVpzjr9MCziEN/ECo4qzvR
         dp10xxn6fTLaL+pwxMspEnyAVmyLygmfMq8U+NdssrfQTZbzgXOnNZ/BvyGTN/yf6ntP
         YlYKdczhHXIunwtFKOs9iSy9RkLREc6kVLIW21Ees1ESyaW3nanxjgvGeO6FIpUg8oTB
         Ry2uZeVD01iFVkvlICysqTcA1fhvTMBR5m2fMWBNVJ+3s73ghy+vgVP4PAHYI80b1vri
         megg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w6H7AZgWHjuSnqSkX8Y5Hss8POYSqDNUbN9BjUh/yDM=;
        b=z1VeHGG65kVRv3TxDXfH0RYwFM9DBpfKujsD4amtwFJ1oMA7airLUXB22O5qW5CkFT
         xEiFXkOclbToibyELxS2waw+v4P0dadLlvIlch+CbDYLgnQgoFEC48+GeHDRfbmEicOV
         PMuB/d6K7xj3QhadZIpQw1d58ZbVHkhe3MzNJ+FThu5Yx4tS65iEy1KSrjTFrvwVhCUL
         Lz1uXP9jOTz1mb9P1sRDBOlnNR8w6YeABmEg2FNzmwj23YgBai6RlFtzhH2rkbE65kbw
         UGBDx+SaCRKC+YWOpskgD3KmQYEeq3xA6SXNc7623IY+Rh4qfh3gusyUgKMM5I5Mj3WZ
         Runw==
X-Gm-Message-State: AJIora+Z1AF1gnCtjci9JkNq5sVyljgt0RMF4cWevdg2vz7o7dKlsRL+
        9lF+cn4uijZLuLbIIqqPu9WJ4g==
X-Google-Smtp-Source: AGRyM1vo2MPiyoFOAGF5g9FgIpCiw6LZZk+dlO6WMHVsPOY4WYNygn8jlVz98uqq43jvOuikyC+uEw==
X-Received: by 2002:a05:6512:2311:b0:488:b732:5ae7 with SMTP id o17-20020a056512231100b00488b7325ae7mr8967324lfu.40.1657478739101;
        Sun, 10 Jul 2022 11:45:39 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c21-20020a056512325500b0047255d21132sm1051562lfr.97.2022.07.10.11.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 11:45:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Douglas Anderson <dianders@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH 0/3] drm/bridge: ti-sn65dsi86: support DRM_BRIDGE_ATTACH_NO_CONNECTOR
Date:   Sun, 10 Jul 2022 21:45:33 +0300
Message-Id: <20220710184536.172705-1-dmitry.baryshkov@linaro.org>
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

An RFC (or rather RFT, Request-for-Testing) series adding support for
DRM_BRIDGE_ATTACH_NO_CONNECTOR. Note, it was compile-tested only.  This
bridge is the last one used on the Qualcomm platforms (in
upstream-supported devices) and thus it is the only bridge that prevents
us from removing support for bridge-created connectors from MSM DSI
code.

Dmitry Baryshkov (3):
  drm/bridge: ti-sn65dsi86: switch to atomic ops
  drm/bridge: ti-sn65dsi86: fetch bpc using drm_atomic_state
  drm/bridge: ti-sn65dsi86: support DRM_BRIDGE_ATTACH_NO_CONNECTOR

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 55 +++++++++++++++------------
 1 file changed, 31 insertions(+), 24 deletions(-)

-- 
2.35.1

