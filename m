Return-Path: <linux-arm-msm+bounces-13270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E2F8707F2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 18:04:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57988B23B3C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 17:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2412C5FBBE;
	Mon,  4 Mar 2024 17:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R1Sgn3mG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400015D46B
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Mar 2024 17:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709571821; cv=none; b=WsSuQdjnbHJYcWufS+cVgRT/5aWXLMZ0ngUcetWytdGNTmVwNMWMhwTH5dyNKNuyYb3T3Av4aY+aMSwHxU7fNhoIhnmTn4iKS2moMs9dy20E3MIYMlu7T2l9sJzhXD4Jq0XuvjVXnsc6ZVBHYHzulxyQ4sDqEQX5pYU8S7fXOuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709571821; c=relaxed/simple;
	bh=Yvr55imNsVDZtCUiDXnycqIHGG7y4xl4lh0mVlDLWII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LGut4ZNjfuTk0H+yNnFGll/MTwTuPy3gOcIYLTEr2xPLDXwrNWB1rHTb4d7SK7KN/gBAIsT1G0JSY4emXA2c4JqMUFef/oIrgXq7r8aCYUG3hewS0W4R+gvH9uUHv8O+nT58gGGCJJ75d/sks/uEnWB9aGBySxV5vXzqh21BI14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R1Sgn3mG; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-513298d6859so4395105e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Mar 2024 09:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709571817; x=1710176617; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BDtCv3rciFHV66pbjS4lehN/siYq37duyWooEjJyENA=;
        b=R1Sgn3mGZYKsENMbQR7UGcSDR/RqR3rrlm1BIpfPMWP6wjty0cRhEfBCEZeAtEdmHB
         tKZgFaF4kF09KTC5kLhTO6ISxtRE7MJu214pIscb/FJoc2ijHzfA4rCncRieZ2KS4tAW
         pDDyPP8gVyQgymVdhKvfBB3fwrU79HUOKfxla9K+z35BYpz6JDT5WoF1mR/wUUQeM769
         s87mRUT7kg1leXmkSbtlLESxCJ3e9sZMeCQOfANvdYUKE7iUD+wtDXjytn7iW5wXRECZ
         2ULVhnktGk/jRHrInoESwuQSTQ/eZkbTXplfD7UjmCxlPliF+Q6WNrzx7Tx8Qj/0rTLx
         bAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709571817; x=1710176617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BDtCv3rciFHV66pbjS4lehN/siYq37duyWooEjJyENA=;
        b=DYxz0TgP4kDofYUoLjMDrK4EDqIHqExwHC38YvVoJhifCXJEx2AKy8KOBTfmyV+rth
         A2GYUrDNrRL2cdWXytVP5jbbL0sKf3CcQwB+IgIHKgk2anxpm5I2KOJvVmnvtWE7BfPF
         HgCUFmJtGTcDm7D2ZrKsESVw0kcnojqLM1tvj9ttOtZ1oDs9xCYttB+XwsqQiyxE2PFv
         TyBdFSJwq0vEpk1GRtGrBmohRlLarpCHLf+1EA7OaYfL4Sz3SEC25dQY9SVhGU2B9/en
         Q5I5+sOHrwnVLzybRFn1qoqUarraKPm4/oVt27VMn905JtZxlKQrzJScpEK74/mURrLt
         psbg==
X-Gm-Message-State: AOJu0YwUwjRAjkwy0kqOlj0lHZ+8sttvvCJ/U1VX1d1CZ6g6Bm6g/ZsD
	sLbXo2NPdPuV80uWtY6FKNWVw6E8noD82IKcZLYKN/Uvmdo5yQHMC/cho9tmhvE=
X-Google-Smtp-Source: AGHT+IGiqZlaT3pqHUTRJPIszF89NB3KoLIN/9u9UWwTYeJehS9R+ikii4EieWByi3oUfAKiLLtq4Q==
X-Received: by 2002:ac2:495b:0:b0:512:fe1f:b925 with SMTP id o27-20020ac2495b000000b00512fe1fb925mr5867947lfi.28.1709571817324;
        Mon, 04 Mar 2024 09:03:37 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi. [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id dx12-20020a0565122c0c00b005132441e07fsm1809151lfb.0.2024.03.04.09.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 09:03:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 04 Mar 2024 19:03:31 +0200
Subject: [PATCH RFC v3 1/7] soc: qcom: pdr: protect locator_addr with the
 main mutex
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240304-qcom-pd-mapper-v3-1-6858fa1ac1c8@linaro.org>
References: <20240304-qcom-pd-mapper-v3-0-6858fa1ac1c8@linaro.org>
In-Reply-To: <20240304-qcom-pd-mapper-v3-0-6858fa1ac1c8@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1963;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Yvr55imNsVDZtCUiDXnycqIHGG7y4xl4lh0mVlDLWII=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl5f7mVy1ymDIv56ea1V/FtH4F3ZQv8KH3RHPMm
 /ySobZ4cEmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZeX+5gAKCRCLPIo+Aiko
 1a1VB/9JJVCgaw6kvvhOrV7hYRcaUuYLhkGYaqThunTM8maOQQ5bd5ghvrAoWXeszgMnI1JJZfV
 qpgirl7Q6pHk6stjllIv3OIeMEp0xE1vWhBC+CMKh/6rir4EQfQ2+l9Xu/Cz4etYfF9w91m1za8
 PF6JfI8/8X+yeZBx2Kc7FC9eeKmYpShPa6U7whTHGSGYPgTLkjkDRf+WWaSMhRZHPv3ifp6CDSO
 Gg3nW+ctdtjspbSKqW7pAHxHfQWcruTFkdiLtM+6wwjdNeUGHnoSOkxkS6EG/gDIAJwCi7qox7P
 By/48kIyZPa/UMXLHq6sJhHxUQuf7gtYS3EtEP+bWxLEpWWT
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

If the service locator server is restarted fast enough, the PDR can
rewrite locator_addr fields concurrently. Protect them by placing
modification of those fields under the main pdr->lock.

Fixes: fbe639b44a82 ("soc: qcom: Introduce Protection Domain Restart helpers")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/pdr_interface.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
index a1b6a4081dea..7b5fdf9fd3d7 100644
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
@@ -133,11 +133,13 @@ static int pdr_register_listener(struct pdr_handle *pdr,
 	req.enable = enable;
 	strscpy(req.service_path, pds->service_path, sizeof(req.service_path));
 
+	mutex_lock(&pdr->lock);
 	ret = qmi_send_request(&pdr->notifier_hdl, &pds->addr,
 			       &txn, SERVREG_REGISTER_LISTENER_REQ,
 			       SERVREG_REGISTER_LISTENER_REQ_LEN,
 			       servreg_register_listener_req_ei,
 			       &req);
+	mutex_unlock(&pdr->lock);
 	if (ret < 0) {
 		qmi_txn_cancel(&txn);
 		return ret;

-- 
2.39.2


