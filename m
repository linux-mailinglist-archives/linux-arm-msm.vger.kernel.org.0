Return-Path: <linux-arm-msm+bounces-3545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DF5806F9D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 13:25:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4115FB208F6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 12:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E0FC364BE;
	Wed,  6 Dec 2023 12:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L7E3hyDL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBCCCD3
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Dec 2023 04:25:06 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a1c8512349dso95303166b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Dec 2023 04:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701865505; x=1702470305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bSPJqgRu7qPi+l+hmtBMdBdRoK+soEQmisUntrPtTec=;
        b=L7E3hyDLPETIVo6Mm8tHN2xAZSS7M80MQ/DlspehVsODjU4ROfs9Sg47z0PjkI5fPI
         vRqf1Irz2RrNMhKQ06qWb3KW96Jr8OtVFGAeCo/+uPcnkeYSnyGFP0C2UrrqjYUTrGN0
         q0z3Hv717Ev/hgYB0upmm+X2EfFyVF2LD3khSZaTjKwG3itzCCzMzMRQz8GLsVx5hPo4
         W0DQWxlu27iBHzBSQlj/BNB2KAIWvRAZlY0nW0NN6IJ7llIt891+eJl9WExf0RZvNIN6
         zY0N8aDdHKMwWGkEEmCBLE2nRK0Tou3iQ3aOSCR1iLQlE9FyZrMGscUJs48dXiwxyoGj
         Fkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701865505; x=1702470305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bSPJqgRu7qPi+l+hmtBMdBdRoK+soEQmisUntrPtTec=;
        b=OB+ZSD9PiuA4kkeQ5bsyxkb7HolKSs4Qj8nqIs5bks9SaMcdmSrLZhTkb3AOm7UL+K
         /Q2ApHQec75M4CfhTzhV0lE2dNoK5kYliyD4WEE1RoRZyBsBYOPn+BvhVDlKdAqX8whS
         tQK6UPYIa7+jRbxrNXId5guBFXubED2jTEKAn1qnqNqRLwVGtA2i5OzXHIM8KroRPQKT
         EpAQyc2QkBMuITHbvbYO64pwJg3mAvIwkVwqL/+Mj+1hm6BBep92LkW5KzGBRn+CKrwR
         8Rlg09+U/YO/xpyrlY6uAP7nIbTvmH+nmSwRheQ3DbH8HKpbfZ/OJHd9Ncy7qsifK510
         Yiyw==
X-Gm-Message-State: AOJu0Yyd/9k9R1MtQt8Wh2RImRx7kK2EVIOrjn7P7nvKL9ffmgz6XK5Q
	lsl/ygg0kw0UdPH57AlulQVrUA==
X-Google-Smtp-Source: AGHT+IHtG3wgmSPxClZN+MYAjNI7aaFnXOPpyZPkxuMt1SL2AMOnDm2wdd1rH0jDoZWCCdIW+DoTtw==
X-Received: by 2002:a17:906:fc06:b0:a1c:fdb2:e9a7 with SMTP id ov6-20020a170906fc0600b00a1cfdb2e9a7mr476301ejb.141.1701865505354;
        Wed, 06 Dec 2023 04:25:05 -0800 (PST)
Received: from localhost.localdomain (2001-1c06-2302-5600-366d-ca8f-f3af-0381.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:366d:ca8f:f3af:381])
        by smtp.gmail.com with ESMTPSA id oz23-20020a170906cd1700b00a0ad10b3f68sm8188085ejb.205.2023.12.06.04.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 04:25:04 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: laurent.pinchart@ideasonboard.com,
	rfoss@kernel.org,
	todor.too@gmail.com,
	agross@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	mchehab@kernel.org,
	matti.lehtimaki@gmail.com,
	quic_grosikop@quicinc.com
Cc: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v6.1] media: qcom: camss: Add support for named power-domains
Date: Wed,  6 Dec 2023 13:25:00 +0100
Message-ID: <20231206122500.3798228-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <43621420-2482-4634-9c3e-1a3278481540@xs4all.nl>
References: <43621420-2482-4634-9c3e-1a3278481540@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Right now we use fixed indexes to assign power-domains, with a
requirement for the TOP GDSC to come last in the list.

Adding support for named power-domains means the declaration in the dtsi
can come in any order.

After this change we continue to support the old indexing - if a SoC
resource declaration or the in-use dtb doesn't declare power-domain names
we fall back to the default legacy indexing.

From this point on though new SoC additions should contain named
power-domains, eventually we will drop support for legacy indexing.

Tested-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 24 +++++++++++++-
 drivers/media/platform/qcom/camss/camss.c     | 31 +++++++++++++++----
 drivers/media/platform/qcom/camss/camss.h     |  2 ++
 3 files changed, 50 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 60c4730e7c9d..083d1445a6e2 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1382,7 +1382,29 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 	if (!res->line_num)
 		return -EINVAL;
 
-	if (res->has_pd) {
+	/* Power domain */
+
+	if (res->pd_name) {
+		vfe->genpd = dev_pm_domain_attach_by_name(camss->dev,
+							  res->pd_name);
+		if (IS_ERR(vfe->genpd)) {
+			ret = PTR_ERR(vfe->genpd);
+			return ret;
+		}
+	}
+
+	if (!vfe->genpd && res->has_pd) {
+		/*
+		 * Legacy magic index.
+		 * Requires
+		 * power-domain = <VFE_X>,
+		 *                <VFE_Y>,
+		 *                <TITAN_TOP>
+		 * id must correspondng to the index of the VFE which must
+		 * come before the TOP GDSC. VFE Lite has no individually
+		 * collapasible domain which is why id < vfe_num is a valid
+		 * check.
+		 */
 		vfe->genpd = dev_pm_domain_attach_by_id(camss->dev, id);
 		if (IS_ERR(vfe->genpd))
 			return PTR_ERR(vfe->genpd);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 35918cf837bd..8de0e9e8d34b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1522,13 +1522,32 @@ static int camss_configure_pd(struct camss *camss)
 		return 0;
 
 	/*
-	 * VFE power domains are in the beginning of the list, and while all
-	 * power domains should be attached, only if TITAN_TOP power domain is
-	 * found in the list, it should be linked over here.
+	 * If a power-domain name is defined try to use it.
+	 * It is possible we are running a new kernel with an old dtb so
+	 * fallback to indexes even if a pd_name is defined but not found.
 	 */
-	camss->genpd = dev_pm_domain_attach_by_id(camss->dev, camss->genpd_num - 1);
-	if (IS_ERR(camss->genpd)) {
-		ret = PTR_ERR(camss->genpd);
+	if (camss->res->pd_name) {
+		camss->genpd = dev_pm_domain_attach_by_name(camss->dev,
+							    camss->res->pd_name);
+		if (IS_ERR(camss->genpd)) {
+			ret = PTR_ERR(camss->genpd);
+			goto fail_pm;
+		}
+	}
+
+	if (!camss->genpd) {
+		/*
+		 * Legacy magic index. TITAN_TOP GDSC must be the last
+		 * item in the power-domain list.
+		 */
+		camss->genpd = dev_pm_domain_attach_by_id(camss->dev,
+							  camss->genpd_num - 1);
+	}
+	if (IS_ERR_OR_NULL(camss->genpd)) {
+		if (!camss->genpd)
+			ret = -ENODEV;
+		else
+			ret = PTR_ERR(camss->genpd);
 		goto fail_pm;
 	}
 	camss->genpd_link = device_link_add(camss->dev, camss->genpd,
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 1ba824a2cb76..cd8186fe1797 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -48,6 +48,7 @@ struct camss_subdev_resources {
 	u32 clock_rate[CAMSS_RES_MAX][CAMSS_RES_MAX];
 	char *reg[CAMSS_RES_MAX];
 	char *interrupt[CAMSS_RES_MAX];
+	char *pd_name;
 	u8 line_num;
 	bool has_pd;
 	const void *ops;
@@ -84,6 +85,7 @@ enum icc_count {
 
 struct camss_resources {
 	enum camss_version version;
+	const char *pd_name;
 	const struct camss_subdev_resources *csiphy_res;
 	const struct camss_subdev_resources *csid_res;
 	const struct camss_subdev_resources *ispif_res;
-- 
2.42.0


