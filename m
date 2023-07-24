Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1294575F95C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jul 2023 16:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230119AbjGXOHR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jul 2023 10:07:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231724AbjGXOHD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jul 2023 10:07:03 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED59810E2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 07:06:41 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4fcd615d7d6so6550229e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 07:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690207599; x=1690812399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pTwhfHFtxuY71ncpgGj9Id7ZpqK6DYkS2np/Gvf2Uvw=;
        b=A0pq+XRl7Vs/AGCoVXMISWJBKx7in+zTEZYb2qxZ6o9iC60GvCVhbmHL9iwUIvpSOL
         6vXiYEW4U+fzg3iV11LORY5uyDn4P/OfOu0IhSDMapj15UDcj5oOWQN5sk1IW6vzFeIN
         OZALJ3maWyt7O3/iBjL9TALDCqT22/yAFVsd/ADlIqRmFVAQYtbVc3Cx3PA3nsb+cc9D
         I4Hl9kPjXYeTEsZfXZoYe7kwYbfkA0a/dcyDIOWBAaENtY9TN3x8dTREoTZr6IkYMA5g
         DEmBtNtyt4cy1H3eMx97Y4NxvvSKmJ040QYY5tYI7IJQ1kLs5c3c2d8EYr+NApLssu0W
         4EDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690207599; x=1690812399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pTwhfHFtxuY71ncpgGj9Id7ZpqK6DYkS2np/Gvf2Uvw=;
        b=Tdwk7w6cUK1m+9MDvjD3QafD6uM0VqCQn1ie917x41jd6qxK/p7zjed6rL3frdBhu6
         TgLsJFOKjmjDcPmA/3mq/5ECmVfd1O1mpeiV8B6ZuoZ3qMXR/kooq1ktYDOJHLV7gko8
         PbXh9WDMTv592GRGbD02QpSToXJx5KEYqFk+UEk54xLwaRaUlvTYSxwM3evuN4v9TKFW
         IjDXsnM+WGwgKM3yCLZ1gFh+q8J/2vDenR9qg7b5gIePqoqbGEf60Yt+g/yXBFPiBEpb
         3NAKD0x2slU5nyWszUgv2qE3dVWW1jbiUbkWXvJSlRqH2fc48s5PkhyudrRX+fJErxMH
         fmqQ==
X-Gm-Message-State: ABy/qLZnCIwm1Y6asoMKW1spObW0p8v7UIEUtRzgG7agSOJ9dGlTjx71
        nwLkO6AaJfAbMGZvHkGTJUExza00TFBZPxLmbH54tQ==
X-Google-Smtp-Source: APBJJlFhb2uVdhNU7M8tpAml4c41cOqR6zZLdj83pkIcbjk34KS9OwI4d3nE8L1UqLx3LGxOVQyokw==
X-Received: by 2002:a05:6512:3154:b0:4fb:8fe3:9266 with SMTP id s20-20020a056512315400b004fb8fe39266mr4907781lfi.0.1690207599786;
        Mon, 24 Jul 2023 07:06:39 -0700 (PDT)
Received: from [192.168.1.101] (abxj221.neoplus.adsl.tpnet.pl. [83.9.3.221])
        by smtp.gmail.com with ESMTPSA id er26-20020a05651248da00b004fbab1f023csm2223481lfb.138.2023.07.24.07.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 07:06:39 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 24 Jul 2023 16:06:33 +0200
Subject: [PATCH v2 7/7] dt-bindings: interconnect: qcom: rpm: Clean up the
 example
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230721-topic-icc_bindings-v2-7-e33d5acbf3bd@linaro.org>
References: <20230721-topic-icc_bindings-v2-0-e33d5acbf3bd@linaro.org>
In-Reply-To: <20230721-topic-icc_bindings-v2-0-e33d5acbf3bd@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690207588; l=1379;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Kqh8DSFiK1/LG8Cj534DQ1W8nXAsEQlR7mJ6nhmX7jk=;
 b=AwqFC6QC2zF7omAVVhdnpfFSNu4o1xGR1rLWUyj8pqzXAXOWjryD4CV9SIbiXPZTTdX+8uQnv
 IfQyQgpWhaQDWTlsbHhU1iu1MB6zWbhlXcjXghqxcQImS87N5c5aQrn
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

One example is enough, remove the others and fix up the indentation
while at it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/interconnect/qcom,rpm.yaml     | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml b/Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml
index 157efd47904d..08c1c6b9d7cf 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml
@@ -41,19 +41,7 @@ examples:
       #include <dt-bindings/clock/qcom,rpmcc.h>
 
       bimc: interconnect@400000 {
-              compatible = "qcom,msm8916-bimc";
-              reg = <0x00400000 0x62000>;
-              #interconnect-cells = <1>;
-      };
-
-      pcnoc: interconnect@500000 {
-              compatible = "qcom,msm8916-pcnoc";
-              reg = <0x00500000 0x11000>;
-              #interconnect-cells = <1>;
-      };
-
-      snoc: interconnect@580000 {
-              compatible = "qcom,msm8916-snoc";
-              reg = <0x00580000 0x14000>;
-              #interconnect-cells = <1>;
+          compatible = "qcom,msm8916-bimc";
+          reg = <0x00400000 0x62000>;
+          #interconnect-cells = <1>;
       };

-- 
2.41.0

