Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE3A2600B45
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Oct 2022 11:45:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231451AbiJQJpl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 05:45:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231191AbiJQJpj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 05:45:39 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6AF04F659
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 02:45:34 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id bk15so17545821wrb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 02:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jKPmuyWzuvi/ZRN3fqLVs1CIkyhJEvTnfd6fDEo2uxM=;
        b=CyYdzyv4mZ5ePO8lL1OI6DtOzpnjDvsW4l4piGcCHN1c28abN0JeNnPLbXrFCrNsIw
         S+k+2k37vWVi6LUnvP6EkGe9dh2VoIbaEqaKrsrrvMDIIUDyXR07LGEUI3W7jtUmT6ks
         BU3+YIp09oz0KFquvD1ewY5Xd4eW9+4ToCpgsJF/l1++Z9YniyHm9YyRFu2FxA+Ij4PN
         dB/0gWgsNrWz1MEtpAym+/m5nObYae1SEyHS9lfDm+dA6GQpRYE4qv0jilNFOo3PBjwi
         JV2RYsS+QIm82ooSZVfL8oV1FvDLT2paoI3bowX3ideKGaNgggFSm9nB++9hQzuKeEHI
         GRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jKPmuyWzuvi/ZRN3fqLVs1CIkyhJEvTnfd6fDEo2uxM=;
        b=5dCgMLBElCA5YeGiywt8ESTzOp5GRn9+Sp4GGGVmJw1U58xVg2oUPs2V6UYKIsYGjg
         JS0iGSJyaL1wZeYNufGhtD2wgxogcMTc3ccBkaLaKCyK5jXtsdof/o+EGFoPsf+fVH0L
         avkjPkSjEnXk9EeW7OzTWUwZTdnu+YiZSBU2UNR0iTl+rdsAOjg1hA368YBNs/GxgIK6
         fYjSifIXDqgc5AsUF8CHI1P8PdH7Ad0dmGdAdINvPhOlUO4vm8W4gd4FvwGuKEhe2Du8
         yWn5F7Q+EwIRlPIp6ukCAV7Gj6Xy8/vv3Dawf+qbBKA7pDV6Pdl8rG1oEcW0CVztQjun
         0sHQ==
X-Gm-Message-State: ACrzQf3+9916j/M5mlkmFEFg337hLbNXiYgqDydyD3nR8+4v4R+U5npp
        DIXOUjllqgoKvSlJc4BPxOM/pA==
X-Google-Smtp-Source: AMsMyM5G8+Vtep3WP7PLF9upWSnfQWc02V0yrx/ln3HQf6nMnhnfNz60whFysw0AZU3PjE4RraDJRg==
X-Received: by 2002:adf:dd0c:0:b0:22e:4bf6:6c08 with SMTP id a12-20020adfdd0c000000b0022e4bf66c08mr5788854wrm.617.1665999932926;
        Mon, 17 Oct 2022 02:45:32 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id d12-20020adfa40c000000b0022ca921dc67sm7824305wra.88.2022.10.17.02.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 02:45:32 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 17 Oct 2022 11:45:29 +0200
Subject: [PATCH v3 04/11] arm: dts: qcom: mdm9615: remove invalid spi-max-frequency
 gsbi3_spi node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220928-mdm9615-dt-schema-fixes-v3-4-531da552c354@linaro.org>
References: <20220928-mdm9615-dt-schema-fixes-v3-0-531da552c354@linaro.org>
In-Reply-To: <20220928-mdm9615-dt-schema-fixes-v3-0-531da552c354@linaro.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-rtc@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-input@vger.kernel.org
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The spi-max-frequency property has nothing to do in the controller's node,
remove it and fix the 'spi-max-frequency' was unexpected dtbs check error.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-mdm9615.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
index eaa3236f62db..366241dee522 100644
--- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
@@ -170,7 +170,6 @@ gsbi3_spi: spi@16280000 {
 				#size-cells = <0>;
 				reg = <0x16280000 0x1000>;
 				interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
-				spi-max-frequency = <24000000>;
 
 				clocks = <&gcc GSBI3_QUP_CLK>, <&gcc GSBI3_H_CLK>;
 				clock-names = "core", "iface";

-- 
b4 0.10.1
