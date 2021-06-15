Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB7C03A78EA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jun 2021 10:18:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230329AbhFOIUE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Jun 2021 04:20:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:39000 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230190AbhFOIUD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Jun 2021 04:20:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C0C06140C;
        Tue, 15 Jun 2021 08:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623745079;
        bh=QXBL85FbY0a8NJQ3RmUlIY3b6HiBVhNJbrqlcLkJIdI=;
        h=From:To:Cc:Subject:Date:From;
        b=W8dmmBPMBMVKlL39DhzP26LMiX2dT9Ss/188rl6WwgK2ISv3S6ZVyp705IynCxJQ/
         xAroF5MPwrfBuauPAJ+S36vuwTpZ8KcNPbvIUL3dorK9AISSMrZ9QumyvPOqsO8v2d
         20Y7ngoDXy9SyeEZdbN59FDD4HolNG+glzs9THbvEPOC0bQEnhUqCqT0hjIxqPuJ45
         ZUqu9R8A3Xu4pcXmhMCKDq5GsdFZpRkO1jEJ/pjUBcdB1JwGcVxEhj+J652nvlmRJL
         h+qgKj4OEP2RU1WKSC/dYEjwEOn8Y9ndh8ww2TGqnY8rWLra0NHnSvppYqA6EyMPkv
         IONyiJo+Cwk+A==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: defconfig: Enable renesas usb xhci pci host controller
Date:   Tue, 15 Jun 2021 13:47:49 +0530
Message-Id: <20210615081749.3210344-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

96Boards RB3 has a USB XHCI PCI Renesas host controller. This controller
requires firmware to be loaded on its ROM/RAM, so enable the module
CONFIG_USB_XHCI_PCI_RENESAS. This depends on CONFIG_USB_XHCI_PCI so
enable that as well.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 05b8f350c084..992e1dd87a88 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -795,6 +795,8 @@ CONFIG_USB_CONN_GPIO=m
 CONFIG_USB=y
 CONFIG_USB_OTG=y
 CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_XHCI_PCI=m
+CONFIG_USB_XHCI_PCI_RENESAS=m
 CONFIG_USB_XHCI_TEGRA=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_EXYNOS=y
-- 
2.31.1

