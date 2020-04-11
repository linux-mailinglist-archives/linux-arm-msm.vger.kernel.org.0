Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F44F1A535A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2020 20:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbgDKSWQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Apr 2020 14:22:16 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33848 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726824AbgDKSWQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Apr 2020 14:22:16 -0400
Received: by mail-lf1-f65.google.com with SMTP id x23so3596832lfq.1;
        Sat, 11 Apr 2020 11:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+niRBGbpnV97QyKJ3armXwVilZlDGTWi89SgKtqNxcs=;
        b=LZd3cbNwMfr96h4aHJVMGsPGGphTrI0WaypcHWdTscqXOGKrDkU3y8XfnNZo0nDS38
         yBdcgxviRe8DtOIZHk9gkyaRdcCKL1q/sTWjp5ek09OAYGz6s5qnTOI7+F7utg6NjEH/
         lpKpSNoDo5EXWJJZGYP7YGnv4a3IK+VVykQo8cv6PS8u2xu9YgReC2HJgx3sQT2wh3kz
         pNbFSZqcP3ny2KrwnRU8NiRn+D7FnDwAF5eIDluFryMUhZ3j9Rm5In2YSQNidZ8dbSyt
         07NNnWdOvC5sl5WNUh0zgdeL8gtXiu6I4P6jIPCH3vx49L4aD9SuR1467936lJp0T3m4
         s87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+niRBGbpnV97QyKJ3armXwVilZlDGTWi89SgKtqNxcs=;
        b=NLowynUKVrysuN1LwCNs+0tsI0EIyCKokCW8U0NBtWD84k5wpjzS/1JHAIF4ZLdvQq
         zDUMfyNGF4CKBG8TgwSO8E2YGzId2eY8JkEG3REmPCI9EdAhysl8tSiMceJaimlcW3fp
         ovc1N8MziOTWNopxbw72GUCZ7OAVmej4W1XjyUg30IM+lVzB4UU0YHO6fy/1tdTRBDY2
         JA7Rq5F2879Xl+42gZPuO5Sb/ozd41LN3Yp9qOCWDNv/3b+LJA08CLiu9MiQkFQY3ALO
         8+PRWU2ky+2iwOjXsdZoF0XVrEerIZde2A+uQa3dwZojmMDE6LqwFEMfd4cf0xYNiYRx
         h3TQ==
X-Gm-Message-State: AGi0PubR1bAhX+dcvbrfZWFGk8UZEjupbsgTxXQ6tiAPhdf/XmiOGxVT
        xZpsRgPbnXzv2z12kiXPin6FL7zInabZSw==
X-Google-Smtp-Source: APiQypJdbNROJyWqpa9aZFh03QK652AMqEDi/LOUvENUP1mgL6ZYk1u1bYXbNSE/Vepi4AHaSa6Hyg==
X-Received: by 2002:a19:c14e:: with SMTP id r75mr5879342lff.62.1586629333903;
        Sat, 11 Apr 2020 11:22:13 -0700 (PDT)
Received: from localhost ([213.191.183.145])
        by smtp.gmail.com with ESMTPSA id t28sm3860774ljk.40.2020.04.11.11.22.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2020 11:22:13 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Daniele Debernardi <drebrez@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v2 5/5] ARM: dts: qcom: msm8974-klte: Add USB node
Date:   Sat, 11 Apr 2020 21:21:22 +0300
Message-Id: <20200411182122.2677248-6-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200411182122.2677248-1-iskren.chernev@gmail.com>
References: <20200411182122.2677248-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Daniele Debernardi <drebrez@gmail.com>

This introduces the usb node which can be used e.g. for USB_ETH

Signed-off-by: Daniele Debernardi <drebrez@gmail.com>
---
 .../boot/dts/qcom-msm8974-samsung-klte.dts    | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index 42fc18804021..df85d90100d9 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -272,6 +272,31 @@ sdhci@f9824900 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&sdhc1_pin_a>;
 	};
+
+	usb@f9a55000 {
+		status = "ok";
+
+		phys = <&usb_hs1_phy>;
+		phy-select = <&tcsr 0xb000 0>;
+		/*extcon = <&smbb>, <&usb_id>;*/
+		/*vbus-supply = <&chg_otg>;*/
+
+		hnp-disable;
+		srp-disable;
+		adp-disable;
+
+		ulpi {
+			phy@a {
+				status = "ok";
+
+				v1p8-supply = <&pma8084_l6>;
+				v3p3-supply = <&pma8084_l24>;
+
+				/*extcon = <&smbb>;*/
+				qcom,init-seq = /bits/ 8 <0x1 0x64>;
+			};
+		};
+	};
 };
 
 &spmi_bus {
-- 
2.26.0

