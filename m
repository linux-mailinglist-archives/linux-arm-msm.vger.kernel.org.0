Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B7A96F9D06
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 02:33:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232026AbjEHAdV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 7 May 2023 20:33:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232087AbjEHAdR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 7 May 2023 20:33:17 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0656F9037
        for <linux-arm-msm@vger.kernel.org>; Sun,  7 May 2023 17:33:14 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f24ceae142so900856e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 May 2023 17:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683505992; x=1686097992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60+RN5IXt2QTmhFV4LWN/OmeuPm2E4Pe1J71Zr5me3w=;
        b=VRc/4nSOlsan7d95XurHx2XuEyg2u4WeTOOrMobCoystpLkzP7H4oOUHrAwulYkjT8
         Ga6Tky/TcYzYOJvnoDyXB68K28tjtt3Pw2XOU0s+c6dqpD17Q6TcJooWMay/6yxKzqD4
         pD4rjXO5GP4IdG8J8GE6pNBe9QCNC7Lz+O616dV+4hnV/2q08dFoaVczjDScxr6+CoGq
         yi0fhJl7rRiJEu6MQmkrhc7OY9ULn0kLipL1+TM/AgsraxVDEm9p/KfwucBQDalB4IzL
         4nGmjARqWezxExK/KuPVH1ljHkrjeCFCG4eyAIZCpxZc+6pOrdwzWWj9VyOTfD2fKgGI
         yk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683505992; x=1686097992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=60+RN5IXt2QTmhFV4LWN/OmeuPm2E4Pe1J71Zr5me3w=;
        b=DuoOsFpQ4goo0gJtsog0QTMcV1EtziIid00VgF9J6zSdh0pnonOYlsZsFnywZUhp5B
         BtcgzhaIjLuWW2jNxuZoru7a/SrxXqqkicJrE7aueWR7bcxc25ZVGjWNHF2to0hMg+fT
         5MVcC3hEHOxmEl1nu5ryi9jrMvxFsKydvrEFJdqQXW9CdiIG/ZyQN9OXZJzroyiq5NZ1
         mSJ9fcHE9t9+GP2Epy4cUrgLCUZ/Uh3quq9yxC9ZVJEC3P9fvTqtSbjbbbOGWqE3nmDf
         B3SUp+lvzymFLjSBDdyC09+MoFsdLPruHkV057tfACjPPW8v/4cQVazJIrBLOKWT+LsN
         sHHw==
X-Gm-Message-State: AC+VfDwE+XCNyTC4M7fbNBXd8yxRbDBeTg8Vh3Rlld7R+clMlvjMtXZf
        9OwNY5v2fiMJDlBA+UvsyjiqqQ==
X-Google-Smtp-Source: ACHHUZ56IuHCb9krnV3H/zXiOep0NRvIJfd3WAi6IPzpjviYdMipBpeWAdBdOwYbLXyEEfklfQhRVQ==
X-Received: by 2002:a19:ae06:0:b0:4db:3927:e2bc with SMTP id f6-20020a19ae06000000b004db3927e2bcmr1993106lfc.50.1683505992334;
        Sun, 07 May 2023 17:33:12 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id m22-20020ac24256000000b004eca2b8b6bdsm1114807lfl.4.2023.05.07.17.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 17:33:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 3/6] ARM: dts: qcom-pm8941: add resin support
Date:   Mon,  8 May 2023 03:33:06 +0300
Message-Id: <20230508003309.2363787-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508003309.2363787-1-dmitry.baryshkov@linaro.org>
References: <20230508003309.2363787-1-dmitry.baryshkov@linaro.org>
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

Wrap existing pwrkey and new resin nodes into the new pon node to enable
volume-down key support on platforms using pm8941 PMIC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-pm8941.dtsi | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-pm8941.dtsi b/arch/arm/boot/dts/qcom-pm8941.dtsi
index a821f0368a28..ce30946ccf58 100644
--- a/arch/arm/boot/dts/qcom-pm8941.dtsi
+++ b/arch/arm/boot/dts/qcom-pm8941.dtsi
@@ -19,12 +19,24 @@ rtc@6000 {
 			interrupts = <0x0 0x61 0x1 IRQ_TYPE_EDGE_RISING>;
 		};
 
-		pwrkey@800 {
-			compatible = "qcom,pm8941-pwrkey";
+		pon@800 {
+			compatible = "qcom,pm8916-pon";
 			reg = <0x800>;
-			interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
-			debounce = <15625>;
-			bias-pull-up;
+
+			pwrkey {
+				compatible = "qcom,pm8941-pwrkey";
+				interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
+				debounce = <15625>;
+				bias-pull-up;
+			};
+
+			pm8941_resin: resin {
+				compatible = "qcom,pm8941-resin";
+				interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
+				debounce = <15625>;
+				bias-pull-up;
+				status = "disabled";
+			};
 		};
 
 		usb_id: usb-detect@900 {
-- 
2.39.2

