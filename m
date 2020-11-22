Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDC592BC3F1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Nov 2020 06:41:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727423AbgKVFlm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 22 Nov 2020 00:41:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727387AbgKVFlj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 22 Nov 2020 00:41:39 -0500
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC54AC0613D3
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2020 21:41:37 -0800 (PST)
Received: by mail-oi1-x241.google.com with SMTP id v202so12677764oia.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2020 21:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qvpm8U35Wi5xW8cDlkOEMWm9u3v4oYij+TGxaJn+sgw=;
        b=z0/F6IyZHUpoXEJ0ybXF0z+a2Xvsd86bf/HthIlSIfCqh4GOISDFivw9DlSAs43MUf
         KIiKAlMN1RyUIf05KNffeRroYx2MlnXI6wiQw8MoSLsIF4Vy4C8rBBmsZTyBTVpfIgrY
         1Qfoko5q9gxGU0WllYgLcIiywlvSd6LHUBv2z8VfFd8NtnwI9V0ihBcRW6jSIlYsplMQ
         8BHhmWltd/2s7hODDaApsQpF0l6uK4mKJKg7AY2COhy7o+orKDBnSoGDH/nlU1qMn3uT
         R5Xy6Ny3v4wBwutcyUM7HLDJCzXzVAni38fVw5XScvr1dca4ueAv2MG7Sz0ZxksNZZDD
         U9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qvpm8U35Wi5xW8cDlkOEMWm9u3v4oYij+TGxaJn+sgw=;
        b=O+HX4N3emdAScCuDiuP2zG8vYh21X/o1rK9rwX6w0+p7dNE+WrpOrFyWqwhD+AK594
         dAf+2BrfWOWSgHmADblQJXZh70mmIVVk1z4Lll9c6XD06+AIaolUqt9Bq+g9oI0Z7jMi
         uJdtC6bD8gp6g+mFJ3HIvi2fA661p5rHQ7G7LCL5XvVPahK3eAaCCYuCXm2JhMQYK3Vj
         IiuT8gvd1YXThIHq/j/0/dWkIH+I7wHoL82Pnyjlzgk9noizbpFFCvhhNL26AN6dPrCG
         nv/GZxPPuiW7yjrmvNA41OVUela8KA7X20TXt1EWl7/bLvE6k5SdrqZmlVmKRSQOPNFN
         tmFA==
X-Gm-Message-State: AOAM531p7uR5XZR2xhOuTUhuiJf/3TPG5ikFsj09inql4ok2IA38OpSa
        RMSmJt1LgatwbLT5GHpcWhj5ZA==
X-Google-Smtp-Source: ABdhPJxRJ6Pq2gDVZXh9XuwLH1m35Yf7+sfqi3oaKpZi2VQkh8xbuUn+pF/Kl/gQRDFRthtP79fiQA==
X-Received: by 2002:aca:a8c8:: with SMTP id r191mr11456932oie.138.1606023697312;
        Sat, 21 Nov 2020 21:41:37 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s28sm4303132otr.4.2020.11.21.21.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2020 21:41:36 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Siddharth Gupta <sidgup@codeaurora.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v3 4/4] remoteproc: sysmon: Improve error messages
Date:   Sat, 21 Nov 2020 21:41:35 -0800
Message-Id: <20201122054135.802935-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201122054135.802935-1-bjorn.andersson@linaro.org>
References: <20201122054135.802935-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Improve the style of a few of the error messages printed by the sysmon
implementation and fix the copy-pasted shutdown error in the send-event
function.

Tested-by: Steev Klimaszewski <steev@kali.org>
Reviewed-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Change since v2:
- None

 drivers/remoteproc/qcom_sysmon.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index a428b707a6de..9fed11a2b4ba 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -352,9 +352,9 @@ static bool ssctl_request_shutdown(struct qcom_sysmon *sysmon)
 
 	ret = qmi_txn_wait(&txn, 5 * HZ);
 	if (ret < 0) {
-		dev_err(sysmon->dev, "failed receiving QMI response\n");
+		dev_err(sysmon->dev, "timeout waiting for shutdown response\n");
 	} else if (resp.resp.result) {
-		dev_err(sysmon->dev, "shutdown request failed\n");
+		dev_err(sysmon->dev, "shutdown request rejected\n");
 	} else {
 		dev_dbg(sysmon->dev, "shutdown request completed\n");
 		acked = true;
@@ -397,18 +397,18 @@ static void ssctl_send_event(struct qcom_sysmon *sysmon,
 			       SSCTL_SUBSYS_EVENT_REQ, 40,
 			       ssctl_subsys_event_req_ei, &req);
 	if (ret < 0) {
-		dev_err(sysmon->dev, "failed to send shutdown request\n");
+		dev_err(sysmon->dev, "failed to send subsystem event\n");
 		qmi_txn_cancel(&txn);
 		return;
 	}
 
 	ret = qmi_txn_wait(&txn, 5 * HZ);
 	if (ret < 0)
-		dev_err(sysmon->dev, "failed receiving QMI response\n");
+		dev_err(sysmon->dev, "timeout waiting for subsystem event response\n");
 	else if (resp.resp.result)
-		dev_err(sysmon->dev, "ssr event send failed\n");
+		dev_err(sysmon->dev, "subsystem event rejected\n");
 	else
-		dev_dbg(sysmon->dev, "ssr event send completed\n");
+		dev_dbg(sysmon->dev, "subsystem event accepted\n");
 }
 
 /**
-- 
2.28.0

