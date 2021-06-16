Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D95D3A9D35
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 16:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233982AbhFPOOZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Jun 2021 10:14:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234036AbhFPOOT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Jun 2021 10:14:19 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74349C0611BD
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 07:11:35 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id t4-20020a1c77040000b029019d22d84ebdso4211818wmi.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 07:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4OGHMR1jQwoAH96uaUuvrSUUPBxq6apuQySMYgFNC+8=;
        b=kGxNcqKYzteoQLEjouWsoqpog/GQkUccBVFhhkiTeIe5/t0daMxG4P9ctOdRj3FKDf
         f35XXENwD5eF2YD7AjGscAhOjdXmhVmsIqwBaV8nUrkfLfNjRdJ1TceSncUp/dqzSVFO
         y7CGsb6y983KbkQhubGPOJLMVWByM18yY1WnFoX+MEdZVuCArKj29cePpb0qCzxHtWOr
         6cWoIpWRhKVV7hlukN9Mxe0H8o8iJbqX2BI/nJdtRnoZq82eojNPNWbaywvvs6dsIoQI
         wllAK/dVD+rQdfsSuqN644UdRirYg6dBPvpqYnoLEfixwVDQJ1vHltM2J+nWu7blpEK3
         ytbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4OGHMR1jQwoAH96uaUuvrSUUPBxq6apuQySMYgFNC+8=;
        b=HUzfNcbajcVnwXNa3AyuRsW/d6u2++LtuINke102vzF3n6LXLeKefY8xlXzJkJ3hKd
         WyeOwY1JyRN2eGh16mZRGglx8Cr7jpWSeJHzkWPte6U8zV5cgnsWiBFSWSInj/4Nmd7i
         Om+JJnQMePsIoxeQEvrYr38MV37diqJdWKDuJAPP3Dk4XXCDN6pRThH2I8kLwUx1k/6l
         qVS5NPnE98rkOSc38rdI/Jy41ujqlkHTID7fh8MxC633puybQyCTgzQHq8yLN7IJrsWP
         C/4TUkAGIu5DnYUEMvwXXc9rvA4mkwcyY8KbWN8tuYI/wHmqLYNOvhXfPhUO6K0lpHw0
         sAbA==
X-Gm-Message-State: AOAM531KSeTK2xZJHE+S/t+65RoZ6GdOegngaeYvjB0DpMvIqGXY1ITA
        TRe7Z6Tr7K/SCEamyYbDhCPiag==
X-Google-Smtp-Source: ABdhPJzwqIxK1guQTFvJIrbdSCMaJU7rjFZiwV51dUJROYEEm75zQ/JOgZVb4ePh2R7keeQGOxoJ0g==
X-Received: by 2002:a1c:f60f:: with SMTP id w15mr11591494wmc.5.1623852694046;
        Wed, 16 Jun 2021 07:11:34 -0700 (PDT)
Received: from xps7590.fritz.box ([2a02:2454:3e5:b700:9df7:76e5:7e94:bf1e])
        by smtp.gmail.com with ESMTPSA id g83sm1968375wma.10.2021.06.16.07.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 07:11:33 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jonathan@marek.ca, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vinod.koul@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [RFC v1 10/11] arm64: dts: qcom: sm8350: Add videocc DT node
Date:   Wed, 16 Jun 2021 16:11:06 +0200
Message-Id: <20210616141107.291430-11-robert.foss@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210616141107.291430-1-robert.foss@linaro.org>
References: <20210616141107.291430-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commit adds the videocc DTS node for sm8350.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 5dd32d4b1936..b270fb94da8c 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/thermal/thermal.h>
+#include <dt-bindings/clock/qcom,videocc-sm8350.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -1285,6 +1286,18 @@ usb_2_dwc3: dwc3@a800000 {
 			};
 		};
 
+		videocc: qcom,videocc@abf0000 {
+			compatible = "qcom,sm8350-videocc";
+			reg = <0 0x0abf0000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>;
+			mmcx-supply = <&mmcx_reg>;
+			clock-names = "bi_tcxo", "bi_tcxo_ao";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		adsp: remoteproc@17300000 {
 			compatible = "qcom,sm8350-adsp-pas";
 			reg = <0 0x17300000 0 0x100>;
-- 
2.30.2

