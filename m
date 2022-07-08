Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5905556B531
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jul 2022 11:17:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237668AbiGHJRC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jul 2022 05:17:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237784AbiGHJRB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jul 2022 05:17:01 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 016F324F3E
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jul 2022 02:17:01 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id i18so35318741lfu.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jul 2022 02:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iAQx/uD//KZplcIf17mKmrkwaSgdfWCTgLFjJOi8JBA=;
        b=G37s2NrkgokNaWwM8WGpexkBR7YMFr2XCYfUDbtLwLT3/svi41rApTAx0p3AOjtEu5
         Ed1kx0H0tOUvaOa5KxesOdsnRz374tG4Dy+Nff1IktGKvmXEBVttB33Sym2C4li3lULT
         u+S7sCkrKig3+FUZUPxovG4fki5gu4tIXUVqh4bGShibYuWuYc92LjS94/in8erMRvnI
         qMrH0Um5sqjB+rGaCl3yQWA8Kws77ylUjbo1mlvIC8pd0Q8DRtfcECmNj5zC7RAvptUT
         MhRzw6xSJUv+xnu/QjDJ5t6MPBjtwvcEPBuvyRFku/kfQ6aVmpSFwtjhtsU/UvHK0ItP
         xK5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iAQx/uD//KZplcIf17mKmrkwaSgdfWCTgLFjJOi8JBA=;
        b=koYfMBzhy9vzBokq2HRozXyNye1J17G3Cfyz2F+e2Pshaa0EU2cKGATHvOIhcRWnXO
         6Mkd087r3YvH/VBDLP5Wxur/U9ximTSVRiz7jlme+w3M+Vte/3vQIPnynMXxGHSlP7ZY
         4QbXe3eQlWqbeSnCl7XLnIdXV/Frudt0jPIlj+paGeRZnQhk1erUbl/sUle4KlwrXG3E
         FEv043kCoSn64CRZ5lWbnyujoEOUsfi/VryynMwQfdW+AZzWiMhUFe0uHNuTIs5mux8e
         lCsOCW4cnBsAcAZJ+8i+V9rbLfhI8hnfHU0l51376qkyHzBa9/xAVMG2HXXYtBAjNyen
         O1Gg==
X-Gm-Message-State: AJIora8cpO3BwfTcwvCdxay0JZcGLLCHor2NBVSvQM0PsXmPGhZPb2NO
        M4Gfqy2/fc49WQxa1WXgt4UPHw==
X-Google-Smtp-Source: AGRyM1tyOYpIXe6+OblzFsdcTHoN0WHxmy+DsK3XcbZXUdEKy3DvSroBO5Hewm9jcaeiqnSPFoMuyQ==
X-Received: by 2002:a05:6512:3188:b0:484:5cb:5040 with SMTP id i8-20020a056512318800b0048405cb5040mr1768831lfe.487.1657271819372;
        Fri, 08 Jul 2022 02:16:59 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d12-20020a05651c004c00b0025d52cb8c0csm567651ljd.31.2022.07.08.02.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 02:16:58 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: sm8250: rename DPU device node
Date:   Fri,  8 Jul 2022 12:16:56 +0300
Message-Id: <20220708091656.2769390-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220708091656.2769390-1-dmitry.baryshkov@linaro.org>
References: <20220708091656.2769390-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rename DPU device node to display-controller@ae01000 to follow the
DPU schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 43c2d04b226f..48c60df59080 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3444,7 +3444,7 @@ mdss: mdss@ae00000 {
 			#size-cells = <2>;
 			ranges;
 
-			mdss_mdp: mdp@ae01000 {
+			mdss_mdp: display-controller@ae01000 {
 				compatible = "qcom,sm8250-dpu";
 				reg = <0 0x0ae01000 0 0x8f000>,
 				      <0 0x0aeb0000 0 0x2008>;
-- 
2.35.1

