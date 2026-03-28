Return-Path: <linux-arm-msm+bounces-100518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YK+NOqMxx2mVUAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 02:40:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A33C834CF25
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 02:40:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 963BB30269D0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 01:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E53D833B6CC;
	Sat, 28 Mar 2026 01:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hfFo7Euy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CB82376FD
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 01:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774662047; cv=none; b=E3bJLX2idb1xmKD1xNVNkxgClm/UlUPcWJEQfVaOtOoCbL7JqIiUcZR8G1y+R+QH82WRvrcwiaPH1TZDFeWoM3AqyEraC2vad/P6HYi2dE2yF8bVhMd6U/L2DHGtnO9TIXfWLMLL+UutKU5JJ2M0LwTgNSaJ7H8Jt+M7ujx4VEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774662047; c=relaxed/simple;
	bh=P+sgtflT7HpNTLl3SREork3SLX9AzxBIvEm30I4maL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KCfAdFghzZwyfyQuxYJKcr6OjqO1XW1+lQlhgdpYH90Gnh1e9uYMgA4pd3WCPJWYLcWqo+hGSSgT/ymrDKZ1R7mcvBQHFvotlgPTddJHIJe5jym65a4bueoSr29cdPN9pMTaezl/UgKpV8ngIjJ1q72Ez+adDkDYMQXqmaAJFcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hfFo7Euy; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-509061dab77so23729801cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 18:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774662045; x=1775266845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cBBLWCcZ87q82/idzSnceVUwnwhBcq1HPoO/59tEn18=;
        b=hfFo7EuytdGqbNdcKUUaCWOL6owG+TacYy4CGxjTdHxmJxm3UyigIEZeVO7/k/7EgI
         ovJVRrf+GQHDvpTlvcGyHbFWW4OhJGqKSPrEMIewBqZ49nDgkiQuFf/nHc1vQh36ua+I
         LuiBXHUcrQCNgO2oPVBeGJys9j9yPzKje88ZS8VmgWi2QztNppCoizdNtXb1XbCcg9UM
         pKKABGczJsZb4GZarBN76ZxQ/uIkDWok3nRoUTEB6xhekTKz/lKufpuMna0KPiBBkWgm
         Xy1KvNIxRcdyJqtBh3xD/TtSdZk2DxcO8hYsT6Ce0wEJpFaS6rknf6Xs4/zpgb2KslJo
         SnSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774662045; x=1775266845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cBBLWCcZ87q82/idzSnceVUwnwhBcq1HPoO/59tEn18=;
        b=IoeVafiTXFquegA8Yr9rftxda9Qi5ckWyj1OYqq56wbSBW6/AmTL8tPP31pjGnJhRz
         81+OmtqIBr8aHuvumEGqKHlma7dyzAi1+ZgaaKNpEg/aO4UZjBmvr4IHBscPWcV89fb/
         UQd2r1LHe5gV51sTXHk7NEcWj93bikxOoF17LejFLKV8ojBARt1bPK0fJ8b0jWbL2ugt
         tiFT/8a261vzzk++gSx8nw4EyYj8YDFJDBUwgEhS24v5YUAnXAH0fzdndOs7pwKdspcf
         3G8qGAjsx6n5i0zx3v0azopyP9M1hb94NBUOL3NTihZSoT9zsKqgJZRQcdW9ZQfjAA6S
         x20A==
X-Forwarded-Encrypted: i=1; AJvYcCWuhpHIHusq2OW10Oo3DN2SFoIARxaaqMoJFEJPg2kd3Lep56OP8elHQ2yO45eQQhExVIDpujBRxcSyc7lT@vger.kernel.org
X-Gm-Message-State: AOJu0YyONMCxhjXGIFQENn/Gw/YHV7uAltgE1I6n4FkeZtBPeP0x3rue
	X2FOcjQwapSqYP9fdUe1lks7HUU7KQ9Y2V0JxXp6XG0xrqLYv3CCH8Pq
X-Gm-Gg: ATEYQzzTS19cIvEpxqCN/CLUyamFB1qv4WJwLBNbfBEzU3q8adXpNMxEgy0y1CBJU/K
	m9qV3OQU0f82AXXQ8QajArpxRjRXmnPner/PFecSSyJW29ACexM2o9Hawoeuiu3QyCbkSzPsew7
	fNaaFDQpOveadbUoFqn17zzcSUmt2Bfg/kqCWcU/3pYifts1B0cEwAMJQF4TNXGt8h/bTg+MSCp
	aVBwC5rqmANQej/sYemUEijehN57WACgGILuXI9M92EjYcY8YzQ04vJ4BDzl6aG9JxaSGMPOzhC
	J+d57sn6lddmKhkum+KzHcV5h72GqVNFtTaHqhZC27VzQBSIwdiWn7V/8guep43rwCNlRkXGAfh
	pzyanjkxJkodbklhXEeBj0K70bgSbDFAfJ523sJddjgTvJDf50Xl6kheOQcnVxMCl8cR4aOEoUB
	elgaTXUYdWXFrrrJxba6XiNdti6w==
X-Received: by 2002:a05:622a:64b:b0:509:61:b22 with SMTP id d75a77b69052e-50ba39c17a1mr66304681cf.57.1774662045438;
        Fri, 27 Mar 2026 18:40:45 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c67d1fsm8092411cf.1.2026.03.27.18.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 18:40:43 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 3/4] thermal/qcom/lmh: support SDM670 and its CPU clusters
Date: Fri, 27 Mar 2026 21:40:40 -0400
Message-ID: <20260328014041.83777-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328014041.83777-1-mailingradian@gmail.com>
References: <20260328014041.83777-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100518-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,intel.com,arm.com,gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A33C834CF25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The LMh driver was made for Qualcomm SoCs with clusters of 4 CPUs, but
some SoCs divide the CPUs into different sizes of clusters. In SDM670,
the first 6 CPUs are in the little cluster and the next 2 are in the big
cluster. Define the clusters in the match data and define the different
cluster configuration for SDM670.

Currently, this only supports 8 CPUs and tolerates linking to any CPU in
the cluster.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/thermal/qcom/lmh.c | 69 +++++++++++++++++++++++++++++++-------
 1 file changed, 56 insertions(+), 13 deletions(-)

diff --git a/drivers/thermal/qcom/lmh.c b/drivers/thermal/qcom/lmh.c
index 3d072b7a4a6d..46c1e301f6c8 100644
--- a/drivers/thermal/qcom/lmh.c
+++ b/drivers/thermal/qcom/lmh.c
@@ -30,14 +30,17 @@
 
 #define LMH_REG_DCVS_INTR_CLR		0x8
 
-#define LMH_ENABLE_ALGOS		1
-
 struct lmh_hw_data {
 	void __iomem *base;
 	struct irq_domain *domain;
 	int irq;
 };
 
+struct lmh_soc_data {
+	bool enable_algos;
+	u32 node_ids[8];
+};
+
 static irqreturn_t lmh_handle_irq(int hw_irq, void *data)
 {
 	struct lmh_hw_data *lmh_data = data;
@@ -100,8 +103,8 @@ static int lmh_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	struct device_node *cpu_node;
 	struct lmh_hw_data *lmh_data;
+	const struct lmh_soc_data *match_data;
 	int temp_low, temp_high, temp_arm, cpu_id, ret;
-	unsigned int enable_alg;
 	u32 node_id;
 
 	if (!qcom_scm_is_available())
@@ -144,10 +147,9 @@ static int lmh_probe(struct platform_device *pdev)
 	 * for other platforms, revisit this to check if the <cpu-id, node-id> should be part
 	 * of a dt match table.
 	 */
-	if (cpu_id == 0) {
-		node_id = LMH_CLUSTER0_NODE_ID;
-	} else if (cpu_id == 4) {
-		node_id = LMH_CLUSTER1_NODE_ID;
+	match_data = of_device_get_match_data(dev);
+	if (cpu_id >= 0 && cpu_id < 8) {
+		node_id = match_data->node_ids[cpu_id];
 	} else {
 		dev_err(dev, "Wrong CPU id associated with LMh node\n");
 		return -EINVAL;
@@ -156,9 +158,7 @@ static int lmh_probe(struct platform_device *pdev)
 	if (!qcom_scm_lmh_dcvsh_available())
 		return -EINVAL;
 
-	enable_alg = (uintptr_t)of_device_get_match_data(dev);
-
-	if (enable_alg) {
+	if (match_data->enable_algos) {
 		ret = qcom_scm_lmh_dcvsh(LMH_SUB_FN_CRNT, LMH_ALGO_MODE_ENABLE, 1,
 					 LMH_NODE_DCVS, node_id, 0);
 		if (ret)
@@ -231,10 +231,53 @@ static int lmh_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct lmh_soc_data sdm670_lmh_data = {
+	.enable_algos = true,
+	.node_ids = {
+		LMH_CLUSTER0_NODE_ID,
+		LMH_CLUSTER0_NODE_ID,
+		LMH_CLUSTER0_NODE_ID,
+		LMH_CLUSTER0_NODE_ID,
+		LMH_CLUSTER0_NODE_ID,
+		LMH_CLUSTER0_NODE_ID,
+		LMH_CLUSTER1_NODE_ID,
+		LMH_CLUSTER1_NODE_ID,
+	},
+};
+
+static const struct lmh_soc_data sdm845_lmh_data = {
+	.enable_algos = true,
+	.node_ids = {
+		LMH_CLUSTER0_NODE_ID,
+		LMH_CLUSTER0_NODE_ID,
+		LMH_CLUSTER0_NODE_ID,
+		LMH_CLUSTER0_NODE_ID,
+		LMH_CLUSTER1_NODE_ID,
+		LMH_CLUSTER1_NODE_ID,
+		LMH_CLUSTER1_NODE_ID,
+		LMH_CLUSTER1_NODE_ID,
+	},
+};
+
+static const struct lmh_soc_data sm8150_lmh_data = {
+	.enable_algos = false,
+	.node_ids = {
+		LMH_CLUSTER0_NODE_ID,
+		LMH_CLUSTER0_NODE_ID,
+		LMH_CLUSTER0_NODE_ID,
+		LMH_CLUSTER0_NODE_ID,
+		LMH_CLUSTER1_NODE_ID,
+		LMH_CLUSTER1_NODE_ID,
+		LMH_CLUSTER1_NODE_ID,
+		LMH_CLUSTER1_NODE_ID,
+	},
+};
+
 static const struct of_device_id lmh_table[] = {
-	{ .compatible = "qcom,sc8180x-lmh", },
-	{ .compatible = "qcom,sdm845-lmh", .data = (void *)LMH_ENABLE_ALGOS},
-	{ .compatible = "qcom,sm8150-lmh", },
+	{ .compatible = "qcom,sc8180x-lmh", .data = &sm8150_lmh_data },
+	{ .compatible = "qcom,sdm670-lmh", .data = &sdm670_lmh_data },
+	{ .compatible = "qcom,sdm845-lmh", .data = &sdm845_lmh_data },
+	{ .compatible = "qcom,sm8150-lmh", .data = &sm8150_lmh_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, lmh_table);
-- 
2.53.0


