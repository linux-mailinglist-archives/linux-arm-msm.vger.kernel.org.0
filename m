Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 860DD6E8A7B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 08:36:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233963AbjDTGgY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 02:36:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233947AbjDTGgU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 02:36:20 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDC844C00
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 23:36:16 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-94f7a0818aeso36750666b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 23:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681972575; x=1684564575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fd+WmOuvZDqpOrb3c5W9KpeObjjYn8+pBoDPkIFF8g=;
        b=r3p2Ka6ztFemVweAY7E0l9pl5aAbRBDgiC+59fmR1QaqnyOIz+5oN7dCXk/Rt2qTcI
         oBkhSF64FwIRbEDxVsaNeOJDvXDHE+vaRPTCONU8412BgiTZ2hKnDda895bln1IaM3tK
         I73C4Eaxcb+CUHyfoPNzUI95XWFShpPoSbwHBYo7rFPsVaXTC89kFvZNBj/O3qMYebwE
         zJeegvkByzobSIxKnff3PBeZ0F/fFs4N1daleyHlFWpsJe0zC+vAIlJEu+R5vYlGznvJ
         6qgcIKOVx1k8AEKDFptJcmU0MVn7/bFIapitrIyj/boGw79BLYkgO33yP21868sy5nSo
         mTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681972575; x=1684564575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/fd+WmOuvZDqpOrb3c5W9KpeObjjYn8+pBoDPkIFF8g=;
        b=RQwy6kCTJR1JTSc7gKEIEEx6LF/ceYbYl7Wv7xZV0ifzhxg4SDgtcjDEIERvdUfl4v
         l09LRIUW+KcDqWYOB09fYB+i9J5d6PtATjMMAu5uhdTD4pvz+yQBcMkxsavTaFztRLtz
         wsOqS6uVdvQ1BqIYS7CSx2cd4ej7i81BfN6gXsAVFbMRh2N7zwE6/ilrDW0/HheWa03i
         jM+S7IjKG+mpzVdbtaZDNQnLqtZoIyqH0KWL9lPly/byzgDSE/WvgTXVrNr9SIRwWck4
         bynK/cW07aJXHW0XvStzdXOFTHmoNMGOor9BqWAiYPuc0UzIIN22ZXKZV3g2LbP17gbu
         FTWg==
X-Gm-Message-State: AAQBX9dA/SeFZjSSDkiE/UJhVvsRzlFhLuWAkFb2l31q+E5TlN9sxDKu
        oUtoMn3G/V5GeQpehKCnHrQkdw==
X-Google-Smtp-Source: AKy350ZWIRqLA0WOSh07l+hVGAh/6mTcl0qoyuNhKqQCAAJLGWwLMekF2sfdkP//YA+PXWsb63Ha+A==
X-Received: by 2002:a05:6402:510:b0:504:9394:188c with SMTP id m16-20020a056402051000b005049394188cmr614146edv.9.1681972575362;
        Wed, 19 Apr 2023 23:36:15 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:bcb8:77e6:8f45:4771])
        by smtp.gmail.com with ESMTPSA id f7-20020a05640214c700b004fa380a14e7sm395342edx.77.2023.04.19.23.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 23:36:14 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/7] arm64: dts: qcom: ipq8074: add unit address to soc node
Date:   Thu, 20 Apr 2023 08:36:05 +0200
Message-Id: <20230420063610.11068-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420063610.11068-1-krzysztof.kozlowski@linaro.org>
References: <20230420063610.11068-1-krzysztof.kozlowski@linaro.org>
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

"soc" node is supposed to have unit address:

  Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 84e715aa4310..c9d679bfc10b 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -105,7 +105,7 @@ scm {
 		};
 	};
 
-	soc: soc {
+	soc: soc@0 {
 		#address-cells = <0x1>;
 		#size-cells = <0x1>;
 		ranges = <0 0 0 0xffffffff>;
-- 
2.34.1

