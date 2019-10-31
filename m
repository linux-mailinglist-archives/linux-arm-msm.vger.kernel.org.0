Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE289EB734
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 19:38:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729440AbfJaSiM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 14:38:12 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36450 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729317AbfJaSiM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 14:38:12 -0400
Received: by mail-pg1-f195.google.com with SMTP id j22so4610765pgh.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2019 11:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=N1sFZqwPmR4rpLnTH9EOl8Ec1vu8lx2vJgOvXRwWkdo=;
        b=byzZsRbo1K5r5tZ9HCdoeKVaM2vVjUyHpMT8oMNzYnFVyuGnd51bXKwnJz/wYP4tLL
         md/RZdp6ZrW6+UC+s3BaSFceWg3YjZw4JKw9O5j9QqfGmucTLWkTvDlDQ3KkQhFfm8bv
         Mmqm9lB4VFO4p3mNYVJUBPX/drJlSHi9+TYQRSNVIkwnIzTr2Zmv5KieSjkseQFvzvSX
         yIDb7zFiftuB/fKiSZZZJtLcOJhKp995o20a0vYkyjrNPxH96ysTxPOdqrBw5hHs4oxK
         VIwGgkuXQTSJNBYt3RJf46PQ9KHuPuyJEd9vw/lWFTck3sdLVst85/eV2F6DOCsPGJdY
         TFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=N1sFZqwPmR4rpLnTH9EOl8Ec1vu8lx2vJgOvXRwWkdo=;
        b=ntzn78hxoibo9OL3TzPFTfVrwguzuFPJgpM1JPysdsb0RNTFhAYAQpQhm3m9GIOXCP
         bSVSGDqU5cqg/Q/Ea7umQMvLXzOKX1IF2Au2yLJsnDpZP6PWkNmhirfeyBjNHFQorvxq
         Bqc4ad3cLflWVs2TEqgP34SzSf0yp00tSPTK2N8x4K1Qfn3gBTEgM3AICdryN3cwfxus
         AAvKVGYtmteXae832AWhHVAnnFzoY6MuiyJuBwIarDkoY+iSHv032LCMA/grefXX5ZX0
         W0+NvMMSvIvGe1ghFlOcCFycRqyGjp/12d4QdZDcFHDPH4CyBm4mO0xhL1Sx4Fp9TWZx
         23ng==
X-Gm-Message-State: APjAAAWyrjxDTbVO2BZ+gGLLTbi2ePilIm9eCGaNKFQ9qrz4+p1kUeY1
        qb7XzsGVgj1L6Zm7Fybc/iCZvQ==
X-Google-Smtp-Source: APXvYqz2z4mCOV4dafyiPlm4jEuXwGM0HcicDzIRwe+C+Ny2iK2C7j6WEqW/rQguEW7FhHp66Lji9Q==
X-Received: by 2002:a62:1ac6:: with SMTP id a189mr8291977pfa.96.1572547091322;
        Thu, 31 Oct 2019 11:38:11 -0700 (PDT)
Received: from localhost ([49.248.58.234])
        by smtp.gmail.com with ESMTPSA id h25sm3867466pfn.47.2019.10.31.11.38.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Oct 2019 11:38:10 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        masneyb@onstation.org, swboyd@chromium.org, julia.lawall@lip6.fr,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v7 05/15] arm: dts: msm8974: thermal: Add thermal zones for each sensor
Date:   Fri,  1 Nov 2019 00:07:29 +0530
Message-Id: <72cc755c16888976edea555f1df60a299daa8a1e.1572526427.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1572526427.git.amit.kucheria@linaro.org>
References: <cover.1572526427.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1572526427.git.amit.kucheria@linaro.org>
References: <cover.1572526427.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

msm8974 has 11 sensors connected to a single TSENS IP. Define a thermal
zone for each of those sensors to expose the temperature of each zone.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Tested-by: Brian Masney <masneyb@onstation.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 90 +++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 369e58f64145..33c534370fd5 100644
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
+			polling-delay-passive = <250>;
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
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
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

