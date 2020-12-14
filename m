Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D0F12D99F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Dec 2020 15:29:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440041AbgLNOUC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Dec 2020 09:20:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440043AbgLNOUC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Dec 2020 09:20:02 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13C91C06138C
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 06:18:39 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id a6so13855327wmc.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 06:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tg3mpSdAU62FkiSqPGbsW9AbKsLEPWMetHqB4PYOr28=;
        b=WqpIRZt8KnR53n9fM24eCdoIXUMaK5c+AEc8W9gbyPtof2oMdO3drTOFXVXKHHxBHA
         tz+wI4bybRVUU3G2WShWsncoAw6SYZ9d2CBNVcx5Gnv3c4+UKcYuqDeJpZltqVx8DHpl
         sFcEgX1TdU9SE4mt0lKueD9aUTfvpqjZcdv8HAJnm4fekR3INHRQR6oP6Zh/bbNwND3x
         fFB8kmQW0Wx5tqRk/RzFDAUzaVbF9NagXallBbZERVJUWWyaTL3kTabkq3mXRofH6n2z
         26SHkd5V62N3FVMJdOUx483P366ohjuBeBs98UCSE5w5vuMbHxD+KVm+ZWLlDr4NKzbh
         QCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tg3mpSdAU62FkiSqPGbsW9AbKsLEPWMetHqB4PYOr28=;
        b=aNB5VWUEZz7SotqU1mRnCbAZAOCcb43CZyKbmYC0TQYuMG40SujZfOHHS01E+tNlnN
         4J4PJIc7Hclf/fIz504G+sBuxLFoHFbCNOQW7Oe6FSGPqhAD7QeGrOUhHhj0M8k2x/LY
         dpRV+v0n1bUwqCVGBR/zDSdvlQ0FWXlJetqMCUVz+kQ0pESFPKXYmAM5wWC4nki+MbU3
         PvLTmCaitsJwZSqaxKBwI9fkhkhss9FqNwxb/kLw9i+ZijLYHnGHo6GyaTxU2BNZ6xf0
         hPF1iWF5vhQ2qNXya8pAGQDOA3HBL3DbhZh27sek2vaiPDNmulLoRHm5TJEHmL7Xp2xA
         tkOA==
X-Gm-Message-State: AOAM533f7eRsZvMqaFQGmcPRzgFr6ek3ziaC1KBOt3UN262QvYGZnEx4
        igevglJoHikl+VEcdXn6uvtX+A==
X-Google-Smtp-Source: ABdhPJzsXwLXXDERih6Xj4EHr8lRT3buRsu++j4ubofVWeDjUlffyZm8ow5arojWe6etbk8n+BgLBQ==
X-Received: by 2002:a1c:e306:: with SMTP id a6mr8773433wmh.66.1607955517810;
        Mon, 14 Dec 2020 06:18:37 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:f2e4:25b3:2b53:52cd])
        by smtp.gmail.com with ESMTPSA id h5sm34126285wrp.56.2020.12.14.06.18.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Dec 2020 06:18:37 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v5 09/10] mhi: pci_generic: Increase controller timeout value
Date:   Mon, 14 Dec 2020 15:25:36 +0100
Message-Id: <1607955937-26951-10-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607955937-26951-1-git-send-email-loic.poulain@linaro.org>
References: <1607955937-26951-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On cold boot, device can take slightly more than 5 seconds to start.
Increase the timeout to prevent MHI power-up issues.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
---
 drivers/bus/mhi/pci_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 063a287..156b5fe6 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -162,7 +162,7 @@ static const struct mhi_event_config modem_qcom_v1_mhi_events[] = {
 
 static const struct mhi_controller_config modem_qcom_v1_mhiv_config = {
 	.max_channels = 128,
-	.timeout_ms = 5000,
+	.timeout_ms = 8000,
 	.num_channels = ARRAY_SIZE(modem_qcom_v1_mhi_channels),
 	.ch_cfg = modem_qcom_v1_mhi_channels,
 	.num_events = ARRAY_SIZE(modem_qcom_v1_mhi_events),
-- 
2.7.4

