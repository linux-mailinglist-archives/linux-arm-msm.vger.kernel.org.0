Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00C065BD505
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Sep 2022 21:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbiISTAw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Sep 2022 15:00:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbiISTAs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Sep 2022 15:00:48 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16BD8356CD
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Sep 2022 12:00:44 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id z25so78981lfr.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Sep 2022 12:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=i8PKZ4so96I7yne/6psr7dILtmJy5rP5mGeypC4cqFk=;
        b=ZFxSd5X3hZlOhj/h8Zn3jcT1d/ju6uMQYyjwci3k6WqFT0hR2MBJPcrzdotYvK3ecI
         +jbg6MrzUPG+UfY+luNAjWPhE1kN9lAsY9SAKXdxknXgdEjFR6DXMsCFMJ+3ufqyJHy/
         3dJohza6zs09KnboCu1ngou985jyMEYThiQE3z3hTPJvC+edem5JV/YcKVVQOmF/F7EV
         LLZqDHrQtUj6SGVdXePKIzJ2W34SOTSMgLdEQxYaBWeoFc1pg/bxsFv7IfG0oLtQwJ7c
         jLd20jNky7oRHKghACtvBr/V34mx+2J0AhAArDwFXz1JQU3E0zk0iGZX9lfvPQB44dZE
         /YPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=i8PKZ4so96I7yne/6psr7dILtmJy5rP5mGeypC4cqFk=;
        b=CuaJY7ikMHRYWuG2wiiSXmzFh7hUnpDow6/h8Ej7dvvcC7jct1AHWMsnN0pkra2pex
         OKLfZbbehACiMJWAt/hOBXx9uashpaIAfHG2Fh2ylUECkxoI3OcuW6MYi7NFCR/0Sk0r
         sOOpUqEq5Jp8O96skHbWAmcqYdAH/CsIzZB20w5BpD+ApIal4AuUV96Yd8tAYRPnk8hG
         L8Q+1ZerTPy/t7mQTo6nAGsvQXtz+QrquAYc74AZ4TMD0gOSO106SUZ8SF3rKtMtJPSH
         D5jrj/K7oy9ABjFafjoWnPJwmlAVWYsLkkW/+4L/9aoCpZzDzxtA2/Sy6War1EUZQvzz
         sIOQ==
X-Gm-Message-State: ACrzQf0B7k+1yyck7iufzu80aXr3OHHVXh5W2IWUFgS3CM8aIlRSFk1P
        u/Jwto64VkT+/RL0VI9JF7MVqA==
X-Google-Smtp-Source: AMsMyM5NWu2viVa4sd+F3qM1Ko5XwouPAhEQLl6fjjlmnnlPyow2ud4jfelno2j0QM4GKhlKQpSD5Q==
X-Received: by 2002:a05:6512:706:b0:498:b7ea:f2e8 with SMTP id b6-20020a056512070600b00498b7eaf2e8mr6753097lfs.570.1663614043007;
        Mon, 19 Sep 2022 12:00:43 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u12-20020a05651220cc00b0049a747d6156sm4878907lfr.287.2022.09.19.12.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 12:00:42 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v1 4/6] arm64: qcom: dts: sagami: correct firmware paths
Date:   Mon, 19 Sep 2022 22:00:35 +0300
Message-Id: <20220919190037.2122284-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220919190037.2122284-1-dmitry.baryshkov@linaro.org>
References: <20220919190037.2122284-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Correct firmware paths for the Sony Xperia Sagami devices to include the
SoC name, vendor and platform names.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
index b3c9952ac173..e73ea22bd142 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
@@ -77,12 +77,12 @@ ramoops@ffc00000 {
 
 &adsp {
 	status = "okay";
-	firmware-name = "qcom/adsp.mbn";
+	firmware-name = "qcom/sm8350/Sony/sagami/adsp.mbn";
 };
 
 &cdsp {
 	status = "okay";
-	firmware-name = "qcom/cdsp.mbn";
+	firmware-name = "qcom/sm8350/Sony/sagami/cdsp.mbn";
 };
 
 &i2c1 {
@@ -175,12 +175,12 @@ &i2c17 {
 &ipa {
 	status = "okay";
 	memory-region = <&pil_ipa_fw_mem>;
-	firmware-name = "qcom/ipa_fws.mbn";
+	firmware-name = "qcom/sm8350/Sony/sagami/ipa_fws.mbn";
 };
 
 &mpss {
 	status = "okay";
-	firmware-name = "qcom/modem.mbn";
+	firmware-name = "qcom/sm8350/Sony/sagami/modem.mbn";
 };
 
 &pmk8350_rtc {
@@ -210,7 +210,7 @@ &qupv3_id_2 {
 
 &slpi {
 	status = "okay";
-	firmware-name = "qcom/slpi.mbn";
+	firmware-name = "qcom/sm8350/Sony/sagami/slpi.mbn";
 };
 
 &spi14 {
-- 
2.35.1

