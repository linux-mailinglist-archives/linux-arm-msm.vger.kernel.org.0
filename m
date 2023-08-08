Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCBEC7748B0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Aug 2023 21:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236372AbjHHThN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Aug 2023 15:37:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236630AbjHHTg7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Aug 2023 15:36:59 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E25621792
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Aug 2023 12:01:59 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fe4a89e8c4so35195405e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Aug 2023 12:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691521318; x=1692126118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OmT9PzSta8Xptuy25Nk3Dl9DmZNJ19laWsjgvsxKz6Y=;
        b=GVJmei0inJ0pPMlkTW2uh++vKy1E8M/6nFMSD/TvCfbJpSdadN13sEm64EImWmjNSa
         XeHdSPFdksGwLJHCq0jdOOPEJMoQZz2JYdLVWCuuLDzIhKT3vJ7nlGXfxzR5yLedeQcX
         bRb/ZFdykcJMEJpYY2IJnDnYv5rrzW6K+UeeHj5Yqucz+jk0DKV2bFu4K1aBW9I/oIa0
         h+YaOElDyIjmIIpxlJoiSx2LdwVJt9sL/E+GUyqzZBCBLAFh16xW572G+DWYDuJ1rBKv
         Nc6dknghuTCa6MJZ4n+z61Z2Neq1svT/bafnNdwLMshnHMqIPNqZwUDxm55Rhi33KY9m
         niFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691521318; x=1692126118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OmT9PzSta8Xptuy25Nk3Dl9DmZNJ19laWsjgvsxKz6Y=;
        b=ep7yLP/XurE4P/ZrUWwXYvxdvC60cBByzxscWTLwwkaHmR5/vofP+fvKqEXI5hkEBz
         23r7CziOPJ3/Aww70dL1NxVPK3czNFvQZ7c7tloB7SgCkhy4jFvdJICZ9DX9L5mTke4d
         mchgnycTYnC/coPQT4Gd72N3n5LGFoLeTGZ3WgqM6BX8ebcGt144IewyHTzSpLaH6Y0P
         gFd9u1veckIdK9Zh8lvHMdoIBtYB04422MiHFMgepaVaMnQhAVrbi6vN92RRKqBnCY9P
         ruG7TqRlME3iTEpT0UYo9yVhaOGF8lB3nEOOVhovJnpsTCD0j3uQLNuddRuzD4qxHwfG
         2Csg==
X-Gm-Message-State: AOJu0Yxp1jdw5G36JUlBY095LN3t4JNE1lNJtoehMm2eSc9z9HUEVSsL
        3uQKPGc65C985oI69rGleaYGeg==
X-Google-Smtp-Source: AGHT+IFV/uBYBdBvXQ69ksH0nRx5//stS4hJaZqVO1Ze5T08JW/n9sbqQeUFby/pGOgKndKDYgR6pw==
X-Received: by 2002:a5d:6781:0:b0:313:f1c8:a968 with SMTP id v1-20020a5d6781000000b00313f1c8a968mr197129wru.2.1691521317843;
        Tue, 08 Aug 2023 12:01:57 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6a08:bcc0:ae83:e1dc])
        by smtp.gmail.com with ESMTPSA id z14-20020adfe54e000000b00317e9f8f194sm7301055wrm.34.2023.08.08.12.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 12:01:57 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alex Elder <elder@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Andrew Halaney <ahalaney@redhat.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 5/8] arm64: dts: qcom: sa8775p-ride: index the first SGMII PHY
Date:   Tue,  8 Aug 2023 21:01:41 +0200
Message-Id: <20230808190144.19999-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230808190144.19999-1-brgl@bgdev.pl>
References: <20230808190144.19999-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We'll be adding a second SGMII PHY on the same MDIO bus, so let's index
the first one for better readability.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index a03a4c17c8f0..f9e1a017798e 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -263,7 +263,7 @@ vreg_l8e: ldo8 {
 
 &ethernet0 {
 	phy-mode = "sgmii";
-	phy-handle = <&sgmii_phy>;
+	phy-handle = <&sgmii_phy0>;
 
 	pinctrl-0 = <&ethernet0_default>;
 	pinctrl-names = "default";
@@ -279,7 +279,7 @@ mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		sgmii_phy: phy@8 {
+		sgmii_phy0: phy@8 {
 			compatible = "ethernet-phy-id0141.0dd4";
 			reg = <0x8>;
 			device_type = "ethernet-phy";
-- 
2.39.2

