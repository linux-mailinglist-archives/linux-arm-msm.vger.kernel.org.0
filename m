Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 970E151E8D6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 May 2022 19:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243499AbiEGRNT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 May 2022 13:13:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244043AbiEGRNN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 May 2022 13:13:13 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F0BA1A38C
        for <linux-arm-msm@vger.kernel.org>; Sat,  7 May 2022 10:09:26 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id t25so17283028lfg.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 May 2022 10:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Fl5gRxPQwePsJhPtYdJYGhgQW5l6J6j4kwqCPdVck7I=;
        b=tQmFPaqB9Wjl+V8ASR5ujTk90TnQRMRKrZJq1wWao21lnAonDnDH1sLiiieAHNWwKr
         dfkPAQ8VipHgdgvwmiwuSd2PLt87xxgsdRpeScDn3PJTiJWXAcQm4Ekd3cViOg/E0WxI
         199FgXNZ1y+ugyHXORtg+jpnXpjgk38ykc0YGvCEChtHM/VKKzi7NoQOPKKAANfye4wi
         TzpqyTx006ncWPnEFz2r/c/xvaAdURw3EVo/ngT0GkMVgB+5SJRZg993W/iHvEW8TphC
         ODYzN4Jwail+j7CLKodJUl8WTwon9I3Zclqk1yPMBRrjdxnM0/bfScW+H081OwPNc81M
         FQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fl5gRxPQwePsJhPtYdJYGhgQW5l6J6j4kwqCPdVck7I=;
        b=LX+nQl13HRpvEC1l3HbU98/SOaSpIVuC12AupKCa5R7lAEVSK07FmVmiZA2yMYJDZn
         tCoxveZPUvjQ1xHIsyIxrUDhkxZta/qcUZCv4kz6ZGsYQO8+oVbCOjrlx5kdqaD81Pic
         Cq/82s4cJBiFIHVIhZBmkkCN+1lYESsFF4BdaSPSj35cFN6yz+Uku659GJMkEAY7N6ga
         F7uIXuTdAjxnS7rBWR9SEtgzvY9GEF+AwGNwhA2H4P1Ua8xdC6Bau9C/iUqfx8rb95kc
         oWmiA8gaPA0LAKOeVM82GvjaMitK44D4ERH9fP8gOOAlM8XEkLuokQz0tclLC6Q1MceW
         nDBg==
X-Gm-Message-State: AOAM531utcF/3IJigH10s1vikKBDojIzgIZdTJU+DYhbKWi8vhhNgnHn
        Z1rFDA7JtEH1q5i0TIk9i3fXuA==
X-Google-Smtp-Source: ABdhPJxwRZ4sDrgrxB/oQOREsq+0eXzVLyq7Pkp+V1PlVr7UQIfmJVUYFBzgKY9UsfJ90edg5I75mw==
X-Received: by 2002:a05:6512:b0e:b0:44a:a5a0:f60e with SMTP id w14-20020a0565120b0e00b0044aa5a0f60emr6790155lfu.669.1651943364389;
        Sat, 07 May 2022 10:09:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n14-20020a05651203ee00b0047255d211f9sm1175308lfq.296.2022.05.07.10.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 May 2022 10:09:24 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/msm/mdp5: convert to drm_crtc_handle_vblank()
Date:   Sat,  7 May 2022 20:09:21 +0300
Message-Id: <20220507170922.1723712-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220507170922.1723712-1-dmitry.baryshkov@linaro.org>
References: <20220507170922.1723712-1-dmitry.baryshkov@linaro.org>
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

Stop using deprecated drm_handle_vblank(), use drm_crtc_handle_vblank()
instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c
index 9b4c8d92ff32..43443a435d59 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c
@@ -82,8 +82,7 @@ irqreturn_t mdp5_irq(struct msm_kms *kms)
 	struct mdp_kms *mdp_kms = to_mdp_kms(kms);
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(mdp_kms);
 	struct drm_device *dev = mdp5_kms->dev;
-	struct msm_drm_private *priv = dev->dev_private;
-	unsigned int id;
+	struct drm_crtc *crtc;
 	uint32_t status, enable;
 
 	enable = mdp5_read(mdp5_kms, REG_MDP5_INTR_EN);
@@ -94,9 +93,9 @@ irqreturn_t mdp5_irq(struct msm_kms *kms)
 
 	mdp_dispatch_irqs(mdp_kms, status);
 
-	for (id = 0; id < priv->num_crtcs; id++)
-		if (status & mdp5_crtc_vblank(priv->crtcs[id]))
-			drm_handle_vblank(dev, id);
+	drm_for_each_crtc(crtc, dev)
+		if (status & mdp5_crtc_vblank(crtc))
+			drm_crtc_handle_vblank(crtc);
 
 	return IRQ_HANDLED;
 }
-- 
2.35.1

