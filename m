Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA06155033
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2020 02:59:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727702AbgBGB7m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Feb 2020 20:59:42 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35171 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727652AbgBGB71 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Feb 2020 20:59:27 -0500
Received: by mail-wr1-f65.google.com with SMTP id w12so803869wrt.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Feb 2020 17:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9jS7AtcyDtrs+6cLov2M3M67k09AnqIN5nOTMIVW4oM=;
        b=cECIe0oEpjgrfZenchpr/nmBzPOn+eYNXiy0l7qbN3n2TMZX/vu69dPpi1iE7W9gBW
         qAzVBODZkrShoafoIjj1HbBcMyTaTcdIu0ZDWB+XY/KCB8lVJHccnYG0QLuPtht8yHYd
         ZhGe3shE/0GSXLRy5gytZT1lHXE97fYCIZZpRwISsWiwbXScsbfPD6azBBTWqupi2/L+
         jqQGqfhrB2nmZhtEIQU3m7ki5NGQCIPBiVYLoSjp/01jbeK6/BHXLzqpRmqWJ3Mh0AWI
         b7yo2yH4lI9OxAqRxDhJAe55PculLwXvvkq0XrTIOHhFV+ach+PwMfHHSbgauJOZgNvN
         D05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9jS7AtcyDtrs+6cLov2M3M67k09AnqIN5nOTMIVW4oM=;
        b=uIunrgvhj5rsJKOvdNdBFxA9QEBkQR/Ih3awEaPk6X50TcpBnbPXRsQ3DCsYVACD3i
         kk6ppdLDTm0qwmxmsrmY0Schd9YAcF4dUif9/k4EE5wByPb0J1X68eMydxCawb6Jenbb
         ZKO2JiS4GrSl5sh6HxyRHM0W3cdQxNSdlmqUprPpIOA/W3/Zf8jc8YdPjxlvIOnPC32H
         rvnPoPEXAC+nrsMnXH1wT5pIEua8UDZBHLggtNJbOAd25wTk/+8wgOOiX0t6V6wsV8+t
         MV78Qt2Pf5S7igDNCpUTV01P1GWFCuqJhljvx56fm1uBKpGoVhSMoiEIBcPeFA+tgxC4
         m7lg==
X-Gm-Message-State: APjAAAX2E7iVwffAA3twlHfjRJ+ZtNcyZbpwb/7z/Gi14ELqr3KOnkAP
        UnEYHj8Ah7PA4EjjvyOKVAVUg6fMBG8=
X-Google-Smtp-Source: APXvYqzldi+Z4ZyAjpU8OhOMfMELRM+JGwgNdPz+pcqWOZDtCNlrHg6vraP4JfE8C9T7fsIyN0UKIw==
X-Received: by 2002:a5d:4a84:: with SMTP id o4mr1219921wrq.396.1581040764626;
        Thu, 06 Feb 2020 17:59:24 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id a62sm1490095wmh.33.2020.02.06.17.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 17:59:24 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v4 14/18] arm64: dts: qcom: qcs404-evb: Define USB ID pin
Date:   Fri,  7 Feb 2020 01:59:03 +0000
Message-Id: <20200207015907.242991-15-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200207015907.242991-1-bryan.odonoghue@linaro.org>
References: <20200207015907.242991-1-bryan.odonoghue@linaro.org>
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
index b6147b5ab5cb..abfb2a9a37e9 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -270,6 +270,20 @@ rclk {
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
2.25.0

