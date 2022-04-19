Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C46BE5072E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 18:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354558AbiDSQXU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 12:23:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354581AbiDSQXS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 12:23:18 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D02B2315B
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 09:20:35 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id y11so3626639ljh.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 09:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VXeyTFTsfoYPFo06SZsNQ99dRK1p3DG4c0ZdovqUbmc=;
        b=LlSwrxiPNMbBWlTQRPNdY0n/WTrx7v4OLM1b9B0AdYIzdT66DCpNAY1SH+iygwDyjE
         MbKrYNyJ0pAPF560Z2eTWPDgql9FneKUBBs4Pnpeaa7m5bCQMPv6JdeRpUqD8kZpCYBo
         2uNIf9xO84BCBRbyiiExxvhkqY3+iGuQSgfUjynB0v7zPry9Pt5Y60clo8lN7r/QQ0Z6
         YHbjSeCOvnzlhWW0WP97FQyM2h2jx7DciH4doNI5WYXMTnt9l4DyHi0NyjU2op7IS8N3
         dDM9+ci1gYwox8Uy86qtdMPxAYCafgRj5Fu+tpnxcBjIWgakE32uLK6FTb/tEWl+/9zK
         2hbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VXeyTFTsfoYPFo06SZsNQ99dRK1p3DG4c0ZdovqUbmc=;
        b=YbmKzNKHardM5ro3VVghvUbUoHCvO1shpaBjnLcKxxU5GeRbphY7oRms9xoP7wuuJf
         b5vq1UvtUEBCR+hxjEdXaJ3FNi8OlW0VdqnBf90I0xcrfpm1ueXXunYaQfV9QjNKQ7SK
         SSuEeUlMWM9A6AvTxqcSN4knzrcpew8oOJH8gH6z8gVRxgtGT0gdqqQlMxEDeM46LxpY
         f/4nkcdb79kTSKIcTKmO5xY+pQxvnALPkNWimQtgac0SNbbGnWByB6ogpWPIvKnBuA39
         roYfQNA9O5wN9euw/FZ4hF4uVeNNEV3S6VbQ4rku+z4M6WqxaYe8XaLSA45PDONnLlHx
         l2IA==
X-Gm-Message-State: AOAM5327OJ5txw+Ulog9/75XxIoJTNJzM1NGf6lYxuxks7jTXp6YQ2/9
        A58AWQkU3sWwvkSU3SPX2QP2dQ==
X-Google-Smtp-Source: ABdhPJxwdScriRJx3uR0TFUsQrgBLKqdu/LnEG3C8Zkr02oQlpUTup8+q24MTTMVTCgO4xXB5kDVFw==
X-Received: by 2002:a2e:7002:0:b0:249:b34a:69d3 with SMTP id l2-20020a2e7002000000b00249b34a69d3mr10678980ljc.474.1650385233468;
        Tue, 19 Apr 2022 09:20:33 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k15-20020a2e92cf000000b002493cc687f3sm1495153ljh.45.2022.04.19.09.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 09:20:33 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/msm/dpu: fix error handling around dpu_hw_vbif_init
Date:   Tue, 19 Apr 2022 19:20:29 +0300
Message-Id: <20220419162030.1287562-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419162030.1287562-1-dmitry.baryshkov@linaro.org>
References: <20220419162030.1287562-1-dmitry.baryshkov@linaro.org>
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

Using IS_ERR_OR_NULL() together with PTR_ERR() is a typical mistake. If
the value is NULL, then the function will return 0 instead of a proper
return code. Moreover dpu_hw_vbif_init() function can not return NULL.
So, replace corresponding IS_ERR_OR_NULL() call with IS_ERR().

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index aadf032a190b..d38c55f9f003 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1102,10 +1102,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 
 		dpu_kms->hw_vbif[vbif_idx] = dpu_hw_vbif_init(vbif_idx,
 				dpu_kms->vbif[vbif_idx], dpu_kms->catalog);
-		if (IS_ERR_OR_NULL(dpu_kms->hw_vbif[vbif_idx])) {
+		if (IS_ERR(dpu_kms->hw_vbif[vbif_idx])) {
 			rc = PTR_ERR(dpu_kms->hw_vbif[vbif_idx]);
-			if (!dpu_kms->hw_vbif[vbif_idx])
-				rc = -EINVAL;
 			DPU_ERROR("failed to init vbif %d: %d\n", vbif_idx, rc);
 			dpu_kms->hw_vbif[vbif_idx] = NULL;
 			goto power_error;
-- 
2.35.1

