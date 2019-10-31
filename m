Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 114A0EB740
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 19:38:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729318AbfJaSi3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 14:38:29 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:46253 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729495AbfJaSi3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 14:38:29 -0400
Received: by mail-pf1-f194.google.com with SMTP id 193so3663955pfc.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2019 11:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=4K812X2lC+GYM/4odmaRwgr1rxs2vpAuXCpq25weRAs=;
        b=gFcDJKmdzDCTCrN5Bqc0J9Wxg5iBuZks5LfR8jEOR51AqOkrUdSqL2jW9DO736IDrR
         5kv5ZKmMWMllB9GeqdtlSY8XL+y7S4xPg20W3Ob9XI+/3mrZsHXk/JeF6kMCTbWkL7bC
         jIpqxxlmvlM9gw8JjoECQUwU9rDZT5gWNGBKS2MrHlaT6AKGppA9Txt90Rx3I/D1feJF
         Z15u1LXHS+CPcKr4O+Iac2L4TzMC+V4bzeR83kB/WCL4TzZuw5rr3NHm7C/lUAXFBSbV
         lguSwIuIta+j7mpJ5XPHK6g3yd+NE6JXsZCwEKzpliO3RRCcBLOxggFBIBhLHlS7Gjwn
         MlUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=4K812X2lC+GYM/4odmaRwgr1rxs2vpAuXCpq25weRAs=;
        b=gO6SJPHCz/nDcOaV+hHWK02MaIu0wOBrVSeoVY7rCu17PCIdz6XanAszz/Gp5wmhqJ
         TjxAH4SZd+Vjb74QQ7HhPQWsf0sdW5mRxrEdqVdJNG17KFfHh+JrR+Fpe66b5YrmWX6q
         weDicy4BDNjW6Eti3zP8h5y9YrMEQbx/b15X9DAkZtVUBRLFlEqvN2TAlWSvGXerNozq
         MSN4edBUun0FwUC5D8m+3BHdLz5JESNRQdHJQXRvrnBI75guPRRVNMIt6J185XghXpPo
         JgDXjREAZK7N6G5ZFOAU8Dub0qsUIDdXy5ePi+jOqO0TU/aARMzMhCXsVz0riRUEY4AT
         38kA==
X-Gm-Message-State: APjAAAWFXD2n7BMjPISz095XG0GCQrrf2Q/XaxyasgoXOlENeFqkJB+U
        7Z0TFwKaS89oMXxxC5BX8tt0ug==
X-Google-Smtp-Source: APXvYqyeoW/W8dXSH4nDnIjGLfrMwp0/h37wliaoWJuNcR+4I8coIChV24XnNSEdBVlrcXCcVY8SQA==
X-Received: by 2002:a17:90a:6346:: with SMTP id v6mr9395570pjs.4.1572547108492;
        Thu, 31 Oct 2019 11:38:28 -0700 (PDT)
Received: from localhost ([49.248.58.234])
        by smtp.gmail.com with ESMTPSA id b26sm4073620pfo.179.2019.10.31.11.38.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Oct 2019 11:38:27 -0700 (PDT)
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
Subject: [PATCH v7 09/15] arm64: dts: msm8996: thermal: Add interrupt support
Date:   Fri,  1 Nov 2019 00:07:33 +0530
Message-Id: <b42e18096b81abaaabe1822e75f1882781467c71.1572526427.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1572526427.git.amit.kucheria@linaro.org>
References: <cover.1572526427.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1572526427.git.amit.kucheria@linaro.org>
References: <cover.1572526427.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Register upper-lower interrupts for each of the two tsens controllers.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 87f4d9c1b0d4..4ca2e7b44559 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -591,6 +591,8 @@
 			reg = <0x4a9000 0x1000>, /* TM */
 			      <0x4a8000 0x1000>; /* SROT */
 			#qcom,sensors = <13>;
+			interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
 			#thermal-sensor-cells = <1>;
 		};
 
@@ -599,6 +601,8 @@
 			reg = <0x4ad000 0x1000>, /* TM */
 			      <0x4ac000 0x1000>; /* SROT */
 			#qcom,sensors = <8>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
 			#thermal-sensor-cells = <1>;
 		};
 
-- 
2.17.1

