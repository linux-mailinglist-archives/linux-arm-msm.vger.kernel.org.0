Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA3AA68D5C2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 12:41:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231661AbjBGLlB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Feb 2023 06:41:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231709AbjBGLky (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Feb 2023 06:40:54 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DB1D14E9E
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Feb 2023 03:40:49 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id bg5-20020a05600c3c8500b003e00c739ce4so2569955wmb.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Feb 2023 03:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TxBtF1ODPOfrnP1uvkmtykMhTcc0CM2qY3ptrcM0tQo=;
        b=DAFh39XfA9JjnQDq/uKysmd+vXgWAUhMx2Mk+bDCWM8/x216dDgDSOOBiK17ArSL+z
         jsKC4z9SdecAc1zUcGM/3HHsm4+h5FBUXmehi13Nqxz80hI2X+R82I2T2CZWPoh/0Mpj
         T8x/moUuBMbabgbd1z1AaW8V0GI/KytMa3/TEVaW5zvtDvHlBADIQQ8/JDuFBZLLgeLj
         1VJf3+4N6JOlslL6SIHbXxUDRFqEEPRaE7skgjksEh3mxv18sCK0hmckewV+o9JKfEPj
         BEkOruFsByEJfdJIBtvXPrn/+EWX69mmqamIFQFJYMcorHT1wXaY9/KPWBzwS+GN8p4c
         3XJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TxBtF1ODPOfrnP1uvkmtykMhTcc0CM2qY3ptrcM0tQo=;
        b=YBcxmu7CHM4BA4TDp4INFpmD6hXeM8IV/msaAQYvT6BqWit8RPvNcz+x4CM1WlQkLy
         1t8jVzlrDVB4WzoYfoVKckRnoSNiaxl79pjLiF6KnpOlHbdOdX89djwlAIG3v7dXtb+E
         8GDX0w8eRVXdYX0yUMxP25Xb1JndDSxoougQWEwmfdAzHMGHgM++gCeIeLh8Fj6DVWCi
         veKcZK10IZ40X73Nu5e+mldPTlaBR2shYMKytEEZ3nXqzMYTv4Ai4+xDdxvpjKHaaYVt
         w1m6uOCoBckxGw+7pKbSb+IsJsJdIdNoYKZ3aZ9uecQEh6XWQ9SrHU4y7HE1n4yWuvXq
         6B8A==
X-Gm-Message-State: AO0yUKXPkrS1+VerJ611RuAIAQr83SqFL3Dio9RL5TuK6PmhETZ1VLRk
        4Uu4LVYvZHnURHFEWzCdw7oIkA==
X-Google-Smtp-Source: AK7set8Otdf1st+dq00tU/Rmozb+djdNHI2LVyZrhllm030UHikPlPhdgDKTteBEQPkvLhvix5TCvg==
X-Received: by 2002:a05:600c:829:b0:3dd:1c45:a36d with SMTP id k41-20020a05600c082900b003dd1c45a36dmr1710771wmp.27.1675770048096;
        Tue, 07 Feb 2023 03:40:48 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id c7-20020a05600c0ac700b003d1d5a83b2esm18326005wmr.35.2023.02.07.03.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 03:40:47 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 3/6] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: Document SM8550 compatible
Date:   Tue,  7 Feb 2023 13:40:21 +0200
Message-Id: <20230207114024.944314-4-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230207114024.944314-1-abel.vesa@linaro.org>
References: <20230207114024.944314-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the SM8550 compatible to the list.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
---

The v4 version of this patch was here:
https://lore.kernel.org/all/20230202132511.3983095-4-abel.vesa@linaro.org/

Changes since v4:
 * added Johan's R-b tag
 * changed qcom,qmp-usb to qcom,sc8280xp-qmp-usb43dp in subject line

Changes since v3:
 * added Rob's A-b tag

Changes since v2:
 * none

Changes since v1:
 * moved to sc8280xp bindings

 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 0764cd977e76..83944959d394 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - qcom,sc8280xp-qmp-usb43dp-phy
       - qcom,sm6350-qmp-usb3-dp-phy
+      - qcom,sm8550-qmp-usb3-dp-phy
 
   reg:
     maxItems: 1
-- 
2.34.1

