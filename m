Return-Path: <linux-arm-msm+bounces-5168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E01A6816B21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Dec 2023 11:29:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56AFCB20BC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Dec 2023 10:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7501617988;
	Mon, 18 Dec 2023 10:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L45Kmsk6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522DF1427A
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Dec 2023 10:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40b5155e154so34498915e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Dec 2023 02:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702895296; x=1703500096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zMHQ7FxowXR5FFIdGfBk5jzb/m9p5t8DcpQDDoewRFI=;
        b=L45Kmsk6go84ASzMYFtO/B1ZGpOYaRres4/vkled7tk+2hLJ2bhUpe6lgfzSK78QXo
         Hion2y6FHravOj9bhjdlEVwcBNemn+rVj73MfYrow+bWotHY4B/lFjyJmMx7XK5hiWub
         b3ODzQ8kz1kelcJHzgMX9WFE5gUb6C4XjHXePslCwm5Mp9uUOgB9Mel+vrrLCeKu1W39
         SyAdIxbDxxVBB0SZ0Pta4DojovSmgqo6bQ2l+gVG6eSDixzPh4AZFsFmNeve/H068u+1
         pdI4gtyOn5f9o+yU5VxVaFZAATo7qSwYR6mhyKn61VaX0DpEWPwZzHZGee0L7vZMVsw8
         C70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702895296; x=1703500096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zMHQ7FxowXR5FFIdGfBk5jzb/m9p5t8DcpQDDoewRFI=;
        b=NurE0HRYUmkcWmdUFuMaIhimuQExSoFjmmzWsQBBu7eyilWKzqLlv67WNJkKcvPBU9
         LJc1EsvIK6Hn2jaA+Z2SmkNf5iWw9tyDcQD+dmiITda4xLG6hpi2lAOfwZJn5TvZ4VM0
         PpDPQZ2DIzgebSbV0LhidHQ0vV7a89lRmZ5h392/XWaDlyjkClzBZZn0/eEWLZgUm5bo
         MXDfHROUBsxX1yN6dElOgjXHpfgMtpdb5IDAwKUsAMFAQVNPHsbxnm/9WJmc1lDD8UjK
         G3DF8iPMsbqu/86kQlixbXXGyujD0OZ3R0oh05Xi6UolPXACyJRbMqJvoYRARjT9NtgO
         ZLMg==
X-Gm-Message-State: AOJu0YzVfwvaoB6XicmeoofGRJsZ1NDmFizKHHifJhHS8R9xJcZmowRq
	ENQtoobAlUqvhooIVChKamJUiw==
X-Google-Smtp-Source: AGHT+IFNqdVjTsVfqg55j2HNpFNzKNlJ2ojJ/0gzSRJsrU1bgBZJvUCsm0dU6AGb0FSUTSXUYerbtQ==
X-Received: by 2002:a05:600c:30d2:b0:40c:4378:f111 with SMTP id h18-20020a05600c30d200b0040c4378f111mr6666736wmn.80.1702895296475;
        Mon, 18 Dec 2023 02:28:16 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ay35-20020a05600c1e2300b0040b2b38a1fasm41857967wmb.4.2023.12.18.02.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 02:28:16 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 18 Dec 2023 11:28:11 +0100
Subject: [PATCH v6 3/3] remoteproc: qcom: pas: Add SM8650 remoteproc
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231218-topic-sm8650-upstream-remoteproc-v6-3-3d16b37f154b@linaro.org>
References: <20231218-topic-sm8650-upstream-remoteproc-v6-0-3d16b37f154b@linaro.org>
In-Reply-To: <20231218-topic-sm8650-upstream-remoteproc-v6-0-3d16b37f154b@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2548;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=dRIOpHbtn+6YYLWqsr39smtxV2/mprbkVvuZ9tMTQvg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlgB67IsYHxNVpjconBvtj59V1HQ9zeRFPORhCOYk2
 phvMO3yJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZYAeuwAKCRB33NvayMhJ0f9nD/
 93SMhaFuOPVVU1Er3kqOX598KiaKIl32niAIr2osSGkIxuxenuZvX24Tcn9PztF48p8U6ufxy/O2+0
 +wcC+WtpkpEsjOSgrRBFLQejJwU2ubRcX1IWRaTYsMpb3wY0STsjgAZGkxoZL9ddQlGD1Jyf1011Sx
 68R2ht4e3csATJtSqje0XwoItD1dJlLMzzHOvbh3qEZAcJpDpvV8mfE+1E4d7f1x9un9tl5Bq8MNRE
 jfMmAh788ZSbYVGu5InJnXVoSM4KRWNamYQtD7Qj93HNTqnxGHNcT1ejCiJSvYp9RxfWloazROERD5
 yp3vTin8wWCqtpirSAMbqJGdr7yNz7iFUjMAkdYz4QCZLBtXkznQ8mLYT522yQWHlmYLEH67dcujwr
 SRfeGb7qWBZXWalL7jHbxNT8MjE0uHRso9+9Vfd6FVss9alvX+1esxTnGB1VZaC1XIgZuDmigNaW6Z
 85jCws4ah3yUmuBvRLMZy/zoStmMo/JHF1+Fv3r6vNeC/OAJ0pT6GWfq/6TC9eykVZVI7hXc2FdI0h
 RQaM3dFYk+J+glMhDoVvLRSDZZ4iGDwLL4iz6BsJ1ZlP94E4ET9262Quof01Em1tVT0JaYuURNAk/5
 c1eKxDQ9DsWeF2NgIQtJwQyxipomq8tvG0UGlAF/CMlJU0f6nByYWwHytSNA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add DSP Peripheral Authentication Service support for the SM8650 platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 50 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index e90783fd1129..f7967a25ecdb 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1213,6 +1213,53 @@ static const struct adsp_data sc7280_wpss_resource = {
 	.ssctl_id = 0x19,
 };
 
+static const struct adsp_data sm8650_cdsp_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mdt",
+	.dtb_firmware_name = "cdsp_dtb.mdt",
+	.pas_id = 18,
+	.dtb_pas_id = 0x25,
+	.minidump_id = 7,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mxc",
+		"nsp",
+		NULL
+	},
+	.load_state = "cdsp",
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+	.region_assign_idx = 2,
+	.region_assign_count = 1,
+	.region_assign_shared = true,
+	.region_assign_vmid = QCOM_SCM_VMID_CDSP,
+};
+
+static const struct adsp_data sm8650_mpss_resource = {
+	.crash_reason_smem = 421,
+	.firmware_name = "modem.mdt",
+	.dtb_firmware_name = "modem_dtb.mdt",
+	.pas_id = 4,
+	.dtb_pas_id = 0x26,
+	.minidump_id = 3,
+	.auto_boot = false,
+	.decrypt_shutdown = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mss",
+		NULL
+	},
+	.load_state = "modem",
+	.ssr_name = "mpss",
+	.sysmon_name = "modem",
+	.ssctl_id = 0x12,
+	.region_assign_idx = 2,
+	.region_assign_count = 2,
+	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
+};
+
 static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,msm8226-adsp-pil", .data = &adsp_resource_init},
 	{ .compatible = "qcom,msm8953-adsp-pil", .data = &msm8996_adsp_resource},
@@ -1268,6 +1315,9 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sm8550-adsp-pas", .data = &sm8550_adsp_resource},
 	{ .compatible = "qcom,sm8550-cdsp-pas", .data = &sm8550_cdsp_resource},
 	{ .compatible = "qcom,sm8550-mpss-pas", .data = &sm8550_mpss_resource},
+	{ .compatible = "qcom,sm8650-adsp-pas", .data = &sm8550_adsp_resource},
+	{ .compatible = "qcom,sm8650-cdsp-pas", .data = &sm8650_cdsp_resource},
+	{ .compatible = "qcom,sm8650-mpss-pas", .data = &sm8650_mpss_resource},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, adsp_of_match);

-- 
2.34.1


