Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3241C2165B0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2020 06:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbgGGE7B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jul 2020 00:59:01 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:57587 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726961AbgGGE7B (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jul 2020 00:59:01 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594097940; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=kUhlvX5z1O4iL5BZbmyHLAQK/NkvrRKZF2CvSmXuoOU=; b=DlofsovrUmFzdr8faq2zdRWTnQNfsoS/amOFUSfH7U397u6P4w722VNGolt5fQ09kAgP+ng5
 1vHMv5UoP2pifluooqUwMki8srrEHneIYdTyMJWGW+IXzsNKqI40StJ4ECsulB0Q3K+F+QW6
 hmCgdK/W0VP/3iiDGBgtJM1gtZI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n12.prod.us-east-1.postgun.com with SMTP id
 5f04010e1daed08ee0ac8ab9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 07 Jul 2020 04:58:54
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A6049C43391; Tue,  7 Jul 2020 04:58:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from kathirav-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E7F76C433C6;
        Tue,  7 Jul 2020 04:58:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E7F76C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kathirav@codeaurora.org
From:   Kathiravan T <kathirav@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     sivaprak@codeaurora.org, sricharan@codeaurora.org,
        Kathiravan T <kathirav@codeaurora.org>,
        Rajkumar Ayyasamy <arajkuma@codeaurora.org>
Subject: [PATCH] pinctrl: qcom: ipq8074: route gpio interrupts to APPS
Date:   Tue,  7 Jul 2020 10:28:35 +0530
Message-Id: <1594097915-26725-1-git-send-email-kathirav@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

set target proc as APPS to route the gpio interrupts to APPS

Signed-off-by: Rajkumar Ayyasamy <arajkuma@codeaurora.org>
Signed-off-by: Kathiravan T <kathirav@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-ipq8074.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-ipq8074.c b/drivers/pinctrl/qcom/pinctrl-ipq8074.c
index 0edd41c..aec68b1 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq8074.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq8074.c
@@ -50,6 +50,7 @@
 		.intr_enable_bit = 0,		\
 		.intr_status_bit = 0,		\
 		.intr_target_bit = 5,		\
+		.intr_target_kpss_val = 3,	\
 		.intr_raw_status_bit = 4,	\
 		.intr_polarity_bit = 1,		\
 		.intr_detection_bit = 2,	\
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

