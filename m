Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C41D8358B09
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 19:12:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232023AbhDHRMb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 13:12:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231566AbhDHRMa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 13:12:30 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC13FC061760
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Apr 2021 10:12:17 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id f2-20020a17090a4a82b02900c67bf8dc69so3566458pjh.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Apr 2021 10:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NbF124KRasDzZQm0mjKapmMYmH1JJyipVNq4bCxuJZo=;
        b=xyQOevybRhccvFEmSeWlIHeszjmibVH6JCYi/z24DTj6q+C/KOG7t6hK4XsyQ+utBI
         17XOgIX5ycSJUn8MjsweS81ajtsgR4Xr5W18dueJPi4g1gGhDmFLfJ8tmUE0vq3Ty9qf
         5UOTiVgEbVZiMeurt/x67xw2eTcw/HRcyWK5Ufa4TWzYRWx22vNIuUbzz+L3m17AF1ZV
         VnFKs5cyLl8nYxZk7wVNTisXi5ZTFQZYKlra8KHrH6IDU+6oFxFkU6b+mlUJK4DeDJJ3
         25KhsMUmWxHdQ7u/7gIXHkrVh2SU+MA4bmUGdYDNxZBesiThTURpBtnL6mX+8/n22qG7
         4xpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NbF124KRasDzZQm0mjKapmMYmH1JJyipVNq4bCxuJZo=;
        b=eLSRXpDt9Ap3H5ElX5QwP6wGPP5KDELcyeoylDxSN1SIBhTVyuAdSywPgN4Zfjw58y
         uzFlkTV3fxYfNxUzceDlTgrQ8bqtLPmdaq4L1a2cvJOZgaGVoBp3U4sJ4g+Mvq6kAhTm
         FTepXyGX1240dzUFXjhPlTFUlhXJupSNLEb2QDuLD3+N62eCEiVSX5UrjIaqGbgZI2vp
         NhghfC90zHP9VSk2HAt0r8HhIC9ybFp55ftNU77tX1/zn+l74dbdon60X6OZTJIslP4g
         R6qvbunsPOy7yPcVodWUW1ezNmeeOjyRD+9CQ3T6W5U4KVNuRY61NfqWiaCc3R8gAP4H
         /9Kw==
X-Gm-Message-State: AOAM533HFEgHJAReEMkrr+B8AzwrNZhDNrmvIxofMBqkLxG+NH6MTdok
        GK7o8XBC0NqZh9ejj/yB7YQI
X-Google-Smtp-Source: ABdhPJya7nSzcUaXFinDbTdfWS0l9ypjD89LH9KIQB6IAMzmSAES0j+15MK1y2AhdTPBU1Lo9xUPeA==
X-Received: by 2002:a17:902:9f8f:b029:e9:944d:ea99 with SMTP id g15-20020a1709029f8fb02900e9944dea99mr3427565plq.45.1617901937299;
        Thu, 08 Apr 2021 10:12:17 -0700 (PDT)
Received: from localhost.localdomain ([103.77.37.191])
        by smtp.gmail.com with ESMTPSA id 205sm52749pfc.201.2021.04.08.10.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 10:12:16 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] remoteproc: qcom: pas: Add modem support for SDX55
Date:   Thu,  8 Apr 2021 22:42:11 +0530
Message-Id: <20210408171211.92141-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add remoteproc support for Hexagon modem found on the Qualcomm SDX55
platform.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index e635454d6170..292141877260 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -785,6 +785,22 @@ static const struct adsp_data wcss_resource_init = {
 	.ssctl_id = 0x12,
 };
 
+static const struct adsp_data sdx55_mpss_resource = {
+	.crash_reason_smem = 421,
+	.firmware_name = "modem.mdt",
+	.pas_id = 4,
+	.has_aggre2_clk = false,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mss",
+		NULL
+	},
+	.ssr_name = "mpss",
+	.sysmon_name = "modem",
+	.ssctl_id = 0x22,
+};
+
 static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,msm8974-adsp-pil", .data = &adsp_resource_init},
 	{ .compatible = "qcom,msm8996-adsp-pil", .data = &adsp_resource_init},
@@ -797,6 +813,7 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sc7180-mpss-pas", .data = &mpss_resource_init},
 	{ .compatible = "qcom,sdm845-adsp-pas", .data = &adsp_resource_init},
 	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &cdsp_resource_init},
+	{ .compatible = "qcom,sdx55-mpss-pas", .data = &sdx55_mpss_resource},
 	{ .compatible = "qcom,sm8150-adsp-pas", .data = &sm8150_adsp_resource},
 	{ .compatible = "qcom,sm8150-cdsp-pas", .data = &sm8150_cdsp_resource},
 	{ .compatible = "qcom,sm8150-mpss-pas", .data = &mpss_resource_init},
-- 
2.25.1

