Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F22FC157400
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2020 13:08:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbgBJMH6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 07:07:58 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44210 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727762AbgBJMHm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 07:07:42 -0500
Received: by mail-wr1-f67.google.com with SMTP id m16so7302255wrx.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2020 04:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9jS7AtcyDtrs+6cLov2M3M67k09AnqIN5nOTMIVW4oM=;
        b=px+DpFJlrCF3XkAO7JeVfvOvn9wvoJh1AVMMbqRzO55pJqim3Zp1YpnLBTtCjSSOCT
         XhrNaz9fXXryRZ0wnlhMPodAzcRuRYE9oB0miRPR9EeUCRR61Ql+r16MVZ+WrhaPL7at
         3ROSBx+ciU3NrDkhNxLoaVNz7mhrH0FFk8vqq3+sppGKECSshe7ao4IgorzskSwzoccU
         bOr2gHwEK2aP/BWp/df5yG1WDkKyxV5ptuUEDGh5ZzgVr5gQ6YieN79gDggu3wajz7id
         CXxDkWJqKBGoQM+6UCaQ6j8xi2+nAs8X6eZk/TXoFsRB5yd04ndJxAzqikoWj5tiPaOy
         IBKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9jS7AtcyDtrs+6cLov2M3M67k09AnqIN5nOTMIVW4oM=;
        b=m40MTxLJnh9x9TWK7KriH6KWgegXf5DkYsUBun63nu8AWrseoN0VkUciw4UW9iWsUk
         FHJSyESl7Wk3U9uXClAiXJeK+HLdGC0NGPVrvZiIbf0D9LHScIjp79Er6bWgNpRYkk2M
         BfSSUWPU4P+uyBSriRrjPwBo/O98VPvVGNrGH/DntZ4V8xnc7DyBwkfMTHymxIW0tL0B
         IA2FVJfu3efiT9XDuwhO7yirbMehA/Z8kuOcpHjkODyGuzhFbCnejhpOgInS1+4jcnfc
         9K0BoBmBLzLVywEGDG/6R9DpHVCllWql4Dggh958eH3uqId6L0fQg01X5mcvAzBnJBHd
         IEdg==
X-Gm-Message-State: APjAAAWKdsDz0NKLAKfw5+uzambNNtNn8N5TYScyi9Nu5JjAOagCYZsz
        lKQo+7Zf38yuKPXpQsgZwexSRIEQSOc=
X-Google-Smtp-Source: APXvYqz7hWldIQRJ5dcfzSP/g8ugSVgOzTalYGWKdCoryuvtGnH0/IDxQxOV8MnjiX4pI8Idy7KPew==
X-Received: by 2002:a05:6000:108e:: with SMTP id y14mr1715498wrw.338.1581336459167;
        Mon, 10 Feb 2020 04:07:39 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id i204sm293124wma.44.2020.02.10.04.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 04:07:38 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: [PATCH v6 15/18] arm64: dts: qcom: qcs404-evb: Define USB ID pin
Date:   Mon, 10 Feb 2020 12:07:20 +0000
Message-Id: <20200210120723.91794-16-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200210120723.91794-1-bryan.odonoghue@linaro.org>
References: <20200210120723.91794-1-bryan.odonoghue@linaro.org>
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

