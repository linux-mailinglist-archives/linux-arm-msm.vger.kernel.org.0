Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B46668F729
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Feb 2023 19:39:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbjBHSiy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 13:38:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231331AbjBHSi0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 13:38:26 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 194E926873
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 10:38:23 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id fj20so3224666edb.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Feb 2023 10:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cz0oWSthv9m1vHslRMrBSvak5CO+z8/t3E9oDupBv5U=;
        b=pWhVGcXPExfi7kwQnUxS6iOPVL21CHnr7uVJorN8HWlfHjeMhoySFEWl/pmDFYM55j
         ATMOBMjKW+OPbgvLSqOgAfUt78rZuezele90NElHFZ3+GoX35Ga078wIoXpm47ultTY7
         Neau8+D0Uj6spo80LPFaWt2FYMvv7BP2qrBOzFkXcd3UWkIkTU+5ZU92axp6M0DMEG5P
         0BDAnw/p3boKWl/cGTib1A9SWt+Rud3z+KiZcIsmFUXgmu6yQ075rWxAlBVvrxq8+s3N
         Qf6j0PMnwb9f9uKGVQe4DoGuktu3vPpdHsdnZPii2dhHQGHxVcHR+ZQbQAxD6ti2rY3u
         /qxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cz0oWSthv9m1vHslRMrBSvak5CO+z8/t3E9oDupBv5U=;
        b=rlch8uGNbQCnTb8X7QWGmBb71XdwEmzpjVMQUiWxIz8pAwZm1PDSTTCB+Tt+OP2bvk
         OGeFcYQqs+2BVZ77dF6YNxGYucvpmqWWVvbVitHCrFVpNVlJpTqvgevwQnLe5maT7cw+
         k3mD9c8vJk+zOkrjDsOV2v635PZIXdqKmmmty7OTLzxHh3WdeOhAgrGkx/e6qlG4w8vB
         DvjBLfg/1IIWXPIht+CQhZYmKRdBqHs9R6AlRFpmhzIXTBWCtMvRNsyWDQR383Ej2Sb+
         STZLWLIreOWj0iz3YBpqlmO9T0nIcTH+6321gQAMWmJ+XoWREFcRNkjARXZwegMw6NzZ
         Kuqg==
X-Gm-Message-State: AO0yUKUpYgEVTUh5Vh1yuWdqia0NMqYdDwbTiMGP8rv1Vjdor23tIQY6
        isVdSKv9Q/YjhMxtmb+jtwKzWA==
X-Google-Smtp-Source: AK7set9ag2bJyP6dEaevJZh2YbJ3Hl7I50yjzbGsfBpdCNayUpDBXicgrx6S4fcxrMcDrypiyGeQYQ==
X-Received: by 2002:a05:6402:510f:b0:4aa:a515:58ad with SMTP id m15-20020a056402510f00b004aaa51558admr11003494edd.0.1675881501709;
        Wed, 08 Feb 2023 10:38:21 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id d22-20020a50cd56000000b004aaa8e65d0esm5179663edj.84.2023.02.08.10.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 10:38:21 -0800 (PST)
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
Subject: [PATCH v9 08/14] arm64: dts: qcom: msm8996: update QCE compatible according to a new scheme
Date:   Wed,  8 Feb 2023 20:37:49 +0200
Message-Id: <20230208183755.2907771-9-vladimir.zapolskiy@linaro.org>
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

Change the old deprecated compatible name of QCE IP on MSM8996 to new ones
based on SoC name.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 55180586f7b6..fe9a769afa37 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -784,7 +784,7 @@ cryptobam: dma-controller@644000 {
 		};
 
 		crypto: crypto@67a000 {
-			compatible = "qcom,crypto-v5.4";
+			compatible = "qcom,msm8996-qce", "qcom,ipq4019-qce";
 			reg = <0x0067a000 0x6000>;
 			clocks = <&gcc GCC_CE1_AHB_CLK>,
 				 <&gcc GCC_CE1_AXI_CLK>,
-- 
2.33.0

