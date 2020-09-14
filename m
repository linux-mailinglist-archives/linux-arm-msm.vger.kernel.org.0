Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D3F0268EB2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 16:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbgINO7P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 10:59:15 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:20394 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726744AbgINO64 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 10:58:56 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600095535; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=6B1eHivMPY/Y7JjheulizygZ7FR99YPUY1zmWLJj70I=; b=vx47B0OaeK9QjwmNR3hG87uy517wz+p2nRQTCuRaYphq6Xe5blM8OXQccwyAXL2e/rtGVsXu
 3LM+fpovYfxpouVdLdgdK7AXBq5CNVK2jPCWCfh+EoHtgbzcZxRiB0WQfd15hxfY7X2I7/Oy
 y5454kv4cq9UzIJ3qA+7/VaDO44=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f5f850c4ba82a82fd76569c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 14 Sep 2020 14:58:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AA676C433C8; Mon, 14 Sep 2020 14:58:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A8699C433F0;
        Mon, 14 Sep 2020 14:58:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A8699C433F0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, rishabhb@codeaurora.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, sidgup@codeaurora.org,
        stable@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH] soc: qcom: pdr: Fixup array type of get_domain_list_resp message
Date:   Mon, 14 Sep 2020 20:28:07 +0530
Message-Id: <20200914145807.1224-1-sibis@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The array type of get_domain_list_resp is incorrectly marked as NO_ARRAY.
Due to which the following error was observed when using pdr helpers with
the downstream proprietary pd-mapper. Fix this up by marking it as
VAR_LEN_ARRAY instead.

Err logs:
qmi_decode_struct_elem: Fault in decoding: dl(2), db(27), tl(160), i(1), el(1)
failed to decode incoming message
PDR: tms/servreg get domain list txn wait failed: -14
PDR: service lookup for tms/servreg failed: -14

Fixes: fbe639b44a82 ("soc: qcom: Introduce Protection Domain Restart helpers")
Reported-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/soc/qcom/pdr_internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pdr_internal.h b/drivers/soc/qcom/pdr_internal.h
index 15b5002e4127b..ab9ae8cdfa54c 100644
--- a/drivers/soc/qcom/pdr_internal.h
+++ b/drivers/soc/qcom/pdr_internal.h
@@ -185,7 +185,7 @@ struct qmi_elem_info servreg_get_domain_list_resp_ei[] = {
 		.data_type      = QMI_STRUCT,
 		.elem_len       = SERVREG_DOMAIN_LIST_LENGTH,
 		.elem_size      = sizeof(struct servreg_location_entry),
-		.array_type	= NO_ARRAY,
+		.array_type	= VAR_LEN_ARRAY,
 		.tlv_type       = 0x12,
 		.offset         = offsetof(struct servreg_get_domain_list_resp,
 					   domain_list),
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

