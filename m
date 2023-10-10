Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86B117C4541
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Oct 2023 01:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232010AbjJJXKX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Oct 2023 19:10:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbjJJXKW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Oct 2023 19:10:22 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C66B99
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 16:10:21 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c00e1d4c08so80047961fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Oct 2023 16:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696979419; x=1697584219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1PVwEVZvfBSDD5d8UZhpkgKfPZQ+0l26q5U0eEBP3cM=;
        b=F63k6AyKjV1wRJAIPMzTD4AJPpC9PMlSQ4Xq6rqC3va6YweJ8p6MHWKf13JEXdkG3q
         ygoB7iM3E0BZfZ9bp16hc5dkp+wZzZxMyL23V0vnRZM6JktJQPU5/1q9H0r2GMn530RY
         sLjkVcJdIllfZ1g9739XeMP3DGin8ZhzVY1or0VjWJBjbWnkYfTfMAdiQ4luYGfJ4QYA
         e03wJaZkcnzGWNGQyllXj5TJJDv9FP+EjWQ/QOBtRI2VL3lMusQSVerCGOuU8f/DVPEk
         9lc6WWDRNvO/dsn1aj8qIGLjOAgVryrpbOmRKL5rBb1nXrbovBbjhRo1vbRAkOmmwJbn
         d89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696979419; x=1697584219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1PVwEVZvfBSDD5d8UZhpkgKfPZQ+0l26q5U0eEBP3cM=;
        b=Qjg3Rp5CCeOCurKrfj8dikwNVFVNxC12hpkG5T0ZDNEI3IyH7a5gXYT6c2ey2KTwb6
         PTjP+V3S3CaGsPUoNeNbwVInU2Phky956FaFcm1ZiHHvrfYbyt3pt429c5ydXNaT2Yiu
         hrsb4zKOfeFKLYVfIwsDWtErOIaOjJXGpGof7arujjQdDNRGMWkD+BOdI4SkRW9kTpU1
         hr1YgUOdUDofDmGdezLWiMx7FegiR5bCQJ70frdBlOHAqn83dfai2hXzn5LlLhw3J1G8
         aKFojU08/aQeQTNOkrBVFTOS0N8hYAE3boVvEeGRWKTxvRAHBtFcQuYWLOpXtCOjwvIU
         SFig==
X-Gm-Message-State: AOJu0YyAGzSzKXUyoBcziGpS7MG04RJHr2UYbNQWlMXg1V18fR1aIbXL
        mfYjIDQoa4hxVfn20lNwkfXPkw==
X-Google-Smtp-Source: AGHT+IHzC7VAJwHBIwZnsBz9+yJMjFzhwQb9W4iUEnN/3lFIYSrR0mUHG3GMEpkhU798pd11+uJUDw==
X-Received: by 2002:a2e:8816:0:b0:2bc:db99:1775 with SMTP id x22-20020a2e8816000000b002bcdb991775mr16410708ljh.26.1696979419245;
        Tue, 10 Oct 2023 16:10:19 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n8-20020a2e8788000000b002bcdbfe36b9sm2658033lji.111.2023.10.10.16.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 16:10:18 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v4 0/3 RESEND] drm: simplify support for transparent DRM bridges
Date:   Wed, 11 Oct 2023 02:10:15 +0300
Message-Id: <20231010231018.77381-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[Resending since the discussion with Laurent has died with no response
received for more than three weeks]

Supporting DP/USB-C can result in a chain of several transparent
bridges (PHY, redrivers, mux, etc). All attempts to implement DP support
in a different way resulted either in series of hacks or in device tree
not reflecting the actual hardware design. This results in drivers
having similar boilerplate code for such bridges.

Next, these drivers are susceptible to -EPROBE_DEFER loops: the next
bridge can either be probed from the bridge->attach callback, when it is
too late to return -EPROBE_DEFER, or from the probe() callback, when the
next bridge might not yet be available, because it depends on the
resources provided by the probing device. Device links can not fully
solve this problem since there are mutual dependencies between adjancent
devices.

Last, but not least, this results in the the internal knowledge of DRM
subsystem slowly diffusing into other subsystems, like PHY or USB/TYPEC.

To solve all these issues, define a separate DRM helper, which creates
separate aux device just for the bridge. During probe such aux device
doesn't result in the EPROBE_DEFER loops. Instead it allows the device
drivers to probe properly, according to the actual resource
dependencies. The bridge auxdevs are then probed when the next bridge
becomes available, sparing drivers from drm_bridge_attach() returning
-EPROBE_DEFER.

Changes since v3:
 - Moved bridge driver to gpu/drm/bridge (Neil Armstrong)
 - Renamed it to aux-bridge (since there is already a simple_bridge driver)
 - Made CONFIG_OF mandatory for this driver (Neil Armstrong)
 - Added missing kfree and ida_free (Dan Carpenter)

Changes since v2:
 - ifdef'ed bridge->of_node access (LKP)

Changes since v1:
 - Added EXPORT_SYMBOL_GPL / MODULE_LICENSE / etc. to drm_simple_bridge

Dmitry Baryshkov (3):
  drm/bridge: add transparent bridge helper
  phy: qcom: qmp-combo: switch to DRM_AUX_BRIDGE
  usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE

 drivers/gpu/drm/bridge/Kconfig            |   9 ++
 drivers/gpu/drm/bridge/Makefile           |   1 +
 drivers/gpu/drm/bridge/aux-bridge.c       | 132 ++++++++++++++++++++++
 drivers/phy/qualcomm/Kconfig              |   2 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c |  44 +-------
 drivers/usb/typec/mux/Kconfig             |   2 +-
 drivers/usb/typec/mux/nb7vpq904m.c        |  44 +-------
 include/drm/bridge/aux-bridge.h           |  19 ++++
 8 files changed, 167 insertions(+), 86 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/aux-bridge.c
 create mode 100644 include/drm/bridge/aux-bridge.h

-- 
2.39.2

