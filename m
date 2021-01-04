Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B8342E9A62
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 17:13:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728724AbhADQJD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 11:09:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729615AbhADQIv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 11:08:51 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 137B3C06179F
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jan 2021 08:07:36 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id d26so32655212wrb.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jan 2021 08:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uHP4zdCqkYpZ7TMoU32SH1n8pjOWVxYjbGzR0TCpQnQ=;
        b=xSwwKv3rx27nH2qhxGButYJVvsPyjOKg72pJhWXRWVeZDlluNsX3Wyq/X9mA6pPdAd
         QuWo1TY9QVzjFveTIb703PNS0KQbmrHpdVZOytPXJROgLJ9rwSh0Bc4KKz8+ripJZXXV
         a2go2e+3qW6fdhT5/cREHp3n7XRXtpBVo9wmYnW+jQ696wJ6sYYH/7+EGVKiIgPI1tNU
         CykD+ADsWaUYNf1M3Dl1vZLnuD9TNugcatMkcEpn2l4fYcnhpwEALRyTlHsDhQIHmqmw
         Fapvnglge1wGrKGQ5+tQRPuOXwqhvvo5DfPVRGw6Ts8TB0d7p1+LCMs88cgcN+fVu5ah
         WCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uHP4zdCqkYpZ7TMoU32SH1n8pjOWVxYjbGzR0TCpQnQ=;
        b=RZdyVGTCenVwqKnSFfbSE7m5QNmWUmc4bBPQdTjyuQU45m7QR5c5btprVyH/qUjEsg
         VnPO0KLfCYyFdNGIy59qR2mfomN8oDeSrDjJLdBeAGDgapzYrW3hG7k9hkA33ycr18ss
         gKoCHvbLjjA24VWad0xke+QEjal/K6uE3MNxM+y04xvW9GAmM7knxIxjuZG0b12ycyrg
         R2cQLapGrupsRWI+THtBKQYOFEmGv7Z6jRwVnuYzIdIe76O+NTmiCgdn9I+6acPmRpqG
         0QCPaKI5W5T2X0xBsZ9oKirD+e0H/v4KCcWQkSBDq3lgxdDZRg9Z0jvZdozDajaGFMN4
         HLow==
X-Gm-Message-State: AOAM532QZcb6X2R1oHuv4dvEeBwMDDU9syRbEaNL9lPIpBm6WrpntCMJ
        DUo/XnoPf+ck1db1pmkUzMa9xA==
X-Google-Smtp-Source: ABdhPJxIuK1WIovB1l3cvWF8kbTzZOIawTM3krFdjEVR8AHpjiK9MZfGQW4CJVLjUypLDkraXqkQmQ==
X-Received: by 2002:adf:ce90:: with SMTP id r16mr81865517wrn.100.1609776454838;
        Mon, 04 Jan 2021 08:07:34 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:41b:e085:fa9a:9c53])
        by smtp.gmail.com with ESMTPSA id h9sm89278049wre.24.2021.01.04.08.07.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Jan 2021 08:07:34 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v8 08/10] mhi: pci_generic: Increase controller timeout value
Date:   Mon,  4 Jan 2021 17:14:57 +0100
Message-Id: <1609776899-30664-9-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609776899-30664-1-git-send-email-loic.poulain@linaro.org>
References: <1609776899-30664-1-git-send-email-loic.poulain@linaro.org>
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
index 3eac410..cbf28c3 100644
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

