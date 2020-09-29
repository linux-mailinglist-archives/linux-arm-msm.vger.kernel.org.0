Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0BE527BD05
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 08:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725468AbgI2GWT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Sep 2020 02:22:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:50188 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725372AbgI2GWS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Sep 2020 02:22:18 -0400
Received: from mail.kernel.org (ip5f5ad5bc.dynamic.kabel-deutschland.de [95.90.213.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4C71A21548;
        Tue, 29 Sep 2020 06:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601360538;
        bh=ZyVD1XdHFaVROkIdHCFvck0teGNr3aa8T76cc65QcKo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UO3PHmq/wo8xkzxywzEmE2oZjUaE/tlIQhAtd1XWhAvZeKLxSj++ngo8z8huEhSI6
         x74WJl07HnMdBgL+90IhbquahJcIO18EkJBJFx52gXEQmlGrbO2GS18C/ww3I7Vzne
         wLpfdX0W2NVThZsp2yKU6AqaekZX4IUel5+OAVoo=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kN91j-000cE3-Ko; Tue, 29 Sep 2020 08:22:15 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "John Stultz" <john.stultz@linaro.org>,
        "Manivannan Sadhasivam" <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] spmi: get rid of a warning when built with W=1
Date:   Tue, 29 Sep 2020 08:22:12 +0200
Message-Id: <aacfd03835b7d1b3b6c21665b44000fe7242e535.1601360391.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601360391.git.mchehab+huawei@kernel.org>
References: <cover.1601360391.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SPMI core complaing with this warning when built with W=1:

	drivers/spmi/spmi.c: In function ‘spmi_controller_remove’:
	drivers/spmi/spmi.c:548:6: warning: variable ‘dummy’ set but not used [-Wunused-but-set-variable]
	  548 |  int dummy;
	      |      ^~~~~

As the dummy var isn't needed, remove it.

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
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

