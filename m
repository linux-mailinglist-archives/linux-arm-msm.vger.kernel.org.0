Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A24A6123C8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Oct 2022 16:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbiJ2OTc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Oct 2022 10:19:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbiJ2OSz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Oct 2022 10:18:55 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29C5C5F7FD
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Oct 2022 07:17:53 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id b11so6945900pjp.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Oct 2022 07:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9w0057GHgoZKWtXZ1+4u/MPirSR8go5oWQPd2eE2mI=;
        b=encU76jKBrg6lH2ISMpQ/N7b4auZ2VydelAwmgOx19RnLM1oiSnBRWcM11Xqmvc3Cg
         EKkic2nHjmIz1GFChzZ8WjMeqZLnln+gDPxjo1o547phYbrMlpKwBLEn5PgEEKr/FZdI
         1kZP888PIFaxLbzbKFqLGoZgFlyCuvge17GdEAxRXwUPywc8a5Z6ILYxviKf2QD4qNnD
         UlFfrt1Kbu+I4MBrU6N2Bqian3JljYN9ydInPZj3ilaU1a+wDVzSqyJB8ICfyQja0ntX
         1099u1qHn209NgN/wtUebb8DWjq1ilbpQpz7sxbSQqHAB3yUgmu8BuXmIIOh/h1hI0DF
         BRSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v9w0057GHgoZKWtXZ1+4u/MPirSR8go5oWQPd2eE2mI=;
        b=x25ZkPTSr+sdR6Q8eCaDzg8lRJs+Y+SLcbvb2k0wlrvGYMVsWajYG9+l4/U2eYz1sV
         rPrJ2Mrs1Mw/zHGdEcxDI+Gp6KeYuJHG8lrqe/UJfcXVYIWdUbWgcJGaLcZmwOkpdB1/
         phjnAmT/A1xZAfRV5dAVWiIzUSoKq9dEU5/ANcXny46jw882oZkmOOukYa7MVQbCKUuz
         ty0k5gh+PY45uFJgir2LN4sMtQKQUi7XuL5L4v+OukrXAP0fac9rxMXegUW5tfa2YZey
         khitksoETLbTIUrO0jtAkL/9Rjg/T90Yw/3hZbwqwa3ou9vWCL7mh19DP7JbCrvKYCj9
         /STg==
X-Gm-Message-State: ACrzQf0+1cyqDYPZlm0pLffu/hlZuNkofDgVSdMAIJoEeB0AUxnbDn7m
        K8+8Z8SEffdkEKYjlJN5Dmj5
X-Google-Smtp-Source: AMsMyM7JgKncQxD+5pXhQsXTkWwf5sEiBgn85aqK7sxksdsAEnWD9W1u57IbDiP/N0nhOGC+mz8f+w==
X-Received: by 2002:a17:903:50b:b0:187:11e:5f1f with SMTP id jn11-20020a170903050b00b00187011e5f1fmr4643202plb.41.1667053072648;
        Sat, 29 Oct 2022 07:17:52 -0700 (PDT)
Received: from localhost.localdomain ([117.193.208.18])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e5c400b001866049ddb1sm1370157plf.161.2022.10.29.07.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Oct 2022 07:17:51 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     martin.petersen@oracle.com, jejb@linux.ibm.com,
        andersson@kernel.org, vkoul@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        quic_cang@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 13/15] scsi: ufs: ufs-qcom: Factor out the logic finding the HS Gear
Date:   Sat, 29 Oct 2022 19:46:31 +0530
Message-Id: <20221029141633.295650-14-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221029141633.295650-1-manivannan.sadhasivam@linaro.org>
References: <20221029141633.295650-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In the preparation of adding support for new gears, let's move the
logic that finds the gear for each platform to a new function. This helps
with code readability and also allows the logic to be used in other places
of the driver in future.

While at it, let's make it clear that this driver only supports symmetric
gear setting (hs_tx_gear == hs_rx_gear).

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 28ac5f0ab2bc..f952cc76919f 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -278,6 +278,26 @@ static int ufs_qcom_host_reset(struct ufs_hba *hba)
 	return 0;
 }
 
+static u32 ufs_qcom_get_hs_gear(struct ufs_hba *hba, u32 hs_gear)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+
+	if (host->hw_ver.major == 0x1) {
+		/*
+		 * HS-G3 operations may not reliably work on legacy QCOM
+		 * UFS host controller hardware even though capability
+		 * exchange during link startup phase may end up
+		 * negotiating maximum supported gear as G3.
+		 * Hence downgrade the maximum supported gear to HS-G2.
+		 */
+		if (hs_gear > UFS_HS_G2)
+			return UFS_HS_G2;
+	}
+
+	/* Default is HS-G3 */
+	return UFS_HS_G3;
+}
+
 static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
@@ -692,19 +712,9 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
 		ufshcd_init_pwr_dev_param(&ufs_qcom_cap);
 		ufs_qcom_cap.hs_rate = UFS_QCOM_LIMIT_HS_RATE;
 
-		if (host->hw_ver.major == 0x1) {
-			/*
-			 * HS-G3 operations may not reliably work on legacy QCOM
-			 * UFS host controller hardware even though capability
-			 * exchange during link startup phase may end up
-			 * negotiating maximum supported gear as G3.
-			 * Hence downgrade the maximum supported gear to HS-G2.
-			 */
-			if (ufs_qcom_cap.hs_tx_gear > UFS_HS_G2)
-				ufs_qcom_cap.hs_tx_gear = UFS_HS_G2;
-			if (ufs_qcom_cap.hs_rx_gear > UFS_HS_G2)
-				ufs_qcom_cap.hs_rx_gear = UFS_HS_G2;
-		}
+		/* This driver only supports symmetic gear setting i.e., hs_tx_gear == hs_rx_gear */
+		ufs_qcom_cap.hs_tx_gear = ufs_qcom_cap.hs_rx_gear = ufs_qcom_get_hs_gear(hba,
+									ufs_qcom_cap.hs_tx_gear);
 
 		ret = ufshcd_get_pwr_dev_param(&ufs_qcom_cap,
 					       dev_max_params,
-- 
2.25.1

