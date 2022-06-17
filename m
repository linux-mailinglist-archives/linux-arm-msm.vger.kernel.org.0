Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DD1054FC8B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 19:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383250AbiFQRzm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 13:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbiFQRzm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 13:55:42 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 135A84D6A4
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 10:55:41 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id s6so7987018lfo.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 10:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D2/ulgUSDtuTKZUZ07V9o7lsdM5mVgDEWyK0WN4WUGU=;
        b=MWAeruo9ft6VGDTpDJ/JYrC6pGzRDc06xBNkpVSKI1EHGYPeenIj1OxUfEASEvbGuu
         eqjhBrY3gLhlG/c/IzLBPBes3QLEaw6c6oSsBOQLN9W9fL+42W6WCidt6jDvUOCUzLpe
         S5jdY1e4UMcKCcxOo9G6mVTmpcTmWsxvp8F7vD1VQUyvAP4EYzMkpnfKG4o9OewcGBnD
         1sHHX4VgpZwDLNsKJ/IHpToP8pxxMwn2X2jcf1JVFBU247/6KtFpzL415t9awtKm3dLL
         tUpwmDQeiyezaCDsKOIPzHbYPBXbiTTz7jCqyck4BpUksdiD+7FzN69P1L4X6oCDJEx6
         FN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D2/ulgUSDtuTKZUZ07V9o7lsdM5mVgDEWyK0WN4WUGU=;
        b=nhbJGq9A/zk1lKUpBcIx3QAG4hJ4KSKLYNghZxexE34QhTttEvekctGosPvsMBETWO
         DmYYIzIY34nTVm1YkFUxZbS0I41RCkWsfHfXCKw95Ww9qqIlc9pM05fNQoc6vPTDnmZh
         W9yLed7/r/SSVIddIOhjEkdLpF+lVptj3+vQaAjjZ0A4apeAejq9nZXH8yRSoYIDMR1H
         0OiomdBs5SgfZPCJLcXa9Lvqavy96X9RjfrzJmorKgWci9KsokLjxTSmf0y1lPMmCO0h
         E+ispjT4KN7bJlRt1AIeavkvB5/7k4RnLy9IyGzi9MxMaPZpO7/GqYqrju4LhMIYxEZ2
         q4dA==
X-Gm-Message-State: AJIora/MfA7tL79lDac6z/OTjYriJm2JAGrBldQAdlM1sZRYxGTZUuqv
        /NdZcLfQW0ERA/bk2PUrscvHhA==
X-Google-Smtp-Source: AGRyM1vyrP7oq5/XG1m7rG9FImaNjM1DFc5qB2YeMbfXK3KMAkluqm7X0+FD8e/4eiZ/wJG3wSccWA==
X-Received: by 2002:a05:6512:702:b0:479:3bb1:8992 with SMTP id b2-20020a056512070200b004793bb18992mr6150820lfs.361.1655488539469;
        Fri, 17 Jun 2022 10:55:39 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u19-20020a05651220d300b0047968606114sm712747lfr.111.2022.06.17.10.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 10:55:39 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v4 0/3] drm/msm: convet to drm_crtc_handle_vblank()
Date:   Fri, 17 Jun 2022 20:55:35 +0300
Message-Id: <20220617175538.1080351-1-dmitry.baryshkov@linaro.org>
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

