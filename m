Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1622558E5B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Aug 2022 05:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230283AbiHJDr6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Aug 2022 23:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230375AbiHJDrv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Aug 2022 23:47:51 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC893804B8
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Aug 2022 20:47:43 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id j66-20020a9d17c8000000b00636b0377a8cso8859085otj.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Aug 2022 20:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=1ttBChNoFl/Up8/6fPaOC7Cj26gzigpytaf8DEk+Aek=;
        b=a9Uh1niVqBnlaw5WkU2oeTeMaYGhUKoDjLPD+aLB52LJew7fkvNgnBYAVhya9bQyED
         kn85SFmjR/oq4DrmnMIT4bc1Tdgc9Mwy9Ngc1dqVlFA1hbXwlXDPiY0n9xePgpT4cZdh
         N63rMRKxIOrEO6d5siZMRinYOkVC7ajZKd30KvV/ndtLBR6sxb3buUIL8w6RhbMtLzmc
         f1+7KC30EXQxRozIsM8NlLI2la4bFyLkGLw771ePE06KjCI/Min5OXbaPL/59QiAA1Uh
         /FZ8hkhW87XSTgmBfOt1A0L1KLzxCyNWIWdloyoG1owahhd2iBj12XbVgAVDJrZNp0Xh
         3qHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=1ttBChNoFl/Up8/6fPaOC7Cj26gzigpytaf8DEk+Aek=;
        b=SYSh5FhuZJzV+3PXP5eRkitC8U/sN3SNd+vOle1RuxNfPIs52EI7uCPoOiUM7vR7uQ
         JulLhIMgMIrzUysWG/vB3iDs5nxh0Gn5DOPft3mpn/IDwXzW3rJbz1tEnDTweP3sW1dr
         O3B1PCFRsy9tv75CwYO2WdIeb01SSZzvyybb2slCMGSh6H5ZPJo1SB6zmEgQF5FX7tdn
         lUFnXKhGQRZ9AXVbpqZaQZeIh69Ny/g0X78cPf74NxQF/OYRnRkuu6yn3d6j+JANypMq
         ks8i6CLPEdFE1iXhGIaIeHGnpsIyBmDwGXdSGy90aqU8IsE5jN0Hb/60BRLD7u1/bJqp
         ojfw==
X-Gm-Message-State: ACgBeo1JOFKr8wWLl8NRTIEFKnKXMVhXCwyE2ovFk/2Trr5dl1OsuDh+
        8reZUF3ZDNhzGaqhOLS6UNJ5jg==
X-Google-Smtp-Source: AA6agR62YvvK2ysqm9m7OTeHjTz/jhFcl0NG1lth+btptlN+5pshg5puEBxk4ECKPyKNuRLbAd5bLg==
X-Received: by 2002:a05:6830:638d:b0:636:a941:d467 with SMTP id ch13-20020a056830638d00b00636a941d467mr8664571otb.5.1660103262899;
        Tue, 09 Aug 2022 20:47:42 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n2-20020a4ae742000000b00444f26822e5sm454337oov.10.2022.08.09.20.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 20:47:42 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] drm/msm/dp: Don't enable HPD interrupts for edp
Date:   Tue,  9 Aug 2022 20:50:12 -0700
Message-Id: <20220810035013.3582848-7-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220810035013.3582848-1-bjorn.andersson@linaro.org>
References: <20220810035013.3582848-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Most instances where HPD interrupts are masked and unmasked are guareded
by the presence of an EDP panel being connected, but not all. Extend
this to cover the last few places, as HPD interrupt handling is not used
for the EDP case.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 568295381246..bb4db9acaa4f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -610,8 +610,10 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 	}
 
 	/* enable HDP irq_hpd/replug interrupt */
-	dp_catalog_hpd_config_intr(dp->catalog,
-		DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK, true);
+	if (!dp->dp_display.is_edp)
+		dp_catalog_hpd_config_intr(dp->catalog,
+					   DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK,
+					   true);
 
 	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
 			dp->dp_display.connector_type, state);
@@ -651,8 +653,10 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 			dp->dp_display.connector_type, state);
 
 	/* disable irq_hpd/replug interrupts */
-	dp_catalog_hpd_config_intr(dp->catalog,
-		DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK, false);
+	if (!dp->dp_display.is_edp)
+		dp_catalog_hpd_config_intr(dp->catalog,
+					   DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK,
+					   false);
 
 	/* unplugged, no more irq_hpd handle */
 	dp_del_event(dp, EV_IRQ_HPD_INT);
@@ -678,7 +682,8 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	}
 
 	/* disable HPD plug interrupts */
-	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, false);
+	if (!dp->dp_display.is_edp)
+		dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, false);
 
 	/*
 	 * We don't need separate work for disconnect as
-- 
2.35.1

