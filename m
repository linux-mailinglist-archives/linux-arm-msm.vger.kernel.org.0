Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3208692E85
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Feb 2023 06:29:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbjBKFYa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Feb 2023 00:24:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjBKFY3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Feb 2023 00:24:29 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C49DB37739
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 21:24:27 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id v23so8773747plo.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 21:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CzSfqwwM+Nah9broXqJeSo06TrNgs30sEAwsq9T6Ez4=;
        b=fiw5YEIXybyGAdTiFw90k2VmjeFujbCh36+QCF98rvho32fQxoawaeXsEbRkiKjOg8
         I8JynICiTA2Mz7Nj7khlBAr/ouE1dY+ZjgdZ5NjFtRT2xL1VDE6qeDchpfn8A5cSrEbl
         wCDtzbi2QKHKlrNwh/oVtRjuOO8hTFnOkYcXeBa9RjsIPIzOQFcKN4NKhul+j0Y8jDjM
         VvSqXJTPFtrvJHuMqnNuw5fdp2SE0irdiXzxcRQJTW3aO78Hv3m0AORgOx1ain4dMYkw
         e+Fn28jMTlS/PFUKWSGcb8/W3B5xb01Y57lYfePTZbRDjOMuAeaScd1KtZbbLjNQM0j4
         emAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CzSfqwwM+Nah9broXqJeSo06TrNgs30sEAwsq9T6Ez4=;
        b=t3eF4Xs2kUNc22yHdhwNFYsJK3EtZEqhNl/TT2jqiH0ZfkhjS2lQ9ldHbrxA4M6HEZ
         TpU3gfm1didKTxAau4Ezi1J4al1PhpXTDz9z5l42Bpztb0YFqjMsmNDC+YvW55TkeyLC
         dgk4Rj5UoAiqFzwvrDSfTc263j2MjeEGRah4ec2CvVDCNMFcTusZMc7iQtJLaW2+n4uH
         ZtoDU1BrVUkdTAB7KvJz5b7g/yAoPIiTn6NQHWdXCd9CjSfmiAcYMrnAkiCURtR9VsHj
         DKT5/asGp6Puz3oTF7ml95ErizAR+UtBO+Wh3+ou2ZlnXhngr+twqkf9Zmo+IyQk8rQW
         PL+w==
X-Gm-Message-State: AO0yUKUy4sgYkTl0cVOplTGQI+uMl8fPVHFxvx2cFG45hQ/37+LHBEyL
        uwNrYajbzlu0rx0XzNd59/PQ
X-Google-Smtp-Source: AK7set/gEcwdL3cXPq2teIyFsk/4k/6LLloXIAUyMcedxWEtRNE31rb93LCq1klF+/gwneOPLuWvXw==
X-Received: by 2002:a17:902:e88e:b0:196:7c6d:2aee with SMTP id w14-20020a170902e88e00b001967c6d2aeemr21407701plg.11.1676093067146;
        Fri, 10 Feb 2023 21:24:27 -0800 (PST)
Received: from localhost.localdomain ([117.248.0.82])
        by smtp.gmail.com with ESMTPSA id r3-20020a170902be0300b001962858f990sm4169261pls.164.2023.02.10.21.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 21:24:26 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Steev Klimaszewski <steev@kali.org>
Subject: [PATCH] arm64: dts: qcom: sc8280xp: Add label property to vadc channel nodes
Date:   Sat, 11 Feb 2023 10:54:15 +0530
Message-Id: <20230211052415.14581-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
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

For uniquely identifying the vadc channels, label property has to be used.
The initial commit adding vadc support assumed that the driver will use the
unit address along with the node name to identify the channels. But this
assumption is now broken by,
commit 701c875aded8 ("iio: adc: qcom-spmi-adc5: Fix the channel name") that
stripped unit address from channel names. This results in probe failure of
the vadc driver:

[    8.380370] iio iio:device0: tried to double register : in_temp_pmic-die-temp_input
[    8.380383] qcom-spmi-adc5 c440000.spmi:pmic@0:adc@3100: Failed to register sysfs interfaces
[    8.380386] qcom-spmi-adc5: probe of c440000.spmi:pmic@0:adc@3100 failed with error -16

Hence, let's get rid of the assumption about drivers and rely on label
property to uniquely identify the channels.

The labels are derived from the schematics for each PMIC. For internal adc
channels such as die and xo, the PMIC names are used as a prefix.

Fixes: 7c0151347401 ("arm64: dts: qcom: sc8280xp-x13s: Add PM8280_{1/2} ADC_TM5 channels")
Fixes: 9d41cd17394a ("arm64: dts: qcom: sc8280xp-x13s: Add PMR735A VADC channel")
Fixes: 3375151a7185 ("arm64: dts: qcom: sc8280xp-x13s: Add PM8280_{1/2} VADC channels")
Fixes: 9a6b3042c533 ("arm64: dts: qcom: sc8280xp-x13s: Add PMK8280 VADC channels")
Reported-by: Steev Klimaszewski <steev@kali.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 654b6b310bc9..0fc0cffbeed8 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -636,75 +636,88 @@ &pmk8280_vadc {
 	pmic-die-temp@3 {
 		reg = <PMK8350_ADC7_DIE_TEMP>;
 		qcom,pre-scaling = <1 1>;
+		label = "pmk8350_die_temp";
 	};
 
 	xo-therm@44 {
 		reg = <PMK8350_ADC7_AMUX_THM1_100K_PU>;
 		qcom,hw-settle-time = <200>;
 		qcom,ratiometric;
+		label = "pmk8350_xo_therm";
 	};
 
 	pmic-die-temp@103 {
 		reg = <PM8350_ADC7_DIE_TEMP(1)>;
 		qcom,pre-scaling = <1 1>;
+		label = "pmc8280_1_die_temp";
 	};
 
 	sys-therm@144 {
 		reg = <PM8350_ADC7_AMUX_THM1_100K_PU(1)>;
 		qcom,hw-settle-time = <200>;
 		qcom,ratiometric;
+		label = "sys_therm1";
 	};
 
 	sys-therm@145 {
 		reg = <PM8350_ADC7_AMUX_THM2_100K_PU(1)>;
 		qcom,hw-settle-time = <200>;
 		qcom,ratiometric;
+		label = "sys_therm2";
 	};
 
 	sys-therm@146 {
 		reg = <PM8350_ADC7_AMUX_THM3_100K_PU(1)>;
 		qcom,hw-settle-time = <200>;
 		qcom,ratiometric;
+		label = "sys_therm3";
 	};
 
 	sys-therm@147 {
 		reg = <PM8350_ADC7_AMUX_THM4_100K_PU(1)>;
 		qcom,hw-settle-time = <200>;
 		qcom,ratiometric;
+		label = "sys_therm4";
 	};
 
 	pmic-die-temp@303 {
 		reg = <PM8350_ADC7_DIE_TEMP(3)>;
 		qcom,pre-scaling = <1 1>;
+		label = "pmc8280_2_die_temp";
 	};
 
 	sys-therm@344 {
 		reg = <PM8350_ADC7_AMUX_THM1_100K_PU(3)>;
 		qcom,hw-settle-time = <200>;
 		qcom,ratiometric;
+		label = "sys_therm5";
 	};
 
 	sys-therm@345 {
 		reg = <PM8350_ADC7_AMUX_THM2_100K_PU(3)>;
 		qcom,hw-settle-time = <200>;
 		qcom,ratiometric;
+		label = "sys_therm6";
 	};
 
 	sys-therm@346 {
 		reg = <PM8350_ADC7_AMUX_THM3_100K_PU(3)>;
 		qcom,hw-settle-time = <200>;
 		qcom,ratiometric;
+		label = "sys_therm7";
 	};
 
 	sys-therm@347 {
 		reg = <PM8350_ADC7_AMUX_THM4_100K_PU(3)>;
 		qcom,hw-settle-time = <200>;
 		qcom,ratiometric;
+		label = "sys_therm8";
 	};
 
 	pmic-die-temp@403 {
 		reg = <PMR735A_ADC7_DIE_TEMP>;
 		qcom,pre-scaling = <1 1>;
+		label = "pmr735a_die_temp";
 	};
 };
 
-- 
2.25.1

