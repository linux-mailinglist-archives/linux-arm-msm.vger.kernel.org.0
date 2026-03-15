Return-Path: <linux-arm-msm+bounces-97744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PxwNL4nt2m+NAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 22:42:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C38292ABF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 22:42:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EC1D3044820
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 21:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D307137CD25;
	Sun, 15 Mar 2026 21:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PytlC6sr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24762202F70
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 21:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773610933; cv=none; b=Rq73+5Z8k/bQFqWF2GffetFSv/s/2iXLkXX3fqJHU6iUfw/RBpKDrf+foOar+0Tz/uOujXZOagjaB3CxwA7TbNcNkoYrvXqQlv377RMMbKVQsNAbUarj8obpzT2Lp251dTzqD4xQh/CaIqhqyelwPxEM4YmAkLaZ9EnD1yHyHi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773610933; c=relaxed/simple;
	bh=l49tgpINxgLlt4RIwK+onaV/lm+OjQDLgCOi7+pmJQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AGKWBnxA3MeFcVEh3DXHux637EzJi9E2c74gSpqR3a0vsj/ap5t2Q1AMcBh2g2OQbMOmRShxL1OQoE5wKIRNLxnH3PAhbvXJsWBBsKRFfiZPeIU4bWUKowRC7sZyrwOCLKSW/RS3W/z154d7hNkTdyD6H6AeSvl264kXWzHh9Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PytlC6sr; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ae3a2f6007so29639865ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 14:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773610931; x=1774215731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QGzlmojAeYWZ15xUYmvWFth9QXCu+msLbAW7T3Gc0xU=;
        b=PytlC6sr+FRPibLnScYLnLPohLvZvsl+IAA3vdqPsblsxW9khBu1IqW5mimSbSyALL
         KdrexN9j1HyhRLF3Z4ZlaH29qYNqZ5vDxBDj1b/USo7+IzoC7pyp6N5alMWG1BwTG/X7
         5tiyk3pN71oEqO92Xhu8X4CrWfdkGUldn1o3oUUHXUN9yvkevLX1TGpjJqVrRIFKoHGJ
         C9KHu3y7Xlqx8sG7T7RF4tluyJw0//4x+nb5kK8kJIZgO+KwcZj/K3F6JPu/vUgO4BUE
         Sd8fhDbX8STp34hXxuukSuonOdylR0555wsitLq7eYxpEctqQZT4R98aIPoWT1Q/mxYh
         ezHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773610931; x=1774215731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QGzlmojAeYWZ15xUYmvWFth9QXCu+msLbAW7T3Gc0xU=;
        b=gkzR2Al6Nr8YtNAlk+Fe4A1t4pbK8TzbD2bg52v1DRRFgXlqysafFzH3ZybURFUgbH
         VEkzrmWlPqzvCNiyiRxov48zkUleotokseqdsVGhu3sxPcJlOez3qY7UecUjibbwz53L
         rBgto72qUxxZPaCUY/ck63BYxHffPGiFXzjWY9rQR7NMNWA6PBU7TB15uBCAuQbnXbPx
         vjnEUxFwYolTwWLt1KU7VeS0NyyHQxCmw5OPHPBo1Jo2l8/Qe/ZWxf/7F6f1uiGsoLpa
         OpAXdNeKcm1rXLvHHdiXoN6GBrcyKSy3j+LRlollppp0n5RTbfG90ZL6VvnpQsMRAgz+
         ht4A==
X-Forwarded-Encrypted: i=1; AJvYcCUIEggak0gykMJjzDlBx/l3XGE6wpMS/CBRVidrB9o79qSzOiWtpIP2HGCoBF4j4mwm0vAgsBMW8F9CZ2Y3@vger.kernel.org
X-Gm-Message-State: AOJu0YzmvVHIl1vCvi6MEAm2wkfF3rYZMaEJQps/5sLpUZE8smRv9X6I
	o0+c6NBRlVcIB+NCdMXYqOLNJXGP9ZAQQuNgnGI1Rwevs/XDmee5U0D0
X-Gm-Gg: ATEYQzzD7b8kM5yhBMEGCxzb1EfjdQYJOhErc3wBmKwvDg+Y7h6oW+PE6QoIM5EgeYt
	nrgHB1EgsZioHseXeSmJH76x4/bCtJvC+cQqca3fIY3MTPpForYQ5WHBGTEDd2R2BBCSwV0BmgA
	CTYP00TilQiasWiFY1ct5kcT1sd33HozuOkoNuWFvqy3avyoamyfzUArk0HnFl/J1VWaq/z1YHY
	74EvtOddS4yU5+Lla4YRjc4WhvSNHokqs5tLgSlor7OEDctBn3DYfHihxsLyXtoFAi4f1+ifcQb
	BZjNefnpQNPSTZxEKcKW9qMKebNTK/rTam1edoKM2MZJK3h6EKYXV3ltrsnMddjIQuFFwneJfVn
	rT8oNicODm1SWapkVyn3oMI+UZy4jUcjCDDnvMrTa6IsXLkoyr/uLVJESjOsWel6+m9+Qhq1abb
	/j12BvAvQMKQN83peH3czwHBfqFoB9hMqPK11BHNHfz2E7SH8xsFNMaQk=
X-Received: by 2002:a17:902:d548:b0:2ae:5f65:171 with SMTP id d9443c01a7336-2aecab1ee59mr116748185ad.33.1773610931360;
        Sun, 15 Mar 2026 14:42:11 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece56c7b5sm94185815ad.9.2026.03.15.14.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 14:42:10 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-pm@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-msm@vger.kernel.org (open list:QUALCOMM CORE POWER REDUCTION (CPR) AVS DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] pmdomain: qcom: cpr: simplify main allocation
Date: Sun, 15 Mar 2026 14:41:53 -0700
Message-ID: <20260315214153.3682-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-97744-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 80C38292ABF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove kcalloc by using a flexible array member to combine allocations.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/pmdomain/qcom/cpr.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/pmdomain/qcom/cpr.c b/drivers/pmdomain/qcom/cpr.c
index 3ee8184e4be3..c30690ef6919 100644
--- a/drivers/pmdomain/qcom/cpr.c
+++ b/drivers/pmdomain/qcom/cpr.c
@@ -239,7 +239,6 @@ struct cpr_drv {
 	u32			gcnt;
 	unsigned long		flags;
 
-	struct fuse_corner	*fuse_corners;
 	struct corner		*corners;
 
 	const struct cpr_desc *desc;
@@ -247,6 +246,8 @@ struct cpr_drv {
 	const struct cpr_fuse *cpr_fuses;
 
 	struct dentry *debugfs;
+
+	struct fuse_corner	fuse_corners[];
 };
 
 static bool cpr_is_allowed(struct cpr_drv *drv)
@@ -1600,19 +1601,15 @@ static int cpr_probe(struct platform_device *pdev)
 	if (!data || !data->cpr_desc || !data->acc_desc)
 		return -EINVAL;
 
-	drv = devm_kzalloc(dev, sizeof(*drv), GFP_KERNEL);
+	drv = devm_kzalloc(dev,
+			struct_size(drv, fuse_corners, data->cpr_desc->num_fuse_corners),
+			GFP_KERNEL);
 	if (!drv)
 		return -ENOMEM;
 	drv->dev = dev;
 	drv->desc = data->cpr_desc;
 	drv->acc_desc = data->acc_desc;
 
-	drv->fuse_corners = devm_kcalloc(dev, drv->desc->num_fuse_corners,
-					 sizeof(*drv->fuse_corners),
-					 GFP_KERNEL);
-	if (!drv->fuse_corners)
-		return -ENOMEM;
-
 	np = of_parse_phandle(dev->of_node, "acc-syscon", 0);
 	if (!np)
 		return -ENODEV;
-- 
2.53.0


