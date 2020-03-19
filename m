Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F62B18C32B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2020 23:44:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727580AbgCSWor (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Mar 2020 18:44:47 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:35764 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbgCSWor (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Mar 2020 18:44:47 -0400
Received: by mail-ed1-f68.google.com with SMTP id a20so4821334edj.2;
        Thu, 19 Mar 2020 15:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mYCC0npBMG0vbAOp6lmFNCRY0zK8adL/9dKbj+Yqe7Y=;
        b=TcTDl2tDGNgBAaeziYf3pLljPgmzoctYZoU6s2SI0JOlRpxSIpIqVqn7MObZ8hKZMe
         kY+4IbIhSCoWP5GfPipK8Uq7NFxCVjVuzlGDrRUc8YrWfxK2XvCrb7+UIFy8TT9HwXCq
         aO0kWPEqEVo+YAmvmpbv5fSntkFg28PXU2iX1BFKorjeo5u1we5dGbXmZZg7bW4Zo184
         s0KM4beRTjNDr6osxUQDjzt7HBs5sJXJUJEvelOK5qpBSaEyiCO1TUSr4rBVugrrVR++
         E0doyBA4JPIOzff1LCFyl2rUk40aTjxWW4RnXBunuErpnLWCHhqH/FA/iKFHyIEC1wNM
         kcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mYCC0npBMG0vbAOp6lmFNCRY0zK8adL/9dKbj+Yqe7Y=;
        b=C+fyMx4/bG4hyI4U+iIA4GlHQ6ucv67DTpXwHgBL1f2BRdoiUjRyCsM4f8JqRtGR4p
         z3HmTM/dnVIwWUrr/LkJ7QfKQzBIO192pFuixZIoBRMwOBIJROsMXT7sVF+WA4G9zhtn
         bsrf2nvHJ5iVyWzQePaP9TZxJkSttlG5KdYK3rifO9zaNpQzUZzsysO09tdIOULviNuq
         /Bn86ZcRF/OYsyULjFpUmbm24mvVGyV6w80V4R5Lp9PUUWyks93LN2jqT+R5Q9RY7FXU
         0eptnFKWvKUGZck1tqfI4qPVHnkccW/Agz1844nwwhd2HJJPnvOS7Xa3GdMmV+hJEucv
         RvWA==
X-Gm-Message-State: ANhLgQ04ooWyJnnspI4XWw201UFrj8pHEnGjiHTRI1nP6xorWeFGkmFR
        YsbUehuW3deIx8q4U0RvEV4=
X-Google-Smtp-Source: ADFU+vuBct1KRuMGJvc8LRwcNnwdnABrZPBx+DDO4CJ62i+6MJWDN4mUXNUzKi4lBLxvXrqj4/Sx5A==
X-Received: by 2002:a17:906:4301:: with SMTP id j1mr5699201ejm.46.1584657884798;
        Thu, 19 Mar 2020 15:44:44 -0700 (PDT)
Received: from Ansuel-XPS.localdomain (host203-232-dynamic.53-79-r.retail.telecomitalia.it. [79.53.232.203])
        by smtp.googlemail.com with ESMTPSA id a12sm244253ejy.89.2020.03.19.15.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 15:44:44 -0700 (PDT)
From:   Ansuel Smith <ansuelsmth@gmail.com>
To:     Andy Gross <agross@kernel.org>
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] ARM: dts: qcom: add scm definition to ipq806x
Date:   Thu, 19 Mar 2020 23:44:24 +0100
Message-Id: <20200319224424.18473-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add missing scm definition for ipq806x soc

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 arch/arm/boot/dts/qcom-ipq8064.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index 16c0da97932c..bb5f678c869f 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -93,6 +93,12 @@ sleep_clk: sleep_clk {
 		};
 	};
 
+	firmware {
+		scm {
+			compatible = "qcom,scm-ipq806x", "qcom,scm";
+		};
+	};
+
 	soc: soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.25.1

