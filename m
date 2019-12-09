Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 464B2116864
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2019 09:39:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727420AbfLIIjn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Dec 2019 03:39:43 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46077 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727312AbfLIIjT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Dec 2019 03:39:19 -0500
Received: by mail-lj1-f196.google.com with SMTP id d20so14549270ljc.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2019 00:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=v49ydhRHchofWzIVQxqpzPrTtsddtPryUTJT2t4dhHg=;
        b=v9gYohOsVaW5DeUzwcntIszGR11cpCwA1aGZQI/0YtSyva2+iY9Ho4nwPh1XkuEEcs
         ePzEjiMXfOWUfjkuL6au580P6z9q6aTIQ4BAFKeXFDBtnUhU+aVTh0lEAgY4C7HCpSV9
         ORwIprAIN+8zsxiBuym7PqglNRmEVQycLevLaHhL1ebSrdLLpkdVn/rdkrrGJkyYQf8v
         c/52xy2F25iRJr8xYXD9Nv2jRKO5G/tG/EsYycAbXnJ/v4Fz6AxBSvRdmt06fg7z7xF1
         U0uhvGFU/i/H8jRdR5icC6XyPExufkNMMEEbkYwB0qS9424ytO17ogMD6Dgb8ahdoFI9
         ukiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=v49ydhRHchofWzIVQxqpzPrTtsddtPryUTJT2t4dhHg=;
        b=JeqaykFyuk55N7eifsdjhHI/gmu0jnbqXTeRukt4cXQ5gHnqyL3tsnykgXwfa0SBos
         PKBV2sumlEvLOCgkNYfMdjJNc9ZycdMixLKcTIUEwb7F/fZdXftcgG17GLinBNtjUED8
         cM+1BkOIosz5U5ge/s73cxyIGaZEEWMCCbATPKpZoGz6ZopQSOD3zNRywq/2e9IzwYJV
         bp7gHCuZqFntRkfemDs91pyYj+mduFQj4H0tiO2JTzfLF2gG29XDLbv3HLTfZT0Ge1yH
         hARdyUaWVKrwm2QC9dI5hWE4GfZjPmmzSUgOXVsjlkaGknA3ePc1Q3v8GVLrqSQHd7Os
         B1zg==
X-Gm-Message-State: APjAAAV7bZrx8RlncJDDG42tNP1WoUnpReAxrM6DEuwNfJzz2f9be/b1
        c+hZbAJwgDowO8s0ePvzbfgFbg==
X-Google-Smtp-Source: APXvYqw8SpOAGnK9Y6ldb09TK9z4GTkamwKgzyRGZM1ZhvBxsbDATkag4guNVGmYYMSeCsQjPFddtA==
X-Received: by 2002:a2e:808a:: with SMTP id i10mr15268982ljg.151.1575880757072;
        Mon, 09 Dec 2019 00:39:17 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id r26sm10438971lfm.82.2019.12.09.00.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 00:39:16 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 3/6] arm64: dts: sdm845: move venus clocks and pmdomains in parent
Date:   Mon,  9 Dec 2019 10:38:21 +0200
Message-Id: <20191209083824.806-4-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191209083824.806-1-stanimir.varbanov@linaro.org>
References: <20191209083824.806-1-stanimir.varbanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move venus DT subnode resources like clocks and pmdomains in the
parent Venus DT node. This will make possible to support dynamic
core selection on Venus v4.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index f406a4340b05..540028fed3ae 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2571,29 +2571,30 @@
 			compatible = "qcom,sdm845-venus";
 			reg = <0 0x0aa00000 0 0xff000>;
 			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
-			power-domains = <&videocc VENUS_GDSC>;
+			power-domains = <&videocc VENUS_GDSC>,
+					<&videocc VCODEC0_GDSC>,
+					<&videocc VCODEC1_GDSC>;
+			power-domain-names = "venus", "vcodec0", "vcodec1";
 			clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
 				 <&videocc VIDEO_CC_VENUS_AHB_CLK>,
-				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>;
-			clock-names = "core", "iface", "bus";
+				 <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
+				 <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
+				 <&videocc VIDEO_CC_VCODEC0_AXI_CLK>,
+				 <&videocc VIDEO_CC_VCODEC1_CORE_CLK>,
+				 <&videocc VIDEO_CC_VCODEC1_AXI_CLK>;
+			clock-names = "core", "iface", "bus",
+				      "vcodec0_core", "vcodec0_bus",
+				      "vcodec1_core", "vcodec1_bus";
 			iommus = <&apps_smmu 0x10a0 0x8>,
 				 <&apps_smmu 0x10b0 0x0>;
 			memory-region = <&venus_mem>;
 
 			video-core0 {
 				compatible = "venus-decoder";
-				clocks = <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
-					 <&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
-				clock-names = "core", "bus";
-				power-domains = <&videocc VCODEC0_GDSC>;
 			};
 
 			video-core1 {
 				compatible = "venus-encoder";
-				clocks = <&videocc VIDEO_CC_VCODEC1_CORE_CLK>,
-					 <&videocc VIDEO_CC_VCODEC1_AXI_CLK>;
-				clock-names = "core", "bus";
-				power-domains = <&videocc VCODEC1_GDSC>;
 			};
 		};
 
-- 
2.17.1

