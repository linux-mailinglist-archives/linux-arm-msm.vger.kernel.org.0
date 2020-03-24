Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1608C19052C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2020 06:29:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725905AbgCXF3S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Mar 2020 01:29:18 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38139 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727064AbgCXF3P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Mar 2020 01:29:15 -0400
Received: by mail-pf1-f195.google.com with SMTP id z25so4386344pfa.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2020 22:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VWBRcEyMTW+WEEQt5SQF5x0ROI7z/m3lM/vgJNL3hXc=;
        b=iMrML+KBB5l6Ri6XlYTp/N4rYhFdoHCnP7QF50uxsXOpRFiKMrfs0dVaox9kc0xcpk
         hDjTamvLPXs8Upj4Txl/ZHG7p5o0uh/h4CBrV7yV+cqh9b2XxArrbKrfNKS7mThX4n87
         lh8OPKocwkJvWLbmZX6QAE0HQHdUs3bpdkUs/OgRPxtXRRP9LCE32J1PWeMPGXIhfLO3
         fbLOb+gkZJEbUiZtlW1cDNsxO/3I7cck8/8NDOeazkFQSG+hVXlbBRhsRG4hIBNxfSBd
         WF/XUlVoJlJVU4w5XTa67bZLj16R7bdlhJiwPTYveSpjX/bQIMr8cOg1aIx8hJF/Edc6
         nD5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VWBRcEyMTW+WEEQt5SQF5x0ROI7z/m3lM/vgJNL3hXc=;
        b=Uye7SKP4pcWOlY3LitET/h0uE2jtn9vHl+MD3nfM57RORF55ryFP0dOrYBYyermYBH
         P7+iN2nzhKAwJG974R1eMKIyE0usTF+0V/45fpn2gwbtTxgFY/BsUFVjSu3Y+pGsW9ki
         vbOZnC4887ggG8Fft6ymlbVvhvxP2Ra3jfd4TzJhYN8wlCHUq/zF4U5JDQv4+csw9Lkk
         4CKF33vMKEqKhRP6WBrA6yLoqsQMabUaCVdyh6mdrop5lisdMDSzlywBAzmZPf8qcJ55
         F8FAvMI7AuJNMtfRffIhhBBA2NQpE4GI13GIRprbTPhsATF5v6fJm17M5bTZ9eWwZbW8
         FBRA==
X-Gm-Message-State: ANhLgQ33NgXww7fB/Xe3xdw7fU9XJfA8uC9I1htBK3GBirmojD7D0jm6
        SoT0GPUEJ54gCnJqQ5ZggATYBA==
X-Google-Smtp-Source: ADFU+vtOqgoS3fw1vbaf1mdZpAWooFoKkJLbDx+LEZkLb5acpopnw2DgJmwSlrkhIO+GwxuRyZ3Fww==
X-Received: by 2002:a63:6a4a:: with SMTP id f71mr26576969pgc.365.1585027753896;
        Mon, 23 Mar 2020 22:29:13 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j14sm2795413pgk.74.2020.03.23.22.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 22:29:13 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH v5 4/4] remoteproc: qcom: Introduce panic handler for PAS and ADSP
Date:   Mon, 23 Mar 2020 22:29:04 -0700
Message-Id: <20200324052904.738594-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200324052904.738594-1-bjorn.andersson@linaro.org>
References: <20200324052904.738594-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Make the PAS and ADSP/CDSP remoteproc drivers implement the panic
handler that will invoke a stop to prepare the remoteprocs for post
mortem debugging.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v4:
- Picked up Mathieu's r-b

 drivers/remoteproc/qcom_q6v5_adsp.c | 8 ++++++++
 drivers/remoteproc/qcom_q6v5_pas.c  | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 2b01f2282062..24a3db961d5e 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -282,12 +282,20 @@ static void *adsp_da_to_va(struct rproc *rproc, u64 da, size_t len)
 	return adsp->mem_region + offset;
 }
 
+static unsigned long adsp_panic(struct rproc *rproc)
+{
+	struct qcom_adsp *adsp = rproc->priv;
+
+	return qcom_q6v5_panic(&adsp->q6v5);
+}
+
 static const struct rproc_ops adsp_ops = {
 	.start = adsp_start,
 	.stop = adsp_stop,
 	.da_to_va = adsp_da_to_va,
 	.parse_fw = qcom_register_dump_segments,
 	.load = adsp_load,
+	.panic = adsp_panic,
 };
 
 static int adsp_init_clock(struct qcom_adsp *adsp, const char **clk_ids)
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index a41860d2243a..7a63efb85405 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -234,12 +234,20 @@ static void *adsp_da_to_va(struct rproc *rproc, u64 da, size_t len)
 	return adsp->mem_region + offset;
 }
 
+static unsigned long adsp_panic(struct rproc *rproc)
+{
+	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
+
+	return qcom_q6v5_panic(&adsp->q6v5);
+}
+
 static const struct rproc_ops adsp_ops = {
 	.start = adsp_start,
 	.stop = adsp_stop,
 	.da_to_va = adsp_da_to_va,
 	.parse_fw = qcom_register_dump_segments,
 	.load = adsp_load,
+	.panic = adsp_panic,
 };
 
 static int adsp_init_clock(struct qcom_adsp *adsp)
-- 
2.24.0

