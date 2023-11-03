Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C29F7E0BFB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Nov 2023 00:10:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230447AbjKCXEV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Nov 2023 19:04:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbjKCXEU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Nov 2023 19:04:20 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB9CCD50
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Nov 2023 16:04:16 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-507a98517f3so3221446e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Nov 2023 16:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699052655; x=1699657455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GXIeW4GsOHRxaU3fctULVZJpGwQnd0E/lSvL3ZRRAIk=;
        b=FKQY3QeQlyhlQ8Up88JWsIj7+PtH4DbqXMHTGglOkyrL+DoF+ChahkYvOPdZwN8/fy
         zpjZIT/zZ+Cix+QdC93ThU7WJZLuNsOJCxOZJA/FJAwCecgOa7y8BeGz2Dj7SpKJedfc
         wCgHGkZvz5uiiknvDECx3gG+MKiAhRgcjzeIvtn2Rf1ENk2TlS/6F9wssFxM7JT70WVy
         XsMoAtPRPDNhP+Ws7z+pFzuwsogqwWV7bZRN18swrBvEHiXr5q8Svndi15df6Oh7uaaP
         4PRAdWhaOz9jb28KnhRNXbAmjmghfAFyWi8NYZ+KAFCwOwxj1SXT93YC1h+0ZZohOCMI
         aegg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699052655; x=1699657455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GXIeW4GsOHRxaU3fctULVZJpGwQnd0E/lSvL3ZRRAIk=;
        b=tO1trxcshIzcGjNms+vdqzqopMeNFnhinsEa6246Nz4wCtoidYspOlQ/V7og/ETwEH
         +5Lw+Uw6cqlb9ehbv6P5dVO8iiBnadY4KdCBbPjJiB075P8IluwTBAL564RzCkYzSOwe
         XQr1pXxxrXm3VCV6Irm6sU2m6dK/OhTe3bAlk8O2tADV2GP0UgU1jLMmjGnJZXNoBZiP
         +PjMD5NhgKyRKzSpPoI50B8JVfJIi3NpX0REznwo+jC9j4mTwAyox3BnVUTUM5iNpI2B
         zt2KzysN1ZKw1+sj6U0cB8JpZnPRrlp6ug3O8OUMxnAhY24a/Zhz7Ti7jAfZjBWf6Mfk
         wydw==
X-Gm-Message-State: AOJu0Yy3d/oNE1LVzbSTHv6yORTVcOa2Nz0UZGfY53rW1F2nB5wPjS+l
        7LJLBf0zkex4NnlRko3EY3PDLQ==
X-Google-Smtp-Source: AGHT+IFoXzOXhXBxDzb1hTvIAcYEh+H5qZuHfzgUAzlorrDsdIJFHrrZhJIyqpoiknvP1IZYHUsBww==
X-Received: by 2002:a05:6512:688:b0:507:9a13:27bd with SMTP id t8-20020a056512068800b005079a1327bdmr22258057lfe.7.1699052655045;
        Fri, 03 Nov 2023 16:04:15 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id s16-20020ac24650000000b00504211d2a7bsm329919lfo.297.2023.11.03.16.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 16:04:14 -0700 (PDT)
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
Subject: [PATCH v6 0/6] drm: simplify support for transparent DRM bridges
Date:   Sat,  4 Nov 2023 01:03:03 +0200
Message-ID: <20231103230414.1483428-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

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

Changes since v5:
 - Removed extra semicolon in !DRM_AUX_HPD_BRIDGE stubs definition.

Changes since v4:
 - Added documentation for new API (Sima)
 - Added generic code to handle "last mile" DP bridges implementing just
   the HPD functionality.
 - Rebased on top of linux-next to be able to drop #ifdef's around
   drm_bridge->of_node

Changes since v3:
 - Moved bridge driver to gpu/drm/bridge (Neil Armstrong)
 - Renamed it to aux-bridge (since there is already a simple_bridge driver)
 - Made CONFIG_OF mandatory for this driver (Neil Armstrong)
 - Added missing kfree and ida_free (Dan Carpenter)

Changes since v2:
 - ifdef'ed bridge->of_node access (LKP)

Changes since v1:
 - Added EXPORT_SYMBOL_GPL / MODULE_LICENSE / etc. to drm_simple_bridge

Dmitry Baryshkov (6):
  drm/bridge: add transparent bridge helper
  phy: qcom: qmp-combo: switch to DRM_AUX_BRIDGE
  usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE
  drm/bridge: implement generic DP HPD bridge
  soc: qcom: pmic-glink: switch to DRM_AUX_HPD_BRIDGE
  usb: typec: qcom-pmic-typec: switch to DRM_AUX_HPD_BRIDGE

 drivers/gpu/drm/bridge/Kconfig                |  17 ++
 drivers/gpu/drm/bridge/Makefile               |   2 +
 drivers/gpu/drm/bridge/aux-bridge.c           | 140 +++++++++++++++
 drivers/gpu/drm/bridge/aux-hpd-bridge.c       | 164 ++++++++++++++++++
 drivers/phy/qualcomm/Kconfig                  |   2 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     |  44 +----
 drivers/soc/qcom/Kconfig                      |   1 +
 drivers/soc/qcom/pmic_glink_altmode.c         |  33 +---
 drivers/usb/typec/mux/Kconfig                 |   2 +-
 drivers/usb/typec/mux/nb7vpq904m.c            |  44 +----
 drivers/usb/typec/tcpm/Kconfig                |   1 +
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c |  41 +----
 include/drm/bridge/aux-bridge.h               |  37 ++++
 13 files changed, 383 insertions(+), 145 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/aux-bridge.c
 create mode 100644 drivers/gpu/drm/bridge/aux-hpd-bridge.c
 create mode 100644 include/drm/bridge/aux-bridge.h

-- 
2.42.0

