Return-Path: <linux-arm-msm+bounces-114218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pdgnCk2IOmrm/AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 15:21:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAB56B76A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 15:21:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=163.com header.s=s110527 header.b=PuT1RqsY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114218-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114218-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=163.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D476C30439A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 13:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E32431DDBB;
	Tue, 23 Jun 2026 13:20:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47DA313543;
	Tue, 23 Jun 2026 13:20:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782220842; cv=none; b=Pcs+mqhGcxEd3DZWUg62Ha9qpIgcanNVI8PuoX/QI90nMJfVK+RNp7qeYXeuYvPoK+RSqythX80UUCHF7DdnEw9sIS1uHNL/BmX/1xBPVECFE/hxe7Ul8rD1LCRSFjxoJb8/EmBsDC/EjI65bn6NeTx1ttfZyu8yPQUXpYTNOKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782220842; c=relaxed/simple;
	bh=lnFEBwBLYEyDhXYWSp4bmV8exXrVHzF9WjvitZhZXoA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FlHJPXlSf+AdOsckGZks9SXVy1KpDqUTCOhZo++zo7GcXwNVF933ImCzIOCemf+FJ01ICXsXLZ22MdVNJ6Cim8D2ps/DwT9Shi5cXwHlPxpRoaTulOG5UR+vfhjvosF+6LPrmWYyAWyg9Mhpfzy1IyaQc2Mw3Rgurkrge+xwsj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=PuT1RqsY; arc=none smtp.client-ip=220.197.31.4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=d+
	EkAXSkXJaFfwL6xZ/6B+MeTA8cWIbxfbUkq1sHGh0=; b=PuT1RqsYQnOjdI13nG
	aGyCs0ildz67/w2lZMEGAB7enDA7ubw0lb9+FMkIlTlDDuTT60cvGOmm9hawZl68
	Zr0SsdYIWD42gVrXMUQQtq/6inXZy5Ht+YOJzTaZBdDpImF1fJgs3SjfwaME4azb
	zGsEStaww/8Ov2ny+TP54d/8g=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wBHTssQiDpqXX4dFQ--.52045S2;
	Tue, 23 Jun 2026 21:20:18 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	djakov@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Subject: [PATCH] remoteproc: qcom: q6v5: Release QMP handle on ICC path failure
Date: Tue, 23 Jun 2026 21:20:15 +0800
Message-Id: <20260623132015.2243317-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBHTssQiDpqXX4dFQ--.52045S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruw18Xr1DZFyrWr47tFW7twb_yoWkXwbE9F
	Z29rs7Xr10kFykZw12yFWayFWfJw4xXwn7GF4Yq3WagrZ8Xr4fGryDXFsa93yfuw45WFW5
	GrnIqF43ZF1xCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_89NUUUUUU==
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7RJPvWo6iBJd6gAA3w
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,163.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114218-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:djakov@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:haoxiang_li2024@163.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[haoxiang_li2024@163.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[haoxiang_li2024@163.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4EAB56B76A9

qcom_q6v5_init() acquires the QMP handle before getting the
interconnect path. If devm_of_icc_get() fails, the function
returns without releasing the QMP handle, leaking the device
reference acquired by qmp_get().

Release the QMP handle on the interconnect error path before returning.

Fixes: 8d9be5c6bdcd ("remoteproc: qcom: q6v5: Add interconnect path proxy vote")
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/remoteproc/qcom_q6v5.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index 58d5b85e58cd..b57041a37d28 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -347,9 +347,11 @@ int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
 	}
 
 	q6v5->path = devm_of_icc_get(&pdev->dev, NULL);
-	if (IS_ERR(q6v5->path))
+	if (IS_ERR(q6v5->path)) {
+		qmp_put(q6v5->qmp);
 		return dev_err_probe(&pdev->dev, PTR_ERR(q6v5->path),
 				     "failed to acquire interconnect path\n");
+	}
 
 	return 0;
 }
-- 
2.25.1


