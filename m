Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 757B63B9E57
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jul 2021 11:38:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231318AbhGBJkm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Jul 2021 05:40:42 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:40181 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230078AbhGBJkm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Jul 2021 05:40:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625218690; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=lAbp70qo+xW3/w/PYMrGGnEPyqTqehiTN92we3c+3Uk=; b=cHdylObprKcKKzRYxYOxcuajIGT+oihPlE/nShoFjlw/o0jpaS78I035Lui6cA8oIdRsazJc
 5vdNPuZr596Ns4VaQxkEWoQ60pvuRKgeWK7PcJFbXcTx9blo+L7QqMpjFwT9hhABW/VSqwbp
 D5VsFPMmopplqVi/bdgFpSbhDGo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60dede714ca9face34bdefa7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 02 Jul 2021 09:37:53
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8A3D3C43145; Fri,  2 Jul 2021 09:37:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 81D2EC4338A;
        Fri,  2 Jul 2021 09:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 81D2EC4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, balbi@kernel.org,
        gregkh@linuxfoundation.org, robh+dt@kernel.org,
        frowand.list@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jackp@codeaurora.org, fntoth@gmail.com,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v12 4/6] of: Add stub for of_add_property()
Date:   Fri,  2 Jul 2021 02:37:33 -0700
Message-Id: <1625218655-14180-5-git-send-email-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1625218655-14180-1-git-send-email-wcheng@codeaurora.org>
References: <1625218655-14180-1-git-send-email-wcheng@codeaurora.org>
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
index d8db8d3..abd39a4 100644
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

