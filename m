Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D46A3519A24
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 10:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346531AbiEDIqH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 04:46:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbiEDIqB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 04:46:01 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E16B3245A7
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 01:42:25 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id cx11-20020a17090afd8b00b001d9fe5965b3so4598865pjb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 01:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jvFCRlCjBMgPf5hAFpHc9zQbLQ5BVzGLk4EI13vVODg=;
        b=v5tFf9EmJW+BrMhN/JlKVvAfBKyWpOSBIbSY9r9fkCwwlm2R5gwNOT5uiDPmDfVuxw
         9wstU7IGub4N0PtC5aCVVVY74FotQ8nLobC3j4IRLF4qkkHx9aUiI2awBMETGsmYKHID
         7uv/LJn0rbpAzMsZBTruyZ7IW+SzPoy4YaBpvKEaV9TshS8VP8A2Lvilf0tsGwgp1upH
         fqFH0iHZh0bWzeB/Kpw3teXCZVhGrzH9b4yMriL7wbkh7+erpasN8QPEBMPsUDVKwglw
         m1l55qepuB+sPRmUPr5/01eRkobWdbnhV6tQ8wpoTm0SvWq/2VqWoaUxuAdSCTGGzX18
         3Grg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jvFCRlCjBMgPf5hAFpHc9zQbLQ5BVzGLk4EI13vVODg=;
        b=SyBfM77qdsgSCqFTfxJdE9QfGkTiIXzFuZ/PRHADwELRDSMPl5imS0NK3v+IEsfHky
         elBAqCjBqxgIdLMJiYtkx0xm58wPMweqXd+ybF9H9+8LtnV437guH7czP4SNskazHafI
         EU8jDPF54RWTn7xrLhSdnR1NrqwTyW/o7lVOSHg1Oiy4AcO3fKt4sTld1dZsHQwO+D37
         +XWBQRPTv83yZoe3zSnGWx8YwUBcMBjC6hAFQK9qUBp2iVIdnYCKpFYb4vVrE/NsqwAW
         0m8kt4V+/BpqUlj7URTDUlI3GN549QrGie8x/eqVwWDu9X4A62frjFl0HLmfw/YfwCjH
         ZaKQ==
X-Gm-Message-State: AOAM5336MBV6ylmFvJqnr3E05Tn5Cgb9p6/LTEePagBl9RSsoZrugKWs
        E7eNhM5s1N+R3Sm9RJDzy8aX
X-Google-Smtp-Source: ABdhPJwzte6tnj3o4ehJEi8t+m4u0RNbwDA5S+HTA91nT4VQQl9sjL7VYTPkdMV+BHeugSqr8mvsJA==
X-Received: by 2002:a17:902:a613:b0:156:b53d:c137 with SMTP id u19-20020a170902a61300b00156b53dc137mr20444445plq.73.1651653745422;
        Wed, 04 May 2022 01:42:25 -0700 (PDT)
Received: from localhost.localdomain ([27.111.75.248])
        by smtp.gmail.com with ESMTPSA id i10-20020a170902c94a00b0015e8d4eb278sm1386561pla.194.2022.05.04.01.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 01:42:25 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     martin.petersen@oracle.com, jejb@linux.ibm.com
Cc:     avri.altman@wdc.com, alim.akhtar@samsung.com,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        quic_asutoshd@quicinc.com, quic_cang@quicinc.com,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        bvanassche@acm.org, ahalaney@redhat.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 1/5] scsi: ufs: qcom: Fix acquiring the optional reset control line
Date:   Wed,  4 May 2022 14:12:08 +0530
Message-Id: <20220504084212.11605-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504084212.11605-1-manivannan.sadhasivam@linaro.org>
References: <20220504084212.11605-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/scsi/ufs/ufs-qcom.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index 0d2e950d0865..9e69b9ac58f9 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -1002,13 +1002,12 @@ static int ufs_qcom_init(struct ufs_hba *hba)
 	host->hba = hba;
 	ufshcd_set_variant(hba, host);
 
-	/* Setup the reset control of HCI */
-	host->core_reset = devm_reset_control_get(hba->dev, "rst");
+	/* Setup the optional reset control of HCI */
+	host->core_reset = devm_reset_control_get_optional(hba->dev, "rst");
 	if (IS_ERR(host->core_reset)) {
-		err = PTR_ERR(host->core_reset);
-		dev_warn(dev, "Failed to get reset control %d\n", err);
-		host->core_reset = NULL;
-		err = 0;
+		err = dev_err_probe(dev, PTR_ERR(host->core_reset),
+				    "Failed to get reset control\n");
+		goto out_variant_clear;
 	}
 
 	/* Fire up the reset controller. Failure here is non-fatal. */
-- 
2.25.1

