Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D14C667CD19
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 15:00:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230423AbjAZOAI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 09:00:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231596AbjAZN7l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 08:59:41 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6135A6FD33
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 05:59:19 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id b7so1874810wrt.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 05:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KlnEmmK+mxpU2hlLI+Gvfd0nScZypGzNM1BgswRGTnA=;
        b=IWzNaHz5W/tmUnW9Hf4TF4SeahLycM87b/32og4hoTlNnMxtsGbBvj2pgWe580pbA6
         NG2hBXvHBVfg9bJVuuEg8VsTYaH+5K46vmwhs3m+RkcDZFiHQlN7h+k43BX9h3z/Qwlh
         8E1mLcjHbb2kS1ybYdVPiPyQsKApiLocOC5pexqBIjbVE5Uvq9Btxw8GEoHGWruPVqFP
         d2Y/WAZ0LfCzHDoeelDlL6eT/otDwdsgQozsqO0eKJZ6T45BCK81yeHo0lY1kUk513B9
         5yzzS64JfwUnaDsdFFMquQ4BHmQg4py42nB65Cy6VNg4nJUyZCpPghDGwwAeaX/dXAf7
         frQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KlnEmmK+mxpU2hlLI+Gvfd0nScZypGzNM1BgswRGTnA=;
        b=iZe3af7q8iowCkBRXrRjV8bxjagWuhUbRNyRo2uX5hxkCJFkIbgyIoaSb1qb5iX2JE
         dwqbDvKJqCz8fVKiEa56tteLafjy9S3LUosXdNAZrt5DqEIt+2i84iG20rkbfcDgU6/b
         /yzyIZmf4yq8i+4MfqmwgkkZCmYTLSnnO9Jv8HgorUUYTMjKU7MKLdrahWCcniD//ezq
         zDTe8QYsbYR2L9CZFZXI4+1COrxiUnrf3V7Lx+Y9+iaSsl8ioPzumEgO81ees38H04OT
         H7WhJvThHPBNTgpaFHU5ONmcUKMaAbWzkgetWIqbNUjIO9uXEEIU2pSbqQN6mu1Vo7Xa
         II9A==
X-Gm-Message-State: AO0yUKWSaHZeZ/JGjRZy2gxVVQtR//0Xae3s3U5KtvStIoX/Jealkhv0
        RxLC60FXLz1ocTs3rvmP+FNCLA==
X-Google-Smtp-Source: AK7set8FggxXcVZ9bPoTKpa6BTjp5VcePXjKwDkgSRvp/bmVaGp9bs2/Grj6AF+6XjnS6/2VtV91Pg==
X-Received: by 2002:a5d:6dd2:0:b0:2bf:b0e6:f463 with SMTP id d18-20020a5d6dd2000000b002bfb0e6f463mr8183168wrz.13.1674741557794;
        Thu, 26 Jan 2023 05:59:17 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id l15-20020a5d6d8f000000b002bfb37497a8sm1594067wrs.31.2023.01.26.05.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 05:59:17 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-phy@lists.infradead.org
Subject: [RFC v2 3/7] dt-bindings: mfd: qcom,spmi-pmic: Add pattern property for phy
Date:   Thu, 26 Jan 2023 15:59:05 +0200
Message-Id: <20230126135909.1624890-4-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126135909.1624890-1-abel.vesa@linaro.org>
References: <20230126135909.1624890-1-abel.vesa@linaro.org>
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

The phy pattern property will be used for providing eUSB2 repeater
functionality. This will be modelled as a Qualcomm PHY driver.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index adf88245c409..1e6fadec1301 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -135,6 +135,10 @@ patternProperties:
     type: object
     $ref: /schemas/pinctrl/qcom,pmic-gpio.yaml#
 
+  "phy@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/phy/qcom,snps-eusb2-repeater.yaml#
+
   "pon@[0-9a-f]+$":
     type: object
     $ref: /schemas/power/reset/qcom,pon.yaml#
-- 
2.34.1

