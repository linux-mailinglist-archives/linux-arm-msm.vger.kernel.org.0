Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 400D168D9EF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 14:57:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232405AbjBGN5O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Feb 2023 08:57:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229839AbjBGN4p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Feb 2023 08:56:45 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51CB1392A2
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Feb 2023 05:56:19 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id ba1so9569113wrb.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Feb 2023 05:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V1aUOJzlnvog/gfPWV5JW0Qf9tdncCWCmWydTboOvKw=;
        b=bO5sg5C5vYk9TdSOnLjR4vlhtn9sPiCyuwTtqnTTgWRlpu6ZIHi2AuSfyxwDUhH1E3
         7iIfij9Fjz7f1MYJpQy2hjG1h8vjsYElgJEhcWCYbarfC1ZcxdyLCyd/IPGwYUz+3Mde
         oqQp5TY/prn2vOHVAiD4YbRNxJmoIEX9aMEGWawsmNYceIIZqF3dZuYM8TqTJFLpiItC
         gUZj8ZewAg+J/0uxy84V7Sd9T7B9STa6We5Gn5QUkuDdBa0eSe6ZESufOyJ8RqKi93Fd
         zZeqp4/kmqKAY2c8yu6aJKqcT81K8WZv25+Y4RCXZ0TR+A81ExbJ+Ite5QCLES6P4aWw
         A8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V1aUOJzlnvog/gfPWV5JW0Qf9tdncCWCmWydTboOvKw=;
        b=Ooi42WdFHGoNYjPUOz+m4WeduUpUi3gHg+1h4EzwYxaw/gkd0HQR8U9Wjn59xCmz/I
         lAzEk3s0x9Sy3mZ2nlqO573W6zsMNOv57uZb5DMqGvqVOX26XIllccRgt1KmtSjsvda4
         Lojwv910kqjIAVFIe5gDb/gcXQHkSP79T7qhWAwOPbUe8TUz67O+u1wO19bk0VYMUN4W
         0aHefnkIL+WPN9Wu7/xw2SMq5zt7u/vErvohlGq+vZbRl0W5Fo+gMt6LD28vl02ay7og
         DXKKmY6OrUFqZlrM2itL0O2u5tjdnt/uJCqIQh7ue2zQxopBeWu/e6Y43lLAG0B4fGsC
         GpRQ==
X-Gm-Message-State: AO0yUKVpwcrCbtuadEQZKHADhxt4P99te837WY0UkJLwHaeaR4a3B1um
        yGi4bYjuAPPTy5stw6s9NPRxkA==
X-Google-Smtp-Source: AK7set8/7pguR2nkrh5sfxWhRMJoc0cANOCX7qiQNTzv4aIYl17VUb020gXBfptdCuTi7LOG4aoGAA==
X-Received: by 2002:a5d:6d82:0:b0:2c3:c138:e52d with SMTP id l2-20020a5d6d82000000b002c3c138e52dmr14202450wrs.4.1675778164473;
        Tue, 07 Feb 2023 05:56:04 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id p10-20020a5d59aa000000b002be5401ef5fsm11611312wrr.39.2023.02.07.05.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 05:56:03 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 7/7] arm64: dts: qcom: sm8550-mtp: Add eUSB2 repeater node
Date:   Tue,  7 Feb 2023 15:55:51 +0200
Message-Id: <20230207135551.1418637-8-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230207135551.1418637-1-abel.vesa@linaro.org>
References: <20230207135551.1418637-1-abel.vesa@linaro.org>
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

Add the PMIC eUSB2 repeater node and add the usb-repeater
property to the eUSB2 PHY to allow it to be controlled by the
PHY driver.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---

The v3 (rfc) is here:
https://lore.kernel.org/all/20230202133816.4026990-8-abel.vesa@linaro.org/

Changes since v3:
 * Dropped the phy-names property from usb_1_hsphy, like Dmitry suggested

 arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 56aab7cafcbc..6b6ec0fe5e5e 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -457,6 +457,11 @@ sdc2_card_det_n: sdc2-card-det-state {
 	};
 };
 
+&pm8550b_eusb2_repeater {
+	vdd18-supply = <&vreg_l15b_1p8>;
+	vdd3-supply = <&vreg_l5b_3p1>;
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -563,6 +568,8 @@ &usb_1_hsphy {
 	vdd-supply = <&vreg_l1e_0p88>;
 	vdda12-supply = <&vreg_l3e_1p2>;
 
+	phys = <&pm8550b_eusb2_repeater>;
+
 	status = "okay";
 };
 
-- 
2.34.1

