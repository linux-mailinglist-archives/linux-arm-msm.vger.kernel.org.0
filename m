Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B961241D83
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 17:44:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728921AbgHKPmE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 11:42:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:47098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728833AbgHKPmD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 11:42:03 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 143122076C;
        Tue, 11 Aug 2020 15:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597160523;
        bh=f3IsrBPjFZW9O/OhedYFTCoSyKNKxk+e2qJfKxrclSM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ds4Q1Zd7NVKA53gL7slYLgHIpGrAYVrAgAc+g8r9GR0Mjja4mIkhVUgksyKSBZETP
         97tBmpLwhux40hpXbE+tAXNPyqfWuhstyuCNg5EiBWBOApld9P1d2eZMl/Oc7lVdK6
         JK11Rre9MJV6vPIyJTpwr/bMlUBaL1kmtoQyk7s4=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1k5WPZ-004bmI-6F; Tue, 11 Aug 2020 17:42:01 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 01/33] spmi: get rid of a warning when built with W=1
Date:   Tue, 11 Aug 2020 17:41:27 +0200
Message-Id: <816d187495f641c7819187d4c7d9b9d8c8b77325.1597160086.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597160086.git.mchehab+huawei@kernel.org>
References: <cover.1597160086.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SPMI core complaing with this warning when built with W=1:

	drivers/spmi/spmi.c: In function ‘spmi_controller_remove’:
	drivers/spmi/spmi.c:548:6: warning: variable ‘dummy’ set but not used [-Wunused-but-set-variable]
	  548 |  int dummy;
	      |      ^~~~~

As the dummy var isn't needed, remove it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/spmi/spmi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/spmi/spmi.c b/drivers/spmi/spmi.c
index c16b60f645a4..fd3ff6079b15 100644
--- a/drivers/spmi/spmi.c
+++ b/drivers/spmi/spmi.c
@@ -545,13 +545,10 @@ static int spmi_ctrl_remove_device(struct device *dev, void *data)
  */
 void spmi_controller_remove(struct spmi_controller *ctrl)
 {
-	int dummy;
-
 	if (!ctrl)
 		return;
 
-	dummy = device_for_each_child(&ctrl->dev, NULL,
-				      spmi_ctrl_remove_device);
+	device_for_each_child(&ctrl->dev, NULL, spmi_ctrl_remove_device);
 	device_del(&ctrl->dev);
 }
 EXPORT_SYMBOL_GPL(spmi_controller_remove);
-- 
2.26.2

