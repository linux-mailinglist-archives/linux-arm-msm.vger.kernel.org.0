Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A53995ECB0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 19:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233059AbiI0RiW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 13:38:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232788AbiI0Rh4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 13:37:56 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E14341DADC6
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 10:37:53 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id bu25so14894546lfb.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 10:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=KZq/VCOTUDh8d3vinjVf9ILpIBpS9jWKM4jmHbH7DA0=;
        b=tO2/pCx8JS42OyCSh+yEYIt+He7OGI5Az5S5+uxIAgpdvIsulXPyzfEfwvzvNjn9o2
         nmvkEQkJmn1uFzFwVj2qxuTXI1/icSwakFT/I0ei8YOZJnhPsu3bZxNJUIJYG5GFRCWB
         kdWK78rh8C8PueC8/Y25uPWB2u7ZeR3ik+prhwbN2vXcg3fIX+mYC3CistHYV3NoSic0
         VWNVjAxvDLWrWWguHkkCS0WzL8UZdRA/6IYcOaGNZHS0toSlB5jyWxW2kcxmXrvOYbAS
         jNFhVyvlT1cYh9fXecTQiCtGeqM1QOlR1USQL31Vai22eaVZKMBYJhERwbi+mnpdMfVE
         FxDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=KZq/VCOTUDh8d3vinjVf9ILpIBpS9jWKM4jmHbH7DA0=;
        b=wtJXOiKwpwKXifhUFFnOnPXRw6KY7vqsZx/Dj8MFmC5d2wGTuiu5AhDm4EG55xh7yt
         GRllzl/GPYG0IWY5IzOW59MTWYADifqyuydv1eGZZPunFxt+x5tgXE3i6XXBe8DzWQps
         zsKPpIy9/pL1Q26iHSkhvRLI1suolQuDbOWwmud0NP1YTV5ZsgceGemywboEtHFWjuEH
         Gt51QQ23PyjZQwi3HWuzQw+le6Uhrn/A7d9OkAhhr5yS9IGDsPKhP33RHh0kgwhUZrom
         y8MIT1/qUSgHK7c7TeqChcXatd375iXxBlZZp1DhS+wa5OCm/VpEt6fvTJSOZgArx8Sp
         QzHw==
X-Gm-Message-State: ACrzQf3Vb8T2H8cN9lvobawjgGHinaW0Ij2X3T0F+ccr7Cy/jguzU4QH
        qQdKQFpXAtkOWajx2eEork9v9g==
X-Google-Smtp-Source: AMsMyM4hYR9bZgBkwkJolmXHbKiym4oVsu1h1wrs8QrL332ZOtTHrdCmNZydXniMXPcJEtxOyOdXXQ==
X-Received: by 2002:a05:6512:1195:b0:4a1:e2ef:adbe with SMTP id g21-20020a056512119500b004a1e2efadbemr3045291lfr.239.1664300272293;
        Tue, 27 Sep 2022 10:37:52 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q12-20020ac246ec000000b00498f570aef2sm218879lfo.209.2022.09.27.10.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 10:37:50 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 08/34] dt-bindings: pinctrl: qcom,ipq6018: add qpic_pad function
Date:   Tue, 27 Sep 2022 19:36:36 +0200
Message-Id: <20220927173702.5200-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
References: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
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

The IPQ6018 pinctrl driver supports qpic_pad and DTS already uses it:

  'qpic_pad' is not one of ['adsp_ext', 'alsp_int', 'atest_bbrx0', ...

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
---
 .../devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
index 9c6e2cb0c6a5..0bd1aded132d 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
@@ -92,9 +92,9 @@ patternProperties:
                 qdss_ctitrig_in_b0, qdss_ctitrig_in_b1, qdss_ctitrig_out_a0,
                 qdss_ctitrig_out_a1, qdss_ctitrig_out_b0, qdss_ctitrig_out_b1,
                 qdss_traceclk_a, qdss_traceclk_b, qdss_tracectl_a, qdss_tracectl_b,
-                qdss_tracedata_a, qdss_tracedata_b, reset_n, sd_card, sd_write,
-                sec_mi2s, smb_int, ssbi_wtr0, ssbi_wtr1, uim1, uim2, uim3,
-                uim_batt, wcss_bt, wcss_fm, wcss_wlan, webcam1_rst ]
+                qdss_tracedata_a, qdss_tracedata_b, qpic_pad, reset_n, sd_card,
+                sd_write, sec_mi2s, smb_int, ssbi_wtr0, ssbi_wtr1, uim1, uim2,
+                uim3, uim_batt, wcss_bt, wcss_fm, wcss_wlan, webcam1_rst ]
 
       drive-strength:
         enum: [2, 4, 6, 8, 10, 12, 14, 16]
-- 
2.34.1

