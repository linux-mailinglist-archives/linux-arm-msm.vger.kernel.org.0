Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0236D116FD4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2019 16:05:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbfLIPFI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Dec 2019 10:05:08 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52718 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbfLIPFI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Dec 2019 10:05:08 -0500
Received: by mail-wm1-f68.google.com with SMTP id p9so15841207wmc.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2019 07:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HqzXtV+pb4cH+4c6+BjizDGft/5s2rVRw3okVlVpKkE=;
        b=OxmgWm98wnnUR1SbqmOw59l8mdpot7IgfCogy2Wv9XF4MeWrljQXnF6psHclJgvJAu
         ir3Ujsh4uUJXRtkWU7XkkQvZIK/KZibwnuRyOPgp9mIj7FJJPc9sWfJ7hc7zwwnVaD1f
         hh6PDe8fgn/eT6Vpse5rS3sTNYwqMqeRwZEujOSYZBHdwIWwPnlJJaklXa+Nz2tKZByf
         Sj9WyImGkDraYecBYPkBww2y51vrxxcIKNBUZ8x7iLygcvuSF91O6uRTWEAplt8zU0CT
         /eqdFG7jTB8c+d08irEQ7jzybeelB8diPOz1ZB5UH4bHftP/po95gzLlReHHPhUDM0NG
         mh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=HqzXtV+pb4cH+4c6+BjizDGft/5s2rVRw3okVlVpKkE=;
        b=D7MgZm16t8uPhJE65N8pZW5eQwQHF7DRSwSv8ikDzLULwP/9lAmc7N7gLtR9KxQO4E
         PuUQBdPRt1QQetIZh+cy+1HuLx4A9VT0tpp49NvQku49B+b99c33JbRm9v5DVqXmI/7s
         fHdhST0YYaUxqM74o2jpTzuVw+hBByp92ilQl2cUIdVX0aidCQoEhTDrkZblZsCJiiHA
         cJhKqgr4ZMGqZQuKKi92YaX3Y+at/1Ev5nQJm7eg7gxFKOUSqKOIBDF+jqiQEj786fsf
         iO+acE8FJ3wdXVgN0M9vTq+4sjjs07rvWm3Szdv/K2P7S1H+hZbeLjZA6GcPegIRp5FP
         YK+w==
X-Gm-Message-State: APjAAAWEkIlQeCjXpYuEb1ndODhvYvvAlUSwNcpdUjLteKgzyqv1bFJd
        ECXjLCnzFhk4Tr9Fw0Grt+s=
X-Google-Smtp-Source: APXvYqwmzBme5Is0rDq5DTl98wm3y7njVVkVyN18G4+5QPDgkWpTIc5UqwXI3wwfN0ScWY1U1yL9Ow==
X-Received: by 2002:a05:600c:2488:: with SMTP id 8mr7453533wms.152.1575903906312;
        Mon, 09 Dec 2019 07:05:06 -0800 (PST)
Received: from gmail.com (net-130-25-95-221.cust.vodafonedsl.it. [130.25.95.221])
        by smtp.gmail.com with ESMTPSA id t5sm27521229wrr.35.2019.12.09.07.05.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2019 07:05:05 -0800 (PST)
From:   Paolo Pisati <p.pisati@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH v2] arm64: dts: qcom: msm8996: Disable USB2 PHY suspend by core
Date:   Mon,  9 Dec 2019 16:05:05 +0100
Message-Id: <20191209150505.26099-1-p.pisati@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191205161505.15295-2-p.pisati@gmail.com>
References: <20191205161505.15295-2-p.pisati@gmail.com>
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
Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
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

