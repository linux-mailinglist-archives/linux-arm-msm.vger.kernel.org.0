Return-Path: <linux-arm-msm+bounces-16181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2868962CE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 05:11:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4485128680F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 03:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37DB51BF5C;
	Wed,  3 Apr 2024 03:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MfnhrtJk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891581C29F
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 03:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712113863; cv=none; b=KNh2Dz0TvXwuEPFL3rQKWPTr3UqqmKRYZraN10jQoEEkakYtJfIsmsm2M3mMrUVzhwsTO+XW4LAoikNPcbTi8DuljirmHk2oJXxg5y2PV7o3a/huzhWZdMvvr1UEmFAkD1FVFetun/xqcaldaiNznjjPwWz1Wh+ClNB0H1qvJZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712113863; c=relaxed/simple;
	bh=zsWd0i7Kk841N8SmXs9tnRrxsAh7c4DjxAGKwlg50z0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n2iZoJQR/ikJAkbdTwgE4yxGDfgCnFvd5AqW3kLBzJmghTuVMLNJesZ91NQ9cw9lauVpTwdePHjB2ULXqLrvsYC/gpARb3ql0CVl64lM+cnzDh5E1XAPCzDdnAnSH7Kg59V7LTG87uhP/87cSnHBDe+8qedeixYtJcijevDynd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MfnhrtJk; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d718efedb2so87712311fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Apr 2024 20:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712113860; x=1712718660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=azM/yEhe+aJWB0XejrkxVawtRjtvg2L/lzix2nFDCVo=;
        b=MfnhrtJksEPy8eIUchMDWWTTJzyAYTQJu0X9rC5nazuwydPu0n/ky95lKxBtI7T0WT
         WkfC78Gh2UiEJ1lUlzZTkd6ckcKgUFR+yuJIpOr2L04tS6LQEViqZB3+ZEQbrv7QJK1p
         UyZ0Y4fBROLXAErgfCJZ8wUHrEkolybEnjhwKFnsRFQ5nnhONOPT8ID+6HNjFEjdMjPu
         Txb0Nv9O2pFddk3H8nNiLJdh+Inu7iDOAjUiRAePsAdSUJMzXTItcI1V26SLGWS5AvXo
         GHAPkgdMtoX99JyxNkpUkxyDRUOZ8P/Fts6qrTm3xN6W372S8EIvaHQL+lLlFMlZyJNL
         /nJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712113860; x=1712718660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azM/yEhe+aJWB0XejrkxVawtRjtvg2L/lzix2nFDCVo=;
        b=VoYWrn1W5Bi+rpdphpmn9y7lKGYIfUY+MekeawaXRyzsDWIX87iwVE6w8n4Mf2+LaV
         09Qyf2mBNfEZYhZih3nAapIC4/A2GpS+b1gBrlJiYoWkxR18KWsVgO9byGsb7EhEeRcw
         3gqzTLsNNm+4XG6c3l++w7W0j36ORKWhi9fntbdb8E/hvI62QZlITzWEXdvUw9zixSia
         MeHdKBxkrg0jT7Sy77AjSH29w5HZpJ7L9AXAVHfPTITOdGoPc5NAlzPzIFkfUHbHVS2V
         FUp+F0xwW/z+sG09CqUm+0iECLwLGipRyhOA17DbvzBCi6xvBiuxoqJN65U8B1eqiMMi
         OHkQ==
X-Gm-Message-State: AOJu0YxQLaooQDbq/ifaMxuPFhtuV29PIQWIbpTfAxnuRJisetUrR4HW
	4Ciz0R1Z+h+EHsXyCigh7a6qYliXycezSnKn6piRcIqdnOQV7SZfJzdSSwwW1uY=
X-Google-Smtp-Source: AGHT+IHKwJzVCx/ob14SfNesIFCCJ67C8Z31d/2TZkOdKwb+Ve1tW2YfR7Ykl1Vp/JTVC19y4fSjpg==
X-Received: by 2002:a05:651c:83:b0:2d6:c749:17bc with SMTP id 3-20020a05651c008300b002d6c74917bcmr2738152ljq.31.1712113859836;
        Tue, 02 Apr 2024 20:10:59 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k11-20020a2ea26b000000b002d808b86073sm1056970ljm.78.2024.04.02.20.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 20:10:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 03 Apr 2024 06:10:57 +0300
Subject: [PATCH v2 1/2] soc: qcom: pmic_glink: don't traverse clients list
 without a lock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-pmic-glink-fix-clients-v2-1-aed4e02baacc@linaro.org>
References: <20240403-pmic-glink-fix-clients-v2-0-aed4e02baacc@linaro.org>
In-Reply-To: <20240403-pmic-glink-fix-clients-v2-0-aed4e02baacc@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1331;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=zsWd0i7Kk841N8SmXs9tnRrxsAh7c4DjxAGKwlg50z0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmDMjCdFu6teXZQf5u4HIDTG4OqIy3j6H++7+uQ
 f9zBQhOLb6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgzIwgAKCRCLPIo+Aiko
 1U6pCACMRalj9NllMhjXSC/UUWdIb7M/YVky4IUqf8KnFOkh9oQttGiVbIK6C7SjFPdaVcAsOQs
 Z8PAzojdrGFOTwd20fjNF6Fyd6SRdPNXk+NY38iTD9d5GvuVxh2GWoaftMtGPEq6ElJOlQKt1C5
 3PnCA8EAMnwRV0K5v8QX0YnwaIundIZx3Ih1w84tSBljwoVZB5p5LMq8vNN8NlXs7FNVBrffBIk
 fcoZjZSfMY9Uz0RVMxQle0eXVMlaRoA8tzaIUos5pDk/cxUgGoU1ogHzo5F2rRW4wclzWUOcD4X
 eHKodwwiwJJ/PzrxCLw1iElawAy9AsLdJeoQBdrzAdK0GMom
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Take the client_lock before traversing the clients list at the
pmic_glink_state_notify_clients() function. This is required to keep the
list traversal safe from concurrent modification.

Fixes: 58ef4ece1e41 ("soc: qcom: pmic_glink: Introduce base PMIC GLINK driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/pmic_glink.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index f913e9bd57ed..2b2cdf479654 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -115,10 +115,12 @@ static int pmic_glink_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
 
 	hdr = data;
 
+	mutex_lock(&pg->client_lock);
 	list_for_each_entry(client, &pg->clients, node) {
 		if (client->id == le32_to_cpu(hdr->owner))
 			client->cb(data, len, client->priv);
 	}
+	mutex_unlock(&pg->client_lock);
 
 	return 0;
 }
@@ -168,8 +170,10 @@ static void pmic_glink_state_notify_clients(struct pmic_glink *pg)
 	}
 
 	if (new_state != pg->client_state) {
+		mutex_lock(&pg->client_lock);
 		list_for_each_entry(client, &pg->clients, node)
 			client->pdr_notify(client->priv, new_state);
+		mutex_unlock(&pg->client_lock);
 		pg->client_state = new_state;
 	}
 }

-- 
2.39.2


