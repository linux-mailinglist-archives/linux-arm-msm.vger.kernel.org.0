Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04D512D50E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 03:37:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728808AbgLJCeh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Dec 2020 21:34:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:40152 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728772AbgLJCe0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Dec 2020 21:34:26 -0500
From:   Stephen Boyd <sboyd@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 4/4] MAINTAINERS: Mark SPMI as maintained
Date:   Wed,  9 Dec 2020 18:33:44 -0800
Message-Id: <20201210023344.2838141-5-sboyd@kernel.org>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
In-Reply-To: <20201210023344.2838141-1-sboyd@kernel.org>
References: <20201210023344.2838141-1-sboyd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I can do more than just review patches here. The plan is to pick up
patches from the list and shuttle them up to gregkh. The korg tree will
be used to hold the pending patches. Move the list away from
linux-arm-msm to just be linux-kernel as SPMI isn't msm specific
anymore.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: <linux-arm-msm@vger.kernel.org>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Link: https://lore.kernel.org/r/20201207214204.1284946-1-sboyd@kernel.org
---
 MAINTAINERS | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e73636b75f29..a8b02bb842c4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16533,8 +16533,10 @@ F:	Documentation/networking/device_drivers/ethernet/toshiba/spider_net.rst
 F:	drivers/net/ethernet/toshiba/spider_net*
 
 SPMI SUBSYSTEM
-R:	Stephen Boyd <sboyd@kernel.org>
-L:	linux-arm-msm@vger.kernel.org
+M:	Stephen Boyd <sboyd@kernel.org>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git
 F:	Documentation/devicetree/bindings/spmi/
 F:	drivers/spmi/
 F:	include/dt-bindings/spmi/spmi.h
-- 
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/
https://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git

