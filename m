Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32C756B1E06
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Mar 2023 09:27:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230378AbjCII1Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 03:27:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230266AbjCII0z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 03:26:55 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A23AE274B
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 00:24:55 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id s11so3761360edy.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 00:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678350294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0WNWiNoThDdKJdR6l/VK0hHflrQJ+6jbMnoczwCR5A=;
        b=vYMiir8Pt9oNQfkOENopaYqriGaOppN9EklvT6m7/lbBlknxj1VH10yYL63jvt/JLA
         J3rL3T7rutGgL/6j+dWHA6MJqTdXi6Q3KbLPfn2c9afbD5wlf+lKtRPmCDkJ7XS9sHew
         OF0cO7gAJ+IrXxmTQq3kR5YBVLp6tE4ek53iC8mIYdH7lHA8XVmsexep5JHXjvsk3HOj
         iA6axWi2cQDDDv7AKsnvf1DMjve/M0/T3HafO0N23Qf6hSKLjdACWPQffRpluOdGbCWL
         3DzyitbzmigE3/g4itAQxhgx7H9DMAs4Uxw9BA0PSRn4mhU1++KDQ0GU/7W4d26FZn4f
         60dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678350294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0WNWiNoThDdKJdR6l/VK0hHflrQJ+6jbMnoczwCR5A=;
        b=YW1Vksde0YTHw68qxVqrmkoJb27Jv2pi4XXrFvZ4vmU+t9eZT6wj4olEFqIqPXZQXt
         8IMG0hEekuuOPn5/r6PEC4vEoTTnOo0EW4zgYc0DmFF0YoFSbonXJd4aXMwgxe8o8IH2
         qDDngGT+k3px++2ME3O5dR/alc+ATJtC/irHgDB/4jwfzn5wy3DjvTvEWoq12v63ERkS
         dfXIGuuPJQXlV+bpF/RQbboB8cuZZ8FBCZ8PuvfFsWdFUU1Jx0oSZe7GjRAay/ppZ1ow
         Ntc3reZBNxrV3DO/TR7psRh/39JW5FgV9UUzWEuUKOqqo+KvAoaSoLszZoUILpFvdSn2
         ui+A==
X-Gm-Message-State: AO0yUKWmJ17yV7SrHuPyeDNvGxsWAKEOA/IfwYqUjXLQrgMtDPKRn3qY
        rqsOIRgoSaIRg2R+i/nF9gs9Nw==
X-Google-Smtp-Source: AK7set+tZfN/EYmPGsRwPetG11xMezjlUnu7jNsveMpFcbilfaWDDbHlasDvuliHuwaqG25sieR+Bg==
X-Received: by 2002:a17:906:dac9:b0:8d9:8f8f:d542 with SMTP id xi9-20020a170906dac900b008d98f8fd542mr23087299ejb.32.1678350294028;
        Thu, 09 Mar 2023 00:24:54 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:7ee2:e73e:802e:45c1])
        by smtp.gmail.com with ESMTPSA id k7-20020a170906578700b008b904cb2bcdsm8662276ejq.11.2023.03.09.00.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 00:24:53 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/3] dt-bindings: remoteproc: qcom,sm8550-pas: require memory-region
Date:   Thu,  9 Mar 2023 09:24:46 +0100
Message-Id: <20230309082446.37362-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309082446.37362-1-krzysztof.kozlowski@linaro.org>
References: <20230309082446.37362-1-krzysztof.kozlowski@linaro.org>
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

The memory-region is defined in device specific binding, not in
qcom,pas-common.yaml, thus also require it in the same place.

Fixes: 084258d60712 ("dt-bindings: remoteproc: qcom: adsp: document sm8550 adsp, cdsp & mpss compatible")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

