Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A61415F5BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2020 19:40:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388900AbgBNSij (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Feb 2020 13:38:39 -0500
Received: from mail.z3ntu.xyz ([128.199.32.197]:49046 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388660AbgBNSij (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Feb 2020 13:38:39 -0500
X-Greylist: delayed 381 seconds by postgrey-1.27 at vger.kernel.org; Fri, 14 Feb 2020 13:38:38 EST
Received: from localhost.localdomain (80-110-126-226.cgn.dynamic.surfer.at [80.110.126.226])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 9C714C1FE9;
        Fri, 14 Feb 2020 18:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1581705136; bh=UiqpIIbkbNmB5wRq46BoxgcEeQU9um7uzDZLMQ7F7a4=;
        h=From:To:Cc:Subject:Date;
        b=Bnc5+8xdmKl4YtiCnfMs/5Gt8uj7Tg4pt2PA2oqWACud5uinye6f0EPHY8nhWcdAM
         jIwOdXpLTHLYXPhIP3BQ1Np1XyNWoh8UfTjdAdn01vdzWRd7oMQtrxsnB/WT924LzH
         w4thPaHAcOazAB2wOPn87XmNWAFNbUCZj0dj/sTw=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-kernel@lists.infradead.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>,
        Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        =?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] ARM: qcom_defconfig: Enable QRTR
Date:   Fri, 14 Feb 2020 19:31:11 +0100
Message-Id: <20200214183111.50919-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This option is useful on msm8974, so enable it.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
Changes from v1:
- set options as =m instead of =y

 arch/arm/configs/qcom_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index ad3417a63cdf..4702feef2cc9 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -44,6 +44,8 @@ CONFIG_IP_ROUTE_VERBOSE=y
 CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
 # CONFIG_IPV6 is not set
+CONFIG_QRTR=m
+CONFIG_QRTR_SMD=m
 CONFIG_CFG80211=m
 CONFIG_MAC80211=m
 CONFIG_RFKILL=y
-- 
2.25.0

