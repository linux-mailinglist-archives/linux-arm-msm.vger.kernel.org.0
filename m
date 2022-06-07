Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A9D953FB51
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jun 2022 12:34:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241063AbiFGKd7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 06:33:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241050AbiFGKd5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 06:33:57 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 369EE606D3
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 03:33:56 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 25so22113544edw.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 03:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5684ZCuFKjUZf1A0V/l4v3S11bpO074EtOPdjGOIeIQ=;
        b=dqGPKn8pGEPvS5tOITYYmKsDfhlYWPf4Q+JzZxWkTVwa5a4XbcSgAz97lWJA0VKfDY
         gMsjn6pqWR+bcidwu3mbXMMo9CKClceT952dLUpVRWkrGaBKDJ1J52cOVDrI6Oh+0rPr
         cnpqpND4O7SwKeBH8HW5sneHsnEjodUsHAKWAZnOzyJ9AAUEsdAubRjRDOTTTQYzvRB1
         rK+TW7+k4Nl4E0oAGV90yz/rV2zEWmXO+7OvgXFu44TPLSjMT4naW/2FTDD1zf/ZquC9
         c7oECNbwKIYeS/0uiXt/FeYjBhUGhYb8PY+Mef6C1x/81IwGiM/Tek3P+HSATTU1tlfG
         bdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5684ZCuFKjUZf1A0V/l4v3S11bpO074EtOPdjGOIeIQ=;
        b=IX/X2PNTfQwATIFhUQQPeV4X9eDnNXFdPtJkN8C7UAz8L8mBGlAqNLaAxU8JgOOT87
         Glx9m3i42fj5xaCvQbyFecCBxpgVX6sU1l0ZjjlrPqfklnCLyj74zwCY04xE0DihtOWe
         xVDTmfMD1nxaJqmdwve/M9G7IRZF3cOMu6nG1VaNOBj9jnrB0ymvtqvXe6HXVD7kQVo5
         PlkKg7/EDjIm1JovArUp+W5HvBAaaz4NsAqgpIQiH2qM+nzwiCxW26VVUZSM/aWaiuq8
         CNntGONSszmWiWvlvC9nzqHzNzFNcPIv/FNjmWI439jldR5Z/5N0TppQT90tkyE0btJV
         pKJw==
X-Gm-Message-State: AOAM532MVWUuvOGKBfUnLujUhbTMDSuHTqjw6u2jB4SLiX8QPd1rxhcD
        lTPg4eV9aLY7eTdfBjemtNAfmg==
X-Google-Smtp-Source: ABdhPJwSCDkpVwfygk6b6aG2ZX5Sr+tvZ+h7UtxCxDpPZ4x8PsNV2K7qP41tKSLqSb3NBhgg52tkDA==
X-Received: by 2002:a05:6402:1e93:b0:42d:d71d:cb60 with SMTP id f19-20020a0564021e9300b0042dd71dcb60mr33160867edf.399.1654598034841;
        Tue, 07 Jun 2022 03:33:54 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id x4-20020a1709065ac400b00704fa2748ffsm7505359ejs.99.2022.06.07.03.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 03:33:54 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 05/10] ARM: dts: qcom: ipq8064: add function to LED nodes
Date:   Tue,  7 Jun 2022 12:29:26 +0200
Message-Id: <20220607102931.102805-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607102931.102805-1-krzysztof.kozlowski@linaro.org>
References: <20220607102931.102805-1-krzysztof.kozlowski@linaro.org>
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

Add common LED property - the function - to LED nodes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi b/arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi
index 5c802b99e15f..7a28a0bfc4ee 100644
--- a/arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "qcom-ipq8064.dtsi"
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. IPQ8064-v1.0";
@@ -107,6 +108,7 @@ led@8 {
 
 			led@9 {
 				label = "status_led_fail";
+				function = LED_FUNCTION_STATUS;
 				gpios = <&qcom_pinmux 9 GPIO_ACTIVE_HIGH>;
 				default-state = "off";
 			};
@@ -119,6 +121,7 @@ led@26 {
 
 			led@53 {
 				label = "status_led_pass";
+				function = LED_FUNCTION_STATUS;
 				gpios = <&qcom_pinmux 53 GPIO_ACTIVE_HIGH>;
 				default-state = "off";
 			};
-- 
2.34.1

