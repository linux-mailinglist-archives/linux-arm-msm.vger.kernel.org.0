Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 521102D99B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Dec 2020 15:21:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440047AbgLNOUC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Dec 2020 09:20:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440041AbgLNOUC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Dec 2020 09:20:02 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 156DFC061282
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 06:18:40 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id r3so16607575wrt.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 06:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bY1msGoBjemRs4hKNt3WYSHnFeZbrWNtczzN7TWoXGM=;
        b=dq8H++drKY8U9QCDle1q2vKZZ7TzhkpS8eNvBWbs+4WqseVFZvPKhMNV0rhiZLPpf2
         HPmdqH1Z0pvQXNTYWA+vzTHCKOiiXD2aUCHSw8daZJecyvRcqhLI6WvJrflGFhtAq3x5
         IfKaXDer0gxRX5LktrLiRCEAgeZFm52z3dskT1yPxFhJcrqNOOmyIiPfRNMo3HBTuesP
         WhDXxav+iDlCMTuIY4mSYHVCg2rtsfv72dSEzfIsl67E8yObLGb0SKMIDFrjQcWqwlqk
         j2O14hXe7sDiqq6ZOQQS8mQbkFpmL/RfAfltfrWm1ZgzRpNgTVq5qzjO47Ga42Xx5MIH
         Uo0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bY1msGoBjemRs4hKNt3WYSHnFeZbrWNtczzN7TWoXGM=;
        b=CocTn/A6yZ57uWxlLc9AYiJdXOS2lqMXyMCI1bM3mg5QXVBI7c0hjOz7KHyQw4GXaA
         KVseb/NCgvjrZVLUXNP18r+cqHqUO9kidZfuPCVBWLR9Is1R+01JUntgb3zSzqN7odJ3
         JXtedVI10vZV29siWe5ItdZHaZHEynK2IKVHRRhh1pV1ar4JV/yVV9aCaUR39U5zMohJ
         EQiujYzqNxWHYHf8hzGZljFekvsSRRK2UVdHpB/qgWRwPKiyja0pQPpmHrO5wFomUN+n
         2Dz8DpfHGH87flgc5tehmT/J7a90jidgEGFmVhx7eBJWboh5EfrLiu5WbqM4yfatuziC
         0d7w==
X-Gm-Message-State: AOAM5335eDdVZxL4VfsMhV6zIRWOgcgYJpdFyANsKTZ6dzhpolQq04OY
        2WB8W/FC/TODtlxt8Vxb04yzjg==
X-Google-Smtp-Source: ABdhPJzRvjb4d20ffEupWoAljxUBMJmwUQoYdQo9D0UZg/CWZ0kP1SH5Av02WfH4HNforYnW19cxqw==
X-Received: by 2002:adf:ee90:: with SMTP id b16mr3363358wro.221.1607955518828;
        Mon, 14 Dec 2020 06:18:38 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:f2e4:25b3:2b53:52cd])
        by smtp.gmail.com with ESMTPSA id h5sm34126285wrp.56.2020.12.14.06.18.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Dec 2020 06:18:38 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v5 10/10] mhi: pci_generic: Add diag channels
Date:   Mon, 14 Dec 2020 15:25:37 +0100
Message-Id: <1607955937-26951-11-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607955937-26951-1-git-send-email-loic.poulain@linaro.org>
References: <1607955937-26951-1-git-send-email-loic.poulain@linaro.org>
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
index 156b5fe6..9567b75 100644
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

