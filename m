Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C32392FE154
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 06:00:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726431AbhAUDvq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jan 2021 22:51:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387714AbhAUBpr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jan 2021 20:45:47 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 737BCC061796
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 17:44:46 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id w8so537797oie.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 17:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qp0XT0+UoBcR+Gi5dgLwWchPJkjtv/YFAjritEYTQg8=;
        b=gK1QE3kHtp8QEIvI0opo00JntZ47JjasRnLUT4pcuhqDwfFeCVcjyBf3Frt1m6Jk/v
         98JgcUKQdj1bA0tXXqAe2W1DzllqPVuIYS79GmNiLrUTJ1Xu+4LUbGUWh7dExLlJ/RVM
         TmGpPT6QeJI6UR58yvUTeUtDg3gN7dgmbKUxrrfIG9somTEHx6RVD0ihDZizxN8WTnYg
         S01HXxtnxrt6+rYo9NiC1S7RJbSTnfs7ESTQcZV6lCE2ztmQ+KJ2MNeer++R88jaPmlq
         Xdd1xd1PH7L9Y+qlbyclsNuGLU/nJ6oPlLrtoVW1uNzZ9xMSh43/55UHhx8N9KT4bae1
         IxFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qp0XT0+UoBcR+Gi5dgLwWchPJkjtv/YFAjritEYTQg8=;
        b=MFjHErqkFMH04Zag6pQjeRBzLmcyBf9mbUBOHz8fuTJihRHAyvrDc5jWdwCO76UHtw
         AoKIP7J0b7rlRNYpYvvUG9BcSZwiJccLUeEA9pdua/WQ6lSyBKNSGyQJBFLW1RPjrztG
         BWNWYMwjTuEDJI7U5GZbIClbc78aLhklYSw0LITLW9Ji6sRBdMILeMCM+y9UEVkLdIbN
         xN1f8Ga2WSBfVbg76AJ67wGIIWv+RhaHhKCz4wtdjfiHXOjYKdtClCqZc3xWQkLHhXT0
         sQCCsBUj4n9B4q5QhujzOhPpPk/1CLixs0Btr+pRSo/9vNAdnWO65jIYHJnpdDFBbtZS
         c9ng==
X-Gm-Message-State: AOAM533K2PymqTX9pSplGY+GWjapahhMLqBYaWShFeXjc0PjTzlaS5J9
        n40VDZuDKyZaD7TqH0+tVnSU4A==
X-Google-Smtp-Source: ABdhPJzNT2oBjfAhJtmUA7Pw/7g34pYi3OjIvYIC1ROZi/AsGVVPbAtEZcOetMr57/gdKh0uGpp/Qw==
X-Received: by 2002:aca:8c5:: with SMTP id 188mr4705027oii.46.1611193485882;
        Wed, 20 Jan 2021 17:44:45 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x197sm758026ooa.27.2021.01.20.17.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 17:44:45 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] remoteproc: qcom: pas: Add SC8180X adsp, cdsp and mpss
Date:   Wed, 20 Jan 2021 17:44:52 -0800
Message-Id: <20210121014452.1612594-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121014452.1612594-1-bjorn.andersson@linaro.org>
References: <20210121014452.1612594-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm SC8180X has the typical ADSP, CDSP and MPSS remote
processors operated using the PAS interface, add support for these.

Attempts to configuring mss.lvl is failing, so a new adsp_data is
provided that skips this resource, for now.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ee586226e438..1231980d268f 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -650,6 +650,25 @@ static const struct adsp_data mpss_resource_init = {
 	.ssctl_id = 0x12,
 };
 
+static const struct adsp_data sc8180x_mpss_resource = {
+	.crash_reason_smem = 421,
+	.firmware_name = "modem.mdt",
+	.pas_id = 4,
+	.has_aggre2_clk = false,
+	.auto_boot = false,
+	.active_pd_names = (char*[]){
+		"load_state",
+		NULL
+	},
+	.proxy_pd_names = (char*[]){
+		"cx",
+		NULL
+	},
+	.ssr_name = "mpss",
+	.sysmon_name = "modem",
+	.ssctl_id = 0x12,
+};
+
 static const struct adsp_data slpi_resource_init = {
 		.crash_reason_smem = 424,
 		.firmware_name = "slpi.mdt",
@@ -736,6 +755,9 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,qcs404-cdsp-pas", .data = &cdsp_resource_init },
 	{ .compatible = "qcom,qcs404-wcss-pas", .data = &wcss_resource_init },
 	{ .compatible = "qcom,sc7180-mpss-pas", .data = &mpss_resource_init},
+	{ .compatible = "qcom,sc8180x-adsp-pas", .data = &sm8150_adsp_resource},
+	{ .compatible = "qcom,sc8180x-cdsp-pas", .data = &sm8150_cdsp_resource},
+	{ .compatible = "qcom,sc8180x-mpss-pas", .data = &sc8180x_mpss_resource},
 	{ .compatible = "qcom,sdm845-adsp-pas", .data = &adsp_resource_init},
 	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &cdsp_resource_init},
 	{ .compatible = "qcom,sm8150-adsp-pas", .data = &sm8150_adsp_resource},
-- 
2.29.2

