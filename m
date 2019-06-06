Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDB7C369B1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2019 04:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbfFFCCJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jun 2019 22:02:09 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41442 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfFFCCJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jun 2019 22:02:09 -0400
Received: by mail-pf1-f193.google.com with SMTP id q17so461411pfq.8;
        Wed, 05 Jun 2019 19:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VyKAAyyKF/StTl6Cc7Bhi0hP4Fbpr1Wnyb227vQxupA=;
        b=lTuCSGE8jGdHt1mpj8oE5y0pNaeqonUE94Pp4sA/I3REVC7LDjhxZGajzIRthAJO9Y
         E1/KCnJbDAhiYGjZ0jeuf27dZG7ikrXgA3qZqXlGdI5zmDJSS3diC8XzgaLwE86WqVKT
         DfPLFcyzUu6ZeVFRi3h0JOEt/fjr0h99BkH1V2wyU0xHsVlBZV3qIYfkzvmAIkMQXQGn
         GnLDYuks2zgsat+9WE/IdQjuQwMyJk4GonhMW6LAOOZZ7YucZMDl18z9+LxQTC6DPXI1
         uhcv3L9Mu7gbSgXc2umbMenT9iQyJs9leOiMLiIs5Sau+QLwsZr9SUPf9q67VoXmYtDe
         8A4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VyKAAyyKF/StTl6Cc7Bhi0hP4Fbpr1Wnyb227vQxupA=;
        b=dSatX4DioFEk4cZxVFJiNjOR3t0Gr7EtyadR8gTg92gUKWieX2ufou0TsdMzJwmjal
         Gz8FOqu2Kosx40euBUTcMlMIU6sv2bsiqLs+uLHMSGh7PnXorvrUlDUYAYUzaUdldSVk
         /KkAWw/823w06oARLFA5/4FqWDl+VXqJ01SDg+UsKcHh7pSG/3n090HbdcSLwlB8cydi
         oFaBB6NZyvdfGvOsFv/cm9TPBD6xe/mCYVOpRqRo5A669UoMPdG90E+uofzkuKaDCqmx
         WjZKh/WXI0oze+vdZ95L52LbekMO9muyaEpEbjJisqxViTV+Ax4aeG9unCpJk66NjTc7
         Y7sw==
X-Gm-Message-State: APjAAAWHpz3OBdTVUKIlY7KoltbIgnOn96xTedPfzm9YQzbld9thbRjw
        ZIObhlUZdVji2vNlNub+YQQ=
X-Google-Smtp-Source: APXvYqzOgkLxlVaBoCV6UwBu57yiXAf6/1tBbA/MUmQ/Fq6F3ju9AQm2TVNVsXzsM6YQZdPCsdhJiw==
X-Received: by 2002:a63:db47:: with SMTP id x7mr860524pgi.259.1559786528992;
        Wed, 05 Jun 2019 19:02:08 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id o66sm247961pje.8.2019.06.05.19.02.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 19:02:08 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, marc.w.gonzalez@free.fr,
        jcrouse@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v2 3/3] arm64: dts: qcom: msm8998: Add gpucc node
Date:   Wed,  5 Jun 2019 19:00:27 -0700
Message-Id: <20190606020027.2441-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190606015844.2285-1-jeffrey.l.hugo@gmail.com>
References: <20190606015844.2285-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add MSM8998 GPU Clock Controller DT node.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 574be78a936e..cf00bfeec6b3 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -3,6 +3,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-msm8998.h>
+#include <dt-bindings/clock/qcom,gpucc-msm8998.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/gpio/gpio.h>
 
@@ -763,6 +764,20 @@
 			reg = <0x1f40000 0x20000>;
 		};
 
+		gpucc: clock-controller@5065000 {
+			compatible = "qcom,gpucc-msm8998";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+			reg = <0x05065000 0x9000>;
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&gcc GPLL0_OUT_MAIN>;
+			clock-names = "xo",
+				      "gpll0";
+		};
+
+
 		apcs_glb: mailbox@9820000 {
 			compatible = "qcom,msm8998-apcs-hmss-global";
 			reg = <0x17911000 0x1000>;
-- 
2.17.1

