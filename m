Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1DC1F5D0E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Nov 2019 03:42:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbfKICml (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 21:42:41 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37696 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725990AbfKICmk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 21:42:40 -0500
Received: by mail-pf1-f194.google.com with SMTP id p24so6385950pfn.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Nov 2019 18:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z3aOUzy6rUzyL+A22ql+voMdR9JLNJalZQcTYr1824w=;
        b=NRtazlfidpLzrbXKDkCOE6NaO6GOLX5Lh6Mm7Pvv32Q3hQv5PMbZLh7Ac92oDhosFR
         /1zBLFNCf7wGnzAQyXp/pqUR/AikPgmQKcIPZVSGbHhAjK+UDMKln89bNSQVS85ACJJE
         ikbdmKqeIuQvukcaxMNkKR9ZU8ZRzZeoxkmvGNv/ubqJNkAPnjUUWwNe91owFiC/OzSO
         hmSQwuKmmDzAekKCN3hKX4nzPlBPlzydDEr9FeFQtpqj+mVR5hOVCaY3fxzLKbfuUaz9
         fFqsVOa1BH65aTRWqQwStHrv5OsMNXXlVRCaJ+Z/+azMJmnFR9VWisr6AX+uJEn57jtN
         Gyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z3aOUzy6rUzyL+A22ql+voMdR9JLNJalZQcTYr1824w=;
        b=IaVk7dFy0GfHLnJ2cWDhm7sEI1xoD7BmqJlOxZfGUyNL2aiVIe1R/TbHeAcM8xD41w
         fNo9fUJsaFDWyqAnJxLRRb4Hi+1gcs0nsVU+0i93p7paR84/7F0e/feCkTq3LUPnrmkw
         Vu0SS3f2Y8EF/xsHeiBUQjvJVESPnLZqLz87Kiz45RSCB0OZHnKUQthEWpy0YF8hA23N
         ikyDXoZRB3e9c7wpybsTKGRg9JtpzTCTtzjJKarzSFGrwm81oafuFgm0kLY5e8n/EsYU
         t7gn6bLZMWHBJjO5OcwWPuYkmDO6L4CRSx/huzVEwiaoIHAHktYuLdt2IwIa6J8sJn5x
         qxfg==
X-Gm-Message-State: APjAAAXCsCyyYjekg9G58DmynEMkfTwr1VKwierVZgBQ2osouYUy6aLD
        bT96EWr4L++Ei/BfUnbZaK2clg==
X-Google-Smtp-Source: APXvYqxbTMEPmg4n9oNIpZHyLmp21Sp2dvJPnoo+1J59q3v0NVek1OR1AH8jXhKgG7Lx4ATWe0bCeg==
X-Received: by 2002:a63:e249:: with SMTP id y9mr15582281pgj.383.1573267358334;
        Fri, 08 Nov 2019 18:42:38 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id u20sm8436966pgo.50.2019.11.08.18.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2019 18:42:37 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>, agross@kernel.org
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Maxime Ripard <maxime@cerno.tech>,
        Vinod Koul <vkoul@kernel.org>,
        Anson Huang <Anson.Huang@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: defconfig: Enable Qualcomm SDM845 display and gpu clocks
Date:   Fri,  8 Nov 2019 18:42:34 -0800
Message-Id: <20191109024234.1757452-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the drivers for the display and gpu clock controllers on Qualcomm
SDM845, needed in order to get these features working. These drivers
provides power-domains and can as such not be compiled as modules.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7fa92defb964..7fd999be3de3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -726,6 +726,8 @@ CONFIG_MSM_MMCC_8996=y
 CONFIG_MSM_GCC_8998=y
 CONFIG_QCS_GCC_404=y
 CONFIG_SDM_GCC_845=y
+CONFIG_SDM_GPUCC_845=y
+CONFIG_SDM_DISPCC_845=y
 CONFIG_SM_GCC_8150=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
-- 
2.23.0

