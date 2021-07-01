Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A98D3B96C9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jul 2021 21:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233631AbhGAT6V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jul 2021 15:58:21 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:12310 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233478AbhGAT6V (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jul 2021 15:58:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625169350; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=IFO/oYyamqXRdI1X1THDxfCEsA8fh8UxV4ofirhtpNI=; b=b/4Gh89rz32HQAknO6dgFpmhELIcbaYQQvwv/gKbCWcGwCJaWzUup5sfP4Xy9LcCxauxuTkq
 o/Xxv855FIbprx18DuzUV6h9ktujJ9EIyukTBEbHGx7yMdSAJPJcg1/ONZN6me+FD+sh4oJW
 6dR3yQmd4I8rS72MeCpzlgbXuEA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60de1dc5ad0600eedea5f838 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 01 Jul 2021 19:55:49
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 31A9EC43217; Thu,  1 Jul 2021 19:55:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1D2C2C433D3;
        Thu,  1 Jul 2021 19:55:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1D2C2C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        linux-kernel@vger.kernel.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH] bus: mhi: core: Use mhi_soc_reset() API instead of register write
Date:   Thu,  1 Jul 2021 12:55:38 -0700
Message-Id: <1625169338-32026-1-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently, register writes are used when ramdump collection in
panic path occurs. Replace that with new mhi_soc_reset() API such
that a controller defined reset() function is exercised if one is
present and the regular SOC reset is done if it is not.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/boot.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index 8100cf5..10a91df 100644
--- a/drivers/bus/mhi/core/boot.c
+++ b/drivers/bus/mhi/core/boot.c
@@ -112,9 +112,7 @@ static int __mhi_download_rddm_in_panic(struct mhi_controller *mhi_cntrl)
 			/* Hardware reset so force device to enter RDDM */
 			dev_dbg(dev,
 				"Did not enter RDDM, do a host req reset\n");
-			mhi_write_reg(mhi_cntrl, mhi_cntrl->regs,
-				      MHI_SOC_RESET_REQ_OFFSET,
-				      MHI_SOC_RESET_REQ);
+			mhi_soc_reset(mhi_cntrl);
 			udelay(delayus);
 		}
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

