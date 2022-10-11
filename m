Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A18C5FB449
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Oct 2022 16:09:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbiJKOJx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Oct 2022 10:09:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbiJKOJw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Oct 2022 10:09:52 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EDF01263B
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 07:09:50 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id a5so3489366qkl.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 07:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qgU+j7ZCV4AebDJiRH1Omm0iISpODuroU2FgUcdEDTg=;
        b=seXhbOEhZADT/FVNxI4w1XWvaYjMs/WuJw173RmYw9Lz9ak9rrFtWsfI36w/x3cWv6
         lANw7RoHfKUGEKy8zo10jZ26LuwpR5BT9iiuqHZecFX9RJfz3zBYRbu+gxiDnPoDj04h
         AwWh1OizT/eE5i3CgZaJMGzn22bsnSC+eUpyiMWGNzmygg/Z3qNJcC2BiI84o5CHm+Hy
         /76+e3UGICFddX0KwkHCk+z+HGVww804HwyhCowTtFFbfoW2+NEiw+bQVUjvbjiASSkf
         LYLwOrLf0YVcTKHzzEFxxrMxcyrxa88JtRMvmhkoA9zzKfKPl4BVToK7M9QWCUkrKNBx
         4CCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qgU+j7ZCV4AebDJiRH1Omm0iISpODuroU2FgUcdEDTg=;
        b=fuTHkW8lOtL6ATqzenZMu1XoblNPrJxsxujN6Yov6H4nUWVqct+4Eva2aLbksXtmrM
         w9tz8w/4SWZoJq7WLRAROJR/qy0YA4kriUF9GwERierNNOJdpmyQCHB72n+tMyyQXQIP
         JTlSHJiecxSrINRYIVvClkg+iSwa1wZAdooTV7joIQjj0mnsVD5qkKB10fLRdy4/xxQB
         m5EKVtKAj2LO57mXfKFsjHlbDQUKepoCHXj1t/yq4WgxlEnUd0/8Mj7MERVGaqV7KHub
         pD/Y+TGiENx9sk5fjyuN/nZhJv1lWVvJ3DR2YztLn3Iiuk5qxzwMUzGkPL/dKH02wFWC
         zt9A==
X-Gm-Message-State: ACrzQf1U4TJNVjeO5rpLFXt6ChMZ5EYbhoECIG2RtBlb32fCXD+LfdSL
        04NbHD0Mw0JkARB9i2WnbiDCgg==
X-Google-Smtp-Source: AMsMyM63pcT5iolfTdSHTX2Z5yyeLUsOx4E2TKrAbo2GoYbKsBLReUG06WldGlINrnSQbw17CFpp4w==
X-Received: by 2002:a05:620a:791:b0:6ec:b7ad:e936 with SMTP id 17-20020a05620a079100b006ecb7ade936mr7442568qka.637.1665497388081;
        Tue, 11 Oct 2022 07:09:48 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id h3-20020a05620a244300b006d94c499d8fsm13265726qkn.50.2022.10.11.07.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 07:09:47 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: interconnect: qcom,msm8998-bwmon: Correct SC7280 CPU compatible
Date:   Tue, 11 Oct 2022 10:07:44 -0400
Message-Id: <20221011140744.29829-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Two different compatibles for SC7280 CPU BWMON instance were used
in DTS and bindings.  Correct the bindings to use the same one as in
DTS, because it is more specific.

Fixes: b7c84ae757c2 ("dt-bindings: interconnect: qcom,msm8998-bwmon: Add support for sc7280 BWMONs")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
index 2684562df4d9..be29e0b80995 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
@@ -24,7 +24,7 @@ properties:
     oneOf:
       - items:
           - enum:
-              - qcom,sc7280-bwmon
+              - qcom,sc7280-cpu-bwmon
               - qcom,sdm845-bwmon
           - const: qcom,msm8998-bwmon
       - const: qcom,msm8998-bwmon       # BWMON v4
-- 
2.34.1

