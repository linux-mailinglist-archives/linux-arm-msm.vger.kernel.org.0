Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE7A789D9C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Aug 2023 13:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbjH0LvT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Aug 2023 07:51:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230113AbjH0LvB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Aug 2023 07:51:01 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F3B513E
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 04:50:53 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4ff93a7f230so2761901e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 04:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693137052; x=1693741852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UjiOOSIFD1BfoYfBPled7JeOTQXrWmcDLuPBL1ifAvE=;
        b=O+xSE724Xiu5eDk7sYPj5FiudsiSeK1M0DXA9G0H9f6HDa3mqnnaJvzIQJflxwGku/
         3xGS3Pc6fI0E2cCq45t67BeSLq+KzV+RIO+v/nWOCCqq2LVVb9SEKJFrhuG3MPSVMsA3
         0h4vwVgsgRDCu5uY6vAeME+fky81ORsygJQZrGQPne9dD/L05rpo0ewfdANLJ9JM969v
         psxb+n3CccYGt8iXYZASnS8keRmKr7znImqmP237eDDMndUANt2rMSz7eqd8Nv5TRGTe
         h12lr7IUMalaeAYWLkDDyXYmQyPHkZmZgcL/vN8ZLRwXEPHo4ckAyTo5njq92fu2jlOQ
         vRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693137052; x=1693741852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UjiOOSIFD1BfoYfBPled7JeOTQXrWmcDLuPBL1ifAvE=;
        b=ODkne2Vm9MNHtcpwhcQ4EoFuThgqpQ++PLTp/RW8HjynhMPENCzKb7ePZEwicaius9
         RXLprSveTvyjEU4n8czZUyx5B+LXIKixTLEoh3bAao/t5KxLDEaEcASfAsSH8qtLYl4C
         9NtXBTIskswDYaXAGLgGvTYMCERfCPvSBCQdq+EpHvhmTBgdOuq62YHDuP8AIly9FjRc
         N2IYRzTY/z8BTfQhx+7uCgzRtlgwar4I0w3BEi0VheYh/Mj1G9nJLKPYu74spo5wgqxc
         l8YZNbPvTErgfOOxYgDVW+Wg+t92Bfi8DHTab4rieyUyyb7G7h7kWElymFTpItYp7eyo
         fUHQ==
X-Gm-Message-State: AOJu0YyYpD/RNLiCB/SjMfVdrJ/usMReBco2izEsut3JWuzIGV05/Eps
        h/0ivclJSH/bWKPqM6sS7IGEwA==
X-Google-Smtp-Source: AGHT+IEE9Bq1tj1Yh5sCK7VPOaAq3m0fBmoO5Fz+8uN1sbCirrWxtwQeJb1kc4gxaz0nYH6PU1fpBw==
X-Received: by 2002:a05:6512:282c:b0:4fe:28cd:b3f with SMTP id cf44-20020a056512282c00b004fe28cd0b3fmr7875063lfb.5.1693137051965;
        Sun, 27 Aug 2023 04:50:51 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a8-20020a19f808000000b004ff9f88b86esm1114770lff.308.2023.08.27.04.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 04:50:51 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v4 21/23] ARM: dts: qcom: msm8974: drop 'regulator' property from SAW2 device
Date:   Sun, 27 Aug 2023 14:50:31 +0300
Message-Id: <20230827115033.935089-22-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827115033.935089-1-dmitry.baryshkov@linaro.org>
References: <20230827115033.935089-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SAW2 device should describe the regulator constraints rather than
just declaring that it has the regulator.

Drop the 'regulator' property. If/when CPU voltage scaling is
implemented for this platform, proper regulator node show be added
instead.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
index d54be72fe3b2..7d844236de0f 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
@@ -416,7 +416,6 @@ saw3: power-controller@f90b9000 {
 		saw_l2: power-controller@f9012000 {
 			compatible = "qcom,saw2";
 			reg = <0xf9012000 0x1000>;
-			regulator;
 		};
 
 		acc0: power-manager@f9088000 {
-- 
2.39.2

