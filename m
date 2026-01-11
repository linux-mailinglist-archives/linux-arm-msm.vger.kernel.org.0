Return-Path: <linux-arm-msm+bounces-88383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 484B7D0E6B4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 10:01:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E76E7303CF7C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 08:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E512D0C89;
	Sun, 11 Jan 2026 08:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="TbIRsjFK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386DD2BDC35
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 08:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768121963; cv=none; b=L/128Wlwrh337mFVBnRiWTJiHP4PdT4TPMTSl8uJfBnV1hKWZfHeZwk2XB7VkBDL7YeUFNrl0teEF8zfl+/A2gaqjY+L8TVxUyZSiXhOaGEJd/bbRWBvZjsRzYDL7t3rrNC4KMBQIC9npC5urMMAN2XByQrsUeu/mLvkvl5tjNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768121963; c=relaxed/simple;
	bh=h9IWpu7Ow8BbONXtv5zfWZZnC+10BVWHC0hrE8HHzFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NbHCw4OPCNpGsT3QPcfi+7JTXyrHiTiQTpo+tpNSfvTZX2zXY+cAofOBlra4KcrgRlupk1yhwArxok0XKrRnIqTJL9akMOOICyWEgiYv/rRoxc9P3PqBDdOaYvrT9IW1HShyM3brsSZr/crFn4Re+YkRaBgorxJ6B7DCWbTL9Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=TbIRsjFK; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1768121960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6r0KzT5GOYlhHk9M8XajarJsUTOnbmhoA8VdKS4fQ3k=;
	b=TbIRsjFKrE+PCIIyI5EzgqyzxxvBeI/3nAnHykOFS1IyTr97guQbugwCqThTtsQhmjgQ1+
	dxtczo2WagiCxSi0+R3Rd72L5EIYSDvBpWEs/NPu3/CW95NkA6AlTy6uZh6QhQjbJmX5nn
	lTbD9PfEq46QGXotAzLmaycwtZ8NEE5uD3thy1x5A/LhbznRYhi+MCN7J/5M7Ff4IH4cmw
	KQRmQXfKclkyhlQ5DRjDbgYk+7/3fvlD2ZUG3HAi92tVu8zP26qmoEWDlmtKYj5HzNHoWM
	My3Yk6oWpy2PPgKUTWEFvmDBTU3l7qswhHhdXmjxCtJSrLbOYJ6WD3zDFOLYKA==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Val Packett <val@packett.cool>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] firmware: qcom: scm: Allow QSEECOM on ECS LIVA QC710
Date: Sun, 11 Jan 2026 05:35:13 -0300
Message-ID: <20260111085726.634091-7-val@packett.cool>
In-Reply-To: <20260111085726.634091-2-val@packett.cool>
References: <20260111085726.634091-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Allow this machine to access efivars through qseecom/uefisecapp.

Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 1ced6022c716..3b5742193738 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2007,6 +2007,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "dell,inspiron-14-plus-7441" },
 	{ .compatible = "dell,latitude-7455" },
 	{ .compatible = "dell,xps13-9345" },
+	{ .compatible = "ecs,liva-qc710" },
 	{ .compatible = "hp,elitebook-ultra-g1q" },
 	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "huawei,gaokun3" },
-- 
2.51.2


