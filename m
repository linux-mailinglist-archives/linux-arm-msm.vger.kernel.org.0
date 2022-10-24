Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D36CE60B3E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Oct 2022 19:20:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbiJXRUb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Oct 2022 13:20:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232458AbiJXRUM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Oct 2022 13:20:12 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CF426E2E0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 08:55:03 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id y69so13430933ede.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 08:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4iRQ1ZLI8K+KKo3Mi3lCacL/2gYfLmhjW+eZ+G5VxR0=;
        b=DK03fHAgU4BsXGUew2FzyG3+wVE1aU4jA6ElvQnlho0LEO32GQFcBY4dd/LkCacBJ2
         jPIwbDMb2KnH0lLk1oaf7f2CmWkfUlIO1bnPfDHSgSmzMrI8sNmCR7B37cRbVo3Xb0qW
         Dk4xPSNWnfO6MqLUqU0BwiV5QT7qiki/jvUIMYxU33HgObQCtr5I/qWByuNiyiQf7wyv
         y0jFQqxx37K5dKOOaXLzRfVS5Uk5IOWF7L/jw3uXSTx5iFH2VfQzEKNAZHjY9kmLDE4E
         LaHw9E2HVZl2VkJ5z3LuMkaH3FxatPfoF70MaFt456vIuB3oCBztawgsnK/cu0BcbnSj
         EE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4iRQ1ZLI8K+KKo3Mi3lCacL/2gYfLmhjW+eZ+G5VxR0=;
        b=RUWfQZ20J4g0vzZuARpSgaV7hW8zi5XgKFaBwfPZxzCu9bIzzxnjJCrDM4iLk0oUsa
         XzIg0QK13sGUNkxB1G6NxDHjHN4Zd6Hq+MF5fyPd3N8ZoEsn3MBxWHBhj+1XnvaVfUWl
         CGEPQ6Z3U2C559KqXM67vUm96dpLhTUl0sxdeZMZvshJje3NUA7lfn0WTHoxDllJfgsf
         FEIAdxwHl62GjbXSGnE8zJIyMj9CGPgkdNPMlHVBhS6ubXJ98EfvQejGFDDbQTmBz6yb
         mYSDFQzBu77fqf8D4qAPypmrq32pWcQvlAHrNiC/mzqOpRF+arlLRJYtAASoFW6ialIu
         3f/g==
X-Gm-Message-State: ACrzQf2jORdTfgI5YS3Ecop5pEGofv3g/mYfNulYrBoZnVZDhMZWL5x4
        JRjl3YWmkq7yAIIj6M0rli9COopkQZVoTC2I
X-Google-Smtp-Source: AMsMyM6aZgyFcF24FEeW+Du1bHiLYldBNuRLnhbLGjWtlua2WDhhdBQOeIt39dXfHwX+IO0gs5LU4w==
X-Received: by 2002:a05:651c:169a:b0:277:2ee:5e77 with SMTP id bd26-20020a05651c169a00b0027702ee5e77mr4629293ljb.455.1666625968011;
        Mon, 24 Oct 2022 08:39:28 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f23-20020a19ae17000000b00497b198987bsm452181lfc.26.2022.10.24.08.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 08:39:27 -0700 (PDT)
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
Subject: [PATCH v2 0/7] drm/bridge_connector: perform HPD enablement automatically
Date:   Mon, 24 Oct 2022 18:39:19 +0300
Message-Id: <20221024153926.3222225-1-dmitry.baryshkov@linaro.org>
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

