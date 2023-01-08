Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAE746613DF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Jan 2023 08:26:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232204AbjAHH0B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 02:26:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230205AbjAHH0B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 02:26:01 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D2341D0F6
        for <linux-arm-msm@vger.kernel.org>; Sat,  7 Jan 2023 23:25:58 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id j17so8334219lfr.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jan 2023 23:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EAAwwDMIubbBE3gJZq8/7iTQMQU12UzH3ERnpRTlNIA=;
        b=Bg5O3r+rUSHFezSrSozin/g+crW+X/TQyfCS8A40HjPt7lpnrxoX27edLpOF93lGNY
         fzmkTeGYcGYG3LGUERYvsHaUhNUY9LmxvgF6fjH3nnT7cs49ckY9Y90BlO8gcjxs3FUg
         pso9ebNbyTNkxbY6gXhKTS+W4/DpOHHw3O6aZFDaqhQ7Zth4sR9YFkiZ4NDJpc9A6tWU
         7pWCVOl82ICIqEb4giqCuBCWutbirn5/y284x3EQDdYv85TkTopv52gexDzn3Av4kAXE
         Te4TNB6BblpL7cf2/2Qzw775R12UfcR5ygX92BFajXlmAiM5PJUnmz7EJx2BrKaxSYGG
         mRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EAAwwDMIubbBE3gJZq8/7iTQMQU12UzH3ERnpRTlNIA=;
        b=YrHXAMzJB2f7TiyvcfvJJ5zWJTbRoWrswkkk5OlFs1pGSkv0e7aMTJVZ9srS8bKYwp
         5QrsT4W4R//bVn4pUoz6Oz8ddfSgRv9UKU5130LjRJqPCdIal6DvgVpaKV6cMiXx6mPK
         YJqpXxPOSLUElUEVa0yjkLSHuPh5jBX9H/FLox/2U/jJncrC9lFNNRYPz+wGfH/QXrhr
         luVV54/gfGfUEbDpr9EqdH3f4SjC6Hdvz9HjbKqH9ufZeH6RwjY7TH+zOHo5Gb3DNy1J
         lDObJ8CugGJ8+11N0jm8ABAwLzJ0o/FKOIdrnzPkMY0e3SjhUBGs3L5dlW0bqrSWs0bZ
         1KEA==
X-Gm-Message-State: AFqh2kqWgf4sweYTxAaiRdn/h8xHCvWtfUZQ1sdIuijbciixikS5FxHy
        WrwRSbY+91P45je1oqjb2rsrYg==
X-Google-Smtp-Source: AMrXdXt1Eb0YDFNARb8Zg47TqsSCW9kfUXxzW6leI3UHZZ6Yx+SeFA+BkOCdFlLT/df186wTov8HtA==
X-Received: by 2002:a05:6512:74:b0:4ca:fe23:7677 with SMTP id i20-20020a056512007400b004cafe237677mr13119631lfo.43.1673162756615;
        Sat, 07 Jan 2023 23:25:56 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id x2-20020a056512130200b004a8f824466bsm927414lfu.188.2023.01.07.23.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 23:25:56 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 00/12] drm/bridge: lt9611: several fixes and improvements
Date:   Sun,  8 Jan 2023 09:25:43 +0200
Message-Id: <20230108072555.2905260-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A series of patches to fix mode programming for the Lontium lt9611
DSI-to-HDMI bridge (found e.g. on the Thundercomm RB3/Dragonboard845c
platform).

Dmitry Baryshkov (12):
  drm/bridge: lt9611: fix sleep mode setup
  drm/bridge: lt9611: fix HPD reenablement
  drm/bridge: lt9611: fix polarity programming
  drm/bridge: lt9611: fix programming of video modes
  drm/bridge: lt9611: fix clock calculation
  drm/bridge: lt9611: pass a pointer to the of node
  drm/bridge: lt9611: rework the mode_set function
  drm/bridge: lt9611: attach to the next bridge
  drm/bridge: lt9611: fix sync polarity for DVI output
  drm/bridge: lt9611: simplify video timings programming
  drm/bridge: lt9611: rework infoframes handling
  drm/bridge: lt9611: stop filtering modes via the table

 drivers/gpu/drm/bridge/lontium-lt9611.c | 312 ++++++++++--------------
 1 file changed, 124 insertions(+), 188 deletions(-)

-- 
2.39.0

