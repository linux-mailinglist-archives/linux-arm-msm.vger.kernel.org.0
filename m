Return-Path: <linux-arm-msm+bounces-114791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Wwx4Hr9bQWp1oAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 19:37:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D206D48FC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 19:37:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=etehtsea.me header.s=sig1 header.b="ED/Qelnm";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114791-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114791-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7FE51300C264
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 17:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 298082F8EA3;
	Sun, 28 Jun 2026 17:37:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound.qs.icloud.com (qs-2004c-snip4-4.eps.apple.com [57.103.84.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F020F2D97A6
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 17:36:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782668221; cv=none; b=XYxg7PIZ6Fbk9XHG4IifedDM+4fmn/lTNNpzOKhc1SKlnG5l+Ll8nGUedLtGG4bs01hPaWKCz6siiZP2AOtk1ewD4xmjwas7bZfiw7ibHKw1rTUrj7sQZWrEKZvA3Ao2YlgSH7/Kv8LLgX4d85mgJZNmSOUD1Mcq2NZ+APY+E3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782668221; c=relaxed/simple;
	bh=Nv2Xbmn8R223NXCsTFqI7f59JxfMT0JXaaCOOYJ2TqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BaSPQ0R610TsHh/0CRQd0Nj/4YKSgTymj3MILyPpjhQmKeE6VIk32XkCmCldEq0gT7gkLBKcJvY0v7q3xA4CoGik0iwakZSdgDvIOmB0Ex49nO+972JgQNJ1R2BBs5uFhTjTkq1+Lan4ZmIbhiGqoEBpKl9pLWioiXPGC1kaU7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=ED/Qelnm; arc=none smtp.client-ip=57.103.84.27
Received: from outbound.qs.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-2d-100-percent-0 (Postfix) with ESMTPS id 6EA6D1800096;
	Sun, 28 Jun 2026 17:36:56 +0000 (UTC)
X-ICL-RepId: 019f0f4e-4828-730e-8b4a-1a28c5517ca8
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQtJBEMGXAVeDU8dXA9fEhVdRV4MXgdyFU0dWxlEDlNeVB0TC1NWVwRcEEceUgocHVxYQQ4KWgNQUR1fAgoERwRbF0YDU0VDAxcRUAFYHlZeWhdeTUcfQE1iSQFaGVscQBdKbk1TDw8VTR1bGUQOU15UHRMAXg8PTAtIAVsHXQBICE8BWwNbHEIKSQVaGl4fHVgRXy1SH1cYTQtWDBkGV04ZDEodUlZRBUoMXABoD10dWBFd
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1782668219; x=1785260219; bh=wVm4n6U2mxb1jAMB2xT+3KE4DHy9V5nCLK9Uksr+Kr0=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=ED/QelnmO1uknZR/5phPGa6fTf1v/AvR0JgIfBbHzBi6qpuWC6T58ASrKLdMwlPqIyU51a8wnCETYT822FHsMcvmowDO8C096y9dQv366M7Q5zp1DIvRhwavlTKANpRZOWa9WpEmjAqPV2GJb4Mlcjiw8minL70IoiJNUG810NmrUBbIhsJMUg57B9pECUvqv1dGNQhtHbKAwJYmR9oLWE8TYRAtMQySxzCkRccC+4jalBxpTts+dQsUmBf3DJSZ/VQl5+XaH8BYtHgZsHN8BCwft9fH4KDx3QkO6tsmOJgS2iRFtk3Ina7i/bwHAj7Rv7D7xdgKB1cwVvDWXaXX1w==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.57.155.37])
	by p00-icloudmta-asmtp-us-east-2d-100-percent-0 (Postfix) with ESMTPSA id 2B2FC1874946;
	Sun, 28 Jun 2026 17:36:54 +0000 (UTC)
From: Konstantin Shabanov <mail@etehtsea.me>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	valentin.manea@mrs.ro,
	Konstantin Shabanov <mail@etehtsea.me>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 4/4] firmware: qcom: scm: Allow QSEECOM on Honor Magicbook Art 14
Date: Mon, 29 Jun 2026 00:26:40 +0700
Message-ID: <20260628172640.23167-5-mail@etehtsea.me>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628172640.23167-1-mail@etehtsea.me>
References: <20260628172640.23167-1-mail@etehtsea.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDE1OCBTYWx0ZWRfXyprtNsJ0XA6K
 6OEiHS9QafYeE51hwjo8Q9qtGWtVRAxWDpfkJq4gNO42qSccQNtVqqUzpCNN59ZkRNhEXfMUTJe
 mumMtvVSaf1dEp0UYES5h3zevh0YRBdkIXI91OdOyrXNDHlA94oNi5P+P1VvoqQW0EFSbOSDj0c
 X/BthoVQiyuWXZsQjcxzq8jkm+b8mBPLCO2cbFfm8YuSH78cx2jI+wKxKjMsHW7J8Q3DhokmDSH
 L7jdgsPeWLBKr6xaGENnrlmWU2f3ps+4gJQyDsfI/fExuCt/gcKOkY5+U+fINXJKmrWwTEMw9/t
 uwUOXRBcgLc11RkHZqB
X-Proofpoint-GUID: iDxFxfNYfu74ewQfhKSij8tVjgBx-1qy
X-Proofpoint-ORIG-GUID: iDxFxfNYfu74ewQfhKSij8tVjgBx-1qy
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[etehtsea.me:s=sig1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114791-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[mail@etehtsea.me,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:valentin.manea@mrs.ro,m:mail@etehtsea.me,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[etehtsea.me];
	DKIM_TRACE(0.00)[etehtsea.me:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mail@etehtsea.me,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E1D206D48FC

Allow particular machine accessing eg. efivars.

Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 6b601a4b89db..b6f7c567d4a8 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2295,6 +2295,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "dell,latitude-7455" },
 	{ .compatible = "dell,xps13-9345" },
 	{ .compatible = "ecs,liva-qc710" },
+	{ .compatible = "honor,magicbook-art-14-snapdragon" },
 	{ .compatible = "hp,elitebook-ultra-g1q" },
 	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "huawei,gaokun3" },
-- 
2.54.0


