Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD15C272B22
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 18:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728090AbgIUQKa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 12:10:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727964AbgIUQK3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 12:10:29 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B78A6C0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 09:10:29 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id d13so9447952pgl.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 09:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Y1HDeSf7eMJfSl6ZK/D9lqct6zJN8sO0bd/DmJuThzk=;
        b=OnnKXHeu0gFD1wy19P35KkaXRDmcdtg7+nSvOwElegc3Jq7Ff43XEFR31TUL6MOxOJ
         XNy58SaR7p5nYyQFtNHHAin4eZTGKiOFyLodPLBDrq/FYaWTlpEE2N4fsO7VF/pfxZgH
         ksoJDLEmTFP5mbeLRUwRfl7llbZHfl7qAny34iTJFqJWQy+9L19mRc7uNTO4kr9hUG5y
         KnLpw9Y3IUyurWh8MQQF8qI3Y5r/1QY15mgcmd36OsUrSi/dO+RHs6SxWVLEprGjP0cd
         lchrtl2/8J340jhL2sD/JrPjAax+O59vksh2S2ljVGvdszYPeyvpcBz6Eldrc9w+7h+E
         M6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Y1HDeSf7eMJfSl6ZK/D9lqct6zJN8sO0bd/DmJuThzk=;
        b=ti+D2IKyfjfDrNKHcK/CkslDvFlT2RZczoQvgVyxFmBrWZ6p5mZ4vdniF9XztBTlm0
         PffPo5D3YCcr45SKzwxnQCZP77nIMGY2ivPYtF1fymMW9l5hi90PBTz/+HBk4mYcx2RT
         U++U3dzgX/V5ry13kOlJV+IdQPIPX9xnb+svqslwg/mVtq2fUN/r8wlHmtUeZLDJWCZx
         guyGeyrRtc7AicZt0cqJ0nBDUm3Cq9BZwV4Nfr3SYDUodjTWGBZ0mbh+bbZ73LBtZPNZ
         HFZ2BsgaeYIJORyqE98SX43eJg2+vUzGNDY5GC8CS2/Acydxmbb+oQaQpSsBlPIlfUQH
         /kgQ==
X-Gm-Message-State: AOAM532KP/00F8tD3xMwv6sa3Dz3AvlZtJyRv2ac0ZXCvxvt9MFQusOT
        jg3ubZ2scJXAYGNiTnwXg5aO
X-Google-Smtp-Source: ABdhPJxh561hJTbROl0lX2I6xFhmCC0NCPNS+laM4pQefD5H4SOmInrX6T4BbslGYStvp299VRx13w==
X-Received: by 2002:a05:6a00:d0:b029:150:959d:5139 with SMTP id e16-20020a056a0000d0b0290150959d5139mr581026pfj.38.1600704629136;
        Mon, 21 Sep 2020 09:10:29 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([2409:4072:6d03:bd12:1004:2ccf:6900:b97])
        by smtp.gmail.com with ESMTPSA id f4sm9204577pgr.68.2020.09.21.09.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 09:10:28 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 09/18] bus: mhi: core: Read and save device hardware information from BHI
Date:   Mon, 21 Sep 2020 21:38:06 +0530
Message-Id: <20200921160815.28071-11-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921160815.28071-1-manivannan.sadhasivam@linaro.org>
References: <20200921160815.28071-1-manivannan.sadhasivam@linaro.org>
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

