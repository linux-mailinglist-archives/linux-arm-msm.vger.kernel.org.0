Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A7203E9B52
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 01:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232909AbhHKXvZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 19:51:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232911AbhHKXvZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 19:51:25 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24B70C061765;
        Wed, 11 Aug 2021 16:51:01 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so12341061pjr.1;
        Wed, 11 Aug 2021 16:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pOu/fILHgt+GHJ+t3LqOqvToD4GhAEtXIH4LNz022yE=;
        b=OkYnTFE5LQCWTSV+vCVRV1ljIhlzqPvGYsIHL6dIOUfIKFcM6itQeLlu7/ryrZMI4/
         VsJJBKl6ZLSVYBLA4jae2Vup29c616ibhlt81IbiXbAOYiIcvdFY05z7QY99dEtnxVpK
         gJaIfwK0Wl/hua7x2ks+tHZ2fJvF15ZApFMpfK31ie1bpusWvki5U3gBh1+B3MK1YWE7
         9RYSUA26LK8e8qYZBCL2GxmS97cv7yfdOfjDVS51Er3kHMUFJ1qGEDQXksyJyfH4jOZ2
         m+H5eTise9xNcf2vBtqdfUM07+sC9+u3ndnH8+FTtz60FtV7XSTeGPRfzftPI2b/FoKT
         g6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pOu/fILHgt+GHJ+t3LqOqvToD4GhAEtXIH4LNz022yE=;
        b=iMCpuLQOpK852fY3s9BD/PtOwLRQ0rgvpJ9NE/O3v8xFYMDHZg6uyL6fOg1dThN12n
         o+yPWmdA15/Ujx8mdLUTxL6+84G3F5R1AhYILr42MalXdSrM0NxXByIPre+jRiAcB7Aj
         AR3HklzDwOS4wFx1s5NDjd3D3oBgTTnoCkO1usUF2gEwntYItmb6rX1HPRmWth1wlUH8
         +G1a2R9HBV7W5dkHlWiu7YBhj2geJUxiRVC9wH5GOIOBL3xcyKiCnNf9Ndmmv8eDQFJo
         2MUENC2sobMy8tm2Pzu5G0h/1pP81og79p3n2BBxa0EAdVQFICF/6DuSnkg7J8L2YWFZ
         NgpQ==
X-Gm-Message-State: AOAM532YDFkiY9HRP8AlSBW1sixNp+bZyI75CZdeA5vec8PSV37xXPVm
        b7UKqsbGVY1vnScjpXUe52s=
X-Google-Smtp-Source: ABdhPJxsDsAj6f4o1hLwy9wQiiHTMfq9dR2jISGP1yYFkJGtHFr8DO4z6bmlY0t9hkpcwVd5R12EZQ==
X-Received: by 2002:a17:90a:d702:: with SMTP id y2mr1177478pju.127.1628725860621;
        Wed, 11 Aug 2021 16:51:00 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id l6sm724199pff.74.2021.08.11.16.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 16:50:59 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        linux-kernel@vger.kernel.org (open list),
        Robert Foss <robert.foss@linaro.org>
Subject: [PATCH 0/4] drm/msm+ti-sn65dsi86: Fix NO_CONNECTOR fallout
Date:   Wed, 11 Aug 2021 16:52:46 -0700
Message-Id: <20210811235253.924867-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

The first patch fixes breakage in drm-next for the ti eDP bridge (which
is used on nearly all the snapdragon windows laptops and chromebooks).
The second add drm/msm NO_CONNECTOR support, and the final two add
NO_CONNECTOR support to the ti eDP bridge.

Would be nice to get at least the first one into drm-next kinda soonish
since at the moment a lot of things are broken.

Rob Clark (4):
  drm/bridge: ti-sn65dsi86: Avoid creating multiple connectors
  drm/msm/dsi: Support NO_CONNECTOR bridges
  drm/bridge: ti-sn65dsi86: Implement bridge->mode_valid()
  drm/bridge: ti-sn65dsi86: Add NO_CONNECTOR support

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 61 ++++++++++++++++++++++-----
 drivers/gpu/drm/msm/Kconfig           |  2 +
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 41 ++++++++++++------
 3 files changed, 81 insertions(+), 23 deletions(-)

-- 
2.31.1

