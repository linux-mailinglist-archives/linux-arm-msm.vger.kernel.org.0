Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE5B44AEFD3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Feb 2022 12:12:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229967AbiBILMp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Feb 2022 06:12:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229851AbiBILMp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Feb 2022 06:12:45 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7495BE101DC3
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 02:08:19 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id t4-20020a17090a510400b001b8c4a6cd5dso1731652pjh.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Feb 2022 02:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pmDkqthjssoHKJ9bLjod6j2IDm4LIWLx3+MkrpaPVXo=;
        b=BEiHMRnQ3d0uqlb0Y/CzgsGVZBB2yLJyXVGsAOrFWnfyYqANuKd6t5lz7go8EsGuky
         xK3B0ZBG4FSwqjzyq6DYa8w6jn59DWThbCY5cpojaE9ipy0eGuNaYs0Oo2bQaH2d6019
         bqsJ3YIVS8YdfQ3akS2Yev/WgX6GbrqYgitYIQCCoVo9sws0XBYLhsCm3KJanX/9rIED
         DB9JFBTIptea75yQNd4zR6KzavAzDVnoaRLpGFOSYAu9IlXR6TtfxA/TQAPUnBwMlIPp
         ozMDVBu++TO0jPtE2k8rtqu0zPGM7y9I/E3BTm+aI5XNtqbbd57V+Cg44HiCJAr+sUKL
         e8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pmDkqthjssoHKJ9bLjod6j2IDm4LIWLx3+MkrpaPVXo=;
        b=JVQ1GJ4VuMT0MfREFcy4Grp9CseWODEvmfRe0QQbh7UFCrUyehGTVQzrOB6TReFz7h
         kfGIoTY/1myT4t9WrRvhFraIkEXUODaeiwz10D+AedvDCUKcG8fjKQJ8FWw8gQHxaXje
         IVFbe9beQ/YGcBv+R4DCpx03Ce2CLsrC95IA1Su786NTv9kndEkeZs05JUQloXnT+fI3
         sDuJFEH/IKNC6sXLrql+44gvuq5G8ENGX3mS0sybnruzJZn4chzqAV0CubA0zf/TJzM+
         jLlA5EC8UGlyiZROCt1ZpnMCdmc7zKC1naaQWv5bffAXKBYIO7DF/Zk16r5a1M8dRej3
         0ZmA==
X-Gm-Message-State: AOAM532zb4jbEP16RyiMuvlpVRtP/S4D5ZNQOomWnXSooX7zepP3Wy5h
        ij6kwRcMxXNwz2mp2m5b61N8
X-Google-Smtp-Source: ABdhPJzS+FgYIm8PZLlg8rh64dLRyOt2elhMgWkhYPdGcwQ+ro/gZGH0+GRW613NtZNUMyjPQW3PgA==
X-Received: by 2002:a17:902:bf06:: with SMTP id bi6mr1380824plb.24.1644401242187;
        Wed, 09 Feb 2022 02:07:22 -0800 (PST)
Received: from localhost.localdomain ([117.217.179.178])
        by smtp.gmail.com with ESMTPSA id p2sm6722024pfo.125.2022.02.09.02.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 02:07:21 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev
Cc:     quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
        quic_jhugo@quicinc.com, vinod.koul@linaro.org,
        bjorn.andersson@linaro.org, dmitry.baryshkov@linaro.org,
        vbadigan@codeaurora.org, quic_cang@quicinc.com,
        quic_skananth@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, elder@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 23/23] bus: mhi: ep: Add uevent support for module autoloading
Date:   Wed,  9 Feb 2022 15:26:24 +0530
Message-Id: <20220209095624.26389-24-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220209095624.26389-1-manivannan.sadhasivam@linaro.org>
References: <20220209095624.26389-1-manivannan.sadhasivam@linaro.org>
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

Add uevent support to MHI endpoint bus so that the client drivers can be
autoloaded by udev when the MHI endpoint devices gets created. The client
drivers are expected to provide MODULE_DEVICE_TABLE with the MHI id_table
struct so that the alias can be exported.

The MHI endpoint reused the mhi_device_id structure of the MHI bus.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/ep/main.c       |  9 +++++++++
 include/linux/mod_devicetable.h |  2 ++
 scripts/mod/file2alias.c        | 10 ++++++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
index ed3dbca170d3..c70062f92c03 100644
--- a/drivers/bus/mhi/ep/main.c
+++ b/drivers/bus/mhi/ep/main.c
@@ -1547,6 +1547,14 @@ void mhi_ep_driver_unregister(struct mhi_ep_driver *mhi_drv)
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
@@ -1573,6 +1581,7 @@ struct bus_type mhi_ep_bus_type = {
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

