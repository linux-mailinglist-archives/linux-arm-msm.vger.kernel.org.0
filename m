Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56CD77434CD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 08:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232292AbjF3GN1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 02:13:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232159AbjF3GNZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 02:13:25 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 251EF2686
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 23:13:23 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b5c231c23aso23861831fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 23:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688105601; x=1690697601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9QSwp/Yi0gTIELlT3+TQjjPXCsXXYaeAudYhyw66ZwA=;
        b=feL+izQSP1iuIQU+F9iL/80aurCbzf1di/uLRgi7kZC12K+CczRZyGoDcPEYo603NH
         cu1z1VX8AAViF1vIlcYfCmCk1tZwXgHaX7OAeFm3qbxhubjjrKQtW3Jt1CBEgrmJnYS3
         fTAAWa9qlXrEb9SrSoGdtrNr3fAx/CLXd+FpFo2owiBDiNmtj80+PBMVcbgSmiuhuMfj
         iYmiSHbAceQ/LU4LBiZnQ95oQP5tG2vAkvh/ddq3JbURJz/dYDBBwaqzmN5DoiCZypRe
         Evj5YekPB+xzVDhpvAmh7VEqNBMx1E5zyq7Lm7nPW+1tQ/RLq3pwwI1Ug0gBgw96uc9Y
         RrxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688105601; x=1690697601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9QSwp/Yi0gTIELlT3+TQjjPXCsXXYaeAudYhyw66ZwA=;
        b=foo88VMNrPqyxs0f11SCy6bIVxyZI+HvWeNnN/lzFmwqWqnGqFqFbARssE4hODvyhF
         OOT4hVZgs0nUGR7WM5Vx8Myaa2scli7wMLlakyP45MjcrRj7FYM7lV5chOO3JchUszr5
         MIx09AG/LihUjMgyPwWhSKbeMEWM16GpXO1lEozOjxLH1r8/My2x3RtR+6UaLZt/VjOl
         3CDa8XWQHGV793Vhf9Dj+u9mL8Iq1ayHG97Kpk/7sGTMoxkxnZ8xlUES2emFfmzJUPJJ
         1bAw/OkJuXRI++iuTy4ghd2TUKzDVu/z1HTRkhucNDkKxUdlux43DLIn+XlBY6DO/xVp
         ShfQ==
X-Gm-Message-State: ABy/qLYD50h2XTUVm/UT2ZCjAci0AJgTZnEyykJiDStTXmwyXe7nM9Sf
        2rP51ri+ZQSgffkOIIZNfKbXog==
X-Google-Smtp-Source: APBJJlFLrt8mMH5uhZv2KkpppD70SeP4POy98kr4u6szyzeLZXWk4Xg9Dtcv6QNIGYNj9Kh1/F0Rvg==
X-Received: by 2002:a2e:978e:0:b0:2b4:79c3:ce04 with SMTP id y14-20020a2e978e000000b002b479c3ce04mr1133194lji.50.1688105601471;
        Thu, 29 Jun 2023 23:13:21 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g22-20020a2eb0d6000000b002b6caeb4b41sm505582ljl.27.2023.06.29.23.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 23:13:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 6/7] arm64: dts: qcom: sm8450-hdk: define DIE_TEMP channels
Date:   Fri, 30 Jun 2023 09:13:14 +0300
Message-Id: <20230630061315.4027453-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630061315.4027453-1-dmitry.baryshkov@linaro.org>
References: <20230630061315.4027453-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Declare the DIE_TEMP channels provided by PMICs. Use them to provide
temperature reading for the spmi-temp-alarm thermal zones.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 43 +++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index dabb7e872f38..d07e402eaba3 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -6,6 +6,10 @@
 /dts-v1/;
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
+#include <dt-bindings/iio/qcom,spmi-adc7-pm8350b.h>
+#include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
+#include <dt-bindings/iio/qcom,spmi-adc7-pmr735a.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include "sm8450.dtsi"
 #include "pm8350.dtsi"
@@ -588,6 +592,45 @@ &pcie1_phy {
 	vdda-pll-supply = <&vreg_l6b_1p2>;
 };
 
+&pm8350_temp_alarm {
+	io-channels = <&pmk8350_vadc PM8350_ADC7_DIE_TEMP(1)>;
+	io-channel-names = "thermal";
+};
+
+&pm8350b_temp_alarm {
+	io-channels = <&pmk8350_vadc PM8350B_ADC7_DIE_TEMP>;
+	io-channel-names = "thermal";
+};
+
+&pmr735a_temp_alarm {
+	io-channels = <&pmk8350_vadc PMR735A_ADC7_DIE_TEMP>;
+	io-channel-names = "thermal";
+};
+
+&pmk8350_vadc {
+	status = "okay";
+
+	channel@3 {
+		reg = <PMK8350_ADC7_DIE_TEMP>;
+		label = "pmk8350_die_temp";
+	};
+
+	channel@103 {
+		reg = <PM8350_ADC7_DIE_TEMP(1)>;
+		label = "pm8350_die_temp";
+	};
+
+	channel@303 {
+		reg = <PM8350B_ADC7_DIE_TEMP>;
+		label = "pm8350b_die_temp";
+	};
+
+	channel@403 {
+		reg = <PMR735A_ADC7_DIE_TEMP>;
+		label = "pmr735a_die_temp";
+	};
+};
+
 &remoteproc_adsp {
 	status = "okay";
 	firmware-name = "qcom/sm8450/adsp.mbn";
-- 
2.39.2

