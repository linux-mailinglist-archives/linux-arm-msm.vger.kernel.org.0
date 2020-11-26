Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2EBE2C57FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 16:22:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391316AbgKZPWZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 10:22:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391314AbgKZPWZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 10:22:25 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D592CC0617A7
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 07:22:24 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id w24so2782313wmi.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 07:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+XVVFNjz54vxI7LvmFlmA9uYn5ZZIptRaHJ89uF1DBI=;
        b=XbP7A5jCvNK2EloHZz87tCQp4rvdhhDgXgP/CRdnx2TYUiVOS0y6GKSf1+g6uM6uaa
         1rj7jkUfQcF5/GvT2J61BGi2luPetAbgD6z+U/15qqTRzlnByPCuuAAYcN2ten50BKHZ
         Sq+dvO0LKuQ/a8UmxkwYnapCko5GcrQBugKLCxkj81r9hMIf+Oh/KQfRWK2MRk3PLwuP
         LVBl1hst+UjUjBsiPwb3u7YFHUqAnr9XXhHf2JpmviVrZQnP/qnBixk0cdvL0F/f53xk
         LRShHSARGA1VtLh7tk9tBxmN35TF1fPPeWTe2rEN23lqscs9MQ+7NMp8rheVyWXczVif
         o3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+XVVFNjz54vxI7LvmFlmA9uYn5ZZIptRaHJ89uF1DBI=;
        b=V+zz0pWxnda7lsjLquZIArdkqoJE39kaRhLyPjXEcbEzOHaXuPzsB6UXsGWBL7fc99
         kczqWh1usqk61axyY6bzTh7q1xQlfPH4scLCwbvEYrGDwRe9U5Q8Il4esIwGYMc++qX4
         qmCKYkgV9sB4WFJ8V2WME9EeJEglzNW56rydnwkCoekxANPJwNEXHEKktzIHz3L15ZVq
         KCGph0Va10bDLeSltb4vnjh6RHRQ9WyRX4qRAo+n6oAzuuN6R/5gJY9pQViU/t0jAGVF
         v48vsWTbXKEqBspdyw5WH23KnfxDe54jq14YO4WlJg+fxxhPnisqPeDu8zm+fqQFvpu7
         ncTg==
X-Gm-Message-State: AOAM531riIy6hlvU57LtZqeeDUTn+OsDN4izlkMEnwkji/Q0JyHkUkcc
        Ll/tXSl1Vs6tfa6ETR3chNMReg==
X-Google-Smtp-Source: ABdhPJzNH0anL2VpPCahynG+bG+jvdYDt980LWVr+RZLKYlQ0OU15hLzPkZ3f+1FfRYFzSbvE5i1Xw==
X-Received: by 2002:a1c:f219:: with SMTP id s25mr3939878wmc.67.1606404143606;
        Thu, 26 Nov 2020 07:22:23 -0800 (PST)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id l10sm2756144wme.42.2020.11.26.07.22.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2020 07:22:23 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v3 9/9] mhi: pci_generic: Increase controller timeout value
Date:   Thu, 26 Nov 2020 16:29:07 +0100
Message-Id: <1606404547-10737-10-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606404547-10737-1-git-send-email-loic.poulain@linaro.org>
References: <1606404547-10737-1-git-send-email-loic.poulain@linaro.org>
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
index 26c2dfa..bbecec0 100644
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

