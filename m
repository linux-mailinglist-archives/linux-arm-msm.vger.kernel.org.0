Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFAB6AA612
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2019 16:41:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388300AbfIEOl2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Sep 2019 10:41:28 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47]:53077 "EHLO
        mail-wm1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730622AbfIEOl1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Sep 2019 10:41:27 -0400
Received: by mail-wm1-f47.google.com with SMTP id t17so3123151wmi.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2019 07:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=gvXZWVwHpbdck37kQtyWXbSqSEeeYIFeArcoXQY5L9I=;
        b=mB3Sko2ifz0tOSCJAHjX283XAID1lWJHxJ8+5TDxf+6IIqPTfr+z/PPEttOLXQQH+b
         8VhpLSs2Xx38CdkqQN3H01l2xCICqrXkssFgkSPUbXJ7w82PFNTO/EflDqdaBZrjTBr4
         OPh0RTFzOYZ9LW56DmIi7VmHRBlGKptwDvVx48791iI0/CHvG7SloF7JfIgzVPVxd9SI
         Rs/Blwyl15h0QvyK0ESbbrFGhGmV1HOpEJtqRhDWTDXP8pDPRI+cycCzopj1+4fHb/Dm
         IQ1Epwi19TWJKlDbg2Ewvh51NYJmGcEGrfcOJBcKHYIVsbxVndIy9Vz+arcpx4sv7wik
         J4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=gvXZWVwHpbdck37kQtyWXbSqSEeeYIFeArcoXQY5L9I=;
        b=gIppG5BF0yKUTaOC0YjqWVn4c6zwen7MRtmq+KqrU5KUzUzvNZ5ni4czN8rS/BXAnp
         Krlulgf7szd8bAuOhSDOzu1y65LnwpcsYGtVsHsXKj6WA6Mdl+y/+ONCQKYG+ym6Oc/h
         KLa6wEqcnm9SNFAyiiIKSH/j98+YPBrMDz2l+LB/0KQsI4qM4tfvv8HuYi7qdnSzGsTB
         /f6e1RaHt2vG7tac71UY/W0VBQYeOlWTghd1Ie3/BERXUtV8gcIzbB2MgiIOcvcxkN/P
         CK0Fy9yXqKmESTb8iJplO34OFR3Tjecb1LEfaQAK9Wz3U+pEMtxdR3fO68YjegtCPE2F
         axeg==
X-Gm-Message-State: APjAAAUAE1CxkGbjytxMyA+MThJYOoirzIW+xkItgSC26dViNjOSLJz6
        ECpgadr2jGUrJhGsHygUxz+7lg==
X-Google-Smtp-Source: APXvYqwSsdzWd7u9Fz8nhhPSzaTVwwrjIYP4HGLSO8rAw+8XajRcLI9Thgj6+E2e/hZXiqvdsbjQ7w==
X-Received: by 2002:a1c:be04:: with SMTP id o4mr3387448wmf.60.1567694485991;
        Thu, 05 Sep 2019 07:41:25 -0700 (PDT)
Received: from localhost.localdomain ([95.147.198.36])
        by smtp.gmail.com with ESMTPSA id c132sm4191392wme.27.2019.09.05.07.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 07:41:25 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, agross@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, bjorn.andersson@linaro.org, vkoul@kernel.org,
        wsa@the-dreams.de
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: [RESEND v3 1/1] i2c: qcom-geni: Provide an option to disable DMA processing
Date:   Thu,  5 Sep 2019 15:41:22 +0100
Message-Id: <20190905144122.5689-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We have a production-level laptop (Lenovo Yoga C630) which is exhibiting
a rather horrific bug.  When I2C HID devices are being scanned for at
boot-time the QCom Geni based I2C (Serial Engine) attempts to use DMA.
When it does, the laptop reboots and the user never sees the OS.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index a89bfce5388e..17abf60c94ae 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -355,11 +355,13 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 {
 	dma_addr_t rx_dma;
 	unsigned long time_left;
-	void *dma_buf;
+	void *dma_buf = NULL;
 	struct geni_se *se = &gi2c->se;
 	size_t len = msg->len;
 
-	dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
+	if (!of_machine_is_compatible("lenovo,yoga-c630"))
+		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
+
 	if (dma_buf)
 		geni_se_select_mode(se, GENI_SE_DMA);
 	else
@@ -394,11 +396,13 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 {
 	dma_addr_t tx_dma;
 	unsigned long time_left;
-	void *dma_buf;
+	void *dma_buf = NULL;
 	struct geni_se *se = &gi2c->se;
 	size_t len = msg->len;
 
-	dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
+	if (!of_machine_is_compatible("lenovo,yoga-c630"))
+		dma_buf = i2c_get_dma_safe_msg_buf(msg, 32);
+
 	if (dma_buf)
 		geni_se_select_mode(se, GENI_SE_DMA);
 	else
-- 
2.17.1

