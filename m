Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 694AE50B858
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Apr 2022 15:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1447905AbiDVNZC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Apr 2022 09:25:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1447908AbiDVNZB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Apr 2022 09:25:01 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED3E057B2D
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 06:22:07 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d15so10805384pll.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 06:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VJEo0X0uIfdf+jZ7SJyM0RcOsc+vZ/1fj3+IRG98uSo=;
        b=UuRfAQoJy7K2TBJgQEpJQdV/DyUhoMT+iHugPct0qwKEVM9OSiu64f6/0B9X+WWfiA
         3+CM67PnLsbtUmdy8sW9tfWCaZ2G1SUKgdssobL5IhS0BuFrFLsZZfKLRHk4NGcXWOMX
         jPhSXh2ogF5zWn7nkX1otJt+OucDcCzF4IvQsl3XoZxPh3heMOlBIQDnNdSK0Ck2YdJM
         ifvTVRFePBfEXQS5SMY3DRDSfsU14tkKS+IFnF+FlvfzVL9GYbMYlqX34GzJA5PY0Tgk
         WU+iZmC8KM2rV4tuJDe5BJDPq7dskuW3kmRIuJL+oOkAPscewSavvAoXDPpvUgRkR3mq
         cukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VJEo0X0uIfdf+jZ7SJyM0RcOsc+vZ/1fj3+IRG98uSo=;
        b=vo9PKghd8Y88KcFvLhr27aadRcv5APgR6x3VL3S3vquX3noPatr74xIoE2dGfQCwFp
         5uMvfa9EbWMUTZU+N8/ijt+TPnfKmHbnUqEVrWQzFv5I6g6tfzd5VEHXDCgaWDvEPvOS
         hs9VpPdJAfLG5fvG/umPSw//kLUx6RO/7sk9zMUIXtpT+kuOhY7pMZOrTLRC7iezUDPz
         oOs9lmZeL8aFciUThby5ZuWGOPxS+6Ibd/1H1v+d+yBzfZhB/S05u/Z/c5BYnK/jg8eq
         sEUov+FNUV15nZv6ReSPCwdpE4LmO8q3kOLnjfdyXrtvxuxIR2vR8KHMd06AnuP7Acix
         mM4Q==
X-Gm-Message-State: AOAM5318+wvM3wbUCX9GFpfE9vZDKFBTbRtayiroBVN0uPD9aj+vXRZ4
        QyqoNqwCPrDbJq7uXC5nOXeM
X-Google-Smtp-Source: ABdhPJxJ88rBQ4fFhIg73VLAJ+s3N5JhHTKd8gfgR2ZdjfcWB/ifpsSKJMAATbIAqEfKugX7B3fOTw==
X-Received: by 2002:a17:902:f792:b0:153:1566:18 with SMTP id q18-20020a170902f79200b0015315660018mr4534014pln.115.1650633727467;
        Fri, 22 Apr 2022 06:22:07 -0700 (PDT)
Received: from localhost.localdomain ([117.207.28.196])
        by smtp.gmail.com with ESMTPSA id g13-20020a62520d000000b0050a923a7754sm2586840pfb.119.2022.04.22.06.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 06:22:06 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     martin.petersen@oracle.com, jejb@linux.ibm.com
Cc:     avri.altman@wdc.com, alim.akhtar@samsung.com,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        quic_asutoshd@quicinc.com, quic_cang@quicinc.com,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/5] scsi: ufs: qcom: Simplify handling of devm_phy_get()
Date:   Fri, 22 Apr 2022 18:51:37 +0530
Message-Id: <20220422132140.313390-3-manivannan.sadhasivam@linaro.org>
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

There is no need to call devm_phy_get() if ACPI is used, so skip it.
The "host->generic_phy" pointer should already be NULL due to the kzalloc,
so no need to set it NULL again.

Also, don't print the error message in case of -EPROBE_DEFER and return
the error code directly.

While at it, also remove the comment that has no relationship with
devm_phy_get().

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/scsi/ufs/ufs-qcom.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index 5db0fd922062..5f0a8f646eb5 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -1022,28 +1022,12 @@ static int ufs_qcom_init(struct ufs_hba *hba)
 		err = 0;
 	}
 
-	/*
-	 * voting/devoting device ref_clk source is time consuming hence
-	 * skip devoting it during aggressive clock gating. This clock
-	 * will still be gated off during runtime suspend.
-	 */
-	host->generic_phy = devm_phy_get(dev, "ufsphy");
-
-	if (host->generic_phy == ERR_PTR(-EPROBE_DEFER)) {
-		/*
-		 * UFS driver might be probed before the phy driver does.
-		 * In that case we would like to return EPROBE_DEFER code.
-		 */
-		err = -EPROBE_DEFER;
-		dev_warn(dev, "%s: required phy device. hasn't probed yet. err = %d\n",
-			__func__, err);
-		goto out_variant_clear;
-	} else if (IS_ERR(host->generic_phy)) {
-		if (has_acpi_companion(dev)) {
-			host->generic_phy = NULL;
-		} else {
+	if (!has_acpi_companion(dev)) {
+		host->generic_phy = devm_phy_get(dev, "ufsphy");
+		if (IS_ERR(host->generic_phy)) {
 			err = PTR_ERR(host->generic_phy);
-			dev_err(dev, "%s: PHY get failed %d\n", __func__, err);
+			if (err != -EPROBE_DEFER)
+				dev_err(dev, "Failed to get PHY: %d\n", err);
 			goto out_variant_clear;
 		}
 	}
-- 
2.25.1

