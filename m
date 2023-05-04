Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 830CF6F6FC1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 May 2023 18:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbjEDQSF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 May 2023 12:18:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229673AbjEDQSD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 May 2023 12:18:03 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F15C435A2
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 May 2023 09:18:01 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f3331f928cso5606625e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 May 2023 09:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1683217080; x=1685809080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DIphhPWEW6QhcmnY41fehaOD6U9YlzY9aj8W7kOg/UY=;
        b=e7KJ8WwmpXY+57f1RUShDYhnKIjBlpjiFN1eTMVKS1hsdwA7IrbsLVryzSTqOImyCC
         W76MJAufjtEhtOeb59WrX67xTMu7kistTli6d60blS+PQf9mrBfPQUpbJkKt28t/lv17
         2oBJpI5nkrI5zK4U3vLoTN1ziE/++oMWxcTYN3/1YGIFYyBOarLM/JSk7aBfcjM6lrnW
         Lnf0mZd+Lvl0DnY1/7G0hiYW3hJUoXrZGid8CsR8COj2E4r6vH8YJgGWrCOA4bwz54/C
         A5jntb33t8TH7TMf6h0obQqOrwtKdVpFf/TMYv91aIo85neF3I4xcRW/p1kBL1IyINi2
         E6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683217080; x=1685809080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DIphhPWEW6QhcmnY41fehaOD6U9YlzY9aj8W7kOg/UY=;
        b=TIR9r1nnaxjiKF47TrTmcluF3lQNGueqrMTrRQXme1gsmklaDMBLKCOBCeIe19noim
         POKAIqE8hSmJwiECHV9BZAzq9uFUCJv4hSIA5ceGdZ82vinjmZ6p6lbHPfPiBvX2DwBe
         tiBZsXC4clwvcYGVxCP/lmAbh15xqXsmzh6oGQq60RUWDYViIolOB/H+hj5iuBlvgBr1
         5uEJMm3K2hmbaxOOm2aDy5CwkbBvTCGGGN07WcSNVb50s/ZjOBOcpg4MNXGzus77UilF
         E1zeH0wriliHvGBKbEQ8Sg4jBMot6Fog4wA3//kYxyQE0G2M2rOXaIkgXwmbLDi0kBje
         J0pw==
X-Gm-Message-State: AC+VfDy0xhWNyPUnPkgBfVLu/Zhovp/xVUWFq0C7dzwosU89tWXVy8/Y
        rqac+FRpFlIn63BALWOOAKQAMw==
X-Google-Smtp-Source: ACHHUZ6zM0Qu/02PWwFJOw+0PQcAqjiuO/4pf2cnPLzI1JY9nb7q4IJdzOQpub6VMV6otNzuwWEVRw==
X-Received: by 2002:a05:600c:218c:b0:3f1:8aaa:c20c with SMTP id e12-20020a05600c218c00b003f18aaac20cmr206926wme.7.1683217080528;
        Thu, 04 May 2023 09:18:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:14d4:bf3e:d1a3:623])
        by smtp.gmail.com with ESMTPSA id u19-20020a7bc053000000b003f09d7b6e20sm5336293wmc.2.2023.05.04.09.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 09:18:00 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 2/2] arm64: dts: qcom: sa8775p: enable AOSS
Date:   Thu,  4 May 2023 18:17:55 +0200
Message-Id: <20230504161755.197417-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504161755.197417-1-brgl@bgdev.pl>
References: <20230504161755.197417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Enable the always-on subsystem controller on SA8775P platforms for use
by upcoming support for other peripherals.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 0737ba38fefe..c5e2e3256bc4 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
 #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
 #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
+#include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
@@ -752,6 +753,16 @@ pdc: interrupt-controller@b220000 {
 			interrupt-controller;
 		};
 
+		aoss_qmp: power-management@c300000 {
+			compatible = "qcom,sa8775p-aoss-qmp", "qcom,aoss-qmp";
+			reg = <0x0 0x0c300000 0x0 0x400>;
+			interrupts-extended = <&ipcc IPCC_CLIENT_AOP
+					       IPCC_MPROC_SIGNAL_GLINK_QMP
+					       IRQ_TYPE_EDGE_RISING>;
+			mboxes = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP>;
+			#clock-cells = <0>;
+		};
+
 		spmi_bus: spmi@c440000 {
 			compatible = "qcom,spmi-pmic-arb";
 			reg = <0x0 0x0c440000 0x0 0x1100>,
-- 
2.39.2

