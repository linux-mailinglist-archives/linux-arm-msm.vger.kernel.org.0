Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 892885B17DE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 10:58:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbiIHI6m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 04:58:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231713AbiIHI6g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 04:58:36 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01F60F775F
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 01:58:35 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id z20so19070363ljq.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 01:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=jhsX+3/ZSrQLWbkIR9R09MJjTx2RHdKDwk2l4SWRmW4=;
        b=KLOITiWeQfLiMQ9kcV6GcIi+KtsV4KcxAP95Z9/z/aJoKuOyKaa/7c/ANDOl908hBl
         uCvaTIgNFjX62UOqkmBy7cmyMIgK1u3CQjcrOYteBIXXaulOxaMGOTGmpf8nWrfzUHkA
         ddhojYNk1qFm0v5Pgt/9N4K0rA7q58NqABxvrkIQm/BU/WvG39XrqUW9Dtwk1RsiprkF
         dk+uzC9JDE7K7UYG9d7sYMOj/pSo4jhKLkeGmJ2J4ifWigd+/h287QrdoPHA8+QZEgZF
         Z7VuTJIlfZgtadfQ4xThgukosQtecmf66e5sSu48Cs5qfajk8Q0Ysh15Cr24mtMyyXWX
         HgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=jhsX+3/ZSrQLWbkIR9R09MJjTx2RHdKDwk2l4SWRmW4=;
        b=c/xPQWCuspHnK+DbX1sSpQ87pwtzLnyYv6fJMeBG+oztM3U0J6GEWCeUyt9OrxtgUz
         7kX+qG8P1oY/++XFM2G+AFVeciKc08GaWApaX27/ldy0OoJryF+m3JdrXXJWBBgGPPcs
         eNOnc4ssXAV+RihbL6Lv5tOWE9TRTn6B+pqjhGSeBBzkhlB2QP0v5N+prdxWxYxFbXc6
         RzGYvLljvlvEb5/T4aZX9QORy8/RK8ZH+0Pdg0gOH76k2qK4RWtuFiUE3W3haKxjpO2g
         ZIltXBXPNponUn8mSaiYAgJ6EhKgdMRZQnGrJ4GbD3w/88reKm4NzZ1qAO/Y6ubE+NJX
         2Geg==
X-Gm-Message-State: ACgBeo0aKHJCDfxoM4xUeHQ2WFXGzwrPm+a3LHo84Ax6i6RYaesSNh5b
        Asu/5XsgnkCB1glZpx/Z8vcvTw==
X-Google-Smtp-Source: AA6agR7jYGTkfjAN8kshYYAM6/Y8Ns61ZfYj030nyqiiiEqZsQL2IxAX9BcGKeaDPUPDn+nCKIs51A==
X-Received: by 2002:a2e:8509:0:b0:26a:c954:978c with SMTP id j9-20020a2e8509000000b0026ac954978cmr2260829lji.471.1662627513360;
        Thu, 08 Sep 2022 01:58:33 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t16-20020a056512209000b0048aef1abb08sm2936677lfr.297.2022.09.08.01.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 01:58:32 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH] arm64: dts: qcom: sc7280: correct CPU BWMON unit address
Date:   Thu,  8 Sep 2022 10:58:30 +0200
Message-Id: <20220908085830.39141-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Correct CPU BWMON unit address to match the "reg" property.

Reported-by: Stephen Boyd <swboyd@chromium.org>
Fixes: b2f3eac1b77c ("arm64: dts: qcom: sc7280: Add cpu and llcc BWMON")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Fixes tag for commit in current Bjorn's for-next.
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index ad04025a8a1a..a58916009281 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3328,7 +3328,7 @@ opp-7 {
 			};
 		};
 
-		pmu@90b6000 {
+		pmu@90b6400 {
 			compatible = "qcom,sc7280-cpu-bwmon", "qcom,msm8998-bwmon";
 			reg = <0 0x090b6400 0 0x600>;
 
-- 
2.34.1

