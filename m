Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93A602D99A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Dec 2020 15:21:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393862AbgLNOT1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Dec 2020 09:19:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440024AbgLNOTN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Dec 2020 09:19:13 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7589CC061793
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 06:18:33 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id w5so12850231wrm.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 06:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=u23Upri+mVTKw2vMmpl89dQD9K1UaxJ4Tc+YMYk9PIg=;
        b=UFY54rm7D8guWdkIPJyOoEdfm14WXruuMxCmE1FSZEtLfsBO1Wd6P0pxiuyYNv2Gne
         eQLwsQ2BSUf+GVwO275ecTkb/UC8ZRrTtA/ig3s5/wG2Hv1TJHxJVUeHNjN908qJ+Ris
         VUA2bslsCSZ8KZTAb1vqn98Z6SLgATWQqvxlQclQr8sr0P5h5sZy0JtyGIuYteg07nnN
         EawiRnir+QnZ+NI18qw9FKA/qHuUZ0jFWaVfj7JnI6QsCyxeOCX3r6pdPYrsrsYLWMW+
         qqmpITKY6vHMRl5bxR1tccRHZ4njGFpIZ4P37MbkbfpD97Icjw5GCyNjeN4B4MJmAhnm
         6Vfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=u23Upri+mVTKw2vMmpl89dQD9K1UaxJ4Tc+YMYk9PIg=;
        b=bjetDscUFnsP9ygbwEzqbiRmARQYW+sK8eRTyaTmHL/1e2UhWIYmd6P1/yYDVZDkZ3
         VcFGmyu8JOSpPbv3+JokE8hiRXL/oUAi8OhZd0lkDkcw49Zuz2qML2Ckz4w1aoSiA7v8
         BNpx5CDBbSF3qUWSiOOaaKQXVDcSGyXfYjG33uMQ0iI3DTNp4gX8wzQrtEEkaOSnrnEJ
         vVQFNZX2NjnlraQ9HW0EQNa+kjiU4jVaai5XNvx7+PJSIMqUbNqNyn3v/Y7ljIP/lJTE
         RUVI5MxEkkEI33fjn3k9VQCPDZ36b8ZTrNh2tXukRpGe22EezoG+h0SsW+KQ+EPkw3mu
         ju9A==
X-Gm-Message-State: AOAM533GsFM31hLhyuNO6UXRaH/BvuBUIJgvUi3CBSgF3kXWgG3WW9Gb
        x9iesRbHRx2OJa6Ks6FVBPEHkg==
X-Google-Smtp-Source: ABdhPJwfrcDOdbd8chCA7c90+POahz5JyWw1158zHhwR0X7gB6JDQOWeTw1bLa92nkwD2AW2AsPIxg==
X-Received: by 2002:adf:db43:: with SMTP id f3mr4719917wrj.70.1607955512084;
        Mon, 14 Dec 2020 06:18:32 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:f2e4:25b3:2b53:52cd])
        by smtp.gmail.com with ESMTPSA id h5sm34126285wrp.56.2020.12.14.06.18.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Dec 2020 06:18:31 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v5 03/10] mhi: pci-generic: Increase number of hardware events
Date:   Mon, 14 Dec 2020 15:25:30 +0100
Message-Id: <1607955937-26951-4-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607955937-26951-1-git-send-email-loic.poulain@linaro.org>
References: <1607955937-26951-1-git-send-email-loic.poulain@linaro.org>
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
index e3df838..13a7e4f 100644
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

