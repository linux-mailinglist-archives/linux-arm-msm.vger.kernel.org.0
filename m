Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E20BD590EED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Aug 2022 12:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238206AbiHLKNx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Aug 2022 06:13:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238127AbiHLKNa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Aug 2022 06:13:30 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDBA9AB4C2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Aug 2022 03:12:43 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id az6-20020a05600c600600b003a530cebbe3so318779wmb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Aug 2022 03:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=/baD4T2Xvbw5aG3hrD8e631/CGqG+7CyLxE9ixUCKNA=;
        b=zF4+7WvPYPbP19vhZJfJU5/gMyjua4wMNYXUD0fdQV/O6VT0DCGgRSmhl1DUvvjTgZ
         NFLaV7CHJO3iMvinSJCO4bq/Yymo6qHrrWHpbOjE/dM1LDZ2wPIDg4Aod8CkwRMRpwk+
         do2BUymZ/kGSvWx8zrSFhMXI+0OeJNKURKQGBrwosU9rkAV9MXE7o7HYAPJk8aEV0GZ6
         YEcB/NLXYodRdvOF1JC3OE0vn+1sI5SWRJVYb8UGMPpIMajp0YmEfYVKENfsIv2flc1F
         slm4y5gdBu6lDQPrpXAWwWoRa7AHVQA4Mc5XIWoS0yQ5Z2IH+UBYpjUeAharCWQwMCLv
         h9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=/baD4T2Xvbw5aG3hrD8e631/CGqG+7CyLxE9ixUCKNA=;
        b=1RkOO4lZHpkQFxH12Z1Oaa3y8zlw9CFEuHeHL38RfCtcD4Ubvlu8Jyo2A1z3OLgkEv
         SBGA0eGi8RyoBoIIrjniY/FiqgfCerxbEYQydLEnC0kQW+IjsFkGcmWZHzGDDLO13s6G
         0rFqfyuu92F5mqr0WD0K3TsXM0+AlIxbXz+GtqML5n/XhTdy3kCGukbLzzQTQS1QLw2T
         KBPAIIkvte/t38rventEh1S6h4VpswKiP7yuxcUwqPAp6bAKtfqOzuFDaAPGktaS7D3X
         T493OFeSGrDhUw7/Z19O7VjB1OUNOk0X6OHYNTGwcvqBb5axTYlDHn1rNw69GNWbu3HN
         V0Tg==
X-Gm-Message-State: ACgBeo2PYu6x6btm0IQ05nGISBwgc13nEthYgU2x5sbzqocykfJjX+hk
        lbc0GyjeZw9U8KdDbpd9/6lk4wyEFkV+Gg==
X-Google-Smtp-Source: AA6agR5refm7abOpJRHUMi7R1wY5PeY6g6GVPeUjoVLj1v+XfGSFN14+EpCRZkHIDjyfAbRLHbQzXw==
X-Received: by 2002:a05:600c:1e8f:b0:3a4:e0f0:4bad with SMTP id be15-20020a05600c1e8f00b003a4e0f04badmr2127432wmb.133.1660299162292;
        Fri, 12 Aug 2022 03:12:42 -0700 (PDT)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id e25-20020a05600c219900b003a541d893desm2193204wme.38.2022.08.12.03.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 03:12:41 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/4] arm64: dts: qcom: sdm845: Reduce reg size for aoss_qmp
Date:   Fri, 12 Aug 2022 13:12:37 +0300
Message-Id: <20220812101240.1869605-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Like on the other platforms that provide RPMh stats, on SDM845, the
aoss_qmp reg size needs to be reduced to its actual size of 0x400,
otherwise it will overlap with the RPMh stats reg base, node that will
be added later on.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---

No changes since v1.

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index f0e286715d1b..5bea96a9ce06 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4836,7 +4836,7 @@ aoss_reset: reset-controller@c2a0000 {
 
 		aoss_qmp: power-controller@c300000 {
 			compatible = "qcom,sdm845-aoss-qmp", "qcom,aoss-qmp";
-			reg = <0 0x0c300000 0 0x100000>;
+			reg = <0 0x0c300000 0 0x400>;
 			interrupts = <GIC_SPI 389 IRQ_TYPE_EDGE_RISING>;
 			mboxes = <&apss_shared 0>;
 
-- 
2.34.1

