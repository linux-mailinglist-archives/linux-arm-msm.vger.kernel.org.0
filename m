Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 094BB554F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2019 18:48:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732210AbfFYQr5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jun 2019 12:47:57 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:33514 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732174AbfFYQr5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jun 2019 12:47:57 -0400
Received: by mail-wm1-f68.google.com with SMTP id h19so2711012wme.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2019 09:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nrzyeFr44bncESExYjY2Xqm7hHRQ10WfGAsR66xmSU0=;
        b=kI+F4y9Juq4UtO+H7tm4R23zk+eYgxqBO1Rw6hrz74Fj/gAdeyhxUnPYLp0fJtVsqB
         wtfT+RsceD8eJWFhIG5efmhcWhuetah0Y6H6maBKnlWO+ycI9X5mrNtHq/uDMJO9i1Dl
         6gFQ6d1oLnklYadUNmApNLHrjroFKbsDAqxdnTe9KJMN1AGtQSsnuDaDwKhXDkHdoqIj
         1g7DK0K9jTzM28miEa9h/UFoPBGO+S9fps/jHV/s5WLQ8OafqQwNsyuB/3cj0gRvp/4+
         8txBkwYdTZdGjvZz7Oe+vcBvE5uCp9NoravLkOp0jiEK0dM+aE6fQn2C5wTEL44tD4lX
         p+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nrzyeFr44bncESExYjY2Xqm7hHRQ10WfGAsR66xmSU0=;
        b=W938rUWL27liQncJ8XNCo0oyTzIHjLFggrx4/d880LVX/QkFp5FZciIuq/vrCvEWMX
         x2BCDYCBWmZLXI4J+WRIv40k+MxYQcgoXXUn/Us49YFH3As2c1zh5K/zevI7ZFXdzJus
         qPl6x4My/IY9d6UyRKC1hZafAWmkHfN8y5qrELq23s+eLGww+8GIKNViYlz6FW1No5hK
         yMp0RS7r+Jbeu9glYPSsMkm0YfyESpzwu+ibdGqSUSKqGOZuwdDF4/eI/ZpGt1cxqmR3
         F64bGGg68MbGg7WT8qviz+0D1QR4mRKQhEt1MJKTfRKh7TRk0jA8JJcRUriDsWQk0HSk
         EorA==
X-Gm-Message-State: APjAAAX6EcQfm5q6hpE42zuf3ywfigFblIDKDS3OTwJZWBUXhMbNDPyn
        GM8i23NeELdURjFX2N7AvhNKsQ==
X-Google-Smtp-Source: APXvYqywQ5Ml0QHQWPuK1teKrX2xUjmr8yueMadE/iBk+qI3mi0tbuXh03Y902YxT3PO+OdG5eixTg==
X-Received: by 2002:a1c:6156:: with SMTP id v83mr21566006wmb.81.1561481274595;
        Tue, 25 Jun 2019 09:47:54 -0700 (PDT)
Received: from localhost.localdomain (30.red-83-34-200.dynamicip.rima-tde.net. [83.34.200.30])
        by smtp.gmail.com with ESMTPSA id d18sm42594476wrb.90.2019.06.25.09.47.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 25 Jun 2019 09:47:54 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, david.brown@linaro.org,
        jassisinghbrar@gmail.com, mark.rutland@arm.com,
        mturquette@baylibre.com, robh+dt@kernel.org, will.deacon@arm.com,
        arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de,
        sibis@codeaurora.org, enric.balletbo@collabora.com,
        jagan@amarulasolutions.com, olof@lixom.net
Cc:     vkoul@kernel.org, niklas.cassel@linaro.org,
        georgi.djakov@linaro.org, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
Subject: [PATCH v3 10/14] arm64: dts: qcom: qcs404: Add OPP table
Date:   Tue, 25 Jun 2019 18:47:29 +0200
Message-Id: <20190625164733.11091-11-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
References: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a CPU OPP table to qcs404

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 3f17e1b09c13..d876dae5b0a5 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -83,6 +83,24 @@
 		};
 	};
 
+	cpu_opp_table: cpu-opp-table {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-1094400000 {
+			opp-hz = /bits/ 64 <1094400000>;
+			opp-microvolt = <1224000 1224000 1224000>;
+		};
+		opp-1248000000 {
+			opp-hz = /bits/ 64 <1248000000>;
+			opp-microvolt = <1288000 1288000 1288000>;
+		};
+		opp-1401600000 {
+			opp-hz = /bits/ 64 <1401600000>;
+			opp-microvolt = <1384000 1384000 1384000>;
+		};
+	};
+
 	firmware {
 		scm: scm {
 			compatible = "qcom,scm-qcs404", "qcom,scm";
-- 
2.21.0

