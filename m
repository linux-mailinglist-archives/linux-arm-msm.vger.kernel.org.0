Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98A1A2E9638
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 14:43:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726855AbhADNnc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 08:43:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726098AbhADNnb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 08:43:31 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2616CC0617A0
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jan 2021 05:42:17 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id k10so18504042wmi.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jan 2021 05:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Pj6cKdBG+MO8yiQhyvVFRUuc2SwiRQVBKy1AjDfPs4Y=;
        b=smenpFHRRtkXYY3xdjzI0iJlewLBOLz0HBB5V51xN/4vW/kN1Xv7IlIxy3BtuD0P04
         Z5sBYWKHu/A1zNgSZomptyl6oofjsgAP+xudXgMpi84UfOHaz8CpvhT63Qepk9CSTZ8n
         8EPhZE0LLxTeiiqCq6Vu3FllP3dIuTcfWw1huurW376ZLnAMY2B4uFdKZOhFFJj1kk+M
         QX+DaTHnhB2pd7qyyfqOar/oVFSHJS7KO7UVvEZIUV6Ib8wHVKeyqfnysy50gwg2D8gz
         N2NcZdLQnKD9YjfWLQhmlhWmRzAUtkDlM2apOtHg6DpwUjIpm1gSU/EgJuX9wrjlAutk
         zkog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Pj6cKdBG+MO8yiQhyvVFRUuc2SwiRQVBKy1AjDfPs4Y=;
        b=cJC7Y+3hV8Ibnux4Aao88ngCvoIAMqgpzwVkzXICeSjcLfj1iZNo9QRWxjQTud5jWQ
         Vn+DQDvWoL6HkMw+bINiwYG8cGr6RNBLse9UzeEfBObSppx+FBbtm/ETo2asMMoCSiCm
         4U9L1ZrIVTsaZt4tQk47yF92Z8Fly9ZRU9eNrGK+zQ4aJjIMf/CMi+2BuBgxEia67fm8
         56US35k+VxoccI5i6oNNvg3cwDPw/iORLZAJkzHL8BZyHa3GVwyJlqOPfyJ3aC/0XpJA
         hyWnKjOcDeLNvqpKBMRq6gShbITI3hPtzf5MWbh/JxJrjbfyKHHUnYdQTfNuiAae0GKQ
         fyTQ==
X-Gm-Message-State: AOAM532yhep7TOtTwlg4DFmLySw68amllmZQ33Qc5Gni4L32Otk3tFKY
        bd6CFvGnXkh9gXPPG6xJDYfjJw==
X-Google-Smtp-Source: ABdhPJwVQCLNoHsfFv5zzDVcAtfPBUtP/39wfj4j/vXFhybYyj+d7X3ARgJvX5nAsus6r50Ic0Cx0w==
X-Received: by 2002:a7b:c24b:: with SMTP id b11mr27131764wmj.168.1609767735915;
        Mon, 04 Jan 2021 05:42:15 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:41b:e085:fa9a:9c53])
        by smtp.gmail.com with ESMTPSA id w4sm34042968wmc.13.2021.01.04.05.42.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Jan 2021 05:42:15 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v7 08/10] mhi: pci_generic: Increase controller timeout value
Date:   Mon,  4 Jan 2021 14:49:37 +0100
Message-Id: <1609768179-10132-9-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609768179-10132-1-git-send-email-loic.poulain@linaro.org>
References: <1609768179-10132-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On cold boot, device can take slightly more than 5 seconds to start.
Increase the timeout to prevent MHI power-up issues.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 7e54d88..5188ca2 100644
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

