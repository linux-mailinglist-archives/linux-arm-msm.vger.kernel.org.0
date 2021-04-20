Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7346B365DAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Apr 2021 18:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233119AbhDTQsG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Apr 2021 12:48:06 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:51852 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233172AbhDTQsC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Apr 2021 12:48:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618937251; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=EKChT1gTpuiNaclzIXzJQspOWuQ3ARaK4rg8YfgIlGM=; b=pegYnIAqZWMFn86pr9DFDJ/qxxOaI+60/e2G+EBRX1euFx5kNUqNArwUDp3dx0uv8r1OEQC+
 yYtE8/a8MsDAGEtI9ruo1ggs7vkuoDkAkESxil/qZIEIuWuCvT9kSgwk0/ong+A08ckIBADP
 YhzDDM6xn/hIG4Lhsj3q3hqjIgU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 607f059a853c0a2c4688e206 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Apr 2021 16:47:22
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D8218C4323A; Tue, 20 Apr 2021 16:47:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D5F3DC4338A;
        Tue, 20 Apr 2021 16:47:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D5F3DC4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akhilpo@codeaurora.org
From:   Akhil P Oommen <akhilpo@codeaurora.org>
To:     freedreno@lists.freedesktop.org, dri-devel@freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, robdclark@gmail.com
Subject: [PATCH] freedreno/a6xx: Add a few registers
Date:   Tue, 20 Apr 2021 22:17:13 +0530
Message-Id: <1618937233-14468-1-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a few new registers for a6xx gpu.

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---
 registers/adreno/a6xx.xml     | 2 ++
 registers/adreno/a6xx_gmu.xml | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/registers/adreno/a6xx.xml b/registers/adreno/a6xx.xml
index 15314fb..3b04565 100644
--- a/registers/adreno/a6xx.xml
+++ b/registers/adreno/a6xx.xml
@@ -1107,6 +1107,7 @@ to upconvert to 32b float internally?
 	<reg32 offset="0x098D" name="CP_AHB_CNTL"/>
 	<reg32 offset="0x0A00" name="CP_APERTURE_CNTL_HOST"/>
 	<reg32 offset="0x0A03" name="CP_APERTURE_CNTL_CD"/>
+	<reg32 offset="0x0B34" name="CP_LPAC_PROG_FIFO_SIZE"/>
 	<reg32 offset="0x0C01" name="VSC_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
 	<reg32 offset="0x0201" name="RBBM_INT_0_STATUS" type="A6XX_RBBM_INT_0_MASK"/>
 	<reg32 offset="0x0210" name="RBBM_STATUS">
@@ -1740,6 +1741,7 @@ to upconvert to 32b float internally?
 	<reg32 offset="0x3119" name="VBIF_PERF_PWR_CNT_HIGH1"/>
 	<reg32 offset="0x311a" name="VBIF_PERF_PWR_CNT_HIGH2"/>
 
+	<reg32 offset="0x3c01" name="GBIF_SCACHE_CNTL0"/>
 	<reg32 offset="0x3c02" name="GBIF_SCACHE_CNTL1"/>
 	<reg32 offset="0x3c03" name="GBIF_QSB_SIDE0"/>
 	<reg32 offset="0x3c04" name="GBIF_QSB_SIDE1"/>
diff --git a/registers/adreno/a6xx_gmu.xml b/registers/adreno/a6xx_gmu.xml
index dbefd0c..f8bf1fd 100644
--- a/registers/adreno/a6xx_gmu.xml
+++ b/registers/adreno/a6xx_gmu.xml
@@ -112,6 +112,7 @@ xsi:schemaLocation="http://nouveau.freedesktop.org/ rules-ng.xsd">
 	<reg32 offset="0x50e9" name="GMU_RPMH_HYST_CTRL"/>
 	<reg32 offset="0x50ec" name="GPU_GMU_CX_GMU_RPMH_POWER_STATE"/>
 	<reg32 offset="0x50f0" name="GPU_GMU_CX_GMU_CX_FAL_INTF"/>
+	<reg32 offset="0x50f1" name="GPU_GMU_CX_GMU_CX_FALNEXT_INTF"/>
 	<reg32 offset="0x5100" name="GPU_GMU_CX_GMU_PWR_COL_CP_MSG"/>
 	<reg32 offset="0x5101" name="GPU_GMU_CX_GMU_PWR_COL_CP_RESP"/>
 	<reg32 offset="0x51f0" name="GMU_BOOT_KMD_LM_HANDSHAKE"/>
@@ -193,6 +194,7 @@ xsi:schemaLocation="http://nouveau.freedesktop.org/ rules-ng.xsd">
 	<reg32 offset="0x9312" name="GMU_AHB_FENCE_RANGE_1"/>
 	<reg32 offset="0x9c03" name="GPU_CC_GX_GDSCR"/>
 	<reg32 offset="0x9d42" name="GPU_CC_GX_DOMAIN_MISC"/>
+	<reg32 offset="0xc001" name="GPU_CPR_FSM_CTL"/>
 
 	<!-- starts at offset 0x8c00 on most gpus -->
 	<reg32 offset="0x0004" name="GPU_RSCC_RSC_STATUS0_DRV0"/>
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

