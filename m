Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0B5A1C16E2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2020 16:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731092AbgEANyL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 May 2020 09:54:11 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:15180 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729683AbgEANyK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 May 2020 09:54:10 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588341249; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=UyUTdX3ycZLsp/fRiUOxWmX80RtczvRBethpLLRPbxE=; b=SNVULfUJQe1MW3ZzUB/8S4FxSGYSXK2Kd1mqmCzErBqZ3Pwa6npkV0bQ/Xcfe1K4t7Y4+0nn
 /YyRoakSRXa1EyWYikp/FhSjtOJWJMKc6ipSeI2HcwRtw9Kty2HBQSClOTJmWlOr4Vl4GJYs
 GPlrOb4jgQpW0XMNTMgCRq2yRtw=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eac29f2.7f0f27c2d3e8-smtp-out-n01;
 Fri, 01 May 2020 13:53:54 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DC578C44795; Fri,  1 May 2020 13:53:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from vbadigan-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AD883C432C2;
        Fri,  1 May 2020 13:53:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AD883C432C2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Konda <kkonda@codeaurora.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Baolin Wang <baolin.wang@linaro.org>,
        Ludovic Barre <ludovic.barre@st.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Bradley Bolen <bradleybolen@gmail.com>
Subject: [PATCH V1] mmc: core: expose info about enhanced rpmb support
Date:   Fri,  1 May 2020 19:23:01 +0530
Message-Id: <1588341189-4371-1-git-send-email-vbadigan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Krishna Konda <kkonda@codeaurora.org>

Following eMMC JEDEC JESD84-B51 standard, an enhanced form of
rpmb is supported. What this enhanced mode supports is in addition
to be able to write one rpmb or two rpmb frames at a time,
32 frames can be written at a time.

Expose this information present in ext csd field so that the
user space application that wants to make use of this can do so.

Signed-off-by: Krishna Konda <kkonda@codeaurora.org>
Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
---
 drivers/mmc/core/mmc.c   | 6 ++++++
 include/linux/mmc/card.h | 1 +
 include/linux/mmc/mmc.h  | 1 +
 3 files changed, 8 insertions(+)

diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index de94fbe..4203303 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -647,6 +647,9 @@ static int mmc_decode_ext_csd(struct mmc_card *card, u8 *ext_csd)
 				 mmc_hostname(card->host),
 				 card->ext_csd.cmdq_depth);
 		}
+		card->ext_csd.enhanced_rpmb_supported =
+					(card->ext_csd.rel_param &
+					 EXT_CSD_WR_REL_PARAM_EN_RPMB_REL_WR);
 	}
 out:
 	return err;
@@ -786,6 +789,8 @@ static int mmc_compare_ext_csds(struct mmc_card *card, unsigned bus_width)
 		card->ext_csd.enhanced_area_offset);
 MMC_DEV_ATTR(enhanced_area_size, "%u\n", card->ext_csd.enhanced_area_size);
 MMC_DEV_ATTR(raw_rpmb_size_mult, "%#x\n", card->ext_csd.raw_rpmb_size_mult);
+MMC_DEV_ATTR(enhanced_rpmb_supported, "%#x\n",
+	card->ext_csd.enhanced_rpmb_supported);
 MMC_DEV_ATTR(rel_sectors, "%#x\n", card->ext_csd.rel_sectors);
 MMC_DEV_ATTR(ocr, "0x%08x\n", card->ocr);
 MMC_DEV_ATTR(rca, "0x%04x\n", card->rca);
@@ -843,6 +848,7 @@ static ssize_t mmc_dsr_show(struct device *dev,
 	&dev_attr_enhanced_area_offset.attr,
 	&dev_attr_enhanced_area_size.attr,
 	&dev_attr_raw_rpmb_size_mult.attr,
+	&dev_attr_enhanced_rpmb_supported.attr,
 	&dev_attr_rel_sectors.attr,
 	&dev_attr_ocr.attr,
 	&dev_attr_rca.attr,
diff --git a/include/linux/mmc/card.h b/include/linux/mmc/card.h
index cf3780a..7d46411 100644
--- a/include/linux/mmc/card.h
+++ b/include/linux/mmc/card.h
@@ -48,6 +48,7 @@ struct mmc_ext_csd {
 	u8			sec_feature_support;
 	u8			rel_sectors;
 	u8			rel_param;
+	bool			enhanced_rpmb_supported;
 	u8			part_config;
 	u8			cache_ctrl;
 	u8			rst_n_function;
diff --git a/include/linux/mmc/mmc.h b/include/linux/mmc/mmc.h
index 4b85ef0..d9a65c6 100644
--- a/include/linux/mmc/mmc.h
+++ b/include/linux/mmc/mmc.h
@@ -325,6 +325,7 @@ static inline bool mmc_ready_for_data(u32 status)
  */
 
 #define EXT_CSD_WR_REL_PARAM_EN		(1<<2)
+#define EXT_CSD_WR_REL_PARAM_EN_RPMB_REL_WR	(1<<4)
 
 #define EXT_CSD_BOOT_WP_B_PWR_WP_DIS	(0x40)
 #define EXT_CSD_BOOT_WP_B_PERM_WP_DIS	(0x10)
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
