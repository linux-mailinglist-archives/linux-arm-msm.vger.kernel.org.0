Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63FAA5A92E7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Sep 2022 11:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233335AbiIAJPn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Sep 2022 05:15:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234078AbiIAJPe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Sep 2022 05:15:34 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0943A59A6
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Sep 2022 02:15:30 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id p16so5476592lfd.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Sep 2022 02:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=zQcaTdcAmFm7hKWlLt7/xAx+RulymiwoxzvlaJ6Dn4Y=;
        b=JqDX3BcBRbEuzqHtzIvmuHl9zsEJNPKE7l/J9hCp3dTmiGTmUGANlkcI61pxniOBiP
         JxczKhAJraORVgVbg3yw8lYcJeaF+LtkllQqtBOPlBYn7TgWtk9L3gidTKpAFvNomSBM
         JaRq7x1SXvS03vxVyCOUvP0ntcSuwyHGmoHeBPnn9h6QpfenpwarKlfdmKqoHb5FTPmh
         HTBBsziaEU8lFuSsw/qnJH7DLsdhFgMSsV8+a9x/uxUOjSo2CPpzL1YcqAZSWr9srsWZ
         i8a332tycHTFY/IoelO9ictoS7XQhRWzEB0x2H8wef6vYxMMHqZQZZLbMIr88GnmRX2Z
         3bCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=zQcaTdcAmFm7hKWlLt7/xAx+RulymiwoxzvlaJ6Dn4Y=;
        b=AF3OUGgDRXmwCMNuyII+QbVDOZu1t3L3RaXinucX1nJ8X73Rnrp8pFVL4is03g60Bi
         CYNOY3+9ROQT+nAD22HItsk1vfcc8aNRAf/MTfoQE7bf15XET2DJRvnqmpDDFFBWyRS8
         RrE6Cd8nkZjq5E5ZXQg84MfAHFWr3LLkkGlfpoHpi3p5h1UgdxrXM2tkiFSisYoI/G5x
         25nMgAS4WYZ95s9SX8Fz4O064rZ+khn9xJhifFujKZHHu/IjVZ9Eal6Dq1UP8Zd5a8Aq
         1ceA/yg1YFOW44S4XSBtS28MUpnPoMNoE/n2JXojX2dpwOoKysp9aqHU61LvChJ0pDsR
         tfRA==
X-Gm-Message-State: ACgBeo0ZNEkr9LZkDJly7oyXL/dn3FSpcbsZEfbWQ5wgcF4LY1in/mwi
        aiisapC+fPP9gpVO84U33ebvfw==
X-Google-Smtp-Source: AA6agR5GXLMIEsCjNQLVkedtAe8QPcwwd2ykMWWhZGoYNdvLxKo95u/JLQVVYd6Zn/3caSaICMdj+Q==
X-Received: by 2002:a05:6512:3406:b0:494:9e2a:cbd with SMTP id i6-20020a056512340600b004949e2a0cbdmr486161lfr.635.1662023728748;
        Thu, 01 Sep 2022 02:15:28 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t17-20020a2e2d11000000b00261b4df9ec4sm2422349ljt.138.2022.09.01.02.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 02:15:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Johan Hovold <johan@kernel.org>
Subject: [RFC PATCH 0/3] drm/msm/dp: several fixes for the IRQ handling
Date:   Thu,  1 Sep 2022 12:15:24 +0300
Message-Id: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org>
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

Johan Hovold has reported that returning a probe deferral from the
msm_dp_modeset_init() can cause issues because the IRQ is not freed
properly. This (compile-tested only) series tries to fix the issue by
moving devm_request_irq() to the probe callback.

Dmitry Baryshkov (3):
  drm/msm/dp: fold disable_irq into devm_request_irq
  drm/msm/dp: switch to using platform_get_irq()
  drm/msm/dp: move dp_request_irq() call to dp_display_probe()

 drivers/gpu/drm/msm/dp/dp_display.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

-- 
2.35.1

