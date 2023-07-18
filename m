Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9C1E7573BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jul 2023 08:11:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231240AbjGRGLz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jul 2023 02:11:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231276AbjGRGLi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jul 2023 02:11:38 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED4371988
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 23:11:22 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-666edfc50deso3254998b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 23:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689660681; x=1692252681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cj0Kr21fyKMkxAxxSOMwsypaT2zCqEO5kfSgBNpmV4w=;
        b=E4VIlEjB7OpiaiNfOMe49rriMI65KPRGhRjW+OuN7mBoAE1PhP8mtVQM0a1Dy2bQuX
         rqb3C7XkjgbyiD/J6t2j/5mUba5DjjyAStOl1ljQlQ288qZboIBUMma6B+1emotmY8EQ
         H30Q+VKbzduQhblOO0e/J1LJue45zD5H74MlO9uRKcNj5YMWQNY+9+4r/6pZH0Bk0jYy
         ZL2/TeMnlp8zqh85xhp6ufz9gdCwDf9eHmwV3u33PBTE7mmIv2Iu0eqQxFGim0Oj7i2q
         NkN4kCnQeBzsi+Q1Nwl091PlAkh8zEds8xPDolZdIf2crsTPbHSV4+WD5EmY48j7GX1e
         Jzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689660681; x=1692252681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cj0Kr21fyKMkxAxxSOMwsypaT2zCqEO5kfSgBNpmV4w=;
        b=kZlfFxnagHhHxKX4RiIqDmQ8+KkI9/6Tc++3EJcWMf5r4EeJdbr58qs/QIvstJFEEe
         dyEqkEo2YWqSeQfUO133TR12i0dO7WK23gF4o7SHDvTZbLKtLQhd/pwqOOU7pQNX1xAR
         TGicMBfBySudkavPI0vbvb0Oa3TjvdjkoFvXyoi0w/RgxuLlo7281N97cW3YR+zD9t1y
         VTMF5BsoOgLcgDWEHS2Mc/r9dJAnLew6EGTEMEFEjc76P2op2Z1dvw0EVy9JkDzMB3og
         wEi9LQmDV8U/B0DHwGaHxMMNIfudE1r4ayyiOLSspCQgE0x/zeOkkJghER/d6g1/Ra7W
         aXiA==
X-Gm-Message-State: ABy/qLbYeYGFnES2spyYui03R721DBuQPLErkIB0NK1fbiS0spvNWR9K
        JMgrE/G0nG3QM8rbVsOtfGvQMZeevGT16/b4cqlK6Q==
X-Google-Smtp-Source: APBJJlHjtWvi6yAFKVFf93mMLqWPNaz5odCz8RCDBsF7Wt8mdjxL4BtqtmP842+6qU6d6uaRCakpwA==
X-Received: by 2002:a05:6a00:a1f:b0:676:8fac:37 with SMTP id p31-20020a056a000a1f00b006768fac0037mr14739279pfh.4.1689660680828;
        Mon, 17 Jul 2023 23:11:20 -0700 (PDT)
Received: from localhost.localdomain ([223.233.68.54])
        by smtp.gmail.com with ESMTPSA id h21-20020a62b415000000b0067db7c32419sm778106pfn.15.2023.07.17.23.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 23:11:20 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org,
        quic_schowdhu@quicinc.com, gregkh@linuxfoundation.org,
        stephan@gerhold.net
Subject: [PATCH v9 3/7] dt-bindings: soc: qcom: eud: Add SM6115 / SM4250 support
Date:   Tue, 18 Jul 2023 11:40:48 +0530
Message-Id: <20230718061052.1332993-4-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230718061052.1332993-1-bhupesh.sharma@linaro.org>
References: <20230718061052.1332993-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add dt-bindings for EUD found on Qualcomm SM6115 / SM4250 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index ca38d219e57d5..bb9b97f03585f 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -18,6 +18,7 @@ properties:
     items:
       - enum:
           - qcom,sc7280-eud
+          - qcom,sm6115-eud
       - const: qcom,eud
 
   reg:
-- 
2.38.1

