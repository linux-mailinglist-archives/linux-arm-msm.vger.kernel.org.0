Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E6D9509113
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Apr 2022 22:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381910AbiDTUJ3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Apr 2022 16:09:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381909AbiDTUJ2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Apr 2022 16:09:28 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FAFF45AD7
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Apr 2022 13:06:41 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id n126-20020a1c2784000000b0038e8af3e788so1976410wmn.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Apr 2022 13:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=nWM6fd421Z4mKGkR1OIW70pm4ctWscYqXgFoO0lKsdE=;
        b=WCxCuoNchmrc/oA4EswPMRVUrXUqZW5DzagrGczH8EpL1ShlI9Ip0lE+2P3fIR/8A3
         nSZGQha3A+hSniBiMQCMlbyLHwpXrS2x0d+ge86bMgUrr6oX+1HhgNoHXe/w/PU9p4oA
         R/BtqXmIqBn4I65qfZbX1zGjs/SgNLf+gGLNrsS/t9iEWhMKhOaKy3eogScToO68HwBw
         G3NbNRCkLLGFHA7lmLusnIp3P1DBmACX45+MSbJ1zLPzpKtohTM+EGlI8uorwTHH3uFo
         PD0SC+OuHL+qEdbcUs+Wg554dfoRPduXe6y2TWERqZmFsCMyYMM35tlkoJwvYNJcP5jW
         1dpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=nWM6fd421Z4mKGkR1OIW70pm4ctWscYqXgFoO0lKsdE=;
        b=6sxGD5Kzsw+D1BJH7IMGS2ubH8QZojVt8E9dRq+PgTLU70lx2Myj+QiwajiOZXwYFb
         csli3lybjO08yJCkluG0g6csHSsngLAGw1Jy8FLwYqrouoO50YsNS7fpYh9WBPsWSBNZ
         HHwAQEzE5jFqGcGRW5bqQipL3GfoS2tFz7LAih0ocumIu/NJKuuqNDZEyDTcDIzG5Tcm
         o8O6gPV4NaU37l9fo5O4NaxgSxXPIUib9OitQ1//GdiJZNl15ZOWot1LkhH+00DCGTlG
         6WPPebOpukSWJEU+BQuUSpL7vvMhPVF3OO3H8g+2FMIF8O5Wo5nD2xi8NSt/x5FiG95g
         UCWQ==
X-Gm-Message-State: AOAM531rKfz17LQMqODmYznIVnqy9A3GoL0QZyeqYO7crD6yy0XMpX9y
        IXzZLLIU4/rfJlbv8jGMpVLXcpJSUGEa3eCG0r0=
X-Google-Smtp-Source: ABdhPJwa5LiP99fr6eQduCzYo4KsoL4ArGW9pdCWo3BZH9Cuso01h+ojF/xAPij16lY7vWBDIcBCEEykjJktJXqpG4k=
X-Received: by 2002:a05:600c:1f17:b0:392:5c1a:5ed9 with SMTP id
 bd23-20020a05600c1f1700b003925c1a5ed9mr5492570wmb.148.1650485199416; Wed, 20
 Apr 2022 13:06:39 -0700 (PDT)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 20 Apr 2022 13:07:44 -0700
Message-ID: <CAF6AEGtvPo4xD2peAztDMPP2n4utb7d9WQboMFwsba9E8U2rCw@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2022-04-20 for v5.18
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dave & Daniel,

One more fix for v5.18.. actually a revert to fix iommu breakage on
older devices

The following changes since commit 390d645877ffd6dcb55f162d618045b2779217b3:

  drm/msm/gpu: Avoid -Wunused-function with !CONFIG_PM_SLEEP
(2022-04-11 18:35:31 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2022-04-20

for you to fetch changes up to 0371870b96907bf560ecf7dc3fadc238fadf7845:

  drm/msm: Revert "drm/msm: Stop using iommu_present()" (2022-04-19
10:33:07 -0700)

----------------------------------------------------------------
Dmitry Baryshkov (1):
      drm/msm: Revert "drm/msm: Stop using iommu_present()"

 drivers/gpu/drm/msm/msm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
