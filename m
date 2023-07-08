Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3C2B74BABC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jul 2023 03:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbjGHBEX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 21:04:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232713AbjGHBEX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 21:04:23 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05B92210B
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 18:04:22 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b703c900e3so38802801fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 18:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688778260; x=1691370260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhEI1lIm+DUmqN/L6yAKAjA1YNlc6k+Vw25GanFRW4I=;
        b=IdgwmdV77LIS3Qf9wLgiOehF2o0nKe1wJx48roRXr4lUKi3GeD+XvlVheVShTEEFuX
         eOB4xmRHS7bBSFgn/2C8JvSlcPWWJEe4qkkYBaTwusl8U/ZODND3RSQkOgG20TNopc4w
         vkGcK73EdEOdQ0rAfPIbG/J+Sy6axeIMT4fso+31CFYdS8flu3O0cBztRy7gx3gGqRmr
         uD+/uyelnPHzKEOWZ/Pvr5kg8Jjb/7AdwzQ0eVatptxge+LLgCTd4Y6OdtCpouEDVCEF
         N5TUGH1PyeebiV8+F0V+zVArdhz93JkVwXUbZN5rh/CsGLfeVlsHoA+kjd75VsS0BkYj
         BbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688778260; x=1691370260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fhEI1lIm+DUmqN/L6yAKAjA1YNlc6k+Vw25GanFRW4I=;
        b=Y+GWfAF3INfu1wRNrXEk6wJoW9htY8EffXHpxw/j6/gqS9KimzMGKj+eyUaBjWDf/k
         WzoFVFMMVqYfCS3nQhn4K6IJHItA9HPXkuEXZv4fyZvUbNEIP7r3w5C1B1Zq/8cMBnxN
         CB5K3cidxynXuwB7/nABxntLj4OjyFqdVWEppaMNVyBztEM5osu1gtHGKuvZDmgHEU8c
         wFX+syRG1U67yh7Gq1OCwr258t2SKjuZCcXRo7yixXdT+4L2qcdkdjuZXNkFU7p4ht+d
         zgkrA94G5OD8+YxJ+8QbKxqmC0NCEc8HnSHwrFaC/60tVOkeeWZEyaHxpHwwn52ScL36
         KcqA==
X-Gm-Message-State: ABy/qLYrAchsBhPCT5bc0WPd1GitDg5RZEC/IbG1UQ0yCVogCTPVHfxk
        Jy7RBPwPsuUK/+nP+sqHAob+2g==
X-Google-Smtp-Source: APBJJlGI1MnjiDn7TijmPyIOnYvBL3ptuIpFuRuga4F2nq1AVmD3c0RdD3GmqNDv3xebTxq2pTvshQ==
X-Received: by 2002:a2e:8546:0:b0:2b5:9778:7ce2 with SMTP id u6-20020a2e8546000000b002b597787ce2mr4719432ljj.15.1688778260413;
        Fri, 07 Jul 2023 18:04:20 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l5-20020a2e8685000000b002b6ee99fff2sm1012807lji.34.2023.07.07.18.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 18:04:20 -0700 (PDT)
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
Subject: [PATCH 17/17] drm/msm: drop mdp_get_formats()
Date:   Sat,  8 Jul 2023 04:04:07 +0300
Message-Id: <20230708010407.3871346-18-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
References: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
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

Drop the function mdp_get_formats(), which became unused after
converting both MDP4 and MDP5 planes to use static formats arrays.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 24 ------------------------
 drivers/gpu/drm/msm/disp/mdp_kms.h    |  1 -
 2 files changed, 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index ba9abe8b3acc..0fe430af9523 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -183,30 +183,6 @@ const uint32_t mdp_rgb_yuv_formats[] = {
 
 size_t mdp_rgb_yuv_num_formats = ARRAY_SIZE(mdp_rgb_yuv_formats);
 
-/*
- * Note:
- * @rgb_only must be set to true, when requesting
- * supported formats for RGB pipes.
- */
-uint32_t mdp_get_formats(uint32_t *pixel_formats, uint32_t max_formats,
-		bool rgb_only)
-{
-	uint32_t i;
-	for (i = 0; i < ARRAY_SIZE(formats); i++) {
-		const struct mdp_format *f = &formats[i];
-
-		if (i == max_formats)
-			break;
-
-		if (rgb_only && MDP_FORMAT_IS_YUV(f))
-			break;
-
-		pixel_formats[i] = f->base.pixel_format;
-	}
-
-	return i;
-}
-
 const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format,
 		uint64_t modifier)
 {
diff --git a/drivers/gpu/drm/msm/disp/mdp_kms.h b/drivers/gpu/drm/msm/disp/mdp_kms.h
index 11402a859574..1b2ccf7e7de6 100644
--- a/drivers/gpu/drm/msm/disp/mdp_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp_kms.h
@@ -91,7 +91,6 @@ struct mdp_format {
 #define to_mdp_format(x) container_of(x, struct mdp_format, base)
 #define MDP_FORMAT_IS_YUV(mdp_format) ((mdp_format)->is_yuv)
 
-uint32_t mdp_get_formats(uint32_t *formats, uint32_t max_formats, bool rgb_only);
 const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format, uint64_t modifier);
 
 extern const uint32_t mdp_rgb_formats[];
-- 
2.39.2

