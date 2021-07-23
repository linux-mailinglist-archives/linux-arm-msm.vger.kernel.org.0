Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26B643D30C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jul 2021 02:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232730AbhGVXle (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 19:41:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232682AbhGVXld (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 19:41:33 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E70DC06175F
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 17:22:08 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id a14so1306979plh.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 17:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ilHV4zkFYV/inpNlTjXcax19NKR7g9Dp2bd3Wi4nieU=;
        b=H5PMaoBwCj/x/6zyYxozhyvWGMrvIQXzg/TlzwMXxkPxuAO0Sobu8MZT/+xdkHdx8U
         KOOwY8KyFWw/2ShculMhRh/bi+M+p5yRTBQBIftJ/YDVi3aoASgjN4QuoUoSFqXWbmFt
         ryb2z3k6h/2m3ta2j+N25Qa/slTSq5y5E/zuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ilHV4zkFYV/inpNlTjXcax19NKR7g9Dp2bd3Wi4nieU=;
        b=OYShqOjaBvHhKZxeP2LTp9B1lAL2SZyXXOv17W6Ug3GcBf9ySyTCdWCBo7oVAS8TMY
         UgxqtYchl2ONhGOtTupk7Wj48M7/wjuEEgWlZfWTaF8Kn9uVUcNeNyqOb5Nj9jwm7Ax+
         8PcDIXPLTIo2dzvAsF3pwMqqYy686ka33yBlh4/20I2hPGC2VQmTpyyeX0atep1tSuoa
         wC12iAmukB8rkF9TKbHJVkM9EopIKxa1jpez9Adv+PkEtrwAyaO+CpavI+ScQAupDqsn
         /lgenY03efB1vlCXblFTxT8iiVYMJSRK0FIDkyXaIIsu+7N3UjhtvkzZ5cGf78hKkZIe
         kaDg==
X-Gm-Message-State: AOAM53043oGcqEgIqm4OD9qYQtNrFlTYIRtzCedkH9ybgyb3GzyevEMy
        Ps0/tZw+T/5JTB09wqjP5cBxYQ==
X-Google-Smtp-Source: ABdhPJy3fNIhcYUlCjPQ6rsNOgNRR30C3i3qn3hSQwAIOxUXOxQpz3bxuGzhyKhNARRvDRL91VLEsQ==
X-Received: by 2002:a05:6a00:1951:b029:333:64d3:e1f1 with SMTP id s17-20020a056a001951b029033364d3e1f1mr2175927pfk.43.1626999727675;
        Thu, 22 Jul 2021 17:22:07 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:5e70:6a49:67b5:2b7e])
        by smtp.gmail.com with ESMTPSA id iy13sm4072377pjb.28.2021.07.22.17.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 17:22:07 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Steev Klimaszewski <steev@kali.org>,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-arm-msm@vger.kernel.org, Linus W <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/8] eDP: Support probing eDP panels dynamically instead of hardcoding
Date:   Thu, 22 Jul 2021 17:21:38 -0700
Message-Id: <20210723002146.1962910-1-dianders@chromium.org>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


The goal of this patch series is to move away from hardcoding exact
eDP panels in device tree files. As discussed in the various patches
in this series (I'm not repeating everything here), most eDP panels
are 99% probable and we can get that last 1% by allowing two "power
up" delays to be specified in the device tree file and then using the
panel ID (found in the EDID) to look up additional power sequencing
delays for the panel.

This patch series is the logical contiunation of a previous patch
series where I proposed solving this problem by adding a
board-specific compatible string [1]. In the discussion that followed
it sounded like people were open to something like the solution
proposed in this new series.

[1] https://lore.kernel.org/r/YFKQaXOmOwYyeqvM@google.com/


Douglas Anderson (8):
  dt-bindings: drm/panel-simple: Introduce generic eDP panels
  drm/edid: Break out reading block 0 of the EDID
  drm/edid: Allow the querying/working with the panel ID from the EDID
  drm/panel-simple: Don't re-read the EDID every time we power off the
    panel
  drm/panel-simple: Copy "desc" into driver data; don't store a pointer
  drm/panel-simple: Split the delay structure out of the panel
    description
  drm/panel-simple: Implement generic "edp-panel"s probed by EDID
  arm64: dts: qcom: sc7180: trogdor devices can use probable eDP panels

 .../bindings/display/panel/panel-edp.yaml     | 196 ++++++
 .../bindings/display/panel/panel-simple.yaml  | 559 +++++++++---------
 .../boot/dts/qcom/sc7180-trogdor-coachz.dtsi  |   2 +-
 .../sc7180-trogdor-lazor-limozeen-nots.dts    |   2 +-
 .../qcom/sc7180-trogdor-lazor-limozeen.dts    |   2 +-
 .../boot/dts/qcom/sc7180-trogdor-lazor.dtsi   |   3 +-
 .../boot/dts/qcom/sc7180-trogdor-pompom.dtsi  |   2 +-
 drivers/gpu/drm/drm_edid.c                    | 113 +++-
 drivers/gpu/drm/panel/panel-simple.c          | 497 +++++++++++-----
 include/drm/drm_edid.h                        |  47 ++
 10 files changed, 965 insertions(+), 458 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/panel-edp.yaml

-- 
2.32.0.432.gabb21c7263-goog

