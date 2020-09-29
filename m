Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8FEE27D50F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 19:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728206AbgI2RxI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Sep 2020 13:53:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728172AbgI2RxH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Sep 2020 13:53:07 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FA53C0613D0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 10:53:07 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id k8so5330252pfk.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 10:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Y1HDeSf7eMJfSl6ZK/D9lqct6zJN8sO0bd/DmJuThzk=;
        b=VuuIe3Wtfr2EIlZlKLTeY2sJ2IfdF+t63kwOnjXC3MIwLv7u0IoUgfhPVIcolwW7mF
         HnonW/0dVJGEOIl9dPosA7jLQu2VwzJIQZsE7NFdZzEieSnIWzKzwjFTzKxNG034sxhm
         jaJRNnTpdeS225Bw0ef+EEEnayuYX0gsYS1F/ytIQexYk5GRDiWkXHh9JVTKfHYzoZe4
         GwHjPX5JO2SbyFJoRZ4ekOCoAYw+/C9g8PdmprqeNnxFlXO9mSRUH9yd9ayL8CDzUpDB
         NEFpG3vqWD5ItmmHTxRi+WbjEOfuFp/2rVEIWo5+MGk+hMqfQJSIHAuH9Aux4eVG5/WN
         NAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Y1HDeSf7eMJfSl6ZK/D9lqct6zJN8sO0bd/DmJuThzk=;
        b=k701FviHla8ZMA9cPdVeHF1fRw5w3qWz5EWDYJTm8gzcLGk47TD+T04vRxuY0QOJt/
         nsh3+v/6PH4yry4KvhV+uCcab3mfytmUDX3u/IXd0V4XceXGjpnkMcpWbdwKx0+m6GQn
         fzEPrkHA58/jvc1O1yUhKihI5Vz7I4puc0Ki7rBr4c4cTGjLDsr1QFO5hUYR9EtGy+EA
         HBP3MLDNS/trYGxJTE2WKtyH93xeigifYeo7IAV8k2vEcATv+q46ZGGl2jm0RU01ujaA
         05zy+Ni0SnKfjozk0ewH5WY1Q2n03/VHu4GN0RTiNlUq0LDCpkLDx2YZEY2I6xk4FIDe
         jFuQ==
X-Gm-Message-State: AOAM532Vosq1uhJuWoG5cZfQotb3KeTnXpA7JLrInYOif+ODxiPNF51+
        qL8fJRWF4sE9EyLbzX3yexcx
X-Google-Smtp-Source: ABdhPJyxZwS4UjRxdX7l1ElQMUC769Y1++Fz7aDKgJTkBJJ+52cCdZDDUfF4B4/3/EZZBbgEmNtKbg==
X-Received: by 2002:a17:902:be0c:b029:d2:8ceb:f39c with SMTP id r12-20020a170902be0cb02900d28cebf39cmr5645119pls.71.1601401986990;
        Tue, 29 Sep 2020 10:53:06 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id r188sm6271046pfc.67.2020.09.29.10.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 10:53:06 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 09/19] bus: mhi: core: Read and save device hardware information from BHI
Date:   Tue, 29 Sep 2020 23:22:08 +0530
Message-Id: <20200929175218.8178-10-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929175218.8178-1-manivannan.sadhasivam@linaro.org>
References: <20200929175218.8178-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

Device hardware specific information such as serial number and the OEM
PK hash can be read using BHI and saved on host to identify the
endpoint.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/boot.c | 17 ++++++++++++++++-
 include/linux/mhi.h         |  6 ++++++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index 0b38014d040e..24422f5c3d80 100644
--- a/drivers/bus/mhi/core/boot.c
+++ b/drivers/bus/mhi/core/boot.c
@@ -392,13 +392,28 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	void *buf;
 	dma_addr_t dma_addr;
 	size_t size;
-	int ret;
+	int i, ret;
 
 	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
 		dev_err(dev, "Device MHI is not in valid state\n");
 		return;
 	}
 
+	/* save hardware info from BHI */
+	ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_SERIALNU,
+			   &mhi_cntrl->serial_number);
+	if (ret)
+		dev_err(dev, "Could not capture serial number via BHI\n");
+
+	for (i = 0; i < ARRAY_SIZE(mhi_cntrl->oem_pk_hash); i++) {
+		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_OEMPKHASH(i),
+				   &mhi_cntrl->oem_pk_hash[i]);
+		if (ret) {
+			dev_err(dev, "Could not capture OEM PK HASH via BHI\n");
+			break;
+		}
+	}
+
 	/* If device is in pass through, do reset to ready state transition */
 	if (mhi_cntrl->ee == MHI_EE_PTHRU)
 		goto fw_load_ee_pthru;
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index c56b4447a4e9..0c97f4bc5fae 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -16,6 +16,8 @@
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 
+#define MHI_MAX_OEM_PK_HASH_SEGMENTS 16
+
 struct mhi_chan;
 struct mhi_event;
 struct mhi_ctxt;
@@ -316,6 +318,8 @@ struct mhi_controller_config {
  * @device_number: MHI controller device number
  * @major_version: MHI controller major revision number
  * @minor_version: MHI controller minor revision number
+ * @serial_number: MHI controller serial number obtained from BHI
+ * @oem_pk_hash: MHI controller OEM PK Hash obtained from BHI
  * @mhi_event: MHI event ring configurations table
  * @mhi_cmd: MHI command ring configurations table
  * @mhi_ctxt: MHI device context, shared memory between host and device
@@ -394,6 +398,8 @@ struct mhi_controller {
 	u32 device_number;
 	u32 major_version;
 	u32 minor_version;
+	u32 serial_number;
+	u32 oem_pk_hash[MHI_MAX_OEM_PK_HASH_SEGMENTS];
 
 	struct mhi_event *mhi_event;
 	struct mhi_cmd *mhi_cmd;
-- 
2.17.1

