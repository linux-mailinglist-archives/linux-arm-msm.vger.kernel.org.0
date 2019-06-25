Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3621A554E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2019 18:48:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732278AbfFYQsA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jun 2019 12:48:00 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40432 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732174AbfFYQsA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jun 2019 12:48:00 -0400
Received: by mail-wm1-f67.google.com with SMTP id v19so3658779wmj.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2019 09:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YWv+ENYtDt9ayygv5AeNhTcINipts+nB0V2FRLcgbPQ=;
        b=Dxdi6ZD33iGpwH42tE/qn+Iq4qpd9Q6uWsQShpkmqZS8uMNtMk4VAEgSDHLFGUcEzc
         ESZloIWaRMy4AJgVcjFwGdZr5oL6Am2doHYp6EgXjBsFk/LbQnE2C4BKTkD4Zm+L7ONr
         csb95VD80/aDbOBTm8p3fUFh6w81NVLCvmVOZNhhxQsy2NOWkzTk3rGeaCHXA632fA8c
         RHakhy/AjDBjOZog1iWpRlFe9YY6J2eJOuW31Rkow0QeTClcSAtUATkhipMh/KqVUzg+
         fw/hS8ts7UhwtDQ8OEeWIV5B1kXaTutTxgEBFcpE/chiQeD+kuwPB/cH90Ywhxr3sRlw
         BwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YWv+ENYtDt9ayygv5AeNhTcINipts+nB0V2FRLcgbPQ=;
        b=EmaberMlbnxdDHdrlWgCAptaSeTfTW7hZwI68JstQJRW77lumVHWyCMXvLtkkLe0XK
         DS6iHNi90AeyRmpbLq9wd7KeOjCQETo2scw+aY7BQ1P2e62ln3E+VD6hHuQz8xUnZDXP
         Rc3DNyuPI3aKHu9k3XNyjPNWcNqQ4MUhvpUNbszL6+SnMC+Ioyru+HkpFzYAeTYWPzis
         IxSg1wzGtTDJpyi5o9fftDfL0UlTeEeLreOQswAY1EOWrNii3jEhL861l0Eu0nAbYDZs
         7A/SZ9T9K/iPLRAQ05PRqiBf3ISDuwJEDJVjFVjKtbPvYKLSgC7ezlDe9PjgofmIV7Vx
         D1DA==
X-Gm-Message-State: APjAAAVqIPWj2Hg+qWez2EOC8oFLZmeCxEb00BJxd0P+GRduBsw69mif
        eRsr3AUv+GHdHBLpKeBIu08j0w==
X-Google-Smtp-Source: APXvYqyctq0fJwYMqXovLwVH+Rv/g41oIdZlbNT5SBNXiqMQk4fgjk1F1lSz3e94rDFGPxFy/vVOuQ==
X-Received: by 2002:a1c:f102:: with SMTP id p2mr19064644wmh.60.1561481278013;
        Tue, 25 Jun 2019 09:47:58 -0700 (PDT)
Received: from localhost.localdomain (30.red-83-34-200.dynamicip.rima-tde.net. [83.34.200.30])
        by smtp.gmail.com with ESMTPSA id d18sm42594476wrb.90.2019.06.25.09.47.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 25 Jun 2019 09:47:57 -0700 (PDT)
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
Subject: [PATCH v3 12/14] arm64: dts: qcom: qcs404: Add the clocks for APCS mux/divider
Date:   Tue, 25 Jun 2019 18:47:31 +0200
Message-Id: <20190625164733.11091-13-jorge.ramirez-ortiz@linaro.org>
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

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 94471aa31979..9569686dbc41 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -850,6 +850,9 @@
 			compatible = "qcom,qcs404-apcs-apps-global", "syscon";
 			reg = <0x0b011000 0x1000>;
 			#mbox-cells = <1>;
+			clocks = <&gcc GCC_GPLL0_AO_OUT_MAIN>, <&apcs_hfpll>;
+			clock-names = "aux", "pll";
+			#clock-cells = <0>;
 		};
 
 		apcs_hfpll: clock-controller@b016000 {
-- 
2.21.0

