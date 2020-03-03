Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B12EF177D05
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2020 18:13:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730728AbgCCRMO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Mar 2020 12:12:14 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38553 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730711AbgCCRMN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Mar 2020 12:12:13 -0500
Received: by mail-wr1-f65.google.com with SMTP id t11so5341799wrw.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2020 09:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QTnLUqWFBpyvzwpVTBm89O8eiqTgQtA9qR2QiZEc26U=;
        b=lGaWE277H8XcdYwgtTfFH2tb9CSGbygtic32Z57TPhFArHTX+Yh/AJINcTL+sR5ohN
         SyW9FHO9a/JP3Tbi8Jur/QHJsiZx9S2NjMf/hV8X7jHpVn755In/oZ0cxcbjaKkSjyBs
         baF1UxtdXtY0AoABG+2r7LbMdHLcl9wGaM4eOKO0m9/HGrzo3QNsu9OBLvM8xGWyMwTv
         kqaaW2N4Y2S2Ndtkdq3SAtM3eBTqI+92ohNkDstDtNOiP3R09SBL89pheduAnO2CHlBY
         u6NbAyV9TD6c7SPoah2RoM+sBaXjNjUyumcUBIo8lFnY9G9cxUjvJiAi1bmzPSVYomtM
         OyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QTnLUqWFBpyvzwpVTBm89O8eiqTgQtA9qR2QiZEc26U=;
        b=TjXXvhiod9ihrWkCgbJwhZdbG0ms2Wwq7/dBqsRoWS+i089CEjKpjkgXzd+ZANyWCX
         1chHNjy6Be2VbBX7Vr6ivno7QqBTi3n0gLR/AUschunx0rtB4L5oNfg1GYKQoaRiNoct
         ysoTQYSVnEwZD2N+nL9ShWj93RUkRfIJnR9+pV81uGzKGS5OZG5iQRpLy2KVm8QeEBL+
         CpHL7zpTtoC+N6912iBUxbQiOJsv9nGz3nIUNcQFetwyG/gF/OWA+gN7yoiTMbP5K/cB
         vQOXH9yJj3HJ5cTqYq+SMiLf3fd/nqraznmQZFLEbGhuGbnvzwALm2joG4wVlKayXUO1
         StPQ==
X-Gm-Message-State: ANhLgQ3ib7yIB+hoWJKIOrywx8K4ifOAkbxeoidVD1ouz1qdTlMwuuRp
        3LxuEvsp46ti1ReiYbWhPlsogWWtlRc=
X-Google-Smtp-Source: ADFU+vu+2MIALvRP3/YG7FgAq8QTTJwY8E2jeOrziUGeyqcqEgxAb5nrJcHlcTK9t1UYDDmZdRVluQ==
X-Received: by 2002:adf:d086:: with SMTP id y6mr6114796wrh.387.1583255531155;
        Tue, 03 Mar 2020 09:12:11 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id z13sm5425319wrw.88.2020.03.03.09.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 09:12:10 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v7 15/18] arm64: dts: qcom: qcs404-evb: Define USB ID pin
Date:   Tue,  3 Mar 2020 17:11:56 +0000
Message-Id: <20200303171159.246992-16-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200303171159.246992-1-bryan.odonoghue@linaro.org>
References: <20200303171159.246992-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The USB ID pin is used to tell if a system is a Host or a Device. For our
purposes we will bind this pin into gpio-usb-conn later.

For now define the pin with its pinmux.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 62ef9c34b04e..cb893ca76901 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -271,6 +271,20 @@ rclk {
 			bias-pull-down;
 		};
 	};
+
+	usb3_id_pin: usb3-id-pin {
+		pinmux {
+			pins = "gpio116";
+			function = "gpio";
+		};
+
+		pinconf {
+			pins = "gpio116";
+			drive-strength = <2>;
+			bias-pull-up;
+			input-enable;
+		};
+	};
 };
 
 &pms405_gpios {
-- 
2.25.1

