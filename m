Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29E277C5F43
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Oct 2023 23:47:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233552AbjJKVrM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Oct 2023 17:47:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233451AbjJKVrL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Oct 2023 17:47:11 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 378939E
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 14:47:08 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-505748580ceso433294e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 14:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697060826; x=1697665626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1jda2D1FroH1trufxsMIX87ohZOTaWYuCvDgRQ06mQE=;
        b=Ku2a+B/JfZLq2jhIPWmAPslqdieHCvxoTftQPhBiTBQcJ4DVP7koW4wk+0arMbVHy3
         juObqe/0+QjP9EmNbz841PpgEH/j6PORIesPlW04doQU50JSG7nEKtdC93x1RVDdIcJJ
         oN+spwbh5g3g7gPWD/6ztUokf0SL/+4iCt6t2HF315Gml9dE3xKLT0gkw8h7e3hDPNpD
         /1HPJ1s4TVVh8Zw42SEZxtgz9IngV0nXUVCT4/09hxx270be+pTxNZGdEiwB7fOS3hwQ
         nB65JQ95Ip7atEC1hn7vhR80pVnXtVJxufyzJOcGLskJ76PFqXgBV2LTCZ5hdDMknn+1
         An3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697060826; x=1697665626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1jda2D1FroH1trufxsMIX87ohZOTaWYuCvDgRQ06mQE=;
        b=CsdiqFLlcDQki9PuhmL9SYBMoJfMYT71HlhiZUd7o6Q6WYBhJ2WnUoDtzr7SeEwAxO
         /pm50qs/m2SQhQzNIhPXa5tT9rOKSHxEcGHRPpnMgEL4+YRDSDpyvi6ycFtJdxU1mkHH
         HvNefH4AFWQEjzgSZ8Rw4i6woi9sVrUq/aoPliwvu6IbJdABss4GMqBRahMxRUsXqIDJ
         03cZz2hPM5RWI5ZgfrFGUllCJSZQzFtxON35tjg3mYg1GNoWji32IRvPjC1kUI7qPvlx
         MDwkZnBz0rs8cwKtdLlabjzWVv4cq/idKSRbwd+DBkq/53ZnlJCyH+AvtzWAXI+w9Kwy
         xZlg==
X-Gm-Message-State: AOJu0Yy33iATwbZbUDEyxYeNBGnNk8QL5IzQ8njPH4DTNmVlLWPv4Vtb
        wT+angE94eVV2/ijEYs4JWNZ8Q==
X-Google-Smtp-Source: AGHT+IGoo9DRhumkDzWgM8EBl7tb7r7m6oANYB86B4Ru1+K3Ll/N23FGwa0RmGn40xMWCHI1xB4rUg==
X-Received: by 2002:ac2:550f:0:b0:500:a5af:86a4 with SMTP id j15-20020ac2550f000000b00500a5af86a4mr18430162lfk.43.1697060826330;
        Wed, 11 Oct 2023 14:47:06 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o15-20020a056512050f00b004fbab80ecefsm2452485lfb.145.2023.10.11.14.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 14:47:05 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 0/3] drm/msm: use correct lifetime devices for devm_drm_bridge_add
Date:   Thu, 12 Oct 2023 00:47:02 +0300
Message-Id: <20231011214705.375738-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

While reworking the drm/msm driver to use devm_drm_bridge_add() I didn't
notice that the drm_bridge instances are allocated with the drm_device
used as a lifetime parameter instead of corresponding platform_device.
This mostly works fine, in rare cases of device reprobing resulting in
the oops such as the following:

Call trace:
 of_drm_find_bridge+0x54/0xa4
 drm_of_find_panel_or_bridge+0xb8/0xdc
 devm_drm_of_get_bridge+0x3c/0x8c
 msm_dsi_manager_ext_bridge_init+0x4c/0x19c
 msm_dsi_modeset_init+0x70/0x118
 _dpu_kms_drm_obj_init+0xec/0x6f0
 dpu_kms_hw_init+0x310/0x458
 msm_drm_kms_init+0x84/0x328
 msm_drm_bind+0x230/0x43c
 try_to_bring_up_aggregate_device+0x164/0x1d0
 __component_add+0xa8/0x170
 component_add+0x14/0x20
 dsi_dev_attach+0x20/0x2c
 dsi_host_attach+0x9c/0x144
 devm_mipi_dsi_attach+0x34/0xb4
 lt9611uxc_attach_dsi.isra.0+0x84/0xfc
 lt9611uxc_probe+0x5ac/0x66c
 i2c_device_probe+0x148/0x290
 really_probe+0x148/0x2ac
 __driver_probe_device+0x78/0x12c
 driver_probe_device+0x3c/0x160
 __device_attach_driver+0xb8/0x138
 bus_for_each_drv+0x80/0xdc
 __device_attach+0x9c/0x188
 device_initial_probe+0x14/0x20
 bus_probe_device+0xac/0xb0
 deferred_probe_work_func+0x8c/0xc8
 process_one_work+0x1ec/0x51c
 worker_thread+0x1ec/0x3e4
 kthread+0x120/0x124
 ret_from_fork+0x10/0x20

Dmitry Baryshkov (3):
  drm/msm/dsi: use correct lifetime device for devm_drm_bridge_add
  drm/msm/hdmi: use correct lifetime device for devm_drm_bridge_add
  drm/msm/dp: use correct lifetime device for devm_drm_bridge_add

 drivers/gpu/drm/msm/dp/dp_drm.c        | 2 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c  | 2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.39.2

