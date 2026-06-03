Return-Path: <linux-arm-msm+bounces-110954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i7ICEtMWIGqfvgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 13:58:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF59A63741B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 13:58:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=UCs1iEYa;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110954-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110954-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A23A230A59FF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 11:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F30BB477E3D;
	Wed,  3 Jun 2026 11:50:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942AB477984
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 11:50:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780487447; cv=none; b=kJjR3SnZjnQklNndVBY5nlEzDxiPhjouu1O9jFreWYituiCOnPHihLXLm97uD4NBpZbv+BiIgGKn4DQJsx5zFbXAmUsQMguA76WMBGH2QbUpkk2FYnM7ke5WSCeaBJm8yEAfoMbcJl/qIrqvoyAA4vSggy0p+ml0NpbC1xKk89U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780487447; c=relaxed/simple;
	bh=pw1Xomz8P67jYUl18bj/VcuHb5qLX1jm74fDqyanzgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=koyk7dykkXNsL42vXAVi2J1RuM5JmFJk380CgstKEMHi/vSvC+w7IEMUlm47iYTIM6epua6301hRbGA4E9pgLqxfQZMLOODLjkYCWd74hRSBir/Wqjc4linDzYXY482iy2qUF/K4bvHn2dqJy6NexVZU4Ut2iRZiJz3NTeC2JZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UCs1iEYa; arc=none smtp.client-ip=209.85.214.181
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2bf237e1433so56042575ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 04:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780487446; x=1781092246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rL5+qjOA7bv12mhMT3uoOE5lmwvzw8y82TwvGRMCpDE=;
        b=UCs1iEYaELn+qjPDFLJgnNcL+kDTPSFOhU6U7xvJ0DyxlT/zvb7SxulAlt7tjym5dc
         ETvjKcmvaRcbcjtq/bCSp9BTXNjJO41K9fsW4bEAu/QfJsL53YYY2P262qSAUj2044xZ
         7QJIaUHrTGHHxZmrDQPppqWO5VZCU/iATJEfhPFvF3nKIVjqfMEJSmUivZZWK5PtScsN
         hX35Sys4Hb4ybRij+xh0sgXk/yt/9kcqXjQzNKI/D58go9/j2mJPZZ2iKWx9xvkofWQ3
         v8iXz3XrDa2Ab13ix9gBgOeau9DsI08pCLqfOhs7gBp1uUeauDroBr23rjm8X90TJH94
         B42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780487446; x=1781092246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rL5+qjOA7bv12mhMT3uoOE5lmwvzw8y82TwvGRMCpDE=;
        b=BnzhzXdd4X7yYwXqRVaP3Vg1+IArAX4/jrP5ns6u7ag/uTgi2kVZWBlMrISVKIxf4D
         9svIaTQ973bXV2g5X6GgS/hfSmjGSrdUTR6tRxNgkzVx5krM4GtVT9SDm7hFR+I9QbfM
         u+BTvzfG/hZsx5uV0fizRNVoSvEn5b+153YARzAOFlmGpSkvafP87j991GXPDa4OTMM7
         aaBW9L/kvh46rB+8oZXs4eIZIdba4GocT87vyjDKva15FT9szDQeoIao0uQVrCXGRw1L
         zqWxa9cJ4z9VBM4IWj1sM5Yqc+RHkdQwHAjqE5LvsbD7tqAvpTfbZoGW26odwAGf1MEt
         0PSA==
X-Forwarded-Encrypted: i=1; AFNElJ/mkxZXoqJ3BsNmJW6E0d1jH6X3fs9FJPPPJDL1kfijVNHFHSVryRCKxTFJYB2glQ8Il09jhjGDLGJ5v+Hc@vger.kernel.org
X-Gm-Message-State: AOJu0YyMgh32FcBLEgkpLU8VBRfkeeJjRq0gsYgqeGZrl0NuIn56Bxwh
	Y3r0A+Vfc0xtWBFtTXjPrs4J7RACSQuyWiOZjw+YhapDwnTrvAqu+nkT
X-Gm-Gg: Acq92OG1vT136fCviF0K4JljVPDYp8Lc2vJS4k/H5KXjkU1iiBhE29oIoBFIgi2JfyT
	0Sk1ngX8ZZoV/wEloHXkPoB4/AA6v5DmLfz9AXDLkHBNoyE6mRE0c+0v+nMXeDcneTAsceKcfak
	r61q/3Ifcx/n4Q86IueAfe/BYWZUqevSpNVG5kH+c/T50L212R+Rcop1lEe2u+gaurXUrUU3l8g
	Ta0X+UBzKX95AIXwQDDlM2yNkXkBqcH2T0TGfr476SRBk7MF68aTBmRgw3eraYigz1m0izUl8U5
	Bhn1Rar20Sieyca+uJbgDxp5h66h5CZ7uZSnijHwf6sBbBHLyrGLtdBGYOo7xBL/e/wRBjEUIC6
	8gTP0NeFiOILOb/CjczQFZ9zjs4odt1UvJRkc4uUticQYjxqRz2UTxpi7UKOvAFe1diBQpq9ulN
	+0adfglh4Zg5TsJwNbxUh7DhAazyKPPjGr7a2WNZiC7D+DtBSV/yXqjf5K3dOV6Dd8GbSY
X-Received: by 2002:a17:903:244c:b0:2c1:77cd:fb0b with SMTP id d9443c01a7336-2c177cdfbfemr14896165ad.37.1780487445843;
        Wed, 03 Jun 2026 04:50:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609df63sm22731455ad.40.2026.06.03.04.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 04:50:45 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Srinivas Kandagatla <srini@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 9/9] ASoC: qcom: topology: Use guard() for mutex locks
Date: Wed,  3 Jun 2026 18:49:49 +0700
Message-ID: <20260603114949.149595-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603114949.149595-1-phucduc.bui@gmail.com>
References: <20260603114949.149595-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-110954-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phucduc.bui@gmail.com,m:phucducbui@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF59A63741B

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

NOTE: This patch is compile-tested only.

 sound/soc/qcom/qdsp6/topology.c | 71 +++++++++++++++------------------
 1 file changed, 33 insertions(+), 38 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 1f69fba6de26..efbbebb8c6d3 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -32,9 +32,8 @@ static struct audioreach_graph_info *audioreach_tplg_alloc_graph_info(struct q6a
 	struct audioreach_graph_info *info;
 	int ret;
 
-	mutex_lock(&apm->lock);
-	info = idr_find(&apm->graph_info_idr, graph_id);
-	mutex_unlock(&apm->lock);
+	scoped_guard(mutex, &apm->lock)
+		info = idr_find(&apm->graph_info_idr, graph_id);
 
 	if (info) {
 		*found = true;
@@ -48,9 +47,8 @@ static struct audioreach_graph_info *audioreach_tplg_alloc_graph_info(struct q6a
 
 	INIT_LIST_HEAD(&info->sg_list);
 
-	mutex_lock(&apm->lock);
-	ret = idr_alloc_u32(&apm->graph_info_idr, info, &graph_id, graph_id, GFP_KERNEL);
-	mutex_unlock(&apm->lock);
+	scoped_guard(mutex, &apm->lock)
+		ret = idr_alloc_u32(&apm->graph_info_idr, info, &graph_id, graph_id, GFP_KERNEL);
 
 	if (ret < 0) {
 		dev_err(apm->dev, "Failed to allocate Graph ID (%x)\n", graph_id);
@@ -82,9 +80,8 @@ static struct audioreach_sub_graph *audioreach_tplg_alloc_sub_graph(struct q6apm
 		return ERR_PTR(-EINVAL);
 
 	/* Find if there is already a matching sub-graph */
-	mutex_lock(&apm->lock);
-	sg = idr_find(&apm->sub_graphs_idr, sub_graph_id);
-	mutex_unlock(&apm->lock);
+	scoped_guard(mutex, &apm->lock)
+		sg = idr_find(&apm->sub_graphs_idr, sub_graph_id);
 
 	if (sg) {
 		*found = true;
@@ -98,9 +95,10 @@ static struct audioreach_sub_graph *audioreach_tplg_alloc_sub_graph(struct q6apm
 
 	INIT_LIST_HEAD(&sg->container_list);
 
-	mutex_lock(&apm->lock);
-	ret = idr_alloc_u32(&apm->sub_graphs_idr, sg, &sub_graph_id, sub_graph_id, GFP_KERNEL);
-	mutex_unlock(&apm->lock);
+	scoped_guard(mutex, &apm->lock)
+		ret = idr_alloc_u32(&apm->sub_graphs_idr, sg,
+				&sub_graph_id, sub_graph_id,
+				GFP_KERNEL);
 
 	if (ret < 0) {
 		dev_err(apm->dev, "Failed to allocate Sub-Graph Instance ID (%x)\n", sub_graph_id);
@@ -124,9 +122,8 @@ static struct audioreach_container *audioreach_tplg_alloc_container(struct q6apm
 	if (!container_id)
 		return ERR_PTR(-EINVAL);
 
-	mutex_lock(&apm->lock);
-	cont = idr_find(&apm->containers_idr, container_id);
-	mutex_unlock(&apm->lock);
+	scoped_guard(mutex, &apm->lock)
+		cont = idr_find(&apm->containers_idr, container_id);
 
 	if (cont) {
 		*found = true;
@@ -140,9 +137,10 @@ static struct audioreach_container *audioreach_tplg_alloc_container(struct q6apm
 
 	INIT_LIST_HEAD(&cont->modules_list);
 
-	mutex_lock(&apm->lock);
-	ret = idr_alloc_u32(&apm->containers_idr, cont, &container_id, container_id, GFP_KERNEL);
-	mutex_unlock(&apm->lock);
+	scoped_guard(mutex, &apm->lock)
+		ret = idr_alloc_u32(&apm->containers_idr, cont,
+				&container_id, container_id,
+				GFP_KERNEL);
 
 	if (ret < 0) {
 		dev_err(apm->dev, "Failed to allocate Container Instance ID (%x)\n", container_id);
@@ -167,9 +165,8 @@ static struct audioreach_module *audioreach_tplg_alloc_module(struct q6apm *apm,
 	struct audioreach_module *mod;
 	int ret;
 
-	mutex_lock(&apm->lock);
-	mod = idr_find(&apm->modules_idr, module_id);
-	mutex_unlock(&apm->lock);
+	scoped_guard(mutex, &apm->lock)
+		mod = idr_find(&apm->modules_idr, module_id);
 
 	if (mod) {
 		*found = true;
@@ -180,15 +177,17 @@ static struct audioreach_module *audioreach_tplg_alloc_module(struct q6apm *apm,
 	if (!mod)
 		return ERR_PTR(-ENOMEM);
 
-	mutex_lock(&apm->lock);
-	if (!module_id) { /* alloc module id dynamically */
-		ret = idr_alloc_cyclic(&apm->modules_idr, mod,
-				       AR_MODULE_DYNAMIC_INSTANCE_ID_START,
-				       AR_MODULE_DYNAMIC_INSTANCE_ID_END, GFP_KERNEL);
-	} else {
-		ret = idr_alloc_u32(&apm->modules_idr, mod, &module_id, module_id, GFP_KERNEL);
+	scoped_guard(mutex, &apm->lock) {
+		if (!module_id) { /* alloc module id dynamically */
+			ret = idr_alloc_cyclic(&apm->modules_idr, mod,
+					       AR_MODULE_DYNAMIC_INSTANCE_ID_START,
+					       AR_MODULE_DYNAMIC_INSTANCE_ID_END, GFP_KERNEL);
+		} else {
+			ret = idr_alloc_u32(&apm->modules_idr, mod,
+					&module_id, module_id,
+					GFP_KERNEL);
+		}
 	}
-	mutex_unlock(&apm->lock);
 
 	if (ret < 0) {
 		dev_err(apm->dev, "Failed to allocate Module Instance ID (%x)\n", module_id);
@@ -966,7 +965,7 @@ static int audioreach_widget_unload(struct snd_soc_component *scomp,
 
 	cont = mod->container;
 
-	mutex_lock(&apm->lock);
+	guard(mutex)(&apm->lock);
 	idr_remove(&apm->modules_idr, mod->instance_id);
 	cont->num_modules--;
 
@@ -997,8 +996,6 @@ static int audioreach_widget_unload(struct snd_soc_component *scomp,
 		}
 	}
 
-	mutex_unlock(&apm->lock);
-
 	return 0;
 }
 
@@ -1106,9 +1103,8 @@ static void audioreach_connect_sub_graphs(struct q6apm *apm,
 {
 	struct audioreach_graph_info *info;
 
-	mutex_lock(&apm->lock);
-	info = idr_find(&apm->graph_info_idr, m2->graph_id);
-	mutex_unlock(&apm->lock);
+	scoped_guard(mutex, &apm->lock)
+		info = idr_find(&apm->graph_info_idr, m2->graph_id);
 
 	if (connect) {
 		info->src_mod_inst_id = m1->module_instance_id;
@@ -1130,9 +1126,8 @@ static bool audioreach_is_vmixer_connected(struct q6apm *apm,
 {
 	const struct audioreach_graph_info *info;
 
-	mutex_lock(&apm->lock);
-	info = idr_find(&apm->graph_info_idr, m2->graph_id);
-	mutex_unlock(&apm->lock);
+	scoped_guard(mutex, &apm->lock)
+		info = idr_find(&apm->graph_info_idr, m2->graph_id);
 
 	if (info->dst_mod_inst_id == m2->module_instance_id &&
 	    info->src_mod_inst_id == m1->module_instance_id)
-- 
2.43.0


