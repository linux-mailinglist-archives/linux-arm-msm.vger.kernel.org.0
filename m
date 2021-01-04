Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A1862E9A4D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 17:12:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729567AbhADQIS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 11:08:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729400AbhADQIL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 11:08:11 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7C6EC061793
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jan 2021 08:07:30 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id t16so32713316wra.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jan 2021 08:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WVEYav8eI3T4T9GoKINuGacLL3TQkLxasRSkMoJNjdY=;
        b=D40SRcCS/iGiccuwfdI0LtClpd5UB6a8SNIFW3sMkUSWV/EkQK4MyDIHNfso5Byr+j
         /HMuXi7aLRYYJrOGpsEjxjrfIuTGtp69nxI2AkUlvzCsIKMwT5yk1M2n7NSQExpOreLJ
         010fCXCI3GqpzU4zQAoMxNIFKVJQ+ku5U0bufTn9RlQ858uOWSsvqzPl+7GMej/Zc3UA
         g7NmlJ5hsvEQDmRneGx87sBQTeaTks1jyXe0pFlqf8zZ2upUGt2PpKIXpIPcYO347Drh
         jIzz28QWBfR8qkOosIKk+btJe+NGeQ8ugmDXdrw3ocwVcquuZH7ixpJaxZLdxcePDqEK
         ez5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WVEYav8eI3T4T9GoKINuGacLL3TQkLxasRSkMoJNjdY=;
        b=QqSpaOZZ9CmWnzO6o5uyeMBflYgy0pf4J/j9kay6mxLqzDosQjeLrEru5yDYcWpCIi
         huCMLACrKzLTiUFWFxJZY8rYgKR5vTS6+Ic7x3wWc/beHK7u6uSxQLkrMZ7GSFGc+lFF
         hknzuVNW7aqlN3KLkbqgTlOMXuvapP8jJu3X7M15XSkIUCABDrxj9qVzRY1yAtGoF9Ro
         Yf3lJSt/9YoQp+i0Hd2sdLC+3MJMwPYkU3dPNIl1w2+X/+DJHin0EmhiXlRdL2YqRBRc
         e2WV7sBve9ubA3zTv5t4EIt67c7E6dIVQFISWzZr4gxmxjjYC3/utNI7t/eYa/s1fXpl
         ASvA==
X-Gm-Message-State: AOAM531i+KDHaFVxERVNQgM9WjmNTh5yfgcwCjZRXvpRUqgvkKwEBubL
        SV9sSnKG26HVLyinKlksO3q/TQ==
X-Google-Smtp-Source: ABdhPJy4vJrd8uwL1qZrWaivuA8G5/EcLbbNczxVwwsz8b6u/bqdiSmm0p8vFd76YzbW9sBzUlCIWA==
X-Received: by 2002:a5d:5442:: with SMTP id w2mr80585088wrv.418.1609776449431;
        Mon, 04 Jan 2021 08:07:29 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:41b:e085:fa9a:9c53])
        by smtp.gmail.com with ESMTPSA id h9sm89278049wre.24.2021.01.04.08.07.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Jan 2021 08:07:29 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v8 02/10] mhi: pci-generic: Increase number of hardware events
Date:   Mon,  4 Jan 2021 17:14:51 +0100
Message-Id: <1609776899-30664-3-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609776899-30664-1-git-send-email-loic.poulain@linaro.org>
References: <1609776899-30664-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If the IPA (IP hardware accelerator) is starved of event ring elements,
the modem is crashing (SDX55). That can be prevented by setting a
larger number of events (i.e 2 x number of channel ring elements).

Tested with FN980m module.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index f5bee76..d3896ef 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -91,7 +91,7 @@ struct mhi_pci_dev_info {
 
 #define MHI_EVENT_CONFIG_HW_DATA(ev_ring, ch_num) \
 	{					\
-		.num_elements = 128,		\
+		.num_elements = 256,		\
 		.irq_moderation_ms = 5,		\
 		.irq = (ev_ring) + 1,		\
 		.priority = 1,			\
-- 
2.7.4

