Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE5151B3618
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 06:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgDVET5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 00:19:57 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:38387 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725811AbgDVET4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 00:19:56 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587529196; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=kvpym/R0LUwgL8lADSrB9TScxJz6XxGUYe6UV96jMZQ=; b=KibRwLCvsPQpK5REEZhU1HIDrAYStoD/1c+vLNhN1EhfysMLkH7Na3HrPqDi9X/GBEmARRYi
 tu8c1qJIUa8Dd7/pMUYIuVMCUiY4nWMp3tQgFPonu+ALFtfoE1ZEF97rFG2j47yNWBO3sx7p
 G9yu5SVL1M7zZQnXnk7YT7Ejn2w=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9fc5e6.7fe203ca6538-smtp-out-n02;
 Wed, 22 Apr 2020 04:19:50 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 84D90C43637; Wed, 22 Apr 2020 04:19:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from bbhatt-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1B40DC433BA;
        Wed, 22 Apr 2020 04:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1B40DC433BA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Hemant Kumar <hemantk@codeaurora.org>
Subject: [PATCH v1 2/8] bus: mhi: core: Add range check for channel id received in event ring
Date:   Tue, 21 Apr 2020 21:19:29 -0700
Message-Id: <1587529175-27778-3-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1587529175-27778-1-git-send-email-bbhatt@codeaurora.org>
References: <1587529175-27778-1-git-send-email-bbhatt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Hemant Kumar <hemantk@codeaurora.org>

MHI data completion handler function reads channel id from event
ring element. Value is under the control of MHI devices and can be
any value between 0 and 255. In order to prevent out of bound access
add a bound check against the max channel supported by controller
and skip processing of that event ring element.

Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
---
 drivers/bus/mhi/core/main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 23154f1..ba8afa7 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -827,6 +827,9 @@ int mhi_process_data_event_ring(struct mhi_controller *mhi_cntrl,
 		enum mhi_pkt_type type = MHI_TRE_GET_EV_TYPE(local_rp);
 
 		chan = MHI_TRE_GET_EV_CHID(local_rp);
+		if (WARN_ON(chan >= mhi_cntrl->max_chan))
+			continue;
+
 		mhi_chan = &mhi_cntrl->mhi_chan[chan];
 
 		if (likely(type == MHI_PKT_TYPE_TX_EVENT)) {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
