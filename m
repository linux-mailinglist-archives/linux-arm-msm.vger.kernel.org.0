Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F7566E8366
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Apr 2023 23:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232125AbjDSVTl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Apr 2023 17:19:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232152AbjDSVT0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Apr 2023 17:19:26 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 236C983CD
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 14:19:17 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id dx24so1558464ejb.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 14:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681939156; x=1684531156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pgV9gLIw8KIyaZVJKOJQGmw2nzCbvy4vCA2f/p3aIfA=;
        b=v2k7ld4rqKM5WFdVNaqYJC/ENfwmNNljk87AixPUiCkXbzzhm7siHGRtmau8CstETK
         skMQXfua+1PJfhEE0pnwc7Fq3V9RxsZ8ofADdw7gBR2EjV9T2BDj1eVZhJabjPEHa3oS
         NWq3/UbUhoGeQi9a92TDT90dPJ2dDCc58jucaRb0x9knQE2mRou6wEZ6v6B35E4d4VXw
         2hEMBTNewCO35Kk4LzsKbccZEMbv736eitJbWDBKFcnJ3NPIlFj84GdCLG6yWIEhSAd9
         Ao+O9gCQEPL+TjnuklLXmSz10L0sOcpFO9oEvH5SwyWcIQfApOTuEv8KLcTvQiXI5G4j
         kOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681939156; x=1684531156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pgV9gLIw8KIyaZVJKOJQGmw2nzCbvy4vCA2f/p3aIfA=;
        b=UP4eYsbpZCu1AuAJ5cBhZnqR4dDG8O3A8yGGiGz7+T2VQC5i3Y1N/By0PgZa1SYmCp
         xUZO4ymB+E9BQymCK/xijPnyDF8eFnxtM7yt80eAJ8aEfDU4Nf21/i9gUDjiMc4dQpjB
         gO/0ECboum8N9E7Gebzj2bSHRQTxJkvBwN4aNlblOeOrAawYxu//IAvM5f4SrBfrGumz
         ETT0dTM5hE4N8im4g5SZcw3x2TLoRF7KR1fEJ3KHVipSwtoXs7mV4YZfn0X4A1wxn7OI
         zoPx7hB2pUJtA1h2J0nebZk1UXe8k3+qZfc7CFmB2PTDdi504uJ1GamPo4wVbFZm0z50
         wKQA==
X-Gm-Message-State: AAQBX9eQQSht5hxVK16yFDcLvDFjllcSwyx1RRznMF8k4rhI2k3xgMek
        RD7XiDmHux7JgAhkrbDtiIgFoA==
X-Google-Smtp-Source: AKy350b8TyS8e4RJK7HKeCyDCF3SxKuiLiqCNW+MlO11l1wsVkINRYzRyk+Isa9VKvOO8nTt4bAs+Q==
X-Received: by 2002:a17:906:7f0e:b0:952:b51d:5086 with SMTP id d14-20020a1709067f0e00b00952b51d5086mr6342726ejr.57.1681939156508;
        Wed, 19 Apr 2023 14:19:16 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:976c:1d6c:6ed0:8935])
        by smtp.gmail.com with ESMTPSA id a12-20020a17090682cc00b0094f109a5b3asm7092739ejy.135.2023.04.19.14.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 14:19:16 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Todor Tomov <todor.too@gmail.com>,
        "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Adam Skladowski <a39.skl@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Robert Foss <rfoss@kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Molly Sophia <mollysophia379@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 11/18] arm64: dts: qcom: sdm845: correct camss unit address
Date:   Wed, 19 Apr 2023 23:18:49 +0200
Message-Id: <20230419211856.79332-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419211856.79332-1-krzysztof.kozlowski@linaro.org>
References: <20230419211856.79332-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Match unit-address to reg entry to fix dtbs W=1 warnings:

  Warning (simple_bus_reg): /soc@0/camss@a00000: simple-bus unit address format error, expected "acb3000"

Fixes: d48a6698a6b7 ("arm64: dts: qcom: sdm845: Add CAMSS ISP node")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index cdeb05e95674..8f99e79ba3fd 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4238,7 +4238,7 @@ videocc: clock-controller@ab00000 {
 			#reset-cells = <1>;
 		};
 
-		camss: camss@a00000 {
+		camss: camss@acb3000 {
 			compatible = "qcom,sdm845-camss";
 
 			reg = <0 0x0acb3000 0 0x1000>,
-- 
2.34.1

