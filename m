Return-Path: <linux-arm-msm+bounces-105397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIWJAmOI82mS4wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 18:50:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F05534A603B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 18:50:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A32E3051CAD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 16:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D169133F597;
	Thu, 30 Apr 2026 16:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="mxSKAux+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C1F3019D6;
	Thu, 30 Apr 2026 16:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777567594; cv=none; b=Bs7bqUixHxsB797EFkyETXmJH98y6qre9tBSU5QSmnVDVwRwR84kM7tYiwMvh8+0KMpIJV7GpBZN+IAkbXNS5P2mIDHqmgLga5XSuQaNpHAmhI0BXomyDqd9gmHwjc/yxwzqTjsWjE5Dtf4f2DtCC2ER050oLnJO6MEp34wpfgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777567594; c=relaxed/simple;
	bh=KkFAJcN56DdQ7LkM/e3q+BhecPH3iZWC64JcXBWs4MU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cfitndV7cIQg30OKazW5BqoRizDd+HltEByRO5PiBBJx/LZd0TOY0rwHETY/Vk29FisD4J1ZL9GLIwt8VkTEnzOYOUVgdpCKiDkM5LMi48jC2/40ypFi8xOF2gV0TdHhYLA7RHpM0NuWUqVwIBaSEJGv9iSkYHYwZvIRVvMkXZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=mxSKAux+; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=tY
	VXjXirmIZR6ZQ1E8Pp2rDSwH80Wsd508YTDXQA1gI=; b=mxSKAux+VowD81jPvF
	oC/9AUlsMcakNJ7xs19RLjcAQ/f7AqLKohf/7DnQRph+7/J7jfjydJTA0Gu3quXE
	QTJODTzgH+C25SZV/h6o5AhpMjMdQaoP2XDwTkXQE0AtoI8NAu2jU2Q5E4h8czxt
	gj9L4nyZeJePP8IR/d6R/ikLU=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDHWJ46h_NpWWQZCg--.13259S4;
	Fri, 01 May 2026 00:45:48 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: will@kernel.org,
	robin.murphy@arm.com,
	joro@8bytes.org
Cc: iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 2/2] iommu/arm-smmu-v3: Use FIELD_MODIFY()
Date: Fri,  1 May 2026 00:45:45 +0800
Message-Id: <20260430164545.49637-3-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260430164545.49637-1-18255117159@163.com>
References: <20260430164545.49637-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDHWJ46h_NpWWQZCg--.13259S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7urW7uFyUWw4kXF45WryrtFb_yoW8Gr18pa
	yUGryY9rnrJ3Z3Ca9rXF47Z3s0g3Z5Ka48Kr45W39Yqr10k34UWrs3Kwn5Krs7CryxGF17
	uws2q3y5GF1UCrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi3fHbUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6xxI62nzhzwEWwAA3q
X-Rspamd-Queue-Id: F05534A603B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105397-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,lists.infradead.org,163.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[18255117159@163.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Use FIELD_MODIFY() to remove open-coded bit manipulation.
No functional change intended.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
index ddae0b07c76b..b62e91e4781d 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c
@@ -330,8 +330,7 @@ static int arm_vsmmu_convert_user_cmd(struct arm_vsmmu *vsmmu,
 	case CMDQ_OP_TLBI_NH_VAA:
 	case CMDQ_OP_TLBI_NH_ALL:
 	case CMDQ_OP_TLBI_NH_ASID:
-		cmd->cmd[0] &= ~CMDQ_TLBI_0_VMID;
-		cmd->cmd[0] |= FIELD_PREP(CMDQ_TLBI_0_VMID, vsmmu->vmid);
+		FIELD_MODIFY(CMDQ_TLBI_0_VMID, &cmd->cmd[0], vsmmu->vmid);
 		break;
 	case CMDQ_OP_ATC_INV:
 	case CMDQ_OP_CFGI_CD:
@@ -340,8 +339,7 @@ static int arm_vsmmu_convert_user_cmd(struct arm_vsmmu *vsmmu,
 
 		if (arm_vsmmu_vsid_to_sid(vsmmu, vsid, &sid))
 			return -EIO;
-		cmd->cmd[0] &= ~CMDQ_CFGI_0_SID;
-		cmd->cmd[0] |= FIELD_PREP(CMDQ_CFGI_0_SID, sid);
+		FIELD_MODIFY(CMDQ_CFGI_0_SID, &cmd->cmd[0], sid);
 		break;
 	}
 	default:
-- 
2.34.1


