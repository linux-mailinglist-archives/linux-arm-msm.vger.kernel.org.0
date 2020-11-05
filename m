Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3C7B2A7697
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Nov 2020 05:50:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731111AbgKEEug (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Nov 2020 23:50:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730990AbgKEEuf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Nov 2020 23:50:35 -0500
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8A9EC0613D4
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2020 20:50:35 -0800 (PST)
Received: by mail-oo1-xc41.google.com with SMTP id c25so118680ooe.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2020 20:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rkVPfPXhshaukUCMauMgnylUImITZ+1YVILqFo4Qmt8=;
        b=qCL6DA3P2yHRwk3ltNkvjsvo01LdCn/n8WIEQp1D2XSx3n7ejscKF7XVTDSbGRL8Yw
         pv9p3TxfK1aeisN4bJOHu5prWSC4G25cR18n5cvHQIeAbSAJuDrELKNuaUYnHpX9WPPI
         Hb5j4E5XisP8RgNvSCAoZaf69DCpmdZN/19DlyNMaVoWOduMqzJSqgeArp3ecOOpHrEE
         PrCdUsV9+K1+wPQUlKaA95b7yC4mP724i2NUY5W/JEgQUb+/RUKc/Ryr/OEInsDyQeML
         /SCVv9veXdrIOIiMIcy9uIPgJPQhnGVObv0gCUifMNge7+FlaIbRooi1xBkOxj1hWchN
         Uvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rkVPfPXhshaukUCMauMgnylUImITZ+1YVILqFo4Qmt8=;
        b=rRC4NwSogd93ge+fXscYQuJnmXr65DZjIjFMN71dgvJfDOf8Sxm2RiGWFjV0m1SERq
         IWbKMKpsXMFNKRRdIO4qMp6SGi1f8I3OmoEmyRo0c/mAL/bO4PDLsNwZm+eySL+K7WjA
         F1rOy7WtvV1MmtZmAy1oZZSkaWE1pS9Sfo30p1w2hncK9zBLCFuNUArVwzuRxKeLRjjT
         WBJAtwwzJ1reeBe5NsJdnB0mhQ4g82xJD/qB2zqDCDAmu/hGa4LWRvzfqXQEyieuLkA2
         TlRQiR3Ka4ypjJ3KZgDiU+avYtGFsnLzCktdly8BjKdZA3dxUdf8Wi7ifSnWds+Kxs5m
         MPGA==
X-Gm-Message-State: AOAM532OuNunXI5Pei5YVb9f3ji5AfiD5A2zCxcDKfHn7bUv5nEC+jCh
        oSyo60Nzd9cJ6Rm8nDv8R6KaHw==
X-Google-Smtp-Source: ABdhPJymPbjeOprNtaxPp1W80QiilQg2qTlH5qqrfCx3DneU9oOQDfVxhbXUe3DfaOvFHsnRkoVR5Q==
X-Received: by 2002:a4a:1d03:: with SMTP id 3mr534295oog.19.1604551835201;
        Wed, 04 Nov 2020 20:50:35 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k13sm100553ooi.41.2020.11.04.20.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 20:50:34 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] remoteproc: sysmon: Improve error messages
Date:   Wed,  4 Nov 2020 20:50:51 -0800
Message-Id: <20201105045051.1365780-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201105045051.1365780-1-bjorn.andersson@linaro.org>
References: <20201105045051.1365780-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Improve the style of a few of the error messages printed by the sysmon
implementation and fix the copy-pasted shutdown error in the send-event
function.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- New patch

 drivers/remoteproc/qcom_sysmon.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index 1c42f00010d3..47683932512a 100644
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

