Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 095849D464
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2019 18:48:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733214AbfHZQsP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Aug 2019 12:48:15 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43130 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733191AbfHZQsP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Aug 2019 12:48:15 -0400
Received: by mail-wr1-f66.google.com with SMTP id y8so15974544wrn.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2019 09:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hupd+NjOPBz3nsSvh0rk5zeJMQwvXm41o+AWQWydlzs=;
        b=sZMXmbW/POftkL+zpxhLc3nCQusl/cB7uTur1BFVbUfZyvQsqUqPfym57arfEXR2Cn
         DG0liyQvnOMuCA0CmTTj3hJl0rKOlizTGr6OgTmD89IPRb7rhLUrJT04ug8k1A2TseiM
         pHGC4jtNOb6j8tq5bT6g4/ckm2RTcvcHP4OhYEK6OY69iWOU061WMyEAit1+cCXVe6KW
         xixlCql9ZclJjWOS/v1TjzqRFwvvxZ5szDII1BA8mcMG+M4HvyDYWGnJbJXTiTW/QUiy
         4+ouMYHEPFBUD5ZDH8AaKZofmFjeMFQJA32aJPGde2N0z6JSW9OTHOsRNhBNtwnMab6e
         +6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hupd+NjOPBz3nsSvh0rk5zeJMQwvXm41o+AWQWydlzs=;
        b=bFkaBMN1UjhhcE7vlzuhorEjK+FpzEVhq9+M/hsqn+3y0J9dP/+4QIsT9KSpfNv+1h
         EV81JSCMPm+n2d1RoRYceR3skopI7G2JCwjol73Gp5To08PY4BUl5ezbkrMBX6hxQOch
         ey4Jbyl9+rNFnYKfW8VTBQ/qYOF6qep/VTdQmX0S4CTImcH1M6RM/4Scvl5+AQ6ISJDq
         oC+k1OfYAx3etGdE5nmtkjEDQNzjLOBlXlc4jfxyh2Y0y1ZDRAYKLB3fOA+Nw+rF0oj8
         w53vdVAoU7vZVoL5+ruY7uYaqzL/6JoSJ7X7xb5qRC8eLKa6Ish8g2OizZzM2/y3J6km
         d5yA==
X-Gm-Message-State: APjAAAUNmXvThyy2f2y3k7cQTowPkyhvC6vrWaWuhEZ+Vd2LiDk/SAGA
        jyQ35hQEi8x8RD9bMMqO3WhL+g==
X-Google-Smtp-Source: APXvYqw+jUQO21Sx7hEAv1JbZEW5Wja41iOujx/BJs9D3ZC3XBTDMBZ17MJWoxtMAWPeoQzBcFsccg==
X-Received: by 2002:a05:6000:104c:: with SMTP id c12mr22240971wrx.328.1566838093314;
        Mon, 26 Aug 2019 09:48:13 -0700 (PDT)
Received: from localhost.localdomain (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id o14sm21800076wrg.64.2019.08.26.09.48.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 26 Aug 2019 09:48:12 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, agross@kernel.org, mark.rutland@arm.com
Cc:     niklas.cassel@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] arm64: dts: qcom: qcs404: Add the clocks for APCS mux/divider
Date:   Mon, 26 Aug 2019 18:48:05 +0200
Message-Id: <20190826164807.7028-4-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190826164807.7028-1-jorge.ramirez-ortiz@linaro.org>
References: <20190826164807.7028-1-jorge.ramirez-ortiz@linaro.org>
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
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 75ea356a3fb0..34360b2d3e0d 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -867,6 +867,9 @@
 			compatible = "qcom,qcs404-apcs-apps-global", "syscon";
 			reg = <0x0b011000 0x1000>;
 			#mbox-cells = <1>;
+			clocks = <&gcc GCC_GPLL0_AO_OUT_MAIN>, <&apcs_hfpll>;
+			clock-names = "aux", "pll";
+			#clock-cells = <0>;
 		};
 
 		apcs_hfpll: clock-controller@b016000 {
-- 
2.22.0

