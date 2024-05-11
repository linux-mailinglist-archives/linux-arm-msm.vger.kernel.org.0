Return-Path: <linux-arm-msm+bounces-19738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE4A8C33EF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 May 2024 23:56:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A2081F21AB1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 May 2024 21:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B2E22E85A;
	Sat, 11 May 2024 21:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EcYHDkEt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337DD225DD
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 May 2024 21:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715464569; cv=none; b=H6M80YNzT9lHS76mpY0/Uvo26cD8KQVQW3QBRGFBO0y1bZFxPl0kvxKFUByKWUmfl+PeJXaiZXHdg5rexMk99PuYPqETLxhAer1Qnn7qbjKdO+WUg6FRT6GjgQgTE5z2PhXCKmt5kCoyd5vGZrq/oXrmg53+K1AIeBwNTZlLPzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715464569; c=relaxed/simple;
	bh=FLQqiz970rteoetcXI9wfyGsl7GwhOXGLVQNI0mqKnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R4pQg0+aFyub2UoDDokMCDHyrENCvtYuNYYYbBiGnELookflfgHX99jqzKzlDO3bI4J899z/ejaMa/34ApnHZHeG2SoxgvPgMsoMqiJopcwVVaXVSzq81NEBPZ4qHI/xir55a0vj5qSHSCYf2kYvHlrqsJYJ1W/5NVazMgiF0Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EcYHDkEt; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-51f3761c96aso3686183e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 May 2024 14:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715464566; x=1716069366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wqr7b0cvICY+YwiguckW3UOvqfC3+cDLfaYmZpmVxAk=;
        b=EcYHDkEt5OLCOJBTM5z6uuEtfVU+nX9yFa45oTcdLMQ1CZw3fccePE7LN3H0QOB5Id
         Pp2rcGWMCfM7VuFuVrN7gJWTZ0/gWuDOGfOE1BP9pw9Z2MtR6JIsk4flgO/BvobxtgKs
         cFqN0g4pdY5GjYiLagL03BGiQtTqMJ0taOge2vhIPJvrSEgl83AuF4li8WSx/St8S9Ji
         +6zymA6kKAkyExSaGfrea5Pkxk2LOGrZDJ5aj0Froa+fcjwGfzKWNl8kjfserrh+LQQC
         GCNkcMqD/fYGvtX4qYpida/p25RHmiPj+haUJw7vpyq+5nsoyz932rZfBrJu72hcecP+
         5CEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715464566; x=1716069366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wqr7b0cvICY+YwiguckW3UOvqfC3+cDLfaYmZpmVxAk=;
        b=tQ4dySvvLvV7era67zVhKVvk9j7Tz+JdFuAYLhbXMVY1tGDHfp7yeToCJ6MMsWWU4c
         VZXjnR84L1L5e5tsYVyqp9Qol7KPflEZtjNexgRbe7NsPZAXClhQlTOfSQ/z+awBK2IU
         9C8jVamlRev8VLLYYqlJf0ZmgBTTMQ81ePIc+0RJkB2eT7YgkvHYnWT5usUNRAuq7ytm
         bjbD5v7q6fRKBzEdVMGF06VYzSi8uZASCREVoO6qIPr4Z9yG8jiHmEOPDzwevtLLfeWF
         vmArvfwdgXTUK3wAPYNg+D0It/OhoDrjHlSu7UJ6eiZGn7yP1q5yO78yTdjyn2OGyrVK
         PnpA==
X-Gm-Message-State: AOJu0YxemaQo4L/nPJCZxVn01ryzgCvNz1uqOeBFVl0FpD3qYWoCYAeD
	VFlYVrk5HERFnDeHfFIscnqNc0wyTnDRUR/fFTuPyHMp4VRTD+YMSjbHUbKQ7cY=
X-Google-Smtp-Source: AGHT+IEjnKQGauO8vEW6dzG9bhTeFVjbRPo4ku5FHJUmeiI3zB+x3D4iuAbYYHC+GNsp5Q6EWpqxPg==
X-Received: by 2002:a05:6512:34ca:b0:51f:51d9:942b with SMTP id 2adb3069b0e04-52210277c40mr4657441e87.60.1715464566306;
        Sat, 11 May 2024 14:56:06 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f39d31d1sm1127576e87.286.2024.05.11.14.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 May 2024 14:56:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 12 May 2024 00:56:03 +0300
Subject: [PATCH v8 1/5] soc: qcom: pdr: protect locator_addr with the main
 mutex
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240512-qcom-pd-mapper-v8-1-5ecbb276fcc0@linaro.org>
References: <20240512-qcom-pd-mapper-v8-0-5ecbb276fcc0@linaro.org>
In-Reply-To: <20240512-qcom-pd-mapper-v8-0-5ecbb276fcc0@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2716;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=FLQqiz970rteoetcXI9wfyGsl7GwhOXGLVQNI0mqKnY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmP+l0yvMYnml7WfyDb/lBV0JCxALmfAdIDe/O9
 xz26lW/AxGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZj/pdAAKCRCLPIo+Aiko
 1QGfCACKDsEFnShzG8nhtMP+BjStF6K3Olygwbb3Re9SOJpDwSll1f9HbCp0mCDV/jPEhcObcb0
 TY1TwkWBOodoO8yjLaXndN6zMkO1H6M69p8gu0R4DPQBywtyChKKQMkTdaFJ1boe9tasBpsugU7
 4WjqLMTV43qcEi096Os9IYRVyPWRxW8JEphJS3rg4FkTTIaDkwSTKqW25tApPRKV1A9PqWcwBG1
 iqPVJjUq/PKZRSxJ4F4BGycKl5X50JTHVeQzzIBiTy2LdobkpgY4GzWj7ipqxyEm0dt2IWemBVB
 CfalU6oDQN2Kt6Zn6VoWElVauqSklSiZYvbQsdNGmTdKkaAt
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
 drivers/soc/qcom/pdr_interface.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
index a1b6a4081dea..e014dd2d8ab3 100644
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
@@ -365,6 +365,7 @@ static int pdr_get_domain_list(struct servreg_get_domain_list_req *req,
 	if (ret < 0)
 		return ret;
 
+	mutex_lock(&pdr->lock);
 	ret = qmi_send_request(&pdr->locator_hdl,
 			       &pdr->locator_addr,
 			       &txn, SERVREG_GET_DOMAIN_LIST_REQ,
@@ -373,15 +374,16 @@ static int pdr_get_domain_list(struct servreg_get_domain_list_req *req,
 			       req);
 	if (ret < 0) {
 		qmi_txn_cancel(&txn);
-		return ret;
+		goto err_unlock;
 	}
 
 	ret = qmi_txn_wait(&txn, 5 * HZ);
 	if (ret < 0) {
 		pr_err("PDR: %s get domain list txn wait failed: %d\n",
 		       req->service_name, ret);
-		return ret;
+		goto err_unlock;
 	}
+	mutex_unlock(&pdr->lock);
 
 	if (resp->resp.result != QMI_RESULT_SUCCESS_V01) {
 		pr_err("PDR: %s get domain list failed: 0x%x\n",
@@ -390,6 +392,11 @@ static int pdr_get_domain_list(struct servreg_get_domain_list_req *req,
 	}
 
 	return 0;
+
+err_unlock:
+	mutex_unlock(&pdr->lock);
+
+	return ret;
 }
 
 static int pdr_locate_service(struct pdr_handle *pdr, struct pdr_service *pds)

-- 
2.39.2


