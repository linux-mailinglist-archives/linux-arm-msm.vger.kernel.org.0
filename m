Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0410E49F174
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jan 2022 03:55:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345646AbiA1CzC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jan 2022 21:55:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345594AbiA1Cy5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jan 2022 21:54:57 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BACFDC061747
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 18:54:56 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id x193so9919874oix.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 18:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xBiCWtsGgqefLb9AuztIhrA4yfjIwqY0U6EiuLZrZUU=;
        b=TGLtGJupeZIo9t/IRGxXa/frN+pcYKpu6BHt4TovO2Hkuu41iR1o29KXFlofv+TO21
         kRGrjAY8PzQIwRZBbDH3cy1Qhj4bJeGy95HO8G2Fg8R3c281/BtxOM6u3tkWZ8D1iq0g
         vSsQ3GSrM+RTlcvbbiE8HZR+31wevHcrSBEcpWBn+dBz6azifXJxnnosV/hM71/forXo
         IcpKJrX2EyhO4b8NFPzu+osqW9C86JfF+srihK9xBEWqls53QOt/22T7OVCz0eIXoOXT
         WTIzTVA/yt61J8Jg0K5FTyNCmYQT6a5FPGTWR2ZgDvOKHcseiX2rZk8JOIPHgvDZikJy
         lMKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xBiCWtsGgqefLb9AuztIhrA4yfjIwqY0U6EiuLZrZUU=;
        b=ZnAftG67kl1vC4Ptxkfwt6Kq3u0nR9RIoqtoPZ9gEleK7XfsEfQOsoQclbqWKbXonF
         sV/SwLG0jRXD364BuOXo6MKPtmodDoub6Yzyrgtw1B4mYLDjmtw6U/QVKvABe/RYDHP5
         KSBE+pGKjXzPNCG5FykOAvkVrfXqPEj2UvOj9VO4A2M1gq0Er0SeixH2C5saopBjbjWI
         IFojJzLOUW+AIgGGHp42uvpczV0Y+Qd7f/bBTiT9fPOdFDlIvVda3cx5pVlJA9egg6hC
         uIr/Ju/LfxiM5F35LnKXSWvxMEm7rHaV39MCVwOv5OUNgk3+vcMFU3NClZkd9oo41/hW
         rjRg==
X-Gm-Message-State: AOAM531s/qj4H40AHiLU8bwuG6VYPvBdohL2s39OFgFFayCWGvq/w0jL
        n3Ts/N1cgq0XRDbli7nz6v8ijA==
X-Google-Smtp-Source: ABdhPJySP4qIRSGen71caCN9W7UC+4NwBwu8H6BxLgMre7n36tSfnYblNaA8coJdnP3ysOrU5ee5Yw==
X-Received: by 2002:a05:6808:2382:: with SMTP id bp2mr727360oib.171.1643338496038;
        Thu, 27 Jan 2022 18:54:56 -0800 (PST)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id k6sm5677352oop.28.2022.01.27.18.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 18:54:55 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 09/13] remoteproc: qcom: pas: Carry PAS metadata context
Date:   Thu, 27 Jan 2022 18:55:09 -0800
Message-Id: <20220128025513.97188-10-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128025513.97188-1-bjorn.andersson@linaro.org>
References: <20220128025513.97188-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Starting with Qualcomm SM8450 the metadata object shared with the secure
world during authentication and booting of a remoteproc needs to be
alive from init_image() until auth_and_reset().

Use the newly introduced "PAS metadata context" object to track this
context from load until the firmware has been booted.

In the even that load is performed but the process for some reason
doesn't reach auth_and_reset the unprepare callback is used to clean up
the allocated memory.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 32 +++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 184bb7cdf95a..5e806f657fec 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -79,6 +79,8 @@ struct qcom_adsp {
 	struct qcom_rproc_subdev smd_subdev;
 	struct qcom_rproc_ssr ssr_subdev;
 	struct qcom_sysmon *sysmon;
+
+	struct qcom_scm_pas_metadata pas_metadata;
 };
 
 static void adsp_minidump(struct rproc *rproc)
@@ -126,14 +128,34 @@ static void adsp_pds_disable(struct qcom_adsp *adsp, struct device **pds,
 	}
 }
 
+static int adsp_unprepare(struct rproc *rproc)
+{
+	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
+
+	/*
+	 * adsp_load() did pass pas_metadata to the SCM driver for storing
+	 * metadata context. It might have been released already if
+	 * auth_and_reset() was successful, but in other cases clean it up
+	 * here.
+	 */
+	qcom_scm_pas_metadata_release(&adsp->pas_metadata);
+
+	return 0;
+}
+
 static int adsp_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
 	int ret;
 
-	ret = qcom_mdt_load(adsp->dev, fw, rproc->firmware, adsp->pas_id,
-			    adsp->mem_region, adsp->mem_phys, adsp->mem_size,
-			    &adsp->mem_reloc);
+	ret = qcom_mdt_pas_init(adsp->dev, fw, rproc->firmware, adsp->pas_id,
+				adsp->mem_phys, &adsp->pas_metadata);
+	if (ret)
+		return ret;
+
+	ret = qcom_mdt_load_no_init(adsp->dev, fw, rproc->firmware, adsp->pas_id,
+				    adsp->mem_region, adsp->mem_phys, adsp->mem_size,
+				    &adsp->mem_reloc);
 	if (ret)
 		return ret;
 
@@ -185,6 +207,8 @@ static int adsp_start(struct rproc *rproc)
 		goto disable_px_supply;
 	}
 
+	qcom_scm_pas_metadata_release(&adsp->pas_metadata);
+
 	return 0;
 
 disable_px_supply:
@@ -255,6 +279,7 @@ static unsigned long adsp_panic(struct rproc *rproc)
 }
 
 static const struct rproc_ops adsp_ops = {
+	.unprepare = adsp_unprepare,
 	.start = adsp_start,
 	.stop = adsp_stop,
 	.da_to_va = adsp_da_to_va,
@@ -264,6 +289,7 @@ static const struct rproc_ops adsp_ops = {
 };
 
 static const struct rproc_ops adsp_minidump_ops = {
+	.unprepare = adsp_unprepare,
 	.start = adsp_start,
 	.stop = adsp_stop,
 	.da_to_va = adsp_da_to_va,
-- 
2.33.1

