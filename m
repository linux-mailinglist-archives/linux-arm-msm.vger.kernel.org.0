Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB36E9E780
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2019 14:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729765AbfH0MOp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Aug 2019 08:14:45 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36720 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729717AbfH0MOp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Aug 2019 08:14:45 -0400
Received: by mail-pf1-f196.google.com with SMTP id w2so14018007pfi.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Aug 2019 05:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=pptHIxhK3eUIONZUZXLRgUgraNH7ZHKiRKOOZXId9Og=;
        b=Yt68EfZ2pCFv6y3gNY6s3zwZ4WSXntxsFOa47DjhNzOsV1J5zO/oWMXCCM4ziZopTz
         bc59P5UcoHPyCzi8fpT3YV0x8Y8a9xopYAIppMf0Ei5huVhnE/riO5bgNckL3Lc/tu2E
         ibzWAufe7k3bLbA3nFAaz6IiNjcoh1dSxIr1vja5R5iKFcCSEVke98SjyUfm4yQmHgsL
         fW34Jl0um+NvWqv2+ew8nSypw3pPLE70fQXXZEuaKLWxhzYUoaei9XyypBgJ89dre9CI
         qO3nXzc/NqrNtjkAHCVo2hp3/8mQokN+UyXXdqAJCEf8u8epkU2/7YYUTaOcAtwCW2sF
         NIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=pptHIxhK3eUIONZUZXLRgUgraNH7ZHKiRKOOZXId9Og=;
        b=XpxrLhByj99X6QwKexYsmcP9URNH+tVz0gFzTaHbEAxUEWm+sCQBL/5EtjamVnegS/
         BPxPr8xfRzLM5o8pYsAddc3Uo84VTbzQAK7x72W2BWCXcU4c0A69tkHDKmzL5t8svFHH
         FQy2oxwbpB9OCzb21TDIngPOMVCcHFwu1Qv02fGGCXM9KDACy31ACU1qqGq8fkk1kmdN
         ykFM6EsVpiHqlt5Hz5NtsF8+ciiwxGa5/OY8t5vWybp/52Jry6GLUq44LJBB9uz93LAM
         +o+ULipp9zvWHvNoF0wassL/30UVUgVmtV8RzXgUXJaC7EVEuXbly/uRWoePq8/ql/aG
         firA==
X-Gm-Message-State: APjAAAWBlixN25Kwn/7MTwpuS5ZWQ6zKNJIIycT/xA6O48+o1Fc5/iRf
        zY4rDrUWXO4TyAVspuTiOErPWg==
X-Google-Smtp-Source: APXvYqwqFs89Mvx84AcWAVFxVj9NOaNbeWi9cVrFQYua1OYgL8Er/3O3Nn0U/M+BXMH8RumzRgrbgA==
X-Received: by 2002:a17:90a:2ec3:: with SMTP id h3mr5833943pjs.121.1566908084300;
        Tue, 27 Aug 2019 05:14:44 -0700 (PDT)
Received: from localhost ([49.248.54.193])
        by smtp.gmail.com with ESMTPSA id g10sm25108702pfb.95.2019.08.27.05.14.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 05:14:43 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        sboyd@kernel.org, masneyb@onstation.org, marc.w.gonzalez@free.fr,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v2 05/15] arm: dts: msm8974: thermal: Add thermal zones for each sensor
Date:   Tue, 27 Aug 2019 17:44:01 +0530
Message-Id: <5b26d4410b50387fcacae939d97f9f75853e69ea.1566907161.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1566907161.git.amit.kucheria@linaro.org>
References: <cover.1566907161.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1566907161.git.amit.kucheria@linaro.org>
References: <cover.1566907161.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

msm8974 has 11 sensors connected to a single TSENS IP. Define a thermal
zone for each of those sensors to expose the temperature of each zone.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Tested-by: Brian Masney <masneyb@onstation.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 90 +++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 369e58f64145d..d32f639505f1b 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -217,6 +217,96 @@
 				};
 			};
 		};
+
+		q6-dsp-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 1>;
+
+			trips {
+				q6_dsp_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		modemtx-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 2>;
+
+			trips {
+				modemtx_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		video-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 3>;
+
+			trips {
+				video_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		wlan-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&tsens 4>;
+
+			trips {
+				wlan_alert0: trip-point0 {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		gpu-thermal-top {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 9>;
+
+			trips {
+				gpu1_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
+
+		gpu-thermal-bottom {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&tsens 10>;
+
+			trips {
+				gpu2_alert0: trip-point0 {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+			};
+		};
 	};
 
 	cpu-pmu {
-- 
2.17.1

