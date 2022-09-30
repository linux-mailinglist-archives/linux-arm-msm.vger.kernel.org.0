Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A08E5F11DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 20:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232290AbiI3Swp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 14:52:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232327AbiI3Swn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 14:52:43 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B59FD1664A8
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:41 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 10so8217731lfy.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 11:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=K04tZog6E5LXHj+QeZHfYRVzG8sXotoqIKOABDLCbw8=;
        b=vwUD3YLqdBXyZzCS5IuRZArnb/k0HqH/X04HgQLZxPMLCJiSMGouXjHF+Vl9NDXczy
         +jMsH+NBKFAzVZdSZmqOkbRXxC1uJHPcdhLHAFtPJahmBePy9gN4Cmw9RtRiU0DIiaF4
         nAY/m5P1TzK0yK+TR1HUrFwlsw+A6kQkiBIWsOv2JbytOc9Eu74NklaCODnd4/KC9tzc
         JDbUVBWhaeI2k3Gf0JKFoGXeOOK23oevpjUoLIUUaw17RZdJKitq2wgF1yidrZR5MtM4
         LctAK+9zDvuoegnV2ii3mecB82KtvLbSni6+Cz6In4sR/hmapE2QxDlshMTP2RyXV1Mm
         Xb8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=K04tZog6E5LXHj+QeZHfYRVzG8sXotoqIKOABDLCbw8=;
        b=N+qJ6O0Q+jEwioNu9QpkT2XPxpYmdurx1cZPukWC21JbbjWPaQAEDL13+sn4QKZU5O
         6VUwWIyjVyGL5dqQM0JHwyJM7ebDNhba8FzHpuWvNVnnpx0gzRg5gWFzvgyCTLyfN87v
         tr7hLV2NGmNgkvoPeKwhfsOeRPm5RdFKoCLmHTzVLVvPHj89RuLa0FNTEfOX566vGuAI
         BNHHQ966zngNLYYhIOdyUxSqmXwe7PDV+9jt+ddY2PkxgPc/oYJl49XKGFmQGt7PNL9q
         fGmFvOPK7c/ojymMvlUdjd2by7ILRPqh0HA+nYWk4ic3H0wyxbrxVJs0Smyd1vN183Sv
         loWg==
X-Gm-Message-State: ACrzQf2bkSpym7haCKkPlb0eZniImoLUalFEXHzvkRlszyXbbPv0ErQu
        umr70gdgdVaXkoYugKnjT3cbJQ==
X-Google-Smtp-Source: AMsMyM7e+4rN+QGibquIMB31+9VPpAit8VvmB861p7uNdVl661uNLgqsfoX/oSX9gWadFBM2Yf44rg==
X-Received: by 2002:a05:6512:33d5:b0:49a:d2dc:e1e3 with SMTP id d21-20020a05651233d500b0049ad2dce1e3mr3496222lfg.628.1664563959929;
        Fri, 30 Sep 2022 11:52:39 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i8-20020a056512006800b00492cfecf1c0sm374703lfo.245.2022.09.30.11.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 11:52:39 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 03/23] ARM: dts: qcom: apq8064-ifc6410: pull ext-3p3v regulator from soc node
Date:   Fri, 30 Sep 2022 21:52:16 +0300
Message-Id: <20220930185236.867655-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
References: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The ext 3.3V regulator is not part of the SoC, so pull it from the SoC
node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-ifc6410.dts | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
index 50792f06855e..f718b37192e9 100644
--- a/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-ifc6410.dts
@@ -57,18 +57,16 @@ hdmi_con: endpoint {
 		};
 	};
 
-	soc {
-		ext_3p3v: regulator-fixed@1 {
-			compatible = "regulator-fixed";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-name = "ext_3p3v";
-			regulator-type = "voltage";
-			startup-delay-us = <0>;
-			gpio = <&tlmm_pinmux 77 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-			regulator-boot-on;
-		};
+	ext_3p3v: regulator-ext-3p3v {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-name = "ext_3p3v";
+		regulator-type = "voltage";
+		startup-delay-us = <0>;
+		gpio = <&tlmm_pinmux 77 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
 	};
 };
 
-- 
2.35.1

