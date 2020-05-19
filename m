Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D29681D992F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 16:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729194AbgESOPF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 10:15:05 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:29089 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729152AbgESOOx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 10:14:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589897692; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=CqQSKxvGZIIyXqq5Y0g5gU32rKyzBxletLltRvdygas=; b=PqXwkY8+1QRapY6LpPVlaJPT0mXct2hoWa2j3my70xV/WyiqVzuPER/K6oGHGnwm+58sSUUY
 t8Noxk5vIXQvk7XYKw8SLFaeANILedZYbUfiN6VsLc5ogiHd0QDKF8jin2lMvXIXg6n425lX
 DUdMnPkhFil7fIh0DAlV9KstlYg=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec3e9c9.7f460f3d33b0-smtp-out-n04;
 Tue, 19 May 2020 14:14:33 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 14DE3C433D2; Tue, 19 May 2020 14:14:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jhugo-perf-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C14D1C4478F;
        Tue, 19 May 2020 14:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C14D1C4478F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     arnd@arndb.de, gregkh@linuxfoundation.org
Cc:     manivannan.sadhasivam@linaro.org, bjorn.andersson@linaro.org,
        wufan@codeaurora.org, pratanan@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [RFC v2 PATCH 8/8] MAINTAINERS: Add entry for QAIC driver
Date:   Tue, 19 May 2020 08:14:05 -0600
Message-Id: <1589897645-17088-9-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1589897645-17088-1-git-send-email-jhugo@codeaurora.org>
References: <1589897645-17088-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add MAINTAINERS entry for the Qualcomm Cloud AI 100 driver.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 65c7cc9..e3d865b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13963,6 +13963,13 @@ F:	Documentation/devicetree/bindings/media/qcom,camss.txt
 F:	Documentation/media/v4l-drivers/qcom_camss.rst
 F:	drivers/media/platform/qcom/camss/
 
+QUALCOMM CLOUD AI 100 (QAIC) DRIVER
+M:	Jeffrey Hugo <jhugo@codeaurora.org>
+L:	linux-arm-msm@vger.kernel.org
+S:	Supported
+F:	drivers/misc/qaic/
+F:	include/uapi/misc/qaic.h
+
 QUALCOMM CORE POWER REDUCTION (CPR) AVS DRIVER
 M:	Niklas Cassel <nks@flawful.org>
 L:	linux-pm@vger.kernel.org
-- 
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
