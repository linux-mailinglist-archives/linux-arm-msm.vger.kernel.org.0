Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A604F117017
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2019 16:15:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbfLIPPE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Dec 2019 10:15:04 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51879 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbfLIPPE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Dec 2019 10:15:04 -0500
Received: by mail-wm1-f68.google.com with SMTP id g206so15909674wme.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2019 07:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HqzXtV+pb4cH+4c6+BjizDGft/5s2rVRw3okVlVpKkE=;
        b=BHKn8SyFX6E+D83yCMcr43DF7tvgMwjgkIsnc/IAqt58UzWg/ub6ivWLqUY54InJ9V
         iEReEucVgzM4/htV6C/JzPj1I0ZHaMyJBi7A6nH2gAdKBUBn8KoZpCf9vRIgwMWRiS5e
         0LXWSGTqMXEjdik7suCM7Vm9a12yc70f+7iLn33+nWTy/WTdtjRd0nEk73k8NzphQLWy
         DE5qU26TTRMNaQnVjS9BgZt/Z6L90eHXIU1KrHq+jfaGVPLsa7Q/F/7bmY9aZa2fS6cb
         SV1sp1bVNIsrGdLHCusb3C9gHy3PNLH3AiORfB5zeSLaTWYwFna8ctVF63k02VgdhhqW
         AL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=HqzXtV+pb4cH+4c6+BjizDGft/5s2rVRw3okVlVpKkE=;
        b=XFCmjuO4KPE5tIrgdRPaohsj2csz1LPfbmceTcVi4xxd91GShSAnFTK9z+YiyjcmN5
         D9oeqpn7vLr05UdPWJ5W9GWgRQ8eAPC9eYI3U+V5lnbjUn6a2996sVBKht8V24th2BBv
         a9Jpurqh/1txx46HtuqE7HewMTG0lm7g4/BtnrNxVcqjdJ1Lh6Gti6ChbPlpc1GjF7ed
         GwWv5sDW2zKgMrJ9jVnNTbxrYE4/p2ZXKkdo4tLJ5RWsejY9sGJ4coXDf+5g4ksFIyBw
         QwOHfl/rFvl+fqzMj09Zn9AnKtMmyaFJbz193rX44vAlEYyvcc2VE1z6VftT3RqgLMx2
         V8KQ==
X-Gm-Message-State: APjAAAVnusLtUubkXDYuBco8Pf6Ih/FDBOFMpvwVkthzvC7MNEgKvvxC
        cKMwritPKlyX6M24VBwz2w8=
X-Google-Smtp-Source: APXvYqwSLSTiFM6B9kLoBY7iniRDnoXqylIsxCQ/0tLDbhgzKtk6zwHOveG0qmzSDXba5/zvZBDZ6g==
X-Received: by 2002:a1c:7306:: with SMTP id d6mr25821923wmb.164.1575904501959;
        Mon, 09 Dec 2019 07:15:01 -0800 (PST)
Received: from gmail.com (net-130-25-95-221.cust.vodafonedsl.it. [130.25.95.221])
        by smtp.gmail.com with ESMTPSA id o1sm28300072wrn.84.2019.12.09.07.15.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2019 07:15:01 -0800 (PST)
From:   Paolo Pisati <p.pisati@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH v2] arm64: dts: qcom: msm8996: Disable USB2 PHY suspend by core
Date:   Mon,  9 Dec 2019 16:15:01 +0100
Message-Id: <20191209151501.26993-1-p.pisati@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191207204411.GC314059@yoga>
References: <20191207204411.GC314059@yoga>
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

