Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC5F2BFCF8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 00:28:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgKVX2a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 22 Nov 2020 18:28:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbgKVX23 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 22 Nov 2020 18:28:29 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D459C0613CF;
        Sun, 22 Nov 2020 15:28:29 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id r18so1290480ljc.2;
        Sun, 22 Nov 2020 15:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LVFqQG5dG4GZg0Kc9IoCepCnKwyPNk47zha609XpanE=;
        b=ZQa/2JUS3yzRm2s3YxwBJ0tIYGvBrhbD8o3TnKiEAr/OfIupDYsciZiWKg1vE9pb1k
         mcjnPBsdiOUoDUhV2bYS0iAhbBQsWHEkP980Jo5sI4gg9Em/FRuIWEcK+3YusQ7MttqS
         /Eu3id/HtyApiaTcR0IEtYFNcBcY12GMLx2KJQGJ1L+IdBTdzhprr4WT4W1lyc9cIciB
         ZAjECv3a5/ONrae7XeVX0/pK3bLKnzvy8r5VLku8HhBqD821DRL8rCeMBpebBlVO/h3f
         SYAskcFkVGOUxtAzPjY6rmSgt/HpnCAzeEPiW/ssimqnic+1Y1sJVcffRP5fndTJpN2w
         M4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LVFqQG5dG4GZg0Kc9IoCepCnKwyPNk47zha609XpanE=;
        b=HTbskJ4G5s1FfqoEgNgnzz1jql9cFic0q6x3vx3vV8DiYfw7Io9z8IjWYR+bU2sK05
         Xwhvr+Ld8KXULoOgrP4rU3u7X4Vv7SKVZUIIP/sFD+O/Kjp2hhkYYTMBUsRWOmHTjuLb
         sUlJfiHymKZtWsMQ2OrylirOEfUNy0jdsP6USZSPYEEJT6xCIOl5lJCNE305+CEgwZ0o
         cGry6r1f5yicaqVFkiXwWuwrYdtasGDIydgXgP93j0ZOwM2QhziQpttlKBIuyYEUKzIT
         paQxqbhzoRLM20DYFXSMhZvGkIAhJ3BhRsN9IJ6LfJ8+zxdZu2QZtuUwPXkHqGH6Ta8s
         CUxA==
X-Gm-Message-State: AOAM532P8xEyh9xvatHGrbSkkW+Wj9nF4jNnAoc0WLjzr/NBORaX0iWp
        UK3MF/V5w22gkR3CyMjKKCM=
X-Google-Smtp-Source: ABdhPJxwmPjztSrnB2ikumYx/tylI79fqB1E3+sgTg7eiizsFVNFDit9ng5bBJypmWWFX9shJz5D1Q==
X-Received: by 2002:a2e:9005:: with SMTP id h5mr2546385ljg.25.1606087706559;
        Sun, 22 Nov 2020 15:28:26 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-6.NA.cust.bahnhof.se. [158.174.22.6])
        by smtp.gmail.com with ESMTPSA id 186sm1179175lfb.176.2020.11.22.15.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2020 15:28:25 -0800 (PST)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] soc: qcom: pdr: Constify static qmi structs
Date:   Mon, 23 Nov 2020 00:28:18 +0100
Message-Id: <20201122232818.32072-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Their only usage is to pass their address to qmi_handle_init() which
accepts const pointers to both qmi_ops and qmi_msg_handler. Make them
const to allow the compiler to put them in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/soc/qcom/pdr_interface.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
index 088dc99f77f3..d6e2d061b20f 100644
--- a/drivers/soc/qcom/pdr_interface.c
+++ b/drivers/soc/qcom/pdr_interface.c
@@ -110,7 +110,7 @@ static void pdr_locator_del_server(struct qmi_handle *qmi,
 	pdr->locator_addr.sq_port = 0;
 }
 
-static struct qmi_ops pdr_locator_ops = {
+static const struct qmi_ops pdr_locator_ops = {
 	.new_server = pdr_locator_new_server,
 	.del_server = pdr_locator_del_server,
 };
@@ -238,7 +238,7 @@ static void pdr_notifier_del_server(struct qmi_handle *qmi,
 	mutex_unlock(&pdr->list_lock);
 }
 
-static struct qmi_ops pdr_notifier_ops = {
+static const struct qmi_ops pdr_notifier_ops = {
 	.new_server = pdr_notifier_new_server,
 	.del_server = pdr_notifier_del_server,
 };
@@ -343,7 +343,7 @@ static void pdr_indication_cb(struct qmi_handle *qmi,
 	queue_work(pdr->indack_wq, &pdr->indack_work);
 }
 
-static struct qmi_msg_handler qmi_indication_handler[] = {
+static const struct qmi_msg_handler qmi_indication_handler[] = {
 	{
 		.type = QMI_INDICATION,
 		.msg_id = SERVREG_STATE_UPDATED_IND_ID,
-- 
2.29.2

