Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76EED955DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2019 06:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729085AbfHTERB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Aug 2019 00:17:01 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44324 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728248AbfHTERB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Aug 2019 00:17:01 -0400
Received: by mail-pl1-f193.google.com with SMTP id t14so2037006plr.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Aug 2019 21:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=KbKypMZEMo628Sx98GbFT2Lyxp3a3o8vbOSGro2hqs8=;
        b=BbMcDsfdhYJbYQOF4+aYA+FByqe1YzCp/GVmlI4KBpJik0CSaiyOMnbGH8m3TiqELX
         s4cEulkc1aWYVE0YqhE3Zgn8RO2mrIJ+vTMekI/vxsli4czBtUJA3lrnGfjK48ncRyBt
         5eOTSVG8tSarLdTZM/Mgld7VoxpN0p+9jb10g+l8q2JiGwBzB32Sdx16m3FUCg1i3UK2
         cUQRM6vLlhJbXk9WlqsISZah7xFjoLA1LLtMlpOCejDe85h3kOtM8xqxR//2Bh44v+3o
         dB/g1IRRMS9DwDLj9NIF/NaKw+Y3XfLNEPXYCd8rLtmOlUsym/69sM9Iouv3xzrrND4S
         WsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KbKypMZEMo628Sx98GbFT2Lyxp3a3o8vbOSGro2hqs8=;
        b=PWydVA7SG0jc/iZPQU4ZZKpHXB1u1QvW7dBL6kko+jzY3AomHxqvF4cA/3dX7loet8
         m+S1kJLSXg99pmYeWn9eU6fSYgdydBAly/Md1bU+cUYlP8TTDbXSoB5CgCc+JUk+zUbP
         ULlWuuMRJ3urk4KHZ+DSf2M8/rnzMhtSPOdTR0QgDt0sF6fB3UcGo7XaZC5DwUv6yHn+
         Dyf0H8B5bxAiN4b5TeH7VfRFgaRGXzGzOgVv/FGTh0xZI3swhZ2IfRSj5oqb1vFrMOeg
         KUZkXc8IXWVJ3DACfplUsM90DCXd0RGT2rR5nvmEPxTr/meT0XrXU/swzVzQPvCnOlV4
         SMTw==
X-Gm-Message-State: APjAAAVxZI4xAR+RPb/fohGsE6e10KDiTd9VszNbWdGWAkDOEyT220ao
        QcqjC7jTZAklyqHKD0Tjpxo/Vw==
X-Google-Smtp-Source: APXvYqzpynUE9tTdOCXExz9bKNqsRxtU0Zbjd9lhUYl/ghqc72gIr293dR2Ts5fcabGAmXXs5bn+Eg==
X-Received: by 2002:a17:902:4401:: with SMTP id k1mr26180562pld.193.1566274620467;
        Mon, 19 Aug 2019 21:17:00 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j6sm35010849pje.11.2019.08.19.21.16.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2019 21:16:59 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] rpmsg: glink-smem: Name the edge based on parent remoteproc
Date:   Mon, 19 Aug 2019 21:16:56 -0700
Message-Id: <20190820041656.17197-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Naming the glink edge device on the parent of_node short name causes
collisions when multiple remoteproc instances with only different unit
address are described on the platform_bus in DeviceTree.

Base the edge's name on the parent remoteproc's name instead, to ensure
that it's unique.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/rpmsg/qcom_glink_smem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index 64a5ce324c7f..4238383d8685 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -201,7 +201,7 @@ struct qcom_glink *qcom_glink_smem_register(struct device *parent,
 	dev->parent = parent;
 	dev->of_node = node;
 	dev->release = qcom_glink_smem_release;
-	dev_set_name(dev, "%pOFn:%pOFn", node->parent, node);
+	dev_set_name(dev, "%s:%pOFn", dev_name(parent->parent), node);
 	ret = device_register(dev);
 	if (ret) {
 		pr_err("failed to register glink edge\n");
-- 
2.18.0

