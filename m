Return-Path: <linux-arm-msm+bounces-4605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CE081206D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 22:09:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E18681F215D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 21:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E2277E57E;
	Wed, 13 Dec 2023 21:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xp9msi7x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3876CA7;
	Wed, 13 Dec 2023 13:09:06 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-28aeb049942so966382a91.2;
        Wed, 13 Dec 2023 13:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702501745; x=1703106545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jr0TCswUxTc7AafwY66WLMMCccn93bB0q3vfp6TfBSI=;
        b=Xp9msi7xRn/ParGLJqLDaIPh7RvxSk++DdyXyjIQYLtESgFE1CixNJoBI5hcZ3F2kc
         JXqa35mlxEHbkJAGgZ7uxgChouePvjca0H/ckYz0wKj10PgR4/wB8eF8wsgjFnncyetk
         c9W/8nKX3+iub8Dh3MoUG7C2zWLkhJXXoxqo/B8ifKQoqI+jqZdBcmGAG11c/p4plWl6
         aXmQmVEdch2enI4a0iHu/cboLo6eyzWQyaMgX8JIPYlwrCI5m8ygU34ypTzJpkzW1Ifz
         lJV5YCYI8tqP97vvpGQR/JRAdE4GCbuprZo9W93ndOe7S4uYU8TT9Tkq0S/FxOGDrDOg
         Sa9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702501745; x=1703106545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jr0TCswUxTc7AafwY66WLMMCccn93bB0q3vfp6TfBSI=;
        b=NMtORc4oDnSEzvysoR35HkQhqws2RAD+4rgBSEa6LAzDvhTtcL6sIt0/Qp8jiA3y0U
         Y2TsiyJ9EtGuPVLKNr16yN/rLlPJEhz7rLPrUxMs8zygQ5j5Xw8e2DWrBg2o3lvMOphO
         TEj3BTTzNZax6DpgijqSJd/JtHLUKEAWrCEzTG61nONd4FMqevYvH7ONe849noSHOgBM
         nDmGQipO7YolX+T+z0lFl5c3ieyrzlnkfMWcBwtF9fTCDTBawkwrhST8at0HMeJEnuqB
         RHGqx0XL9QTj9QoTgfirou7oi32TLQg2X+WPah1sVh7eCUzUDyzX0Q74Ay+oipd0KWdH
         ODPw==
X-Gm-Message-State: AOJu0YzHiiSRMz+rprSx1EFEj7QrJe+gXcC3aWpg9qJ7Lr6CsnDtrUs3
	DsamylJxWQotJErGDKCMWMJ4TBRjQdg=
X-Google-Smtp-Source: AGHT+IGkZNT3/LQJXplSCFC2ZzrzZXt7QKKZ3e7zIfx8/mItHgRrGzSLgrzJFjDmOkydu/gWyWNaYQ==
X-Received: by 2002:a17:90a:9f45:b0:28a:93d:814c with SMTP id q5-20020a17090a9f4500b0028a093d814cmr6918586pjv.50.1702501744634;
        Wed, 13 Dec 2023 13:09:04 -0800 (PST)
Received: from localhost ([100.84.200.15])
        by smtp.gmail.com with ESMTPSA id j8-20020a17090a734800b0028ae9cb6ce0sm1723141pjs.6.2023.12.13.13.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 13:09:03 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Rob Clark <robdclark@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] soc: qcom: pmic_glink: Fix boot when QRTR=m
Date: Wed, 13 Dec 2023 13:06:43 -0800
Message-ID: <20231213210644.8702-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

We need to bail out before adding/removing devices, if we are going
to -EPROBE_DEFER.  Otherwise boot will get stuck forever at
deferred_probe_initcall().

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/soc/qcom/pmic_glink.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index 914057331afd..2899746af6a6 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -268,10 +268,16 @@ static int pmic_glink_probe(struct platform_device *pdev)
 	else
 		pg->client_mask = PMIC_GLINK_CLIENT_DEFAULT;
 
+	pg->pdr = pdr_handle_alloc(pmic_glink_pdr_callback, pg);
+	if (IS_ERR(pg->pdr)) {
+		ret = dev_err_probe(&pdev->dev, PTR_ERR(pg->pdr), "failed to initialize pdr\n");
+		return ret;
+	}
+
 	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI)) {
 		ret = pmic_glink_add_aux_device(pg, &pg->ucsi_aux, "ucsi");
 		if (ret)
-			return ret;
+			goto out_release_pdr_handle;
 	}
 	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_ALTMODE)) {
 		ret = pmic_glink_add_aux_device(pg, &pg->altmode_aux, "altmode");
@@ -284,17 +290,11 @@ static int pmic_glink_probe(struct platform_device *pdev)
 			goto out_release_altmode_aux;
 	}
 
-	pg->pdr = pdr_handle_alloc(pmic_glink_pdr_callback, pg);
-	if (IS_ERR(pg->pdr)) {
-		ret = dev_err_probe(&pdev->dev, PTR_ERR(pg->pdr), "failed to initialize pdr\n");
-		goto out_release_aux_devices;
-	}
-
 	service = pdr_add_lookup(pg->pdr, "tms/servreg", "msm/adsp/charger_pd");
 	if (IS_ERR(service)) {
 		ret = dev_err_probe(&pdev->dev, PTR_ERR(service),
 				    "failed adding pdr lookup for charger_pd\n");
-		goto out_release_pdr_handle;
+		goto out_release_aux_devices;
 	}
 
 	mutex_lock(&__pmic_glink_lock);
@@ -303,8 +303,6 @@ static int pmic_glink_probe(struct platform_device *pdev)
 
 	return 0;
 
-out_release_pdr_handle:
-	pdr_handle_release(pg->pdr);
 out_release_aux_devices:
 	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_BATT))
 		pmic_glink_del_aux_device(pg, &pg->ps_aux);
@@ -314,6 +312,8 @@ static int pmic_glink_probe(struct platform_device *pdev)
 out_release_ucsi_aux:
 	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI))
 		pmic_glink_del_aux_device(pg, &pg->ucsi_aux);
+out_release_pdr_handle:
+	pdr_handle_release(pg->pdr);
 
 	return ret;
 }
-- 
2.43.0


