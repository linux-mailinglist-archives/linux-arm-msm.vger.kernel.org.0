Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0C415249BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 May 2022 12:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352401AbiELKA0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 May 2022 06:00:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352407AbiELKAY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 May 2022 06:00:24 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96EC82300E5
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 03:00:21 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id p18so5596614edr.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 03:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZjLxakQ0FSfyTvd+sfZt6yVLmsWKYw5HJWioql1MULA=;
        b=oKuGfm7/9iBCaaPc5mhPpwnUcc7KMWedSIlK2to3AQnPjr5zs2yttDv1zqEA3nGfxY
         /A8lPZm1yXkHH/aszZLujZQumQMR0FByXXA1eC6g7vsCjSDIff6rGT76DmZpGuy+C1DE
         s1GeDDq8KPg0DLOpaTUOa9+1mnQ4rTFeOvLFqIQ7oTmFR8/RawpH0wVbJtgZNOHDeIZf
         HyE/p38Gs/7Z6vVGENuVVaGdXUjth0n0Dm8ULQxY1Qfftnk0EQ5skJ/6+aLRGYGv55+n
         cEAabyWwSYARxWtqgOeIbIqRHTYoNLDZ9TFwV5FV250WEF8kMWgQdX5Aa7x8SBf/rKfG
         u8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZjLxakQ0FSfyTvd+sfZt6yVLmsWKYw5HJWioql1MULA=;
        b=DxezhMhhCeCaAxgfp5RSWAcdDWk9UDiqtFTeiDqzV//BH9U+4rysuF5T1Iwu6zp53p
         o8oLTbOj3NjGrgXknGjikJS/zXzOonTwk3PJcV5MH7EfRWKJARmWAnOdmmiA0CfI9XOS
         EOzHXkPCimkPmaIT0BnmI5LZ2HGx+FHWtQPJZVqiTgrYZUhy7iliy4oN+FYve/3Ald4W
         ukDvxs+WdFMlfc6+j74kmeAclaN8C3BfWtnYvu89OFGWA229Tri9DOrTrOIXFpkz8gls
         8kl95S1TYj97PBRfhq/AHfNQHlfUmV5EEzkorVqzncrfvD20ea7CTlOZcm98oSBJ6AFi
         Fr5w==
X-Gm-Message-State: AOAM533Gf8helhhrWHbeQwqdXSmguUf5DL3TeRYTlK5vr75PLdqMVL0p
        /EouxballhwFGeRAKKIa/N0dig==
X-Google-Smtp-Source: ABdhPJwLH8DMilBzXnoMU839jb/MHw2Ayl45szfnmU2n4inrbex0g7IO4TeWJ6vQflnS/RWleVCPdQ==
X-Received: by 2002:aa7:de0c:0:b0:425:d510:8f40 with SMTP id h12-20020aa7de0c000000b00425d5108f40mr34230989edv.4.1652349620065;
        Thu, 12 May 2022 03:00:20 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d17-20020a170906641100b006f3ef214da1sm1970287ejm.7.2022.05.12.03.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 03:00:19 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 03/12] dt-bindings: remoteproc: qcom,adsp: add interconnects
Date:   Thu, 12 May 2022 11:59:57 +0200
Message-Id: <20220512100006.99695-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220512100006.99695-1-krzysztof.kozlowski@linaro.org>
References: <20220512100006.99695-1-krzysztof.kozlowski@linaro.org>
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

SM8350 ADSP Peripheral Image Loader already defines interconnects, so
document the property:

  sm8350-hdk.dtb: remoteproc@4080000: 'interconnects' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index 810ef9d2bcc1..6e1fdfe91043 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -67,6 +67,9 @@ properties:
     minItems: 1
     maxItems: 8
 
+  interconnects:
+    maxItems: 1
+
   interrupts:
     minItems: 5
     maxItems: 6
-- 
2.32.0

