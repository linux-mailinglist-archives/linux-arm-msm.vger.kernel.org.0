Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB41C17F0AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 07:40:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbgCJGkA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 02:40:00 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:36440 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbgCJGj4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 02:39:56 -0400
Received: by mail-pj1-f66.google.com with SMTP id l41so13212pjb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2020 23:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wth+YSNI1ILDm//Nc9zfzczmIG6U29YhiobOLaMSS5A=;
        b=cou9tdhqsO28ChyfRFJ7LAFEH7FzhzZXKctfzMAgZPf9ZJ7qnB3p8YQqC6t/EuUjMz
         DZH65hjX3Cf9bDvbpVqsCNo0/TyUN/cb7+OS3ZJ9VY7sUqUunwMpOI0DB8BfsrDDQiZk
         Ytoqf2sZyzfR3PfaT51X3gsass7Jt4kmIzi/VXr0Kw45Wj4Jte6ITaX99scuWBXpOEBl
         hRz5J3rKjjGlgn8H9nvs9IauWfg+HCpoHkFfwsL+eEDtNTiq0rEmffkf/UhfGvESO6mq
         zFSW5Jiy7850L9GZ7CWQLVb2NZLmJVIqPj8xP7wPHjsOLMYWl3qN0HqdEQ5NylMyyLMr
         sWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wth+YSNI1ILDm//Nc9zfzczmIG6U29YhiobOLaMSS5A=;
        b=QqJW/U5kA8/toAR3frC172d87As8VWk/h+b6EMyCjXT7zPUmr4qe/H9nhKZxePW5tv
         /AKevKB6jfIeQ6FOMchVwXhHI3wx1QZjT/gvPDRpU15GYVglkIDEyPz8jbVpsS1I/7Ls
         8BJWTenfzODcFDDYPAGoO72e8Td/pvanB5weXuPR3X7wNCN5V2ieEPJg8m/JQMT+DbvY
         Z95ht8bk17srQQF9LTbDVwMOlSy5EW/RVkxFPGYajLZVz/srJcmi5svSBDKWxwinuAC/
         qYEpzbUulhglYSuZmmhsmyJimqovBvpzW4hwbP6YPLn8Q/SOj6ghEZvbv8FxUTFGDdZl
         bJgw==
X-Gm-Message-State: ANhLgQ1GXZAeOLGTit4WOrH8t+qhF2yYqL62dhbCrNwuHRRog1tfHaCw
        AYeIjlHD4/6QUA4DjCYaWN1KJg==
X-Google-Smtp-Source: ADFU+vtAtJ+mkEcjXYud1PcBTJ+GOJyqExwers6az7Navv2+vZIm0KfBsjEdIR2qpJfCeoWagqXYvQ==
X-Received: by 2002:a17:90a:a617:: with SMTP id c23mr236519pjq.32.1583822394882;
        Mon, 09 Mar 2020 23:39:54 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j38sm42398468pgi.51.2020.03.09.23.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 23:39:54 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [PATCH v4 4/4] remoteproc: qcom: Introduce panic handler for PAS and ADSP
Date:   Mon,  9 Mar 2020 23:38:17 -0700
Message-Id: <20200310063817.3344712-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200310063817.3344712-1-bjorn.andersson@linaro.org>
References: <20200310063817.3344712-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Make the PAS and ADSP/CDSP remoteproc drivers implement the panic
handler that will invoke a stop to prepare the remoteprocs for post
mortem debugging.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Change since v3:
 - Change return type to unsigned long

 drivers/remoteproc/qcom_q6v5_adsp.c | 8 ++++++++
 drivers/remoteproc/qcom_q6v5_pas.c  | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index d5cdff942535..8f1044e8ea3b 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -292,12 +292,20 @@ static void *adsp_da_to_va(struct rproc *rproc, u64 da, int len)
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
index e64c268e6113..678c0ddfce96 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -243,12 +243,20 @@ static void *adsp_da_to_va(struct rproc *rproc, u64 da, int len)
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

