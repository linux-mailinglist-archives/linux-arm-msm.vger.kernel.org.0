Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BD6A63F697
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Dec 2022 18:46:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230356AbiLARqn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Dec 2022 12:46:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbiLARqD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Dec 2022 12:46:03 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1589FBBBF3
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Dec 2022 09:45:19 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso5974534pjt.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Dec 2022 09:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RgfrCdEhXykVwBp3nVTN7WEjo711kZc0QKngTjXB/aU=;
        b=F5Y0Q5UQLyyIR5QPRFA5yUqqUh1IxjxKnxrw7Sg44Xod7IPkxDk8a8CvKdMfIKAu4R
         8JPI6vH4kowAIxeAtJ4bFRkU5Gn9nlW8Cqevp1wF/BckB6B8H2KcLqmorCEE1Zzb0cI6
         UUTeX3qDPg+udsYi3swPmdvFHV50CMC3cd2RYw2iEpPIzM2SkNSVmYc0KSz1sSBsL7ls
         GfdGRgfyV0yZfHpQdtAZ9//P9o1qB++UJXkC1FmvHhTk/QzQxW+3Iam3ZgSr9u4HkJfO
         FBYLzj9kA1r3l2Z43glviXlDKmd845CiempMsq6KKAJbctYVyTLtO5Z9Q1gNeV2BF/AK
         dPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RgfrCdEhXykVwBp3nVTN7WEjo711kZc0QKngTjXB/aU=;
        b=U62pp8dsVqxIzsekYYi2qk2WyTTQCYW4n6Gn0uRExuOAV7598eB3SqS/EWE/ySSlro
         1mPwjV0qrsAD6HqvDfqUb7w3Wu86bQqDx180UIgX9xvzIUqQXJQHUt6AaD0Tdt8xbiDp
         WLXiKGsQJRwt7zuWCo+noxLO2P2diK7Lu5+vFTKGDDYHSpJkfNDfTRu60IgSnfmtgvfw
         bPCkPk0EEqk+kdpTRz7137Jo3uIC6V4I/S+niZCYmrSZkQUJu9aOXZtJmsZMQb1hlnWB
         xcm03i3FyjddPdiLgE5QDjfbEVfO8R37wHejpjZiEc6/LXj8d8LMbsyGqFRjA+cheFI4
         Y0pA==
X-Gm-Message-State: ANoB5pkvHcH8it3rEN85ICgI+DtjfvaJ2UfS5boWkejl2yrvX2xxYtva
        CS4zr4leotvU5C1V9qncPcts
X-Google-Smtp-Source: AA0mqf4RNaazYmkyS7egwN1iTEJDJ3lN1cFKiS5tVRX/fWUVO+9HFwVP5nZEnrW4BdqyH9lc2QPy6A==
X-Received: by 2002:a17:903:2683:b0:186:6f1e:5087 with SMTP id jf3-20020a170903268300b001866f1e5087mr50040574plb.119.1669916718738;
        Thu, 01 Dec 2022 09:45:18 -0800 (PST)
Received: from localhost.localdomain ([220.158.159.39])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902780400b0016d9b101413sm3898743pll.200.2022.12.01.09.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 09:45:17 -0800 (PST)
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
Subject: [PATCH v4 14/23] scsi: ufs: ufs-qcom: Remove un-necessary WARN_ON()
Date:   Thu,  1 Dec 2022 23:13:19 +0530
Message-Id: <20221201174328.870152-15-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221201174328.870152-1-manivannan.sadhasivam@linaro.org>
References: <20221201174328.870152-1-manivannan.sadhasivam@linaro.org>
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

In the reset assert and deassert callbacks, the supplied "id" is not used
at all and only the hba reset is performed all the time. So there is no
reason to use a WARN_ON on the "id".

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 7cd996ac180b..8bb0f4415f1a 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -895,8 +895,6 @@ ufs_qcom_reset_assert(struct reset_controller_dev *rcdev, unsigned long id)
 {
 	struct ufs_qcom_host *host = rcdev_to_ufs_host(rcdev);
 
-	/* Currently this code only knows about a single reset. */
-	WARN_ON(id);
 	ufs_qcom_assert_reset(host->hba);
 	/* provide 1ms delay to let the reset pulse propagate. */
 	usleep_range(1000, 1100);
@@ -908,8 +906,6 @@ ufs_qcom_reset_deassert(struct reset_controller_dev *rcdev, unsigned long id)
 {
 	struct ufs_qcom_host *host = rcdev_to_ufs_host(rcdev);
 
-	/* Currently this code only knows about a single reset. */
-	WARN_ON(id);
 	ufs_qcom_deassert_reset(host->hba);
 
 	/*
-- 
2.25.1

