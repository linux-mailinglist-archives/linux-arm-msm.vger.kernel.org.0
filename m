Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 319155E9AD8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 09:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234186AbiIZHp7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 03:45:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234187AbiIZHos (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 03:44:48 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12C68B4D
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 00:44:46 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id l12so6422085ljg.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 00:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=PpctfWYT4csGOvg4SjbmFJ+uII9YAsecfSj8V0MDjFo=;
        b=ApcWPXHmes1+QrtdKrk8hgJxnJiZJEtafaHQsrseWRseRAsHqz7I/dqdY8LUo17gqD
         ejrmfzWhLhoXQ2XIPpqxo388PmcbR0vMTtCHaOE4zxBLyfQqomz72ryTvL5W9IsZF20v
         X3PMBmPoRD1dFnndTwQrYyaFgxsxKH6KttBrGO4dkbOX8gmaaFg+wbQPwLf0tYP8BY9/
         ossVXNn2vTPiJKO09k2U8ohn4KgHXbqVrBNeaF62NQzfNgCZwh5DdbOxhiDCE99y58Ua
         iXP48/rzYDo23cCN8x88QPgWGQg1/rrI8YuLgi+I+dnjAu6OmApnFxp7ocCqGrRSixWm
         L+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=PpctfWYT4csGOvg4SjbmFJ+uII9YAsecfSj8V0MDjFo=;
        b=YR5tMK5LtQqyMhnMazl21U5pkhcu+i7TQTnMdcm5b7x0i8T3Bv1Asr6ZL/niyoi31H
         MU666cVNbMojAWqwQTwkqMCsv+dUEfDCxnT0VUvcujqfhAqC6V4IFnaXYjWgi7ie4QxL
         9QHu1zgIviAW6MzjR0Mr6OIRuqe+mIaG3R/I+CZM6nWdDxXcuhsErngmUNUu5okOnbPt
         KswQAYTGUNgxhfcB7Oo4ML7YFTOLDcVUlEeZgJcH6gikf/wE6mzdK9oF9/p7tUbXwKiN
         nVOtpcVBdC+w/f206Xwt38E8o2MKjj315ENMFp5JINxv/676X6dPkHlZ9tyFzw2k40F4
         KGkw==
X-Gm-Message-State: ACrzQf3Rkge1Y5yb956GBhb2jKS/BCxVoRmzsq9zLTix8dHkFYqDk3ee
        pSVN9iQ1reXG15Dy2a9OeMsBog==
X-Google-Smtp-Source: AMsMyM4VIrjfZ8MvMOXFdSVimaTpfVFG81DJcD0Ob0Hcsm3bKxy1E2GZg7/utV2nEmXkWq7iweLvPw==
X-Received: by 2002:a2e:b0f1:0:b0:26b:dac2:d53a with SMTP id h17-20020a2eb0f1000000b0026bdac2d53amr7084394ljl.253.1664178285111;
        Mon, 26 Sep 2022 00:44:45 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g6-20020a19e046000000b004978e51b691sm2453298lfj.266.2022.09.26.00.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 00:44:43 -0700 (PDT)
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
Subject: [PATCH v2 11/33] dt-bindings: pinctrl: qcom,ipq6018: use common TLMM schema
Date:   Mon, 26 Sep 2022 09:43:53 +0200
Message-Id: <20220926074415.53100-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
References: <20220926074415.53100-1-krzysztof.kozlowski@linaro.org>
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

Reference common Qualcomm TLMM pin controller schema, to bring other
regular schemas and additional checks, like function required only for
GPIOs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml    | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
index 50d8b04bb590..111eb5b60e8a 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
@@ -56,7 +56,7 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: "/schemas/pinctrl/pincfg-node.yaml"
+    $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
 
     properties:
       pins:
@@ -121,12 +121,11 @@ $defs:
 
     required:
       - pins
-      - function
 
     additionalProperties: false
 
 allOf:
-  - $ref: "pinctrl.yaml#"
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
 
 required:
   - compatible
-- 
2.34.1

