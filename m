Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 927FE730AE1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 00:44:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231151AbjFNWoK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jun 2023 18:44:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236965AbjFNWoI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jun 2023 18:44:08 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 231152101
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 15:44:07 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f63006b4e3so9548100e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 15:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686782645; x=1689374645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AC35kDbj6ySmemert7/iRfIceZyirU887BhY5EsoBY0=;
        b=hXG52HqnIpdkGQuwJp2XG/WhHpGSW2X8YJ7wRGzqSbvDi5DogyuX5DYcdP7KZIldr9
         DeU4ZRXJT+c8u0Z5DG3UEJMSU65yIOgCiTKuYdkY27vmolZPGHMjkoxWLUv/sdJeQ3uK
         btYHk+vZm4kQeDWGC83FMN0TtDm2jWZqlwJW7DuKgYb7aOeF9iiQgCfRWGmZka/P2FDz
         xC0eDuQgiz64HSNxquDOOynIKns/FJDzC/naJZPaZgpRQoxtjIjuxnBx9rB1vu6S86XR
         QtCh6eiOw07pMTxwmWAqoy8a0/tQsYjq6u3K/5HvCELbEzE0WwhpWae5nUOCC7hTEU1/
         oTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686782645; x=1689374645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AC35kDbj6ySmemert7/iRfIceZyirU887BhY5EsoBY0=;
        b=NLVSCtyDbVLT6d1V/dKtAkBmCMjdgsvw2kJsZJ1bisr6nZTsD5nyTRtgvpRUVg1HB/
         mnyJPqlgTfAz4qf67YmqCX2gCPdKmiUrQIkZUXauzWx2nHUTuua4j2XdsH15Op94CT/P
         BLkTzn2yq2CU3tDrhE/HjUPczB4W+rPYs3VmqZHEZVfTj8E4BXEX/iV9QdRWh4BMxLry
         sib42rzjR03qVBFFk7jJTA2tcscb20Hkigb5a92hzg7egQkr8xgpPQMIn2YXI1dRdzab
         s4YaX72UE3vSaDg9ay7mZecDe21rSA4x5cSJ+9kxsDDkKlCM5V/qd0cowi/pcQZJr6/Y
         XFuA==
X-Gm-Message-State: AC+VfDwjizKPK0YxYdAwN+WVMuOTU1tHl2U0yRsaQT0JprGJ6MPNGFMJ
        jbt8NefD7EPwwag89i+FzYXMuQ==
X-Google-Smtp-Source: ACHHUZ4dw/+61k2ZzEwroW2qmQVzfEyETzh2vxioPG+C1jcksXinkjZ6FbgE76zzqP9NLubv6XahYQ==
X-Received: by 2002:a05:6512:68:b0:4f3:a99f:1ea7 with SMTP id i8-20020a056512006800b004f3a99f1ea7mr8129826lfo.55.1686782644756;
        Wed, 14 Jun 2023 15:44:04 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id q2-20020ac24a62000000b004edd2dc9a09sm2295866lfp.258.2023.06.14.15.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 15:44:03 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm/dsi: dsi_host: drop unused clocks
Date:   Thu, 15 Jun 2023 01:44:01 +0300
Message-Id: <20230614224402.296825-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Several source clocks are not used anymore, so stop handling them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 33 ------------------------------
 1 file changed, 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index fb1d3a25765f..eaee621aa6c8 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -118,8 +118,6 @@ struct msm_dsi_host {
 	struct clk *byte_clk;
 	struct clk *esc_clk;
 	struct clk *pixel_clk;
-	struct clk *byte_clk_src;
-	struct clk *pixel_clk_src;
 	struct clk *byte_intf_clk;
 
 	unsigned long byte_clk_rate;
@@ -129,8 +127,6 @@ struct msm_dsi_host {
 
 	/* DSI v2 specific clocks */
 	struct clk *src_clk;
-	struct clk *esc_clk_src;
-	struct clk *dsi_clk_src;
 
 	unsigned long src_clk_rate;
 
@@ -267,21 +263,6 @@ int dsi_clk_init_v2(struct msm_dsi_host *msm_host)
 		return ret;
 	}
 
-	msm_host->esc_clk_src = clk_get_parent(msm_host->esc_clk);
-	if (!msm_host->esc_clk_src) {
-		ret = -ENODEV;
-		pr_err("%s: can't get esc clock parent. ret=%d\n",
-			__func__, ret);
-		return ret;
-	}
-
-	msm_host->dsi_clk_src = clk_get_parent(msm_host->src_clk);
-	if (!msm_host->dsi_clk_src) {
-		ret = -ENODEV;
-		pr_err("%s: can't get src clock parent. ret=%d\n",
-			__func__, ret);
-	}
-
 	return ret;
 }
 
@@ -346,20 +327,6 @@ static int dsi_clk_init(struct msm_dsi_host *msm_host)
 		goto exit;
 	}
 
-	msm_host->byte_clk_src = clk_get_parent(msm_host->byte_clk);
-	if (IS_ERR(msm_host->byte_clk_src)) {
-		ret = PTR_ERR(msm_host->byte_clk_src);
-		pr_err("%s: can't find byte_clk clock. ret=%d\n", __func__, ret);
-		goto exit;
-	}
-
-	msm_host->pixel_clk_src = clk_get_parent(msm_host->pixel_clk);
-	if (IS_ERR(msm_host->pixel_clk_src)) {
-		ret = PTR_ERR(msm_host->pixel_clk_src);
-		pr_err("%s: can't find pixel_clk clock. ret=%d\n", __func__, ret);
-		goto exit;
-	}
-
 	if (cfg_hnd->ops->clk_init_ver)
 		ret = cfg_hnd->ops->clk_init_ver(msm_host);
 exit:
-- 
2.39.2

