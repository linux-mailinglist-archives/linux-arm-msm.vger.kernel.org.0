Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBDAC6C3286
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 14:22:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230436AbjCUNWM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Mar 2023 09:22:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230161AbjCUNWH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Mar 2023 09:22:07 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3560328871
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 06:21:46 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id p13-20020a05600c358d00b003ed346d4522so9458653wmq.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 06:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679404904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N8+H5EEAbdvf52NcUpG/q5u48K7jDEZDyAtoMXnmBJw=;
        b=dTBmzMi6N3du2dp0NBJiU86t/9WaKUpJPa7x+fwqLUDVNIbTHEQQBUs5UYWfFZy2ab
         oYtzm+ku2nuiUa1wBKBDkZGf083UiDEixwIfshX4DKKcrVkw974SnnOWNOI6jXk5JQ34
         7pywJyAqnet8P/FQYqiHxhf6FXNaMXfuxuzyY+NQ91DlHy1qhH7arFwsr567ILYvZCmz
         Ijb39kXNKpkM+nNL0g9st47Mx++rQWvZMaqc8+Ff1Nalhuj1QxjXtCFbDuQWxAQBpLjo
         BMmUqyMHOpBsLCi1wnpFzEcO8aEDXQm6feWCqXzcY/A27ALiBivmScKc4Wq4kpgd3c4l
         uTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679404904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N8+H5EEAbdvf52NcUpG/q5u48K7jDEZDyAtoMXnmBJw=;
        b=agofPQEfOJy66vnhSRuuHoQ6rXBKatnHwJbEX/TAYUYmayGfZmSnXzodayglfNi/88
         ccyhmT8jKILQ8nn35+TlOmT3zD0sNHn9I2Mo2XUmmMcEm1Ds4VtVU7Dc6hNHGY5PGe7u
         Z4h43iIdQr1H8eMNqq6T1cjU+OnscxUYEbV79OLwPnkytGLvsEY8N3oot82CtmaPiStk
         jg13FM3v4Pa8OP/Nrtm4ZQTgjvFm8lNXkuJnPllLbaZu1TGpB2DEggra7fj03l7jZN62
         hB+b1+P81jOeYJcIpRU8clyeeZxVaBIweHNEspT8tX6JP/tFCFcD6C5G/Qn3Ap3R8AG9
         b0/A==
X-Gm-Message-State: AO0yUKUiQ7G08MwF1PsxQSAj6rzggmFSqFTqOvEJ+pHF/hcb0DBa/xqE
        lZaMuho0BJ4xe4XjPXg0x1igoA==
X-Google-Smtp-Source: AK7set+AeZOHC3qQvR4a351WvupyUI6jJ9BaB6ah6WBGGUuaYlRnKtmLfTNiiKhzEUWF3DepnUOtww==
X-Received: by 2002:a1c:7713:0:b0:3ed:5d41:f95c with SMTP id t19-20020a1c7713000000b003ed5d41f95cmr2426414wmi.11.1679404904564;
        Tue, 21 Mar 2023 06:21:44 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id v26-20020a05600c215a00b003eafc47eb09sm13393016wml.43.2023.03.21.06.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 06:21:44 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 21 Mar 2023 14:21:42 +0100
Subject: [PATCH v5 02/12] dt-bindings: soc: qcom: qcom,pmic-glink: document
 SM8450 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230130-topic-sm8450-upstream-pmic-glink-v5-2-552f3b721f9e@linaro.org>
References: <20230130-topic-sm8450-upstream-pmic-glink-v5-0-552f3b721f9e@linaro.org>
In-Reply-To: <20230130-topic-sm8450-upstream-pmic-glink-v5-0-552f3b721f9e@linaro.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the SM8450 compatible used to describe the pmic glink
on this platform.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index cf863683c21a..a85bc14de065 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -25,6 +25,7 @@ properties:
           - qcom,sc8180x-pmic-glink
           - qcom,sc8280xp-pmic-glink
           - qcom,sm8350-pmic-glink
+          - qcom,sm8450-pmic-glink
       - const: qcom,pmic-glink
 
   '#address-cells':

-- 
2.34.1

