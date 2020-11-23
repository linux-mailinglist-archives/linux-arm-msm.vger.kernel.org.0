Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C08B42C0CC0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 15:14:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730272AbgKWOE6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 09:04:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729293AbgKWOE5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 09:04:57 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13446C0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 06:04:56 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id x22so326009wmc.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 06:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7QVXRuSQRcdb6AL7NuvHYajJfP/2yPewTAqkWZGKlWg=;
        b=DPBJ1S6+A+BztDDOPCp/cWIg2selYtYuFF0zNZLu0kdn9NQU99fHE8rCLFraj4lh58
         biHV0Yxli3Wu4965EYef8MXO/0djmXkLy+56EiNMV4SYJw2R4+udtqXoyMz2oWT3fWAc
         kz217Nz2WRiUBzN8J3Ij2q+tmMvSbs9WPClVNsOozUnktz5+4HwLe3XbQwD/oTGqENAX
         5wgAI4lU4D56BmQze80p02svgv2Xmd3mRInCkgaJbkl99o4U0sFgtoXOGpz7jgeXe2/g
         uyzW0qP2+q8bUzEGptllgw9mJvM/fqCRG7U529GcZQeeoVdFA33x+ZdtYSwyIvwahWF2
         mkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7QVXRuSQRcdb6AL7NuvHYajJfP/2yPewTAqkWZGKlWg=;
        b=rEKt++Nmp2ML8/ogKwNVcMK/fkrQoOyf37oBBDbFRs8pGzJX80nMIBdScHQzPZgQsW
         FDcr8wz0rmWklVR0lbeFt3xDbl7CWFas/hD2hABQdHE+gplLU8m1teJUOh3h1pBhBje4
         utCGwji2G1yZ5OzAfMqHf23JdPcR0Uj8nRZyQ6UOjR6gfconTSHQDbUZ6CKivr0XErL8
         +9a+W5yBfrAHUGxpfbHa48BH0kHSbyzeCT9bpfUeeRwbfNn0AqRSqmHqi2CG5ABaoulW
         vgfLzul3cuQhXoiXFZEgTpyCokxRW629yIsBMqV/AnICxNfz6Yeb2Se5Dsrriv3BAPGq
         aJ2A==
X-Gm-Message-State: AOAM532mnRm3Wb7wZQSn3QiL4q+AM/BUEucWBgP6S0PHbIqIebekHvwN
        sHfMVapDd2IdARNkHZpal4acDA==
X-Google-Smtp-Source: ABdhPJw7SpgPUQt3GndEmA92gJrkCk7UfBSKceEVERHMX3UZFDeajYWp7LZ25jQqz6j2feyS9bsGEg==
X-Received: by 2002:a1c:2d93:: with SMTP id t141mr24251499wmt.104.1606140294755;
        Mon, 23 Nov 2020 06:04:54 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:f5cd:e791:e88b:e3b7])
        by smtp.gmail.com with ESMTPSA id m9sm7102727wrx.59.2020.11.23.06.04.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2020 06:04:52 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2 8/8] mhi: pci_generic: Increase controller timeout value
Date:   Mon, 23 Nov 2020 15:11:06 +0100
Message-Id: <1606140666-4986-9-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606140666-4986-1-git-send-email-loic.poulain@linaro.org>
References: <1606140666-4986-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On cold boot, device can take slightly more than 5 seconds to start.
Increase the timeout to prevent MHI power-up issues.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 3e00658..672c5f5 100644
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

