Return-Path: <linux-arm-msm+bounces-105522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJMlOmHP9GkYFQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 18:05:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 843494ADE97
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 18:05:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A44673074706
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 15:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF5E3D9027;
	Fri,  1 May 2026 15:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b="MbZ8bBYI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound.pv.icloud.com (pv-2001i-snip4-5.eps.apple.com [57.103.64.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA4D3D891B
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 15:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.64.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777651028; cv=none; b=aDtqosAx6UreTuYvQD5bX1QDjkrrFACquLOudChw6tmkoGWm+GkLdNJ/YQV67RebCnRY1hxV6fLUs5UuzXvsk+ES1jcEbzNVZv9OTJMAyA3R3UuS55uUNQPy2n/KN+zCnJFYrPkrMEMe6IlZ931Z87uOJ2FbXBC1bjvYzWLqGJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777651028; c=relaxed/simple;
	bh=Foqr1TEYydQPTVHX9hbe27AqiF2A/ZyrSuZ5WBkdl6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jYgKA5Id/sW5ZAljiN9CoOGHjNg1kz41sZuUcUnqOeBWHeBbERtN9vOXP5kwjBgQs4U5DRfSbKLzHEY5Mr9H7rV0//jF/R+TcDL/4wnKOuv0S9GKaQhg1O223D7r79xyKeYx9mtVFyvDsy9tazIvuqlhJTUhXS4v1dFfzUUgWMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=MbZ8bBYI; arc=none smtp.client-ip=57.103.64.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etehtsea.me
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-10-percent-2 (Postfix) with ESMTPS id 9511618000AB;
	Fri, 01 May 2026 15:57:03 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQ5AHVwDWxxBAFYHXxcOVk1UGVoBdw5GFVEMQAhWRV8VGR5XUFoKWxx5HUcIXx9BFVhWXggXGVFNAFhbCFsEDx9MDFECQgVWXkkOHQRUB10FXVZQAlpLQgRLRWhcBVwcQBdIHV9qS1YUBB1HCF8fQRVYVl4IFwZbFAREAV0FXQJFCUkCWAJdA0IXTQdUB0YHXVQZWgF3DkYVUQxACFZFXxUHWEcURw4PE0wLRwJaNFYfVBlaAw==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1777651026; x=1780243026; bh=Ykz/VTtZzmbcUJrh9j9DcbDYlLp1VHdB/J99ELSuML4=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=MbZ8bBYI5zNr1IPMxVfLwofERR1ikFiglZGZb9M8x9DTUxJgFu4P3XEmlcnK7i8WG+4WTE9jmeUk1g7qic0moe6eqHG9kCjpFby7uSW4vx2Zrv3OMfq0M5E+YpqqP7SbK6MJDjCw3Yv5Ptm4E2PBW2chnd8liEWDMxo/Wj5WFs6SN8kTqq2OODUxuT/tWjEmrky7Bs1pESOIBMzsj+8/rx6gcbMOe7+6Z2kUV0QIQDok1I+TiQia3Ro1ATeftSCuzEmkYIIVNj+LnfeZ6GONxOCchnrPQtvXubQWxumsul5jJtqfXFO3muy6Db+lgU+nZpe6l5nWMj06OR5eh+8hUQ==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-10-percent-2 (Postfix) with ESMTPSA id 20DD71800177;
	Fri, 01 May 2026 15:57:01 +0000 (UTC)
From: Konstantin Shabanov <mail@etehtsea.me>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Konstantin Shabanov <mail@etehtsea.me>
Subject: [PATCH 4/4] firmware: qcom: scm: Allow QSEECOM on Honor Magicbook Art 14
Date: Fri,  1 May 2026 22:56:12 +0700
Message-ID: <20260501155612.5490-5-mail@etehtsea.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260501155612.5490-1-mail@etehtsea.me>
References: <20260501155612.5490-1-mail@etehtsea.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Info-Out: v=2.4 cv=PbzyRyhd c=1 sm=1 tr=0 ts=69f4cd50
 cx=c_apl:c_pps:t_out a=azHRBMxVc17uSn+fyuI/eg==:117
 a=azHRBMxVc17uSn+fyuI/eg==:17 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=qmbtgXoD8pYXKSWWfe0A:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE1NiBTYWx0ZWRfX0n6qsBv2k8Lc
 n5QMuQwsdzPXnWYbYBdJLB9KhU+ccx+U5PUywIU0pXVEX0TrqBzZRE25xkPHg8+PcAIgk6uSqb5
 KfJYH4yrumPSdNSTgzvEPL1oreVrbh5L3Klr7FdC4CB/zEOD+9sirIvSUxrjsUcZG12QbzZULU9
 wl1HBzsmg9J19yIMG4YVfW1bbyH53uiTHsc1kzgl8aYDXCsHsAMaNesJqmN2ptor19gZS3GVIDd
 lpWbBqnLW56ivDxnTfgEe+AENTeOKmwIryp2AC3l+26qn+YZiEz9N0Bcl0Is0uoJ0kapTXKs6ji
 hA6nAaEhlAr9DTdQ2iV6qsfCoEgKxqw9QTCcnWTWdybUXN4kZM3VmSjE0vzcyY=
X-Proofpoint-GUID: cDw0i3LZxCABDQYvV6-EoojENUj2gk4J
X-Proofpoint-ORIG-GUID: cDw0i3LZxCABDQYvV6-EoojENUj2gk4J
X-Rspamd-Queue-Id: 843494ADE97
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[etehtsea.me:s=sig1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105522-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[etehtsea.me];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[etehtsea.me:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[mail@etehtsea.me,linux-arm-msm@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,etehtsea.me:email,etehtsea.me:dkim,etehtsea.me:mid]

Allow particular machine accessing eg. efivars.

Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 9b06a69d3a6d..2d6dc99c9567 100644
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
2.53.0


