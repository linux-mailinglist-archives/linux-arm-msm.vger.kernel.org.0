Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EBBE1DD1B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 17:27:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730047AbgEUP0H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 11:26:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:34156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730446AbgEUP0F (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 11:26:05 -0400
Received: from localhost.localdomain (unknown [157.51.235.56])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DAEEC20826;
        Thu, 21 May 2020 15:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590074765;
        bh=l53+POgG2ztf6peq2FqUJ2xZb2zARBP2r6LUsVpLW9Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rXU8ggtFUsbATpeNUwiRNtRiVd8DHoEB/GJcqIYTHyv8gP3v18u7I/59LWhGjMm3m
         EOoF/YIp0RaHiqJRkwymxZICADUwHPkr6gazZ50531iUvWu8ktFG6m2kvYFrRB9oGo
         N2+uEgF70khSokzs2Zko/+653WJDssgdIgOoaTWs=
From:   mani@kernel.org
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 02/14] bus: mhi: core: Cache intmod from mhi event to mhi channel
Date:   Thu, 21 May 2020 20:55:28 +0530
Message-Id: <20200521152540.17335-3-mani@kernel.org>
X-Mailer: git-send-email 2.26.GIT
In-Reply-To: <20200521152540.17335-1-mani@kernel.org>
References: <20200521152540.17335-1-mani@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Hemant Kumar <hemantk@codeaurora.org>

Driver is using zero initialized intmod value from mhi channel when
configuring TRE for bei field. This prevents interrupt moderation to
take effect in case it is supported by an event ring. Fix this by
copying intmod value from associated event ring to mhi channel upon
registering mhi controller.

Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index eb2ab058a01d..1a93d24efffc 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -863,6 +863,10 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 		mutex_init(&mhi_chan->mutex);
 		init_completion(&mhi_chan->completion);
 		rwlock_init(&mhi_chan->lock);
+
+		/* used in setting bei field of TRE */
+		mhi_event = &mhi_cntrl->mhi_event[mhi_chan->er_index];
+		mhi_chan->intmod = mhi_event->intmod;
 	}
 
 	if (mhi_cntrl->bounce_buf) {
-- 
2.26.GIT

