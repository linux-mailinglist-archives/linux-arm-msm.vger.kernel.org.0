Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8500D519A20
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 10:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346494AbiEDIqI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 04:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346541AbiEDIqF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 04:46:05 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2294324BC8
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 01:42:30 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id x12so637804pgj.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 01:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9oPQMnENAgc/IA00SRMlo/dwK0TRjo7Wa3MNPNTMI6k=;
        b=h7wkw75L5K9+fcKOzDu+mboIwXT4/M7QT/MHVSU9P6Au8VmGe4LXP1B3cUe5cE5aAi
         eWt8ctkEGWr6hQcR0/Gx2FUc1TOd1ExFgBwE1hgp3C0J/CZcoUxIBfXlw7B98qqiyhLg
         TeizJx725jUguyC+f10FqjISoDiQsR6imGwBxuVMICpGupjr1u/KRP9oDM9LwJpFuW3j
         i906jNzd+vbBFWX5WkPEklFKkWEiVShr2/hqvJqpEx2149Dsqrf+VfXe/7SexcyQZL9S
         lNj/fA/uEApD8zHezKme6Ko64hi9imitltqGm3yu/7zCCwNtPZeolDDbi5m4XQyKpNOn
         j/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9oPQMnENAgc/IA00SRMlo/dwK0TRjo7Wa3MNPNTMI6k=;
        b=x7LSHFPDYoH+ZK5Lz0vwJ6x+dZ8B+dHR7gIuvC12pqyxr/0YRkVhGuoErC4SFnP/xd
         PF9OxbRt882NKAB9hQqWabJMOV29unIwZTTMKwzIcpTF4KqM65BKhesWcGACEFlRQfS+
         XsNXA9sdH7oVh/fdb6MjY+J0iFUqOqgR/MsR0MAiEDendX1f3yL2iuKfp7wlCsLMnkp5
         bhDnYGKqeXKyqwLtJ5yqYeeUudboJlO0cXVgj2W/yBt8gJbSDv3jbwiYdcmKapUPc6wg
         7+HcbijoT3kvkI1uIvFNPzU7EV00N22n2J9E1LazwNCZcvk4HF70IrgRMWjr3/Wrf6WS
         Ialw==
X-Gm-Message-State: AOAM533CTREl0gSIQABINN2EB19g1EjIAcGuy1l3mMWP0XhD5VKpnE1a
        SjZaJeW+xBZSJSqGIMDiF0ys
X-Google-Smtp-Source: ABdhPJzpg40GdQvMpML+GPNVfH6jcObl21VZ1X7ISPQ3ScUzQDzTNR0tZnnyfZfaFuwin44Zq0JuEw==
X-Received: by 2002:a65:6956:0:b0:399:1f0e:6172 with SMTP id w22-20020a656956000000b003991f0e6172mr16908504pgq.286.1651653749611;
        Wed, 04 May 2022 01:42:29 -0700 (PDT)
Received: from localhost.localdomain ([27.111.75.248])
        by smtp.gmail.com with ESMTPSA id i10-20020a170902c94a00b0015e8d4eb278sm1386561pla.194.2022.05.04.01.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 01:42:29 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     martin.petersen@oracle.com, jejb@linux.ibm.com
Cc:     avri.altman@wdc.com, alim.akhtar@samsung.com,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        quic_asutoshd@quicinc.com, quic_cang@quicinc.com,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        bvanassche@acm.org, ahalaney@redhat.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 2/5] scsi: ufs: qcom: Simplify handling of devm_phy_get()
Date:   Wed,  4 May 2022 14:12:09 +0530
Message-Id: <20220504084212.11605-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504084212.11605-1-manivannan.sadhasivam@linaro.org>
References: <20220504084212.11605-1-manivannan.sadhasivam@linaro.org>
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

There is no need to call devm_phy_get() if ACPI is used, so skip it.
The "host->generic_phy" pointer should already be NULL due to the kzalloc,
so no need to set it NULL again.

While at it, also remove the comment that has no relationship with
devm_phy_get().

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/scsi/ufs/ufs-qcom.c | 26 ++++----------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index 9e69b9ac58f9..6126e50b9af4 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -1021,28 +1021,10 @@ static int ufs_qcom_init(struct ufs_hba *hba)
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
-			err = PTR_ERR(host->generic_phy);
-			dev_err(dev, "%s: PHY get failed %d\n", __func__, err);
+	if (!has_acpi_companion(dev)) {
+		host->generic_phy = devm_phy_get(dev, "ufsphy");
+		if (IS_ERR(host->generic_phy)) {
+			err = dev_err_probe(dev, PTR_ERR(host->generic_phy), "Failed to get PHY\n");
 			goto out_variant_clear;
 		}
 	}
-- 
2.25.1

