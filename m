Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB4EAF6B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2019 09:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727135AbfIKHRJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Sep 2019 03:17:09 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40085 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727075AbfIKHRA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Sep 2019 03:17:00 -0400
Received: by mail-pf1-f194.google.com with SMTP id x127so13082322pfb.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2019 00:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=GSstL9++8v2jfjaKtHregZZ+QyubdM5bUACzzsQ3BDU=;
        b=dznj/+/40631Px0rjuDfWd+FuadRLuIPffDB1RmRlk/sVj3JSox3UllSeah4dGtzEv
         MrKGjQFd9uWG2PKoYzrDKQai7Ph1MdD/HhywKAPhxGgDHJrbkH9eeLehemSnaaXaloXe
         7RmBWJEEnZm8nHbEou0x+xn59zG6RN5yasO6eY0BhoZnYFOj2NussqJD91NXhpq3BTpN
         zBu9WzR09y8TeYQPX0DyaaFfWiayAMw9E9TUgXOSmktBHIh6WeJXPV+s8BEmd5jm8TsC
         vfUtDGN1eHJHfpY83Gwkg8sJpYUt3Jcwp7NqCY2LiNPrecB8OmZceznN5HHA9VmbK6zl
         KQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=GSstL9++8v2jfjaKtHregZZ+QyubdM5bUACzzsQ3BDU=;
        b=RAK6fgj/6m/ztyt8t/p1oTs8XbHWNo6PzhLSQHqjkyM0Lb5U1BhgZHL6udt6A+YrUf
         uwQAbki7Zh/AX/A9w19xEreC8Mw0e8ePJFHNpOlgH7HGza97pIOkePKRvklWAlQznJRG
         o0i1V6QE7kb2yt6Z7FW5aFXoGNTHiiq9lj6B0duAkX59eulGM+d3agC8QVyYHl668UUV
         XcpDBw2Hzxewsc2VKEuLwHBAGiEDIb5nBc529EWvT3DrKuur1/EvYxzF2nDVtbAzUiO6
         cXeP2wR32KojhTqWR4AqS0NiS+u6Jut3C7lOfDMWvTiP8aOM8Nyg3iUi9s7gYzyBE6hy
         Tm7Q==
X-Gm-Message-State: APjAAAWnhIRvxckeD9sXSY9lckcl0lmOL+9gW3IvowSk/vV2TWx53Yg9
        qZxs5GiK2zCj5Wz+JRcZDX4nIAuJlnUMkA==
X-Google-Smtp-Source: APXvYqyBrTR47t5vEkoimOeaBMEP/h7oOpWROGybcY2jc9IuaVZguwKVWTqibPEhPlDRaaxsCCo6rA==
X-Received: by 2002:a65:644d:: with SMTP id s13mr562937pgv.47.1568186218838;
        Wed, 11 Sep 2019 00:16:58 -0700 (PDT)
Received: from localhost ([49.248.201.118])
        by smtp.gmail.com with ESMTPSA id h11sm17719876pgv.5.2019.09.11.00.16.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2019 00:16:58 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        masneyb@onstation.org, swboyd@chromium.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v3 05/15] arm: dts: msm8974: thermal: Add thermal zones for each sensor
Date:   Wed, 11 Sep 2019 12:46:22 +0530
Message-Id: <6c3835cd92325b3f4ebc3885d9009b58d0cdf6b0.1568185732.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1568185732.git.amit.kucheria@linaro.org>
References: <cover.1568185732.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1568185732.git.amit.kucheria@linaro.org>
References: <cover.1568185732.git.amit.kucheria@linaro.org>
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
index 369e58f64145..d32f639505f1 100644
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

