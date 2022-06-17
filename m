Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB6215500D1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jun 2022 01:33:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381101AbiFQXdh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 19:33:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230296AbiFQXdd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 19:33:33 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BE5D6620B
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 16:33:32 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id e17so6190801lfq.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 16:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CaP5bgS0QD73xPUoM1uM1kXmd5Vk1wJNrJjpQLUJ/28=;
        b=pjZKStGo7TD50nyBf0aDQm+TLMAtaE8Z982ngVCmsp7x02CTDkRb5uUswFYGoCB2+I
         ggD5aNuf2pxgFZj5GMD3r9wXwnpoOP2E01nuX2az5tN4rBnz+c1DRxr+Vjgg0E5Vzxf9
         YjqEN2wJyYqTBdBJ2JYVEBk7tt+SG4nMRy6jcTDY65n6UPZEZlnrIKFBUnL6LFjamajn
         Kk+ZCFFBSVSM1ijq6tgRSLEd1eQT1eRWwberNJ/CIKdoBx8hqMP+e+9I1oc7U369+TJ4
         +5yxrmVxydPuKkopdyGKNZd++DF44xWGqyNSs7jg6SnCdKcAHThHvyv92C3TYpRFlv1v
         qGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CaP5bgS0QD73xPUoM1uM1kXmd5Vk1wJNrJjpQLUJ/28=;
        b=BNSqbBxaC0cl91ZJlOzUacWJTWxfHbVp+yUvljoTY6TaOLjCWUml+NlzeTWhyR1CHb
         B+spPondVEzoLcxGZMoByvgC/yzBgdHHNCsvndOYrGIfqcC+XH8dMFQAzs2Spwdh5fBB
         FeKOCWhVXpUC9TTWNw/wjIDJdH84BRmBtLa39MHsLl/hhtW8L8c4iSkwu02FHj/VIIxx
         uTzcy3gii2zCJkforV8tFEBekJ2VuWaFIveWekmsXd4dXMmfr96jEkW8kBU2aQBj1FQJ
         QVCCmsoDPta2M0/4LeaBV8xSFhEn05Ez1CZwD8ciba6JPMCkidduhQ+hJhlXQCFa+v9u
         R4PA==
X-Gm-Message-State: AJIora9B2fTvT6qIdtWa/cW40MH4r5TQYnQZWJ3q7u/dKoUx1LtzTUvy
        tZ9Z8ELh7nJBCmiv9KWVWg6VWw==
X-Google-Smtp-Source: AGRyM1vUSRm12vj+FNKm2kl9iMOQcTSrqSSXRfdeNAZWPdv7BC2b+s2spIDjm3d0YYYfv7ys131gzQ==
X-Received: by 2002:ac2:5150:0:b0:479:119d:5ba6 with SMTP id q16-20020ac25150000000b00479119d5ba6mr6863644lfd.507.1655508810773;
        Fri, 17 Jun 2022 16:33:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b2-20020a056512060200b004787d3cbc67sm800138lfe.219.2022.06.17.16.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 16:33:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v6 0/4] drm/msm: convet to drm_crtc_handle_vblank()
Date:   Sat, 18 Jun 2022 02:33:24 +0300
Message-Id: <20220617233328.1143665-1-dmitry.baryshkov@linaro.org>
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

Changes since v5:
 - Clean up the event_thread->worker in case of an error to fix possible
   oops in msm_drm_uninit().

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


Dmitry Baryshkov (4):
  drm/msm: clean event_thread->worker in case of an error
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

