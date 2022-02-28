Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 441534C6D1C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Feb 2022 13:47:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236617AbiB1Mse (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 07:48:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236802AbiB1MrV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 07:47:21 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A29477A8F
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 04:46:26 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id b8so11015233pjb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 04:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QFXLiL0cwfTscTFGdegC8jG7wPHkkmACZCaIlJcMC4g=;
        b=uzElxq1Co02OjZSETgAp4AlzySZjyNblnTFSlL6ekEy2Jd+SYgQjYwySYZULAQ7q2x
         8ZiFV6Cy+0OSBZnvRjTjOKqS7pEykVqaaj4UyeRYCEsn38pCIU/up2IWhy7HVzLPiPn3
         EPCp/22b8zYfInCnTEp8RFODkrUhClj3vhG0XN73OSdiYlKYdjbZlTljavaUez3WwyQa
         WIb4pfGWNRgOU23cpCL5KI6wV94q1UvV98RP7k2QkvvYRlWDxa3KmvXFCUU3/l3U4ALX
         EPZJGDY4CVabi3WzRpEopru76oAs5ypeAU/527dDy0DnyXcJh/YlCZNHEiLtDGOR2Fbn
         oSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QFXLiL0cwfTscTFGdegC8jG7wPHkkmACZCaIlJcMC4g=;
        b=pIdmB7GXmLzDYQrE6gA261u7aUv7Q6F0YV+AP1UXMYzqBH+E4fPWuCf1f6eCqugaAw
         OGykJEW4BiRL0kWi5QcJG5HGuOkrpg6+UMk+b9bActJIxRd3jpchl+H9qaQLes0+vZvQ
         wXhxcdDRs9c6cCao7uPLlhJDmjUmTJ9UINZFwJnv12bJp0tYY91BSk+Ka7uOjIBUm+8p
         5NB78XKbdBBMuPKSYXr8SGgN/tab87E16jonp4FgvIEZcL1c0Aa4RssMYA8wEnROLg3C
         kw7DzlS0+/hk5Exma5bEccziXd4DPWR5cj0dFK9lM5gP3IR9SnwfMHp0QmeXmPf2coxV
         T0fQ==
X-Gm-Message-State: AOAM533ItQYoO7qWTylYir9bE59tIQbLW4lZRWfKPBBICPbR7iOomfou
        4h/y/Cx0xT4Zq+K6HzVWANuU
X-Google-Smtp-Source: ABdhPJz/l4Rjc3SB1CTovpEU0dkPgKs8YNHZfoD96r0SBLyth0Gw6PheAT7YlRKYUk769a7WkNkUSQ==
X-Received: by 2002:a17:90a:241:b0:1bc:1def:a8c5 with SMTP id t1-20020a17090a024100b001bc1defa8c5mr16469088pje.105.1646052382269;
        Mon, 28 Feb 2022 04:46:22 -0800 (PST)
Received: from localhost.localdomain ([117.207.25.37])
        by smtp.gmail.com with ESMTPSA id y12-20020a056a00190c00b004f39e28fb87sm14256737pfi.98.2022.02.28.04.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 04:46:21 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev
Cc:     quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
        quic_jhugo@quicinc.com, vinod.koul@linaro.org,
        bjorn.andersson@linaro.org, dmitry.baryshkov@linaro.org,
        quic_vbadigan@quicinc.com, quic_cang@quicinc.com,
        quic_skananth@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, elder@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 27/27] bus: mhi: ep: Add uevent support for module autoloading
Date:   Mon, 28 Feb 2022 18:13:44 +0530
Message-Id: <20220228124344.77359-28-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228124344.77359-1-manivannan.sadhasivam@linaro.org>
References: <20220228124344.77359-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add uevent support to MHI endpoint bus so that the client drivers can be
autoloaded by udev when the MHI endpoint devices gets created. The client
drivers are expected to provide MODULE_DEVICE_TABLE with the MHI id_table
struct so that the alias can be exported.

The MHI endpoint reused the mhi_device_id structure of the MHI bus.

Reviewed-by: Alex Elder <elder@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/ep/main.c       |  9 +++++++++
 include/linux/mod_devicetable.h |  2 ++
 scripts/mod/file2alias.c        | 10 ++++++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index 3efdbf924076..ce59f38b59a7 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -1568,6 +1568,14 @@ void mhi_ep_driver_unregister(struct mhi_ep_driver *mhi_drv)
 }
 EXPORT_SYMBOL_GPL(mhi_ep_driver_unregister);
 
+static int mhi_ep_uevent(struct device *dev, struct kobj_uevent_env *env)
+{
+	struct mhi_ep_device *mhi_dev = to_mhi_ep_device(dev);
+
+	return add_uevent_var(env, "MODALIAS=" MHI_EP_DEVICE_MODALIAS_FMT,
+					mhi_dev->name);
+}
+
 static int mhi_ep_match(struct device *dev, struct device_driver *drv)
 {
 	struct mhi_ep_device *mhi_dev = to_mhi_ep_device(dev);
@@ -1594,6 +1602,7 @@ struct bus_type mhi_ep_bus_type = {
 	.name = "mhi_ep",
 	.dev_name = "mhi_ep",
 	.match = mhi_ep_match,
+	.uevent = mhi_ep_uevent,
 };
 
 static int __init mhi_ep_init(void)
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 4bb71979a8fd..0cff19bd72bf 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -835,6 +835,8 @@ struct wmi_device_id {
 #define MHI_DEVICE_MODALIAS_FMT "mhi:%s"
 #define MHI_NAME_SIZE 32
 
+#define MHI_EP_DEVICE_MODALIAS_FMT "mhi_ep:%s"
+
 /**
  * struct mhi_device_id - MHI device identification
  * @chan: MHI channel name
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 5258247d78ac..d9d6a31446ea 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -1391,6 +1391,15 @@ static int do_mhi_entry(const char *filename, void *symval, char *alias)
 	return 1;
 }
 
+/* Looks like: mhi_ep:S */
+static int do_mhi_ep_entry(const char *filename, void *symval, char *alias)
+{
+	DEF_FIELD_ADDR(symval, mhi_device_id, chan);
+	sprintf(alias, MHI_EP_DEVICE_MODALIAS_FMT, *chan);
+
+	return 1;
+}
+
 /* Looks like: ishtp:{guid} */
 static int do_ishtp_entry(const char *filename, void *symval, char *alias)
 {
@@ -1519,6 +1528,7 @@ static const struct devtable devtable[] = {
 	{"tee", SIZE_tee_client_device_id, do_tee_entry},
 	{"wmi", SIZE_wmi_device_id, do_wmi_entry},
 	{"mhi", SIZE_mhi_device_id, do_mhi_entry},
+	{"mhi_ep", SIZE_mhi_device_id, do_mhi_ep_entry},
 	{"auxiliary", SIZE_auxiliary_device_id, do_auxiliary_entry},
 	{"ssam", SIZE_ssam_device_id, do_ssam_entry},
 	{"dfl", SIZE_dfl_device_id, do_dfl_entry},
-- 
2.25.1

