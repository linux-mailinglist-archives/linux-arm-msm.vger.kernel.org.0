Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6DF3736AFC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 13:30:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232568AbjFTLaU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jun 2023 07:30:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232677AbjFTLaL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jun 2023 07:30:11 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EC2D130
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 04:30:07 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f883420152so1231662e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 04:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687260603; x=1689852603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mvj4Ws5lfpRkepZDTp/39wphy6EdJ013fn+mBz94DMg=;
        b=MbGQYduFNJMlpq71oNbfIylCEuMuMKZ2l0XzU8mFm+OFEGcP3WDjjh67j0j1jC87C8
         pYTHIQ/yvYrTj2pV4dMUjTJ6UTZXnbiWSQ8Bcqd5BEDSrCkiXMSYAGlCH9JFLDwe2Q7Y
         mFCRwPSLgLb5cvi1gzHZgJ+N4txzBsG/JA5MZbQ+3z6ZLyd9KK3U4BOT+yMswRus/yR3
         rsqZMTMW3mA+7fLlIRTcYW+jhhL8ZNAl9/zAZDWhWD7YgcIAm5rWZ+XC1P5AZvvYcyyU
         2uIaTnnDWx8PtkZFzMshkywp4fa254N2NrXrHNJNMC5bCB9I0vwDSuLrBYweWNSdDVKl
         fmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687260603; x=1689852603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mvj4Ws5lfpRkepZDTp/39wphy6EdJ013fn+mBz94DMg=;
        b=BsntMkK9xGWcCZAYBqttUOdrcH8f+E6An8J5+oreK4INhBvfPxf+Ro+gOV5WliEeHy
         bxQtDzAdus5ishCkFnYm9KvVi7FFHEN1E40hxfbNj5IMYrS4QQnMUl0arBD6+qi65SNL
         6PMtZOpkt5QaSw92DOCNlQVpcmYYZpHzuF4plLJlrh4sneqCS2eVCiEgGqI3JDazxiLO
         +bzNL0D2L2aPPId/cx6GPCK3FQEO5anideObR2LEFoaSvsDYSE5DC7Z5oIGs4H5lUQ3X
         kL9Sw4WUYYJhcbonA7GAzr26V7wmLnE2/ZvlrM//aS9pJV7NJLTtottq0zlwxGTfu6jj
         pAjA==
X-Gm-Message-State: AC+VfDza42K+Tw7Qpl1YvwPxHPP4/vmPWrlOK5nvZLI1tNXH7zXj1Jbg
        wAHv+ljcadz4OXvSsOQSypwXxQ==
X-Google-Smtp-Source: ACHHUZ6ED/zWchOlt8YalqHTrP43Ype8jf/mpfCxQFHrsHIEf3K8XmAOEKaItoY4Q9L1P78PA+TQUA==
X-Received: by 2002:a05:6512:b0e:b0:4f8:54f3:a6c0 with SMTP id w14-20020a0565120b0e00b004f854f3a6c0mr7225414lfu.11.1687260603553;
        Tue, 20 Jun 2023 04:30:03 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
        by smtp.gmail.com with ESMTPSA id 8-20020ac24828000000b004eed8de597csm335709lft.32.2023.06.20.04.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 04:30:03 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 20 Jun 2023 13:29:58 +0200
Subject: [PATCH 1/2] drm/msm/dsi: Use pm_runtime_resume_and_get to prevent
 refcnt leaks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230620-topic-dsiphy_rpm-v1-1-446a7fd0ce43@linaro.org>
References: <20230620-topic-dsiphy_rpm-v1-0-446a7fd0ce43@linaro.org>
In-Reply-To: <20230620-topic-dsiphy_rpm-v1-0-446a7fd0ce43@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687260601; l=756;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=p+WuOmdprSDjusI/rvtFLxmtLwQxfj48jFs663vX5YQ=;
 b=FXvuUQg/5YWokhed8hsEyalTU7MwztoQeLbEK29H7mFag8FeR7dCHiJpMDyZtqenlstrvvDDB
 So/552dSW3VCVmtxh0gCXhw3vbmoCQ+QGVZWY9PrHc42lkTyes+CkvM
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This helper has been introduced to avoid programmer errors when using
pm_runtime_get, use it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 9d5795c58a98..0a8e1dd4509e 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -516,7 +516,7 @@ static int dsi_phy_enable_resource(struct msm_dsi_phy *phy)
 	struct device *dev = &phy->pdev->dev;
 	int ret;
 
-	pm_runtime_get_sync(dev);
+	pm_runtime_resume_and_get(dev);
 
 	ret = clk_prepare_enable(phy->ahb_clk);
 	if (ret) {

-- 
2.41.0

