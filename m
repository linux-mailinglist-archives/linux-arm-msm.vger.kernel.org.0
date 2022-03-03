Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87A9B4CB5B0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 05:01:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbiCCECE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Mar 2022 23:02:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbiCCEB4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Mar 2022 23:01:56 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CEF115D383
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Mar 2022 20:01:11 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id u1so5760844wrg.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Mar 2022 20:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=46n4LaD4ZyMBoEv7QyqZkVx2QkFYWM4XtM2ZRYBTQAc=;
        b=ZNtoqbDUGtHmHijR08iUHerJBM6e4EL1UE8Eq/E/EqolAHaEGOh5zyme9Auu4DmJqD
         Eb+gmhfZcbr8s1Z9KkBuEWuCpEnappFyQIAehk3Fgn8OLXkfuthhSiNgX+EIJA1ogGWQ
         07heE7wok3mrewOnW1yXkixvQs8upXv/t2AhmY2ad9wwg8KeKnjM88eWFdyvuhO0JAZO
         4UGH5mJEafwQPsKDsDKd9dZP8rXOJUGDf/LP3Ob0aLkKUlA5vOO5Qci+gdGj+Bt7Ylh5
         dZHigZyIOk/Dye9wEfYabwB2hMCQkmvgXcVDgvqRCYqE6HHqtwG0fx7ahivp7s4jg+Jx
         EQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=46n4LaD4ZyMBoEv7QyqZkVx2QkFYWM4XtM2ZRYBTQAc=;
        b=v8uXLoh/+rfy9Pn+24u3xNW1wQDV9qOMkeWcxkqqtQgrYBvqdhjNRkFpGB/EeUP65s
         0M381xiz4qArAwC34ogcseo9HZ26iBq/mbeMH+xLDX7havIvsyFTBLe8ttFPklHTXrH0
         TpVrJRE4SNPQ9+EZQyWK59wccsObczOPgwg9KDkVKVAffE/kRI678iAVxn7U94Oj9N4e
         hFCDdC+Jtc3m5vW/BkWb6UoajHVsL/hCcXtj6X7hSGUbYVHdn33QaKtohO8AOGB2QuVX
         KsN1eYtAfzXAvNMwl52PUWDdwk4z7/zo2v9Grp0JFlfZPVd9w71B8dwX+llA5X2dudUj
         f9Zw==
X-Gm-Message-State: AOAM5308DsiAmm7VWJBneIdVlQSiTn+xnHiHQToArwR2ETEQDQfLNmz7
        G9WexKPLCi0lpkIWhDb01upsxkhA+R9XWQ==
X-Google-Smtp-Source: ABdhPJytykpDR6JjP/UzejuXDa93KOA+DH52lE2d0GGqd4g9/85jEFVIK+N6FhO6lxqwkUoXBEvC1g==
X-Received: by 2002:a5d:6485:0:b0:1ef:971b:367 with SMTP id o5-20020a5d6485000000b001ef971b0367mr14887918wri.318.1646280070049;
        Wed, 02 Mar 2022 20:01:10 -0800 (PST)
Received: from localhost.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id r16-20020a5d4e50000000b001f0075f4ca1sm702615wrt.105.2022.03.02.20.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 20:01:09 -0800 (PST)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     caleb.connolly@linaro.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     sumit.semwal@linaro.org, amit.pundir@linaro.org,
        john.stultz@linaro.org
Subject: [PATCH v9 1/9] spmi: add a helper to look up an SPMI device from a device node
Date:   Thu,  3 Mar 2022 04:00:27 +0000
Message-Id: <20220303040035.1454103-2-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303040035.1454103-1-caleb.connolly@linaro.org>
References: <20220303040035.1454103-1-caleb.connolly@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The helper function spmi_device_from_of() takes a device node and
returns the SPMI device associated with it.
This is like of_find_device_by_node but for SPMI devices.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 drivers/spmi/spmi.c  | 17 +++++++++++++++++
 include/linux/spmi.h |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/drivers/spmi/spmi.c b/drivers/spmi/spmi.c
index b37ead9e2fad..de550b777451 100644
--- a/drivers/spmi/spmi.c
+++ b/drivers/spmi/spmi.c
@@ -386,6 +386,23 @@ static struct bus_type spmi_bus_type = {
 	.uevent		= spmi_drv_uevent,
 };
 
+/**
+ * spmi_device_from_of() - get the associated SPMI device from a device node
+ *
+ * @np:		device node
+ *
+ * Returns the struct spmi_device associated with a device node or NULL.
+ */
+inline struct spmi_device *spmi_device_from_of(struct device_node *np)
+{
+	struct device *dev = bus_find_device_by_of_node(&spmi_bus_type, np);
+
+	if (dev)
+		return to_spmi_device(dev);
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(spmi_device_from_of);
+
 /**
  * spmi_controller_alloc() - Allocate a new SPMI device
  * @ctrl:	associated controller
diff --git a/include/linux/spmi.h b/include/linux/spmi.h
index 729bcbf9f5ad..6ee476bc1cd6 100644
--- a/include/linux/spmi.h
+++ b/include/linux/spmi.h
@@ -7,6 +7,7 @@
 #include <linux/types.h>
 #include <linux/device.h>
 #include <linux/mod_devicetable.h>
+#include <linux/of.h>
 
 /* Maximum slave identifier */
 #define SPMI_MAX_SLAVE_ID		16
@@ -164,6 +165,7 @@ static inline void spmi_driver_unregister(struct spmi_driver *sdrv)
 	module_driver(__spmi_driver, spmi_driver_register, \
 			spmi_driver_unregister)
 
+inline struct spmi_device *spmi_device_from_of(struct device_node *np);
 int spmi_register_read(struct spmi_device *sdev, u8 addr, u8 *buf);
 int spmi_ext_register_read(struct spmi_device *sdev, u8 addr, u8 *buf,
 			   size_t len);
-- 
2.35.1

