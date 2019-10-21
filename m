Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E185DE2D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 05:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbfJUD4J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 20 Oct 2019 23:56:09 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41324 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726955AbfJUD4I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 20 Oct 2019 23:56:08 -0400
Received: by mail-pg1-f195.google.com with SMTP id t3so6902194pga.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Oct 2019 20:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DzN6sUwiXsGiG0QstYd2dvfeg6/B1PwWJvQoun4TY3w=;
        b=x2DVwu8hxWO/tIGOY+mw63ppGx1pqI/eZFZwCc4QdjzK87vadub6fctBWh8VqjgJ/o
         5fHfeKOKt1y8Mr9FuqAH/YznIJFYx/ZWwodC+oCkaKcP4cdsupYCE9WxRmzyBJ5QHUFM
         2ZtT/m+nVjlvMsaAiVil0s77A7AIZVNBqseSHcVcNHmJHAKz5ncfbRyiNOoLSA6JFiUs
         HVh2lk9CcQeEXtZ3y7WLJFeV4S39T7NDxg7u8MDELtVwoAL8r59vKZGSZHf+6fa4+UMl
         gn95cPMDGSwgS+YKpdVbYpwWIuNSsQON+qVRdu7W0WWDJ+/QD0A5b7I1pDpgyQhFui/c
         NEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DzN6sUwiXsGiG0QstYd2dvfeg6/B1PwWJvQoun4TY3w=;
        b=cs7MRsJfHwLAfJB38EAkpoSM+e/4OPM+DCSHzaMpj+ERBOVO/KRApoPTaKkIOObSG7
         V7Az6KBmOznkP1UjqnzlmkSG8NTCUg1cex0kH+hJAJdt/zFeKkoLlMjgGJviGOj13FYL
         fRhvbKP5pHQTdU0jRdJ/Pok91F/0PFb0P8IHBe8y9OVja1jqjcekHE2L6njCMXhB+JQq
         VqCJY45TXki29rxKcCaT9Do7G743Unx3ZgqAoGNXlYcXPWQU6KJq2PzwDTZ8Cog3Uld2
         kXEo4SXvAhWb/wGy2BCq1/zQp86101fOSJwrJEP/z6WimQ+JZG+nvTMd1tIazPVg1p5E
         5Rtw==
X-Gm-Message-State: APjAAAXVGNWW0wuxNTE7JjHVanC+H5YF5hTT5wIn/3FD/rOgeaDrZlbL
        Ng6aqNszj+nzbABHFIgKymjWMw==
X-Google-Smtp-Source: APXvYqz91vILzKwCwMpXw4c4MDum21nEhzA0IzWpvQxk5Xjbqxh2R6MjJYT42v2BMZwkh3wIlyC3CQ==
X-Received: by 2002:a17:90a:3702:: with SMTP id u2mr26313063pjb.57.1571630167781;
        Sun, 20 Oct 2019 20:56:07 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id o185sm18760540pfg.136.2019.10.20.20.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 20:56:07 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        Maxime Ripard <mripard@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Anson Huang <Anson.Huang@nxp.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: defconfig: Enable Qualcomm watchdog driver
Date:   Sun, 20 Oct 2019 20:56:03 -0700
Message-Id: <20191021035603.4186317-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the driver for the watchdog found in the application processor
subsystem on most modern Qualcomm platforms.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 4591bf1303da..f3d95f77fb0d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -463,6 +463,7 @@ CONFIG_IMX2_WDT=y
 CONFIG_IMX_SC_WDT=m
 CONFIG_MESON_GXBB_WATCHDOG=m
 CONFIG_MESON_WATCHDOG=m
+CONFIG_QCOM_WDT=m
 CONFIG_RENESAS_WDT=y
 CONFIG_UNIPHIER_WATCHDOG=y
 CONFIG_BCM2835_WDT=y
-- 
2.23.0

