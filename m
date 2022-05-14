Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F285F527395
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 21:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbiENTBr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 May 2022 15:01:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234800AbiENTBo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 May 2022 15:01:44 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 917502870A
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 12:01:42 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id a23so5735807ljd.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 12:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VRcBfW2FxHKYJoVpxfrI8zGrGf9W6wst3qWpXKD9jig=;
        b=FjnfPe/2jDk4MGZtp70kmCCBaZvHlDYvxJWpA2a0qt5SzKE+716SCnvmThbKKU9aUy
         2Iw5LYZcseJw+QHBaYCsqxe6m/bT5DHJVSG0i+pU9HUD/wdGO/EK1fQRKKPMSplmxAFF
         oTAgNW7uUeMCTIcIX5+mojMgcNNj/7KlTinO7adotDuaCvmvC2YFcs4u4fapsRXJGNBL
         QXNtFNtiXqRiNGF8TEUjvQc1Day6DgwxfjKhTkzrzMGa49TAEeCdTbGUuotIL5QBRPr6
         nI429mfz9/g67YjRdIwlm9Cqq6mAeOITIERqlixRS8RvjiSdQq/34GyMizdJmCGu8Xla
         WK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VRcBfW2FxHKYJoVpxfrI8zGrGf9W6wst3qWpXKD9jig=;
        b=4UrAMFjmKEi52zIUG8JvN7osGv1XZZVbY91JH/tmvvtVxlySmF1dRJLUiqj41vGx+z
         qDO1+Jyo/2PuXIospge+ohMn/eH/TUHEnNJWcdjswFI3XNzAHQMmHAB30hJPc3ipLcpw
         37HwzpRnZfWSueyoz/DIbmleyj70WxyvcPyS8Wr93rnqApnaRVtd8DCcyi6wyHv+zSVb
         EsoqSdgBPVgmWoXqlslLA+qP7kcvaGR0NLwqsfbMmKDUUDslRbYJNRrZk12103EyxSSY
         yXNdm6zcYvEz6c8vM9qSi/jdgsmyvAH9seqVKqkO2cUf3XpnOQ5OCiLjbSiq9TPaWpN9
         Fk4A==
X-Gm-Message-State: AOAM532YALW7F3ab+76XjRV4xRdW5HT98/9Kf42V3+A43iH6ZWS8hn1p
        WHfV5BfhiCMVwKYSd5C2LVz+lg==
X-Google-Smtp-Source: ABdhPJz7+hSskIPrIMwO1DRmxGdkGbApqmz9K63O4ovaff8d06wZoJ6r+kNXkHzhGW2L1N443jXH8A==
X-Received: by 2002:a2e:2a83:0:b0:250:e45d:3509 with SMTP id q125-20020a2e2a83000000b00250e45d3509mr6584002ljq.56.1652554900728;
        Sat, 14 May 2022 12:01:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([93.92.200.201])
        by smtp.gmail.com with ESMTPSA id y26-20020ac255ba000000b0047255d210f4sm787427lfg.35.2022.05.14.12.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 12:01:40 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v5 01/12] arm64: dts: qcom: sdm630: disable dsi0/dsi0_phy by default
Date:   Sat, 14 May 2022 22:01:27 +0300
Message-Id: <20220514190138.3179964-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220514190138.3179964-1-dmitry.baryshkov@linaro.org>
References: <20220514190138.3179964-1-dmitry.baryshkov@linaro.org>
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

Follow the typical practice and keep DSI0/DSI0 PHY disabled by default.
They should be enabled in the board DT files. No existing boards use
them at this moment.

Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 240293592ef9..8697d40e9b74 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1559,6 +1559,8 @@ dsi0: dsi@c994000 {
 				phys = <&dsi0_phy>;
 				phy-names = "dsi";
 
+				status = "disabled";
+
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
@@ -1592,6 +1594,7 @@ dsi0_phy: dsi-phy@c994400 {
 
 				clocks = <&mmcc MDSS_AHB_CLK>, <&xo_board>;
 				clock-names = "iface", "ref";
+				status = "disabled";
 			};
 		};
 
-- 
2.35.1

