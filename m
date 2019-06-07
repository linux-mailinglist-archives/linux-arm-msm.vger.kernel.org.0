Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65B1B3961E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2019 21:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730622AbfFGTpA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jun 2019 15:45:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:54036 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730326AbfFGTpA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jun 2019 15:45:00 -0400
Received: from localhost (107-207-74-175.lightspeed.austtx.sbcglobal.net [107.207.74.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 88CFE20868;
        Fri,  7 Jun 2019 19:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559936699;
        bh=n+3Sw/P9Edjb/WQZTIlVmNy5Vbg1PHkTk5IHHvvsEdw=;
        h=From:To:Cc:Subject:Date:From;
        b=keuDiN46VAX426027Ek7ZhfHrrLZ+7LmzFjuTfC9cmVWvXvnwLMzO5UNlHW2g4etB
         sULqXu0w1bwKfEKPKnBn6zQrKRN+KRgcznA5AAxxUe7aOKzAa/TUvFkTaHwp7Br4WP
         CJN/U/4GrtR6AnBf9K/sZr6aceSFkgWvEDXWRngc=
From:   Andy Gross <agross@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>, arm@kernel.org,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>
Subject: [PATCH] MAINTAINERS: Change QCOM repo location
Date:   Fri,  7 Jun 2019 14:44:51 -0500
Message-Id: <1559936691-15759-1-git-send-email-agross@kernel.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch updates the Qualcomm SoC repo to a new location.

Signed-off-by: Andy Gross <agross@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5cfbea4..de1e935 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2079,7 +2079,7 @@ F:	drivers/tty/serial/msm_serial.c
 F:	drivers/usb/dwc3/dwc3-qcom.c
 F:	include/dt-bindings/*/qcom*
 F:	include/linux/*/qcom*
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/agross/linux.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git
 
 ARM/RADISYS ENP2611 MACHINE SUPPORT
 M:	Lennert Buytenhek <kernel@wantstofly.org>
-- 
2.7.4

