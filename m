Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D5CF6CA4C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 14:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232400AbjC0Mxq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 08:53:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232432AbjC0Mx0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 08:53:26 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6E7318C
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 05:53:25 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso5238639wmo.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 05:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1679921604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwHQWPyvMqQcqITtILmvr5vf6SXeg6VNW7aIz5tNplM=;
        b=g3zfB5OJvLg+EJtGg+jrhx5UVOZERORahY76i7/H/9+iaJ4UzICJNFXvFr6tykgZXa
         8v22bJNwCuBIq0s0QIrkDo2ldqvwEf8FTXJ4IIKeYt2q7Wac7od47UrApmd6gPRZpPv/
         3MfxOHe3NQ2WiinOzQXL+AdGX4PlQBE8yo8tAQg/PMpkrZpjgSExNFi7aepRcJq6gmgs
         C6++1JIMjiphAYGyHjTl3Z+znmP+hQsH7kNKA7+vTxIn/FuksP1T7bg1kAF7tIkk3J3R
         KUT1nI+3ICd4U/xMy91roadKl7bXgXthbJIy97xeCcQgBS9bTazcz2A0XqoKOLV6squD
         gepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679921604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pwHQWPyvMqQcqITtILmvr5vf6SXeg6VNW7aIz5tNplM=;
        b=m4v6OJHz6itJx1zZ2UclKXO/4TwjLvAk1ijLhzOTUIMNjsvvXYg/gHOPdhOv2w69kK
         +qf5D1M8Xr3KG1dU2uHFDVLz9QS16R0w69RfMaSEfyxtCoa5pKOutaij9CAfrHFbqEtK
         S8RHkDKXdMJnMcjtLa13oSXKgGZRsexpBIAx/0MMhakW5qY8zpqEtsIRIDZRSDkgDJSm
         9msWhzWGM798i3EPxEo5CvSkCrGBuAjW27GRS3P/IHJHHy1lBpgaOdJyBHgTLxrmHy4L
         Msb3j24N8Tvnzf1G1DhE2jIRu3HAjb203eO3y90DTiaBy8lWajYfAqSGiudAUuiHGWmQ
         o/aA==
X-Gm-Message-State: AO0yUKWjAfylZylk6iaQ7bH+FbUrqaZoo700B0wvgO2f/HJiFKvlvlF9
        LAudpIgrHqprLuwU1+uJK/h5tA==
X-Google-Smtp-Source: AK7set+qC6VUmsrdRIAxPajWCzeojquRFiQq1PUIZRj9/nwF8IdGgJd5138W8cF0chOmlx6lPqRbAg==
X-Received: by 2002:a05:600c:3150:b0:3ed:1fa1:73c5 with SMTP id h16-20020a05600c315000b003ed1fa173c5mr9144804wmo.27.1679921604316;
        Mon, 27 Mar 2023 05:53:24 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:313d:a304:2790:a949])
        by smtp.gmail.com with ESMTPSA id q25-20020a1ce919000000b003ee58e8c971sm13572220wmc.14.2023.03.27.05.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 05:53:23 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 05/18] arm64: dts: qcom: sa8775p: add the spmi node
Date:   Mon, 27 Mar 2023 14:53:03 +0200
Message-Id: <20230327125316.210812-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230327125316.210812-1-brgl@bgdev.pl>
References: <20230327125316.210812-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add the SPMI PMIC Arbiter node for SA8775p platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 6bb1db1839cc..2343df7e0ea4 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -638,6 +638,28 @@ pdc: interrupt-controller@b220000 {
 			interrupt-controller;
 		};
 
+		spmi_bus: spmi@c440000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x0 0x0c440000 0x0 0x1100>,
+			      <0x0 0x0c600000 0x0 0x2000000>,
+			      <0x0 0x0e600000 0x0 0x100000>,
+			      <0x0 0x0e700000 0x0 0xa0000>,
+			      <0x0 0x0c40a000 0x0 0x26000>;
+			reg-names = "core",
+				    "chnls",
+				    "obsrvr",
+				    "intr",
+				    "cnfg";
+			qcom,channel = <0>;
+			qcom,ee = <0>;
+			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "periph_irq";
+			interrupt-controller;
+			#interrupt-cells = <4>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
 		tlmm: pinctrl@f000000 {
 			compatible = "qcom,sa8775p-tlmm";
 			reg = <0x0 0x0f000000 0x0 0x1000000>;
-- 
2.37.2

