Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AFB47681D4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jul 2023 22:43:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbjG2UnO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jul 2023 16:43:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjG2UnN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jul 2023 16:43:13 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 668A3D7
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 13:43:11 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fe11652b64so5481393e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 13:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690663389; x=1691268189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jDXmcqoxmADeVwH/tIKhJpnlMjbMtWv3iZzEIatWUZw=;
        b=HkMSKw6/PCLIipl8FiTm78l3ypb7hctz3Xfn/gOmLxJ/fYuTukfw1ejsn/q0zK9UsT
         SH116GxJEl/Q3dsvRSUzTfiDC/m3WqJJ3uXeM43aHy2kibo+wXbS5rzAV+OUEeggBXAb
         NoLaD9pQT/8b09UhE7o3an3Z2kFRUna54v5EhMcUJHgw7kNzD2v0NRvJyaP1r9BjbDvx
         nhd1YOfm7+SDwoa6D+RNDhefq9NwGHjXs0YcGumW1kjNN+gUq4CRXEZ5+jshOemMmtp8
         9+yr+9hi3uY1prDiJaMnNe6FofthZLm+kJmx4+Wkcd68hdrIwL/92SRyPp2qmqzMuwu8
         UxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690663389; x=1691268189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jDXmcqoxmADeVwH/tIKhJpnlMjbMtWv3iZzEIatWUZw=;
        b=PHtHxaTySR1E6LUwvUCUw2NU7e7d4vYcYOy7ZUataRkmI2XPxSBVZmE2a0c+lMBlPA
         wGBU7lQzDHxBJRTmGF1rhTn9Ko9XOQunZ4CaeVPNF1cBizAEzHGCgsgnrKLberyjHEdT
         EEcyMORxW9ve9Pa3/b+DerRax3x/J8eJ3BnibSYZOZ1U3eCRzyry9aDG+Di5su/kAQY1
         4scfMgN/vTEVVw0+pCFtZMLQQmfKly9EiTDghQXr7Vp1S38zBnsvt5EW6ZZsuRhHlWpk
         kKebm0EyzG8oUqGv1fjLpac+sbPsWgbKv+CJJ3deNNYDmX77zqQ8MEApPyYoOhnnO1OM
         YW9Q==
X-Gm-Message-State: ABy/qLaJQ87++REjjJyyiUwwwJ44R3rr2tmHjw0Xl9oL+hrvH9kHhSXf
        VH3Td4N1YpHbaiq76034enpOxTa/g8vHAfrQPw4=
X-Google-Smtp-Source: APBJJlEG7RXwuvRy6gHyJpQWKQOXsq5ExDxgmuPzEO/9ZMBjN/9HwLfl4RJQVaeeQPngeNEsL7Yydg==
X-Received: by 2002:a2e:b0d1:0:b0:2b9:4ac9:6071 with SMTP id g17-20020a2eb0d1000000b002b94ac96071mr3844531ljl.10.1690663389536;
        Sat, 29 Jul 2023 13:43:09 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v20-20020a2e9614000000b002b9af8422a8sm1705177ljh.130.2023.07.29.13.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 13:43:08 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org
Subject: [PATCH 0/3] drm/display: simplify support for transparent DRM bridges
Date:   Sat, 29 Jul 2023 23:43:04 +0300
Message-Id: <20230729204307.268587-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Supporting DP/USB-C can result in a chain of several transparent
bridges (PHY, redrivers, mux, etc). This results in drivers having
similar boilerplate code for such bridges.

Next, these drivers are susceptible to -EPROBE_DEFER loops: the next
bridge can either be probed from the bridge->attach callback, when it is
too late to return -EPROBE_DEFER, or from the probe() callback, when the
next bridge might not yet be available, because it depends on the
resources provided by the probing device.

Last, but not least, this results in the the internal knowledge of DRM
subsystem slowly diffusing into other subsystems, like PHY or USB/TYPEC.

To solve all these issues, define a separate DRM helper, which creates
separate aux device just for the bridge. During probe such aux device
doesn't result in the EPROBE_DEFER loops. Instead it allows the device
drivers to probe properly, according to the actual resource
dependencies. The bridge auxdevs are then probed when the next bridge
becomes available, sparing drivers from drm_bridge_attach() returning
-EPROBE_DEFER.

Proposed merge strategy: immutable branch with the drm commit, which is
then merged into PHY and USB subsystems together with the corresponding
patch.

Dmitry Baryshkov (3):
  drm/display: add transparent bridge helper
  phy: qcom: qmp-combo: switch to DRM_SIMPLE_BRIDGE
  usb: typec: nb7vpq904m: switch to DRM_SIMPLE_BRIDGE

 drivers/gpu/drm/display/Kconfig             |   9 ++
 drivers/gpu/drm/display/Makefile            |   2 +
 drivers/gpu/drm/display/drm_simple_bridge.c | 120 ++++++++++++++++++++
 drivers/phy/qualcomm/Kconfig                |   3 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c   |  44 +------
 drivers/usb/typec/mux/Kconfig               |   3 +-
 drivers/usb/typec/mux/nb7vpq904m.c          |  44 +------
 include/drm/display/drm_simple_bridge.h     |  19 ++++
 8 files changed, 156 insertions(+), 88 deletions(-)
 create mode 100644 drivers/gpu/drm/display/drm_simple_bridge.c
 create mode 100644 include/drm/display/drm_simple_bridge.h

-- 
2.39.2

