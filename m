Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39E2E114491
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2019 17:15:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729653AbfLEQPL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Dec 2019 11:15:11 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41556 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbfLEQPL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Dec 2019 11:15:11 -0500
Received: by mail-wr1-f65.google.com with SMTP id c9so4299635wrw.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2019 08:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Ju89ATnfEEtURs7oNbXbvXQ1g0YptoejRq1xWoLZtLU=;
        b=tWSneM55d9WwcDRR/TfE7oxbRnVgT3/I3bz4h9VMzNG5Wh0fU33KL0t7sfPIQ2DHYs
         SNAoDW8OSVmqSKxV78emmFgxu2rLzQ7xeQBOKTdyCSlxuiqNP38RPIX88KGPnbN2gYvM
         WsMvheaIVe2JUZtwJyqlx2pcBhhTbeYZj28xxogtD4MjuRYrGkYY+jJa27E5hmVLRPHi
         Abj8yKbiskVWLr92pSNllkd+DhH9SIsRj3fqVyygnoTD98O0hqqVxhTnxfrOw1DUFl3g
         M9YlRTuKiKDlx0c68MYwQ0AM4lUVvyetntm3TnkIxpAhuYxJnFMaTLsomsn8qbNJiCm3
         TGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Ju89ATnfEEtURs7oNbXbvXQ1g0YptoejRq1xWoLZtLU=;
        b=gTFqrwgN3tofs/Drqpa2Gef1NViYrR+LfPyeiSlkNPFr4gXyYY2bSU+NEioHsqYidA
         DvecE46rwTR4R47uxasoIM11xuvAK8BNJSr3Iyb4xKUMLQfAL1lkQAI6AyfTkZyJ1Ujs
         7bg8yXsa2LQDyCIQpfDNcPifylz0pKHjUlKmszFIcAZGCvsXomarkRZuakYp/5MPGVkX
         ZUOIb5E2cK1CyzK6XdIbZtTIqr5WoIMGbebq6piX7iXm6RChLAFSdiy6qNFs5EFG27OV
         S40hl0gaQShnz8VUhEkDQVsBvGkFtivpveakDHITQR3ZB2pQYLR4Ho/IYXC7j142E5LW
         gjQg==
X-Gm-Message-State: APjAAAWuRyL3oUHzOkJjx6PwHEBgffJtZbknJ9g6BMFDeQc9ZjDlkTyQ
        mzkCzcm87h9CIkJYnBNc6S0=
X-Google-Smtp-Source: APXvYqy7rsg56I2Pu+ZocXfjNzAuKq+Zo/cTua1TPm++rUPt1dK1qJkuomqBzLQ5/neJEsglWpFynA==
X-Received: by 2002:a5d:4f90:: with SMTP id d16mr10553367wru.395.1575562509292;
        Thu, 05 Dec 2019 08:15:09 -0800 (PST)
Received: from gmail.com (net-37-119-134-251.cust.vodafonedsl.it. [37.119.134.251])
        by smtp.gmail.com with ESMTPSA id 4sm280105wmg.22.2019.12.05.08.15.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2019 08:15:08 -0800 (PST)
From:   Paolo Pisati <p.pisati@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/6] arm64: dts: qcom: msm8996: Disable USB2 PHY suspend by core
Date:   Thu,  5 Dec 2019 17:15:01 +0100
Message-Id: <20191205161505.15295-3-p.pisati@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191205161505.15295-1-p.pisati@gmail.com>
References: <20191205161505.15295-1-p.pisati@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Manu Gautam <mgautam@codeaurora.org>

QUSB2 PHY on msm8996 doesn't work well when autosuspend by
dwc3 core using USB2PHYCFG register is enabled. One of the
issue seen is that PHY driver reports PLL lock failure and
fails phy_init() if dwc3 core has USB2 PHY suspend enabled.
Fix this by using quirks to disable USB2 PHY LPM/suspend and
dwc3 core already takes care of explicitly suspending PHY
during suspend if quirks are specified.

Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 87f4d9c..fbb8ce7 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1598,6 +1598,8 @@
 				interrupts = <0 138 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&hsusb_phy2>;
 				phy-names = "usb2-phy";
+				snps,dis_u2_susphy_quirk;
+				snps,dis_enblslpm_quirk;
 			};
 		};
 
@@ -1628,6 +1630,8 @@
 				interrupts = <0 131 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&hsusb_phy1>, <&ssusb_phy_0>;
 				phy-names = "usb2-phy", "usb3-phy";
+				snps,dis_u2_susphy_quirk;
+				snps,dis_enblslpm_quirk;
 			};
 		};
 
-- 
2.7.4

