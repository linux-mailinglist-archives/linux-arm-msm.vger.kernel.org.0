Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16A9D519A2F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 10:43:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346612AbiEDIqk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 04:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346583AbiEDIqT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 04:46:19 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5208924F00
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 01:42:39 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id i62so639933pgd.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 01:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Lvh8lsyZI2oOoPbP4vLClIs3xvhFZ7I9YPmzR8c3w2E=;
        b=NYFadom5yTD0av27VsfrNnLB0FSMla8Eyol+HQOl1TO8/PsX+7YjyaZ+EQDMhp0h0t
         ov5kKvlLuCRTu7NNbJt6iDPdHNQ8fzTa8H5tYfcnz5cxwYcgo1nFTl1qBVdesQk1kWyX
         3rDuJzUSwUkppZqQg+EZ2fFcITZHFr9QqTn5jhppHjFOX/T0sPsQtiY6KGqAYRcEc1Hx
         SOVkICj3hfDeU+HNiRnMQsvtLfm2/04gGqtqeN3c2/KKKqV/VhwnR2EhQ2wvF2vhSxfn
         4//r3aqI6BRDyMXCYjSD3gqmNMZ59t9KMZxgp04PJB+g44WWVj2a3glFZBRYkGwTzutu
         nVeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Lvh8lsyZI2oOoPbP4vLClIs3xvhFZ7I9YPmzR8c3w2E=;
        b=r17Pwr/9j4ce3/QkGTbQuWDIyQ1b3rvcxFfOcMtN1TJXrXDiL/nbx2GdAB+EMMZSVG
         D+elv8MBGLFa+DUViqzAeOQHpr8swpv29ACDAV09FHjZrtMPzptFR3HZtTGzxHetUCp1
         y8PDldntGDckJj44W0NDZ+JIgq4VAb8K/NX5FkwYvwT0m8/YQ73wvK/lfhtiNw2YHiBh
         AHSjNohEw6uywnWa3HmdvCTi2/ElnVtu+sfIKlfpzlpnCe7WwNlx1Yyxun/aM38CEM1I
         6vjKXhxiOPAGy0+67oGV7CISr/bxRMLfQZu8WJPwe6Ny9iR0qXzuflt/9yesAr5pyxya
         Vnhg==
X-Gm-Message-State: AOAM5331WOCvQ0BY8kzq0iMvBRdcFgVoiwjmtaPZMgivx6NitFyPP6Sk
        1gcvBfLH/iIauo5ZFjuS2Sflq0r23F4W
X-Google-Smtp-Source: ABdhPJzwWYoSc49RrdrDrqn/x1A0CuBSs67vodfr9CgMS7tS+dOWsYs1nsMhdPXeqUcPHLLn77XHtA==
X-Received: by 2002:a05:6a00:e14:b0:4fe:3cdb:23f with SMTP id bq20-20020a056a000e1400b004fe3cdb023fmr20209744pfb.86.1651653758017;
        Wed, 04 May 2022 01:42:38 -0700 (PDT)
Received: from localhost.localdomain ([27.111.75.248])
        by smtp.gmail.com with ESMTPSA id i10-20020a170902c94a00b0015e8d4eb278sm1386561pla.194.2022.05.04.01.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 01:42:37 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     martin.petersen@oracle.com, jejb@linux.ibm.com
Cc:     avri.altman@wdc.com, alim.akhtar@samsung.com,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        quic_asutoshd@quicinc.com, quic_cang@quicinc.com,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        bvanassche@acm.org, ahalaney@redhat.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bean Huo <beanhuo@micron.com>
Subject: [PATCH v3 4/5] scsi: ufs: core: Remove redundant wmb() in ufshcd_send_command()
Date:   Wed,  4 May 2022 14:12:11 +0530
Message-Id: <20220504084212.11605-5-manivannan.sadhasivam@linaro.org>
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

The wmb() inside ufshcd_send_command() is added to make sure that the
doorbell is committed immediately. This leads to couple of expectations:

1. The doorbell write should complete before the function return.
2. The doorbell write should not cross the function boundary.

2nd expectation is fullfilled by the Linux memory model as there is a
guarantee that the critical section won't cross the unlock (release)
operation.

1st expectation is not really needed here as there is no following read/
write that depends on the doorbell to be complete implicitly. Even if the
doorbell write is in a CPUs Write Buffer (WB), wmb() won't flush it. And
there is no real need of a WB flush here as well.

So let's get rid of the wmb() that seems redundant.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Acked-by: Bean Huo <beanhuo@micron.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/scsi/ufs/ufshcd.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 9349557b8a01..ec514a6c5393 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -2116,9 +2116,6 @@ void ufshcd_send_command(struct ufs_hba *hba, unsigned int task_tag)
 	__set_bit(task_tag, &hba->outstanding_reqs);
 	ufshcd_writel(hba, 1 << task_tag, REG_UTP_TRANSFER_REQ_DOOR_BELL);
 	spin_unlock_irqrestore(&hba->outstanding_lock, flags);
-
-	/* Make sure that doorbell is committed immediately */
-	wmb();
 }
 
 /**
-- 
2.25.1

