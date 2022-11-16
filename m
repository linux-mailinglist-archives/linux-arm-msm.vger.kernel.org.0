Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 923B462C1C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 16:06:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234033AbiKPPGK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 10:06:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233890AbiKPPGJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 10:06:09 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49B892A955
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 07:06:07 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id m7-20020a05600c090700b003cf8a105d9eso1665330wmp.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 07:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N0oCOvRm1EK9AxTWCP4M9BHamp1imaGXhcVhBQlLE/I=;
        b=Tfpg/KEk5Zv7mnqGj0ZgkiFXW/54J1Nx92o0nXLAdGLQIvVzqVDc0IV6Ird1vNZ4zD
         ODxgB3YiSR5DseYPNjYTTeYNNoHCH3VZ3vf9a13LbZnUSONY1BiXi4elUMKwbeFmWw5I
         Ir/JQSqiKQGdMj3A5YXlmdpwu6raDAXsQxbS8uWau8GqyEqAqs158S0+lYwp8dtYklIb
         PJgDJTGiW1ZBUK6lBO1WWsD5Huqtsw4oIcixi8Tn91bvLJwyt1Uv3VrbhbgNHjOTiWOa
         pjt7+GFVkyXReiJAplELl8i96u2qznoQwuB+3RS8kg5COZ/cidhd+VgKM90s+SmpFZtg
         O6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N0oCOvRm1EK9AxTWCP4M9BHamp1imaGXhcVhBQlLE/I=;
        b=7uspaZ01AbjbU5zkzma8PNmYfhkzUPnJ2utiW/NqvRJJj9T2vVLkRrv5ojwdrxenyO
         PPVWmQWSq/cOiJj7T9wcMJ2iQNIsmFEOi2+0jH+UBUkCw3zn4DvvUDdWrVjgO9BAYKjM
         AUAJ4Sae5hhW0HjgHVlq3lCw4qy7bN7TLvw+xFd5wm7VmeQEERLBawb+KnWAwSvGAnC8
         Oe8iCv5FRImO8unvRa0B1wMz1w7FJoJSuv/hqnR70QI9uQ5bukGB5LOnSbTMAM7xjO6u
         oBl5bnbpLcdFvQTWgDd9kGIA6pSz9z9SWhlMQKRCr+0rh+wJSXcRhQESw/ytneAWJCM8
         fQ7A==
X-Gm-Message-State: ANoB5pnrMIfAABaJ7WPmLp9Zsz2Bdl08DS0fFdSH9zrH37MHcOTUJeq1
        aM0zj3i1uBvQ4yA4fQp1s6XVew==
X-Google-Smtp-Source: AA0mqf5adF1AaQLjFwL8N1PwblL1LOFK81oGm1HDjWvOrcnHHBLZciTGXu5ZT+MUPW+g+uvuy/6k5g==
X-Received: by 2002:a1c:7701:0:b0:3cf:6c2f:950c with SMTP id t1-20020a1c7701000000b003cf6c2f950cmr2433855wmi.146.1668611165768;
        Wed, 16 Nov 2022 07:06:05 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id s15-20020a7bc38f000000b003cf6a55d8e8sm2260038wmj.7.2022.11.16.07.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 07:06:05 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH] dt-bindings: usb: dwc3: Add SM8550 compatible
Date:   Wed, 16 Nov 2022 17:06:00 +0200
Message-Id: <20221116150600.3011160-1-abel.vesa@linaro.org>
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

Document the SM8550 dwc3 compatible.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index a6e6abb4dfa9..a3f8a3f49852 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -39,6 +39,7 @@ properties:
           - qcom,sm8250-dwc3
           - qcom,sm8350-dwc3
           - qcom,sm8450-dwc3
+          - qcom,sm8550-dwc3
       - const: qcom,dwc3
 
   reg:
@@ -301,6 +302,7 @@ allOf:
               - qcom,sm8150-dwc3
               - qcom,sm8250-dwc3
               - qcom,sm8450-dwc3
+              - qcom,sm8550-dwc3
     then:
       properties:
         clocks:
@@ -358,6 +360,7 @@ allOf:
               - qcom,sm8250-dwc3
               - qcom,sm8350-dwc3
               - qcom,sm8450-dwc3
+              - qcom,sm8550-dwc3
     then:
       properties:
         interrupts:
-- 
2.34.1

