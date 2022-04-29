Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA0C3515400
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 20:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380038AbiD2SzV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 14:55:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356733AbiD2SzV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 14:55:21 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C95BC3E0E
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 11:52:01 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id k12so15573038lfr.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 11:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xwez25fKOJIvbl7FDqYv3cgN984+GGk1naedmnAxP4Y=;
        b=f6UQK3n7miUzxs2paCC6ywUzmEX+m7QGx0RlW8FVo/fkmsFewBjKlBMwNCesVufZuu
         4RbgPVHjkZP2+5rOxual28+DY3ujiTSbRTLt9LkUKLxJKMKlHF6fWTiS3gFjBE/uk7od
         CfVCFSm45qg11pesASMxdEnXqyQ2QSzvGtq10iuoBCe11ykoMJmTIrWeQ08yn+LG3Eq0
         qgev94VxC+Kabu3PrpwRpR3SNzjjz5JC7hVb7mzE6LG+wtYG0enwP/FrpwO/1IZcCgsk
         61t5FYvPPEQjhMDWLAh76uFYRJ1Wy6KtIdrZtZ0njK3jSWMY7MvfsGfEhhlYCUQjZB2B
         aD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xwez25fKOJIvbl7FDqYv3cgN984+GGk1naedmnAxP4Y=;
        b=Bw7RCQ16lRlmtejzpMf5k2dUB8kamRqi41Un4gGx76tW30G3zbwod46sSsFVq/HLlt
         kQvmZsH4zr0KamNIHFLurhUfxl5NTL+hwVhwloCeqs2tOZZIfQ8ZMTS9Ylp5bT0qoJsz
         PsPgSXnrFSW4XuEg2em7mrpNpDuiEDPmOqh7pF3Kkf71BpQ5t9GDjZq+Cc82hsekJllK
         T2sKUfLWUZfJrGTK3arY8E7tepJVCZH1sgqVZ9XUtz/0a6gUWM/bLKNYXw3Hgfg24n5o
         hR9uwYrQRopcKhTGBgtVz80C0j4+aG1jXSwe2PisD2LAAglCyPia5O32lwTmL+unssNW
         Uiww==
X-Gm-Message-State: AOAM530pZbz7N5WEc5wXKgbzmtqFa0FdZJlJscLlM8PvEGW+eo3yZlka
        6gZIPJ6/ND2+aLN3IQNpeSISfw==
X-Google-Smtp-Source: ABdhPJyOpcUR4T0Pwv1R1szusK+QmnoIsr3FyUCxNx60L0+9tc1KiURMI8qpfG2pF8k5oYd/gJbjjQ==
X-Received: by 2002:a05:6512:6cb:b0:471:ce8a:cfaf with SMTP id u11-20020a05651206cb00b00471ce8acfafmr404904lff.635.1651258319965;
        Fri, 29 Apr 2022 11:51:59 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z25-20020a19e219000000b00472230888a5sm295313lfg.121.2022.04.29.11.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 11:51:59 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
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
Subject: [PATCH v1 0/7] drm/bridge_connector: perform HPD enablement automatically
Date:   Fri, 29 Apr 2022 21:51:50 +0300
Message-Id: <20220429185157.3673633-1-dmitry.baryshkov@linaro.org>
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

Dmitry Baryshkov (7):
  drm/poll-helper: merge drm_kms_helper_poll_disable() and _fini()
  drm/probe-helper: enable and disable HPD on connectors
  drm/bridge_connector: rely on drm_kms_helper_poll_* for HPD enablement
  drm/imx/dcss: stop using drm_bridge_connector_en/disable_hpd()
  drm/msm/hdmi: stop using drm_bridge_connector_en/disable_hpd()
  drm/omap: stop using drm_bridge_connector_en/disable_hpd()
  drm/bridge_connector: drop drm_bridge_connector_en/disable_hpd()

 drivers/gpu/drm/drm_bridge_connector.c   | 23 +++----------
 drivers/gpu/drm/drm_probe_helper.c       | 40 ++++++++++++++++++-----
 drivers/gpu/drm/imx/dcss/dcss-dev.c      |  4 ---
 drivers/gpu/drm/imx/dcss/dcss-kms.c      |  4 ---
 drivers/gpu/drm/msm/hdmi/hdmi.c          |  2 --
 drivers/gpu/drm/omapdrm/omap_drv.c       | 41 ------------------------
 include/drm/drm_bridge_connector.h       |  2 --
 include/drm/drm_modeset_helper_vtables.h | 22 +++++++++++++
 8 files changed, 58 insertions(+), 80 deletions(-)

-- 
2.35.1

