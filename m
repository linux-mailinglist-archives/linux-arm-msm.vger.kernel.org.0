Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9210D2E6F09
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 09:39:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbgL2Ihu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 03:37:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726264AbgL2Iht (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 03:37:49 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88946C0617A1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Dec 2020 00:36:35 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id d17so17192360ejy.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Dec 2020 00:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+H0dqYG1zJyMCHg6k54AsatNRlQKpuVWQQhBEPb2DEA=;
        b=ciIi0yjKN2k6PdIwtTm0CtmzO2GKzKG7E0PRkecbE1FS3cUQVCiX4BFwohRAsDYTcf
         e953sx74/jx1AtMQ22bh4WcXXn734hOh8RMKPGPqY4am5udPZsRb0jUA9Sm44QPTbk05
         SR+KOsGOv6F80e58htmaJFBtwmMYsO158VNAcJtIy3LMVmgG/dFIma08PbdO6vwcVq6J
         TVJSAsEvYvh64ink5wjh6oHFp5xXKOOcikC8nzuQNvfYi4JCn9CfBHoh4X82sIkg+9m4
         m4M+IJ2ehNOFPVeanhSxlAHJAm5shmahrWWbQVYMXe/hJ3CegQ1/fgdOOMcMY4Nlek0O
         XclQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+H0dqYG1zJyMCHg6k54AsatNRlQKpuVWQQhBEPb2DEA=;
        b=ukGJ1/IZsVKQ2N4bn/WcXvzAJOi3rBYS1eK8QBtEmZYcT8ed4pEOmf2KOigKct5VoO
         oBLixE3W7utEDc2U83ckV1AKGyD1CHQIB2YuC/98fJPa1LtNYCCxyVnHMVBHniv4B0is
         tkQp2+nd6HGpI8dAR/n9mCUFpijDehhZDaWaoUmJNDPjn4pnZAQciVq0hd0ilNJY+W5s
         jjWTAn2t1UccoT9t/VsUpEOvO6lg2EkZ9n0UBBd3tP7qcrmgVTyIgHqY3dhq2SZBSmVB
         Lt1p3sMamq37TO1JbgCqcdxD83jj0f17tLihZ282Mlg20CSiXcJ6xbs2LeC8vWFd5cIB
         GsUw==
X-Gm-Message-State: AOAM532x/onk59xgNz+K4tYFsc5uHVFtJba7vqNNvbrEHTUEx9nREYcU
        Cbfyn31KW9flmJpTYpypa/Bhw/40RmGQVA==
X-Google-Smtp-Source: ABdhPJyPkEZpR59EsIQcYLQLnpfElaoME7Zb3cHJ0ChX9d8fign9Nv6vw7X31xfdrvGEAevRNg3rSA==
X-Received: by 2002:a17:906:d101:: with SMTP id b1mr25883339ejz.80.1609230994259;
        Tue, 29 Dec 2020 00:36:34 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:6f69:290a:2b46:b9])
        by smtp.gmail.com with ESMTPSA id c23sm37265143eds.88.2020.12.29.00.36.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Dec 2020 00:36:33 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v6 10/10] mhi: pci_generic: Add diag channels
Date:   Tue, 29 Dec 2020 09:43:51 +0100
Message-Id: <1609231431-10048-11-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609231431-10048-1-git-send-email-loic.poulain@linaro.org>
References: <1609231431-10048-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for Diag over MHI. Qualcomm Diag is the qualcomm
diagnostics interface that can be used to collect modem logs,
events, traces, etc. It can be used by tools such QPST or QXDM.

This patch adds the DIAG channels and a dedicated event ring.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by Hemant Kumar <hemantk@codeaurora.org>
---
 drivers/bus/mhi/pci_generic.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index d4ad9c5..0947596 100644
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

