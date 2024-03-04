Return-Path: <linux-arm-msm+bounces-13273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 675918707E5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 18:03:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E83FA1F235E0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 17:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B334D5C90B;
	Mon,  4 Mar 2024 17:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P/KqxpuC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C691A5F578
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Mar 2024 17:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709571823; cv=none; b=dHgoYndeuB9nnB7W+eSeT7evGb1drluxkTzo7SXZpIDEW9zaAoYZl3HyYavjsKbzO/NBink7iMpXMMBi1Wml57rRamEVaGUPKSPJuVthlS4wVuPhkahIpDSONOYAnl3kOwsPhRpHYu+ZdS4RuHNouojP1pj7WElxZGJofdvPA4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709571823; c=relaxed/simple;
	bh=Xh0gZ9WF3aP9efQ6HyUzvGK+JWZ2KKrzlJ7fd7VE+0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pKEXVOcsyQyXLCz8SZn2knxjcj0aj5pU7c37cuTEhVw7pNF8XygZdbhX80AMcNtNx2nr7H1Ost4jNGQKCeikL00AIg0e9doKiC56ORmFmDWs/J0QPgJ7xa/UI7lW0YfCvMifU13NK1O7dq0KLVN8Q9RvJxy5Bp6mc7J54KDnxY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P/KqxpuC; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-512bde3d197so4626997e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Mar 2024 09:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709571820; x=1710176620; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wsp1Ea4EeJcsgjp/Lh6RtgNzm11Uer74kxKaSJqX+4E=;
        b=P/KqxpuCLI6rGp+gxeORtHSNbQO7juN+FqQ7ajY/AmrG1KtsASBTS0EWoVovIK9yvC
         qZ25g7Zex5J4I2wH0yo+xkfksqLxvCHbZ6ECj/rE494nLdjF1hIYy0w571UhKJix7aUW
         RcEmgQYXYc2hpexlEZOK3uZ4PnuaeI3c0ubdwyl7MyHqU6LeiMZVdmth23bcY2zeH/2T
         rm1v+Mh8sFTQkftUJwZJG9omVLEF+5kq3zxGMef8u2IXCm0UEcfxbKnto/FgMwTF6ckJ
         VAw6a2RZKmz1Qoe5ps4yEUHj4chzmfeuIJ5KaxF4oFhpXkGZEQUuSuQeRk238Q2Son8y
         a3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709571820; x=1710176620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wsp1Ea4EeJcsgjp/Lh6RtgNzm11Uer74kxKaSJqX+4E=;
        b=mjqHMntECXkCzB6wnQ8Yuzl652a2y6z+VrBe97RTBpdlJZuJumq7gdiaufYWMlW5Xe
         h4CkxKbwbgFe0Po/7ho1BJhKwAdr51GWAx2FcMw+T+iiA5w3Qn6Z0l6YyM75B8m7sBfu
         25Ymv2OBArEI7gRyZp7iPX3CZQEOo5nWgnhshGI308mpj77Fn2cQ0Ru9/X2avI6Fcv5R
         /8tsPf9cVhqPzcxmuD9coS0Z63YJJH5wNMrebOtIGRINzi+N6PW96smmkBGLfeKHreRZ
         ZV/8m708QCZir4559VzvWcrCAkmtfNpI1kiiODeQ0rU78+U4vonITjjlEDfFp2MOnD/p
         XUbQ==
X-Gm-Message-State: AOJu0YzUdjZgl39Tr/v7OnvP/CbVoTda/jnXYcdYNsqAOBXkmrHX0TTg
	ZLaK5K5OIY0VPfp9NLtSHkKWfdk0KvhWBi0f33e/ZrTgGhTakIghw2e7Yf63Zfc=
X-Google-Smtp-Source: AGHT+IHLH4J4DbCy1MaXA0j9vEEZWrlob/4ABYzYo0xQMdTXRqyAm9RuKyIgLlfUU3bWQtHuYBCaoQ==
X-Received: by 2002:ac2:55bc:0:b0:512:bb33:2eab with SMTP id y28-20020ac255bc000000b00512bb332eabmr6034693lfg.58.1709571819989;
        Mon, 04 Mar 2024 09:03:39 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi. [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id dx12-20020a0565122c0c00b005132441e07fsm1809151lfb.0.2024.03.04.09.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 09:03:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 04 Mar 2024 19:03:34 +0200
Subject: [PATCH RFC v3 4/7] remoteproc: qcom: pas: correct data indentation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240304-qcom-pd-mapper-v3-4-6858fa1ac1c8@linaro.org>
References: <20240304-qcom-pd-mapper-v3-0-6858fa1ac1c8@linaro.org>
In-Reply-To: <20240304-qcom-pd-mapper-v3-0-6858fa1ac1c8@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4258;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Xh0gZ9WF3aP9efQ6HyUzvGK+JWZ2KKrzlJ7fd7VE+0U=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl5f7mr5ZKNzAfac065o/ichcZLZl6L9gqAqkZO
 BHY2ULIqLaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZeX+5gAKCRCLPIo+Aiko
 1eCUCACKvHnDnLsd+MDctgVIzm4a4e38QYtIwtj7r2m2wzLR77H/ofyR0PmxuTVE3MSkDwaTXEO
 kF3M2V7cC29IBIr7bCUr0ic/S1a3+CRRRLba5PLxq9WUnA423KbTmpXk4epvydKwJZ14C9tpexT
 6MLNgpFv4lBj29xBPc7JJRS5yOBWG8shqcMR8Loc6xM6LY2VGZEeLu5IkMxsIsApDwI4v/XZkBy
 mW4/T08uDqtagRFdSI6OdoAhjbrTvXfQL46WSEZbRldWlINGVbvWJEmERi3/OxJeN+oIRmE61mP
 vCDe587v06M6VaJTuzsEJcLK5f4dAmCydL0ejbSTqj7UBRr1
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Correct indentation of several struct adsp_data instances to always use
a single TAB character instead of two.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 124 ++++++++++++++++++-------------------
 1 file changed, 62 insertions(+), 62 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index d0b1f0f38347..3235249d703d 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -807,24 +807,24 @@ static void adsp_remove(struct platform_device *pdev)
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
@@ -859,18 +859,18 @@ static const struct adsp_data sm6375_mpss_resource = {
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
@@ -906,17 +906,17 @@ static const struct adsp_data sm8350_adsp_resource = {
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
@@ -1063,33 +1063,33 @@ static const struct adsp_data sc8180x_mpss_resource = {
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


