Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4301D7748A2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Aug 2023 21:36:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234370AbjHHTgd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Aug 2023 15:36:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236393AbjHHTgS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Aug 2023 15:36:18 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29D5721798
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Aug 2023 12:01:58 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id ffacd0b85a97d-31771a876b5so4528320f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Aug 2023 12:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691521316; x=1692126116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NErAZ1+jiHK36qRuqDrSYR1o6Tx2jw6JcGAy27EXYPg=;
        b=vfFJq+w5TuOejiJncLe4a2+IEnq7wzFU4ePJqSO7nx6b+fb/O4vsCKbFHRoru3wUvi
         GZ1jFCyGMdT5CyP10iQf5oGi3HL/mEVYt/WdbCyIIRSi0W6wZQY0n4FfNvQVRKP2uFV1
         xwVIrBfPk3psX4jGhXKywfv5hkoXg8IFAZlolAAuQMoaVAtdIU0MKR7GdFh5mVelIYVv
         94FClmm9qPxSWK81RBZ8K2e3om3Lod1o5E83aU3ywmrgV8EXmGWkRPgj3R/mogCuigxM
         WL+xkYxe/5ywCGaZYz3wfMETYXoc9fPU3eWA8tZrwH7YNj4uFd3s5CJz9VXeIkSSD6Kk
         JhCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691521316; x=1692126116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NErAZ1+jiHK36qRuqDrSYR1o6Tx2jw6JcGAy27EXYPg=;
        b=C5sluTpXoGxNEa80qwFVGbKZ/+GrLs4L8sMZJyChyOmH1dLQ/7ydtq6DsbNwbuDKg1
         82C1ZFrWgexYjzRZMveJJUd9yCg3PH615+xqWsy8AEafOX7PnDQtzfsrFNnRK5dphCxk
         KRUzxUexO0R7g85ngtz+XMi9pSORM443uaqtSlCLCMFtKMdcUFKv8D64wDceu9Gepvmz
         yBSOLVyCx4sMZw1Uc6aU45A0s/yzyHBNLHlexoBiOxeHcgv1WBLo8kOYrsL2kvd6Dz/H
         5S3s2HyrSzXXYp/oovxfuPYXI0tIET+oNYW7Ecquv+rsocYN/zkf7VJqgclL5Dlq/kL5
         Lblg==
X-Gm-Message-State: AOJu0YzbbMESONE4IJZ/4uekolLZ9hJmqOFldT0KChrEeguHRSB2pDR0
        SsmZzK7uC2r/h4Xco9VH2aSw+Q==
X-Google-Smtp-Source: AGHT+IHK1nSfjLQhmgz72gMIFZ2orkvarCJjeX2mHFN1UvNmOPFtHDSoMZP26Fm+oXW+HCYMKMKKDg==
X-Received: by 2002:adf:df06:0:b0:317:5ed4:d821 with SMTP id y6-20020adfdf06000000b003175ed4d821mr221121wrl.55.1691521316726;
        Tue, 08 Aug 2023 12:01:56 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6a08:bcc0:ae83:e1dc])
        by smtp.gmail.com with ESMTPSA id z14-20020adfe54e000000b00317e9f8f194sm7301055wrm.34.2023.08.08.12.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 12:01:56 -0700 (PDT)
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
Subject: [PATCH v2 4/8] arm64: dts: qcom: sa8775p-ride: move the reset-gpios property of the PHY
Date:   Tue,  8 Aug 2023 21:01:40 +0200
Message-Id: <20230808190144.19999-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230808190144.19999-1-brgl@bgdev.pl>
References: <20230808190144.19999-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Device-tree bindings for MDIO define per-PHY reset-gpios as well as a
global reset-gpios property at the MDIO node level which controls all
devices on the bus. The latter is most likely a workaround for the
chicken-and-egg problem where we cannot read the ID of the PHY before
bringing it out of reset but we cannot bring it out of reset until we've
read its ID.

I have proposed a comprehensive solution for this problem in 2020 but it
never got upstream. We do however have workaround in place which allows
us to hard-code the PHY id in the compatible property, thus skipping the
ID scanning.

Let's make the device-tree for sa8775p-ride slightly more correct by
moving the reset-gpios property to the PHY node with its ID put into the
PHY node's compatible.

Link: https://lore.kernel.org/all/20200622093744.13685-1-brgl@bgdev.pl/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index 09ae6e153282..a03a4c17c8f0 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -279,13 +279,13 @@ mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
-		reset-delay-us = <11000>;
-		reset-post-delay-us = <70000>;
-
 		sgmii_phy: phy@8 {
+			compatible = "ethernet-phy-id0141.0dd4";
 			reg = <0x8>;
 			device_type = "ethernet-phy";
+			reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
 		};
 	};
 
-- 
2.39.2

