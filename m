Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11C992BFD19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 00:46:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgKVXpq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 22 Nov 2020 18:45:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbgKVXpq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 22 Nov 2020 18:45:46 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9FA3C0613CF;
        Sun, 22 Nov 2020 15:45:45 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id t6so5221565lfl.13;
        Sun, 22 Nov 2020 15:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YXxP3RMxT376q+ZmBT066fZ9m4LvolVKcjp1W/SeW1c=;
        b=r51WnwYG/i2vhCeYqTi0U5OD+hDTl5M5FfvQbL7GTutGpU4gzoOJHkTiidCc2J1V88
         yOp1feMkpDYvvM3e3SNATS3DfZtQoD2Wf6eZ29++Y/3FNKGfTOFwc9PTnIB7pSeCXp0L
         K0E2Rr3KiKf1gXRNNNULKY4iD3mg825BiQjLHgdXZbkH+MJqo1CrM8Fz2TUwhmCYEKek
         EvrrlXe1lqztHfy+955gsQ5Sf/9nhZ6GCrZ0M7uyie2GLmpQc8MVtqYD1HHSRRIZFCra
         ABqMebw+vVlEgl4oRwev+f5nLFbclsiaW4uT5TcCt2FTh4AkOa5MXw0ySZ03Qewpbbjt
         mR+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YXxP3RMxT376q+ZmBT066fZ9m4LvolVKcjp1W/SeW1c=;
        b=r9Gml8Yin49TPnsHnbhvgOvGR7Moq5xzJ+LRbPPKsDkrkoRYqknhL+1XULIqcRhQdd
         3EnY5J+OLwd2ST9/kD6ii3m5N8l/WfojZhpM9XIU1/PV4Hjk+Ec9D+FQlz2N4tl6jnGH
         wAPx4urj0j1QZDtXbw69MN5KFzLu7fsZ0+C2T84160gKBXTm3SDRuH89PiHPWTML6QGj
         yMoXlXeHiPrx5vLYtMdiprhnuy1zdFw4Trvl4cu+gC+TTE02X1BGpUpM0FUVzglVM/yU
         Ni/YxQsANh1bx0WxD3fFftgWjMspi+hhyYwhdZo0yrSqN1Cah8Fn2CsMxgJJ8gKyLTsn
         AylQ==
X-Gm-Message-State: AOAM531+0Uusqx7dcxMT3XDticfg5kGMa3Ejrx+iFbzu6Xmu8xyhHXVt
        /hXGnxXDlKla45fcbE5RDlc=
X-Google-Smtp-Source: ABdhPJxdiDoegY2A3emPdGj+0KNMM6+UCjUum/KAmg6hvWx0oC4M0cuUg4vHnEdWB/x7mHz1zKYYFg==
X-Received: by 2002:ac2:4844:: with SMTP id 4mr827010lfy.64.1606088744250;
        Sun, 22 Nov 2020 15:45:44 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-6.NA.cust.bahnhof.se. [158.174.22.6])
        by smtp.gmail.com with ESMTPSA id y186sm190059lfc.127.2020.11.22.15.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2020 15:45:43 -0800 (PST)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] remoteproc: qcom_sysmon: Constify qmi_indication_handler
Date:   Mon, 23 Nov 2020 00:45:40 +0100
Message-Id: <20201122234540.34623-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The only usage of qmi_indication_handler[] is to pass its address to
qmi_handle_init() which accepts a const pointer. Make it const to allow
the compiler to put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/remoteproc/qcom_sysmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index 9eb2f6bccea6..6c3275b58c36 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -283,7 +283,7 @@ static void sysmon_ind_cb(struct qmi_handle *qmi, struct sockaddr_qrtr *sq,
 	complete(&sysmon->ind_comp);
 }
 
-static struct qmi_msg_handler qmi_indication_handler[] = {
+static const struct qmi_msg_handler qmi_indication_handler[] = {
 	{
 		.type = QMI_INDICATION,
 		.msg_id = SSCTL_SHUTDOWN_READY_IND,
-- 
2.29.2

