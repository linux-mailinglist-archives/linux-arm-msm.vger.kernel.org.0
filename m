Return-Path: <linux-arm-msm+bounces-23668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A2F912FF8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 00:04:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A47D3B25E80
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 22:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B398217C7A2;
	Fri, 21 Jun 2024 22:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KMp9OLy+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35B315FA65
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 22:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719007426; cv=none; b=TN4DnNB8M3SOm53QhBlxK5MRpHlwPDXdCGhI4Cvy/yJalDILFYQmjx6R6NFrWdlcI4Akc3RQihyUhkhnLFEW2tgXPqF98WSSHYj5MMElnzYz/5stdTdqhGAsxYoyxGUWMghZgpjA7R3ofg+oECj+4d+4E2yYaFj9ZYLjP+yWgjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719007426; c=relaxed/simple;
	bh=FifuhQpA4gwrqO48kEIWeIajVtyR909/MrtlwHN7McY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TUyh5Z7UWjKV+fxoIpbCsGvGyqqXOYNbl0drOt40lYaYeiZVhMwe8ROiNHJFQqgVRrHvIV+NaIiz9sC2Em/lMdzNRVV4OkvO67NS3o/SpPTcL1DJJAfNaRqc2Yjxlj1v1yUkrt8UrLiw1yIVIVcOFAo0RYk8c2H8kbKvks1ZCJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KMp9OLy+; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ec1e5505abso29368581fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 15:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719007422; x=1719612222; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7egcWrhV+dk1Ypm66YmWxSQnqkx2DvN70ZKwPUWO6+I=;
        b=KMp9OLy+RuKYOpjegErCni8gE/pqbEPHVi9cltO49mMWS87f1o6yggv3D1WARPtZXW
         kpYRx1RCYbHJfvPLAfZzv0lo9GP32YQ5xJRK28WnIfCdbs+mSTJ2bAhaz4sTK5QH4YPT
         m6XcngV18+klixspw49LMenFax3OneBZW8eBkRm/0xBfkojVlfiobkpybkfInaemcEGQ
         xMvywsdHKrrC0cdStw1wCln6AL12e4DeE56eMnjZ7MUUk4DrhJB7khg6k3BrlBjm/MI3
         /BgAmR0U88DOX8gVCwY6EP7Tfb1Mfjjh1CWYnYdwYUHTsITTk7TY8yGBkzsW7em+viU7
         HUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719007422; x=1719612222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7egcWrhV+dk1Ypm66YmWxSQnqkx2DvN70ZKwPUWO6+I=;
        b=iONzGT7mRdCiV0KdjGz1TF1JoXcpbgGntIkuKV88sasfiyk6OSacQ6PR7xxbpWTuBa
         8UmtPifMlBILvp3D+l3FJpaFrtBr95nGm7yNETUe50NHD+fpDCPnhoklgBrbu7/Ee9ui
         DkqxCbqIpLTE8KTI7kwECBWpPpQV8jKBHiUp6zXSzZLtESxlb7M0ikjYyFOwOGncX7B+
         PdtvLiedn8+ELZOQqYdPOy7rwu/PS3/KUuCQxrmFcgB2g69Vy7WjDltOHCj8TeGdcfLG
         r5hqasA3WLyhECAKuwaA5lFhXxZGz0zoXQr9G8hC+sfUp7f9Jv1Tc1/JAzuSfRv2oGi6
         jllA==
X-Gm-Message-State: AOJu0Yy/OdOVZrxMcjzNyocQPTidXOZbapzXZR21Ywsh2oGmwO47LouY
	ub21QcSA+gzyKXZEbU3D8Lo63Wz8ZA5LMuIoDGy3iQ8Cy9iW60dKFP5hPI+YDS4=
X-Google-Smtp-Source: AGHT+IEBks3RjQrD6gtS4n3GRAmp+VFt6UQzrqQSr6CFeF38C6qDDaPHIVQ1D5MspIDrQs4tNB+82g==
X-Received: by 2002:ac2:5f4d:0:b0:52c:ad70:6feb with SMTP id 2adb3069b0e04-52cdcdfdc1dmr214052e87.20.1719007422103;
        Fri, 21 Jun 2024 15:03:42 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd6431fcdsm318293e87.210.2024.06.21.15.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 15:03:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 22 Jun 2024 01:03:40 +0300
Subject: [PATCH v9 1/5] soc: qcom: pdr: protect locator_addr with the main
 mutex
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240622-qcom-pd-mapper-v9-1-a84ee3591c8e@linaro.org>
References: <20240622-qcom-pd-mapper-v9-0-a84ee3591c8e@linaro.org>
In-Reply-To: <20240622-qcom-pd-mapper-v9-0-a84ee3591c8e@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Xilin Wu <wuxilin123@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Steev Klimaszewski <steev@kali.org>, 
 Alexey Minnekhanov <alexeymin@postmarketos.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2106;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=FifuhQpA4gwrqO48kEIWeIajVtyR909/MrtlwHN7McY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmdfi82QWt38kfLNo5oBOjCimFzNB1z4noUP7Ao
 wsMsSQ5hfGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnX4vAAKCRCLPIo+Aiko
 1YfJB/945EgnEaJ95AGsDG1DQZGjmhIQU655eEn5XkJ4ebG2Wyap7ctd9CAzZHW83c/3KGyhODC
 DOU/p14UNSrdoa+1jZhmFnQpxmpeJmAHquz4BWz5wELaeZpU1t7CadiDI/kw3sBsu0MyrVMRJFQ
 Ri6AmUwhOjNaOuY6EqyU80NayMn7GU78/oYGnVvo4Y5S+UJk80s5tMt5hrdm99LooJRmtiGvFVo
 lTOfU6L6B5rvhICzZxw5876cyzOA8IqEmyhYVasegqnHAVmqGtQkpQa26hLiw3Hc49p7cc+4T+G
 rctRE3Oy64kkwCkmgtCef1XBYSDUKooxKY5qEEouWkOm1QE1
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

If the service locator server is restarted fast enough, the PDR can
rewrite locator_addr fields concurrently. Protect them by placing
modification of those fields under the main pdr->lock.

Fixes: fbe639b44a82 ("soc: qcom: Introduce Protection Domain Restart helpers")
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Steev Klimaszewski <steev@kali.org>
Tested-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/pdr_interface.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
index a1b6a4081dea..76a62c2ecc58 100644
--- a/drivers/soc/qcom/pdr_interface.c
+++ b/drivers/soc/qcom/pdr_interface.c
@@ -76,12 +76,12 @@ static int pdr_locator_new_server(struct qmi_handle *qmi,
 					      locator_hdl);
 	struct pdr_service *pds;
 
+	mutex_lock(&pdr->lock);
 	/* Create a local client port for QMI communication */
 	pdr->locator_addr.sq_family = AF_QIPCRTR;
 	pdr->locator_addr.sq_node = svc->node;
 	pdr->locator_addr.sq_port = svc->port;
 
-	mutex_lock(&pdr->lock);
 	pdr->locator_init_complete = true;
 	mutex_unlock(&pdr->lock);
 
@@ -104,10 +104,10 @@ static void pdr_locator_del_server(struct qmi_handle *qmi,
 
 	mutex_lock(&pdr->lock);
 	pdr->locator_init_complete = false;
-	mutex_unlock(&pdr->lock);
 
 	pdr->locator_addr.sq_node = 0;
 	pdr->locator_addr.sq_port = 0;
+	mutex_unlock(&pdr->lock);
 }
 
 static const struct qmi_ops pdr_locator_ops = {
@@ -365,12 +365,14 @@ static int pdr_get_domain_list(struct servreg_get_domain_list_req *req,
 	if (ret < 0)
 		return ret;
 
+	mutex_lock(&pdr->lock);
 	ret = qmi_send_request(&pdr->locator_hdl,
 			       &pdr->locator_addr,
 			       &txn, SERVREG_GET_DOMAIN_LIST_REQ,
 			       SERVREG_GET_DOMAIN_LIST_REQ_MAX_LEN,
 			       servreg_get_domain_list_req_ei,
 			       req);
+	mutex_unlock(&pdr->lock);
 	if (ret < 0) {
 		qmi_txn_cancel(&txn);
 		return ret;

-- 
2.39.2


