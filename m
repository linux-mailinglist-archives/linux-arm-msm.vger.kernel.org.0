Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2781C2E9640
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 14:44:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbhADNnc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 08:43:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726098AbhADNnc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 08:43:32 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B534C0617A3
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jan 2021 05:42:19 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id i9so32216002wrc.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jan 2021 05:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9tlpLam/mx4YYUtrncjvdnpIoZDvtEDwVLBS4GoWT3k=;
        b=AXwp40BnBQH4Q5DqRaRwfoWGI4DCTmVT/p0zNuEIXLg3C7uEDVk6B3NzGFmuZzgheZ
         IgnLoDm7PO4gqsqP4g59S0WM58AraDhFRia1RIXsGcRE5Nzq1fC9hBvycLRYabIhg4cw
         pVK6x9vIjd8myoq/gInNghuoFDj5NoVRdbBH5uLRzTM6gj1kP/sXStNvu0VSpi7cLfs1
         j7o0bweKr/TC3VTWgwAbHTthi4WAw4mHXuo6dUG7Lneqf+NbTO63qRRN/XAdm8ybWW1n
         h0JbNO7FJWJN4pcjFacjpJ8y9fwOTDWsPLAdjbxb7HKdZNyiacP2u9UIZEv2XuDT6C0o
         2Zwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9tlpLam/mx4YYUtrncjvdnpIoZDvtEDwVLBS4GoWT3k=;
        b=o83HKkZSNg2ykflv25mIM3lYv/yhTX267Fp17VHuO3J0untW3yzJClxuutRx0X8r9i
         51FeHK765HlVLvS9Y5VBzy/Fpj0QH5KXyMeVYDz9xwYrIS7xGlY+hJCe7a9shdckO3Ta
         WFYHI4MsrB/0InNovzBKFhmQKps/TJuJDnbMrbZ8waqRXLsOYc2ww4/Oot8NsAaOwIbO
         vF2x1+QbOm7BCUbNSxyFT+I4IIVViPxnoc5ADqekJfiz/J2/j7DVoPm7psHlJvUYgK70
         eB0NWbOpd1Tcp1O+iS5lTNRLHYsYKZpz1yzhXWFmNtYZ0Ls/IbQe+ABmZuSoyIgUYEhD
         I4OQ==
X-Gm-Message-State: AOAM530XLHEjNL63c7AfHlAd+ATfNx8ncBF3Y7/w26ymo4xEdCtVo3L2
        9VYIdYKvFUplH8OztXn0X2IWw1gOMaG3mBwJ
X-Google-Smtp-Source: ABdhPJxcR9C0kzTw8blAgX/eXIkzEJAW/qDs0ygfoG//pjUSGW3VOpdnFkiACxt4LctJBJo15zqTYA==
X-Received: by 2002:adf:ee4d:: with SMTP id w13mr80080322wro.216.1609767737803;
        Mon, 04 Jan 2021 05:42:17 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:41b:e085:fa9a:9c53])
        by smtp.gmail.com with ESMTPSA id w4sm34042968wmc.13.2021.01.04.05.42.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Jan 2021 05:42:17 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v7 10/10] mhi: pci_generic: Set irq moderation value to 1ms for hw channels
Date:   Mon,  4 Jan 2021 14:49:39 +0100
Message-Id: <1609768179-10132-11-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609768179-10132-1-git-send-email-loic.poulain@linaro.org>
References: <1609768179-10132-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MHI hardware channels are usually the hardware accelerated data path
e.g. IP packets path for modems. This path needs to be optimized for
low latency and high throughput. After several tests on FN980m SDX55
based modem, it seems 1ms is a good default irq_moderation value:

- It allows to reach the maximum download throughput
- It introduces limited latency (5ms is too high)
- It prevents interrupt flooding

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index a4b6221..1603c83 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -130,7 +130,7 @@ struct mhi_pci_dev_info {
 #define MHI_EVENT_CONFIG_HW_DATA(ev_ring, ch_num) \
 	{					\
 		.num_elements = 256,		\
-		.irq_moderation_ms = 5,		\
+		.irq_moderation_ms = 1,		\
 		.irq = (ev_ring) + 1,		\
 		.priority = 1,			\
 		.mode = MHI_DB_BRST_DISABLE,	\
-- 
2.7.4

