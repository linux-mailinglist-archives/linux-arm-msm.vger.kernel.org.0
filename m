Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54571DE9AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 12:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728263AbfJUKgC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 06:36:02 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39329 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728265AbfJUKgA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 06:36:00 -0400
Received: by mail-pf1-f195.google.com with SMTP id v4so8169156pff.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2019 03:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=cUh1ZeV5zyjcsg3Iod3jbARGXcyJz+PpaHp2DpcKIvo=;
        b=GB/iNLsVk+ApucmOndcOCjbvj0CgYAqzijKY5FGCBUbaN+U/kVWyXWHbkpG7BSggYp
         f6IbuQNNH5x5j+409JsPqM3ZQJarU5yMHogMhB0PyoyaikyLZmvxEEFHMiSBDwnffIZO
         WpvIzsaXwYEBhjSwBfaeE2vmVUoU73KJFSPVsLn90WenyvhMqiwWhbDif/QJuCDnGWc5
         QgXpc2EGiPmug9U5kBGw8Ffwt+Aim18NdbY+U0BbBw/UwfYMUdtjT2C1unkOxVNPrF1x
         db8UIVOYhkcOd4txq4pUd3AbSig2rXuqT4iyIRnPiEhWEDPRWyMaVBApa3utcJEO4DMQ
         BXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=cUh1ZeV5zyjcsg3Iod3jbARGXcyJz+PpaHp2DpcKIvo=;
        b=dYVMEhHyxEan1I41cl2ma0fOI77yvPABQ4wDBnWrgiBWIBldT6Lnmrk3X4vyDBlgZ4
         qGjZ3XVo7X8ZC/bpzLztdpkd2UKRFqgD5bcI7Vfh156ziMuhQppwZI4mLjxm+/hSEr9w
         WeNK7dAlHy422xUQ35mjyX2GUJj8tT9d4F1ZDDj7aabNSzh/Q1DUL1uHEKTNRPX70gHH
         4ojRA8lDN2vFn/hPmZ9uZrMbJ1A3hz/5Zadp4PErvlrwbIXPnGLgbGHF2nTt9mmmoQZY
         Eeib4HTz+Kdq/lQJKgaUhRUYNZbiQtH9SoW5tDrPvkAxi7hGU5afwwbWDaHswfHPu35u
         7Jcg==
X-Gm-Message-State: APjAAAVtiifwxM9/wERgaW/1HHj1ROmPLMiK/ffyDuHNusHr8gL8RGow
        Heh4E1TnhpB3kA3QZX0DvmBJ2g==
X-Google-Smtp-Source: APXvYqzu4KtmcnKs1aGYq5s9UfB37tPDNG7pn1yvfavKMydIQjaFEEQUfn6CZX3PmLG1fG1PQEM1CQ==
X-Received: by 2002:a63:934d:: with SMTP id w13mr6975734pgm.185.1571654160053;
        Mon, 21 Oct 2019 03:36:00 -0700 (PDT)
Received: from localhost ([49.248.62.222])
        by smtp.gmail.com with ESMTPSA id e14sm15420515pgk.70.2019.10.21.03.35.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 03:35:59 -0700 (PDT)
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
Subject: [PATCH v6 05/15] arm: dts: msm8974: thermal: Add thermal zones for each sensor
Date:   Mon, 21 Oct 2019 16:05:24 +0530
Message-Id: <72cc755c16888976edea555f1df60a299daa8a1e.1571652874.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1571652874.git.amit.kucheria@linaro.org>
References: <cover.1571652874.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1571652874.git.amit.kucheria@linaro.org>
References: <cover.1571652874.git.amit.kucheria@linaro.org>
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
index 369e58f64145d..33c534370fd5c 100644
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

