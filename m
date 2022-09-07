Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7C325AF8C0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 02:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbiIGABZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Sep 2022 20:01:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbiIGABW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Sep 2022 20:01:22 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3339485F99
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Sep 2022 17:01:18 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id n23-20020a7bc5d7000000b003a62f19b453so10660518wmk.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 17:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=vclvmlLvohHRdJ7knQEym+KvRsUwVjJirjSPTuxV7DI=;
        b=OFMsGmiYZOrtNqLB38l35e0AQqkWbaKshKl14A2Jww2zC5eiM7A2y7+TcELW8WFdf7
         olaLIaLMhWJvCwuEzuhciNwBhbHbg6zkm8Ojvb1RQjqNwVSf8zuzivcFjx9P1VFiJUvM
         cCOD3A4uAoaWZokEZm6NLj3bAQ7EQJD65zvxtoa1NIc1FsvtcGjTuVeg+G5afjZ3H3fi
         9wgL4fxENdc4+hMHM6m8JzGlFuFOGkUMr7MPba8wWy3cBb9lQVbjpOgBSxT2oQ6INnwl
         9dzn4TDJ/4iFmqF0gDViUWPxqireu0cZ7h8cYtpic0+QT2RzlJaDL62u0/Nc9aNbYQYs
         O26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=vclvmlLvohHRdJ7knQEym+KvRsUwVjJirjSPTuxV7DI=;
        b=GpMbMxFUyCs4MUXOnOSKEeYpBOReyARlr3TgLXPMv22XdMmm1fzoN5dA2COD6RkQIk
         4pGeIP09/FK0qIr2sl1fHwXDGUv6LTKpB5f+dAWhLt4dDKIHwBRs+LRWODxQbakizcJe
         Poclt/QnwBWxD2zs/7hdsX8u5BRaGxP2QLkwKC2awvk+2Qbj7j1VsHg1LnZv9ZDA2bge
         lfc3X2/l6W8D1cQ62si2IZ6mtB490rlXbSJxKF4oTUULBJjEegQEzeMuxTjH4x+0No4s
         MhCL+E89l6dKzKoGNUE8oV9aK1BFvkGYur4IobEvI1pg0+Bu2xbl2IiiCG9pZWtHfaDa
         26TQ==
X-Gm-Message-State: ACgBeo0hwv2SHtEeSzoBIATpeNxm8XuCXk30q9YXYB66VgmgPKwHd+l6
        7Q2rsrCIz2Ev+NKEcSIncIUkuQ==
X-Google-Smtp-Source: AA6agR686TZotnWrFKBBTVdfFMJGx0udkFGcsCgKOL5qyuIAfp80xG2bayoVE23xJ8cSINslfoJe6A==
X-Received: by 2002:a05:600c:4ec7:b0:3a8:4622:ad27 with SMTP id g7-20020a05600c4ec700b003a84622ad27mr453315wmq.88.1662508876860;
        Tue, 06 Sep 2022 17:01:16 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g13-20020a05600c4ecd00b003a4c6e67f01sm26848613wmq.6.2022.09.06.17.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 17:01:16 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, quic_mkrishn@quicinc.com,
        agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH 09/11] arm64: dts: qcom: sdm630: Drop redundant phy-names from DSI controller
Date:   Wed,  7 Sep 2022 01:01:03 +0100
Message-Id: <20220907000105.786265-10-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220907000105.786265-1-bryan.odonoghue@linaro.org>
References: <20220907000105.786265-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

phy-names has been marked deprecated. Remove it from the sdm630 DSI
controller block.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 1bc9091cad2a8..caf424a449be1 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1610,7 +1610,6 @@ dsi0: dsi@c994000 {
 					      "core";
 
 				phys = <&dsi0_phy>;
-				phy-names = "dsi";
 
 				status = "disabled";
 
-- 
2.37.3

