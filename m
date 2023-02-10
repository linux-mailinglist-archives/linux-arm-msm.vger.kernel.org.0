Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01E1569215D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Feb 2023 16:02:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232464AbjBJPC3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 10:02:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232377AbjBJPCY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 10:02:24 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EACD21C597
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 07:02:12 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id l21-20020a05600c1d1500b003dfe462b7e4so5735982wms.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 07:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N8+H5EEAbdvf52NcUpG/q5u48K7jDEZDyAtoMXnmBJw=;
        b=hOqKKORNY8wSqtfSKO/XW8kOzz05LhPY/YX4fPQlqGEUIJlCkhmnB+O2BY/bi6C95r
         PFThlZwSBeN+uSGf+N71xv7/k0LROHJ9OvOLKO/9iaKZte/LgAt35SyeNT66vsY3gRpH
         WwKtiUZaulMcG+jvBVp1XivQHikOcu4L2LtnbH4nUk19t1DAR8zR5mwc11RZ1Y/Ixc/Y
         B2xXaW9Ry2VSpLvylkvGO/jyQFv/O/PnW2Q3BO1FERV3dbVYZsz9dNSX+6asaAvav4+A
         7btRxdQqL7OPZMUPDWp9tgJ9RFWtFl5whSDEaVUCMZcFJQj7uym0AonXtEneqxFMZF1a
         L+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N8+H5EEAbdvf52NcUpG/q5u48K7jDEZDyAtoMXnmBJw=;
        b=YFo2PxH2ya2fYg3AusRD/NScVSRiZ2W//QO6n3cyMpasvWVj2YO/nzm+B0giCeipAw
         5HQYZucGRgS2mQGax67zPlDS/mlOrpdMkLYLeIzH1oJr7yclDGLiAQCegtl1WF0ABrze
         xIpeRGu8Urj5fK2hoiqt6BNM09DeQDNpVXXXEfMtSZTzqdyGeJQQIBLDp+aTfzkNjaM+
         bgU7L6XxETL157hia8E7tXErfIhuEbnoklB3RvpK0OvsCAQg9Hw18i6BloaqczxkEegy
         GLwWvTPsZ86IwNNQGF/nbE2gnPmwryQNAIn20XVDMl/4AbrV3QB0NQdcd5KAVrPHlYgg
         ilFg==
X-Gm-Message-State: AO0yUKVSqxPcQqMx/gcn5198to+L0opiXmmH3TaTpq9MsX4CS4v7WSH0
        X6HEldvXE+P1Gi0Jan61VHnBbw==
X-Google-Smtp-Source: AK7set/KVGxCa1+r+60rPwUlqZcFQjBtDzbDwBsLRWFoSuiOkR0N9i2LeJJ1ICD0cdH3umVNlb++eQ==
X-Received: by 2002:a05:600c:1656:b0:3db:742:cfe9 with SMTP id o22-20020a05600c165600b003db0742cfe9mr14661428wmn.34.1676041331180;
        Fri, 10 Feb 2023 07:02:11 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id w23-20020a1cf617000000b003db1d9553e7sm8282482wmc.32.2023.02.10.07.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 07:02:10 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 10 Feb 2023 16:02:05 +0100
Subject: [PATCH v2 02/11] dt-bindings: soc: qcom: qcom,pmic-glink: document
 SM8450 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230130-topic-sm8450-upstream-pmic-glink-v2-2-71fea256474f@linaro.org>
References: <20230130-topic-sm8450-upstream-pmic-glink-v2-0-71fea256474f@linaro.org>
In-Reply-To: <20230130-topic-sm8450-upstream-pmic-glink-v2-0-71fea256474f@linaro.org>
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
X-Mailer: b4 0.12.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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

