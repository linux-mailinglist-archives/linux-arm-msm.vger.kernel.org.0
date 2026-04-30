Return-Path: <linux-arm-msm+bounces-105399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJexOXyH82kY4wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 18:46:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D60294A5F63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 18:46:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3F66E300ED8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 16:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F641337BAC;
	Thu, 30 Apr 2026 16:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="UlYRivl5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069D83502A7;
	Thu, 30 Apr 2026 16:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777567611; cv=none; b=h/ia/BB0sEgZappAdO30kBOemL/Ajn57AhgTdRAz13gkMlnzeDAn/a0vd/ewd9bqQCm/69CdOiKDMEgJ1YMnmLXLFZflD2PW5jDIE7+qfEx7JMl0lJnsRA1sRi6lwRn8telLz+6pGSrjYuC5j+4O1uLc1HZeSa3fbqi3zdO1pRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777567611; c=relaxed/simple;
	bh=hZ5BOEdIjQlRicH4k5l+Kunm1iR1aAUDSBi+7KacEP0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dEBe4WCHqCClgfa3+rvcJoW+YjnToQZgHOZ2rIaCy5z92rivf5S40FaYrtmRt+8SuEOZ8z5N+5U6FvIJjl4yVnvVzimhUdayJr1j7isCP6qWEL7N6HuaXCRCY6UGHa+8uYNdFfmegPUmihRzil46r04ueQeDbf5sIHYq5C1nJ24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=UlYRivl5; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=j/
	TN/sU2SeyLWF88svOm2fJwSQECH2WOcEkvYKP5mE0=; b=UlYRivl5PRPN0RnQgS
	apwtnEeuoS/v4htzI6LuAGUZ8b0J3FahGD4DZhAKSp5Ox68WP6p8ifbYbNzaMEmK
	+wvTs+AzQ1yPFtQUg+VMx0Xl97RHx4a8GJHMFnVWDE/zyvRbZ4dw9i1t2VUBzoTk
	3m3Q8SSwCpn/bwm7fsQse/A6E=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDHWJ46h_NpWWQZCg--.13259S2;
	Fri, 01 May 2026 00:45:47 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: will@kernel.org,
	robin.murphy@arm.com,
	joro@8bytes.org
Cc: iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH 0/2] iommu/arm-smmu: Use FIELD_MODIFY() for bitfield operations
Date: Fri,  1 May 2026 00:45:43 +0800
Message-Id: <20260430164545.49637-1-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDHWJ46h_NpWWQZCg--.13259S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jry3Cw4xKF4kurW3XFW8WFg_yoW3JFXEk3
	48Aa93t3Z7AFyayF1FgF17Jr1kC3y7ur1DArsYqas3t34DXr15WFsaqF95Gw4xGF4Y9a4x
	t3Z0934fAF97ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRidbbDUUUUU==
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCwxtH6mnzhzsO+wAA3m
X-Rspamd-Queue-Id: D60294A5F63
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105399-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Replace open-coded bitfield modifications with the standard FIELD_MODIFY()
macro. This improves code readability and adds type/range checking without
functional changes.

FIELD_MODIFY() internally performs the same mask-clear + set operation but
eliminates repetitive boilerplate.

---
Hi, If the Maintainers think it's not necessary, please ignore it.
---

Hans Zhang (2):
  iommu/arm-smmu-qcom: Use FIELD_MODIFY()
  iommu/arm-smmu-v3: Use FIELD_MODIFY()

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c | 5 ++---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c    | 3 +--
 2 files changed, 3 insertions(+), 5 deletions(-)


base-commit: 3b3bea6d4b9c162f9e555905d96b8c1da67ecd5b
-- 
2.34.1


