Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00B0176C20E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 03:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229909AbjHBBSy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Aug 2023 21:18:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbjHBBSu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Aug 2023 21:18:50 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE3C61FEE
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Aug 2023 18:18:48 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fe0e34f498so9996428e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Aug 2023 18:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690939127; x=1691543927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V+gWA/tO3az5qnPtCpr5Q7+4MvP6fpYV/Vi7gO7EqLw=;
        b=WkuenX1ZTdY/VOYXWxbQJV8Vc00bZbCUdBzSDngguxOoG6ibp25OywDJSSx75jNId8
         jEp4UwttDm1pFZfJzhWp2WIC26nRfduG+Xj1bwckcg87vt1Rv5z+dyqKqMtVMWv/fk1r
         8eCoraLT1t5H4p7VcZUH7mNNXZi5x3qcTSK7qeTzNSBlEae8I15/yGpZW1cKnJQxdXRt
         Cf54hC/ZeMUw2oCwHMmhkZapJFk8YDQr0HSpMrvpR9Uua+ODp+fWyy69iFkIXzWmDZE6
         bqzMpzt1MyzIfu8TXYeFCny+buMiUmGpa+ZU2Ws+bfzwyo0Yvq+KRWYBlzB4F9nuXUXo
         /1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690939127; x=1691543927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V+gWA/tO3az5qnPtCpr5Q7+4MvP6fpYV/Vi7gO7EqLw=;
        b=PxTwzDzTs+1SpboIrbkpAvFSuBZazMYJsAH5zj999Adf36n0mRisxl9T9FaktEtmWn
         +DaWXKN6k7yfzUhKhrCuhUbR+pgNpz7/TEkKuA/3XpxKJcYbjxw7ycF/vhLTquPBRVna
         tANZp1sOEhJACR3FO6GMIIYJeCl25b79aD7qnygV6icDTRNvSKbk6eVVqRzA+GUohBCo
         Ol4VMOo5/GYH+mnh4gHlyTttUSBJDTyqJe+Rp/b2No7YL0UXN+SJOVEsn8UuY47xPo/n
         tJfUf1GNsmrhDH1R31p9D60HWbL4wRHKb+B3mLgwtt+jQGGL4A3IF9JPRUO9aX6ANzkN
         /TRQ==
X-Gm-Message-State: ABy/qLZjLu6z9n8TgrfySenjeLpya0AiuuG1SgpxInInnZnqu3zHUui6
        sar+OcyEsgYCm8oPf3gENt52+g==
X-Google-Smtp-Source: APBJJlGTXU+qU/iB+Qs91qxaj6dsnClWjqfDO9bvss9c5WHdTTrVKMq8s3kynB6XVZ1Gf6nY1uUfuw==
X-Received: by 2002:a19:2d4b:0:b0:4fb:89e3:5ac6 with SMTP id t11-20020a192d4b000000b004fb89e35ac6mr3626211lft.62.1690939126825;
        Tue, 01 Aug 2023 18:18:46 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n14-20020a056512388e00b004faeedbb29dsm2775842lft.64.2023.08.01.18.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 18:18:46 -0700 (PDT)
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
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 0/3] drm/display: simplify support for transparent DRM bridges
Date:   Wed,  2 Aug 2023 04:18:42 +0300
Message-Id: <20230802011845.4176631-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
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

Changes since v2:
 - ifdef'ed bridge->of_node access (LKP)

Changes since v1:
 - Added EXPORT_SYMBOL_GPL / MODULE_LICENSE / etc. to drm_simple_bridge

Dmitry Baryshkov (3):
  drm/display: add transparent bridge helper
  phy: qcom: qmp-combo: switch to DRM_SIMPLE_BRIDGE
  usb: typec: nb7vpq904m: switch to DRM_SIMPLE_BRIDGE

 drivers/gpu/drm/display/Kconfig             |   9 ++
 drivers/gpu/drm/display/Makefile            |   2 +
 drivers/gpu/drm/display/drm_simple_bridge.c | 127 ++++++++++++++++++++
 drivers/phy/qualcomm/Kconfig                |   2 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c   |  44 +------
 drivers/usb/typec/mux/Kconfig               |   2 +-
 drivers/usb/typec/mux/nb7vpq904m.c          |  44 +------
 include/drm/display/drm_simple_bridge.h     |  19 +++
 8 files changed, 163 insertions(+), 86 deletions(-)
 create mode 100644 drivers/gpu/drm/display/drm_simple_bridge.c
 create mode 100644 include/drm/display/drm_simple_bridge.h

-- 
2.39.2

