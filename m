Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 687F263D397
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Nov 2022 11:39:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235813AbiK3Kjf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Nov 2022 05:39:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236045AbiK3Kjb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Nov 2022 05:39:31 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09BAB4840D
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 02:39:29 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5so12870299wmo.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 02:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ac01MNpGttzSWrL+rbqu92ki9p2iWRCBWS5WOaTGxA=;
        b=cGfS7i7PFmYNreWpE/wRq3s1IT9AieaB/ZpOh6skpjtST4U3Ri4fyMV32JoTnJ70wt
         /zNzNj+MGvujmRrg4IpMwNU6N29wrMkkvrFAuSk/rNlviA8hEDzVgRdvLkW6b2SNqKH9
         cv5sXfiHajTiEhFVaTLWsJPcDbJjVSSplOGbuWDk/r64atLOlDyiwaOVwsmtMvDU7ZVq
         xftUJQR0DdKTbl4bOmJuqf0X+Flf7lgaCcOKCDio4nBfxJBG7CfWf1RwfsoQBovkspAl
         sRBj4vQMLj1/NauyVZytqqihsJDgsZV7Wiv7rzmPABM4tU6GpRZQ4RjHLrJXUlCcJUnj
         DEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ac01MNpGttzSWrL+rbqu92ki9p2iWRCBWS5WOaTGxA=;
        b=FgeWNXHzQnSlO0lzZugNCf9Rk3ERxe9ojcwqwwHT7omxViGycziA86Hw/ocMjVWmBK
         r84H3xuPhy/lHd9gg24GolFpm8YwSBUteDs/5VLXC7RvwWLaqiTDoqqCe5TK84CEr8pw
         aS48QF+Jfkuxstu3yJIcKErmwD2rwtwqP/RMk4AhhiwjjbL+CLN25kzBANugqJvtk8MP
         0S1kyTCwA7vBFz5SIgCA3RD8koEJrHAZzX50RmC1qUqeQ0p1AYY1QgTKk1jmMQSPWI81
         KAZryf/u8b7FRayw0+grZ/uxu/Jz0ZHcvsFAf/oP/B5B8w0t/Njct3l2/Cq0NRFTpDRN
         X00Q==
X-Gm-Message-State: ANoB5pl/fvDlulOXTzK2V864UCyPoAHO1g7STxTT/r0z3aNsKn7FpwuI
        PNZ9QBAEHXl3VVZPqc96HWBCWQ==
X-Google-Smtp-Source: AA0mqf6DNxKTp9gExkgJ6GKhyAHlWKy9V9RQixFYGywqss/p+jtBxtuN/IE1wfHhWD0+fQYoaKnvLg==
X-Received: by 2002:a05:600c:3109:b0:3cf:5731:53db with SMTP id g9-20020a05600c310900b003cf573153dbmr48721861wmo.85.1669804767621;
        Wed, 30 Nov 2022 02:39:27 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id k9-20020adfe8c9000000b00241f632c90fsm1261174wrn.117.2022.11.30.02.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 02:39:27 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 30 Nov 2022 11:39:25 +0100
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm8550-mtp: enable adsp, cdsp & mdss
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221115-topic-sm8550-upstream-dts-remoteproc-v2-3-98f7a6b35b34@linaro.org>
References: <20221115-topic-sm8550-upstream-dts-remoteproc-v2-0-98f7a6b35b34@linaro.org>
In-Reply-To: <20221115-topic-sm8550-upstream-dts-remoteproc-v2-0-98f7a6b35b34@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the aDSP, cDSP and MPSS firmware and "Devicetree" firmware paths
for the SM8550 MTP platform.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index b0bcabecd60e..d1fdf3923452 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -374,6 +374,24 @@ &qupv3_id_0 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/sm8550/adsp.mbn",
+			"qcom/sm8550/adsp_dtb.mbn";
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/sm8550/cdsp.mbn",
+			"qcom/sm8550/cdsp_dtb.mbn";
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/sm8550/modem.mbn",
+			"qcom/sm8550/modem_dtb.mbn";
+	status = "okay";
+};
+
 &sdhc_2 {
 	cd-gpios = <&pm8550_gpios 12 GPIO_ACTIVE_LOW>;
 	pinctrl-names = "default", "sleep";

-- 
b4 0.10.1
