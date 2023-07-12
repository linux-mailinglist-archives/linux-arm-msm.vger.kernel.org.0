Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83D237507B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jul 2023 14:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232375AbjGLMLy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jul 2023 08:11:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232444AbjGLMLx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jul 2023 08:11:53 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B450B0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 05:11:52 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b6a6f224a1so113250471fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 05:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689163910; x=1691755910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5iZ0+Rb7OzxR3irzWy7ik4oLco7UtnIIF/OZqFHjCIs=;
        b=aSZ9ilttYU+oSle6nCG2IVtk1rk3rDuPmBpxMOfjmKcp8vpugsla43dadeFsxtnWxg
         fvo/41dbSc9DK4Qc7MPMGXC9oUKyMaaXuVVVoaCHmHG3O9vXh3Dm1g7pJLZQITs7A0tM
         bGrbkXRwqgIwVFsbu+aO9pdiiPUMCu6feFhJnelOg/4qXVYLYHzslTrvBzkCNDQ+eUS8
         GCDUpW7sdRvmvreQCXJ507BdpVeJUr6UpJ4N5z6dO9ZRW8A8AI302T0mRVBqrjgAn6TJ
         oTY3UWliClm0JkwFIqMrL5t+2xvU7F7NJQ+h86G6bJEFXO7pvklCnVc1+i0b+9hpF38Q
         /lPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689163910; x=1691755910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5iZ0+Rb7OzxR3irzWy7ik4oLco7UtnIIF/OZqFHjCIs=;
        b=Zfp/Tj+GPiyERicnDwQJn++w0xH9XGxzqK2gMG+1AatW6VH4vTwEwF+0TJkgdUIuAG
         qDAoHlqh4Yw7ywVsJkDMldVFJys5LLrLv5+Rji4A7F5W31Lvtu1C8bRKTeYDjYKPHWHx
         OAd7z9cS9kfHzwCTMmo20+feVJyUVZfZr0MnSftWVtupRf54P1WrFwmeJxaMtlPEKGCI
         aoucJsQYaCq/Fu/GIkUd41nvL09Pnyc+f16MbnhZMYgLwHkH4yy3BkfU8XBIjToyMBla
         epc9AGerfcfT759ipguPaFMbx6tmHvs5UaMhmL33DPYGgmqyt+D5TckY1JQ+kiJaf/kb
         hBqQ==
X-Gm-Message-State: ABy/qLbh5JrbKIqFrBI7ACYfx00t3V0CRUyU+TdLQoqmDCnQy8YfMMhi
        24Ds6J91NrvkGlCEKZTH7z47aA==
X-Google-Smtp-Source: APBJJlHmYa93PvlTRuFcmYOEMhmlhwu+khLDXsukQ2doZ6JboJHZ9ZKKwGLZ+XfYKmA8LUkqKTWRLQ==
X-Received: by 2002:a2e:894d:0:b0:2b6:9ebc:daed with SMTP id b13-20020a2e894d000000b002b69ebcdaedmr17610674ljk.35.1689163910531;
        Wed, 12 Jul 2023 05:11:50 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id p14-20020a2ea40e000000b002b6c8cf48bfsm913135ljn.104.2023.07.12.05.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 05:11:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 5/8] drm/msm/mdss: inline msm_mdss_icc_request_bw()
Date:   Wed, 12 Jul 2023 15:11:42 +0300
Message-Id: <20230712121145.1994830-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
References: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
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

There are just two places where we set the bandwidth: in the resume and
in the suspend paths. Drop the wrapping function
msm_mdss_icc_request_bw() and call icc_set_bw() directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 809c93b22c9c..eed96976e260 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -74,14 +74,6 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 	return 0;
 }
 
-static void msm_mdss_icc_request_bw(struct msm_mdss *msm_mdss, unsigned long bw)
-{
-	int i;
-
-	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
-		icc_set_bw(msm_mdss->mdp_path[i], 0, Bps_to_icc(bw));
-}
-
 static void msm_mdss_irq(struct irq_desc *desc)
 {
 	struct msm_mdss *msm_mdss = irq_desc_get_handler_data(desc);
@@ -229,14 +221,15 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 
 static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 {
-	int ret;
+	int ret, i;
 
 	/*
 	 * Several components have AXI clocks that can only be turned on if
 	 * the interconnect is enabled (non-zero bandwidth). Let's make sure
 	 * that the interconnects are at least at a minimum amount.
 	 */
-	msm_mdss_icc_request_bw(msm_mdss, MIN_IB_BW);
+	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
+		icc_set_bw(msm_mdss->mdp_path[i], 0, Bps_to_icc(MIN_IB_BW));
 
 	ret = clk_bulk_prepare_enable(msm_mdss->num_clocks, msm_mdss->clocks);
 	if (ret) {
@@ -284,8 +277,12 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 
 static int msm_mdss_disable(struct msm_mdss *msm_mdss)
 {
+	int i;
+
 	clk_bulk_disable_unprepare(msm_mdss->num_clocks, msm_mdss->clocks);
-	msm_mdss_icc_request_bw(msm_mdss, 0);
+
+	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
+		icc_set_bw(msm_mdss->mdp_path[i], 0, 0);
 
 	return 0;
 }
-- 
2.40.1

