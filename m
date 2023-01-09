Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E700C661BAB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 01:52:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233243AbjAIAwo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 19:52:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233618AbjAIAwQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 19:52:16 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A072E015
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 16:52:15 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id bp15so10646896lfb.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 16:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4uu4F/k5vd4NQbSmvcQw6ut2k1ijXfUkjfwzgMFejyc=;
        b=Bo46pHwPX69onKQZ8jx0IHLYKp37YqOGNF4eymdiZjGO4zBxlwJPVcSnSjShLTbTos
         73e4VpgJqLoXB/6ZxGd7Na52CHuygcjfn25U374x64ewj6etfXBmEONV73XYRMtISHOk
         MwyMe0ipylgor7p66EHO/n1NxyucSbPvGN52cVpOiN7L9jEovnLrXYVFhjHd9vxH/uOQ
         FVf1q/QGsoAb1/SYk8wzAVpJY4WfHxM8EMnhyfcbEraUGUiMT/ySaqWw3aabWh35ZyT/
         s7VvrQctWHFbruCV6MYujIGel04cn0sCkW9DJv1/MuE1eSaDY22/dwhkvTLA4OAnmiHC
         axfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4uu4F/k5vd4NQbSmvcQw6ut2k1ijXfUkjfwzgMFejyc=;
        b=Jcw0zd5I2TY55l2KvwNlZDGeVxL40tUO+OyXZDoyycITxV02fM9V8N6Fo8t7sL12Rp
         NWJBk1uynPxmMCTZTbPphgi8qOUnIXPsUAi6E7EyaWLaLjycQE4yZLY4T2pW/UuGVvyz
         M9c3DkQDNVw+s8gC3hNghs7lZkSfPnbhYuSRrrcy7/QCWws3r6m6wsL0hWmXhir8cedr
         6hXNyPOm6PPM4U9YAgbTLBtNH5ZzvLmvks0/5kkxP1IAbRnjrS2reyR4LUU+XVT9wuW5
         b00r8gNm3ygNosy6QLVhadH2O9js5DXbgsT9dCgBxYKx8rmi9geQtJUGunWRwHoqxIPd
         cwLg==
X-Gm-Message-State: AFqh2kpSMuLFneIxCg6F23JEA3x+TzBQIRstxD4KIBAEfjFqgZMMbUKq
        MksCCErnJzoGSETngy4M9ZqFPg==
X-Google-Smtp-Source: AMrXdXvgRtcDfuvPqFNuShwGXKIQ+MEm36OCL7bpDrS6dSfi3ewnByYxCtPGEy7VtToZkbwXqyNURg==
X-Received: by 2002:a05:6512:110c:b0:4cc:586b:1837 with SMTP id l12-20020a056512110c00b004cc586b1837mr4526052lfg.16.1673225533458;
        Sun, 08 Jan 2023 16:52:13 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c25-20020ac25f79000000b00494643db68fsm1317493lfc.81.2023.01.08.16.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 16:52:12 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 4/4] drm/msm/mdss: move is_mdp5 condition to msm_mdss_init
Date:   Mon,  9 Jan 2023 02:52:09 +0200
Message-Id: <20230109005209.247356-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109005209.247356-1-dmitry.baryshkov@linaro.org>
References: <20230109005209.247356-1-dmitry.baryshkov@linaro.org>
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

Move is_mdp5 check to a more logical place, to the msm_mdss_init(),
rather than getting it in the mdss_probe() and passing it then as an
argument.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index ce554f2c2e02..c2ef50c3101b 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -396,8 +396,9 @@ static int mdp5_mdss_parse_clock(struct platform_device *pdev, struct clk_bulk_d
 	return num_clocks;
 }
 
-static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5)
+static struct msm_mdss *msm_mdss_init(struct platform_device *pdev)
 {
+	bool is_mdp5 = of_device_is_compatible(pdev->dev.of_node, "qcom,mdss");
 	struct msm_mdss *msm_mdss;
 	int ret;
 	int irq;
@@ -494,11 +495,10 @@ static const struct dev_pm_ops mdss_pm_ops = {
 static int mdss_probe(struct platform_device *pdev)
 {
 	struct msm_mdss *mdss;
-	bool is_mdp5 = of_device_is_compatible(pdev->dev.of_node, "qcom,mdss");
 	struct device *dev = &pdev->dev;
 	int ret;
 
-	mdss = msm_mdss_init(pdev, is_mdp5);
+	mdss = msm_mdss_init(pdev);
 	if (IS_ERR(mdss))
 		return PTR_ERR(mdss);
 
-- 
2.39.0

