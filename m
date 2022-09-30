Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69A375F11F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 20:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232383AbiI3Swz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 14:52:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232375AbiI3Swv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 14:52:51 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE2BF16649D
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:49 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id q14so1464274lfo.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=lHUkKbcRju/Un3XDg1sWJSqtXcJEPCkBM+PZRvvNsmI=;
        b=T5+Nx+S5kTIR+P9NKv17Gq7DewekPWggO0p9aicD0PncZPKUEpXMpUM5ir7dX0MyAk
         XloB+caHCcPtf/4CaDegNZWKGhsMdQO1n1v+Hz+gT+L1B34Wax0xnHbg+o2KsAVUi/FG
         k2EIiX8c+r5IYE05RUKQf033ljljxRTsDkyAHOwmqVn0E3+5Cd+KvYxgnEcGG30TlSjl
         3H2eBE6UgShwLyyXSX1hvfTE0BA6MqlSBiwBybC7XE4dfT3qE8D2EATO2AlTk6Fo9DYF
         bZTnSHpTi8ggAYVNdX3pmxudF9iZXcGCvuh1ktPA6gq3Em/UhcDOzHZcqzQ59uo7txpA
         xhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=lHUkKbcRju/Un3XDg1sWJSqtXcJEPCkBM+PZRvvNsmI=;
        b=1WQO/KEEvgYCZStGur3Nxx9nJEKl2pz/g9K3eaRo4Xm2eCWeKzI65MTh7jri4ucY3M
         vjuPwC2J3U36CDQoBYWPTq2KJVDi/y2ayG0Rk6XC0hiBwxJIXzDTVnBb/cLkxXlDCQs0
         PqYdJJkCSTkorO0G2A1hENotjWFfWaFjpA0kPEY1r2CZIi09NMX9bPNlcffzqHhZpxpf
         uFeiHW5tmBiMDpNkilVUrlGO3xecnPc+rjmnddQ+A7nL/YnEEZv/jc8Lxim8eaQPFgzF
         HD0xCcrxn0F4q2gXWuLtfxRCMYKN+R/CxuroOJTOns82B+St5lbHxN6lLLDxCgSSiCW3
         6L9A==
X-Gm-Message-State: ACrzQf2+CZ8+H4l1jh2zCWY1CyvQT2dVsRhjTWty8mfuJTJQzItCKDqq
        iAFRdkEqIPU/FRQ1CZSEXGHweA==
X-Google-Smtp-Source: AMsMyM5tCEiU/KefWobPHFh6OULiMTKovrr/+LO2uhf6V01t6+vH4X58b3jnElwLFwPQuWrZP4cczg==
X-Received: by 2002:a05:6512:234b:b0:4a2:f31:9ce2 with SMTP id p11-20020a056512234b00b004a20f319ce2mr2398036lfu.219.1664563967887;
        Fri, 30 Sep 2022 11:52:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i8-20020a056512006800b00492cfecf1c0sm374703lfo.245.2022.09.30.11.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 11:52:47 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 14/23] ARM: dts: qcom: apq8064: drop qcom, prefix from SSBI node name
Date:   Fri, 30 Sep 2022 21:52:27 +0300
Message-Id: <20220930185236.867655-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
References: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 6a8f3fd0fcc3..be4c82945c53 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -693,7 +693,7 @@ pm8821_mpps: mpps@50 {
 			};
 		};
 
-		qcom,ssbi@500000 {
+		ssbi@500000 {
 			compatible = "qcom,ssbi";
 			reg = <0x00500000 0x1000>;
 			qcom,controller-type = "pmic-arbiter";
-- 
2.35.1

