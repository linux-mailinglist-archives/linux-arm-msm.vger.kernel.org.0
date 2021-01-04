Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59E2B2E9A5B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 17:13:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729617AbhADQIx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 11:08:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729618AbhADQIv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 11:08:51 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEDA7C0617A0
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jan 2021 08:07:37 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id t16so32713816wra.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jan 2021 08:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=078yqWa4fm6+2z9avg2zxC4IELqOvwOqSWVwgOyL6OI=;
        b=CDEOR81MrtxNlbV7eOqXQyiqrgV2zUyCd5JI+iNC407BJ5Ri6WAzuNr9LOgC2IV6n7
         U3BRFMqLaFCOxERYu7SdH2pLsbAr1Lw1c4T91Z8e5X/cvMPurzlOERXiNitlXvn6gjVd
         8xXWUfNSZgJM7G57IT+B39u4e2o38acq7MBWWT48Nt0xT9Po6fLEPAMbfNr8ll/n+hnC
         /JxGyDIPXJvtvqu4Ermy8NoVzsLPb7cyHH4lSOEM1De3BziNh4bf1OkdMOU1S3lW2Vg6
         s7pNswyRTTz/MwS0r/PgCKmwp/zxlExom+pdhnJBqr1rCJoJQdpSi+P5zWcclty8yAi7
         Lw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=078yqWa4fm6+2z9avg2zxC4IELqOvwOqSWVwgOyL6OI=;
        b=MoCZRkpB3Hmkc3DH54kescq4cDAQDyXyuZM2tYz39Jv2oWQ2btylHyYey9GiuYlwE0
         JHfKuGbBQkyMW7Hb/lR1EN0b5L4THC2CiDwedpM4O0VHoXjyptIASFOgijVxmsLOJvsH
         umcVsB8t0qifX+UrhTHXaSdUeTyMevMpGqzVFqHfEVgS8iZsTysQndaMX5Ky0BQ3d95o
         wwkNM1TSDHFrazrIionpJDvy/yAWNZrc+G+Va2EfikB7xAZeAbAmsG/OQp2tIMgrEjnt
         YbuOdeI4PwnkXwdMTBgFoyUULrV0hIXQFJlsIzAJOdTxtZWX06mMbz1WpDM6EPR16o6v
         dO0A==
X-Gm-Message-State: AOAM532GuF0fLeQVQfBHy32mdqiFs97v4+OU8c77bws0xo4A80UiH7kC
        gQiQ46HOb6GroT2q3nVn7QHC9A==
X-Google-Smtp-Source: ABdhPJyYtGToq0Dyxp5ZSATU8ZrSTojA5+Do1ZqzMTaiohHY4CYDvYjPa1AwKTrXPY4HaNU6Xex/ZA==
X-Received: by 2002:adf:e552:: with SMTP id z18mr83538582wrm.29.1609776456737;
        Mon, 04 Jan 2021 08:07:36 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:41b:e085:fa9a:9c53])
        by smtp.gmail.com with ESMTPSA id h9sm89278049wre.24.2021.01.04.08.07.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Jan 2021 08:07:36 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v8 10/10] mhi: pci_generic: Set irq moderation value to 1ms for hw channels
Date:   Mon,  4 Jan 2021 17:14:59 +0100
Message-Id: <1609776899-30664-11-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609776899-30664-1-git-send-email-loic.poulain@linaro.org>
References: <1609776899-30664-1-git-send-email-loic.poulain@linaro.org>
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
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 5104084..c13de0f 100644
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

