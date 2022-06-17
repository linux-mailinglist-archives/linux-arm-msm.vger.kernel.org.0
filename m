Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE14E54FD68
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 21:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231890AbiFQTOg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 15:14:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233252AbiFQTOd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 15:14:33 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 899CD527C7
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 12:14:32 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id c2so8331575lfk.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 12:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jb2LzNHs/uQixr8x1n5mvdFFvqrNyRBvkNqvNWM7FA0=;
        b=Gcf9ZBMjFlTkayZYLXWPIyF5eKelbU9iEv+nXXeSqiSo4y6up80jUzSFstdWyRPax+
         rqTE3TnZzX1HPx2OvZrB+gqZuZa55CsmdWjP9BQOGLQH0yuu8Gfip0PWtoH2cCjxCoSY
         M5M/P7EOzYs51h1UZofOa6utoSmXjmY9vaEVEmCW7X0GwMbFBcQZYZBz5iI0fjhPxnyz
         pOTme3AsB7eOiatzeHtRUgWe9fu8d83dYWodUq5nCzsp/aS0z41lkFDltDgdDvTtUgBs
         3hM1E95dNpReUe9jpvHeP7PC1LRcKtmkScTl12Mjg1SfNrWaXTEf3CixKHVn+/UY52mk
         rgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jb2LzNHs/uQixr8x1n5mvdFFvqrNyRBvkNqvNWM7FA0=;
        b=DYB+em0IG06ACY2kNPsqIwA//XaZQvmRco2KBvf1mBwoRce6e/yelu2IIzdY2iXijr
         QEm8VLSjRGmnVrLk7r8Z9e9ev1+grzc+YfrvVEiteBf/nGuADIpfeSnfT+EAh0gxns4B
         u2XgLUKt8wl7ZK76Fq1/OYeAhEFFU1I+wl1Y4Ovfl+u6fBE6jt0VI9WMjH4Bh3hwI4ID
         4GXY1tBsdeOhXXISJYMFj8dXkem4HK1g550i+WqDMmQL/F6vmXlVHu953pWxUuYhiJgU
         tq7xTDmLoznr1ERzbh8NEYiyTixlcmu29yFWdVemnSXe2q3n3Ba55tURgr0jzGn0wtz2
         0n9Q==
X-Gm-Message-State: AJIora9EJCKops5v4qAomNhDxch22yqo7YV8gaxCvx36Kv8wxG3LlZ3o
        uRN0MQcHRzTsOrUKJ5WsRBrc4Q==
X-Google-Smtp-Source: AGRyM1sYkar+S/iJLtfnp1Gq2Pu7zvO8UZFuFUKb+8M0kB+OVn5hr5c0/oIWEg7OnMYmdiWMpk7j1g==
X-Received: by 2002:a05:6512:151d:b0:47d:de8d:f4bd with SMTP id bq29-20020a056512151d00b0047dde8df4bdmr6507816lfb.552.1655493270803;
        Fri, 17 Jun 2022 12:14:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([95.161.222.59])
        by smtp.gmail.com with ESMTPSA id k15-20020a2e920f000000b00253e1833e8bsm639680ljg.117.2022.06.17.12.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 12:14:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v5 0/3] drm/msm: convet to drm_crtc_handle_vblank()
Date:   Fri, 17 Jun 2022 22:14:26 +0300
Message-Id: <20220617191429.1087634-1-dmitry.baryshkov@linaro.org>
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

This patchseries replaces drm_handle_vblank() with
drm_crtc_handle_vblank(). As a bonus result of this conversion it is
possible to drop the stored array of allocated CRTCs and use the core
CRTC iterators.

Changes since v4:
 - Removed the duplicate word 'duplicate' from the last patch'es commit
   message (noticed by Abhinav).

Changes since v3:
 - In msm_drm_init simplify the code by using an interim var for the
   event thread itself rather than just the index (suggested by Abhinav)

Changes since v2;
 - none (sent by mistake)

Changes since v1;
 - fixed uninitialized var access (LTP Robot)

Dmitry Baryshkov (3):
  drm/msm/mdp4: convert to drm_crtc_handle_vblank()
  drm/msm/mdp5: convert to drm_crtc_handle_vblank()
  drm/msm: stop storing the array of CRTCs in struct msm_drm_private

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c |  9 +++--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c |  9 +++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  2 +-
 drivers/gpu/drm/msm/msm_drv.c            | 44 +++++++++++++-----------
 drivers/gpu/drm/msm/msm_drv.h            |  3 +-
 7 files changed, 35 insertions(+), 36 deletions(-)

-- 
2.35.1

