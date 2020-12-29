Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24ED42E6F08
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 09:39:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725986AbgL2Ihu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 03:37:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726240AbgL2Ihs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 03:37:48 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B337AC0617A0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Dec 2020 00:36:34 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id r5so11873927eda.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Dec 2020 00:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Ej0NToGhvjCpevGSUsiqXQG4i13VoPHtRY1JSOMDAyU=;
        b=gZcFmhm+RvAM0K8rGNKNMeu1LEtcpkPyDXmqO0LcTImmg/BqMGVZVn79mJkhEjn6OQ
         UMo1YFdbe82CZO523VmuTMozaRk/Jqx+lTiwBe9jlDCbSQ5NTeaGxedReTtywnfOOgo9
         V1B5H1MG/MBpNsBWydHMt2RcExKewZ0W9wCZhgTlC2vmgla+Goyue2HxBdgABhYAYKeX
         tPrWx4dMuEv4b/PYJOWZ1csQZyTE9YiVSzsLffccw9IkocqdWvf3pxjbkFimSCfMujz6
         jCiTh384prFT5gGX5ByS2VPFZtbvEcsj7hnlqcEQRzk5LJIbj+Tx2Ze3IJxcG0aeWOf1
         IK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Ej0NToGhvjCpevGSUsiqXQG4i13VoPHtRY1JSOMDAyU=;
        b=jbwhwmnoTt593kHATkTtrSaR9KUD5J3gcA9B3ZZWT93EcSxypUXOiAwaYoNrENpyIc
         QAThavRRC4wHXTvIhH2fk4mg7xGW9NgxH5LCM4EoLXsHZl4/NiuLjSQB+Mf2mJeNzy/7
         WXjfQuyJ1+WOWP9bmvLLg6Xtvw7kFld2Z4j+K7+aftE9tInF8eO6Nrdg0zfncbJLX2sv
         64J1dKed7fn6qWLwULEG/hSftYkI6b4nA/d5MU/ErXB+Z0uxdNqkbY6W6Y3pYCZTi1g6
         pGSQ+dmDySKcbGU39tb1SYgKWbDDyrHJNCRJutZQEd0w2/IDAbxSDxbWrmgTfaAPQuE5
         FSMw==
X-Gm-Message-State: AOAM530xZ7S8sjrP3hdxTlmbb0vTCKPBmbR2U+4N3ItI3L17FibdCAou
        WYqp0dRtL/vhElnEMMVCWaMGBg==
X-Google-Smtp-Source: ABdhPJzcqqZ8y1+c8KAQFkJFix8NUXzSkrWhG6g8uwdO6eJusWL2MRmktIUFo1nNZ2UyXCbxOxkbcA==
X-Received: by 2002:a05:6402:1352:: with SMTP id y18mr45586078edw.178.1609230993488;
        Tue, 29 Dec 2020 00:36:33 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:6f69:290a:2b46:b9])
        by smtp.gmail.com with ESMTPSA id c23sm37265143eds.88.2020.12.29.00.36.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Dec 2020 00:36:33 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v6 09/10] mhi: pci_generic: Increase controller timeout value
Date:   Tue, 29 Dec 2020 09:43:50 +0100
Message-Id: <1609231431-10048-10-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609231431-10048-1-git-send-email-loic.poulain@linaro.org>
References: <1609231431-10048-1-git-send-email-loic.poulain@linaro.org>
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
index 812d54f..d4ad9c5 100644
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

