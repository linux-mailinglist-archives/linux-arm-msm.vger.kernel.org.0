Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6806D5ECB6D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 19:42:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233370AbiI0RmD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 13:42:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233215AbiI0RlE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 13:41:04 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9EBF1EAD47
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 10:39:21 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id z25so16822952lfr.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 10:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=eAxpH6loNU1iZeyA8GiJlas/ttJky4BrFApN1xAe7yY=;
        b=NLyEVVNddfnTHSmbZNZ/w7X8uV5KFeKgIH8RauK4PeuC8IfmjYrsTxriGGR++Jlcp0
         S2aoYebYYreI//5RTbL+meXTjlFCf6xlDha73PMFdAOBUw21wR0kclSZPeySXnx4U3D9
         297XUrgbeLBbev50zRyZJd2qz8L4I3Xd12stfKPgWvSWizDXkUnN+zvNZCPegGj2GaxB
         VDMwHLKEjOShiK+2CsNU0O8XlxmrScFqTdx4GMUed/RxlRfgoxwzsZbxSFAC9/jtzhAl
         yN8FdV64L8AaXgn7EAEKtv/+I9DyTN47f/Sxrc0A3Kcc5H9bwinRyMtic98P1e0bdZWX
         5t2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=eAxpH6loNU1iZeyA8GiJlas/ttJky4BrFApN1xAe7yY=;
        b=C57YV8iyby1fCFAtaLaXq5y3q3iDd7lQQOojjnCsR164Yxb+y//TWWKInI0pVkSa7t
         4SoasXU8ft3l/UhxZ3tkw7YD1DDU5kn4AfzFx0/c5EhB4d2FWRrif5/AR6gvMfazQ9IX
         La32c6y30jHVy7pf6BPKHKnS0ZRCrF9dBu0yoQCRCudk1oXe1GbNuA4o7wKzpZ9rswWf
         aqYr+wEvalc+NysL17jQewa+AeVhltqkqOlKol5RLHd3bBsykH7ceF1ko5uTCZI4fwkR
         MC5avZbI3ptxolke6Cy4/In3KXWT0+XJXSneA21TYADxrS3x1RzGBafm6txxxYNt8KLk
         kLHg==
X-Gm-Message-State: ACrzQf15CO+4bor9OGS0aoQGBD5Dng3vAWN9hJvsST9T1Jx3JxAAS8q5
        wtSVDVDScXhSrYkXPTVI2Eh4pg==
X-Google-Smtp-Source: AMsMyM4hMJHYiZwblEf+lFcnE65TS2ubA/NfDAnElbA++I9XUy1z/+NwnRUxUmBJwGwhT8vk/DIHVA==
X-Received: by 2002:ac2:4945:0:b0:498:eb8d:e283 with SMTP id o5-20020ac24945000000b00498eb8de283mr11868886lfi.192.1664300361251;
        Tue, 27 Sep 2022 10:39:21 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q12-20020ac246ec000000b00498f570aef2sm218879lfo.209.2022.09.27.10.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 10:39:20 -0700 (PDT)
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
Subject: [PATCH v3 34/34] dt-bindings: pinctrl: qcom,sc8280xp: fix indentation in example (remaining piece)
Date:   Tue, 27 Sep 2022 19:37:02 +0200
Message-Id: <20220927173702.5200-35-krzysztof.kozlowski@linaro.org>
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

Bindings example should be indented with 4-spaces.  Previous adjustment
missefd one spot.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
---
 .../devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml
index b9ab130cd558..0b251caaebf2 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-pinctrl.yaml
@@ -139,8 +139,8 @@ examples:
         gpio-ranges = <&tlmm 0 0 230>;
 
         gpio-wo-subnode-state {
-                pins = "gpio1";
-                function = "gpio";
+            pins = "gpio1";
+            function = "gpio";
         };
 
         uart-w-subnodes-state {
-- 
2.34.1

