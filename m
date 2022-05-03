Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7905551912B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 00:16:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243521AbiECWNF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 May 2022 18:13:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbiECWNE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 May 2022 18:13:04 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F377E41FA5
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 May 2022 15:09:30 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id x33so32610136lfu.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 May 2022 15:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8d3RGh9WkfDhENWItVe4+i9I4wBo7gJQ8zcDZXErACs=;
        b=fp9e8vWtPhWYoJSMyWyhSYZFwQcE5G0BmzwKfQnXa3IizGILaodCM2kCrCDAQOU5N8
         J4PAqS6z0fzd1pOmDvu7qnorwqUC4RcGuSBHtiniS1RkbAyyMQPdsx3zO3ymZyy70QxR
         VOxVCyB/iB600VFPzVS/3E2JtH4IWnSnlZJTQEuAubbB9Zvcad7bSnqZziAY+Cq+w9b3
         QMXOEwhkvQdlgSe9J0pfqokcRmmBieMXjVyE2KAm+4qNEUbIEm1/QSw4yOVBKhnAAxvA
         XjmI1Y971C5VPwk1MGN99KoG6zF3SDzMAWLLnT2QQeTGh3QUmphtw2Iygq2Lb6iXLGCp
         n3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8d3RGh9WkfDhENWItVe4+i9I4wBo7gJQ8zcDZXErACs=;
        b=esjhRAbpmTMiPWpNrp2PC5cB4yF+m9j9Z7FLZtNtEXD6CY0JgsFCLwTVFL9kl/exY8
         ZEwPtHfNMKTxgpU7G4OcL/wKZJIV10KyU9E0NHn5VhW/1xF9fZZPO+a7bVQkwMUN04BH
         XsMIKapwWNUTVojY34xrEzBrk0BFVB6msvyGPm8NNI0g/7vfyhMNUuNW+wCFCemUD+AY
         6VY++g6VsMZJreyp6mMkQ8AU9tCXI9kUAv963gQ7+6cURozVrETPP9FVvjFNz7OPD4PG
         +nYY7L3iEIdTy4/mJpydC7jkNXe5uJjuFJdCXfaoG3p+at7rvLMBZY5cSqM26z/Zeb6/
         AAIw==
X-Gm-Message-State: AOAM530p+2Qbww4wleTk853K9HHVkhEWQ4JOoyeWuY7T3tAvdY3WWCUn
        BJEgWdzGyUops7egcVW2xITiCem/Ohkowg==
X-Google-Smtp-Source: ABdhPJwDI76iB5KpVm2ek7OwtcHAL8fWRtoreJkZj3rEK9npOeQ5roXQY9sHMoTBXlrvPoJyxiQYtg==
X-Received: by 2002:ac2:5b0f:0:b0:472:82f:2537 with SMTP id v15-20020ac25b0f000000b00472082f2537mr12592871lfn.0.1651615769335;
        Tue, 03 May 2022 15:09:29 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j9-20020ac24549000000b0047255d2111bsm1042349lfm.74.2022.05.03.15.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 15:09:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v1 1/5] arm64: dts: qcom: sdm660: disable dsi1/dsi1_phy by default
Date:   Wed,  4 May 2022 01:09:23 +0300
Message-Id: <20220503220927.960821-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503220927.960821-1-dmitry.baryshkov@linaro.org>
References: <20220503220927.960821-1-dmitry.baryshkov@linaro.org>
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

Follow the typical practice and keep DSI1/DSI1 PHY disabled by default.
They should be enabled in the board DT files. No existing boards use
them at this moment.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index eccf6fde16b4..023b0ac4118c 100644
--- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -192,6 +192,8 @@ dsi1: dsi@c996000 {
 		phys = <&dsi1_phy>;
 		phy-names = "dsi";
 
+		status = "disabled";
+
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -225,6 +227,7 @@ dsi1_phy: dsi-phy@c996400 {
 
 		clocks = <&mmcc MDSS_AHB_CLK>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
 		clock-names = "iface", "ref";
+		status = "disabled";
 	};
 };
 
-- 
2.35.1

