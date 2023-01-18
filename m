Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 554C267108C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 03:06:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbjARCF5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 21:05:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbjARCFx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 21:05:53 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D937F227A6
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:05:52 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id w14so30382636edi.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Mo3OsjRmoegPVBXpDHztjrI35bAGMIMb/BBoDQiIGE=;
        b=uqXudvu1MCtrBLj2k/8P0eqOwFbcvvMPhyQDKG0Nsk7+kCuwkvXUDgzv6Hea6OPaI0
         l/fWZK8Rsr9t391yNau3seUvPA9KdvG02Rjn5Wm7SToUquUANVVb273R+asuwUf/rWhk
         5uc/7gG2jciJyhPFFcP6/CoJFJ1YUyBsM19525fnwSRkLaMiss/GMHCrdmJN50zt2PIC
         0HJEVvKyPGBfDi3+fj6P2g8NkpGodnf1ylFXYPgyUDwvi7OZHBzb5YLMt++kay26iUur
         bq2DgynP7f50zBcMnBbVUSXVrzNqkk9a0OU6tK9N6AaWDA2gmFYaPtC1IIMwcr5oyYku
         i61w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Mo3OsjRmoegPVBXpDHztjrI35bAGMIMb/BBoDQiIGE=;
        b=SVlD5XVhHteiuAf0+60MABd/JzUIOEkoQhVIUz/b80n7+RYg2yMBkjVCdIZlypS6AG
         wpg0qIPIAii762lQLf1QLFl1j5YOoyRKx0t152ZC6nGRvkjSBj3HJ67tJzZVymDpzzhg
         ZdAjo5Xobh1/FAtrSXPP8/iwgl3obuXPFs0xwJqgxDroEFtmaXAJikFBsu4QG7X0I9wQ
         /YvKAZNrZrBUtgezpGRVWMWaAtTAM7uJIqDCSKhBRSogX5IsCfVOrwAVfI6NZqCHocDh
         GtEkJHEXG0/7lZ8GPjJOY7J1vkyKUZkijJKN7Vn6n51sLW4xjylIU8xkxuz9tuXtf5f0
         5Kag==
X-Gm-Message-State: AFqh2krst4pCL2A6PoGkAqEjmBp6PgMmhTa/0KIdOUPSGdAkJ4ykebc5
        SKqRwI2aPSgDzkpl3zDbalZpkA==
X-Google-Smtp-Source: AMrXdXs7o7jY9Bn4+fBgXzZsPOskZ1OqDKjUQsZqGxiJcTwUNfkGFNx1rl1rt7/SvMi6oA7OHizOPQ==
X-Received: by 2002:a05:6402:3496:b0:48e:9c36:6c39 with SMTP id v22-20020a056402349600b0048e9c366c39mr7097405edc.0.1674007551486;
        Tue, 17 Jan 2023 18:05:51 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s1-20020aa7c541000000b00495c3573b36sm13544668edr.32.2023.01.17.18.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 18:05:51 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: add missing dpu_encoder kerneldoc
Date:   Wed, 18 Jan 2023 04:05:49 +0200
Message-Id: <20230118020549.1690078-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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

Describe missing dpu_encoder_phys_wb_is_master() argument and struct
dpu_encoder_virt.wide_bus_en field.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c         | 1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index d1a528ff0f28..758261e8ac73 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -162,6 +162,7 @@ enum dpu_enc_rc_states {
  * @vsync_event_work:		worker to handle vsync event for autorefresh
  * @topology:                   topology of the display
  * @idle_timeout:		idle timeout duration in milliseconds
+ * @wide_bus_en:		wide bus is enabled on this interface
  * @dsc:			drm_dsc_config pointer, for DSC-enabled encoders
  */
 struct dpu_encoder_virt {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 95921efd8139..bac4aa807b4b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -26,6 +26,7 @@
 
 /**
  * dpu_encoder_phys_wb_is_master - report wb always as master encoder
+ * @phys_enc:	Pointer to physical encoder
  */
 static bool dpu_encoder_phys_wb_is_master(struct dpu_encoder_phys *phys_enc)
 {
-- 
2.39.0

