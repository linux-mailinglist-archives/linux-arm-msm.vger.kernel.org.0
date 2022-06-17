Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29E6D5500AF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jun 2022 01:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236761AbiFQXYk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 19:24:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236917AbiFQXYj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 19:24:39 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BCB76622D
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 16:24:38 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id c30so6179601ljr.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 16:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JZ+dOp4Z4kFod4DkYa3/glNVXupx/hzcZ+pGIy9A73g=;
        b=kTPE8xQhlnU+DF0lB6ZBnP2DBaScpH/GKYgCRgU9jdOZhhhjO5q7xfPr468LCdVrmA
         qyghjqWpxUUN/S5+6BHoW3NX2bmMFJJT3/M8osRP333bBU+RkZxhB2JvE/MioL3+daeU
         r/z3mCsnGIyxP0WWS1StHzY7NS4Vkw4Mn01NNKrP/DvTG0RkrCvvOJsXMC5pzqvE9Gzv
         /pPol/JmJeCW+NGmCXEiRGpsM9jrk4XnQj+je9CnNNabemNjd5/Lnvnrw+HlQRPRe03M
         NtkomSaRN0+pc7Tv3m+AkAOFcF6yu2ZrF0w2iYtj4NmSnF83kfK0rh0yVVVOfSuc8f4B
         qecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JZ+dOp4Z4kFod4DkYa3/glNVXupx/hzcZ+pGIy9A73g=;
        b=GDVeTEiP+pFCsoW+di+BNUi2KmX0dEwa0xjCiGIfTbFuT7J0yCY48mBIwflgYwH5gn
         7QPNeD6p5UAYYFVXZefTRxzswDnSusYId/peWIIe0wnKu0Q3XNEJTNWOT/ICJACrOtg1
         psUm1aWW/g1WiDUNqr1Slw9w3XH308j4AxPRycoNruVtMUFLNS8uuBhwp8egcDDBo2+V
         7Nvn7Df5WQcbbo4kN+yvR7vebelFAm3RHjO05kiZUmd2gCncuwOLWSQr67Gapnb6T0AP
         Qbce+m4Fmg0dTC4SFgK2ETBoacZMhkPC1Hk29nHW/9McgwKDzgiz/o4IpzPNnaCdBm+g
         6AvQ==
X-Gm-Message-State: AJIora/jbTiyWl/8+AXDtNpA1rftT9meP143fsnYHUoBF+qh1QdBRuxp
        IGIQw2ACmIwoQuEaYEv55Nzr8A==
X-Google-Smtp-Source: AGRyM1sN+iG8PVMK7zauSWr0l9ms1QCEcumjsR+hlo6UhXmunHRrJEOs5wRGS3LMnxi0VnSWb4Xywg==
X-Received: by 2002:a2e:875a:0:b0:25a:4307:dd4c with SMTP id q26-20020a2e875a000000b0025a4307dd4cmr6091853ljj.32.1655508276960;
        Fri, 17 Jun 2022 16:24:36 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a7-20020a194f47000000b00478f9517a60sm802742lfk.38.2022.06.17.16.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 16:24:36 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/msm/dp: rename second dp_display_enable()'s argument
Date:   Sat, 18 Jun 2022 02:24:33 +0300
Message-Id: <20220617232434.1139950-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617232434.1139950-1-dmitry.baryshkov@linaro.org>
References: <20220617232434.1139950-1-dmitry.baryshkov@linaro.org>
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

To follow up recent changes, rename (and change type of) second
dp_display_enable()'s argument from generic u32 data to bool
force_link_train, which is later passed to dp_ctrl_on_stream().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes since v1:
 - Added patch
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index fea610793dc4..96defacc92dc 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -608,7 +608,7 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 	return 0;
 };
 
-static int dp_display_enable(struct dp_display_private *dp, u32 data);
+static int dp_display_enable(struct dp_display_private *dp, bool force_link_train);
 static int dp_display_disable(struct dp_display_private *dp, u32 data);
 
 static void dp_display_handle_plugged_change(struct msm_dp *dp_display,
@@ -857,7 +857,7 @@ static int dp_display_set_mode(struct msm_dp *dp_display,
 	return 0;
 }
 
-static int dp_display_enable(struct dp_display_private *dp, u32 data)
+static int dp_display_enable(struct dp_display_private *dp, bool force_link_train)
 {
 	int rc = 0;
 	struct msm_dp *dp_display = &dp->dp_display;
@@ -868,7 +868,7 @@ static int dp_display_enable(struct dp_display_private *dp, u32 data)
 		return 0;
 	}
 
-	rc = dp_ctrl_on_stream(dp->ctrl, data);
+	rc = dp_ctrl_on_stream(dp->ctrl, force_link_train);
 	if (!rc)
 		dp_display->power_on = true;
 
-- 
2.35.1

