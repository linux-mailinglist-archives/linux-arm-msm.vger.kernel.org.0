Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE0F1A3E58
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2020 04:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbgDJCdC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Apr 2020 22:33:02 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43212 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgDJCdC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Apr 2020 22:33:02 -0400
Received: by mail-lj1-f196.google.com with SMTP id h25so599718lja.10;
        Thu, 09 Apr 2020 19:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jl9+MFoz9FOVeQYZvGEhfQsUzeR6H5+fWjwrI15x2z4=;
        b=hzo34WeHzqF2MRVekRCB6qQ2to+82InUQzzrEI3aHJE38TD2HK0mkYL8XmXe5U8/Ug
         dhkFmz32aonURvzYSQmBfDf4Y5bJgSRmK4c/7iZyejYluqqpH4j/cdkNAIVPEzkUNcEU
         YJIXvLVax7P5GiAiNrZ8t86nFtsj3YK+PWZHSIsW6XIx+hHG0QQaG/fP+tDfiOeOD/d4
         WeJXYjrHaWkGter4N//y0HIxIPAnlIfIB8R3jZC4kxgZx4ddyedcSUVXzBPuFem+41mw
         i30TJGB5Bg+3URW5FqjCBBj8Tubreog0XYXPiXZoUcvH6VjSmEQwD40PZBHvtRG/JWhm
         CjBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jl9+MFoz9FOVeQYZvGEhfQsUzeR6H5+fWjwrI15x2z4=;
        b=YbIeg6alQIoT0HOQs21zl/a80TgndsLvLBI+DQpEup866Fy+SXBC2AP05fL7CiGJn3
         3A5cEuwSPS6nYLJVWfOjAnCS6MgBlRMjOIjlQYFEQdeN4XFtb2sq6J4edwpAXXIAFTkA
         WybErX7XDE4flRUD876gvbMtJ9JiumdH/v7FjIL0N15DnXWn16cvotDj1f6fYhIHEnG1
         p28nFM+iEfMze2BXmfZLAezGkXpV9fDaRt7gDA8hlKWiv7EpcyHPaB7VFkfp/D5sISrW
         EFBVx+e5fx4S5MH1ZxqFVuMx7/F1Fkk9iG6H+DHitcNij8bwMw2AUDD5ibJ4pIaJEK3i
         Ikzg==
X-Gm-Message-State: AGi0PuZQ5c+rSeTZ4B8CxMf1SBmXUd03H88C+aw8bpStoX2b1vvZLfIA
        kZwV1wez6Ooy5PXnB8IYocIaG7SE9BT84Q==
X-Google-Smtp-Source: APiQypJWofmM8Qlyb2FI7O0p2padX/aOtgYx9otx/2dnfLObyekNxIuKl5+r6b20D5ZTWeEQ44DyKw==
X-Received: by 2002:a2e:b52f:: with SMTP id z15mr1642957ljm.38.1586485973083;
        Thu, 09 Apr 2020 19:32:53 -0700 (PDT)
Received: from localhost ([213.191.183.145])
        by smtp.gmail.com with ESMTPSA id f7sm274127ljj.4.2020.04.09.19.32.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2020 19:32:52 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Daniele Debernardi <drebrez@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 6/6] ARM: dts: qcom: msm8974-klte: Add USB node
Date:   Fri, 10 Apr 2020 05:32:03 +0300
Message-Id: <20200410023203.192048-7-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200410023203.192048-1-iskren.chernev@gmail.com>
References: <20200410023203.192048-1-iskren.chernev@gmail.com>
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
index ad26c83fee81..691a3cf2dd96 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -264,6 +264,31 @@ sdhci@f9824900 {
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

