Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADE587519C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 09:23:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234132AbjGMHXJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jul 2023 03:23:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234267AbjGMHW4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jul 2023 03:22:56 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ABBE172C
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 00:22:55 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-313fb7f0f80so474312f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 00:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689232973; x=1691824973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NW6ucyBlPaXPLxhxGyKJLKFBicJXxXMRT8wQieSVLcc=;
        b=a75IyubDe9U1hEUKqxIL36g8vj3+5t/2j5ofDIOSZR4U628P2xqfokU24KGbUtaUUC
         dQSYE7jOlDQFaQgpNUIp+n1e22Yc66xVI0+njn2Saa5Mgfje4In9pBWtJCqKpKZokOxq
         dbi60B2cCmcbE8W9mRl64bxPOZokbxK6cSM79qcd9iPDHHUIDUlv88KbL7LM1/4+izq/
         9SJa0Gs/3VA2eNeDujMzdfyBXYT6GTY3WZghEHlQRwH3NBC2fi2cBxzypglDVQJ/YNJC
         A8fVg7nfM/mKNn6S5+LgfPjszs+8RO7HYAU20LVODHeITktK+eNXCPVwEV5OzbiKHA8G
         ianQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689232973; x=1691824973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NW6ucyBlPaXPLxhxGyKJLKFBicJXxXMRT8wQieSVLcc=;
        b=WQWqgmWvKXX6llsKG3S8bDIysDqQV2gU+2aMIc9eMqWpnubhlqDqzcSZZ3KoDwkW8q
         LI+WMVtP6iUtE8U1fO7a3zIRPmgU+OPp+uJndaGPVYUp0/EyJ0bNy90AGXUUGF0wle2Q
         qrRIMj5m3BNEajCYdk/HTNF3vfBmVeFijWjL91PlXKnB/Y8Pyja1P1J6fTbRSr+7u3mv
         ojQmZVIhDCWio6OjYkcIDyTgudrRUBK/LXRz5+uzEYgQBChqaH3HDeHVi0Yib93nZJUl
         IJXatmYk14Or0KZFGHtSs4bOveO/RH/HHjNzLoEyrF5MmKIy4C0ztKh9zUkH62I7G6NW
         cmjg==
X-Gm-Message-State: ABy/qLZt22xdKLDjFlZaJRz/qRbgkJz6VvC0fV/c5OrddeYUb+SInFPW
        fac8tuxbN1+oIDHwGGni4dd59g==
X-Google-Smtp-Source: APBJJlFVGUsqZ4FQTLTVpn9EV3aQ28WUtoMGwF7oOJFs6AbukV5SlFQoumyRUSDdCkenLSXfNGXPIw==
X-Received: by 2002:adf:e781:0:b0:314:15b1:d611 with SMTP id n1-20020adfe781000000b0031415b1d611mr753448wrm.0.1689232973592;
        Thu, 13 Jul 2023 00:22:53 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id w16-20020a5d6810000000b003144b50034esm7071384wru.110.2023.07.13.00.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 00:22:53 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [RESEND PATCH v2 3/4] dt-bindings: remoteproc: qcom,sm8550-pas: require memory-region
Date:   Thu, 13 Jul 2023 09:22:41 +0200
Message-Id: <20230713072242.11268-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230713072242.11268-1-krzysztof.kozlowski@linaro.org>
References: <20230713072242.11268-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The memory-region is defined in device specific binding, not in
qcom,pas-common.yaml, thus also require it in the same place.

Fixes: 084258d60712 ("dt-bindings: remoteproc: qcom: adsp: document sm8550 adsp, cdsp & mpss compatible")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index fe216aa531ed..58120829fb06 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -53,6 +53,7 @@ properties:
 required:
   - compatible
   - reg
+  - memory-region
 
 allOf:
   - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
-- 
2.34.1

