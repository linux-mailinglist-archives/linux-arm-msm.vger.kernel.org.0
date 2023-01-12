Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6159A6673FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 15:02:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbjALOCB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 09:02:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233641AbjALN7x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 08:59:53 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 685E6532B2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 05:59:32 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id az20so25886854ejc.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 05:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1hCAdnriPTiqUAC3Z9eazAM9x+QqA4Mn0IVX/+2PdE=;
        b=Xo6ArLBpXO2MnY9QMq85ZB0u2FsdWergMakVIF5Gq9D90R+UDnIW8Ne8k3B6bPlxYj
         Je2QThRGEozmdemJj5czgOL8DXbjcbkBvep7Zpp5GjwXWAHtc3asLqMFRkzNT6dgQPG8
         fMO2CbBNmjGKnynq9CuyTbgeqx3mHx0ArCIA1i669imW4dVq5/fLv2M+YKI/mbSEdhsy
         d/mq8GCfkEHdtyplhjuJ3Gz0sg/1rYnlDMvXU2k7jRfKHkVD1jy96VEEgvc4OAER+JD/
         6swYn+UminuEy5eiobDuwA+UmaPVM4VUrFFOtkkzW1PGwP/MY3qzcrb1mSt0FfBGEExO
         QQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q1hCAdnriPTiqUAC3Z9eazAM9x+QqA4Mn0IVX/+2PdE=;
        b=Dq9aNueX463fkC4V1hu3G9wMdHVz7DsYtyhZZQu1rqa7psBf8BiF2OPRlX6Cqzytg0
         sYjl6Ufsu6PJsrCMB5tPvAahsDIfFLwjYIwqWzZCmMdm2UEsuBn1jXs4G7U6uUnYwSYr
         Bj+T5xeE65pIM6k+WK6IYZH/f8jbh/fo+ayXpUXgNPv+xGwY03chAKW+qAQ7YGqjK7F1
         2beAQEJAofPQO260rkc442nKD86VNChpItlpGaogT/obLZQpClXlWmGT4YJnFabVAx0X
         bsxSpvvK3NrRjx7lZgXDJEvEeVJcUKq10N8HpW3D4oCFmDbwx6mjBHY2j/1kZKkIYfPd
         APjw==
X-Gm-Message-State: AFqh2krqBrZ91yCXvzA5zRTKUPkO1EM6iv64/QEh+ogqQbKaHV5iZqV3
        2FX/6wI8MFjh5cJ8MGE0v4UMuw==
X-Google-Smtp-Source: AMrXdXuyiidN9ecZ78S3tPa0KeXhzsT6PQexKin6Yf/aIi/NNDSBkq76yFxWLGtZ1I2mMnpKIlWMzg==
X-Received: by 2002:a17:907:6e05:b0:7c1:235d:2a2b with SMTP id sd5-20020a1709076e0500b007c1235d2a2bmr84877092ejc.24.1673531970943;
        Thu, 12 Jan 2023 05:59:30 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id 17-20020a170906329100b007c0bb571da5sm7376494ejw.41.2023.01.12.05.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 05:59:30 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: qcom: sm8550-mtp: Add UFS host controller and PHY node
Date:   Thu, 12 Jan 2023 15:59:26 +0200
Message-Id: <20230112135926.1572191-2-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112135926.1572191-1-abel.vesa@linaro.org>
References: <20230112135926.1572191-1-abel.vesa@linaro.org>
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

Enable UFS host controller and PHY node on SM8550 MTP board.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---

Changes since v1:
 * moved status property last, like Konrad suggested

 arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 8586e16d6079..81fcbdc6bdc4 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -399,6 +399,25 @@ &uart7 {
 	status = "okay";
 };
 
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
+	vcc-supply = <&vreg_l17b_2p5>;
+	vcc-max-microamp = <1300000>;
+	vccq-supply = <&vreg_l1g_1p2>;
+	vccq-max-microamp = <1200000>;
+	vccq2-supply = <&vreg_l3g_1p2>;
+	vccq2-max-microamp = <100>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l1d_0p88>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
+
+	status = "okay";
+};
+
 &xo_board {
 	clock-frequency = <76800000>;
 };
-- 
2.34.1

