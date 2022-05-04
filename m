Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2D65519A2E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 10:43:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346565AbiEDIqj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 04:46:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346612AbiEDIqa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 04:46:30 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E36A124F19
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 01:42:42 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id z5-20020a17090a468500b001d2bc2743c4so700333pjf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 01:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Up2fAJgMf0kaWNX6KayG2iG4ovLjRNyGdehP+ZCx6XI=;
        b=HHk0bHFYywL5PAJAJwPZ0gk/mxn9hJlTjL41vCuaNhVHit5I9mPsTeZ8XzcOWQqkXr
         9ZD5YiD9SDEBjtG+bxFVjBkhe1gxl8cBKvWcRiiUce7JyJ8GrZuOdvkNunKFRmAvhkKp
         tIpohSy2GqAxbEIZ8KzFVEHa4qWsXVx9v8NQOOe98oOQOw7m6tcozsZFhGDgWAQJfY+i
         ACxR4TWkNeE6ZTkTTJa/JrP8Ktk36rauMwsPPwv1oTnRFtW3W7QTjFhs5f/RB8ZCeOkG
         I8NC7rccUW5Fa7M92lNT7Ft6lLuw7R+E4v6tFVatg372Kj5SbChJkZBdG/FAzDhTT3qj
         FASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Up2fAJgMf0kaWNX6KayG2iG4ovLjRNyGdehP+ZCx6XI=;
        b=pDVekoAPJFth2Dw+ySAaE8d7+pqjLxvFQpa2JQDfQ3sKMkgkA/SOupr6ucjBDbbVsu
         J6AH1b3alMCMkH/ztmqAywo9HwWMIFYkmrfBtvs2SgTbqsQMUuGDSpoK1jgmWx9Lbq6l
         RcCrXfJKIaLoT2Zl+AAsH1nSpnECPCgo6+w4c4Rp04mgBqQF5jtl49jSGpTzY+XMl2It
         rvm54Q3sPQxfacg7wuii3Zm/bLke+Pohn9edOT4g1hdLL01mtwSh3Ic4TcxWwRmv3lJr
         O5GlwRZr5KhpJ5CibGGoFB0HIqj80nYBea+MyBcDkyQW4ehmdPfNdwJCRGYUPh4JwWX/
         hF9Q==
X-Gm-Message-State: AOAM531quUjpD9psbSpSSphZkhLOjnMOvhplTvdV/gTV0gZAsxVR/9gz
        sMxVE7ujv5z23IT41qZtM7Ae
X-Google-Smtp-Source: ABdhPJxlKxetsi90KaLcM4uKZj9hOlXD5OcsWlwJitZdBW2rjKRg25l1Wz7uvsglmvayy3XHnoKW2Q==
X-Received: by 2002:a17:90b:2311:b0:1d9:277e:edad with SMTP id mt17-20020a17090b231100b001d9277eedadmr9202775pjb.190.1651653762213;
        Wed, 04 May 2022 01:42:42 -0700 (PDT)
Received: from localhost.localdomain ([27.111.75.248])
        by smtp.gmail.com with ESMTPSA id i10-20020a170902c94a00b0015e8d4eb278sm1386561pla.194.2022.05.04.01.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 01:42:41 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     martin.petersen@oracle.com, jejb@linux.ibm.com
Cc:     avri.altman@wdc.com, alim.akhtar@samsung.com,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        quic_asutoshd@quicinc.com, quic_cang@quicinc.com,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        bvanassche@acm.org, ahalaney@redhat.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 5/5] scsi: ufs: qcom: Enable RPM_AUTOSUSPEND for runtime PM
Date:   Wed,  4 May 2022 14:12:12 +0530
Message-Id: <20220504084212.11605-6-manivannan.sadhasivam@linaro.org>
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

In order to allow the block devices to enter autosuspend mode during
runtime, thereby allowing the ufshcd host driver to also runtime suspend,
let's make use of the RPM_AUTOSUSPEND flag.

Without this flag, userspace needs to enable the autosuspend feature of
the block devices through sysfs.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/scsi/ufs/ufs-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index b718c38fccc9..358fa8ce51b8 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -876,6 +876,7 @@ static void ufs_qcom_set_caps(struct ufs_hba *hba)
 	hba->caps |= UFSHCD_CAP_WB_EN;
 	hba->caps |= UFSHCD_CAP_CRYPTO;
 	hba->caps |= UFSHCD_CAP_AGGR_POWER_COLLAPSE;
+	hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;
 
 	if (host->hw_ver.major >= 0x2) {
 		host->caps = UFS_QCOM_CAP_QUNIPRO |
-- 
2.25.1

