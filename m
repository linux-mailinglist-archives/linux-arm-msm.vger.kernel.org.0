Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9E6A7B18E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Sep 2023 13:03:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231767AbjI1LDT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Sep 2023 07:03:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231789AbjI1LDS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Sep 2023 07:03:18 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B3A71A1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:03:16 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-504427aae4fso12482616e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695898994; x=1696503794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcbEnFCtTA9UEjtUWN7yvDCOIDS8kBLNF+kymOo1R3w=;
        b=XGGI+kp0/qXlT5//x7grR2PVzpMd4uf1COX6CiPai0r1M5ScgsilVIGEAWGy654fDe
         RLgTeO6f5h94hpkEebFstF5/gmlKuf3HdETXc8xmmvvlz7ZM8EA2aEt5CINKMGASZ2ID
         a/SX4YgWtqg74tC9QSX37P9+MKi86iONdlR6XrhfYSiS4jlMRi9Hwj/S2OR3RZ4bgJJe
         eV8/UrAyqmlxK0ZRZN3o1aDFnu2UBOMMJLM2sKY9Owjry+JE4SXzmYWwbY3+54y700Wu
         4eAMQxaYlhrykct/VO5FkTGYtjJI5s6HljmDv6Zdx4rFIZJBnN0wjPe0WH4OcBzg16O4
         9ePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695898994; x=1696503794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YcbEnFCtTA9UEjtUWN7yvDCOIDS8kBLNF+kymOo1R3w=;
        b=C4kPx8FQ//kV4dZoTy1G5tqH5CzlrmycHeyW3sSVjHoDf6B6e8ualsx91dTARh3prF
         mddL6HHD80m482DXVPaUH1gkqykyYcyd/IjGuQG1lEo18TpeP+ADwXVWkr5RAaR4g2BN
         m8i0FBKg0InUbL09yImsw8tO7APPrhXUiwPAVp6rHju5lNTKFk8/lfyG+ral8yNXktxQ
         FhYwN9bkREkK36N1NplWmPcKIvRcpmoQdgcORuD6g2Nb8c4/MvHc4lOW86qtxbSz4ww6
         fymLTGA1QEgYdC7eFHwvOH2XIUOKelLdxhfHI8nREuLppqb0gPSN3DsnIfQloMhXKEDL
         yEBw==
X-Gm-Message-State: AOJu0YzzLnIOHnS7KXqI0GNwQLGX6OyagYbgnzUq9UrFZ0h4J/nX8A4t
        15RRbCTfNqHoPuAnR1KHnoO3Qg==
X-Google-Smtp-Source: AGHT+IGmD3MZcI2IX6oW6M0HolTT4LRlMTF99wjfX9Y+ziiwI6W9E8czU6AVfzukUwF80LQ+rH7uQg==
X-Received: by 2002:a05:6512:2242:b0:503:1ca2:7673 with SMTP id i2-20020a056512224200b005031ca27673mr688121lfu.14.1695898994693;
        Thu, 28 Sep 2023 04:03:14 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u2-20020a056512040200b005030a35019dsm3052953lfk.178.2023.09.28.04.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:03:14 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v6 05/36] ARM: dts: qcom: apq8064-nexus7: move sdcc1 node to proper place
Date:   Thu, 28 Sep 2023 14:02:38 +0300
Message-Id: <20230928110309.1212221-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928110309.1212221-1-dmitry.baryshkov@linaro.org>
References: <20230928110309.1212221-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move sdcc1 device node to follow the alphanumberic sorting order.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
index c57c27cd8a20..0e80a5a8e3c6 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
@@ -181,13 +181,6 @@ &mdp {
 	status = "okay";
 };
 
-/* eMMC */
-&sdcc1 {
-	vmmc-supply = <&pm8921_l5>;
-	vqmmc-supply = <&pm8921_s4>;
-	status = "okay";
-};
-
 &mdp_dsi1_out {
 	remote-endpoint = <&dsi0_in>;
 };
@@ -336,6 +329,13 @@ lvs7 {
 	};
 };
 
+/* eMMC */
+&sdcc1 {
+	vmmc-supply = <&pm8921_l5>;
+	vqmmc-supply = <&pm8921_s4>;
+	status = "okay";
+};
+
 &usb_hs1_phy {
 	v3p3-supply = <&pm8921_l3>;
 	v1p8-supply = <&pm8921_l4>;
-- 
2.39.2

