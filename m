Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF6002D495D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Dec 2020 19:47:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732957AbgLISqD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Dec 2020 13:46:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:43088 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729345AbgLISqD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Dec 2020 13:46:03 -0500
Subject: patch "MAINTAINERS: Mark SPMI as maintained" added to char-misc-testing
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1607539522;
        bh=7RWjmLe35oAUHxIqSleqn+HJutJRWlGJVfuOGMZ5BxA=;
        h=To:From:Date:From;
        b=NX2LlvEVFHtJbpUCGmxckFZqE3PbDJY3Xgd1ddOfMWmv9w2irYEIzNWiWpydjvbGG
         vo5JiELDQr5/XL0kf4h/sMN/+IM29RypcisLpNTDhi7ogS5WXnpEe8aDQDaPL7egwU
         JPpW/N/HJt8Xx3/Fr+Za4oAa40SpCF1HKAJzGMtI=
To:     sboyd@kernel.org, gregkh@linuxfoundation.org,
        linux-arm-msm@vger.kernel.org
From:   <gregkh@linuxfoundation.org>
Date:   Wed, 09 Dec 2020 19:46:38 +0100
Message-ID: <160753959880121@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


This is a note to let you know that I've just added the patch titled

    MAINTAINERS: Mark SPMI as maintained

to my char-misc git tree which can be found at
    git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git
in the char-misc-testing branch.

The patch will show up in the next release of the linux-next tree
(usually sometime within the next 24 hours during the week.)

The patch will be merged to the char-misc-next branch sometime soon,
after it passes testing, and the merge window is open.

If you have any questions about this process, please let me know.


From aec273a3191e2931e7010dd7b83cd110c21bcc03 Mon Sep 17 00:00:00 2001
From: Stephen Boyd <sboyd@kernel.org>
Date: Mon, 7 Dec 2020 13:42:04 -0800
Subject: MAINTAINERS: Mark SPMI as maintained

I can do more than just review patches here. The plan is to pick up
patches from the list and shuttle them up to gregkh. The korg tree will
be used to hold the pending patches. Move the list away from
linux-arm-msm to just be linux-kernel as SPMI isn't msm specific
anymore.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: <linux-arm-msm@vger.kernel.org>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
Link: https://lore.kernel.org/r/20201207214204.1284946-1-sboyd@kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 MAINTAINERS | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f3d86f1ea6cb..15840f98e55a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16525,8 +16525,10 @@ F:	Documentation/networking/device_drivers/ethernet/toshiba/spider_net.rst
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
2.29.2


