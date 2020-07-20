Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EDD0225E69
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 14:21:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728656AbgGTMVq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 08:21:46 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:64228 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728564AbgGTMVq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 08:21:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595247705; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=GDx0nZdKB25CRIUyjKxQQDbAK/QAtU1kBJYtFizHoOM=; b=aKItUvUSuq+MWkjPydfPUWhmmMesn7k3vJQbnmj8mFeRWG70aSaGoiVgJ8Oo8BLqa/hFB7G7
 ZiZOmVJriOfuDnXKOlJ8UAma00ZjV6zP9UAwXfyIolfDhEACVV/GL/xHPYBmuryRzHxfaLgm
 KABxJeutLGQ6a8E6H7aVghDkXPY=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f158b89cf983e60a87591aa (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 20 Jul 2020 12:18:17
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E1450C433CB; Mon, 20 Jul 2020 12:18:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8710EC433C9;
        Mon, 20 Jul 2020 12:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8710EC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     robdclark@gmail.com, sean@poorly.run
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH] drm/msm/dpu: dev_pm_opp_put_clkname() only when an opp_table exists
Date:   Mon, 20 Jul 2020 17:47:56 +0530
Message-Id: <1595247476-12968-1-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Its possible that dpu_bind() fails early enough before
dev_pm_opp_set_clkname() is called. In such cases, unconditionally
calling dev_pm_opp_put_clkname() in dpu_unbind() can result in
a crash. Put an additional check so that dev_pm_opp_put_clkname()
is called only when an opp_table exists.

Fixes: aa3950767d05 ("drm/msm/dpu: Use OPP API to set clk/perf state")
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index f2bbce4..843a1c1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1079,7 +1079,8 @@ static void dpu_unbind(struct device *dev, struct device *master, void *data)
 
 	if (dpu_kms->has_opp_table)
 		dev_pm_opp_of_remove_table(dev);
-	dev_pm_opp_put_clkname(dpu_kms->opp_table);
+	if (dpu_kms->opp_table)
+		dev_pm_opp_put_clkname(dpu_kms->opp_table);
 }
 
 static const struct component_ops dpu_ops = {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

