Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A34D2838E9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Oct 2020 17:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbgJEPER (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 11:04:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726777AbgJEPDc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 11:03:32 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B563C0613CE;
        Mon,  5 Oct 2020 08:03:31 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id n18so2155021wrs.5;
        Mon, 05 Oct 2020 08:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QbNuaKYkBwTpPwNCy+vwzXuQoVj7XjK6mVw/QFBl4AE=;
        b=kvJiyWV85k5/KMAXBym5LsGNvu1Ry6aAJjUV0rZSs628BMWLR38caZflkfDkdFQIur
         pVD/vxSYl+Q7IQvTqhuUcUOdDUeJTdP82h98zWEO8KCX0BUPXmH/JiFyTZSyRajvHI94
         5A3zUFuJx1m7uzqn29S6d7gQFKTlI4c6tFmttRvR2JO4X5MwYCxcvdwHIQwI9R0B+vnw
         jnoFd2Q/zRhDpnnjwdtPc2FEKO4VT2jJbULY1XhsEAcOY2M6Jpy6YWlS2LqNJG4SqqeB
         7BbQqBmh9K/hpUycApzbURlx9HhGZIhPA7+TJ6FxqiEZFWl10O/FRy+yaMa6WyqG/yjM
         szTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QbNuaKYkBwTpPwNCy+vwzXuQoVj7XjK6mVw/QFBl4AE=;
        b=TAqNtKXDFNDA1uErRHiUSbun3dP99q5g6bFNGHYPpJ7fpjKmgZZI5uu1aL6G+t/o56
         X9irSVdkBAWChl9GGxl2dXCiaDhwcn06ZxIxSPIqtgqCM06G2H13DPkdIlC2c2J+9ONo
         kscpyku9TDvjuBM268aHyf8yor5PMR9QdJv9vM8Roequ5x/gYXd8s7iY2WF2k8ajgqp+
         ns8uLT7rjiDE/rsCWFS5ZKNiLEwiHkB8D/lZ6Pb49mjYk2C3XvPsVYVk2Rmp14x5aS4M
         FpaZhg/V6uFBBxHPtofuYcpDYV+nSDQEHBzs/DsQKrOaxaho3CzxQeSH2w7EC93n8BEO
         ea6Q==
X-Gm-Message-State: AOAM533+y0UhAaygkvPclFVWPylSsSBgOe5bAh6kW4fSriEwIKXzWpX9
        CE1yLTOJvAWq0LuYMOnREmk=
X-Google-Smtp-Source: ABdhPJyamaT+oa9/xN0SHhTX/A3xrad5o7D2fN1B/WNzPoOHOb/t5Q7KrJNhUCYcLZX4bQsSczmTeg==
X-Received: by 2002:adf:e552:: with SMTP id z18mr17320400wrm.50.1601910210052;
        Mon, 05 Oct 2020 08:03:30 -0700 (PDT)
Received: from localhost.localdomain (abab191.neoplus.adsl.tpnet.pl. [83.6.165.191])
        by smtp.googlemail.com with ESMTPSA id c132sm4662wmf.25.2020.10.05.08.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 08:03:29 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     konradybcio@gmail.com
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 03/11] arm64: dts: qcom: pm8994: Add thermal-zones for temp alarm
Date:   Mon,  5 Oct 2020 17:03:03 +0200
Message-Id: <20201005150313.149754-4-konradybcio@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201005150313.149754-1-konradybcio@gmail.com>
References: <20201005150313.149754-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This will shut down the platform in case the PMIC overheats.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/pm8994.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8994.dtsi b/arch/arm64/boot/dts/qcom/pm8994.dtsi
index 7825208b0d8b..9ab5657f7d23 100644
--- a/arch/arm64/boot/dts/qcom/pm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8994.dtsi
@@ -4,6 +4,30 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 
+/ {
+	thermal-zones {
+		pm8994 {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+
+			thermal-sensors = <&pm8994_temp>;
+
+			trips {
+				pm8994_alert0: pm8994-alert0 {
+					temperature = <95000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				pm8994_crit: pm8994-crit {
+					temperature = <125000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
 &spmi_bus {
 
 	pmic@0 {
-- 
2.28.0

