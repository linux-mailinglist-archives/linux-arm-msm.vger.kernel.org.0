Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 911013E3F39
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Aug 2021 07:10:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbhHIFK4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Aug 2021 01:10:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230491AbhHIFK4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Aug 2021 01:10:56 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5A7CC0613CF
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Aug 2021 22:10:35 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id e19so1578388pla.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Aug 2021 22:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=bfUA2dfTdnWy7owueak2d2BBuP+5ggo63PNQbXg9bzE=;
        b=Cfe9rJ837P8KTfwuV/5W7iiaVQyE1YjQNfYn0rKTVHU76ZZYHhl8hxh8YBjxJRxXxw
         W1Pr9jKZyyDaV645NypdApCbNShTvncQ1cn1dr8TGR7pZC7NarOz85ko6dPIbfm/CIU/
         f5+Ds5hJZOSE8wubFYtQQ7/ocSnCLomJyiC4snJQ3orTqn1r0DUWOe1QwnEDirtdzEcx
         NCj7MDMnI9qK+7HftimklBs4FXOBy0k7uab0aluG16l/IynmASPNa9WRskecrYVzlUG7
         Tr1jN1mfWSjOEqsaMbfffIuqvI3TsbhxUhx1tjX+Yii662Itq00dybkGd4g0SbSSSa1f
         b6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=bfUA2dfTdnWy7owueak2d2BBuP+5ggo63PNQbXg9bzE=;
        b=dgQPIqTvGQ5K5n2sP/DpJGp21iA08Rg45qWrvn1QgC0/6iahZ1LyIL3YFvs18mr+l0
         SEHCNEd3Bl4oQrcFHVB4yk9C1ZX0MY5ljDE8+xl1Gf1bxYmQFgtvKFYf9ksCm2tJhY1r
         Oj2EFdiMjOjiQG1+P8t5Y/GbXIIW06YOBam51B6HLNaYQlvoeZfXZZ17jRT5Q422n5ic
         beCmjOXsiYDlXYX87xQmFXFAyrra2EmxGi1o9rsM2o6Qd5Xog7Zx+72kMpP4Xac+dKNG
         uNhjA6xNg+nfRUneFYQBS+uuxQJy1lru6J+pBNslJQMI2Frp3MDlXOEa6gIIiemw/4+2
         DCsw==
X-Gm-Message-State: AOAM530x2Fsm0sMsgcRvCIfguE2ldtJfkxD56bsSd8D5jb3GwlMNDoDc
        cfkuVF+RrklMwoxQOG+WSpp/dA==
X-Google-Smtp-Source: ABdhPJyjI9cyeTEe16lm05RIWz7l5Ip/lo0xiq9kg2hmD9U2pcCuCbC+y2IW1odl9UFS7tYUkaKhlA==
X-Received: by 2002:a17:90b:1209:: with SMTP id gl9mr809952pjb.148.1628485835061;
        Sun, 08 Aug 2021 22:10:35 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id e35sm20420219pjk.28.2021.08.08.22.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Aug 2021 22:10:34 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 0/2] Add Sony Tulip Truly NT35521 panel support
Date:   Mon,  9 Aug 2021 13:10:06 +0800
Message-Id: <20210809051008.6172-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It adds driver for Sony Tulip Truly NT35521 5.24" 1280x720 DSI panel,
which can be found on Sony Xperia M4 Aqua phone.

Changes for v2:
- Add `port` node into bindings.
- Re-create the driver using linux-mdss-dsi-panel-driver-generator[1].
- Rename the driver to include Sony Tulip.
- Model 5V control GPIOs with regulators.
- Rename Backlight GPIO as "backlight-gpios".

[1] https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator

Shawn Guo (2):
  dt-bindings: display: Add Sony Tulip Truly NT35521 panel support
  drm/panel: Add Sony Tulip Truly NT35521 driver

 .../panel/sony,tulip-truly-nt35521.yaml       |  72 +++
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../panel/panel-sony-tulip-truly-nt35521.c    | 552 ++++++++++++++++++
 4 files changed, 635 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sony,tulip-truly-nt35521.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c

-- 
2.17.1

