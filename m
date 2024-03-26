Return-Path: <linux-arm-msm+bounces-15263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4859388CD66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 20:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5327323EC8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 19:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7346E13D531;
	Tue, 26 Mar 2024 19:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GJ/T1efa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A64C13D290
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 19:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711482169; cv=none; b=JUe2q6hsU0AKqM44gsFyupEkFAhuwR2d+xzrBj8CxZAnyyL73rqkTocaury+jrFxUu1F6xVLDDINsmlFG8TNYavTYz5+pNuCHIuI6Ghd7x36B9fkpZSNwnQXdzapwD9jI5e/oUsuYpGZvIzSAGDV5rAEzDJO86O93+8NBnCqR8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711482169; c=relaxed/simple;
	bh=wB9I6D7BQJWznN8UthzGm+vDfU+W6H61008voNH+YNg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TUkqPCf9WdhPIVULGUnzOnJEVncIqGzxls/eRSbFWPPrszpPPtBCNDOLho/+sACX7mcb9PEjkWspBbBjdoLL9ESXqTHlLpqXdfs5fNhKXC6EBCAzJtsgzssnDtFNtY3mLFkKhMvkOmy2/dIiQrMzqoRVAiwb0fFL3LwqlxaFDKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GJ/T1efa; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a466fc8fcccso764414766b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 12:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711482165; x=1712086965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=myF/FT3mjzDetGM0IGFxtzNFS3L3TFzuRPAO+3JyykQ=;
        b=GJ/T1efaD01P6RHnPrIi9n+WIzt2mggDCbzCSyndZi5XKN6mh4Z85WU4t0nWlgkeeV
         EsaPWE+IlFh4ZsVqHpwhBlkTQYxgq2BS27mrvMrx32uJXP0wf6J3bikB4P5dEeKfEQww
         vpjebWiWpdCwkhnGHCYEOIs/WE6JTbP8Sq/jO0usjsq0p2HEnv73UV3jSlQfyp/GRJew
         UeHrmWoT74tb7Ox9kVf2LQ+NvhERXnl6Snn5T69KBG4Cm8Pd0G6nsgDQvacHZJkopOc1
         pJ/m6cIH39gsL7s094qPlOQBB1GPqpWJtdBhakjAqkDUVdyv77/iGV3USBFSiloUS+Ci
         64pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711482165; x=1712086965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=myF/FT3mjzDetGM0IGFxtzNFS3L3TFzuRPAO+3JyykQ=;
        b=eSzNH6SCFImPrE0pwMwMy9ZLiTSfN2EPpGr5qSKZ7tFjKMMgnMMYZldjasu9kj4CkY
         ownu04XkDQH45afN28d/9C08gdt8189MDJEGscCCp6phYRBQhmXbu4Ja56RC2Bc8rq44
         WLI6sw9xu6rhkHekKmir58Ji+U2WEGbLx2YN3UZBzPonYV5swyCVnQSqaBAIinu+zDXo
         5X38EHQAa5+mRYrtzsCR2UXSxDGUCfJ/rhUE3CeCb8uOO/LpRTHHIGkiaJI6h8Cr5gzb
         8p6iQf17iVb7SjxVtWqyQswOp9QNwtcPmgtaUfDuMZpVFfu0jmhpFZz4Fs5VDQS1+ToF
         yqMA==
X-Forwarded-Encrypted: i=1; AJvYcCWhijBvXQa4kqEGBI/WpSfVWRKtRJCZzQynjFRZQyjsCgs5c/pJeIguI4GxhCqjLSZztiUSSRVNpRegMgi/auiE1rwNkF4j1vxAAf61eQ==
X-Gm-Message-State: AOJu0Yy8dfxQIzkt4BmVuXbBVOeePz83/tUJpxHqDK76KI8edWjChZfU
	J64PDUPg9jeOT8RTOxoKt+ovIRliZb8h1/kISAIcG9Ue5LcBelymsSycyeMGv06DC1of12qmCUO
	n
X-Google-Smtp-Source: AGHT+IEPmaOMC2f9TTTD0MXVvmiX5xYz9V5w3kr6WBjVVtmT4USwnf7OD0Ni7SDbwpzt5QOlCusEqw==
X-Received: by 2002:a17:906:114d:b0:a4d:f806:ad6e with SMTP id i13-20020a170906114d00b00a4df806ad6emr1477735eja.52.1711482165158;
        Tue, 26 Mar 2024 12:42:45 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id i8-20020a17090671c800b00a46d4e26301sm4523807ejk.27.2024.03.26.12.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 12:42:44 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 26 Mar 2024 20:42:34 +0100
Subject: [PATCH 3/4] interconnect: qcom: icc-rpm: Make simple functions
 return void
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-topic-rpm_icc_qos_cleanup-v1-3-357e736792be@linaro.org>
References: <20240326-topic-rpm_icc_qos_cleanup-v1-0-357e736792be@linaro.org>
In-Reply-To: <20240326-topic-rpm_icc_qos_cleanup-v1-0-357e736792be@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Georgi Djakov <djakov@kernel.org>, Shawn Guo <shawn.guo@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711482160; l=7134;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=wB9I6D7BQJWznN8UthzGm+vDfU+W6H61008voNH+YNg=;
 b=y68BVQ60c5ekdqx/JspG4LRXqNIy5iwcJjZJxz0kWref3DQwaEL4g4XqOWx2hwAotRPjK7FBC
 pdqGQ3XbWDcCXJlav9pGlfMhACZVm63VM9J86rItGkHEkDs4T94yILR
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Register accesses can't just randomly fail. Change the return type of
functions that only do that to void.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/interconnect/qcom/icc-rpm.c | 110 +++++++++++++++---------------------
 1 file changed, 47 insertions(+), 63 deletions(-)

diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
index a8ed435f696c..0169de588a46 100644
--- a/drivers/interconnect/qcom/icc-rpm.c
+++ b/drivers/interconnect/qcom/icc-rpm.c
@@ -50,30 +50,27 @@
 
 #define ICC_BUS_CLK_MIN_RATE		19200ULL /* kHz */
 
-static int qcom_icc_set_qnoc_qos(struct icc_node *src)
+static void qcom_icc_set_qnoc_qos(struct icc_node *src)
 {
 	struct icc_provider *provider = src->provider;
 	struct qcom_icc_provider *qp = to_qcom_provider(provider);
 	struct qcom_icc_node *qn = src->data;
 	struct qcom_icc_qos *qos = &qn->qos;
-	int rc;
-
-	rc = regmap_update_bits(qp->regmap,
-			qp->qos_offset + QNOC_QOS_MCTL_LOWn_ADDR(qos->qos_port),
-			QNOC_QOS_MCTL_DFLT_PRIO_MASK,
-			qos->areq_prio << QNOC_QOS_MCTL_DFLT_PRIO_SHIFT);
-	if (rc)
-		return rc;
-
-	return regmap_update_bits(qp->regmap,
-			qp->qos_offset + QNOC_QOS_MCTL_LOWn_ADDR(qos->qos_port),
-			QNOC_QOS_MCTL_URGFWD_EN_MASK,
-			!!qos->urg_fwd_en << QNOC_QOS_MCTL_URGFWD_EN_SHIFT);
+
+	regmap_update_bits(qp->regmap,
+			   qp->qos_offset + QNOC_QOS_MCTL_LOWn_ADDR(qos->qos_port),
+			   QNOC_QOS_MCTL_DFLT_PRIO_MASK,
+			   qos->areq_prio << QNOC_QOS_MCTL_DFLT_PRIO_SHIFT);
+
+	regmap_update_bits(qp->regmap,
+			   qp->qos_offset + QNOC_QOS_MCTL_LOWn_ADDR(qos->qos_port),
+			   QNOC_QOS_MCTL_URGFWD_EN_MASK,
+			   !!qos->urg_fwd_en << QNOC_QOS_MCTL_URGFWD_EN_SHIFT);
 }
 
-static int qcom_icc_bimc_set_qos_health(struct qcom_icc_provider *qp,
-					struct qcom_icc_qos *qos,
-					int regnum)
+static void qcom_icc_bimc_set_qos_health(struct qcom_icc_provider *qp,
+					 struct qcom_icc_qos *qos,
+					 int regnum)
 {
 	u32 val;
 	u32 mask;
@@ -90,19 +87,18 @@ static int qcom_icc_bimc_set_qos_health(struct qcom_icc_provider *qp,
 		mask |= M_BKE_HEALTH_CFG_LIMITCMDS_MASK;
 	}
 
-	return regmap_update_bits(qp->regmap,
-				  qp->qos_offset + M_BKE_HEALTH_CFG_ADDR(regnum, qos->qos_port),
-				  mask, val);
+	regmap_update_bits(qp->regmap,
+			   qp->qos_offset + M_BKE_HEALTH_CFG_ADDR(regnum, qos->qos_port),
+			   mask, val);
 }
 
-static int qcom_icc_set_bimc_qos(struct icc_node *src)
+static void qcom_icc_set_bimc_qos(struct icc_node *src)
 {
 	struct qcom_icc_provider *qp;
 	struct qcom_icc_node *qn;
 	struct icc_provider *provider;
 	u32 mode = NOC_QOS_MODE_BYPASS;
 	u32 val = 0;
-	int i, rc = 0;
 
 	qn = src->data;
 	provider = src->provider;
@@ -115,48 +111,42 @@ static int qcom_icc_set_bimc_qos(struct icc_node *src)
 	 * only if we are NOT in Bypass Mode.
 	 */
 	if (mode != NOC_QOS_MODE_BYPASS) {
-		for (i = 3; i >= 0; i--) {
-			rc = qcom_icc_bimc_set_qos_health(qp,
-							  &qn->qos, i);
-			if (rc)
-				return rc;
-		}
+		qcom_icc_bimc_set_qos_health(qp, &qn->qos, 3);
+		qcom_icc_bimc_set_qos_health(qp, &qn->qos, 2);
+		qcom_icc_bimc_set_qos_health(qp, &qn->qos, 1);
+		qcom_icc_bimc_set_qos_health(qp, &qn->qos, 0);
 
 		/* Set BKE_EN to 1 when Fixed, Regulator or Limiter Mode */
 		val = 1;
 	}
 
-	return regmap_update_bits(qp->regmap,
-				  qp->qos_offset + M_BKE_EN_ADDR(qn->qos.qos_port),
-				  M_BKE_EN_EN_BMASK, val);
+	regmap_update_bits(qp->regmap,
+			   qp->qos_offset + M_BKE_EN_ADDR(qn->qos.qos_port),
+			   M_BKE_EN_EN_BMASK, val);
 }
 
-static int qcom_icc_noc_set_qos_priority(struct qcom_icc_provider *qp,
+static void qcom_icc_noc_set_qos_priority(struct qcom_icc_provider *qp,
 					 struct qcom_icc_qos *qos)
 {
 	u32 val;
-	int rc;
 
 	/* Must be updated one at a time, P1 first, P0 last */
 	val = qos->areq_prio << NOC_QOS_PRIORITY_P1_SHIFT;
-	rc = regmap_update_bits(qp->regmap,
-				qp->qos_offset + NOC_QOS_PRIORITYn_ADDR(qos->qos_port),
-				NOC_QOS_PRIORITY_P1_MASK, val);
-	if (rc)
-		return rc;
-
-	return regmap_update_bits(qp->regmap,
-				  qp->qos_offset + NOC_QOS_PRIORITYn_ADDR(qos->qos_port),
-				  NOC_QOS_PRIORITY_P0_MASK, qos->prio_level);
+	regmap_update_bits(qp->regmap,
+			   qp->qos_offset + NOC_QOS_PRIORITYn_ADDR(qos->qos_port),
+			   NOC_QOS_PRIORITY_P1_MASK, val);
+
+	regmap_update_bits(qp->regmap,
+			   qp->qos_offset + NOC_QOS_PRIORITYn_ADDR(qos->qos_port),
+			   NOC_QOS_PRIORITY_P0_MASK, qos->prio_level);
 }
 
-static int qcom_icc_set_noc_qos(struct icc_node *src)
+static void qcom_icc_set_noc_qos(struct icc_node *src)
 {
 	struct qcom_icc_provider *qp;
 	struct qcom_icc_node *qn;
 	struct icc_provider *provider;
 	u32 mode = NOC_QOS_MODE_BYPASS_VAL;
-	int rc = 0;
 
 	qn = src->data;
 	provider = src->provider;
@@ -166,15 +156,12 @@ static int qcom_icc_set_noc_qos(struct icc_node *src)
 		dev_dbg(src->provider->dev,
 			"NoC QoS: Skipping %s: vote aggregated on parent.\n",
 			qn->name);
-		return 0;
 	}
 
 	if (qn->qos.qos_mode == NOC_QOS_MODE_FIXED) {
 		dev_dbg(src->provider->dev, "NoC QoS: %s: Set Fixed mode\n", qn->name);
 		mode = NOC_QOS_MODE_FIXED_VAL;
-		rc = qcom_icc_noc_set_qos_priority(qp, &qn->qos);
-		if (rc)
-			return rc;
+		qcom_icc_noc_set_qos_priority(qp, &qn->qos);
 	} else if (qn->qos.qos_mode == NOC_QOS_MODE_BYPASS) {
 		dev_dbg(src->provider->dev, "NoC QoS: %s: Set Bypass mode\n", qn->name);
 		mode = NOC_QOS_MODE_BYPASS_VAL;
@@ -182,12 +169,12 @@ static int qcom_icc_set_noc_qos(struct icc_node *src)
 		/* How did we get here? */
 	}
 
-	return regmap_update_bits(qp->regmap,
-				  qp->qos_offset + NOC_QOS_MODEn_ADDR(qn->qos.qos_port),
-				  NOC_QOS_MODEn_MASK, mode);
+	regmap_update_bits(qp->regmap,
+			   qp->qos_offset + NOC_QOS_MODEn_ADDR(qn->qos.qos_port),
+			   NOC_QOS_MODEn_MASK, mode);
 }
 
-static int qcom_icc_qos_set(struct icc_node *node)
+static void qcom_icc_qos_set(struct icc_node *node)
 {
 	struct qcom_icc_provider *qp = to_qcom_provider(node->provider);
 	struct qcom_icc_node *qn = node->data;
@@ -196,11 +183,14 @@ static int qcom_icc_qos_set(struct icc_node *node)
 
 	switch (qp->type) {
 	case QCOM_ICC_BIMC:
-		return qcom_icc_set_bimc_qos(node);
+		qcom_icc_set_bimc_qos(node);
+		break;
 	case QCOM_ICC_QNOC:
-		return qcom_icc_set_qnoc_qos(node);
+		qcom_icc_set_qnoc_qos(node);
+		break;
 	default:
-		return qcom_icc_set_noc_qos(node);
+		qcom_icc_set_noc_qos(node);
+		break;
 	}
 }
 
@@ -586,14 +576,8 @@ int qnoc_probe(struct platform_device *pdev)
 
 		/* Set QoS registers (we only need to do it once, generally) */
 		if (qnodes[i]->qos.ap_owned &&
-		    qnodes[i]->qos.qos_mode != NOC_QOS_MODE_INVALID) {
-			ret = qcom_icc_qos_set(node);
-			if (ret) {
-				clk_bulk_disable_unprepare(qp->num_intf_clks,
-							   qp->intf_clks);
-				goto err_remove_nodes;
-			}
-		}
+		    qnodes[i]->qos.qos_mode != NOC_QOS_MODE_INVALID)
+			qcom_icc_qos_set(node);
 
 		data->nodes[i] = node;
 	}

-- 
2.44.0


