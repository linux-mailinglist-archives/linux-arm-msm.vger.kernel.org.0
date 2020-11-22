Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 276F12BFD16
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 00:43:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbgKVXnA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 22 Nov 2020 18:43:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726246AbgKVXm7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 22 Nov 2020 18:42:59 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85B82C0613CF;
        Sun, 22 Nov 2020 15:42:59 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id f11so21368545lfs.3;
        Sun, 22 Nov 2020 15:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0noCfj0vZgQAQbBKNAsd1E1O4v9lJKcaIfjgXuNCox4=;
        b=AzLWbqDw0fYIJ3mpQZZmLLrXYJcKQJSAmJ6gyw41pZQbIT4l7YLHbp8p818vG0ITzZ
         WCiShHmhxaH/zhkCURhTUHTI7f6MoR5M1uDTYxpmPj4ZWc+u/N0PTm4c9CXGBlNlNhO9
         VqbakTHAf7uU50kg0adAGUNi7iJlDoEB7Z8Wp4iHK0oFjT3WT7vYFtat3wsHeOJAilRn
         JrJ9zLCRC7wml85GX/fjJZnUO7ZLtf9TC1joUemtOIY+8ZiKeYxK0A/PvReQBnEA9u0D
         agRRbLs8TZP512fyVCNbzW+fs4WxgAnV6eQNiy7lZ2SbVj7dvoA/UNWFFxxXUbq1Z2zH
         /4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0noCfj0vZgQAQbBKNAsd1E1O4v9lJKcaIfjgXuNCox4=;
        b=rbj/UfNNh5is2KXvDXwUYQf+HBJ1ESf01pK5q5x0QbnkZokkvCDKrJgk+E+lVjqvS2
         YdxDz4CS5RK0Eth2LkCiLZ/PLdN8eS6R6I1mjsQW/ytVfYlhuPSIytAJpqUdGELutvc1
         ZHsCJF6/030S2OralIjFXi1YtyX1JniEMa2h3wIvwN6s5YRY1wEUD2s59Jy9eNdiahQJ
         bnk3yUpLmuAnN08Aw65RxAcAF5EJnWyd9BWHUkQi1uiLzbJl7mk631MunLL6/mLrAlEa
         EyfxrZ/4LQYBp1m5F+Xs+0n6AMNon2OeSsY6c2Jbu6PWThMUI6OXH6iCrXX5XhSyPa5l
         9V4w==
X-Gm-Message-State: AOAM5334TF4Sd2TuT2/nZKJ4RBCQp2lihszLl+uf6Gqh5AZtToqGvqFX
        y3etZ9R3aXxGOHppkxBrKQQ=
X-Google-Smtp-Source: ABdhPJyBG/Ci8CgP/v0LPPMaMIk0yJh0DUQxWJZ+pyZt9CahsM05niZEB2yLEBuzH0EkrcS4qfkvhw==
X-Received: by 2002:ac2:563a:: with SMTP id b26mr11593650lff.596.1606088578101;
        Sun, 22 Nov 2020 15:42:58 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-6.NA.cust.bahnhof.se. [158.174.22.6])
        by smtp.gmail.com with ESMTPSA id p21sm1113743ljj.13.2020.11.22.15.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2020 15:42:57 -0800 (PST)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] slimbus: qcom-ngd-ctrl: Constify static structs
Date:   Mon, 23 Nov 2020 00:42:53 +0100
Message-Id: <20201122234253.34047-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

qcom_slim_qmi_msg_handlers[] and qcom_slim_ngd_qmi_svc_event_ops are
only used as input arguments to qmi_handle_init() which accepts const
pointers to both qmi_ops and qmi_msg_handler. Make them const to allow
the compiler to put them in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index d8decb345e9d..ea8f605b5c99 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -434,7 +434,7 @@ static int qcom_slim_qmi_send_power_request(struct qcom_slim_ngd_ctrl *ctrl,
 	return 0;
 }
 
-static struct qmi_msg_handler qcom_slim_qmi_msg_handlers[] = {
+static const struct qmi_msg_handler qcom_slim_qmi_msg_handlers[] = {
 	{
 		.type = QMI_RESPONSE,
 		.msg_id = SLIMBUS_QMI_POWER_RESP_V01,
@@ -1309,7 +1309,7 @@ static void qcom_slim_ngd_qmi_del_server(struct qmi_handle *hdl,
 	qmi->svc_info.sq_port = 0;
 }
 
-static struct qmi_ops qcom_slim_ngd_qmi_svc_event_ops = {
+static const struct qmi_ops qcom_slim_ngd_qmi_svc_event_ops = {
 	.new_server = qcom_slim_ngd_qmi_new_server,
 	.del_server = qcom_slim_ngd_qmi_del_server,
 };
-- 
2.29.2

