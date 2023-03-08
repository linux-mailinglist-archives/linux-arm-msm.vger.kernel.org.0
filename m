Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3CEF6B04C6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 11:40:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbjCHKk1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 05:40:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbjCHKkX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 05:40:23 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAEC69F228
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 02:40:21 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id l7-20020a05600c1d0700b003eb5e6d906bso831382wms.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 02:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678272021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38POzCQRXbyYZW4IlxaDC4+cp8JTJlsDSxILe4G3dTg=;
        b=4TyjJNH1V311c7SUBgd5SkwObW8WR5bD/BPRUAie5mpuowKNbE1KgXVw5YfCtmiSHa
         Cg4+eJ7ZZS0FlDh2jm+UyEVTiSiVR/tUSUJcARX+JKyCXNHiNrygscV05WTiJAiUsQR7
         myqdGwYDTFit2x6wHYMVVALdNPla72Y5b+JL38xQt5E+eLIDp0bcXvd9EizNfOinwHD2
         /tr+cVcFUQl+iHQUtwhKLyUik8L33g8Ql7RPKBMZ5eHaYvljWgoG3FgyR5Tiq2nmo0hx
         ssEGzu7YRrTd7UToDYRy7wkeEE/+trn7JKjAH8/zufIYw83rrn3dd+UUqWSdSgJGm2un
         Sdkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678272021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=38POzCQRXbyYZW4IlxaDC4+cp8JTJlsDSxILe4G3dTg=;
        b=iRYopVfKeBbPYhe4z+SdZiRXEZsKUDV1ykC3Z6+Bt/CS77j/7ZCs7rpVkADRLeb91b
         ntHkbbLuf05dn6wQD/x5RtL1IRSV0SJE55Mo8izsOjDIRu/lOAgZVeDyXr40c77tkm8c
         dEiLwGnV4FXFdiWItqkRcVg2h8GaYqncDMsFeglLB1W8ByB/uXkYBY/f+cB+fQpTjXRy
         GIGwLnhpoaavZL/t9+LXb6Go8ZJPskef6eecc1hc+aHypO0j4YVEFEydDPEZEeWGRce1
         BBTw9WBmHjGuwhNRaWNj6K8JmwEGjVOUdSGd+0DdPI/BC+cHjGgu+4xEiM2PpXGjbqel
         G5LA==
X-Gm-Message-State: AO0yUKXcUOjmJu1J2SHtYKtF5Qykd2bUizp+jbesJ2nnnrsV1ocwt64r
        McMO8gdi6KAsFPQAROz3o6/d5Q==
X-Google-Smtp-Source: AK7set9qXIMGbPxBXxskaJpk8Or7rSusQoSGJR9QO5FS01fi3V5Zm5XAmyNjcbarNFEsV29FwLsl6Q==
X-Received: by 2002:a05:600c:1d01:b0:3eb:38e6:f65d with SMTP id l1-20020a05600c1d0100b003eb38e6f65dmr15465346wms.11.1678272021458;
        Wed, 08 Mar 2023 02:40:21 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:2326:fd4c:82e3:7e07])
        by smtp.gmail.com with ESMTPSA id v7-20020a05600c444700b003eb0d6f48f3sm20664135wmn.27.2023.03.08.02.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 02:40:21 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v4 8/9] arm64: dts: qcom: sa8775p-ride: enable the GNSS UART port
Date:   Wed,  8 Mar 2023 11:40:08 +0100
Message-Id: <20230308104009.260451-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230308104009.260451-1-brgl@bgdev.pl>
References: <20230308104009.260451-1-brgl@bgdev.pl>
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

Enable the high-speed UART port connected to the GNSS controller on the
sa8775p-adp development board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 33 +++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index d01ca3a9ee37..cba7c8116141 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -13,6 +13,7 @@ / {
 
 	aliases {
 		serial0 = &uart10;
+		serial1 = &uart12;
 		i2c18 = &i2c18;
 		spi16 = &spi16;
 	};
@@ -66,6 +67,32 @@ qup_i2c18_default: qup-i2c18-state {
 		drive-strength = <2>;
 		bias-pull-up;
 	};
+
+	qup_uart12_default: qup-uart12-state {
+		qup_uart12_cts: qup-uart12-cts-pins {
+			pins = "gpio52";
+			function = "qup1_se5";
+			bias-disable;
+		};
+
+		qup_uart12_rts: qup-uart12-rts-pins {
+			pins = "gpio53";
+			function = "qup1_se5";
+			bias-pull-down;
+		};
+
+		qup_uart12_tx: qup-uart12-tx-pins {
+			pins = "gpio54";
+			function = "qup1_se5";
+			bias-pull-up;
+		};
+
+		qup_uart12_rx: qup-uart12-rx-pins {
+			pins = "gpio55";
+			function = "qup1_se5";
+			bias-pull-down;
+		};
+	};
 };
 
 &uart10 {
@@ -75,6 +102,12 @@ &uart10 {
 	status = "okay";
 };
 
+&uart12 {
+	pinctrl-0 = <&qup_uart12_default>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &xo_board_clk {
 	clock-frequency = <38400000>;
 };
-- 
2.37.2

