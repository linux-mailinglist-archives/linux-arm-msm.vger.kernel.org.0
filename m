Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 606EC5847BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jul 2022 23:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232292AbiG1Vdd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jul 2022 17:33:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbiG1Vdd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jul 2022 17:33:33 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62A22743EB
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jul 2022 14:33:32 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id w10so2932363plq.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jul 2022 14:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7Oc/bWNh4wSfrPUVGN+ae9wVp1cO7IaMu60kdS0UEJ0=;
        b=bdWzyRDFqQ6bHrqG7NGUjjpofldwWnA5FJSctMR6m/RMzAiI1zGWzMMQFv8VtAQ2em
         n4RdT29yNWrECbQHHLtZo0vSOKzR5zHDYLaUuyJknhQg2ei9lJKasCiScMSkm4FhyNxw
         JgNdGjoY4D2SFaMmtwyDL3UXl1rMdN+O37fQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7Oc/bWNh4wSfrPUVGN+ae9wVp1cO7IaMu60kdS0UEJ0=;
        b=ysbR6QzEGi8ZxFq+BMiAu3wHf30GPs4yj9RaRuReMhHYq1prF04BdwBAvq8t6JUbEZ
         fj9D57zmKajFprx0JeoDJE6LbYMcq/9PhbWS6A2hJfBh3vHMFUZLdDCTi6S4L8hWy096
         /4wTAOpHqlh2H1sWV0olHtKUaf6Xc0p4CBB9tnltVBUnQUJiqfLTugHvQLkIdmzeuB5n
         uoMUxBPCElVn0W/xsjCtikfta4FFUFMPlP89iyGueELIu09qexSmKLMTigtfd367Oq0J
         EHDizfP5T9nBFpmHewIc5tluaWyXV8vNvLV33QggNzyEhU+bkW+pu/D3kuaeexqRGVJH
         gfKg==
X-Gm-Message-State: ACgBeo3bdbe/W2VoyhUur19sB56IDYVRsHYJ6q6VRESI4o8ZgnOWwgmt
        3+hBl1Q3o+Zm9t5WIrkp3xHEFg==
X-Google-Smtp-Source: AA6agR4xOmrJNRtjUcXcNJExXEtJnz8QbF3P63CwItGjHnK9qM3n9r/mW8c2Op5tCD1R8cPB7gtwQA==
X-Received: by 2002:a17:902:d716:b0:16d:be4:40f9 with SMTP id w22-20020a170902d71600b0016d0be440f9mr755944ply.146.1659044011752;
        Thu, 28 Jul 2022 14:33:31 -0700 (PDT)
Received: from moragues-cloud.c.googlers.com.com (252.157.168.34.bc.googleusercontent.com. [34.168.157.252])
        by smtp.gmail.com with ESMTPSA id z1-20020a170902d54100b0016bf4428586sm1756930plf.208.2022.07.28.14.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 14:33:31 -0700 (PDT)
From:   Bob Moragues <moragues@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     swboyd@chromium.org, mka@chromium.org, dianders@chromium.org,
        Bob Moragues <moragues@chromium.org>,
        Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: arm: qcom: document zoglin board
Date:   Thu, 28 Jul 2022 14:33:20 -0700
Message-Id: <20220728143215.v3.1.I5b9006878bdabd6493b866b46dbd6149968d545b@changeid>
X-Mailer: git-send-email 2.37.1.455.g008518b4e5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Zoglin is a Hoglin Chromebook with SPI Flash reduced from 64MB to 8MB.
Zoglin is identical to Hoglin except for the SPI Flash.
The actual SPI Flash is dynamically probed at and not specified in DTS.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bob Moragues <moragues@chromium.org>
---

Changes in v3:
- Fixed Author
- Fixed duplicate Signed-off-by

 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 581485392404..63091df3cbb3 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -475,6 +475,7 @@ properties:
 
       - description: Qualcomm Technologies, Inc. sc7280 CRD platform (newest rev)
         items:
+          - const: google,zoglin
           - const: google,hoglin
           - const: qcom,sc7280
 
-- 
2.37.1.455.g008518b4e5-goog

