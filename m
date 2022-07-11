Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 072E156FF9C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 12:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229654AbiGKK7v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 06:59:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbiGKK7i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 06:59:38 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33F056D9F2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 03:04:35 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id w17so4031262ljh.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 03:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3hj13ZiqObkaOLcE6w4x7CF884wdDv2XU3xp3e5G9fI=;
        b=NgzvOqIKxrVJxaa2RzduvweIyjbPQgBTVmvuuj3+0fexuOz0aEYqY2Djy2qGE2/KR4
         rDT5+ujcm8qnaoC57bJvASmSclvRRaO7HPrN9C9mp15RAY7Ob2idWcyMxmyOQ//jhb+q
         MsDvr0/PhFD7zdHXvXuZWKuTJHt1jhkf3dJg31b6pgYLbf8wGabplR98rWzoZJQw6DwG
         G277Lg72mOdBeJ8B9ojOxX97n7jd07UatZqOwft0u1zxjltY4fM3QhnIhXnX6b8DPYJ3
         2v3/lUPvYpb3SMvOgdqCnyJ4bifnhJ+QDNzt4Kr+03sKAOXXGxssiWAS1QUdgGIltec3
         m6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3hj13ZiqObkaOLcE6w4x7CF884wdDv2XU3xp3e5G9fI=;
        b=Ue/PPuPSn4owHxaAqXjLTpJ2QIYPfjaZ5kqRsyQlrSWnI5T/RQOSrpo7XjfC1guYxo
         q+sPZGWEwPD0nwhitSDKCU0Y9E+7UbemOAMsvEOLVEHjcEsYHG6D4oCNhUc2Ryi+9zyJ
         CmG5IqBiXAj8nRP2avQKz91KbawBvevrpSngk3aprN1fuOhkRd8Ag9godTqIJ1jbKm0R
         kOk1CK/omC8XfjEvrA22Y99xk3A4iihaCOM79FHs7Yy4mGqACcC2DX9TA1I0770l5Omj
         cvwbl+/CfKExHcYT3jArHztF2ksNxXNziTacOtUhJoYM1M0J+HXzcMfhgl5Ae7HQ5Uw2
         7rQw==
X-Gm-Message-State: AJIora/dfBCWA6l91VhxHzGwDK1Kl4wgc6NttP9GR3M+J+NxXoJLDHWq
        NOouCiz9wDdomVZOl7JTijTR9w==
X-Google-Smtp-Source: AGRyM1s47svy/ETNMOOakiUtI0KzdReepltH2PaGmccM97MBg1UxHp2hlAdAppUtyrVWlCOgkGZxTA==
X-Received: by 2002:a2e:a7c7:0:b0:25b:b72d:aa3c with SMTP id x7-20020a2ea7c7000000b0025bb72daa3cmr9621303ljp.318.1657533873552;
        Mon, 11 Jul 2022 03:04:33 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o11-20020ac24e8b000000b0047faab456cesm1442882lfr.237.2022.07.11.03.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 03:04:33 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 0/2] drm/msm: remove struct msm_display_dsc_config
Date:   Mon, 11 Jul 2022 13:04:30 +0300
Message-Id: <20220711100432.455268-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The struct msm_display_dsc_config contains just a single member, a
pointer to struct drm_dsc_config. Use the later one directly instead of
wrapping it in the additional struct.

Dmitry Baryshkov (2):
  drm/msm/dpu: use drm_dsc_config instead of msm_display_dsc_config
  drm/msm/dsi: use drm_dsc_config instead of msm_display_dsc_config

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  25 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c  |  74 ++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h  |   4 +-
 drivers/gpu/drm/msm/dsi/dsi.c               |   2 +-
 drivers/gpu/drm/msm/dsi/dsi.h               |   2 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c          | 157 +++++++++-----------
 drivers/gpu/drm/msm/msm_drv.h               |   9 +-
 8 files changed, 131 insertions(+), 144 deletions(-)

-- 
2.35.1

