Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C21AB5FB969
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Oct 2022 19:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbiJKR2Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Oct 2022 13:28:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbiJKR1J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Oct 2022 13:27:09 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E12D66C773
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 10:26:41 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id m6so3834781qkm.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 10:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMNScuoSuEMPiNHi+5Y8YkXsd1atUOjn7L6LUFfL2LI=;
        b=xahOIuIv4uHNFb8gu9Dv1rsGt/y0vqeYA+aVf1AeQsJtyheXYmxp60TyRjI++XQQ8z
         QnPI7t/oEO1U37hKpPNaavzt/zsrVyLHX3UHMTbjdeQXzGFb4LGhhehp/YFL+Ql681Sg
         b10+dXDXRRxilK1fGPnp3pMM5XeNB/krBZTDt3WGwC9Sx8WyG8egjt2hOzTDtUSyZsBR
         lLRDEYnmGberK489ra0H+Wq8HDAUhcbzz8bNUpZ4b7XPnll/8YPQ1U/rFzCWmolm+mb6
         3PPNotiQ4606mDm/OJTEH+5r8U5FJ7PZsvMLMnP/GlRYgxR2Fm05YuQD7DvxWRslPAyX
         FGtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AMNScuoSuEMPiNHi+5Y8YkXsd1atUOjn7L6LUFfL2LI=;
        b=BQgYmsyO1K85St4aK7X/8b5qrBMHIHHFe8xidjw9jNrz8hohBT1irlUZY9KDzlgbIw
         fE8Jo+0rHfEg8vd+gHqjWPUvb/8jdYqSU1MoiyG7JKvT72CUPBAmmtTWfhPFhtRxkQfB
         X1j6j9uLK8l+/HgBEIrNiiZCIhBDraPMCeVX4VkHdCS70wCE7SLxne35HtgHCuJs6k22
         zV92eoImDU0UK6SrGVpGMWAPH3c3gapoenp2c8Dr/cKfFE2mqsR0ymiXRuewrtnvYzsO
         wS85zU+axro+eSKPoFVF9Ag1QXXXrjAdTxSQO+W4Qj67I6vX3X15JHhdyFlodZ2Is4RN
         YNXA==
X-Gm-Message-State: ACrzQf21x1CF7usMECr1dvrTJMOpgRaqDFTa4LSpWO6e19NQvIcolCjA
        cZwAsH0bWBj57RiDLfFKM6DKCQ==
X-Google-Smtp-Source: AMsMyM54RI8t8rj9oPEJ9uqhwiyZUWU1jvQuWUaytcsE8tVQRD5gWE6eetFe/LA8xTWX0+/n2BRUFw==
X-Received: by 2002:a05:620a:486:b0:6ec:543d:c32e with SMTP id 6-20020a05620a048600b006ec543dc32emr9619466qkr.161.1665509186744;
        Tue, 11 Oct 2022 10:26:26 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id i14-20020a05620a248e00b006bba46e5eeasm14289087qkn.37.2022.10.11.10.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 10:26:26 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 14/34] dt-bindings: pinctrl: qcom,sm8350: drop ref to pinctrl.yaml
Date:   Tue, 11 Oct 2022 13:23:38 -0400
Message-Id: <20221011172358.69043-15-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011172358.69043-1-krzysztof.kozlowski@linaro.org>
References: <20221011172358.69043-1-krzysztof.kozlowski@linaro.org>
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

The binding references common Qualcomm TLMM pin controller schema, which
references pinctrl.yaml.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml         | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
index 6ae5571f60da..1c0186050dcc 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8350-pinctrl.yaml
@@ -14,7 +14,6 @@ description: |
   in the SM8350 platform.
 
 allOf:
-  - $ref: "pinctrl.yaml#"
   - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
 
 properties:
-- 
2.34.1

