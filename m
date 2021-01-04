Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12B6D2E9639
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 14:43:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbhADNnc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 08:43:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726855AbhADNnb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 08:43:31 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E70BC0617A2
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jan 2021 05:42:18 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id q18so32254777wrn.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jan 2021 05:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=54UD8sDmkp2YqxTR752q2R24vr5pZoViVyeG5l4/Dx8=;
        b=Kv2TLMJUizrVm9M4nBkR7h8kUPP4P1HsCKS+usLXHe5Xg1gEtKghvdMBkPl0eR7kDA
         +qGXd4m0O5nlZDTByANuxcWxsmvZK1vE8YjZyJE4j3F4qLUrADvlXhu+PletD3rjYWfc
         YueVusilMtw+wgbbSUw9MtgX5ovkoqQR/ai/BOQGyfMHZ42u+8zfAx3m+m610aIEhcrG
         A9KCvSlH++gtwcHO1hA8tvnhaTi0QQGOUYdqT1KWif0iR9i0x4HlmXetHPA5WrX79cR5
         +UNXTtaBP0wfw0hAgGRUcDaPRj0LjiG2BOuYzQ3wK4y1c4XVxH6LGeWU6SLiniyKEGv6
         uE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=54UD8sDmkp2YqxTR752q2R24vr5pZoViVyeG5l4/Dx8=;
        b=rKAEO5K+elYbLCi2urfZuGwyYqyHd3skBfAv+/24ySLWoaZi/dfMwOpd16BNjJF401
         53VJOQfVP30FSODDFS+ZzJm+FRBjP9eWSJu+7/e3MdAz6sgfDUwDOp+a/IKtYE1CQOws
         HdUtrk5vl6MBvzp9Bpl/ReqIQ7b+09HxeYEa7U3Zwkr9JR8gLb4r9TlSls7jEYCAF+47
         LA7ZR3EmcoO7upw/f8DUrrA1m2cu9WJFSEfPGAacu/sOqHKrETf7izW6C3bbm2iP5YOg
         ejN3Eot4ek7OwO+PlEzM/LSnbOAvs7sfhGIxoqp1s/sgPkzWwhWVaQEvIH2zAa/2lyrY
         5o9Q==
X-Gm-Message-State: AOAM533w58EoIGRpccwndbf3lG8PsdzdFC52pw4P9+CeiRuAy7kpu704
        xMtzFdPeyaso/mRrHOtbpOZLvw==
X-Google-Smtp-Source: ABdhPJzGI59Q4uOMEWW0/Pb3Wsove5qzMXVljBmxOVp79Q7smI0lBus/OUxTSPdAE0B2E4BcXMYtGg==
X-Received: by 2002:a5d:6cd4:: with SMTP id c20mr79703181wrc.57.1609767736930;
        Mon, 04 Jan 2021 05:42:16 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:41b:e085:fa9a:9c53])
        by smtp.gmail.com with ESMTPSA id w4sm34042968wmc.13.2021.01.04.05.42.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Jan 2021 05:42:16 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v7 09/10] mhi: pci_generic: Add diag channels
Date:   Mon,  4 Jan 2021 14:49:38 +0100
Message-Id: <1609768179-10132-10-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609768179-10132-1-git-send-email-loic.poulain@linaro.org>
References: <1609768179-10132-1-git-send-email-loic.poulain@linaro.org>
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
index 5188ca2..a4b6221 100644
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

