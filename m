Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E03257748A1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Aug 2023 21:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236221AbjHHTge (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Aug 2023 15:36:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236526AbjHHTgT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Aug 2023 15:36:19 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 678C1217A8
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Aug 2023 12:02:00 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-317798b359aso4596578f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Aug 2023 12:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691521319; x=1692126119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FxzAtUCpBizbORkFzBZ79E1+X6lJ8mcanV8XLYQP/TE=;
        b=Emhufybegprbd+EUb6K1FoZYvHv3Rrryb6fEBy/m6jy7xDufPlXQWAg3gs09RLZl7q
         8ASadrgljQdGFGnINktw0sbe/g/EtgGOhu1OzBr2DyzRs7aAwJ2UP2qMPgkimMCSo6s3
         O1Yp4EanaYHa0ZjuUQkhlHBkIAFLj3D+I0n0JvDUeK7z+cXIGpf26fklR/KgGJv1ImLY
         2cX0XmOokFjuJYhF86nG0NSKvw3seQaSRm6IhLtw+HxOBZVDBYG+IHVBJKTTKCbapyYw
         8WpsfcpUhQrH1Rssze8gl9QofDhwldekRsH+AKCE2QoMelr4pdOZcLq3LE6pKrlwCDfu
         SRRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691521319; x=1692126119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FxzAtUCpBizbORkFzBZ79E1+X6lJ8mcanV8XLYQP/TE=;
        b=TqwvvIRFmaWO2/R5n9qjp5pDsJ1/YP/Mhl36ezmwW/heXNq6zm6QPhD/KkIHfNK0/Q
         xJR/qKIlWOjSeQZaB8TKhPEWBLiJCFJIzcgc8Umy4gNvEL41m911T4TxeNqwtRwvb6fp
         T1Oang3ECUvLPuASwNDK+pSgUrcH6XSNEPdpZJ9tTGBVfhC2t7qKtJnHzaSCkD+0of7H
         hCQio/cwwhZeyM7ogeqr8Y5hyJteSP4HnslOfM/xKTNeZcCbOqvwvR5M8CIyIbCDAWJz
         uym64EhRo2ObqgFQ7830vFBU4QA9omG9teBU+Rz3SUvvwIkbZpeZN1p1Q1n4dstHJ3AD
         OdRw==
X-Gm-Message-State: AOJu0Yz18g/J6+O5hwzsEYbccAoY5HBh/MBta6+7PGR6r1B7yTLK8AxC
        4N/JYFTxDrj8Vq0xUXttD6wTGw==
X-Google-Smtp-Source: AGHT+IH9XDF97UaSXCg858XJnAuQSpKenxxYT8LZAXK39rYLA6UlwNrGvBnvBjidTZwmDRuQJ42s0g==
X-Received: by 2002:adf:eec3:0:b0:313:f463:9d40 with SMTP id a3-20020adfeec3000000b00313f4639d40mr215320wrp.65.1691521318993;
        Tue, 08 Aug 2023 12:01:58 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6a08:bcc0:ae83:e1dc])
        by smtp.gmail.com with ESMTPSA id z14-20020adfe54e000000b00317e9f8f194sm7301055wrm.34.2023.08.08.12.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 12:01:58 -0700 (PDT)
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
Subject: [PATCH v2 6/8] arm64: dts: qcom: sa8775p-ride: add the second SGMII PHY
Date:   Tue,  8 Aug 2023 21:01:42 +0200
Message-Id: <20230808190144.19999-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230808190144.19999-1-brgl@bgdev.pl>
References: <20230808190144.19999-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a second SGMII PHY that will be used by EMAC1 on sa8775p-ride.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index f9e1a017798e..486cb48ecb9d 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -287,6 +287,15 @@ sgmii_phy0: phy@8 {
 			reset-assert-us = <11000>;
 			reset-deassert-us = <70000>;
 		};
+
+		sgmii_phy1: phy@a {
+			compatible = "ethernet-phy-id0141.0dd4";
+			reg = <0xa>;
+			device_type = "ethernet-phy";
+			reset-gpios = <&pmm8654au_2_gpios 9 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
 	};
 
 	mtl_rx_setup: rx-queues-config {
-- 
2.39.2

