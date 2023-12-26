Return-Path: <linux-arm-msm+bounces-5966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C860481E431
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Dec 2023 01:50:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABFAB1C21B90
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Dec 2023 00:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 857761374;
	Tue, 26 Dec 2023 00:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ChBocOp3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFCFA47
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Dec 2023 00:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-554fe147ddeso635381a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Dec 2023 16:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703550890; x=1704155690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D2BpmMOrsZQoLsyIn7ndsCgpL3U+77hQN1G7jreKo3E=;
        b=ChBocOp3OGUXrCV64bDn2YIp4jBvc43JAf4q4fq+8ZZc9MXmWWWtCJhLynBu8s+545
         QiqZP/d1owOXIvE4wuTlWT0YMQwWRmb5J9nBU+RlrEWHIKwiJe1a8rYLZ/qhNLEkmKlX
         lX5kYgpvJ+Vc32Ru/8F+EBDXMCfgaLnH+XfjOt2XtsKFbRgqxR7kF8ll20vSH+O8atAH
         cJFwbSmxPwGGXsXV2jDkFQFekTH3t7BsAqb0v3K2avfZXWow+ZhMatV51UYuwUctHd11
         984UwQht7HHon5UaDyOudUVUOKS0klqqYK+M2hccT0Fi8hoR/MFu61YxJ5bkbv8bH7DS
         0OOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703550890; x=1704155690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D2BpmMOrsZQoLsyIn7ndsCgpL3U+77hQN1G7jreKo3E=;
        b=VsuOIK2cnvkuT+Wywbzk8EdtcN2dk4Gqv0tHlXFtAKlvWvwpK2petVurewgr7eWeG8
         fs40WcDP0kT3dHZGELVlVj+Mq9kqOXu39lCYVUmaQO+5liW4iN4BupqhOnbfNSHesr8f
         tMtIUx48s3lYGLI2uugAtViX6I4ivSD/9T59fkf0jeHSpWGPghfxAFHK6fg0oHBi6VmR
         aekJlF75l6+uuZRyHLwA3Q1p8iGNcyVAqgMGkonTV3+MEYBuzzHuH2ZJq8Kc3jZXNo6g
         PLc56wtFl3gMaFDQfDuqgUAvLbMGl71byAXGvksvd3XzWIH66N/o54BT1hupsK4vYcHU
         3tvw==
X-Gm-Message-State: AOJu0Yyh9jHqySeayd9ALSoZK/mXJerXuNnKEW0a3EHMaTqD0+kaCZpi
	2PVhAhp6Wyv0303Z0RIFun57N2HRweq0yw==
X-Google-Smtp-Source: AGHT+IFakMVP6FnIu3+AsY7f+Xq0bPOEDOxTfMnL4Ax79OVoKytsJlo8356fg01IBG9bBt+Xf3TOMA==
X-Received: by 2002:aa7:d818:0:b0:553:d6f0:1e54 with SMTP id v24-20020aa7d818000000b00553d6f01e54mr2698601edq.123.1703550889865;
        Mon, 25 Dec 2023 16:34:49 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d1-20020a05651c088100b002ccb1301d53sm1368810ljq.48.2023.12.25.16.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Dec 2023 16:34:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [RFC PATCH 2/5] remoteproc: qcom: pas: correct data indentation
Date: Tue, 26 Dec 2023 02:34:44 +0200
Message-Id: <20231226003447.3044365-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231226003447.3044365-1-dmitry.baryshkov@linaro.org>
References: <20231226003447.3044365-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct indentation of several struct adsp_data instances to always use
a single TAB character instead of two.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 126 +++++++++++++++--------------
 1 file changed, 64 insertions(+), 62 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index a9dd58608052..c1f7c5ff8d93 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -777,24 +777,24 @@ static void adsp_remove(struct platform_device *pdev)
 }
 
 static const struct adsp_data adsp_resource_init = {
-		.crash_reason_smem = 423,
-		.firmware_name = "adsp.mdt",
-		.pas_id = 1,
-		.auto_boot = true,
-		.ssr_name = "lpass",
-		.sysmon_name = "adsp",
-		.ssctl_id = 0x14,
+	.crash_reason_smem = 423,
+	.firmware_name = "adsp.mdt",
+	.pas_id = 1,
+	.auto_boot = true,
+	.ssr_name = "lpass",
+	.sysmon_name = "adsp",
+	.ssctl_id = 0x14,
 };
 
 static const struct adsp_data sdm845_adsp_resource_init = {
-		.crash_reason_smem = 423,
-		.firmware_name = "adsp.mdt",
-		.pas_id = 1,
-		.auto_boot = true,
-		.load_state = "adsp",
-		.ssr_name = "lpass",
-		.sysmon_name = "adsp",
-		.ssctl_id = 0x14,
+	.crash_reason_smem = 423,
+	.firmware_name = "adsp.mdt",
+	.pas_id = 1,
+	.auto_boot = true,
+	.load_state = "adsp",
+	.ssr_name = "lpass",
+	.sysmon_name = "adsp",
+	.ssctl_id = 0x14,
 };
 
 static const struct adsp_data sm6350_adsp_resource = {
@@ -829,18 +829,18 @@ static const struct adsp_data sm6375_mpss_resource = {
 };
 
 static const struct adsp_data sm8150_adsp_resource = {
-		.crash_reason_smem = 423,
-		.firmware_name = "adsp.mdt",
-		.pas_id = 1,
-		.auto_boot = true,
-		.proxy_pd_names = (char*[]){
-			"cx",
-			NULL
-		},
-		.load_state = "adsp",
-		.ssr_name = "lpass",
-		.sysmon_name = "adsp",
-		.ssctl_id = 0x14,
+	.crash_reason_smem = 423,
+	.firmware_name = "adsp.mdt",
+	.pas_id = 1,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		NULL
+	},
+	.load_state = "adsp",
+	.ssr_name = "lpass",
+	.sysmon_name = "adsp",
+	.ssctl_id = 0x14,
 };
 
 static const struct adsp_data sm8250_adsp_resource = {
@@ -873,20 +873,22 @@ static const struct adsp_data sm8350_adsp_resource = {
 	.ssr_name = "lpass",
 	.sysmon_name = "adsp",
 	.ssctl_id = 0x14,
+	.num_domains = ARRAY_SIZE(sm8350_adsp_domains),
+	.domains = sm8350_adsp_domains,
 };
 
 static const struct adsp_data msm8996_adsp_resource = {
-		.crash_reason_smem = 423,
-		.firmware_name = "adsp.mdt",
-		.pas_id = 1,
-		.auto_boot = true,
-		.proxy_pd_names = (char*[]){
-			"cx",
-			NULL
-		},
-		.ssr_name = "lpass",
-		.sysmon_name = "adsp",
-		.ssctl_id = 0x14,
+	.crash_reason_smem = 423,
+	.firmware_name = "adsp.mdt",
+	.pas_id = 1,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		NULL
+	},
+	.ssr_name = "lpass",
+	.sysmon_name = "adsp",
+	.ssctl_id = 0x14,
 };
 
 static const struct adsp_data cdsp_resource_init = {
@@ -1033,33 +1035,33 @@ static const struct adsp_data sc8180x_mpss_resource = {
 };
 
 static const struct adsp_data msm8996_slpi_resource_init = {
-		.crash_reason_smem = 424,
-		.firmware_name = "slpi.mdt",
-		.pas_id = 12,
-		.auto_boot = true,
-		.proxy_pd_names = (char*[]){
-			"ssc_cx",
-			NULL
-		},
-		.ssr_name = "dsps",
-		.sysmon_name = "slpi",
-		.ssctl_id = 0x16,
+	.crash_reason_smem = 424,
+	.firmware_name = "slpi.mdt",
+	.pas_id = 12,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"ssc_cx",
+		NULL
+	},
+	.ssr_name = "dsps",
+	.sysmon_name = "slpi",
+	.ssctl_id = 0x16,
 };
 
 static const struct adsp_data sdm845_slpi_resource_init = {
-		.crash_reason_smem = 424,
-		.firmware_name = "slpi.mdt",
-		.pas_id = 12,
-		.auto_boot = true,
-		.proxy_pd_names = (char*[]){
-			"lcx",
-			"lmx",
-			NULL
-		},
-		.load_state = "slpi",
-		.ssr_name = "dsps",
-		.sysmon_name = "slpi",
-		.ssctl_id = 0x16,
+	.crash_reason_smem = 424,
+	.firmware_name = "slpi.mdt",
+	.pas_id = 12,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"lcx",
+		"lmx",
+		NULL
+	},
+	.load_state = "slpi",
+	.ssr_name = "dsps",
+	.sysmon_name = "slpi",
+	.ssctl_id = 0x16,
 };
 
 static const struct adsp_data wcss_resource_init = {
-- 
2.39.2


