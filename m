Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAC1963FBA5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 00:09:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbiLAXJl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Dec 2022 18:09:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230348AbiLAXJi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Dec 2022 18:09:38 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A85CBDCE4
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Dec 2022 15:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669936126;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WPrzspswmnM04Pzvw/sX2KvWfaVbj7fPyU5av4wS70Y=;
        b=XMEsDOCZIQA4RKU2NMAAH054LBClzG5ATdwZsvmve2PeLODw15gX8/DMpv6pEu9Rg2wwR/
        oPPdA4CTTuTP83Qx8v7ezziYakiQNKiUOaYsVnVRX0/zpzMRrrZKv80m9GLtgRcJsM8NpH
        M6SMF6FThyX58Bxmmedb+alVv4TjWSE=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-107-mmeLrmLROp6F2-vr5CT-MA-1; Thu, 01 Dec 2022 18:08:45 -0500
X-MC-Unique: mmeLrmLROp6F2-vr5CT-MA-1
Received: by mail-oi1-f200.google.com with SMTP id bf10-20020a056808190a00b0035a0a5ab8b6so1810459oib.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Dec 2022 15:08:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPrzspswmnM04Pzvw/sX2KvWfaVbj7fPyU5av4wS70Y=;
        b=YiUKRoiXznEwGaK+dqzwJT54GpJ4eLg0eSfuCYCtovD/5cGkfejbGZdGRFiMMjOjyE
         nWDfDAmX59V2+MEcsGBlC3dFRus+HaFt0yOz2q3VLIx1pGoRyRUbvfQHfL+LKfQ7DE31
         zOgJ5bJl94AUsgYXPCDONKa9PxINbALOpr8b5KPJ8j79toeAXoDpsNew8ZS5PXlDRyDL
         T3rYLfOi1rjxHdDAa2q5j7VA3VzlS/9YUbw/+WexNtP0QQxdD/6gA4DiEJ8Q9s4SJBgZ
         Kdq6uo6eu99XluvIS4gzlfbyjT2jORDEaY+8dLjS53GsDhPBxjZBPYZ+IgRpRw8P+B72
         UP5Q==
X-Gm-Message-State: ANoB5pkDxjrwMDlg/AcWaM4Ox0DO7VWWapksxV/7qGaNYps6I5wIcT0o
        WYuXovN56m32O2tWFoHg2HT55t+zznuBOlK3RGeGRMcg/5VmI7iDxxRqodsTwIKVE/9v2o5YAcY
        Bpll03n+jZkxVgyR3kClSnTefHQ==
X-Received: by 2002:a4a:960d:0:b0:49f:e673:83e with SMTP id q13-20020a4a960d000000b0049fe673083emr23060998ooi.11.1669936124506;
        Thu, 01 Dec 2022 15:08:44 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5YlOgKdDN8wHAmpjNDhFeopPIS0YT5zwTbSpx4fpb8bL8HSsnIOoDDopUdZlbaSXKTV+oKew==
X-Received: by 2002:a4a:960d:0:b0:49f:e673:83e with SMTP id q13-20020a4a960d000000b0049fe673083emr23060981ooi.11.1669936124291;
        Thu, 01 Dec 2022 15:08:44 -0800 (PST)
Received: from halaney-x13s.redhat.com ([2600:1700:1ff0:d0e0::41])
        by smtp.gmail.com with ESMTPSA id y22-20020a4ade16000000b0049fb2a96de4sm2320393oot.0.2022.12.01.15.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 15:08:43 -0800 (PST)
From:   Andrew Halaney <ahalaney@redhat.com>
To:     andersson@kernel.org
Cc:     agross@kernel.org, konrad.dybcio@linaro.org, jejb@linux.ibm.com,
        martin.petersen@oracle.com, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, manivannan.sadhasivam@linaro.org,
        Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH 1/4] scsi: ufs: ufs-qcom: Drop unnecessary NULL checks
Date:   Thu,  1 Dec 2022 17:08:07 -0600
Message-Id: <20221201230810.1019834-2-ahalaney@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201230810.1019834-1-ahalaney@redhat.com>
References: <20221201230810.1019834-1-ahalaney@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This code path is only called through one function, and the hba
struct is already accessed in ufshcd_vops_dbg_register_dump() prior to
calling so there is no way for it to be NULL.

Likewise, the print_fn callback is always supplied within this driver
and is always provided.

Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/ufs/host/ufs-qcom.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 8ad1415e10b6..70e25f9f8ca8 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1202,15 +1202,6 @@ static void ufs_qcom_print_hw_debug_reg_all(struct ufs_hba *hba,
 	u32 reg;
 	struct ufs_qcom_host *host;
 
-	if (unlikely(!hba)) {
-		pr_err("%s: hba is NULL\n", __func__);
-		return;
-	}
-	if (unlikely(!print_fn)) {
-		dev_err(hba->dev, "%s: print_fn is NULL\n", __func__);
-		return;
-	}
-
 	host = ufshcd_get_variant(hba);
 	if (!(host->dbg_print_en & UFS_QCOM_DBG_PRINT_REGS_EN))
 		return;
-- 
2.38.1

