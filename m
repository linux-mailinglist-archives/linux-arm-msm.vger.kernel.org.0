Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A492E68F726
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Feb 2023 19:39:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbjBHSiz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 13:38:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231253AbjBHSiZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 13:38:25 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1CAD5581
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 10:38:21 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id fi26so21725461edb.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Feb 2023 10:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbuCsaZiHtUTgOWZDPPWu8eIqChDJtTAhqjY0efOttk=;
        b=vguUz3jiIdB2R73Kp3HvwxlqAKmEGdrkEvgWB6XYdGVj6HJQY58L6k9lGiT57RkYfU
         7ckzi3ZPcTr96wO34ptnTqRvVuYe4tKoFP8RUSRpHf6S/DxuF5fUgD6ampUEuqaXrsl6
         +NE88NdS4yeIUvMmEMK73aWnqrCAwVWBJDXUeQRhURW5Jsb92Xxu5GWsPmv793SIhTjp
         dUenPPFBAu3x9NeON49jYAFtkSul4gMfiNkLypHQKzRMInDzGPMSNrs/ZD3eSF3A9zDI
         Hwo3w9GMhq8a8Lwyh6Z+XkFz3GDQSVnFi2neMRXW/fRzHv/z7t7tDw7O2wqmLgLzm426
         hWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kbuCsaZiHtUTgOWZDPPWu8eIqChDJtTAhqjY0efOttk=;
        b=VHghxga3N5noovSZyFiB0lNlPG3i9ksbhw+qd1Ung+lEwsGrPKjZxQKRf+GPp+K8Ya
         9rAekvVAvB58OZ8XHY7qxXFnrZDIVavDtSAaSHoY2Vzpgs/e9CPk/6IeQqJ/FxbHXsXY
         PxAIbenyLUqabUsn7dCkGeW24cPHN/W4b94DI4lOSn84AsZGXkhpiyNCXEiFZQA9EwNa
         X89/Z8k1ypiWRrFsHX8epGwa5dBu6Qffdy6Erhu2z5nNFQnKi/YA09bEzl2lJoOeUj0U
         L53oqV1jGdHjNtOShOIZXue7fQWh3NhEe7mtARx7YmbyIJ1tdIFaMtKP7w3dOA/NNqnU
         tUiA==
X-Gm-Message-State: AO0yUKXoRwJHb9fOfQVi8y6texV8WNMppAX6INwvJQaoG0VIDwLyxRAS
        Lu9XtmU2JmePwi1ccuBNjqJwkw==
X-Google-Smtp-Source: AK7set9I5yLGkPPfqYDV0wpLjNDuJD6rrJGD9rHgKxNqFPz95yOhZ9oj5sdKmM7AdwpH1HV4/osDgw==
X-Received: by 2002:a05:6402:278a:b0:4aa:b394:7b28 with SMTP id b10-20020a056402278a00b004aab3947b28mr10466401ede.3.1675881500257;
        Wed, 08 Feb 2023 10:38:20 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id d22-20020a50cd56000000b004aaa8e65d0esm5179663edj.84.2023.02.08.10.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 10:38:19 -0800 (PST)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org
Subject: [PATCH v9 07/14] arm: dts: qcom: ipq4019: update a compatible for QCE IP on IPQ4019 SoC
Date:   Wed,  8 Feb 2023 20:37:48 +0200
Message-Id: <20230208183755.2907771-8-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230208183755.2907771-1-vladimir.zapolskiy@linaro.org>
References: <20230208183755.2907771-1-vladimir.zapolskiy@linaro.org>
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

Change the old deprecated compatible name to a new one, which is specific
to IPQ4019 SoC.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm/boot/dts/qcom-ipq4019.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index a73c3a17b6a4..c73098d7a4da 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -314,7 +314,7 @@ cryptobam: dma-controller@8e04000 {
 		};
 
 		crypto: crypto@8e3a000 {
-			compatible = "qcom,crypto-v5.1";
+			compatible = "qcom,ipq4019-qce";
 			reg = <0x08e3a000 0x6000>;
 			clocks = <&gcc GCC_CRYPTO_AHB_CLK>,
 				 <&gcc GCC_CRYPTO_AXI_CLK>,
-- 
2.33.0

