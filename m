Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71DE623B674
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Aug 2020 10:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729769AbgHDIJI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Aug 2020 04:09:08 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:50867 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729617AbgHDIJH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Aug 2020 04:09:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596528547; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=GZkjDkpKTKSPxQOn1C6nl629XIJ2Lx9Les5Owq+DC0A=; b=BltMmNYrrUP7ERfWzj3RmOsAh3ntmbl3cV++w0JHrX6ITeIvhPXj3rer1Q6leg0RjJLsDo9R
 7wfMw3SDaImnxfPms3Hq+y3lKoL1hpoIr5uFteAv7VzdKJXJwLv478HWG7/dfApqDtADJJRg
 1tfOu49C3q53UPytMgEUTHcrrfk=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n12.prod.us-west-2.postgun.com with SMTP id
 5f2917939fdcd87189b5b5a0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 04 Aug 2020 08:08:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 50FDFC433B2; Tue,  4 Aug 2020 08:08:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from rohkumar-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rohitkr)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 70AEAC433B2;
        Tue,  4 Aug 2020 08:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 70AEAC433B2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rohitkr@codeaurora.org
From:   Rohit kumar <rohitkr@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ajit Pandey <ajitp@codeaurora.org>,
        Rohit kumar <rohitkr@codeaurora.org>
Subject: [PATCH v5 08/12] include: dt-bindings: sound: Add sc7180-lpass bindings header
Date:   Tue,  4 Aug 2020 13:37:29 +0530
Message-Id: <1596528453-11437-9-git-send-email-rohitkr@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596528453-11437-1-git-send-email-rohitkr@codeaurora.org>
References: <1596528453-11437-1-git-send-email-rohitkr@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Ajit Pandey <ajitp@codeaurora.org>

Add header defining dai-id and mclk id for SC7180 lpass soc.

Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 include/dt-bindings/sound/sc7180-lpass.h | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 include/dt-bindings/sound/sc7180-lpass.h

diff --git a/include/dt-bindings/sound/sc7180-lpass.h b/include/dt-bindings/sound/sc7180-lpass.h
new file mode 100644
index 00000000..7d988f6
--- /dev/null
+++ b/include/dt-bindings/sound/sc7180-lpass.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __DT_SC7180_LPASS_H
+#define __DT_SC7180_LPASS_H
+
+#define MI2S_PRIMARY	0
+#define MI2S_SECONDARY	1
+
+#define LPASS_MCLK0	0
+
+#endif /* __DT_APQ8016_LPASS_H */
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

