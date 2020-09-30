Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D937A27E615
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Sep 2020 12:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729282AbgI3KCk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Sep 2020 06:02:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729249AbgI3KCk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Sep 2020 06:02:40 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADA0FC0613D2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2020 03:02:39 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id m5so1403800lfp.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2020 03:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rflyFynNnBW4dG747SrCFXgcIAs909F2gibnTOq3B0k=;
        b=FAU+qdBufYnh3Ra3jN7RazQHlSY89ItLv7lIhfw5GiTIcy+HKRIB2+DmUc8v55oGRs
         kpLXU6wujIvPYbjL2O3+9m7Nc/uOMPQfwZi7EJ2uVhYE7Y4vLdCg06VJtbwQmuwgjnIK
         AXs9yLiGAV9SqvwnYHNiiJOExBUTz1YY50GC9LIckfkUwAsKfhoMhjHiej373NvgCJci
         9JscENDXgg6yq1kco/tYdzT4VvSDoWfxYV8ODHTCcLqTeeY5LECrpWs7O03qRGBfQYSl
         Yaoyl7rqKIW99cagCRI4QETLcxG4NGhaD8dZJomy0qS/9cK98jA03Fy1cIR3sVe0sHSc
         K1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rflyFynNnBW4dG747SrCFXgcIAs909F2gibnTOq3B0k=;
        b=boxifi1UwSqP/+4hCmhWSZYKo86Ty5RT6TuJOGX4GXYf0NKx6oVHKc6vdU9QyTSr/z
         Zqr/sNVTdArAMZLE5gIXrLhw1qEgEKekP9rluEAAtV1dylFG/JOWP2zgxaCcAjuxRL9Z
         8MQtdKGEh0cs9EBWJx71cy4TLI+KNNELhWgUoZI+OVWJXRAuEof5M7XV3UJ+WDsudCK4
         l1DGlZaPl1ptTmfLjhoLA9nOXb4KkBnF0TX5jmEHsKtGA5ifEGIKThLUVC0b98txU8vd
         F2BBeAjkp/9DIgVgqE28ApPOYekTwSRkqgT6Nf+vq2kt2AN84wq/nyMXvXvCRXp3DB9Z
         578A==
X-Gm-Message-State: AOAM531ARUp9NXYjW4+NsUQ5ESP1SnItv/B75LcBOvt/V2JlB1JAhryi
        biBsJQBGBSEKBJo05iKN9+Ey1g==
X-Google-Smtp-Source: ABdhPJyOXt3zJ+1hlf/+0jrC5HH03nWPVz4uGcrneKv3zvbu8woK9ILpA6Af80m34tl5tKC0dOM/+Q==
X-Received: by 2002:a19:4f03:: with SMTP id d3mr535356lfb.369.1601460158144;
        Wed, 30 Sep 2020 03:02:38 -0700 (PDT)
Received: from eriador.lan ([188.162.64.138])
        by smtp.gmail.com with ESMTPSA id w4sm132479lff.231.2020.09.30.03.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 03:02:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jishnu Prakash <jprakash@qti.qualcomm.com>
Subject: [PATCH v6 08/10] arm64: dts: qcom: pm8150x: add definitions for adc-tm5 part
Date:   Wed, 30 Sep 2020 13:02:01 +0300
Message-Id: <20200930100203.1988374-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200930100203.1988374-1-dmitry.baryshkov@linaro.org>
References: <20200930100203.1988374-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Define adc-tm5 thermal monitoring part. Individual channes and thermal
zones are to be configured in per-device dts files.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8150.dtsi  | 10 ++++++++++
 arch/arm64/boot/dts/qcom/pm8150b.dtsi | 10 ++++++++++
 arch/arm64/boot/dts/qcom/pm8150l.dtsi | 10 ++++++++++
 3 files changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8150.dtsi b/arch/arm64/boot/dts/qcom/pm8150.dtsi
index 1b6406927509..b1b518c6a2c9 100644
--- a/arch/arm64/boot/dts/qcom/pm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150.dtsi
@@ -97,6 +97,16 @@ die-temp@6 {
 			};
 		};
 
+		pm8150_adc_tm: adc-tm@3500 {
+			compatible = "qcom,spmi-adc-tm5";
+			reg = <0x3500>;
+			interrupts = <0x0 0x35 0x0 IRQ_TYPE_EDGE_RISING>;
+			#thermal-sensor-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		rtc@6000 {
 			compatible = "qcom,pm8941-rtc";
 			reg = <0x6000>;
diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
index e112e8876db6..8e2f3250c914 100644
--- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
@@ -95,6 +95,16 @@ chg-temp@9 {
 			};
 		};
 
+		pm8150b_adc_tm: adc-tm@3500 {
+			compatible = "qcom,spmi-adc-tm5";
+			reg = <0x3500>;
+			interrupts = <0x2 0x35 0x0 IRQ_TYPE_EDGE_RISING>;
+			#thermal-sensor-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		pm8150b_gpios: gpio@c000 {
 			compatible = "qcom,pm8150b-gpio";
 			reg = <0xc000>;
diff --git a/arch/arm64/boot/dts/qcom/pm8150l.dtsi b/arch/arm64/boot/dts/qcom/pm8150l.dtsi
index 62139538b7d9..9f214ceec2b7 100644
--- a/arch/arm64/boot/dts/qcom/pm8150l.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150l.dtsi
@@ -89,6 +89,16 @@ die-temp@6 {
 			};
 		};
 
+		pm8150l_adc_tm: adc-tm@3500 {
+			compatible = "qcom,spmi-adc-tm5";
+			reg = <0x3500>;
+			interrupts = <0x4 0x35 0x0 IRQ_TYPE_EDGE_RISING>;
+			#thermal-sensor-cells = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		pm8150l_gpios: gpio@c000 {
 			compatible = "qcom,pm8150l-gpio";
 			reg = <0xc000>;
-- 
2.28.0

