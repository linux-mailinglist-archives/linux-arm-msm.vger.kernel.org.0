Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24EA956D6ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 09:37:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbiGKHhi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 03:37:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbiGKHhh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 03:37:37 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E6581B787
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 00:37:36 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id z25so7320103lfr.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 00:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3h4Cia4GaHX2v4JhUn0TE82Kth+oJUN9lAVHwAWwnD8=;
        b=Dff5xnUEbOFZ3krvJAHSf8q7CaTXArvxJlXk7Ac3HyhbEKI17xLdj82jioSmMlm9XX
         w8xoFuxHIHww8BPcbVRuoufFdfD7jps2p++JmURLyPi1RgpsYP1134ZQtzPDG54fMTf3
         F3RFPAuoT7yNsfclITwxtA04nUvhNVGVOuNnyriKbPUKguqIsSo8f+Md3SdeZK0mCD+D
         YE0zvcu2gKRHS5D0uN5iuxn2KKusizBR+r6J/wse4C3eHFF4BhgPrH9HzXX9SIpTPLG/
         r9UznThMZO4cAIb+8C6NnAuScTYnFu9qyKprEU8MZ5/zUrDQtEzviVaN6i2y6TTC5f+2
         3bSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3h4Cia4GaHX2v4JhUn0TE82Kth+oJUN9lAVHwAWwnD8=;
        b=nrZnEaOgYFzTkxZkXCHMLHFO6vv70FiBQ4ym/F+EB0rK6iHzIHzRb4JEwYD0T7yK9V
         e3mQWL/sz1ZbX4AYc836OqDVJ5xqWz1mVR0HllAwioBEMLpDbhx1kGyxB5pDejvquoED
         Uh0xI24AEqAb31hvdCVE4rZSrctjLtGXX8z/osPGCzQqT4qhN26MFJ8wwE0qdCpUJDBy
         6R85A5y9G00aVtxSloHagdWGDqzGjFy2AN1nTu/QFyaLL+wS0GnnBEtj5EKap/lJ/Jqh
         yMC3I9Ny1Lldyye00aZNlg4jUqSHqVeuxboMHifG4o60mERTP/Ay1zZ7MfGd+PAY5+Iy
         ifAQ==
X-Gm-Message-State: AJIora8yEIkJWeNYavgpxKmBYDFpesE+xT/gyqRdBO3XNh43nWpI8EW5
        2kr2kBnucGLBUSQjdLQESJLNuQ==
X-Google-Smtp-Source: AGRyM1tdY/eYp5/POtpprgNAZwPGA3AOCYoE4M26Kh7kOJYlFARkVpnWiqVOQjs7wCrImJPHpHs7bw==
X-Received: by 2002:ac2:4e13:0:b0:489:d699:5046 with SMTP id e19-20020ac24e13000000b00489d6995046mr4416536lfr.134.1657525054672;
        Mon, 11 Jul 2022 00:37:34 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j8-20020a056512344800b00489e64dcf75sm149439lfr.204.2022.07.11.00.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 00:37:34 -0700 (PDT)
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
Subject: [RFC PATCH v2 0/2] drm/bridge: ti-sn65dsi86: support DRM_BRIDGE_ATTACH_NO_CONNECTOR
Date:   Mon, 11 Jul 2022 10:37:31 +0300
Message-Id: <20220711073733.312266-1-dmitry.baryshkov@linaro.org>
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

