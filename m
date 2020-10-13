Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86C8428C9AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Oct 2020 10:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390559AbgJMIB2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 04:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390556AbgJMIB1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 04:01:27 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86BEBC0613D7
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2020 01:01:27 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id y14so16214346pfp.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2020 01:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kobb2e1tlICZgkQS/oGVtY54aK5l9kHJ2QZVBKXSGxE=;
        b=HvRYgaNc6roOxiu+jeMNUaEvL5jd+9FuF8oUyy0Qut6ZicDzpSKH3rWKcSKeygEjEn
         yb0slmgyi3zc3tFthbRId+EYOgfZZFgKsSyDAhoLqFIbgcMmoSRBIMdI4D74fUepQXuR
         VahaQpxlXCfl8FLlEz1J7risjgxjMtLieTEX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kobb2e1tlICZgkQS/oGVtY54aK5l9kHJ2QZVBKXSGxE=;
        b=eukLtGOJBDiizajCneNc5D6QIFCvDKulbBgYWdUdM/tqoBrvCSvXdnEe5/t5pZfKjc
         Y5378kaNsjCE7y/7+C5SGIM+hGEnF2vVXIlUHD5cLzCKojS8CTGiEsiqqefBgBFs34El
         0nATWD73SBPceNKSr6grY8CI52+1uQvlaQ4D2Sfe4NNHHnpTbF65u3kVrjr1LPt8ET1x
         Ddx7gS2BvRfwlwBArPCaCk4L66vxLAooSSq8JXQ6yvSl3zHCOhUmzHvzJ7qOYzhGTEdP
         lZpCHyUILM+RUzDH6Nj9hZXWJ4KU8FSO6C3iidtNykPaVFnssITwFY74SPWFzrsxM6Uj
         8Ilw==
X-Gm-Message-State: AOAM532TGWAI6RczZzi9/dAk730PG/z3L2dx9ed/ZKosoHquwIKCAWH1
        oKyHLHa1EJHDQhKX+ICqTEVb5A==
X-Google-Smtp-Source: ABdhPJxP6pxFhLR56ZtuQO0U0FlPcp8Gjo0ZGCypcR6tvA2syik1UwDJOMcOKfmi863CHLyQwReK/Q==
X-Received: by 2002:a62:2a94:0:b029:155:3225:6fd0 with SMTP id q142-20020a622a940000b029015532256fd0mr25008896pfq.64.1602576086840;
        Tue, 13 Oct 2020 01:01:26 -0700 (PDT)
Received: from alex-desktop.lan (c-73-63-253-164.hsd1.ca.comcast.net. [73.63.253.164])
        by smtp.gmail.com with ESMTPSA id y124sm14956924pfy.28.2020.10.13.01.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 01:01:26 -0700 (PDT)
From:   Alexandru Stan <amstan@chromium.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Alexandru Stan <amstan@chromium.org>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v2 0/3] PWM backlight interpolation adjustments
Date:   Tue, 13 Oct 2020 01:01:00 -0700
Message-Id: <20201013080103.410133-1-amstan@chromium.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I was trying to adjust the brightness-levels for the trogdor boards:
https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2291209
Like on a lot of panels, trogdor's low end needs to be cropped,
and now that we have the interpolation stuff I wanted to make use of it
and bake in even the curve that's customary to have on chromebooks.

I found the current behavior of the pwm_bl driver a little unintuitive
and non-linear. See patch 1 for a suggested fix for this.

A few veyron dts files were relying on this (perhaps weird) behavior.
Those devices also want a minimum brightness like trogdor, so changed
them to use the new way.

Finally, given that trogdor's dts is part of linux-next now, add the
brightness-levels to it, since that's the original reason I was looking at
this.

Changes in v2:
- Fixed type promotion in the driver
- Removed "backlight: pwm_bl: Artificially add 0% during interpolation",
userspace works just fine without it because it already knows how to use
bl_power for turning off the display.
- Added brightness-levels to trogdor as well, now the dts is upstream.


Alexandru Stan (3):
  backlight: pwm_bl: Fix interpolation
  ARM: dts: rockchip: veyron: Remove 0 point from brightness-levels
  arm64: dts: qcom: trogdor: Add brightness-levels

 arch/arm/boot/dts/rk3288-veyron-jaq.dts      |  2 +-
 arch/arm/boot/dts/rk3288-veyron-minnie.dts   |  2 +-
 arch/arm/boot/dts/rk3288-veyron-tiger.dts    |  2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi |  9 +++
 drivers/video/backlight/pwm_bl.c             | 70 +++++++++-----------
 5 files changed, 43 insertions(+), 42 deletions(-)

-- 
2.28.0

