Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63F93786DFC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Aug 2023 13:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241029AbjHXLd7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Aug 2023 07:33:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241027AbjHXLdh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Aug 2023 07:33:37 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EE5819AC
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 04:33:34 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fed6c2a5cfso56289455e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Aug 2023 04:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692876813; x=1693481613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dCQJ0HEmvAIeIzx96XMkOTcNZEHipw/uoFK63652WMA=;
        b=mCCw58ueRn7gnnQUotU8NGbAHpldqhnBr0gymOmH+PCACnYLmKUug5JrUwg32GmKAg
         +Dr9XeP6cjG0+Pz8mNkSpMaQUffe5mIhKVjAsLs1CARtpQPPlXWPwYsC+LWJBSNMKDsf
         iz2qZnAJCg1H0OtQUX/4omMvhzH/akcITZHz6ixGcnJK+8PWoPFl+n7orpAShoFax2qV
         bvl1OQ9zHSndXtYYxu8KPU6yKj4SXR/jLZhuO1dii5MLZyvcbEX/cx+6l3x4tJqs5q22
         c0IYyIYr8t1MHUsRBywImQZiuFCT/z3M9N5Q/wNWN3vcUy6Xp6gqLBoWY+HMkLan3+iZ
         d57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692876813; x=1693481613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dCQJ0HEmvAIeIzx96XMkOTcNZEHipw/uoFK63652WMA=;
        b=KchPhBPVf3LaK9t7liAByk1icWnZmCKcBqNBZW4ZPUpQh8R5+GVBrlonemgjavljwo
         RvW8CYY80Fl2cbvOjot9/hwKF18oIiQ7PUcaeTtLVTqFr0LUVNoR8EopOP+w55Zs9LHN
         YxDPuuEaVGNj0XojlR9xyGLdUhJ1oeivMp3X8W7ychkZutr77DlkEfUpUUNoPEFO2gUD
         06deZ7hidXVo5eRw6fzh/Bz51hiO0uGEDHPfc9ReZyPfDLl9L6wurM8PfgurkI//C6Uh
         k73GDif+SDJo4b9GGrB3hMoUpEZ21WXpu0bemq4DCQBnxNCPorPmEdv2TLrWOv0HH94K
         q4VQ==
X-Gm-Message-State: AOJu0Yy0JwHkWODmb0jA5fEb7zX1zYMyWi1TfGKa+Rg4Uho3wlEX1Cje
        JEQ1b5YaK+cb2OgoVLdweJzeTA==
X-Google-Smtp-Source: AGHT+IHFkOzwoiDKS1M+9awep7UXQ7whHEb5BY5rmtmF3nmAlhVdET+6kklB8fZLrhVT4MA3J2wrSA==
X-Received: by 2002:adf:cd01:0:b0:314:4a15:e557 with SMTP id w1-20020adfcd01000000b003144a15e557mr10889945wrm.5.1692876812822;
        Thu, 24 Aug 2023 04:33:32 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id e11-20020a5d65cb000000b003179d7ed4f3sm22063938wrw.12.2023.08.24.04.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 04:33:32 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Thu, 24 Aug 2023 13:33:21 +0200
Subject: [PATCH v2 2/7] Revert "arm64: dts: qcom: sm8450: Add PRNG"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230824-topic-sm8550-rng-v2-2-dfcafbb16a3e@linaro.org>
References: <20230824-topic-sm8550-rng-v2-0-dfcafbb16a3e@linaro.org>
In-Reply-To: <20230824-topic-sm8550-rng-v2-0-dfcafbb16a3e@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        =?utf-8?q?=EF=BF=BCOm_Prakash_Singh?= <quic_omprsing@quicinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1108;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=CpcmIHORtbvBnd7b5HrtEsUbgbLwtbbEDDTih33SKM0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBk50AHegzZZk+mpLorQ+6F8qmJZ8p5quI6VnOm0qQX
 xGhJJ4qJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZOdABwAKCRB33NvayMhJ0cdND/
 40CjMvgYnxm/vbtutlMq9sSnn4+pPD0vo/OaZUeZ7zViCVoeAA1UPtba4qz/sNRqAnVTtmhjn82Gv0
 4AoUBX1EunWWVl58ysB3Jk8GN1Jaeo9XSiXdGRXIvffSxRr3J4gWkdeQYveaQr19/9UJ0GzHb/1vNZ
 gV9w7E9xM8YPlA40pOOQ8g6gsgNHvtUJlas6tOueXGxW7DRxOeK0HyiZ+IfUytrtwW5c1k82Px5nTC
 /zgeyl0I15Scw58+BPgf5CHUEfPHSxXQkSemB9ExKUnZIJtJpCOYT3xqjU8oEhUvCFZXZhb1wD/Rdf
 BVt/crgLLxT058mQ1mgyuLPKO4OOVJX0IhkqSDq5Z7LIwKEdOTSvv9VzJOmC68fZ8/qtuHPnY3TgLV
 GJqhooZxbPRgo+DecVZRo9D2XrFtS3rkTelP0Jl4LSdWpQZy9taTnOBDAHm0GNEZ5yvhlXs8vRqoxK
 9qNChQa5j4Hecacsaa+Uao/lcSyaL9uJD2DA5HNXx1JcKSFMCBCdEhA51Ej4Elw0urHwz7pXdOaZJb
 RGSPpYS196ub/M3Uefkqz+m6OlyNjDZ4jyBnhlr7nzyc/93Nq4LYShdPrAkSwqcIrvTEEJ8Ch6jx3y
 YDtUCA54fVcIy2Hm4jkOTIFTl4/AoahMDRDt7Rg+wcCDJfvhYrUmY3P9JAXw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This reverts commit 76a6dd7bfcbb ("arm64: dts: qcom: sm8450: Add PRNG"),
since the RNG HW on the SM8450 SoC is in fact a True Random Number Generator,
a more appropriate compatible should be instead as reported at [1].

[1] https://lore.kernel.org/all/20230818161720.3644424-1-quic_omprsing@quicinc.com/

Suggested-by: ￼Om Prakash Singh <quic_omprsing@quicinc.com>
Suggested-by: ￼Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 2a60cf8bd891..6ae64059cea5 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -1738,11 +1738,6 @@ spi14: spi@a98000 {
 			};
 		};
 
-		rng: rng@10c3000 {
-			compatible = "qcom,sm8450-prng-ee", "qcom,prng-ee";
-			reg = <0 0x010c3000 0 0x1000>;
-		};
-
 		pcie0: pci@1c00000 {
 			compatible = "qcom,pcie-sm8450-pcie0";
 			reg = <0 0x01c00000 0 0x3000>,

-- 
2.34.1

