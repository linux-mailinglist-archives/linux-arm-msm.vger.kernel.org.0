Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D927F518F3C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 May 2022 22:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240944AbiECUrT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 May 2022 16:47:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240426AbiECUrQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 May 2022 16:47:16 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F2742C114
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 May 2022 13:43:43 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id x17so32253004lfa.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 May 2022 13:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BZXNy598rjzssFVD4qqnZnAbN1Mi7pj3r4jBP97stCk=;
        b=aFed9C8zIczapSE4riexLt2XAw8h3LYQtY5IQY+ksLkEQDCcFzc3V2U5C6ZMNPZ7n7
         68cmZlUPlcNdgurL+47g3j2gXWj4TOkuqvnfAD7dCX0oaFic5IVB8WTPSo1TJuXuS9Bn
         esBKOdtY7tZdfwmU8BbKO4h4toxuHjZcJh//BAJskyrJWgwIUTcmtNB+Nki2SAt1A0f5
         je/otKYLIQsudjFd94fhdlWhb7X9bf4Xk8Yb2Z319l+5BmthjB4mwdtyMa2U54SY/E8y
         gQJapgBBtiSqPqupZVt0Ly9ligt/FhpgKarnSDDrtt37sqkElSdhHayhWX0I+qS6ni0l
         Tdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BZXNy598rjzssFVD4qqnZnAbN1Mi7pj3r4jBP97stCk=;
        b=stf++q1QHLHn4P8Y1XurXXKpxYAExIjohBR+xXGu8skHtPqUMmDj2au/sZGRlhZtxK
         toebDwpHb87yh3IIYEqXecTm+wpFUUTT44C8Sy+THEj7pmTZMYwb25QIsfW3QBMZBV4u
         KlPENLsUatrkwaOiSV8ws0zUgp7+asY6ttOALI0CDfz0m4caXpqoU2k+J+0d0u0j4uCa
         dWdEcAvyigSpTDmw4ii3QgOXPSQpYERD8SPyP2UYdjb5tqiXKaD4Okx61sbQd/ZuYjvO
         TWb6FvpoYwQnvLqbjvg5OQ+KzIx/6lKoZjCSbtNFWf7SB2jB9KLau1isW42DXerDaeae
         cgQg==
X-Gm-Message-State: AOAM532mYUwIn9WsmGXgHKiRPiDTjD2b/84qp+SQdaYaOYT3L6gd09Oh
        ATxpR578Yrb/IWxOi0Bgvhki6Q==
X-Google-Smtp-Source: ABdhPJz6J5roxRVpi41gL6zeVD4OzrjgvjOG0MNPEhPP+HQNkQ/eKSYLNbmKQDvh4Lzaa/I+Gt7ptQ==
X-Received: by 2002:a05:6512:a85:b0:473:bb9e:fc51 with SMTP id m5-20020a0565120a8500b00473bb9efc51mr278231lfu.31.1651610621680;
        Tue, 03 May 2022 13:43:41 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 5-20020a2eb945000000b0024f3d1dae81sm1462085ljs.9.2022.05.03.13.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 13:43:41 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH] drm/msm/dsi: fix address for second DSI PHY on SDM660
Date:   Tue,  3 May 2022 23:43:40 +0300
Message-Id: <20220503204340.935532-1-dmitry.baryshkov@linaro.org>
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

Correct a typo in the address of the second DSI PHY in the SDM660 device
config.

Fixes: 694dd304cc29 ("drm/msm/dsi: Add phy configuration for SDM630/636/660")
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 75557ac99adf..8199c53567f4 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -1062,7 +1062,7 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
-	.io_start = { 0xc994400, 0xc996000 },
+	.io_start = { 0xc994400, 0xc996400 },
 	.num_dsi_phy = 2,
 };
 
-- 
2.35.1

