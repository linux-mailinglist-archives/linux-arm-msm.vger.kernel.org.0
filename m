Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3EBE50B859
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Apr 2022 15:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1447897AbiDVNZA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Apr 2022 09:25:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1447761AbiDVNY4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Apr 2022 09:24:56 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B672457B27
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 06:22:02 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id h12so7147355plf.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 06:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4re5OWonUoWdRvSDXbNxViVwfbYtstxFeWpMXUatUMo=;
        b=qRTRtoPbGwWu7NbWdxinV9rTgVqPvkLpJjqKnPRc1dkhO6LBdwC8c96r5phZCRCVxq
         5aeCyO7cZGFvWYg8rHuGdQS1eH6CLLQqJIv8guW7BxlqSgPLdnisheD+0zELrvzLl86d
         UBtd8CgC0ZwhIrrKjz5mHBT43/MtHoyo71MUVmPGMaoksVfwYCpqByYld0oMoP/uDRo6
         39VcweT0yQx25pyNMKbeb6qprLfMdjfKHHBjdCiD6eje9hJoJC+84CEGQrcALgyeWw2Q
         2fVPQz5HTR4BtSHR1f6dVX8rjbnvVGGgkV7atsy+lWLc0iouZcYwqQM7yevVHRfLuyn1
         FHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4re5OWonUoWdRvSDXbNxViVwfbYtstxFeWpMXUatUMo=;
        b=WOo0NW8GFDWyyIE4wN2PkZ9ZWNhUfNzlu5gHacU5BnBtEys/MhCaXGNgMBilu52GfB
         qSUhRXyHSzNzMIjs+PuZi3y9z//3Ov4htluIwHTEFp4E55jT1JsC4PpbWwxmEL0R4825
         pfmUoSuqdeKZK+QJn6fXDIFoMtIX2yLyxylml3KDRSXfWCgMxoZ0cvfpjGKkvbBZgLm9
         XsES5T5FVh0qsJ9EY3QXolvtsIXGUQqWrIPUoPogFqIuL69qRdYWfrVa8y/lWsxWcBZo
         F3GweUPH4wB6y7DGGTVPJhj/fnx4GlqDJqW0K7rYMUGPvdtLjXgo70HxFNoRCCK2dUQM
         YHCQ==
X-Gm-Message-State: AOAM533kr8Daa114YkSsqdsmXpCyBr616b7jtpg5mbKr6IoO+TBiK3w9
        J4xuiURkKa3MYO+GdGgPn3/a
X-Google-Smtp-Source: ABdhPJwIpV2owBIVHmXS11m41XD/92aDrOQLfeuc66hnB4mj8MFIhw5X9cODI7BW/0wPMEkxnIRRUg==
X-Received: by 2002:a17:90a:8418:b0:1d2:7c69:e3bf with SMTP id j24-20020a17090a841800b001d27c69e3bfmr16165389pjn.44.1650633722228;
        Fri, 22 Apr 2022 06:22:02 -0700 (PDT)
Received: from localhost.localdomain ([117.207.28.196])
        by smtp.gmail.com with ESMTPSA id g13-20020a62520d000000b0050a923a7754sm2586840pfb.119.2022.04.22.06.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 06:22:01 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     martin.petersen@oracle.com, jejb@linux.ibm.com
Cc:     avri.altman@wdc.com, alim.akhtar@samsung.com,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        quic_asutoshd@quicinc.com, quic_cang@quicinc.com,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/5] scsi: ufs: qcom: Fix acquiring the optional reset control line
Date:   Fri, 22 Apr 2022 18:51:36 +0530
Message-Id: <20220422132140.313390-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422132140.313390-1-manivannan.sadhasivam@linaro.org>
References: <20220422132140.313390-1-manivannan.sadhasivam@linaro.org>
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

On Qcom UFS platforms, the reset control line seems to be optional
(for SoCs like MSM8996 and probably for others too). The current logic
tries to mimic the `devm_reset_control_get_optional()` API but it also
continues the probe if there is an error with the declared reset line in
DT/ACPI.

In an ideal case, if the reset line is not declared in DT/ACPI, the probe
should continue. But if there is problem in acquiring the declared reset
line (like EPROBE_DEFER) it should fail and return the appropriate error
code.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/scsi/ufs/ufs-qcom.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index 0d2e950d0865..5db0fd922062 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -1002,13 +1002,13 @@ static int ufs_qcom_init(struct ufs_hba *hba)
 	host->hba = hba;
 	ufshcd_set_variant(hba, host);
 
-	/* Setup the reset control of HCI */
-	host->core_reset = devm_reset_control_get(hba->dev, "rst");
+	/* Setup the optional reset control of HCI */
+	host->core_reset = devm_reset_control_get_optional(hba->dev, "rst");
 	if (IS_ERR(host->core_reset)) {
 		err = PTR_ERR(host->core_reset);
-		dev_warn(dev, "Failed to get reset control %d\n", err);
-		host->core_reset = NULL;
-		err = 0;
+		if (err != -EPROBE_DEFER)
+			dev_err(dev, "Failed to get reset control %d\n", err);
+		goto out_variant_clear;
 	}
 
 	/* Fire up the reset controller. Failure here is non-fatal. */
-- 
2.25.1

