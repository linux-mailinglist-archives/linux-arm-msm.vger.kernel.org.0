Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4899321C078
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2020 01:03:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726693AbgGJXCp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 19:02:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726624AbgGJXCp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 19:02:45 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36CFAC08C5DD
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 16:02:45 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id ls15so3227747pjb.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 16:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lCcFDIfWLkWWzSa31vXd7WJo8Tj5ziQlVQDdDR7C5oY=;
        b=eSk70hMUPgz/3k9+jsUUcyV/2ls1oSHGujFrad521MpLwNTFi3jkIVTuxh/psq9MFB
         gSIBJUNMurjt6JR179DwAKtpBcb2MiH1TvrZsLOlNzPYmhQrjv4tVtyc47GV5lmLb02U
         Y1r1UkBY004HeQ7oKUtQr8gSgIwbtrc7TluJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lCcFDIfWLkWWzSa31vXd7WJo8Tj5ziQlVQDdDR7C5oY=;
        b=LWLmr5LvSSdva392k4wDoqV4tCcV4oG+aXJQg7mGUIJ1BQfAkzvJoNdYCFwf1UIgqd
         f2nO9FZeAOsAN4Dd/ucEPPN1W2cucWCLz2M5Y9iobnY+hFVGRHa+hbAz5Mt1ZLF6obrX
         cfstM8OcyIBPL/bM3QtGNi+gn4nB2X7JSFl2GP34MrayMfCE478gEQfj/k0V3RZR2tIK
         C1Re62OQQqTLkxCaSGCR4K5ToffNHqCbrp9mfeqd3VVJEv+WP6a79rdcT1BZPdvNq0A3
         5VTwU1ITEBfnNPPPkDWI7shnNL9xj1GnKAmoNyRRkVHsYNl0l33OML3sI6QKgq5iY/L6
         +Vwg==
X-Gm-Message-State: AOAM531RcwotZx+P6ynBSoy6dFeZ5j+roPqyNHlXsb12DKEQxxo9JdTl
        /rzIobfpk068N18/ecYLPMmphQ==
X-Google-Smtp-Source: ABdhPJz0vohhKOdR4S48Go6SbBkYwUYpvNGQCHrL60amRJ3jBZ6fmwC9ItCPgsI2PgpcjlqG0gq6pA==
X-Received: by 2002:a17:902:bb82:: with SMTP id m2mr4020800pls.61.1594422164622;
        Fri, 10 Jul 2020 16:02:44 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id my9sm7266836pjb.44.2020.07.10.16.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 16:02:44 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] drm/msm: Avoid possible infinite probe deferral and speed booting
Date:   Fri, 10 Jul 2020 16:02:15 -0700
Message-Id: <20200710230224.2265647-1-dianders@chromium.org>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I found that if I ever had a little mistake in my kernel config,
or device tree, or graphics driver that my system would sit in a loop
at bootup trying again and again and again.  An example log was:

  msm ae00000.mdss: bound ae01000.mdp (ops 0xffffffe596e951f8)
  msm_dsi ae94000.dsi: ae94000.dsi supply gdsc not found, using dummy regulator
  msm_dsi_manager_register: failed to register mipi dsi host for DSI 0
  [drm:ti_sn_bridge_probe] *ERROR* could not find any panel node
  ...

I finally tracked it down where this was happening:
  - msm_pdev_probe() is called.
  - msm_pdev_probe() registers drivers.  Registering drivers kicks
    off processing of probe deferrals.
  - component_master_add_with_match() could return -EPROBE_DEFER.
    making msm_pdev_probe() return -EPROBE_DEFER.
  - When msm_pdev_probe() returned the processing of probe deferrals
    happens.
  - Loop back to the start.

It looks like we can fix this by marking "mdss" as a "simple-bus".
I have no idea if people consider this the right thing to do or a
hack.  Hopefully it's the right thing to do.  :-)

Once I do this I notice that my boot gets marginally faster (you
don't need to probe the sub devices over and over) and also if I
have a problem it doesn't loop forever (on my system it still
gets upset about some stuck clocks in that case, but at least I
can boot up).

Unless someone hates this, I'd expect:
- Get Rob H to say that the bindings are OK (if they are) and yell
  that these really need to be converted to yaml (they do).
- Get Sean or Rob C to land the bindings and driver patch.
- Get Andy or Bjorn to land the dts bits.

NOTES:
- The first patch could land either way.  It's just a cleanup.
- I tried to split the dts files into separate patches to ease
  backporting if desired.  Also because I can't actually test most
  of this hardware myself.


Douglas Anderson (9):
  drm/msm: Use the devm variant of of_platform_populate()
  dt-bindings: msm/dpu: Add simple-bus to dpu bindings
  dt-bindings: msm/mdp5: Add simple-bus to dpu bindings
  drm/msm: Avoid manually populating our children if "simple-bus" is
    there
  arm64: dts: qcom: sc7180: Add "simple-bus" to our mdss node
  arm64: dts: qcom: sdm845: Add "simple-bus" to our mdss node
  arm64: dts: qcom: msm8916: Add "simple-bus" to our mdss node
  arm64: dts: qcom: msm8996: Add "simple-bus" to our mdss node
  ARM: dts: qcom: msm8974: Add "simple-bus" to our mdss node

 .../devicetree/bindings/display/msm/dpu.txt   |  4 ++-
 .../devicetree/bindings/display/msm/mdp5.txt  |  2 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi           |  2 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |  2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  2 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |  2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  2 +-
 drivers/gpu/drm/msm/msm_drv.c                 | 34 ++++++++-----------
 8 files changed, 24 insertions(+), 26 deletions(-)

-- 
2.27.0.383.g050319c2ae-goog

