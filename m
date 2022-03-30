Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D79614ECFAE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Mar 2022 00:31:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344400AbiC3Wb6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Mar 2022 18:31:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233684AbiC3Wb5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Mar 2022 18:31:57 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83B1B5BD27
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Mar 2022 15:30:11 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id m3so38276176lfj.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Mar 2022 15:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JtbqvUsqEzE2g6uW/TT035ax0kBfyahmOob6FsqwcPY=;
        b=hQPWu/OIb+Zegy4kT+8Em3QCWjiXaFxFPWp5W2WJaaPEXiGblSSVNAXq8q7uOJtC47
         eJ06zbMxbNw0E/hPe5Yjp02P12DRRSmUDfhM+CttqoHsY2JzvzAmyf3wiHVPDeIoKpGw
         Gq66rgG3yK108wL0ib2j/2l2m9zypCghXh1zONv+9wNSCcx7a7214v2XygnOF3Qhh53D
         muKngZCaFu3fTimsAwa7EJL10OzYpzB9Et5MUbfTxCCjOrxUViMBWYblP13jvhXdzrc5
         a6uFuEzBRgypjI7nBMWTbFx2vY2sel6pPBIfROrWd0A1tkHllnzpARSS2BurI8UK71sO
         iNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JtbqvUsqEzE2g6uW/TT035ax0kBfyahmOob6FsqwcPY=;
        b=XmC4kv0kP2tj4hMufA8mYPbwQ8mIQtp3cguLpZylARbg3+lm8b53ueiuRdgzn+h6MR
         /+X+TsqOAfglil+3W0vlpHnqRrrK7g7eNeLFIMlLLRsJtrzCKDQOR4ipYZjqJ6trhDTh
         qlGMzyRcwVnNwmqjbsKwDWgu4gwB0gh1Dth4vzFcAo5rAjuvyxST7/zap9Lb0xYna1DF
         Q+O3GLKB14kRVNUJ6aujgvD+hvQBJYlPEhjRmOyQYPmEu92wJJ6Iu0IaBFQujF3+GNRB
         NAVpkxcKmDiqa+ow+AMTUrlNlFBAmKZkE2GV/F3CRwYi9pQz5qtQPUJpylDCIcSUxEWe
         GxGw==
X-Gm-Message-State: AOAM531knNfGawz+HAihRcDvd8+OIXTA2ZpAvfdVh/tmR/NmL/EfvTf2
        86XkOGv8TxjZ8eyC6ak1/u6RRw==
X-Google-Smtp-Source: ABdhPJzG/f64ACIg2eEZE7Cx4oJHdTia/6Z35v5jnReSD+gy9dIQgwNO9KoopCVhR+hFwGsgSOzuRA==
X-Received: by 2002:a05:6512:32c2:b0:44a:700c:4e97 with SMTP id f2-20020a05651232c200b0044a700c4e97mr8590964lfg.224.1648679409820;
        Wed, 30 Mar 2022 15:30:09 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a4-20020a2eb164000000b0024988e1cfb6sm2521295ljm.94.2022.03.30.15.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 15:30:09 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>
Subject: [PATCH v2 0/4] drm/msm/dp: simplify dp_connector_get_modes()
Date:   Thu, 31 Mar 2022 01:30:04 +0300
Message-Id: <20220330223008.649274-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

As noted by Ville Syrjälä [1] the dp_connector_get_modes() has weird
on-stack interim copy of the mode. When reviewing the mentioned patch I
noticed that the rest of the code in dp_connector_get_modes() is weird,
unused since September of 2020 and can be removed. This series removes
dead weird code leaving dp_connector_get_modes() simple enough.

[1] https://lore.kernel.org/linux-arm-msm/20220218100403.7028-11-ville.syrjala@linux.intel.com/

Changes since v1:
- Remove unsued ret variable from dp_display_get_modes()
- Add a patch making dp_connector_mode_valid() return MODE_CLOCK_HIGH
  (suggested by Stephen)

Dmitry Baryshkov (4):
  drm/msm/dp: drop dp_mode argument from dp_panel_get_modes()
  drm/msm/dp: simplify dp_connector_get_modes()
  drm/msm/dp: remove max_pclk_khz field from dp_panel/dp_display
  drm/msm/dp: make dp_connector_mode_valid() more precise

 drivers/gpu/drm/msm/dp/dp_debug.c   |  2 --
 drivers/gpu/drm/msm/dp/dp_display.c | 12 +++-------
 drivers/gpu/drm/msm/dp/dp_display.h |  5 +----
 drivers/gpu/drm/msm/dp/dp_drm.c     | 35 +++--------------------------
 drivers/gpu/drm/msm/dp/dp_panel.c   |  2 +-
 drivers/gpu/drm/msm/dp/dp_panel.h   |  3 +--
 6 files changed, 9 insertions(+), 50 deletions(-)

-- 
2.35.1

