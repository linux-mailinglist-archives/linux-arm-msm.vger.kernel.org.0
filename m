Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1D55654292
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Dec 2022 15:14:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235666AbiLVOOU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Dec 2022 09:14:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235558AbiLVONZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Dec 2022 09:13:25 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACC322CC8D
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 06:12:09 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id s7so2127068plk.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 06:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Umv4TvSxWOIQ+FsO7JFyleWWrH/ciDg2B2wQfJu0u8=;
        b=lFSSRkVosTBl7NH1CjbznzIGAhg1vr0OY58REMnY5M10cAyYyb2kWljgPPZK+purpL
         tkoP2lQhnWegg7up4xJ7Glzy1oRsWoz+U4ZzaV2EZylwUbdC59PnTlUSQTVkJ5O99jGM
         dxwsmXAnqzqkf4CWzclp7h8P0im11vTrb/mwtclro3NVJ2zi6pS2rVWrrXYIzh/dMG4y
         N8kItD1Dhc0fSBQHdSQ8WUXMgIy2C4HWNoVYUTizsMwgNzJIb1y6buVo1qTzWGJ0FNvq
         DnKtsXUl341uWX/LhSn8MJZ/hpYKPNR3XRta/FNYJ7+PRgzpJvgucZ1qRmvMqnM9ccts
         5o9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Umv4TvSxWOIQ+FsO7JFyleWWrH/ciDg2B2wQfJu0u8=;
        b=7m/XIq77dfbLHq1Qxwh1RLSD4AQDUW/Vnyny23sNvgdpvhnq6Ait9xwHE5L4VInI8v
         TkdilUTo56zjONKWqvO9VNAvldyGtWjAJpeO1Clvx2b7QUadbjBjeGCxlXlmOGXPhGMp
         JfG0J0OeRhvOukkvWg/ilEqZsBq0QHN/KKPLbDwkL7XoALCIAyDxIxDGRe3dKLcbVf3/
         jWPYDzFll80hD7ytUDRQGrk/51wngQT4utZhI1AUPU+CoirW5yeCyhX1pIVzG1jKG5/e
         Og+zZe6ynOr/YtgjmFkIF0bQH7IGe8qqbg43nPFShw+Ak/fiKfXgaRxj4icniovNlQGL
         iZrw==
X-Gm-Message-State: AFqh2krFwSy+V/Df988Bc5Uzx1tbTWOdePxsUM6BSwiG2JdnYHYXYPDF
        ryYKxCXI5CEzzk7/jCLeSXc/
X-Google-Smtp-Source: AMrXdXsfA22qTY7Dpuhd3BPItBnKL5MRnihwLcXslA73ddu+1EMjMQTU80L5uyMZTcdu/fyDqeutaQ==
X-Received: by 2002:a17:90b:300f:b0:219:823f:7216 with SMTP id hg15-20020a17090b300f00b00219823f7216mr20532049pjb.31.1671718329192;
        Thu, 22 Dec 2022 06:12:09 -0800 (PST)
Received: from localhost.localdomain ([117.217.177.177])
        by smtp.gmail.com with ESMTPSA id f8-20020a655908000000b0047829d1b8eesm832031pgu.31.2022.12.22.06.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 06:12:08 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     martin.petersen@oracle.com, jejb@linux.ibm.com,
        andersson@kernel.org, vkoul@kernel.org
Cc:     quic_cang@quicinc.com, quic_asutoshd@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org,
        dmitry.baryshkov@linaro.org, ahalaney@redhat.com,
        abel.vesa@linaro.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
        bvanassche@acm.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v5 16/23] scsi: ufs: ufs-qcom: Use dev_err_probe() for printing probe error
Date:   Thu, 22 Dec 2022 19:39:54 +0530
Message-Id: <20221222141001.54849-17-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221222141001.54849-1-manivannan.sadhasivam@linaro.org>
References: <20221222141001.54849-1-manivannan.sadhasivam@linaro.org>
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

Make use of dev_err_probe() for printing the probe error.

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Reviewed-by: Asutosh Das <quic_asutoshd@quicinc.com>
Tested-by: Andrew Halaney <ahalaney@redhat.com> # Qdrive3/sa8540p-ride
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 8bb0f4415f1a..38e2ed749d75 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1441,9 +1441,9 @@ static int ufs_qcom_probe(struct platform_device *pdev)
 	/* Perform generic probe */
 	err = ufshcd_pltfrm_init(pdev, &ufs_hba_qcom_vops);
 	if (err)
-		dev_err(dev, "ufshcd_pltfrm_init() failed %d\n", err);
+		return dev_err_probe(dev, err, "ufshcd_pltfrm_init() failed\n");
 
-	return err;
+	return 0;
 }
 
 /**
-- 
2.25.1

