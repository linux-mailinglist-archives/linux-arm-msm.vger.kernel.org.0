Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54DE9F2245
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 00:05:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727295AbfKFXFR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 18:05:17 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41750 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727196AbfKFXFR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 18:05:17 -0500
Received: by mail-pf1-f195.google.com with SMTP id p26so308684pfq.8;
        Wed, 06 Nov 2019 15:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=95XhoZugvCbJ1xJolEFAVKQ1p0Gkg/QHi8Sw4Nb9JUU=;
        b=dTcraDs9Cb9V7yUZrxzBw+VAgi/PsrVEU8E5WlU733RfVD9WLAayJRB69vEzq6BE+Z
         xLXywT9D2BG6cP9vYfYYiWat8mQvCZn8P15evlPrxot12RtuyWsHPU6aaXXzIVBCHa8E
         jyzfLFkqkFqfKzrDJ51Hrc6DsJ14P8XQX/f0Ztf17XPh01Ny3Ik3HauOvK13denp7VSW
         dhSXcvUkVIIGZE62T6NPRGvy/Pe2383eEcn0te7Hye9KRghq0NuSfu3mnZjoslRv3CYT
         ebKadQx8Abn0snAlgk8LSDxrv05I14XjqD7sIwsbl02AJxks0NGaMJ6b2r/iMcLBbicp
         myWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=95XhoZugvCbJ1xJolEFAVKQ1p0Gkg/QHi8Sw4Nb9JUU=;
        b=Gcs9AtydITfNLz5MQJeQAzt7qq8frgFP+aJGmN39sqGhoO7YHB/ZpUDO/veQWlP80b
         6ccIkYM7UBo40QoNiPVMwUwdnmKlgGYAo5jAOM3uEQl1/jupF24GY5dwUO1ZhrudD9dj
         RWj2qmnedxoGVbXRduCB0GK2g4rLPszUTDZVLM17QQP1ciXgQpOMdBT3f+h9IY7asYdB
         kAmBzjb61gW8f2QEPVslMC9Z9BT9swhOO5Njocct/Hv8M/uOVCUJly0U3uIMyy1ryoxN
         wHW62BxxdpHKJc3d296UvVDejKzaBKbN/Lqv1Erw2V0BAGSb+0d5VKB4o5Ov1+VaKwaR
         +R/w==
X-Gm-Message-State: APjAAAXdVteTati7qHM9rTw3m/Cku/RNr0pMrP8FduVy9NirLAXwDYA7
        goY0ZEsBnECytKm+NVdVYYJ0pDX3
X-Google-Smtp-Source: APXvYqzjYfFmI0edQS67xESS7kJS4iOvGQYKfMtAXlXcpvSh2qO1c4rP7GEG2AhINNY9FH7h81JNRA==
X-Received: by 2002:a63:ed4a:: with SMTP id m10mr391126pgk.255.1573081516638;
        Wed, 06 Nov 2019 15:05:16 -0800 (PST)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 70sm32538pfw.160.2019.11.06.15.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 15:05:16 -0800 (PST)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH] soc: qcom: qmi: Return EPROBE_DEFER if no address family
Date:   Wed,  6 Nov 2019 15:05:11 -0800
Message-Id: <20191106230511.1290-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If a client comes up early in the boot process (perhaps was a built-in
driver), qmi_handle_init() will likely fail with a EAFNOSUPPORT since the
underlying ipc router hasn't init'd and registered the address family.
This should not be a fatal error since chances are, the router will come
up later, so recode the error to EPROBE_DEFER so that clients will retry
later.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/soc/qcom/qmi_interface.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/qmi_interface.c b/drivers/soc/qcom/qmi_interface.c
index f9e309f0acd3..1a03eaa38c46 100644
--- a/drivers/soc/qcom/qmi_interface.c
+++ b/drivers/soc/qcom/qmi_interface.c
@@ -655,8 +655,12 @@ int qmi_handle_init(struct qmi_handle *qmi, size_t recv_buf_size,
 
 	qmi->sock = qmi_sock_create(qmi, &qmi->sq);
 	if (IS_ERR(qmi->sock)) {
-		pr_err("failed to create QMI socket\n");
-		ret = PTR_ERR(qmi->sock);
+		if (PTR_ERR(qmi->sock) == -EAFNOSUPPORT) {
+			ret = -EPROBE_DEFER;
+		} else {
+			pr_err("failed to create QMI socket\n");
+			ret = PTR_ERR(qmi->sock);
+		}
 		goto err_destroy_wq;
 	}
 
-- 
2.17.1

