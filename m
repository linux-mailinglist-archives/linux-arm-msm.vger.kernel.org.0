Return-Path: <linux-arm-msm+bounces-10704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C372851A99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 18:03:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5B341F26FA7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 17:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F1943F8C0;
	Mon, 12 Feb 2024 17:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FwL0T5Pq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899F33D963
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 17:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707757379; cv=none; b=FiWJB+S+MLhaMxbwsrDU+9RUA8qarqiMrcFjpkY/Rk+CD0BDIUOTvjutc6hJQvQjAqdpoJRAk904BK2gR+L3ep54NWOsBbbUE4/7AKClrQCUVvsEx7COhKnTDBIB2tN/fS2dOinPLoRnZE6juSiZ8F1HYh/HnpUUVGuQnJdRMJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707757379; c=relaxed/simple;
	bh=EKESDVvXWYu6uCMu5hdrdB9UUsATkMSXlhAix1vAuhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JciVzgbx2Qba1AXWaNVnWi18vlNuvcBnfS5fc4laX7Gpu3g4o3jIb/4W5cpcecMabTrrJZ4ECklNXa4IYaZ6bbnWsA0iQxxROO/RW/cUenSm8osRishidP/af9RIqV+TGeCRY6yitKFJB781FP7rACsc+mVAfBBcn3Q2pNfV4lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FwL0T5Pq; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a26ed1e05c7so463617766b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 09:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707757376; x=1708362176; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rjCn+gZPOrTbl0ucLTpGe/LR+NcWFo/Oy2/3QGB2w4c=;
        b=FwL0T5PqSV+qum8WhW6DY/mgCQ/YwIEK+jR5VdYVgWbpTYzFPugsmcNnpP0JjR8IaU
         MrY7zbQxJUaSc/oj1ujw1zT3MyLIHuxCU52VREsaDiEntu5N3Bgxef2NhAJlR9Ijrrst
         PN4ei5/xhmTVj8epHxg3uB7GoWG3sNM+mM6uuLaI2s0PWDsV36lWvhEAq8VyGOhLhfpj
         QbElz9QSgUrJP5M1/f1W2Aq+X3pi2qvkTte0rwTZAvBb5SntUVF7JGpkFj7fFJEvDHXk
         2a9SkWyu4639qOfcno5d40eTyGTJodzWN/IU5/Fj/h5Q+9Q4ybTV8dZYXSLM+Pb2z7iB
         bgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707757376; x=1708362176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rjCn+gZPOrTbl0ucLTpGe/LR+NcWFo/Oy2/3QGB2w4c=;
        b=utUFey+kGT1tzqXHClVi97hII72swsVZKjBfcJY3FbA6DQFO/GpjC1SPJ7V46U0RJF
         UBNYReMJJ10lB+NIp359nWQqK5+FywoDeZOy0RfkkiXtM8f4/Wp1OdLN9y0ckWr3td7L
         1Gwrej3Bg5io5+U6j8O+Mtf1r83oAik99m+MmwHAgZIonV4ecwWe3NIsELMWmLHyo3hV
         ZFbO1jiskqkXAZO2vFpNogvGMsH5MRGE07RrNM9c76zN70siasoTtN2l0RkPFv8BNEZL
         2CdjsrW/y6unVyQ5kraohZJxfg/qMSUBMOwLBMBO8rdCOwGyqsceo8wwggpwCHPdE5Q8
         y4oA==
X-Gm-Message-State: AOJu0Yz/Z6kDqVscnfRnuYTZ3n4KUbDqGHg3N9EPPfoelEW1tLUsZSdf
	G7nqUI0C2qfl2a+XgdcRDZCHjiIAmRfYt5ohRedC45CGcxTaJ9PteW6MELVL0ik=
X-Google-Smtp-Source: AGHT+IHFpeVDhl+f7y3VTqBXFdJVDHPVaYeGa18+K07i7uy2ctKDECxvCCVMXfZjThKJ9fgYLf2HpA==
X-Received: by 2002:a17:906:b7d8:b0:a3c:932a:a002 with SMTP id fy24-20020a170906b7d800b00a3c932aa002mr2532777ejb.43.1707757375681;
        Mon, 12 Feb 2024 09:02:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWdvYRca3FGaoDnbytcnQdL31hpDDeYGF0dF0/NJTRGC3YqzljFRBbMc0KEGO9ttLf19IErTWFSLz28ds7EQ+xbZgy0PRZRMVlh+K7hKGDi/Oq9G45Gft+iL/ihaTKByjo3bg2ZQ4UBsrcyWj+lgau2F1UC8lm54qVwWHYJzID8uhmmAjuv+YXdpiBFit13wE+gF5d6K+MmcK5pKllNRJQ5wExJ1jxKXI8n1buBNyGRkhMrady/36xc7lYEReEA5/f1RK18xGIeZZNlTviEjxbpWF5w1Rpi941UuH8Sr5wzrM+wqlMBPQtHsxwd1DNlHxYe21RkXMO26wBqkDL6ysx2xz3kPkWBIP+8zmaw/4A9yPzbyHkQqI2jLK/caZHdbe2HTiv8fRDpjgl5H4uakfdxvCEFt/5UzifGtZqoHPF7tanHUX1f7FCoE8t+RwFAQVN0nuRMSyAMJp2XQVmUXMtMeG+XPHAJSJ+g7RhX9ooNpHL2c1D8EBGP+AQWSnOV70GjTTH3/dnrEqM7
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id h23-20020a170906261700b00a3c9951edf1sm379600ejc.115.2024.02.12.09.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 09:02:55 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 12 Feb 2024 19:02:43 +0200
Subject: [PATCH v2 2/3] remoteproc: qcom_q6v5_pas: Add support for X1E80100
 ADSP/CDSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240212-x1e80100-remoteproc-v2-2-604614367f38@linaro.org>
References: <20240212-x1e80100-remoteproc-v2-0-604614367f38@linaro.org>
In-Reply-To: <20240212-x1e80100-remoteproc-v2-0-604614367f38@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2160; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=2WGVTfBXt1ZBHFcYk5Qb0wU5DJ+35rlYRVDBLPba5ZI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlyk85l/QPHm8fvsQOV7sAno4c3Y8YmPL2xBOvB
 6ZZIM50/O6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZcpPOQAKCRAbX0TJAJUV
 Vo2cD/oDmo0Im9UuNSajSItRRL42mc0hdFHcRiMXYFWizAIIY2Jg1phMcKnJhaaaVd+oE/7Pd0u
 Mtv4tPGKCRhyk+S0s95MlJ/jQuH1ghE7rDZ+TY2djfSWX9q//bt+Naf2TQn9K9VjD/YmrRVRDTE
 nLtUw3x2Pl3uRwwXNEcOqVwN8af6rYxrB75vwwiO7sMiAcKzekKRPssD1q/fu+fPXJ89hQN6k8X
 Ke96bMQVn7DpiPPPZEx1OYym8dMPZ9ZPGvnOfhvBg1As6b1K+k89IM0ghbl8oMQEOlIT7JFyRAK
 qB68vfdOWOxjNygd3JD6MhMETaXoGr9ZnfypQUOFPUzBs/4QmspkZFtIPiyfgkVSf+Esv7XIqV5
 q/T8rlJX22bpu1iDh8cn5xj2ymUZ+hXjfLGP7POq84LAU8+mew+uLt24Je85E+X1OEayChhGKio
 oU8D1zcqdxpg16iPhnVunUcK5Lca5udBgqL5x+bQSzJiAt/5u3dMEBMBYGGvz0suOhwZTIeEvLw
 FOtKssCe+AVTT7Qw+t2IR8fRQJfLyMGGDoMEBi+xb9gMx7OUhB73212uwAIb+QPIO71UsZrEInV
 bY2yjHhi0O3erRug6JBMV4FHBk7sg3cEA0IOV6kE1QUs8OPMNxM/+rI8FOsuIPqbodmN3B7rGlz
 J4Kuni/kTOs2Pww==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

From: Sibi Sankar <quic_sibis@quicinc.com>

Add support for PIL loading on ADSP and CDSP on X1E80100 SoCs.

Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 41 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index d0b1f0f38347..117fdfdfbc26 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1014,6 +1014,45 @@ static const struct adsp_data sc8280xp_nsp1_resource = {
 	.ssctl_id = 0x20,
 };
 
+static const struct adsp_data x1e80100_adsp_resource = {
+	.crash_reason_smem = 423,
+	.firmware_name = "adsp.mdt",
+	.dtb_firmware_name = "adsp_dtb.mdt",
+	.pas_id = 1,
+	.dtb_pas_id = 0x24,
+	.minidump_id = 5,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"lcx",
+		"lmx",
+		NULL
+	},
+	.load_state = "adsp",
+	.ssr_name = "lpass",
+	.sysmon_name = "adsp",
+	.ssctl_id = 0x14,
+};
+
+static const struct adsp_data x1e80100_cdsp_resource = {
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
+};
+
 static const struct adsp_data sm8350_cdsp_resource = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mdt",
@@ -1318,6 +1357,8 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sm8650-adsp-pas", .data = &sm8550_adsp_resource},
 	{ .compatible = "qcom,sm8650-cdsp-pas", .data = &sm8650_cdsp_resource},
 	{ .compatible = "qcom,sm8650-mpss-pas", .data = &sm8650_mpss_resource},
+	{ .compatible = "qcom,x1e80100-adsp-pas", .data = &x1e80100_adsp_resource},
+	{ .compatible = "qcom,x1e80100-cdsp-pas", .data = &x1e80100_cdsp_resource},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, adsp_of_match);

-- 
2.34.1


