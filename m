Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D751D73A042
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jun 2023 13:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231156AbjFVL6e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jun 2023 07:58:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbjFVL6E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jun 2023 07:58:04 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F30F41FF2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 04:58:00 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f954d78bf8so4281656e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 04:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687435079; x=1690027079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZILjfplVkyXwwY/Vk9vNMVAT/CrFw5qFILje9oH7ZxI=;
        b=LFBzzcgBhdvdLMdLBlLx7ZI7Tbs8dLvXoX+sZiLRdvnn1fl4QQpTvnEsaiC+BagjKr
         2XFndg/MxLlKknPcrXMlBOWXB0SWNWyMyS8FiCFTGRq3utGkWa/T2QpN2rZte6NigmUR
         tiPBaoyKKNyE5NvyH7vm14STfo/RCdqaLQyd1sYX8ts6f3kg0x4icfNr/+m8YX3YKSJh
         wrRTGLdPOzbKMFiatMpycMLTtgFmujXhcEdEHewhtQoebwEQLl98pEOSEEdzVBO6XBf6
         84UdRTCigMjnJCmQ1wEo8+rMR6grFI6lS6zWRzKt9UdpRw+msamfuH7ZrHBLwDer2YZ9
         zXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687435079; x=1690027079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZILjfplVkyXwwY/Vk9vNMVAT/CrFw5qFILje9oH7ZxI=;
        b=bfutZhgZfH2FI7KfLcJxoaStcsUmJk1ihasFrnXtPw3nC/LYwM4qZHbl06+IFklJgM
         C1aJOBtMlzXHfQ0efKnDMI5Z0M1s5OtU+sxWCuDehrWyXMRyMpgImQ3FblmCt8Tz9vpR
         tVEB0P45faGJyQV+4ZnQO6nWKGx5ENxaVbkDqso4Ct5kZMylb5JOoegl4GCtn5AjLScJ
         nJoruLwEu1p6n3+1/Cc3ZFmz3tYe9COwV7WCm8EWxANTaTY1twcVFp8SJrUCvEM0sc+T
         ddcBoy+51KnnUAHFkf2vNyf+bdT5xz+UJ64VvKpQ+SUMiGXIHsYzLxsgX1HzsEez5wfa
         OX6Q==
X-Gm-Message-State: AC+VfDzfo3J1IuFDRQzcZ/CD4d9mAhhb/w+ZmfY6Vq0h22fYlcdG6vIn
        GzGeNFyYIhVA1Dn87v2soS0RDQ==
X-Google-Smtp-Source: ACHHUZ7m4PyiYoTIiAFmkVfe+HaWu+zBYTvJH1Wb7MrWlmzq7NpPoY3WEY2HlcXIYUgaxMcM6zzbWQ==
X-Received: by 2002:a19:711c:0:b0:4f6:3000:4d5a with SMTP id m28-20020a19711c000000b004f630004d5amr10848140lfc.38.1687435079156;
        Thu, 22 Jun 2023 04:57:59 -0700 (PDT)
Received: from [192.168.1.101] (abyl165.neoplus.adsl.tpnet.pl. [83.9.31.165])
        by smtp.gmail.com with ESMTPSA id eq21-20020a056512489500b004f4c3feb9fbsm1099235lfb.61.2023.06.22.04.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 04:57:58 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Thu, 22 Jun 2023 13:57:48 +0200
Subject: [PATCH 8/9] arm64: dts: qcom: msm8998: Use the correct GPLL0 leg
 for GPUCC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230622-topic-8998clk-v1-8-5b7a0d6e98b1@linaro.org>
References: <20230622-topic-8998clk-v1-0-5b7a0d6e98b1@linaro.org>
In-Reply-To: <20230622-topic-8998clk-v1-0-5b7a0d6e98b1@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687435067; l=738;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ih+ryM16TgO1zmWBZ5fg0NCby9pNBTJkiA0FEt7oBOI=;
 b=3x7GPBHGo/0XQ3mC4GY7XNBfXJTntEfg2XEHTbDuKkHQXoTAbrtUce1oLaNP9lDyknU0kLBdt
 UNjKraJy5nODREE6ElWLP7/tZhZTPee5Ge0CwmJkHSYDHd7PSGbWTdk
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

GPUCC has its own GPLL0 leg, switch to it to allow shutting it down
when it's unused.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index f0e943ff0046..74bd05579796 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1574,7 +1574,7 @@ gpucc: clock-controller@5065000 {
 			reg = <0x05065000 0x9000>;
 
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
-				 <&gcc GPLL0_OUT_MAIN>;
+				 <&gcc GCC_GPU_GPLL0_CLK>;
 			clock-names = "xo",
 				      "gpll0";
 		};

-- 
2.41.0

