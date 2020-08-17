Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9725F245C84
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Aug 2020 08:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbgHQGbf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 02:31:35 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:17694 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726761AbgHQGbc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 02:31:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597645891; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=dxlcaa77DIjQ4l0a22lKh1DZtZt1EuLXw5TsUtc6bIs=; b=iQLWrqTJBZ/7QaZT9p0H9/RhNh5hGgPuggVpV5pX9Zmv5KghZORz8BZ0JxIWfrBbONfHxBJ6
 q7WMPy0sQdlegLNg5SDaZ+/63cDqaM2yXNRrz5Npo35JIPPpGbb9v5k4kvypao2DxSTrBNUi
 fWMooh1Nqj59bn5zJH3kjEkGzXw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-west-2.postgun.com with SMTP id
 5f3a24111e4d3989d49234da (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 17 Aug 2020 06:30:41
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 91105C43391; Mon, 17 Aug 2020 06:30:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from kathirav-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5A5B9C433CB;
        Mon, 17 Aug 2020 06:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5A5B9C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kathirav@codeaurora.org
From:   Kathiravan T <kathirav@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kathirav@codeaurora.org
Subject: [PATCH] soc: qcom: socinfo: add soc id for IPQ6018
Date:   Mon, 17 Aug 2020 12:00:30 +0530
Message-Id: <1597645830-30409-1-git-send-email-kathirav@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the SoC ID for IPQ6018 variant.

Signed-off-by: Kathiravan T <kathirav@codeaurora.org>
---
[V2]:
	- Rebased on v5.9-rc1

 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index e19102f46302..2b28667e1c66 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -223,6 +223,7 @@ static const struct soc_id soc_id[] = {
 	{ 321, "SDM845" },
 	{ 341, "SDA845" },
 	{ 356, "SM8250" },
+	{ 402, "IPQ6018" },
 };
 
 static const char *socinfo_machine(struct device *dev, unsigned int id)
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

