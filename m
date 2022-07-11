Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F91956FC65
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 11:43:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233327AbiGKJnI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 05:43:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233333AbiGKJmf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 05:42:35 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD5A09CE03
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 02:21:21 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id m18so7658966lfg.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 02:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yzyxFMZ8+v3M9761rPjYYx/omswzn2E+B+Q/gfA4aSc=;
        b=nFO7gQ/FPS+MTeaVZG+0v8Jm/7VLBPBrc03BKwNMjeRFEOQ+WugsLRAf8dLd18albj
         /jRYxHWCOrsx62hqvamnn9fszsypRS/MhvxY0+vvFFEthtIAzwKihRlhyLQlMnzAWOwL
         2pDUvO3A+V1+yHA2i76K1qyndREAZBCnX2MNujn9iPGANcewT8mwW+KarV1kh8XngTDR
         mDMQ7jrPbQ5t8KHxZW960MhRjJ2uOr3G626StGKv6PM43SEbq2iaXKftUyltJbPl6hTJ
         BYSn3U1nAVXW6JnuhoM1sLNTaAr6E7uy21AeSVY3YWR+4qYv0eFzeiwO58/u40s4i6UZ
         AkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yzyxFMZ8+v3M9761rPjYYx/omswzn2E+B+Q/gfA4aSc=;
        b=jRu1wRqOka5M10qmXqHq3kXUrjcQRurZJqsCByNMW9PnE2E9iCd1G6gXsmRkiayguO
         tP9fMIXdRBqNSCHO0+UaNKe4hbr/vX8Cyz7FDxYeZ9QmVAYhOqWAUQCwB/wjMHfqhG0y
         EBtaOeCRd/ak34AYmDHjMQa2SNDvQ29CG7E7FgQGbFpCI9dIXtuO5/FGiO6h2yqldjTe
         I2qWKiDU8bTwdANAg7jvsCcsuas5JSJ8pj5T37N3Tx8j+MC6PXE1KIF7p3dudlq4+2Wk
         qPei7NVMeL9gpBJ5l8u5TjQbfWSrvq3ptQK32QyQP+C4diuIU4GX0uzAnKg/BsVa3xXc
         0Nww==
X-Gm-Message-State: AJIora/paPKAXllSVBTX4h7cHSmJ5cvd908kNjLW82+UztaCSNqq5tdo
        bXcaUgN37nmWc9x73qnAVa4DvQ==
X-Google-Smtp-Source: AGRyM1u0RQeE4xvkfbL2vxSwvz3+rBdnCRyIlPAIvTLoWC2N4sGyrvCsiWUEH03acFh+GnG+pRwqcA==
X-Received: by 2002:a05:6512:3985:b0:483:ccc5:9494 with SMTP id j5-20020a056512398500b00483ccc59494mr10560070lfu.623.1657531278325;
        Mon, 11 Jul 2022 02:21:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c30-20020a05651200de00b00473c87152bcsm1434195lfp.127.2022.07.11.02.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 02:21:17 -0700 (PDT)
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
Subject: [RFC PATCH v3 0/2] drm/bridge: ti-sn65dsi86: support DRM_BRIDGE_ATTACH_NO_CONNECTOR
Date:   Mon, 11 Jul 2022 12:21:15 +0300
Message-Id: <20220711092117.360797-1-dmitry.baryshkov@linaro.org>
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

Changes since RFC v2:
 - Changed DRM_DEV_ERR_RATELIMITED to dev_err_ratelimited()

Changes since RFC v1:
 - Dropped first patch (conversion to atomic), corresponding patch has
   been already applied upstream
 - Added DRM_DEV_ERR_RATELIMITED to notifiy users/developers that
   corresponding connector was not found.

Dmitry Baryshkov (2):
  drm/bridge: ti-sn65dsi86: fetch bpc using drm_atomic_state
  drm/bridge: ti-sn65dsi86: support DRM_BRIDGE_ATTACH_NO_CONNECTOR

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 40 ++++++++++++++++-----------
 1 file changed, 24 insertions(+), 16 deletions(-)

-- 
2.35.1

