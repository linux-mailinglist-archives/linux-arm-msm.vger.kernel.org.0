Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2C1524294B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Aug 2020 14:29:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727808AbgHLM3W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Aug 2020 08:29:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:47652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726722AbgHLM3W (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Aug 2020 08:29:22 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CAEF3207DA;
        Wed, 12 Aug 2020 12:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597235362;
        bh=f3IsrBPjFZW9O/OhedYFTCoSyKNKxk+e2qJfKxrclSM=;
        h=From:To:Cc:Subject:Date:From;
        b=rNUF20X3nWg8kV4+NxvAKd+oCVMq6ffq/OhRQKtqqJiNfGaiM8Hdmx8fg6CwQjsBL
         WVDFozhoWymmDysCBdVSGi0SEsvYwp60v2Gi0p/JHZ1yBKDCqUUJqulFH7B+Qp6dIz
         7ue0qX2z4MgEu40CsS0I3IokL/gXWxg2T6kP2j7Q=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1k5psd-005f7j-MJ; Wed, 12 Aug 2020 14:29:19 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] spmi: get rid of a warning when built with W=1
Date:   Wed, 12 Aug 2020 14:29:18 +0200
Message-Id: <b7c07d7476697145bbd685d11a57b40d222f2c50.1597235356.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
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

