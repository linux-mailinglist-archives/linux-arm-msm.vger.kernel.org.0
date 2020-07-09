Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C1FC219C6E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 11:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbgGIJhu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 05:37:50 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:13446 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726440AbgGIJht (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 05:37:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594287468; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=TA7HOpZ0zRCkz+kcRVk7nTUNdhPsXAXu/DoriG0R4QU=; b=vg015nOsVEAf77t6A5PE5LgyaIEInhq3OnLnNKcSLtOuFiexyJuAFl70vazlzdEqdAe3hUSz
 y/arV+O1cNBWua/3qihk+E264cNsBUDeIB+utbTH6CccZWqb1lzLn2DQa9SroIKwQDXhhSlF
 RanKaAmvDxi9986npUbk55mKGg0=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-east-1.postgun.com with SMTP id
 5f06e55a19b27ae9ce9d23f5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Jul 2020 09:37:30
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 419D5C43387; Thu,  9 Jul 2020 09:37:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7EFC8C433CA;
        Thu,  9 Jul 2020 09:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7EFC8C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        gregkh@linuxfoundation.org, georgi.djakov@linaro.org
Cc:     akashast@codeaurora.org, mka@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, dianders@chromium.org,
        swboyd@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH] tty: serial: qcom-geni-serial: Drop the icc bw votes in suspend for console
Date:   Thu,  9 Jul 2020 15:07:00 +0530
Message-Id: <1594287420-24141-1-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When using the geni-serial as console, its important to be
able to hit the lowest possible power state in suspend,
even with no_console_suspend.
The only thing that prevents it today on platforms like the sc7180
is the interconnect BW votes, which we certainly don't need when
the system is in suspend. So in the suspend handler mark them as
ACTIVE_ONLY (0x3) and on resume switch them back to the ALWAYS tag (0x7)

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
Note: Patch applies on qcom for-next, which has the ICC support patches.
The tag macros are currently not exported and hence the hardcoded values.
Perhaps if and when https://patchwork.kernel.org/patch/11619705/ lands I
can refresh this patch to use the macros.

 drivers/soc/qcom/qcom-geni-se.c       |  9 +++++++++
 drivers/tty/serial/qcom_geni_serial.c | 16 +++++++++++++++-
 include/linux/qcom-geni-se.h          |  1 +
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index e2a0ba2..355d503 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -771,6 +771,15 @@ int geni_icc_set_bw(struct geni_se *se)
 }
 EXPORT_SYMBOL(geni_icc_set_bw);
 
+void geni_icc_set_tag(struct geni_se *se, u32 tag)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(se->icc_paths); i++)
+		icc_set_tag(se->icc_paths[i].path, tag);
+}
+EXPORT_SYMBOL(geni_icc_set_tag);
+
 /* To do: Replace this by icc_bulk_enable once it's implemented in ICC core */
 int geni_icc_enable(struct geni_se *se)
 {
diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 0300867..7337e8b 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1459,15 +1459,29 @@ static int __maybe_unused qcom_geni_serial_sys_suspend(struct device *dev)
 	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
 	struct uart_port *uport = &port->uport;
 
+	/*
+	 * This is done so we can hit the lowest possible state in suspend
+	 * even with no_console_suspend
+	 */
+	if (uart_console(uport)) {
+		geni_icc_set_tag(&port->se, 0x3);
+		geni_icc_set_bw(&port->se);
+	}
 	return uart_suspend_port(uport->private_data, uport);
 }
 
 static int __maybe_unused qcom_geni_serial_sys_resume(struct device *dev)
 {
+	int ret;
 	struct qcom_geni_serial_port *port = dev_get_drvdata(dev);
 	struct uart_port *uport = &port->uport;
 
-	return uart_resume_port(uport->private_data, uport);
+	ret = uart_resume_port(uport->private_data, uport);
+	if (uart_console(uport)) {
+		geni_icc_set_tag(&port->se, 0x7);
+		geni_icc_set_bw(&port->se);
+	}
+	return ret;
 }
 
 static const struct dev_pm_ops qcom_geni_serial_pm_ops = {
diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
index afa511e..8f385fb 100644
--- a/include/linux/qcom-geni-se.h
+++ b/include/linux/qcom-geni-se.h
@@ -454,6 +454,7 @@ void geni_se_rx_dma_unprep(struct geni_se *se, dma_addr_t iova, size_t len);
 int geni_icc_get(struct geni_se *se, const char *icc_ddr);
 
 int geni_icc_set_bw(struct geni_se *se);
+void geni_icc_set_tag(struct geni_se *se, u32 tag);
 
 int geni_icc_enable(struct geni_se *se);
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

