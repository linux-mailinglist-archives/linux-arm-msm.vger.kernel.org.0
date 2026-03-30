Return-Path: <linux-arm-msm+bounces-100868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCZuIYaqymkG/AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:53:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F190E35F147
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 18:53:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DEC9D3032F40
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C63DA3DA5AE;
	Mon, 30 Mar 2026 16:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qDqBlWKf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F287376BF5
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 16:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774889521; cv=none; b=oxYfET5iwAz1YaPXmFYYLzrdoKl5N/Yu5UYdd8ZhfBd2gDfQ/KlFbEIDnPXOgm5fPIOAR/4D/wYE1GUfP1aZgnzw7Hg8p+GUoEm+C0XEPsxuRbUlVb5yVoo5055qSrwEBw7LBisuAS/wCy2h65QIw0xJtnQvb7bpYNQfss7b6Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774889521; c=relaxed/simple;
	bh=XwLSuwNXEZjBIW+yA2bhoMct5gmlj+ljgCDuHwRDYZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dXpPvVayyjusJtU9e5R8hzMju03E9sr7TAFtgpLPb+n/MdKGaPJMKAGsxQP+3TlISALXsQpwAdaJvgPZ8szQQ3XTmsFlFHQxzEwk/6V6aDZ3q7xVZxGJP1WWJ1en7kEUICnaIIDSxj2UGZtB8GK2w7F1lElCjgzlcB1Re4kGl4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qDqBlWKf; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8a23f802e0cso8081226d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774889519; x=1775494319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBXeNBZyHgjVgtu2Bum5En+w/w6aOZhbfuK0R+dyuuw=;
        b=qDqBlWKf15CKHkzTbFujokeZJ5L1gMg6+gajC0BOWsbLNrMyDudxfhWF5kiAOqI4Br
         I45YlpTG7GlbEaTgcuaUgQGC95gcZusftN3vfaSyP/ZVDhaujMzv/m5MjXIqMY3b+Uh+
         3nkjvU3A9BnpHKWIxHsceXaw2wwJleuZpQJjgNIOMkNwGi+URnpCGfck506GRzr8U3eC
         e7AHisgAa23jxWrTNPR60qmXSYjM9OUQlK3YHHX6LKWLvLpZkINsZKaN0pUoycVCiyZu
         8wrNS/JXTBRIbYgeYpoSeUSYlao+93HsPaUPzA5m1C1MJCrJmRGZsxxP7dPzeqJU7/gE
         dfTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774889519; x=1775494319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jBXeNBZyHgjVgtu2Bum5En+w/w6aOZhbfuK0R+dyuuw=;
        b=Md4OlJhXAUQldPAcy4OyYQhHlvhXJJCaQ3GNXwHCIumADnSsqH11TqmiZSXu0lXuwi
         DJoB6VPibfy3ViCYaKTHf+OH7p0LLCzayflrB2d2eAHyhIS+bfFIuRxjk7wO9YdchDLp
         wWrHqM0iM4atMEwz9RQEFo9Qfj4QwlkivkUPZrWPUuF84V6LmZ97QgHUO5sW4jAoSTjt
         wL2rVoeF5sKLrKnXubMzmD2w57U5Xobq3UvhJw7G69JgpeodAGoaMyBluDtPSfIJkmMT
         IPVCQfOzqF97qgHyoWGC66M4qL8SsixuRgQADjV5dMu8x3mgREHAHcGTMFEUGj6p7DRP
         cCiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDwXGr1dh0DQ9hvNF2AX0lCU7Mt/IicD7SNuM1u3cYgq+2mOGsk2NFl2Zid5NCHxEFUpy1zY7JS3sfqZ5S@vger.kernel.org
X-Gm-Message-State: AOJu0YwbP8aFWQ0kV1FHmjcM4IwVxnc5WjOxNpRcNaBOW4VmxoUHFC+6
	FAqEODwsXvgRNYxlpWQqzKb0T5G1SZitjwwzGCwShsboZMI8I1CvL2gb
X-Gm-Gg: ATEYQzwXj3mUzZB26r4T2cyv5rHMCZQTikoGDmFNLntq1FtYApLzHcLdgWTiG2eHso9
	JCSqlmae1qPNxilfKD7pEghgnZkuefyIwezo+ExrTfM8WSJPCVDzbhMCFzLxn18/tmfxF4G5g4z
	3KyGIeUqXL6F1geapdAnkM1XwcuC/YPN4o7VRFucu7wPvpy31LxJsiaBMbmraa4+iNPHAkPfXKS
	6SYhYP2aMgJoF1Nru+T4FCM6oZes68+Qt43JgD7NjMxPQC3M9fCH90BJ6stsOkXQNGzMxqKtEl4
	YPVHFsRlGtSSSj/h6IW5oXpKxGA1F54JawVwAF65kwC6tJT8ExE/v083po7kQGqZkFO5a/rfkTz
	8DnRwqL9nTtFDH1gEhdavS3cFNpa02XWeXfU25LG8qO043Ae1iIbOQcBKLaiIf5IzlToznXRXj0
	shXCzBfpJieir/WYK81R0MtR8=
X-Received: by 2002:a05:6214:1d07:b0:89c:8681:36fa with SMTP id 6a1803df08f44-89ce8dc159bmr212374466d6.32.1774889519213;
        Mon, 30 Mar 2026 09:51:59 -0700 (PDT)
Received: from localhost ([199.7.157.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecb5cb530sm71400926d6.7.2026.03.30.09.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 09:51:58 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v5 1/2] thermal/qcom/lmh: support SDM670 and its CPU clusters
Date: Mon, 30 Mar 2026 12:52:36 -0400
Message-ID: <20260330165237.101045-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330165237.101045-1-mailingradian@gmail.com>
References: <20260330165237.101045-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100868-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,intel.com,arm.com,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: F190E35F147
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The LMh driver was made for Qualcomm SoCs with clusters of 4 CPUs, but
some SoCs divide the CPUs into different sizes of clusters. In SDM670,
the first 6 CPUs are in the little cluster and the next 2 are in the big
cluster. Define the clusters in the match data and define the different
cluster configuration for SDM670.

Currently, this tolerates linking to any CPU in a given cluster.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/thermal/qcom/lmh.c | 54 ++++++++++++++++++++++++--------------
 1 file changed, 34 insertions(+), 20 deletions(-)

diff --git a/drivers/thermal/qcom/lmh.c b/drivers/thermal/qcom/lmh.c
index 3d072b7a4a6d..81ab2f0be9c8 100644
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
+	unsigned int clus1_start_idx;
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
@@ -121,6 +124,11 @@ static int lmh_probe(struct platform_device *pdev)
 	cpu_id = of_cpu_node_to_id(cpu_node);
 	of_node_put(cpu_node);
 
+	if (cpu_id < 0) {
+		dev_err(dev, "Wrong CPU id associated with LMh node\n");
+		return -EINVAL;
+	}
+
 	ret = of_property_read_u32(np, "qcom,lmh-temp-high-millicelsius", &temp_high);
 	if (ret) {
 		dev_err(dev, "missing qcom,lmh-temp-high-millicelsius property\n");
@@ -139,26 +147,16 @@ static int lmh_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	/*
-	 * Only sdm845 has lmh hardware currently enabled from hlos. If this is needed
-	 * for other platforms, revisit this to check if the <cpu-id, node-id> should be part
-	 * of a dt match table.
-	 */
-	if (cpu_id == 0) {
+	match_data = of_device_get_match_data(dev);
+	if (cpu_id < match_data->clus1_start_idx)
 		node_id = LMH_CLUSTER0_NODE_ID;
-	} else if (cpu_id == 4) {
+	else
 		node_id = LMH_CLUSTER1_NODE_ID;
-	} else {
-		dev_err(dev, "Wrong CPU id associated with LMh node\n");
-		return -EINVAL;
-	}
 
 	if (!qcom_scm_lmh_dcvsh_available())
 		return -EINVAL;
 
-	enable_alg = (uintptr_t)of_device_get_match_data(dev);
-
-	if (enable_alg) {
+	if (match_data->enable_algos) {
 		ret = qcom_scm_lmh_dcvsh(LMH_SUB_FN_CRNT, LMH_ALGO_MODE_ENABLE, 1,
 					 LMH_NODE_DCVS, node_id, 0);
 		if (ret)
@@ -231,10 +229,26 @@ static int lmh_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct lmh_soc_data sdm670_lmh_data = {
+	.enable_algos = true,
+	.clus1_start_idx = 6,
+};
+
+static const struct lmh_soc_data sdm845_lmh_data = {
+	.enable_algos = true,
+	.clus1_start_idx = 4,
+};
+
+static const struct lmh_soc_data sm8150_lmh_data = {
+	.enable_algos = false,
+	.clus1_start_idx = 4,
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


