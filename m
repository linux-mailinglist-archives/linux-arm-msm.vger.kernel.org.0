Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1481F63FBAC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 00:10:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231721AbiLAXKe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Dec 2022 18:10:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231349AbiLAXKX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Dec 2022 18:10:23 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B3F7BDCF7
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Dec 2022 15:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669936136;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Au+k80w/pmMXn842EfJNDQH8P/z+f/qneC68ARqh1Us=;
        b=e7lpGvKskxIX61cSX1e+4gWKvF/Y+8DcM7bxCSJorqFgNN0Cxiur512uyrl4j6njuVmyMG
        19n/ydTO0uB01taiQVKKScCTa2/34DwCigv95V1hFKaYpECRKkvCjo0ICSILgubgU0G7ka
        Cbfsq0/QBVy1JINFWtuPgPuMeR4fUkY=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-613-Qga9WIl3ObK5t7nTt-rKBg-1; Thu, 01 Dec 2022 18:08:54 -0500
X-MC-Unique: Qga9WIl3ObK5t7nTt-rKBg-1
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-13b88262940so1487335fac.15
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Dec 2022 15:08:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Au+k80w/pmMXn842EfJNDQH8P/z+f/qneC68ARqh1Us=;
        b=gTL2pPE8QQElWS789uo72fe3qbOmMkv6sEeZPNnezl7UqwV2ooQ6/DjrwLwOzd9zrK
         Wu+itKPFFfrPV83IvCWBUcHIrUIN/SMJuDBp50b0T8zR9JGzSjUKRyn5MLepjIJu0Z4H
         HkyTinhTENjiQIR9tpwQznvXm14UDBGI554F0HJwk1ahppNL3qnsnhJOyURwHghJwI83
         7EMPH/VWoHGfq/VlaZdesjt877eUTUdO/zo83ao4pDiR6amr86KEnVlMYF2IXZPyrNDS
         3V0WK3t/43w41jdxR3A+XJbM1C+XZiBI6TBOP3fDbFDwvbnZIwrT4sv9tmkzRzTzqFIH
         L4hA==
X-Gm-Message-State: ANoB5pkyhbYwfjHNjJoAA45GhxlOeKI6M4TjYF5KXVVTtJciRSRHsT11
        zzJ8/yq6ivV6Kqsh7Sm1l3QpG9ZfLS017xfOzphB42eanHRdvuo5LsPbHJWz3OKRxnIbHXR6Aj9
        Kq3DRcHFs/wjjbUXpiTLsMuGxxg==
X-Received: by 2002:aca:c108:0:b0:354:946b:f72f with SMTP id r8-20020acac108000000b00354946bf72fmr26849979oif.48.1669936134114;
        Thu, 01 Dec 2022 15:08:54 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6pXPhwwXla9o1f3TOf302ZiviAEa7VY59few9IlfP2oWCgZT5Q9QV8Go8vg9BjCquwWs2B6w==
X-Received: by 2002:aca:c108:0:b0:354:946b:f72f with SMTP id r8-20020acac108000000b00354946bf72fmr26849967oif.48.1669936133904;
        Thu, 01 Dec 2022 15:08:53 -0800 (PST)
Received: from halaney-x13s.redhat.com ([2600:1700:1ff0:d0e0::41])
        by smtp.gmail.com with ESMTPSA id y22-20020a4ade16000000b0049fb2a96de4sm2320393oot.0.2022.12.01.15.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 15:08:53 -0800 (PST)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     andersson@kernel.org
Cc:     agross@kernel.org, konrad.dybcio@linaro.org, jejb@linux.ibm.com,
        martin.petersen@oracle.com, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, manivannan.sadhasivam@linaro.org,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH 3/4] scsi: ufs: ufs-qcom: Remove usage of dbg_print_en
Date:   Thu,  1 Dec 2022 17:08:09 -0600
Message-Id: <20221201230810.1019834-4-ahalaney@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201230810.1019834-1-ahalaney@redhat.com>
References: <20221201230810.1019834-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This bitmask is unconditionally set in the current driver,
so all conditionals using it can be considered bit rot.

Let's take the current default conditional path everywhere and remove
dbg_print_en from the driver.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/ufs/host/ufs-qcom.c | 18 +++---------------
 drivers/ufs/host/ufs-qcom.h | 11 -----------
 2 files changed, 3 insertions(+), 26 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 1b0dfbbdcdf3..b1fcff1fad0c 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -22,9 +22,6 @@
 #include <ufs/ufshci.h>
 #include <ufs/ufs_quirks.h>
 
-#define UFS_QCOM_DEFAULT_DBG_PRINT_EN	\
-	(UFS_QCOM_DBG_PRINT_REGS_EN | UFS_QCOM_DBG_PRINT_TEST_BUS_EN)
-
 enum {
 	TSTBUS_UAWM,
 	TSTBUS_UARM,
@@ -1040,7 +1037,6 @@ static int ufs_qcom_init(struct ufs_hba *hba)
 	if (hba->dev->id < MAX_UFS_QCOM_HOSTS)
 		ufs_qcom_hosts[hba->dev->id] = host;
 
-	host->dbg_print_en |= UFS_QCOM_DEFAULT_DBG_PRINT_EN;
 	ufs_qcom_get_default_testbus_cfg(host);
 	err = ufs_qcom_testbus_config(host);
 	if (err) {
@@ -1191,14 +1187,9 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba,
 
 static void ufs_qcom_enable_test_bus(struct ufs_qcom_host *host)
 {
-	if (host->dbg_print_en & UFS_QCOM_DBG_PRINT_TEST_BUS_EN) {
-		ufshcd_rmwl(host->hba, UFS_REG_TEST_BUS_EN,
-				UFS_REG_TEST_BUS_EN, REG_UFS_CFG1);
-		ufshcd_rmwl(host->hba, TEST_BUS_EN, TEST_BUS_EN, REG_UFS_CFG1);
-	} else {
-		ufshcd_rmwl(host->hba, UFS_REG_TEST_BUS_EN, 0, REG_UFS_CFG1);
-		ufshcd_rmwl(host->hba, TEST_BUS_EN, 0, REG_UFS_CFG1);
-	}
+	ufshcd_rmwl(host->hba, UFS_REG_TEST_BUS_EN,
+			UFS_REG_TEST_BUS_EN, REG_UFS_CFG1);
+	ufshcd_rmwl(host->hba, TEST_BUS_EN, TEST_BUS_EN, REG_UFS_CFG1);
 }
 
 static void ufs_qcom_get_default_testbus_cfg(struct ufs_qcom_host *host)
@@ -1315,9 +1306,6 @@ static void ufs_qcom_dump_dbg_regs(struct ufs_hba *hba)
 	ufshcd_dump_regs(hba, REG_UFS_SYS1CLK_1US, 16 * 4,
 			 "HCI Vendor Specific Registers ");
 
-	if (!(host->dbg_print_en & UFS_QCOM_DBG_PRINT_REGS_EN))
-		return;
-
 	reg = ufs_qcom_get_debug_reg_offset(host, UFS_UFS_DBG_RD_REG_OCSC);
 	ufshcd_dump_regs(hba, reg, 44 * 4, "UFS_UFS_DBG_RD_REG_OCSC ");
 
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index 44466a395bb5..e567e4636357 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -113,15 +113,6 @@ enum {
 	MASK_CLK_NS_REG                     = 0xFFFC00,
 };
 
-/* QCOM UFS debug print bit mask */
-#define UFS_QCOM_DBG_PRINT_REGS_EN	BIT(0)
-#define UFS_QCOM_DBG_PRINT_ICE_REGS_EN	BIT(1)
-#define UFS_QCOM_DBG_PRINT_TEST_BUS_EN	BIT(2)
-
-#define UFS_QCOM_DBG_PRINT_ALL	\
-	(UFS_QCOM_DBG_PRINT_REGS_EN | UFS_QCOM_DBG_PRINT_ICE_REGS_EN | \
-	 UFS_QCOM_DBG_PRINT_TEST_BUS_EN)
-
 /* QUniPro Vendor specific attributes */
 #define PA_VS_CONFIG_REG1	0x9000
 #define DME_VS_CORE_CLK_CTRL	0xD002
@@ -212,8 +203,6 @@ struct ufs_qcom_host {
 
 	u32 dev_ref_clk_en_mask;
 
-	/* Bitmask for enabling debug prints */
-	u32 dbg_print_en;
 	struct ufs_qcom_testbus testbus;
 
 	/* Reset control of HCI */
-- 
2.38.1

