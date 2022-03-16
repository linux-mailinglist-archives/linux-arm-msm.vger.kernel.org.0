Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01DD64DB319
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Mar 2022 15:24:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343575AbiCPOZn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Mar 2022 10:25:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357987AbiCPOZE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Mar 2022 10:25:04 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4AEF2A252
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 07:23:46 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id gb39so4575408ejc.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Mar 2022 07:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9odFb1lebTlJ8kEafI46I2InRLxGgcRnodujuq66jtI=;
        b=NVg49xISeaIdHsW12WmT8fphYo14PkoLtsQ9FsPIm2MoO0UuFMYusKGT7EpL9GBdzz
         M1scxjk9dbQgzj28eYHQofRN1MOq3IRpWH1z56Uvs8K4Omndx/6isp8aLzlbMJYUhsIB
         5bRNg7jIXzz0jjpbyTmu+FE0duPfzpsJkGrjdDaltU20akkXpO2MypIp/Iq/Dr3GYk1x
         57qvCKaFXbdG3OfXZHvZlFlQRd8P5eMAb5p4OD69isKFTPyTqrDndOSDAzeSdw/xa2ea
         /adScgIlpgXcOgvqFUeQcJCGPWnOE5lRGmTxLrkQcxDapE9KFnop4VRyxWXdDhXINh//
         GTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9odFb1lebTlJ8kEafI46I2InRLxGgcRnodujuq66jtI=;
        b=FYHcFMqBmeS/9/9ukba61bFDLdsJxIJcHJ9BwWOweDT52FCbH9MgGOHYHhJhXx9fRR
         UdDlxFxgg0qb9SjgQW04Ddz36lBUPiJIb76g1Y52GaWTnME/EHu6m3T5+MEqvyHJQ9Jp
         AI9yna70NnXRutnisFEM4u4uySADMPC8E1ehYFsmVED7A1mZGB/HcowijfjHus0YTwWr
         LhRuCxEGmTREf+blW/4KRDluNltmDshWwUGCvbXb6U67PgR6XPfPkh/sXiqFqJqAQ7pm
         w4CcLhNBD9b1EUrpKRWV7O86ZX3+efP7Ey1nP9HCNegl5AmqQM+SDc+VOg/eHA5Cc5nN
         FVnQ==
X-Gm-Message-State: AOAM533rPdz7tiN5bC9gVRkzrvm0wqqceuQteK0H1i7P8uyQjqvXpeMs
        VlGDozGB4OSXQUhs/tham80FgQ==
X-Google-Smtp-Source: ABdhPJzMoa1ifsf3IMCU4pbqugVNEvxHpQaGKa8RrWA0RHicbMkgAvd6+lbqZBk4h9An4EW0l/bN0Q==
X-Received: by 2002:a17:907:94ca:b0:6da:e637:fa42 with SMTP id dn10-20020a17090794ca00b006dae637fa42mr158407ejc.347.1647440625205;
        Wed, 16 Mar 2022 07:23:45 -0700 (PDT)
Received: from localhost.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id kw3-20020a170907770300b006b2511ea97dsm952263ejc.42.2022.03.16.07.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 07:23:44 -0700 (PDT)
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
Subject: [PATCH v12 1/9] spmi: add a helper to look up an SPMI device from a device node
Date:   Wed, 16 Mar 2022 14:23:05 +0000
Message-Id: <20220316142313.92371-2-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316142313.92371-1-caleb.connolly@linaro.org>
References: <20220316142313.92371-1-caleb.connolly@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
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
2.35.1

