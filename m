Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C248590EF0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Aug 2022 12:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238127AbiHLKNy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Aug 2022 06:13:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238217AbiHLKNa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Aug 2022 06:13:30 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 898FCAB4CA
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Aug 2022 03:12:46 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 186-20020a1c02c3000000b003a34ac64bdfso4095681wmc.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Aug 2022 03:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=6PlnIBUoC6w69T/PkaQ57uV9UcjokVo67ltYXeOmdTw=;
        b=ILzrRoIQ9aEUYRndgjQZU/vRVEvksDk/76BWsCnIcxWYCpuk+7TTChZeBE/9Z5xPPY
         Q3jeDHaJtVMMPJmzwmDt7JKiaozQcY1rA7IEMKaad7u9Xd1xNeQMbnoyzSn1jSc/57JL
         zXtoEaiK7MVqOnwEilg44kiI0mpAVR5szF5WOzCrhCNdYsNT5y3Y/JZ7nRVOXX95uKea
         soBbp+VkBKbqFRv37Pn76810GYnWSLbuScBc2mxhB8OvFl66HF3GMtIYDYHCHZx7Pcup
         /OIUSvaAp1qaY3IrVUjkPRAv4v82gJaP6xDT1VUjsp6JAV9/BiW8t080Ppcieq6TEMMN
         OPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=6PlnIBUoC6w69T/PkaQ57uV9UcjokVo67ltYXeOmdTw=;
        b=VK0toLwNgJvUkJdLAaR3tY1fWcn2qg9TIw0nlDoHyn3s4mKKzIIvGZgCxMMyuGABm4
         QSWEfQfnlj+h+lKd3FyAMMz2kamKfvC1XF2fR0xGSilBKrENVWYjHFH++vnm630BfBsQ
         BSgkISY2oXP9jP/tgBFvNRYpf0PeEW9m0xp1jkE2S42IrXc6SRVfWPH97Bkirg6HklUN
         sgSBifXyXxqTdtK4LieMezHFGlXTBql2KHwxf6QiCNRbBsrVyfe+Vllz1kPp1WKQXsK2
         eoh8bXgRnrKFvAIUftuhinfUtW3SjqaNhQHwyGRbPNZqiT+ReX0+6NYd4iAxskFtvi9s
         GVgA==
X-Gm-Message-State: ACgBeo2kXD7092xnN7CeQaJnYHUuLDECwwjVVncDF2IY8/nB1946OVLR
        cG9laGuY+dPBDLb9HU6osd/tDQ==
X-Google-Smtp-Source: AA6agR6urUu4cJ7lC76MKC4djtyGFfgFjj2UjRR9XzO9H7PeEVCUAA9AdaYrcMFImtWm4uS5uV2Ymg==
X-Received: by 2002:a1c:44d5:0:b0:3a5:4fa3:b260 with SMTP id r204-20020a1c44d5000000b003a54fa3b260mr2122859wma.165.1660299165181;
        Fri, 12 Aug 2022 03:12:45 -0700 (PDT)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id e25-20020a05600c219900b003a541d893desm2193204wme.38.2022.08.12.03.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 03:12:44 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Maulik Shah <quic_mkshah@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/4] arm64: dts: qcom: sdm845: Add the RPMh stats node
Date:   Fri, 12 Aug 2022 13:12:39 +0300
Message-Id: <20220812101240.1869605-3-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220812101240.1869605-1-abel.vesa@linaro.org>
References: <20220812101240.1869605-1-abel.vesa@linaro.org>
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

SDM845 is a special case compared to the other platforms that use RPMh
stats, since it only has 2 stats (aosd and cxsd), while the others have
a 3rd one (ddr).

So lets add the node but with a SDM845 dedicated compatible to make
the driver aware of the different stats config.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---

Changed qcom,rpmh-stats-sdm845 to qcom,sdm845-rpmh-stats, as suggested
by Krzysztof.

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 5bea96a9ce06..67fe08b837be 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4851,6 +4851,11 @@ ebi_cdev: ebi {
 			};
 		};
 
+		sram@c3f0000 {
+			compatible = "qcom,sdm845-rpmh-stats";
+			reg = <0 0x0c3f0000 0 0x400>;
+		};
+
 		spmi_bus: spmi@c440000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0 0x0c440000 0 0x1100>,
-- 
2.34.1

