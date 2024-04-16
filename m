Return-Path: <linux-arm-msm+bounces-17537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D628A60FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 04:22:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6AEE1F21E14
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 02:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81ED03C6A6;
	Tue, 16 Apr 2024 02:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A016eNl2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46D839ACC
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 02:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713234064; cv=none; b=r9AxsjK8fU9HThCVXwF4rwHpnuP7/WfZJHvWuaA3lH1Qzzuq7sJoSE3DVUBwo+380tLvXbYl7wK69GS3VIdzrapDtZoRBc02JcPUtdC6f8193n2BRfB2grN8eYjlGtllqwLZdghn+okXneeERq9FOTDLLwPMBPIkCL7Wrfq8ZtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713234064; c=relaxed/simple;
	bh=AfSx2w3/c0hCJlrKpU+5864hNOPEGMqvFqOcHBDjtXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f3kryP0ht2UoOsfF3vmuzw30Z0ZEfq9CwtgjE50D6PDO5mUQkS/xUCikKWuSSAlLPBd0nd+BAu/1M1N0TGjwbyMMZX16sOYaw02AA0Wwg92rkMaltBn8FkZLOisq7zEensv0j4h0IGW9zQKHYLQhUDcHdft+dGPb/2mjeiNRWZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A016eNl2; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-516d0161e13so4763775e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 19:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713234060; x=1713838860; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9V8cEgal1TbWwyBmW+Q6Q9L+VvqZVNAIU21myUFXfYc=;
        b=A016eNl224UmKON4ECEOPkNCnZZ9QgX0NtGgTaLpyL+G65Duh+aEY5sOimsgxPIUTl
         4VibizLFCiGAv810fYysB5y4Lg1B1ICpm0toq0U/Th02AgYu/6PRye8hOzvPBxp0Af3t
         5wuBeDeKHjT9gxApcp8i0mkBndUEP820e/EyAdn0dsIE+itjjNVCYmpj/pA4hWeY9x9s
         eG+mEbkZu0YSqjS9/IdrI6HUmHYOwKlFVLN74S7kVpgPdzt0xv2qu9LsXyWA3ZG8tRxu
         lDWiYovh/om5bXSWVr4p9yZdyGlBwQ97oPXd/AYm2nqLVyNI9kMeOvPdVI8YkoOO0sOc
         az6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713234060; x=1713838860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9V8cEgal1TbWwyBmW+Q6Q9L+VvqZVNAIU21myUFXfYc=;
        b=Mx4s8dZwHb7E9/ocuZJ+t0P1nNxJV/0cWuKLsC4GRxwzDvag14Qayu49scPqsTGLjD
         4zdVPWXVPhUQoLNsEePoT5WMOqwWcB2hERU+XPElgQAcBG5PURdE38CBVMBAP2ymhWl8
         ft1W1pwj9D0loxOIOZWBVcUgLW0vKRKF5ZR9u1K59lCttBDsL8HPd3n348PkrTp/px+Y
         Xsx2O/riY4YMrqtAMsXRBCIWTBwEGFX6agKIqoIuTDZ++4GxczGoa0cDGjiduluCguAJ
         uehtuhzKQ/WIXQWtGNAjk545vwlgAglsgnYrqmIMtBSf7aVnnS78tpf07nWon/aV01M6
         GNrw==
X-Forwarded-Encrypted: i=1; AJvYcCWX2oOUCqafrwsrzz71TjtRTZJW1cl0vxKwGaAtwFhMSk7qxe/lfHNERKDlUuXR1pNMCmYn9UJnQ8igw9eC5qAijhMEM8oqNu48qu2k4Q==
X-Gm-Message-State: AOJu0Yx60MGvUb2QuHoVgZyQXicWjcUU2mDpbafDKifMzlb3/UO4P6O6
	zihR+le3q5k48+76wl0nlD2vegI/71am4dLlKZaHFG+dKznSlsjOIud6b5oRpUc=
X-Google-Smtp-Source: AGHT+IGyQaYS8RevNllQyrP0oEooS7X5J8syFdRpTCB0kNcCSxzdhD34x/6DyY1adfOW1ao9Ciw98g==
X-Received: by 2002:ac2:4c43:0:b0:513:cbde:8764 with SMTP id o3-20020ac24c43000000b00513cbde8764mr9833393lfk.57.1713234060112;
        Mon, 15 Apr 2024 19:21:00 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id bi30-20020a0565120e9e00b0051925dd92dbsm27716lfb.214.2024.04.15.19.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 19:20:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Apr 2024 05:20:57 +0300
Subject: [PATCH 8/8] soc: qcom: pmic-glink: drop separate altmode driver
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240416-ucsi-glink-altmode-v1-8-890db00877ac@linaro.org>
References: <20240416-ucsi-glink-altmode-v1-0-890db00877ac@linaro.org>
In-Reply-To: <20240416-ucsi-glink-altmode-v1-0-890db00877ac@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2705;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=AfSx2w3/c0hCJlrKpU+5864hNOPEGMqvFqOcHBDjtXs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmHeCEEss+ANOz+iQrw9s6j825uZfQsAt0vUk87
 qnuuNlshTeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZh3ghAAKCRCLPIo+Aiko
 1SYKB/0R6aLKQQv9hD+ukgqzQ1mpJSGht/9kepyQCSuzhgLG9Pqljx3agzN3UzPOthxCUB7cQAJ
 6Y9NihCH/JfwcNmYKxN1NEYm2erHlXwMq4IrImYdI4AM77Iiefv+K2JOGHDuauLWtIu36JinMev
 NjeQQp/kdb3UU7BPkfbs4VARFN8j1uhm0jtcTSQJq5HjsOlTZMGcUI26zbUPzZeR5yzYUcVbHRh
 Ek7X4/RhfzUeYhwGaelz8btV1b5VLhlLxvOnSA2NFX7SnvZULtxjIEqxjNpilYj/Odq5KhvmNOT
 7lMCtZEavKoNO6URqDZStsR5TKQvs6VlUFqUrP0XlQp/Q1IB
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

As the separate pmic_glink_altmode driver has been merged to the
UCSI glink glue driver and the UCSI is now enabled on all platforms,
drop separate altmode device support in the pmic_glink driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/pmic_glink.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index dcea33f93fae..680954334b7f 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -14,7 +14,6 @@
 
 enum {
 	PMIC_GLINK_CLIENT_BATT = 0,
-	PMIC_GLINK_CLIENT_ALTMODE,
 	PMIC_GLINK_CLIENT_UCSI,
 };
 
@@ -26,7 +25,6 @@ struct pmic_glink {
 
 	unsigned long client_mask;
 
-	struct auxiliary_device altmode_aux;
 	struct auxiliary_device ps_aux;
 	struct auxiliary_device ucsi_aux;
 
@@ -294,15 +292,10 @@ static int pmic_glink_probe(struct platform_device *pdev)
 		if (ret)
 			goto out_release_pdr_handle;
 	}
-	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_ALTMODE)) {
-		ret = pmic_glink_add_aux_device(pg, &pg->altmode_aux, "altmode");
-		if (ret)
-			goto out_release_ucsi_aux;
-	}
 	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_BATT)) {
 		ret = pmic_glink_add_aux_device(pg, &pg->ps_aux, "power-supply");
 		if (ret)
-			goto out_release_altmode_aux;
+			goto out_release_ucsi_aux;
 	}
 
 	service = pdr_add_lookup(pg->pdr, "tms/servreg", "msm/adsp/charger_pd");
@@ -321,9 +314,6 @@ static int pmic_glink_probe(struct platform_device *pdev)
 out_release_aux_devices:
 	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_BATT))
 		pmic_glink_del_aux_device(pg, &pg->ps_aux);
-out_release_altmode_aux:
-	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_ALTMODE))
-		pmic_glink_del_aux_device(pg, &pg->altmode_aux);
 out_release_ucsi_aux:
 	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI))
 		pmic_glink_del_aux_device(pg, &pg->ucsi_aux);
@@ -341,8 +331,6 @@ static void pmic_glink_remove(struct platform_device *pdev)
 
 	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_BATT))
 		pmic_glink_del_aux_device(pg, &pg->ps_aux);
-	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_ALTMODE))
-		pmic_glink_del_aux_device(pg, &pg->altmode_aux);
 	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI))
 		pmic_glink_del_aux_device(pg, &pg->ucsi_aux);
 
@@ -352,7 +340,6 @@ static void pmic_glink_remove(struct platform_device *pdev)
 }
 
 static const unsigned long pmic_glink_sm8450_client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
-							   BIT(PMIC_GLINK_CLIENT_ALTMODE) |
 							   BIT(PMIC_GLINK_CLIENT_UCSI);
 
 static const struct of_device_id pmic_glink_of_match[] = {

-- 
2.39.2


