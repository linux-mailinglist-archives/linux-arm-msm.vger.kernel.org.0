Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94F512B1DC9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Nov 2020 15:53:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbgKMOxa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Nov 2020 09:53:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgKMOxa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Nov 2020 09:53:30 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51E98C0613D1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2020 06:53:30 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id j7so10222513wrp.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2020 06:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4dySM6ga3g1JccS9VpKiXH/tknJsBk9CHeAdOMBOgi8=;
        b=jh/Ynuxf9wdpVdshLKXwPYCIUOGXV3uMFK7Nc6VfhzOXY5i50ewzOnZen263xU7GVG
         WCE2EwG3wxHSGBTexnI8mWevS64LxoLxX3rbKUPeGyopEsN4KwGhei8fYRiQeXPoXZeO
         pYOq3R+MonZY2ghVpMIoemQtt1e2rUCwK77RmzFkv2h4015gmb5hvf75KHA+0noSKOgM
         rEKink6KwsTi/L95/YfDBjbtcgXVwqNseA56w5HLm5o2/IZWugfNnHacoy7Hf1aZn6+C
         JzkjljvdA8+2yTKio+fDgqu7Fzc3ga/3dU9yD3uhE8flbV1h/bO8WVkXsWJ+imfOeLWp
         2jeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4dySM6ga3g1JccS9VpKiXH/tknJsBk9CHeAdOMBOgi8=;
        b=JOgycsXv/EXDZyvf84FkO2/wjZ9gmLtOdhqpIy5DYMLfMhzWv8d/oCHZOwNPorzLH+
         TPoq+g+MBhnJPn359V8ryLMk3IVbPn1otj1ZpyJ/h4yV8EZhKL3rwgmzkQl7ZstVJ/d5
         FtWmuGAZ1PE+DFM/RUmeFTD0mc5ZiU52zfmJ6d8UIlTQ2wBrFfO5PQ21mUTO1IyH6Akn
         jEXJqJIVIzJO4UQJWoRC+CHOG9LUfFD3UJ710p1LCtF5E9+7CdPgEEnJa9ulBKKfyKPq
         kL5HJzlZSPYJfBtdvD8+A3imwjrz4S+qdZ+BdSi00ZnTe9LctCYmXMIJJWLoSvaxJotA
         TcYg==
X-Gm-Message-State: AOAM532J7+2XwTRasmMEkgpZ4ozX+ieOxDQhKNjDFVzQjh3a+BPJPcW9
        LXAWKZF5HSxFo1JFMVRFV9rjNg==
X-Google-Smtp-Source: ABdhPJxH9epSt2N08z75Rp7Px+KEdNOhzauPDO02jIO2bKbF6hZ5/7JqDMTDDvHHJDLf1cT+ISqLVQ==
X-Received: by 2002:a5d:6cc5:: with SMTP id c5mr4137074wrc.301.1605279208934;
        Fri, 13 Nov 2020 06:53:28 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:304f:e9d4:6385:8ac5])
        by smtp.gmail.com with ESMTPSA id i6sm10729341wma.42.2020.11.13.06.53.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2020 06:53:28 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH 1/8] mhi: pci-generic: Increase number of hardware events
Date:   Fri, 13 Nov 2020 15:59:55 +0100
Message-Id: <1605279602-18749-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605279602-18749-1-git-send-email-loic.poulain@linaro.org>
References: <1605279602-18749-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If the IPA (IP hardware accelerator) is starved of event ring elements,
the modem is crashing (SDX55). That can be prevented by setting a
larger number of events (i.e 2 x number of channel ring elements).

Tested with FN980m module.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
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

