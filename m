Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C79301C2242
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 May 2020 04:32:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbgEBCcR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 May 2020 22:32:17 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:39466 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726387AbgEBCcR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 May 2020 22:32:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588386736; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=uwn3sf1R+WinNwzxuo81Cpfw/F/0rxWpPsO/s/OplK4=; b=puxq24A8wxBsqdRWHnJqod/D6+RN6emR1XeVKKeAVF5nkyKp3oe3q3giGhuBleQE11IHh6IQ
 Ky7m8n9XgkM6luMjnsdb+n+lRITkMqNXuaFCD/iTEDQfigjff9OdAv28oHpihWRvXWXitL5E
 gvxq6IdpyjbQ66s1gjMRp4AftE4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eacdbb0.7fc837925c38-smtp-out-n03;
 Sat, 02 May 2020 02:32:16 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1CE59C433BA; Sat,  2 May 2020 02:32:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from bbhatt-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 520ABC44791;
        Sat,  2 May 2020 02:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 520ABC44791
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     mani@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hemantk@codeaurora.org, jhugo@codeaurora.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v4 4/8] bus: mhi: core: Read transfer length from an event properly
Date:   Fri,  1 May 2020 19:32:01 -0700
Message-Id: <1588386725-1165-5-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1588386725-1165-1-git-send-email-bbhatt@codeaurora.org>
References: <1588386725-1165-1-git-send-email-bbhatt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Hemant Kumar <hemantk@codeaurora.org>

When MHI Driver receives an EOT event, it reads xfer_len from the
event in the last TRE. The value is under control of the MHI device
and never validated by Host MHI driver. The value should never be
larger than the real size of the buffer but a malicious device can
set the value 0xFFFF as maximum. This causes driver to memory
overflow (both read or write). Fix this issue by reading minimum of
transfer length from event and the buffer length provided.

Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/main.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index e60ab21..159732e 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -514,7 +514,10 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
 				mhi_cntrl->unmap_single(mhi_cntrl, buf_info);
 
 			result.buf_addr = buf_info->cb_buf;
-			result.bytes_xferd = xfer_len;
+
+			/* truncate to buf len if xfer_len is larger */
+			result.bytes_xferd =
+				min_t(u16, xfer_len, buf_info->len);
 			mhi_del_ring_element(mhi_cntrl, buf_ring);
 			mhi_del_ring_element(mhi_cntrl, tre_ring);
 			local_rp = tre_ring->rp;
@@ -598,7 +601,9 @@ static int parse_rsc_event(struct mhi_controller *mhi_cntrl,
 
 	result.transaction_status = (ev_code == MHI_EV_CC_OVERFLOW) ?
 		-EOVERFLOW : 0;
-	result.bytes_xferd = xfer_len;
+
+	/* truncate to buf len if xfer_len is larger */
+	result.bytes_xferd = min_t(u16, xfer_len, buf_info->len);
 	result.buf_addr = buf_info->cb_buf;
 	result.dir = mhi_chan->dir;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
