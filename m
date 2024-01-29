Return-Path: <linux-arm-msm+bounces-8863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F7684071E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 14:35:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48988B24A8F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 13:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0349565BAF;
	Mon, 29 Jan 2024 13:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mBZK8l5W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9150657B2
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 13:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706535298; cv=none; b=OXyy/TbDjMf40ZjYD7aSz0CNDvFEsijhuz9hitdW/mNKPWYbuk1/137h0PsTLEwhI7dJwMQY8lY0FRyxYmuI7MAJ87R2v3MMQSPEkvvht5VJtuMneRQgQmgXaB2tkP6Yj76MDcwjPfkFa5qB/JIOtFXd3T4pkcnvN2jaP4n0TVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706535298; c=relaxed/simple;
	bh=7XEGX8tCobeF3TWbs26SkgzjQRQagB5DicUZQZndEAY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q4YYzuQVI6pd//mh7uv6xFp4tpFTNbjbQTgk6KMLuLyTUah9Sf9bb/pB0MpHDVnbAs1pGt/4opP4v5dYzQup8bW7oxJuT0Tk4RjsSySj6l07ocC3n+N2zO9rz7o1CM+G0zjO+bbBVThGLiBIM99YLW2I6oo+yFkKMa61KJcHf8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mBZK8l5W; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a3122b70439so365735166b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 05:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706535295; x=1707140095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xXZFqpcx+yqKfOAXpJEod2Uxg4c+ixzxqWhb+cY1h8Y=;
        b=mBZK8l5WHdwNGGDRKq6wvzQnB/T9vVNeTYM4DsT8nBOsobyRA5/Tn82Tb3Lgj/9r1/
         qb7qDmv2l2aI0wzMLRxhWpgoc585O+zayMINaLh8un/PNg5FlRBxIRcsz8Oal5kMsIk/
         s+dcjptQqQUG1G3lSyA2ce5P/DkCb1ffXl9pyqb/o1uf9c+VjX3f/sUl5i6AxDgtXbQt
         gM6MoUl2pEbuBtyjdAOatFBbynpP/VOBI+/NUMS8PX16GuTT0POA5tx/kGXAdKrWVpen
         LOSWZCpGXw8s8RLVQEzGShwy9H5ePlArYDjuxMG77HHCCDQyASfQX66xojIjuXHMbb6M
         uZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706535295; x=1707140095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xXZFqpcx+yqKfOAXpJEod2Uxg4c+ixzxqWhb+cY1h8Y=;
        b=h+NaYslSIWIx2xhH6UmjMCAwrMUcGlwTb1HbsTmkhfruTFwUetw0xhg06xsEBmukNX
         El/UQkhY2oWR5FshvTDjghK6bJIwytXwThlD3zEIhZgX/ByBs4XtjsevMZELS6r5SzH5
         LV+wIWzolPUenpbdZ+mstKOoZmrlnZhao0e+5I1ylP2+RpzP/prjgXNcaZULQuBXwuD/
         Ap1yHE4YXRRzDzdA0RlypE9AXBovrs2R7U1CPu3liB2GC9l8KO6grwcUhLoAp50zUBqp
         fSrknw0Nb6oG4dEeZIzwNahaFYR9wrGBvGXyrUawsDqcWAMn5MRsHP3lqiNWCJ2PaLh4
         Jyuw==
X-Gm-Message-State: AOJu0YxPsuaGZAfSOtBJ02JphoaypUp5IQd7WugPhzd182v04FP/WR68
	DCk9H1IDWwXM5054OCx8igAEkjkWQVuASRkr2sHxZnbWXY0aAcoT4EyXGDzK2Tg=
X-Google-Smtp-Source: AGHT+IHCFlT0NaicOgyWXFvdhxw1y4Dq6pYq28XJTkenjH+aNzp1/O+NJ3vGuzbpV29JtOx0Uln79g==
X-Received: by 2002:a17:906:248d:b0:a2d:a6a7:b3bc with SMTP id e13-20020a170906248d00b00a2da6a7b3bcmr4409221ejb.4.1706535295144;
        Mon, 29 Jan 2024 05:34:55 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id vi1-20020a170907d40100b00a2f48a43c3esm3911483ejc.7.2024.01.29.05.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 05:34:54 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 29 Jan 2024 15:34:39 +0200
Subject: [PATCH 3/3] remoteproc: qcom_q6v5_pas: Unload lite firmware on
 ADSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240129-x1e80100-remoteproc-v1-3-15d21ef58a4b@linaro.org>
References: <20240129-x1e80100-remoteproc-v1-0-15d21ef58a4b@linaro.org>
In-Reply-To: <20240129-x1e80100-remoteproc-v1-0-15d21ef58a4b@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2175; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=DYmaa/61P4GaXID7Xccu2X68XxOqzoecSVlwWNbm4oQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlt6l5CPj0vbamh6iXLeZP8wUB2GwT1lbw005/L
 ExfUy5EK/GJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZbepeQAKCRAbX0TJAJUV
 Vk4dD/4pyJzUu6T1+dFDIrMr5yX8AxeC5PxCSxSS82hGVyIGL0+orImNWHgf8Mso62DjkvCxf04
 AKRN9an+loItW0pAklTRZmz6VynBGbQkvh0r9sbDggpkfFh77Oqnze5qnSBpibmew/wxA+ff0Z+
 QEk224GPexwy8asTTfibFzYRbikTjHvkf/vr0Jrb460tKv3PHw05Po0kFHh85vcI5bNpHK7UFxb
 VlQ1uwTocE7bTjd1nG85YJH9DcSl5gjN3XYZsyxB4o53PSgpshHb5QbkIVX0ufjdhgv+ipUQJZA
 CfL4uXyeBq/DDYbuWF41/a8yMRdj2CUbks1hSHeAOQeniVUv2l6g8bsZRkMO/omt2yJTxHx0H8H
 8jDx/rTgqBIdaIdpX9KhTJ1+tqlMZq2R4M0G6Bfa5Dytr42K/H4ZhcP/m6TTLhFcvNJt0O/kvOH
 uDlc9muh7K4XPHDN+UrPNIvozaCW8mAMKa1VM3QQndA7u/jtaOpYPZHk6e1SFAo7DzcWYACike3
 yw3DG0puF5gooNXTqtaAcziqQ6rsSXWPsvfqiGCGoRic4LWtMlJUL49C3+PfM6TgbdDxWrEFxZE
 gjtOedzLuSCP1kwMfUvRoQ2xaLTXF41gtCORvoxgh8MAUrgY3oK4Qv/4rQLCiYksHbFUbxILOzo
 G1afL4wVwYrGHhg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

From: Sibi Sankar <quic_sibis@quicinc.com>

The UEFI loads a lite variant of the ADSP firmware to support charging
use cases. The kernel needs to unload and reload it with the firmware
that has full feature support for audio. This patch arbitarily shutsdown
the lite firmware before loading the full firmware.

Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 083d71f80e5c..4f6940368eb4 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -39,6 +39,7 @@ struct adsp_data {
 	const char *dtb_firmware_name;
 	int pas_id;
 	int dtb_pas_id;
+	int lite_pas_id;
 	unsigned int minidump_id;
 	bool auto_boot;
 	bool decrypt_shutdown;
@@ -72,6 +73,7 @@ struct qcom_adsp {
 	const char *dtb_firmware_name;
 	int pas_id;
 	int dtb_pas_id;
+	int lite_pas_id;
 	unsigned int minidump_id;
 	int crash_reason_smem;
 	bool decrypt_shutdown;
@@ -210,6 +212,10 @@ static int adsp_load(struct rproc *rproc, const struct firmware *fw)
 	/* Store firmware handle to be used in adsp_start() */
 	adsp->firmware = fw;
 
+	/* WIP: Shutdown the ADSP if it's running a lite version of the firmware*/
+	if (adsp->lite_pas_id)
+		ret = qcom_scm_pas_shutdown(adsp->lite_pas_id);
+
 	if (adsp->dtb_pas_id) {
 		ret = request_firmware(&adsp->dtb_firmware, adsp->dtb_firmware_name, adsp->dev);
 		if (ret) {
@@ -693,6 +699,7 @@ static int adsp_probe(struct platform_device *pdev)
 	adsp->rproc = rproc;
 	adsp->minidump_id = desc->minidump_id;
 	adsp->pas_id = desc->pas_id;
+	adsp->lite_pas_id = desc->lite_pas_id;
 	adsp->info_name = desc->sysmon_name;
 	adsp->decrypt_shutdown = desc->decrypt_shutdown;
 	adsp->region_assign_idx = desc->region_assign_idx;
@@ -990,6 +997,7 @@ static const struct adsp_data x1e80100_adsp_resource = {
 	.dtb_firmware_name = "adsp_dtb.mdt",
 	.pas_id = 1,
 	.dtb_pas_id = 0x24,
+	.lite_pas_id = 0x1f,
 	.minidump_id = 5,
 	.auto_boot = true,
 	.proxy_pd_names = (char*[]){

-- 
2.34.1


