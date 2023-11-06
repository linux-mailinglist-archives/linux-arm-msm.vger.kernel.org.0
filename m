Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B7DA7E3019
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Nov 2023 23:44:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233344AbjKFWov (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Nov 2023 17:44:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233380AbjKFWod (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Nov 2023 17:44:33 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33EA1D71
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Nov 2023 14:44:29 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6b77ab73c6fso3972042b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Nov 2023 14:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699310668; x=1699915468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSFzZ8MKWLiAfWY/igP5BmMC+MvDzsV/nsEt0CPNxwc=;
        b=OiK77QSLdvOzKTwuVexKwfy8shaOf5X0LCpsPwzWfTv9RTrUZ4+/SQTNhHPo5a+ToI
         JkyyTnwZSM06xvOFLnumXFJANKBrsPWLHWrt5vCWj7uVSNiYJT7Yq7E3tnWfhCG1ed77
         thLTFuxnHqR12NdfagsN6fEAtWCTLMA9J35QU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699310668; x=1699915468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JSFzZ8MKWLiAfWY/igP5BmMC+MvDzsV/nsEt0CPNxwc=;
        b=mwU+ZfcRcIUq+uz0qQ7prJZImwbNU0414O6zZT2Fk+AQWAzQFLoYU82JdHdJ3VOtAZ
         j2wKgpF57BIlTFq2g2h5+KOgIQ2/S+wDAVNlVy2oOMFDCDQ7CnPW5wC+Me5WjYfKtyw+
         NHpdCoJTL7wfhfpfTxCYEptWBm5KUmPXRY2TqNgvgeOaWN0JhNk2fi7irRplOzV4hFiM
         qyqL2ww88ZTNDtoXAY/LG7aNnsHwZ5yPuK3PJY1L7Crn3uRfCibpd9QZxbI007+kzZD3
         Q5fpoJJ9QHFUnyBzgpn1p3gFPZlSUQjiojRtJOjGedhqdLitqMAmX6adaYt0wVNtpJQA
         C5XA==
X-Gm-Message-State: AOJu0Ywm8CIisC6nKxZjm9cJOwvsLgn9bi7Ga3U/nFXT3lJx2mC/8gOW
        EFLyRkv8ed9IM7qmk3lxXa6/4Q==
X-Google-Smtp-Source: AGHT+IG6gzEJ52rY+ItvXab//ZSnUcmhXxypnlC7l6Ma3b1yinNqemp4TAQZMqkiymLSkLqhVuFGnQ==
X-Received: by 2002:a05:6a00:2e9e:b0:68f:b5a3:5ec6 with SMTP id fd30-20020a056a002e9e00b0068fb5a35ec6mr1433778pfb.0.1699310668041;
        Mon, 06 Nov 2023 14:44:28 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:16a7:2c01:9126:36a4])
        by smtp.gmail.com with ESMTPSA id c10-20020a056a00248a00b006b725b2158bsm6043402pfv.41.2023.11.06.14.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 14:44:27 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     swboyd@chromium.org, linux-watchdog@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/9] arm64: dts: qcom: sm6350: Make watchdog bark interrupt edge triggered
Date:   Mon,  6 Nov 2023 14:43:35 -0800
Message-ID: <20231106144335.v2.8.Ic1d4402e99c70354d501ccd98105e908a902f671@changeid>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
In-Reply-To: <20231106144335.v2.1.Ic7577567baff921347d423b722de8b857602efb1@changeid>
References: <20231106144335.v2.1.Ic7577567baff921347d423b722de8b857602efb1@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As described in the patch ("arm64: dts: qcom: sc7180: Make watchdog
bark interrupt edge triggered"), the Qualcomm watchdog timer's bark
interrupt should be configured as edge triggered. Make the change.

Fixes: 5f82b9cda61e ("arm64: dts: qcom: Add SM6350 device tree")
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 8fd6f4d03490..6464e144c228 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -2524,7 +2524,7 @@ watchdog@17c10000 {
 			compatible = "qcom,apss-wdt-sm6350", "qcom,kpss-wdt";
 			reg = <0 0x17c10000 0 0x1000>;
 			clocks = <&sleep_clk>;
-			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
 		};
 
 		timer@17c20000 {
-- 
2.42.0.869.gea05f2083d-goog

