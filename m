Return-Path: <linux-arm-msm+bounces-65114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE30B06A96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 02:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 606841A65504
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 00:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F28C913D891;
	Wed, 16 Jul 2025 00:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="K+H4ziB4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34AC134BD
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 00:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752625945; cv=none; b=HYyPKbUh0l4ZkGAghW4QX4/ts69/Q1J8C++jJjreqkK+j2OO8pl4pA9mj97lIhjl2RmTRQe67W7S6l2HfF50WEfKnjiOyzHa0IvL+QOftqBH72CnC4JjhiNsmJ3TwqRxmFOAAsKHhoTd0A/joTSUlgP3FsGussdZpQ1O7eue3wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752625945; c=relaxed/simple;
	bh=9Ceolq8AP3d8rH/OKiM6PhtgJcoQeJ+MKq9cjBGth50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rKnKBRY0rI89I9JQVUQtXIqzSsZMlRH11O8+Trv2b1AFtSlRykwwbQSGiZvnamOqVWRiAqDuCq3YOfuEOO6IGMzwXJFER/FiAmaRsSHin6+9GwDOddabXaThxXYZvq+z5FdZ1bO5rvzhsbzlXZlAMy3OIjojkAvkvgwrt8piSto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=K+H4ziB4; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1752625941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BwCugn5u90+WMfoMR0l5YYNJvPYfNo3/q201uj5ReAo=;
	b=K+H4ziB40n6bvov2bO0iVxqrrnil9DqppbuYfLogYQyMvO+UXn7Poe9GeINK/UCzOj+Bix
	N8yJbZKli53ywgXo3TA3xybljEnnj5IUqVP16H8Y3b8UfcxoAVBrURI1A6HtDebGgwzBmT
	Jm/cA+UrJUzT+LQ8Fq19WbDKuPEVKoxAFkd+A0CVVM0erR4vFh0YjPjeIMoCOJTz77EFiZ
	Qo4cX/AlpuJVBPf4sVE23ZPEHBP5OVNklPmWY93I7fjRzWn95uFLwmLR2olcF22X3SOydV
	sjxEsjIHp7uX1EyyBtcLUHG/S4MZwCZWEpmvKC8olhk9vj3vtZ0kcmVK4FRzAg==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Val Packett <val@packett.cool>,
	Laurentiu Tudor <laurentiu.tudor1@dell.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/4] firmware: qcom: scm: Allow QSEECOM on Dell Inspiron 7441 / Latitude 7455
Date: Tue, 15 Jul 2025 21:27:00 -0300
Message-ID: <20250716003139.18543-5-val@packett.cool>
In-Reply-To: <20250716003139.18543-1-val@packett.cool>
References: <20250716003139.18543-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Allow these machines to access efivars through qseecom/uefisecapp.

Signed-off-by: Val Packett <val@packett.cool>
Reviewed-by: Laurentiu Tudor <laurentiu.tudor1@dell.com>
---
 drivers/firmware/qcom/qcom_scm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index f63b716be5b0..b001208fefe0 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1988,6 +1988,8 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "asus,vivobook-s15" },
 	{ .compatible = "asus,zenbook-a14-ux3407qa" },
 	{ .compatible = "asus,zenbook-a14-ux3407ra" },
+	{ .compatible = "dell,inspiron-14-plus-7441" },
+	{ .compatible = "dell,latitude-7455" },
 	{ .compatible = "dell,xps13-9345" },
 	{ .compatible = "hp,elitebook-ultra-g1q" },
 	{ .compatible = "hp,omnibook-x14" },
-- 
2.49.0


