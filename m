Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65D3C5B38CE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 15:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230511AbiIINUV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 09:20:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbiIINUT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 09:20:19 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F0B76B66C
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 06:20:18 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id f14so1672938lfg.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 06:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=7eIAPqI4VKtQ+SccbuIlWbbRD/2RqIpw8CuTR3vK6To=;
        b=DkafrE+hVIylqFypeq2N34GUMha4gRCZ4CoqpO7BiMR6ZvxNagiRFX46HvXyhEf7lw
         IvSTni9o3GjK59yKJUxcQ2Guhm6mFlHWJhDvDSbBe1zb4WRyqMa+dBJtPhzQ6hiDV82a
         H2YPcvg9c9ZswqAjLELPR9Jz8wXPbOtjPzO8ukWnSG1vq/JYdjtwsFUFqNO2Pu6U7Yed
         h3zb3PFiUrn1D+vMIBKu9a2UWSRJ2e+8q4/SVbB8U03Y0xu13mS66QKccCqSp9sMolje
         kjPqZucqnL3xhLOCpi+94Ql8MqHR0jhpDDO10QehYpIvP/UWlqVNEOoatxkrWJDDw9um
         raMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=7eIAPqI4VKtQ+SccbuIlWbbRD/2RqIpw8CuTR3vK6To=;
        b=J1AOgixQEuRql1hj9asfx0Csg7qDKp8EotUIzMsKC8MKb8nBRgoU4Bjjj6gZD3bcKB
         jUe2VqTIlBZVq/We96iZ1C28/LDi9mDqB1JWWWiUDlwguaWKnyJnNvVhgDj5jShg7tOd
         W+vRSpn6E/ZxNejagF+mkRB9/kZyaDYyqKvctPAKG95XXarlOQqQpxAtwXRgJwK9uld6
         Ns3diNRLYl6s+2BzihIaP2MoHTpjZPucqSSxUiz4F/AS2O/LM+rrS+y3FhH6+HFcGx9T
         IS2Pm4D8Zy+upoyE4caunTkIGXoqF8LL0yyEAR3iZB56OcDnNFKBs1377sxBothP8pqo
         9PXQ==
X-Gm-Message-State: ACgBeo2j+/VddTIgdDGw2JLp9AQ7dGbj3OPJITLOXYpRQT2goIeyCe1q
        GKPfnyerEqW7SEut6oghgPRqXg==
X-Google-Smtp-Source: AA6agR7UPYJj5t4SVndDP80FGNT9+vOtzry4SSeHaFI9K61PnoqWOvZadl4SMBPIiX69d75+SIvmCA==
X-Received: by 2002:a05:6512:1087:b0:494:a011:2752 with SMTP id j7-20020a056512108700b00494a0112752mr4888907lfg.2.1662729616645;
        Fri, 09 Sep 2022 06:20:16 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v10-20020a056512348a00b00498ff4ae746sm71729lfr.294.2022.09.09.06.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 06:20:16 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
        Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH 6/6] ARM: dts: qcom: apq8064: use hdmi_phy for the MMCC's hdmipll clock
Date:   Fri,  9 Sep 2022 16:20:10 +0300
Message-Id: <20220909132010.3814817-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220909132010.3814817-1-dmitry.baryshkov@linaro.org>
References: <20220909132010.3814817-1-dmitry.baryshkov@linaro.org>
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

Link hdmi_phy as a clock provider of "hdmipll" clock to the MMCC.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index decd18217523..28a0e2a4a254 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -868,7 +868,7 @@ mmcc: clock-controller@4000000 {
 				 <&dsi0_phy 0>,
 				 <0>,
 				 <0>,
-				 <0>;
+				 <&hdmi_phy>;
 			clock-names = "pxo",
 				      "pll3",
 				      "pll8_vote",
-- 
2.35.1

