Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D61366968C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 13:12:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241159AbjAMMMu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 07:12:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240935AbjAMMLn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 07:11:43 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEEF87D9E5
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 04:06:08 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id bu8so32807608lfb.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 04:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZDEolcQGnwFUL0b6SHhXtES+/x7b+VoQjgO/oUXinA=;
        b=Y3c2aTu+lBZqLf1pQVj3HOvZZCtBBotxEjVIzeC4sx0LsyrEBsF2icS/6sxA0B1eLy
         vmGi42Lim8Zbft+SBXAu9r7k/0swA6HMfml2gx31iSvREWVYdu5yBYIbnMDlbTJDZRmW
         RqDvOvNdE3hT8aC5gxB3ctSSk9J1IzOQkQEPmYdM5qFdSpdG0Nm8HQXZp0dqR6p4FSpV
         1mU2VpOvMWKlGmRzJZzJpBVax5IhRcA2vW6/DfwF38tf4KOWGmCoNLBDFzkBPioHYvQ6
         bZygaYe0At+62GYN+QqkjhdWY90ZOkA1tk1/vIBo92EDSbz5vEamj+BHs/87GQlzXYG/
         OQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SZDEolcQGnwFUL0b6SHhXtES+/x7b+VoQjgO/oUXinA=;
        b=l+8YCVby3yptFjm7pa5YOfU9bq0h4YMSfo70Yp70fH6yvG3wfrKIfc52lgC3vvuDuz
         AVXaZTwYoqkjQewmLrHJMbku5ivM7zBd3kwfnX82KsN/rxGWouBnEm5426VnNjMv7txd
         TUiOVI6bLG+abzPL+jHCxZOd5usk+NHbRjA2H0oHr0Ta4eXLa83kre/IG96/ahCTGPyj
         pnLKZQK+FFMrAiNG9zHj/eoWEGIl2GJOXx/ltOKOSW4t6jTBrTaIcR7IoCNgvIQI0FCi
         bmGdKbWQM2UdaD6uZfTFNAycd6olNwPhTqBknt/N4beeU2EZcnyzX8KROzCUFFdJn+pQ
         UtfQ==
X-Gm-Message-State: AFqh2krKqJxzI+vP7eBWAI6oNivjmqwkq06eh1T5LoAsGBCg7Pb+5Nsh
        XPniaS2laegGoE3vx1WJt0qeHQ==
X-Google-Smtp-Source: AMrXdXv8GG9odTGIrhCZqfj1TTqxoGwIdULKDVy4O/xURU+JJ9F0/EC9Jd39q1WPUgU0fGNG/bSphA==
X-Received: by 2002:a19:7008:0:b0:4b5:7d49:4a05 with SMTP id h8-20020a197008000000b004b57d494a05mr20313749lfc.0.1673611567319;
        Fri, 13 Jan 2023 04:06:07 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.170.82.205])
        by smtp.gmail.com with ESMTPSA id i7-20020ac25227000000b004ac6a444b26sm3806290lfl.141.2023.01.13.04.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 04:06:06 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 01/14] dt-bindings: clock: qcom,msm8996-apcc: add sys_apcs_aux clock
Date:   Fri, 13 Jan 2023 14:05:31 +0200
Message-Id: <20230113120544.59320-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113120544.59320-1-dmitry.baryshkov@linaro.org>
References: <20230113120544.59320-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The MSM8996 CPU clock controller can make use of the sys_apcs_aux clock.
Add it to the bindings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,msm8996-apcc.yaml        | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml b/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
index c4971234fef8..fcace96c72eb 100644
--- a/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
@@ -27,10 +27,12 @@ properties:
   clocks:
     items:
       - description: XO source
+      - description: SYS APCS AUX clock
 
   clock-names:
     items:
       - const: xo
+      - const: sys_apcs_aux
 
 required:
   - compatible
@@ -48,6 +50,6 @@ examples:
         reg = <0x6400000 0x90000>;
         #clock-cells = <1>;
 
-        clocks = <&xo_board>;
-        clock-names = "xo";
+        clocks = <&xo_board>, <&apcs_glb>;
+        clock-names = "xo", "sys_apcs_aux";
     };
-- 
2.39.0

