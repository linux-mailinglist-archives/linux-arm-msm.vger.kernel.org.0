Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6596727F54B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Oct 2020 00:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731679AbgI3WkQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Sep 2020 18:40:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731668AbgI3WkP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Sep 2020 18:40:15 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4B29C0613D1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2020 15:40:15 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id v20so3532014oiv.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2020 15:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1Q03gpzYZKFx4WbmDyv5/MoHJyzVeXQE9aurdxl6jkE=;
        b=S8gdE9fvVQaxNMP5Tk07sOhi1O9IPbRElmRLsx6QZ4qwMH5OwpbW7cPFTFaQkbOq4Q
         BVKhFHBXh7ogQPPqOp16wDNufm1pdR73IKAHuSdTjxlJ7/z251VQR3+dcP8HvY6Xn2cO
         HYGQc2oQDtnTShDnCi4xJ8BP2jpCvEHstXq++V+bWH1EjYzS/dTMbql4zbpRGzG6TDFs
         VJuH0A2oHnZVTWEKDQqImr/HJ05iz3yp54KJLRxKoTMeJa1wBDGcZii5g/xGH8RBKFnq
         r9ydfl+B3mMgWs23jHmBHGtJFk2d118/fxUgH19PjPaam1rE4DmlKePcRMN/5tVrcOiz
         aRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1Q03gpzYZKFx4WbmDyv5/MoHJyzVeXQE9aurdxl6jkE=;
        b=Wopewz8J8RsgL/DtE+mSvj6CZcQtIjckHilsSYNyzQ2O89EUClc8spJFzjlgtCdgjz
         kn7FkFwoOpQnMlHiSqY5bJ95NK0qH6L9Az5lUg1F8oS9MT7mhHisRCHPa5i6NUhfKik2
         KnN7mF0u1p4N21T9pWoX25R2PSrq4uaBZGmVMGMMp9TfXZ9/ihqEf7HRf560xI0yKiph
         dTP80MLHPRLgESZ1UB7VQt9DYF7Xn8rmQOF8YdqJqOzX3dUnEf/Ekla85AqCHqYGgszJ
         Sy62hY0vVBA1RQ71bBzIjDKjy1GcVh/G2K5Zxs6SnEAq5BD3sDUClfxEOnP/AiWFT3JZ
         33Tw==
X-Gm-Message-State: AOAM533VjgJabfqqzgo1sEWfawsK/KMQgVyO3G4Of2Zz8QNtZ9voqNex
        HfcoGzFelQG2pyAyiI8ZqGcpuQ==
X-Google-Smtp-Source: ABdhPJyfioIRVXxFrO8udLEGAlCapQ6/ekLaouaVOiQBLkxLGmHem4ShXrogGhVvqMPo8mzsPd3mcg==
X-Received: by 2002:aca:d693:: with SMTP id n141mr2683787oig.26.1601505614911;
        Wed, 30 Sep 2020 15:40:14 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p8sm781364oot.29.2020.09.30.15.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:40:14 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Douglas Anderson <dianders@chromium.org>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/2] drm/bridge: ti-sn65dsi86: Support backlight controls
Date:   Wed, 30 Sep 2020 17:35:30 -0500
Message-Id: <20200930223532.77755-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The TI SN65DSI86 support driving a backlight driver using a signal
exposed on GPIO4, implement this as a backlight device.

Bjorn Andersson (2):
  dt-bindings: drm/bridge: ti-sn65dsi86: Replace #pwm-cells
  drm/bridge: ti-sn65dsi86: Expose backlight controls

 .../bindings/display/bridge/ti,sn65dsi86.yaml |   9 +-
 drivers/gpu/drm/bridge/Kconfig                |   1 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         | 143 +++++++++++++++++-
 3 files changed, 146 insertions(+), 7 deletions(-)

-- 
2.28.0

