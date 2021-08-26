Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF7E73F8C3F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 18:33:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242049AbhHZQdz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 12:33:55 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:37258 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230200AbhHZQdy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 12:33:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1629995586; x=1661531586;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4vBxNrHrvW9Eol+s7Y1qFpDHC52cDYqjzJmQoqrhhlU=;
  b=m/V6c/R5lNAGVxrUHtNTkPcVjFcqp5145T2zZ2dHIM64rVrykOJl+5LL
   WK7f5U1LbFbZFGfQhHaFX47j/WoZ+KbJT+i0LiPpPBXUOTcu/5tb3T/E4
   ybLXW8u6AdIILiVjfekW3ORe+4tGCg6zg3TKlJj1kmI2zLjMyAw/0b0jk
   I=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 26 Aug 2021 09:33:06 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2021 09:33:06 -0700
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 26 Aug 2021 09:33:05 -0700
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
To:     <mani@kernel.org>, <hemantk@codeaurora.org>,
        <bbhatt@codeaurora.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Pranjal Ramajor Asha Kanojiya" <quic_pkanojiy@quicinc.com>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH] bus: mhi: core: Update comments on mhi_prepare_for_power_up
Date:   Thu, 26 Aug 2021 10:32:55 -0600
Message-ID: <1629995575-32389-1-git-send-email-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>

After "bus: mhi: core: Remove pre_init flag used for power purposes"
mhi_prepare_for_power_up() is no longer an optional API. All users
of MHI should call this API before power up sequence to initialize
MHI context. Update the comments on this API to make this clear.

Fixes: eee87072e2fb ("bus: mhi: core: Remove pre_init flag used for power purposes")
Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
---
 include/linux/mhi.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 56e7934..483b852 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -617,10 +617,8 @@ int mhi_get_free_desc_count(struct mhi_device *mhi_dev,
 
 /**
  * mhi_prepare_for_power_up - Do pre-initialization before power up.
- *                            This is optional, call this before power up if
- *                            the controller does not want bus framework to
- *                            automatically free any allocated memory during
- *                            shutdown process.
+ *                            Call this before MHI power up sequence to
+ *                            initialize MHI context.
  * @mhi_cntrl: MHI controller
  */
 int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl);
-- 
2.7.4

