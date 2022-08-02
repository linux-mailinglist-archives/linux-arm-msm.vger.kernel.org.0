Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E334B587F11
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Aug 2022 17:40:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbiHBPkI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Aug 2022 11:40:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbiHBPkF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Aug 2022 11:40:05 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9EC11D0ED
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Aug 2022 08:40:03 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id v7so8392177ljh.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Aug 2022 08:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pKFMxLdzMMCmBAvAMafde7KAO0riCXoUd+kCG04d3r8=;
        b=WtXCGVaCBrGBE93teWIHaijjVyU+aUP1RhNj0/CkHurBb4Zgt5as+KR7yghEspuKJB
         rQ6vRfSExnf5CGaCrK8f1d3uuq7Z8cQKIrJWBw/VcpD8P19exHEK0BeIkWObSJI+coVW
         TQW0dEmphVcIJMCXXLgGB0liy7FWSHNhfAhFjKeUA2m1b0jzs4CfHO0vRivedp69o1MQ
         43ENEbXQNBM+bz5DmjT7sw5dJNSgODV28Ii3JMEmgkvUjsbideGva2+cfZrgl5COXnpU
         re2mNMDVV5x6KWRzGy2Kx1x6vZrMueTWX5tJFYkk0czVG1h9UUioEaE8dVahmEZX849G
         akYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pKFMxLdzMMCmBAvAMafde7KAO0riCXoUd+kCG04d3r8=;
        b=EsNlP6eoZBsmJfdlhTT9n03osuU308FORV1My3dmSgF34en7hzDJe5jyA/9t7/bLbY
         WcZphIhEuvGHiROO5RZqY16m39DkhtUr9BN/5gvosTW5uAo12lWfeR2PZJuo8fTOtHms
         tvV9/zPNZHrQ1uk280UO2gQ7IIzp9d+dMTtr/P0Nk9hbVNAOig9jPZh31U/CLtsXRvMn
         1MLFtVIWwdFi+f2NCgFIAPH/Fz4nKccz3B+bnFroHWyQqrWoWpGYytlkow+4qDw5SdPc
         dA0PzAvmHruv3BCB31TB1TiIzgJazVG4kNz7gAar3+Y1i5bPPtxRB/+YtqlNXoNEOQer
         uhew==
X-Gm-Message-State: AJIora+sTV4p+jOgTDdKQuLCZHjSRy4mhnHEwrS7sfQnpyd/SgTjZQZY
        DreGMiVcl4lOzgBtLz0IWF5IWA==
X-Google-Smtp-Source: AGRyM1uRTYMK1JhX8SYxG08TsaYXt/wJd0IECVQqxWGt0vLTkj44kGBQdgj6J068T+zNhgw77IDwng==
X-Received: by 2002:a2e:84ca:0:b0:25d:77e0:2566 with SMTP id q10-20020a2e84ca000000b0025d77e02566mr7165001ljh.78.1659454801856;
        Tue, 02 Aug 2022 08:40:01 -0700 (PDT)
Received: from krzk-bin.. ([213.161.169.44])
        by smtp.gmail.com with ESMTPSA id c2-20020a056512074200b0048b06f34566sm407669lfs.76.2022.08.02.08.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 08:40:01 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     corbet@lwn.net,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/5] arm64: dts: qcom: sdm845-db845c: drop power-domains from CCI I2C sensors
Date:   Tue,  2 Aug 2022 17:39:43 +0200
Message-Id: <20220802153947.44457-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220802153947.44457-1-krzysztof.kozlowski@linaro.org>
References: <20220802153947.44457-1-krzysztof.kozlowski@linaro.org>
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

The Camera Control Interface I2C controller device node belongs to
TITAN_TOP_GDSC power domain, so its children do not need to specify it
again.  The OV7251 and OV8856 camera sensor bindings do not allow
power-domains.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not tested on hardware.
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index c6e2c571b452..b9304f81290a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -1228,8 +1228,6 @@ camera@10 {
 		 * both have to be enabled through the power management
 		 * gpios.
 		 */
-		power-domains = <&clock_camcc TITAN_TOP_GDSC>;
-
 		dovdd-supply = <&vreg_lvs1a_1p8>;
 		avdd-supply = <&cam0_avdd_2v8>;
 		dvdd-supply = <&cam0_dvdd_1v2>;
@@ -1273,8 +1271,6 @@ camera@60 {
 		 *
 		 * No 1.2V vddd-supply regulator is used.
 		 */
-		power-domains = <&clock_camcc TITAN_TOP_GDSC>;
-
 		vdddo-supply = <&vreg_lvs1a_1p8>;
 		vdda-supply = <&cam3_avdd_2v8>;
 
-- 
2.34.1

