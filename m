Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2136D613CF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Oct 2022 19:04:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbiJaSEN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 14:04:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230088AbiJaSDx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 14:03:53 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C144F13E38
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 11:03:43 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id y13so11336334pfp.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 11:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3s4pb9x6UWl8wDrCXVlNY9pvnbipHUCj9wO5Sx7YnCg=;
        b=Aqxzg4D/i1JrHY1gvTUikcKWYvNIR6/SOWTFirfsyknenpTiNExSaqMPOO4XTOGMr0
         WjaDMhmDlSBJFRherP07thMkDv9uP+ytT5h5rOISFFZfNOFMDV3dcQb3AOJoxziDHC+E
         aAg446XXtI5x1pD2GSVM/M9gsGM3Q7t49dONxrBYaSSRdpHjZwMhxxv+/dKs1WM3vZmv
         ez3Wo8Z7SEIaD4GAmyrhJwYWHha71PE38otRjY3zU9gjAae1GRWd/vgCujig7aX3uFP1
         pDwfXQmLAJNarMjlLz7QQRiC30fJ8d0aTD4Bu3a4QfMpbHg8GU/5QC94xE889PcLnOZc
         XWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3s4pb9x6UWl8wDrCXVlNY9pvnbipHUCj9wO5Sx7YnCg=;
        b=dq6+EGnI/e4UV7NLOSYzeKwor982v5mfj+K9zVEGPOqwosz9RagFEaNjdwEIcr9jrB
         TLbIdabusrlEF94litZAK5IdFR9Q4LqOjjHMBI6W95pR8MqD/jBS8SLSypEmuLMgLYXP
         Jlkx/u5JzB7VnK3c3cpjEe5whfAosAbGC2+RN2lzbuYN8frifIA1eckO9KzZssqn1yH6
         Gc/PWKYZtyR8dW9Az/kyhW1pyDLDhOgB31xMpOKUAIbUYa4ARuYj+s3kXY84praqbx1S
         aRRz2EvmMbXyaUYVerz8GECgCP9BiKdnTmAxoogumVK/JP6yKd1dMJyH9Q5oWIgRJ120
         OZ7g==
X-Gm-Message-State: ACrzQf2DebIa3mEuCkYsQO9qTqw6Huz4L7RHYQFovlpMgKkuCsMwKDlB
        houFcYvF6CT0ZmPSsZ+wLKS/
X-Google-Smtp-Source: AMsMyM7lyqNnH5Zv2natwI+SL8YjteI6+uttuWSF9voVktP1yk/eeh9VzW9d4o4g84anScqZQNZXeg==
X-Received: by 2002:a63:e218:0:b0:448:5163:478f with SMTP id q24-20020a63e218000000b004485163478fmr13962942pgh.415.1667239423271;
        Mon, 31 Oct 2022 11:03:43 -0700 (PDT)
Received: from localhost.localdomain ([117.193.209.221])
        by smtp.gmail.com with ESMTPSA id q14-20020a170902a3ce00b00186c6d2e7e3sm4742224plb.26.2022.10.31.11.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 11:03:42 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     martin.petersen@oracle.com, jejb@linux.ibm.com,
        andersson@kernel.org, vkoul@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        quic_cang@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org,
        dmitry.baryshkov@linaro.org, ahalaney@redhat.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 09/15] scsi: ufs: ufs-qcom: Remove un-necessary WARN_ON()
Date:   Mon, 31 Oct 2022 23:32:11 +0530
Message-Id: <20221031180217.32512-10-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221031180217.32512-1-manivannan.sadhasivam@linaro.org>
References: <20221031180217.32512-1-manivannan.sadhasivam@linaro.org>
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

In the reset assert and deassert callbacks, the supplied "id" is not used
at all and only the hba reset is performed all the time. So there is no
reason to use a WARN_ON on the "id".

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

