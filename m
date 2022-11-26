Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B006A6395C6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Nov 2022 12:46:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbiKZLqj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Nov 2022 06:46:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbiKZLqg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Nov 2022 06:46:36 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25A2620191
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Nov 2022 03:46:35 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id d1so10131946wrs.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Nov 2022 03:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nSQin7QU7m3wea+By9/0m4C67OFHqy7bfbLiJ+YSrfk=;
        b=GRqDKzIxtbk9vYVbhHOmsUiVNZiDuN0XWJuSrZXdd1v0vUYgj2tQsEs6HDeUYlvFep
         G+Thv53uLTL2PEMcLrTLH1YbIHpgiJa08MEOr75/RYaqdkETJ2hV9MLajVHpuyoyeXQF
         RCcJDD2Y9Sxh0GPdJ2RwHa4Xyz164ObvmbvlmN3UR5rznjA8D0z0mbFsY1mUaW4OrzCW
         ZZDl3ES0LKYJR0QNQs1pF0Vg7q4/JKa8YQx67Z/EGd9ikMa4dFSSkHdBbMzr9L/y+q3W
         0fnKq3RBbcTABigurcv7mYafUde6xsknKeoVLH9iGIqsTIezJCtzNdDfOV8NHl14rz+h
         8Aqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nSQin7QU7m3wea+By9/0m4C67OFHqy7bfbLiJ+YSrfk=;
        b=pUb4lElMwU2ngLBYcwBQ1UH2xjm/S1TryudVriR8HHX66K18dDl31aW9NKWzWqYi7D
         nop0nnatQqgQyCxJdi+2fqgL6RXq3Fhvh3pEhndoUNAt5DLhIN+m5KPEW/VG6VfJN9h4
         eBUm7uStSQ/zuB8ZtVg+hEmZ/C2OiFn1meoV0YLr3QQ3cIU3A+ODFWEzbs2wSmoHWSLZ
         QG6UTLPUPecpAq+m2WrShkokVlFcvj4zb/lTPBiysteeGuAES0040PbueJ5/OhIocriN
         1ooikAl6Rwou7UsDoQkPopfKaSYzo86aUNu+B+iSvSGBUE0Ma5LXoKwY2xviCRt8oLbG
         nNOQ==
X-Gm-Message-State: ANoB5pnXjJpKngRA64S+qALY2g2GpdAxDDtGsCdphg5tt02tEXImJibk
        NYpVjnniLZZ5FH/Kp11NXY4tuA==
X-Google-Smtp-Source: AA0mqf5Bp3tlncJLdXry0HSOWc2ZdqBNmYbdAVWJ10SSmuUy+AeC8Kibv2h9OG8C1Yv4uqD4AsdLpg==
X-Received: by 2002:a5d:4090:0:b0:241:f675:c8cf with SMTP id o16-20020a5d4090000000b00241f675c8cfmr9889209wrp.480.1669463193484;
        Sat, 26 Nov 2022 03:46:33 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id h5-20020adfa4c5000000b0023659925b2asm5942621wrb.51.2022.11.26.03.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 03:46:31 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 01/10] dt-bindings: arm: qcom: Document SM8550 SoC and boards
Date:   Sat, 26 Nov 2022 13:46:08 +0200
Message-Id: <20221126114617.497677-2-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221126114617.497677-1-abel.vesa@linaro.org>
References: <20221126114617.497677-1-abel.vesa@linaro.org>
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

Document the SM8550 SoC binding and the MTP board.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7637cf27d799..a586a38c3461 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -68,6 +68,7 @@ description: |
         sm8250
         sm8350
         sm8450
+        sm8550
 
   The 'board' element must be one of the following strings:
 
@@ -818,6 +819,11 @@ properties:
               - sony,pdx223
           - const: qcom,sm8450
 
+      - items:
+          - enum:
+              - qcom,sm8550-mtp
+          - const: qcom,sm8550
+
   # Board compatibles go above
 
   qcom,msm-id:
-- 
2.34.1

