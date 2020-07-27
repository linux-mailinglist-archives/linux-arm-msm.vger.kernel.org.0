Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4DB22E7AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jul 2020 10:26:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbgG0I0s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jul 2020 04:26:48 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:39996 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726387AbgG0I0r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jul 2020 04:26:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595838407; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=kBkNocMKuKYfy5D9SSp5xG3xYJZjERRpJB7Zd5wVkQI=; b=rNbYao0Pff8zh5kg/DYUZyr44uDSsx3umX4+Bkd1c0tG98l5L3KQBe14U6/3KVNgol1R8DyX
 z5JkUnf1Y3lW7qTmNCcosk4K6a3Zajt+nnPixMzpryaBiDXwuipTDvhl9M0moHAlpmnTejnN
 CNiy6dFNSow6UWW2bgXNkY9/mSU=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-east-1.postgun.com with SMTP id
 5f1e8fa47186ea1ee140f212 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 27 Jul 2020 08:26:12
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D4684C43391; Mon, 27 Jul 2020 08:26:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from akashast-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akashast)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2CC0CC433C9;
        Mon, 27 Jul 2020 08:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2CC0CC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=akashast@codeaurora.org
From:   Akash Asthana <akashast@codeaurora.org>
To:     wsa@the-dreams.de
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, msavaliy@codeaurora.org,
        linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
        Akash Asthana <akashast@codeaurora.org>
Subject: [PATCH] MAINTAINERS: Update GENI I2C maintainers list
Date:   Mon, 27 Jul 2020 13:56:00 +0530
Message-Id: <1595838360-3242-1-git-send-email-akashast@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Alok Chauhan has moved out of GENI team, he no longer supports GENI I2C
driver, remove him from maintainer list.

Add Akash Asthana & Mukesh Savaliya as maintainers for GENI I2C drivers.

Signed-off-by: Akash Asthana <akashast@codeaurora.org>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 235ab38..d216344 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13845,7 +13845,8 @@ F:	drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
 F:	Documentation/devicetree/bindings/net/qcom,ethqos.txt
 
 QUALCOMM GENERIC INTERFACE I2C DRIVER
-M:	Alok Chauhan <alokc@codeaurora.org>
+M:	Akash Asthana <akashast@codeaurora.org>
+M:	Mukesh Savaliya <msavaliy@codeaurora.org>
 L:	linux-i2c@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Supported
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project

