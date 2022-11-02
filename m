Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3ACC9616B91
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 19:07:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbiKBSHJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 14:07:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbiKBSHI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 14:07:08 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E251F2EF65
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 11:07:07 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id b3so4385911lfv.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 11:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yLIMtWdHyNW3QRIFZNBN+J8XsSTDnHkVJCLrk8KchcY=;
        b=qwH2zNxBYLu+b0uws77qn+8LXcKet/YEqzS7diEI6VyVeKRWbuciILL49jYJkCIlzL
         Aq2wNiAyqBHT4iMrSAfzMVqISVig3Knvh4zWHzch1zLY17qpUZvhFWmj2idTKQ9RRxvj
         uUdyp/r+PSnrXYi6P3a8XZXe2utqPwZgDoeScCf7s+d9VcjDVAPZJfU7slbFtss7FK/X
         VtjeJ1+IyW9dOAuPQTSnx51omOSbA/vFofGaFjEA2MyF6G57hX2vdbsVqX8Z/YZ6B3Pi
         nUvBR3ew3k+59PAUHBJgA6yo50VHIe/txckO5EhvS3LyWFpVccmo129Y2qnFEPTSDBFr
         /mOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yLIMtWdHyNW3QRIFZNBN+J8XsSTDnHkVJCLrk8KchcY=;
        b=8FmCNhAQaKtU+vkoFE051zim9n4EqXwWwhUtJQD++FhBlFfg81l+lmwLS+ZtxoGOd/
         Rr5jr/LO0bsSmT0dR++ByXOYGkdBiWIJOXhXxgDsvyT/B7duyWsZ5ztj+nPJqmhFj2Iy
         YbLrhXrbBl3c0x5dMjlssjtrLQjX0/cOoGUu0gbI6iC4OWrDYOdmp4ypf1J3u2NgIHGi
         vl578r4gWlE6VU8bKoR7wQjydQpSG4AB9RrVA0OTkm9cwW8rBtTUpQLNVPf1otn3357H
         uzv9FhaS5dLnMJpa04XaZws4UzX87sBpjM1wUmKhke7/4Qr/FlyMM4WVPmIUgMNRSDfQ
         lBpQ==
X-Gm-Message-State: ACrzQf21eXrQGhiHYdyDeRNmnIgTiavKkIWmZKtt+Gwx3xBIHFFZQtrV
        HjnjP7VaoEdoJgyuQNk68eaY6g==
X-Google-Smtp-Source: AMsMyM7wwesxFBYr08LP2U/os88kLqqaIrstEKZ+JgS2GhZl0yWrmwJ8apx8rhQjVn/l4AyRy5hMrQ==
X-Received: by 2002:a05:6512:c24:b0:4a2:47f0:5ab5 with SMTP id z36-20020a0565120c2400b004a247f05ab5mr10646987lfu.213.1667412426112;
        Wed, 02 Nov 2022 11:07:06 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id r15-20020ac24d0f000000b00485caa0f5dfsm2085232lfi.44.2022.11.02.11.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 11:07:05 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Tomi Valkeinen <tomba@kernel.org>
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH v3 0/7] drm/bridge_connector: perform HPD enablement automatically
Date:   Wed,  2 Nov 2022 21:06:58 +0300
Message-Id: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From all the drivers using drm_bridge_connector only iMX/dcss and OMAP
DRM driver do a proper work of calling
drm_bridge_connector_en/disable_hpd() in right places. Rather than
teaching each and every driver how to properly handle
drm_bridge_connector's HPD, make that automatic.

Add two additional drm_connector helper funcs: enable_hpd() and
disable_hpd(). Make drm_kms_helper_poll_* functions call them (as this
is the time where the drm_bridge_connector's functions are called by the
drivers too).

Changes since v2:
 - Fixed a typo in the commit message of the second patch.

Changes since v1:
 - Rebased on top of v6.1-rc1
 - Removed the drm_bridge_connector_enable_hpd() from
   drm_bridge_connector_init()
 - Removed extra underscore prefix from
   drm_bridge_connector_en/disable_hpd() helpers

Dmitry Baryshkov (7):
  drm/poll-helper: merge drm_kms_helper_poll_disable() and _fini()
  drm/probe-helper: enable and disable HPD on connectors
  drm/bridge_connector: rely on drm_kms_helper_poll_* for HPD enablement
  drm/imx/dcss: stop using drm_bridge_connector_en/disable_hpd()
  drm/msm/hdmi: stop using drm_bridge_connector_en/disable_hpd()
  drm/omap: stop using drm_bridge_connector_en/disable_hpd()
  drm/bridge_connector: drop drm_bridge_connector_en/disable_hpd()

 drivers/gpu/drm/drm_bridge_connector.c   | 27 +++-------------
 drivers/gpu/drm/drm_probe_helper.c       | 40 ++++++++++++++++++-----
 drivers/gpu/drm/imx/dcss/dcss-dev.c      |  4 ---
 drivers/gpu/drm/imx/dcss/dcss-kms.c      |  2 --
 drivers/gpu/drm/msm/hdmi/hdmi.c          |  2 --
 drivers/gpu/drm/omapdrm/omap_drv.c       | 41 ------------------------
 include/drm/drm_bridge_connector.h       |  2 --
 include/drm/drm_modeset_helper_vtables.h | 22 +++++++++++++
 8 files changed, 59 insertions(+), 81 deletions(-)

-- 
2.35.1

