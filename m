Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E19F32E9A5A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 17:13:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729623AbhADQIw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 11:08:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729617AbhADQIv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 11:08:51 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D57EC0617A2
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jan 2021 08:07:37 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id t30so32738808wrb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jan 2021 08:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=U8FF5tjOadW4QdWdsG3P63qW/Qu0k2UYQBrwR3cTaGs=;
        b=zZaToSCQzfbG+9DACFTBgauuS7lVnmDRNv03flZKIctzTRp4XRNRLNSMg0pE/uys0o
         n7qEFCTaf0rZwKXZtAM5/S3N/QD2oGKrqmOUX1c0z/pQnPX/QCatNdx1IT5a5VBfaP8K
         3OEDWBrqa275zmXLPEiHlGLi0c6f0fv8IEjwDhaE70FTgfGM5C30dkMCS5apDs1iXgIk
         e38daIGhhx3G/MRuL7Kf5ylEReATfBDO3BriQZCu1WjgW8fjkfsG1m/oSBrPfXPyKdOD
         fzsejBVyfkrTqV9MkxaryFPoFICKzsvfXcdBVqDqYuZakULjatukNUaUbki7P7uh9w9/
         VxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=U8FF5tjOadW4QdWdsG3P63qW/Qu0k2UYQBrwR3cTaGs=;
        b=JBPb03BO+kQ0xVe2G4VBsQojxsd+Tn8CoJx1vaSUJBx65AXHBbRSpkWJV2Aw+nA3ec
         HKn/witJTN6LDbFLheJFKmHLtFptJz7ODKbz7TdT7aTXpKdiYZCXjHKOYFKaaR4ZOadE
         5vNJEOw+/il4R6vbPlfl6wRFq0ElF7u+VOuh9d5DBIOI+fUV0+3tKfnR9WZJ7gbJSGLq
         0/r+BoyP6sm5pbVJfT9NdSC/VkwDBm1qaFFpM3mxgBgKdgPJe5sfDOGHy1QF0ajMMEP6
         vInhNfbQOBmnJ5D44l6b8lQtwYw5Mh6HJMsGsaiMLxDZymUw9CRk0r/fpPs8bdJacbpD
         S7Fg==
X-Gm-Message-State: AOAM533fmjwUVyr8/u7z9INhIaKEza5iK8CJ4h8inN1oTPlPQw53fQx9
        9Kf1ygTxy2KARodPAkhq32y4/A==
X-Google-Smtp-Source: ABdhPJxH/OzyGB8IAxdj9gjfeTljZssYrNX5QImEsyk4OQhwJ3Ivunm3PF1KO7+8fSoBf8CtHU/beQ==
X-Received: by 2002:a5d:40ce:: with SMTP id b14mr79383770wrq.350.1609776455832;
        Mon, 04 Jan 2021 08:07:35 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:41b:e085:fa9a:9c53])
        by smtp.gmail.com with ESMTPSA id h9sm89278049wre.24.2021.01.04.08.07.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Jan 2021 08:07:35 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v8 09/10] mhi: pci_generic: Add diag channels
Date:   Mon,  4 Jan 2021 17:14:58 +0100
Message-Id: <1609776899-30664-10-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609776899-30664-1-git-send-email-loic.poulain@linaro.org>
References: <1609776899-30664-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for Diag over MHI. Qualcomm Diag is the qualcomm
diagnostics interface that can be used to collect modem logs,
events, traces, etc. It can be used by tools such QPST or QXDM.

This patch adds the DIAG channels and a dedicated event ring.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index cbf28c3..5104084 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -142,22 +142,26 @@ struct mhi_pci_dev_info {
 	}
 
 static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
+	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 16, 1),
+	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 16, 1),
 	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 4, 0),
 	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 4, 0),
 	MHI_CHANNEL_CONFIG_UL(14, "QMI", 4, 0),
 	MHI_CHANNEL_CONFIG_DL(15, "QMI", 4, 0),
 	MHI_CHANNEL_CONFIG_UL(20, "IPCR", 8, 0),
 	MHI_CHANNEL_CONFIG_DL(21, "IPCR", 8, 0),
-	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 1),
-	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 2),
+	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 2),
+	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
 };
 
 static const struct mhi_event_config modem_qcom_v1_mhi_events[] = {
 	/* first ring is control+data ring */
 	MHI_EVENT_CONFIG_CTRL(0),
+	/* DIAG dedicated event ring */
+	MHI_EVENT_CONFIG_DATA(1),
 	/* Hardware channels request dedicated hardware event rings */
-	MHI_EVENT_CONFIG_HW_DATA(1, 100),
-	MHI_EVENT_CONFIG_HW_DATA(2, 101)
+	MHI_EVENT_CONFIG_HW_DATA(2, 100),
+	MHI_EVENT_CONFIG_HW_DATA(3, 101)
 };
 
 static const struct mhi_controller_config modem_qcom_v1_mhiv_config = {
-- 
2.7.4

