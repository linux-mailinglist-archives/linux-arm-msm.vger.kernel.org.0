Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE721554FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2019 18:48:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728041AbfFYQsX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jun 2019 12:48:23 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37230 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732037AbfFYQry (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jun 2019 12:47:54 -0400
Received: by mail-wr1-f68.google.com with SMTP id v14so18681374wrr.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2019 09:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oKGLSmgisRO2Nmb0wB40LqsaDficvDLdoxm6cO408zE=;
        b=jY2/AWowAS6G+jRVmNv+y8BiYzhIt/RwfEmwSQlOnP1M7xgKx2duEfwCXzEbp79MUm
         HORhBMcl+LdI616MEYj/rjmZO6lywFy6CNbUIc4cs6zy9OwoFI24Jx//abCXlxz98rCU
         i5q1biTMevsMS3u1LnlQXfL5f7XGHeHTI2QAVU4B1HdB1zmVplLZtKe8327ZhiW71peI
         z7Nf7lVk1fdGvJA3Fx1Nu2BYIv/faT9mwmCA+Oo8BLyQ4ByCn8GCfSSGUa21td5D33Rc
         6K5yR8rL3LQZsN7nHJFeEqOHDKamNXhUesE1mXZYR44nHlsZrdCo9C9N/htchBYsH34w
         QGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oKGLSmgisRO2Nmb0wB40LqsaDficvDLdoxm6cO408zE=;
        b=F/En+/bKtcVcKuNuSuAiTkroRd4mKpCL/oQIvoXy8e/OpsBBcV+uqeuDuGAIfmTQFD
         yoWC3vBlsPl8ssADzHyl0edLeR+ccnzSim09iO7IPiLhj8rWM5CsIsBFplxZzxrpXU9L
         1aMy5V6YQeVn+PLfCxtD5WpDa81TYcGfOxgLIFUKhwcx8ZaVbunxPCrfEHu4OX0yRZWF
         3i8hhWYFgxlp8eNBYN4txw7h31rpFBAN8ak2IzHI0nLdl3ipIclHEixw9zn31DpPhDWf
         NJlymeYqru/YcsBZonuMkv9XWdPigWT2n2oJB+IRNES3BhMswHPrEkY2m6juPxx++j1J
         1lzw==
X-Gm-Message-State: APjAAAVqo5cwNO0aT3jYnOigaO24dmWiPbsxGCxOWYqehqxvW/RpN3LS
        NQTKu7prGoAefHkC4CrXHOTdEQ==
X-Google-Smtp-Source: APXvYqw+ITnXXrhjAcfOWEotCFY+bkWsQz+aEVksguE1mMHz7rXtZpCo/wyL1bmjHCUy7fRC8W94Mw==
X-Received: by 2002:adf:f186:: with SMTP id h6mr24857872wro.274.1561481272938;
        Tue, 25 Jun 2019 09:47:52 -0700 (PDT)
Received: from localhost.localdomain (30.red-83-34-200.dynamicip.rima-tde.net. [83.34.200.30])
        by smtp.gmail.com with ESMTPSA id d18sm42594476wrb.90.2019.06.25.09.47.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 25 Jun 2019 09:47:52 -0700 (PDT)
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
Subject: [PATCH v3 09/14] arm64: dts: qcom: msm8916: Add the clocks for the APCS mux/divider
Date:   Tue, 25 Jun 2019 18:47:28 +0200
Message-Id: <20190625164733.11091-10-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
References: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Specify the clocks that feed the APCS mux/divider instead of using
default hardcoded values in the source code.

The driver still supports the previous bindings; however with this
update it we allow the msm8916 to access the parent clock names
required by the driver operation using the device tree node.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 5ea9fb8f2f87..96dc7a12aa94 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -429,7 +429,8 @@
 			compatible = "qcom,msm8916-apcs-kpss-global", "syscon";
 			reg = <0xb011000 0x1000>;
 			#mbox-cells = <1>;
-			clocks = <&a53pll>;
+			clocks = <&gcc GPLL0_VOTE>, <&a53pll>;
+			clock-names = "aux", "pll";
 			#clock-cells = <0>;
 		};
 
-- 
2.21.0

