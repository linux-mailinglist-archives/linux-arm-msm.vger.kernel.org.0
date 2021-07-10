Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E96583C33DC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jul 2021 11:14:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232516AbhGJJQd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Jul 2021 05:16:33 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:55764 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232462AbhGJJQa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Jul 2021 05:16:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625908426; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=SeIt2AyhrOJ6+9mj44/1M2oP6BRIxZyjZit7wZgwJMc=; b=f4Xpo5AlIhPnEx30JwoucnrEMIBcsI545Ywnnni68BO7he0pvc+/fz4J/yfNhkN6RpT16Dad
 xEPuCF13FU+LroRDa1u4LkCtGWWZuG61X4SYOGrTUkxKEN2t7td0YKV0dCv0UMCU5reJmdbk
 3/DEuz3Fabrp0xscP7U6Saotbxw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60e964b35d0d101e38942e47 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 10 Jul 2021 09:13:23
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A8A0EC43144; Sat, 10 Jul 2021 09:13:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AEFE7C4338A;
        Sat, 10 Jul 2021 09:13:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AEFE7C4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        frowand.list@gmail.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jackp@codeaurora.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v14 4/6] of: Add stub for of_add_property()
Date:   Sat, 10 Jul 2021 02:13:13 -0700
Message-Id: <1625908395-5498-5-git-send-email-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1625908395-5498-1-git-send-email-wcheng@codeaurora.org>
References: <1625908395-5498-1-git-send-email-wcheng@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If building with OF Kconfig disabled, this can lead to errors for
drivers utilizing of_add_property().  Add a stub for the add API, as
it exists for the remove variant as well, and to avoid compliation
issues.  Also, export this API so that it can be used by modules.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
---
 drivers/of/base.c  | 1 +
 include/linux/of.h | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 48e941f..5883d63 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1821,6 +1821,7 @@ int of_add_property(struct device_node *np, struct property *prop)
 
 	return rc;
 }
+EXPORT_SYMBOL_GPL(of_add_property);
 
 int __of_remove_property(struct device_node *np, struct property *prop)
 {
diff --git a/include/linux/of.h b/include/linux/of.h
index 9c2e71e..0e786b60 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -946,6 +946,11 @@ static inline int of_machine_is_compatible(const char *compat)
 	return 0;
 }
 
+static inline int of_add_property(struct device_node *np, struct property *prop)
+{
+	return 0;
+}
+
 static inline int of_remove_property(struct device_node *np, struct property *prop)
 {
 	return 0;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

