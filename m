Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 035FE6C966A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Mar 2023 17:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232501AbjCZP6M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Mar 2023 11:58:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232473AbjCZP6F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Mar 2023 11:58:05 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EED2423E
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Mar 2023 08:58:03 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id ew6so26167576edb.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Mar 2023 08:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679846283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LfEcJS0iedMYRq077xyra2YW9PMvnxyDxWFKvIquIQw=;
        b=YqPJSDOOgMPQFB+4ii62JQuYGT6046lZXY9mntJlUiVurN5/THiaYMg51hQWAcVvIC
         FuDUMd1DEoOkUZ6jr0tOPseXdE26/UMrBDvhLhTQsPYPMRKMc/OvmOzZtfs6uD7G/z7y
         kZ84RgO9GbV9z2BJ+OvSEbF4V0NS/dPbdm8eP9Mwba4XPym+7yJPuUBdA/0nJBGs+d0j
         MMoUh38Sru1s4Tpvnkv6hd7L09aPqQmev4dIPWVCEX9UYf3BRvMM7RBdrf2lp9dT+Aut
         nFpP8q9+BoInourGXZhfvqKs4aztWcO4GaOhoyXSE6poMQlAk/NbkWG7q8HggNrk6GZG
         573Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679846283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LfEcJS0iedMYRq077xyra2YW9PMvnxyDxWFKvIquIQw=;
        b=JYvsslA4OJUruQbmGwzlqLqdSd7bufDkQatUsSrxzMDR7J5HlDTIhbPoeBUlhyMC+N
         aHiPKyu5tFxyLvs59hpVcICMnofgPxh/WYTI4Ss3FQSLasoKUNvPXdauEodsnvNd0iGm
         atpMV3Y71zSfRGMBYvH1EDkfkpxLd2LeLNdZLI3oA6iHemLUpDkIJZpU1sT9gpEjf5Gl
         PTJmc71KTC5wiAfKihGKryF9Z1J5h0wkEWoz4GJY9wBfPPC3dRGiMvvGj1vpzpJ4t44V
         JTZxDWsxBKhR01XRbSS0gtGRkI0ENCaKsZH5XVyaLbN+xZpE8vHVwZysakbPoGGj9Fbj
         3c4w==
X-Gm-Message-State: AAQBX9fZze2duotxStfrXQHvxM2Vj4SvSG+Y/Jzb2i8knPv0Bf52ZS1t
        oDsSJUbbIHN2povbTgLrTLxPLa+Zh4AvffROff8=
X-Google-Smtp-Source: AKy350Yae1vTbRRMRvpVTfWb+4kzW/3iIKpypRI44beEMX9NNn/bQSLPntKicgw8jpzvUHXriNdKYg==
X-Received: by 2002:aa7:d44d:0:b0:502:3ff4:4d76 with SMTP id q13-20020aa7d44d000000b005023ff44d76mr2386599edr.27.1679846282917;
        Sun, 26 Mar 2023 08:58:02 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:eca3:3b8f:823b:2669])
        by smtp.gmail.com with ESMTPSA id q3-20020a50cc83000000b004fc86fcc4b3sm13705502edi.80.2023.03.26.08.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 08:58:02 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 07/11] arm64: dts: qcom: sc7180-qcard: use just "port" in panel
Date:   Sun, 26 Mar 2023 17:57:49 +0200
Message-Id: <20230326155753.92007-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230326155753.92007-1-krzysztof.kozlowski@linaro.org>
References: <20230326155753.92007-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The panel bindings expect to have only one port, thus they do not allow
to use "ports" node:

  sc7280-herobrine-zombie-nvme-lte.dtb: panel: 'ports' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi b/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
index 95d9e4a19d76..9137db066d9e 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
@@ -354,14 +354,9 @@ edp_panel: panel {
 
 			backlight = <&pm8350c_pwm_backlight>;
 
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				port@0 {
-					reg = <0>;
-					edp_panel_in: endpoint {
-						remote-endpoint = <&mdss_edp_out>;
-					};
+			port {
+				edp_panel_in: endpoint {
+					remote-endpoint = <&mdss_edp_out>;
 				};
 			};
 		};
-- 
2.34.1

