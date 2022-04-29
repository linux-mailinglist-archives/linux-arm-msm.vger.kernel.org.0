Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 237F7515813
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Apr 2022 00:12:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381369AbiD2WOY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 18:14:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381351AbiD2WOS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 18:14:18 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 514CEDC982
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 15:10:57 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id j15so12450208wrb.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 15:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ikgHs40vdBUX8T0eyysqTVem5s1bu/qxES/4SSz3DNk=;
        b=phvnE3uuj71Cx4MfMQR329J9omgFRW2pVTQVHm9CCot1WDveqako6/8YF33c2oeI5G
         l49zQM/n/8dF4BkwbwBKyqMp71O2ua+UIHWeisu43F4MqJx9e1ipYqkFKm14Q6SesF3q
         hSZcklg4D2GnIhutRxPv+l30SbeXix8z6EH0ZkogyKWtG73jlbqUpgTodotaBSi/TNHg
         EbNqJauniXYeJkZXng3AZY+LCP7thliG4YgvUqYCaiDs1Ad25YkBfJ5yrEomoh0diBXe
         sRjA9O1ioH4j5rVwim5Z1EPX3NvQt1Evj+ns/W0VX5/B/RrfcgQ4Dngc7BTnShPCZYe5
         txcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ikgHs40vdBUX8T0eyysqTVem5s1bu/qxES/4SSz3DNk=;
        b=OJ50ZZZ1q3vdCFbPBkFS5QCUNAyIav6aPul86IB/YI7XTPi3oFtNtK6OelXwPq5P5h
         4MPgRH8WHrIddhOw/zOOqThPb/kLgD8axnFsHR9ZZgFTloNj9SnjRnpuek86/stzeTj2
         P4u67Xh2CgTBqerHbLSQlbyBSKAr68BHYiUUyLqtVkxyhKLj6FC0RGSARiBUlTEgCjU+
         iv5fQDPawH5mg3JIOdXsIRTbTvz9d0CrSNyCmNAWOmtOU4g1XvNtlR6IDuYJOtl1NrZe
         6tcWlZDsMTo7rSDQ1IrTrtV9xdRjPCm0xWJBN0UDRdThqO6rw1wDLVNBu8T91HrCYtKe
         0jBg==
X-Gm-Message-State: AOAM533SMgiYd1EJ4zYbozN6PlGXwVUDKoVNb+J14idJRmU5LgQloNsc
        Igp0u2N9gsuY5mDwZ84JQMJbag==
X-Google-Smtp-Source: ABdhPJycxWn5Z8i9P1Zn1Bl3nw/XXanJkDBFJ8LjPD0SwERXX6ik4ye/MlGtnyDq/xmgt4CAkh3ycw==
X-Received: by 2002:a5d:444f:0:b0:20a:cd55:8c32 with SMTP id x15-20020a5d444f000000b0020acd558c32mr854156wrr.586.1651270255783;
        Fri, 29 Apr 2022 15:10:55 -0700 (PDT)
Received: from localhost.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id q7-20020a1cf307000000b003942a244ebfsm291985wmq.4.2022.04.29.15.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 15:10:55 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     caleb.connolly@linaro.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Jami Kettunen <jami.kettunen@somainline.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH v14 01/10] spmi: add a helper to look up an SPMI device from a device node
Date:   Fri, 29 Apr 2022 23:08:56 +0100
Message-Id: <20220429220904.137297-2-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220429220904.137297-1-caleb.connolly@linaro.org>
References: <20220429220904.137297-1-caleb.connolly@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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
 include/linux/spmi.h |  3 +++
 2 files changed, 20 insertions(+)

diff --git a/drivers/spmi/spmi.c b/drivers/spmi/spmi.c
index b37ead9e2fad..a456ce5141e1 100644
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
+struct spmi_device *spmi_device_from_of(struct device_node *np)
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
index 729bcbf9f5ad..eac1956a8727 100644
--- a/include/linux/spmi.h
+++ b/include/linux/spmi.h
@@ -164,6 +164,9 @@ static inline void spmi_driver_unregister(struct spmi_driver *sdrv)
 	module_driver(__spmi_driver, spmi_driver_register, \
 			spmi_driver_unregister)
 
+struct device_node;
+
+struct spmi_device *spmi_device_from_of(struct device_node *np);
 int spmi_register_read(struct spmi_device *sdev, u8 addr, u8 *buf);
 int spmi_ext_register_read(struct spmi_device *sdev, u8 addr, u8 *buf,
 			   size_t len);
-- 
2.36.0

