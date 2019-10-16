Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FEFED89CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2019 09:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389803AbfJPHe5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Oct 2019 03:34:57 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39901 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388794AbfJPHe4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Oct 2019 03:34:56 -0400
Received: by mail-pg1-f195.google.com with SMTP id p12so4424241pgn.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2019 00:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=4K812X2lC+GYM/4odmaRwgr1rxs2vpAuXCpq25weRAs=;
        b=Xx6xD6kVfeR3/JFqZsiOJQRbB4MJyUPL5aomJ+HRatBXvwNIGYCZjEjWCS80qXfNha
         hNqIwJsDPgQdeKOb32Dg77GT22ekUALjj76wpjLT9ABAIEL+/gUSPy+GRMmPvjkpfTA3
         n5D9wn7VRoQxvbYu6jbl2nIIch1FgwueJwQuxGi29QBC0pam23Lhv0dJV8hG2bfZWCDp
         iBRqu6DCgCVSaCnonaxu/YYl542PtlaI3LO1O7TkjAmbsY6JEPgi9eECLZy6DjB4gW8U
         DDexwG4JUORqW+tF2aTQr7okJCJFMmVirrMncKV5ty2XEIOqeIe1K7c0yymYkDnLTHME
         XxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=4K812X2lC+GYM/4odmaRwgr1rxs2vpAuXCpq25weRAs=;
        b=etfTcpqMYzi5FiTBbVI77/PR9cMnJLvZBJu+GAaO2IMrxq+5fEuWYIQPSzG4QbxZsG
         C2m+F1lu68Q847ZdCtZmL9rQPZQkeLRH6Kp788HkwgdtWVRZPuRTlXiGQwqIYjIYbr5E
         ZF0gnfHrBXtGdoZtajw1ofdN/hBxzsmS8dWYoloOExyPREqhsbcH4tQDrN6rEFJOtGwz
         X1OKFHgitV1eDmPdb6Q2llDh4Z08nl9ZAQoTTEcMDp7wNhwoxEVdqz/Z7Wj+MHpecDyQ
         7067ouV1K9xSTW+btijOqrD+SpKtAiZ5AX27AQrx5E6t2yXr793m5Qe5FtX7TCjU+n38
         3pBQ==
X-Gm-Message-State: APjAAAVAV7I9yfNJVQqFUYCFruGPwK4PBeLu6fbiXwAJ0YIadYJYjJvf
        azhhn/VOc0NvtWPzjnb7ZQ8mzA==
X-Google-Smtp-Source: APXvYqwsNRx3WNxoT4VeviLzs1ILoUNER9h+t26mhtuQLy5POR2lX08st0WtdhT1VWFsmu6NgDru2A==
X-Received: by 2002:a63:b907:: with SMTP id z7mr5209236pge.142.1571211295665;
        Wed, 16 Oct 2019 00:34:55 -0700 (PDT)
Received: from localhost ([49.248.175.127])
        by smtp.gmail.com with ESMTPSA id h70sm22045544pgc.48.2019.10.16.00.34.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Oct 2019 00:34:55 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        masneyb@onstation.org, swboyd@chromium.org,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH 09/15] arm64: dts: msm8996: thermal: Add interrupt support
Date:   Wed, 16 Oct 2019 13:04:08 +0530
Message-Id: <b42e18096b81abaaabe1822e75f1882781467c71.1571210269.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1571210269.git.amit.kucheria@linaro.org>
References: <cover.1571210269.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1571210269.git.amit.kucheria@linaro.org>
References: <cover.1571210269.git.amit.kucheria@linaro.org>
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

