Return-Path: <linux-arm-msm+bounces-115204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ehxsMG+WQmrb+AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 17:59:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 716EC6DD0B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 17:59:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=etehtsea.me header.s=sig1 header.b=ECzdoNyV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115204-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115204-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6FA0B308C484
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 15:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79E544A724;
	Mon, 29 Jun 2026 15:48:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound.st.icloud.com (p-east2-cluster1-host12-snip4-10.eps.apple.com [57.103.76.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AEE43636A
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 15:48:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748135; cv=none; b=l9B8gJZ6R1pTHF3Vh1D5RPsKkr/zWi3r3To2vsIs2dcG3DYZ7S6Xz6Iz9O6UEAB2WT69CeFkphC2fib/74oWPZbVoMQZYlMdSkd43XQouuWkOuZpIV8CKK9gVtdsRcwAa5ZwldB4oyUb0jaKW/WNirhsmr0WUvLdLogslfKR7zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748135; c=relaxed/simple;
	bh=Nv2Xbmn8R223NXCsTFqI7f59JxfMT0JXaaCOOYJ2TqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NiBBYXdwjA33llEJxuC895eCTxWiID8vDx8PRmt1X7pmYupMeUMIZL7KRtyGHimp6sK5/OnfQea9jRPFzgwqW3AlCkM+1PLw59KYc4qSFs+uV9KwjyFtQ1pImzDOVw99xzgNyKncaaBHgu1/QaFbepbgJhd/Ybr+O5sG/GN6xRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=ECzdoNyV; arc=none smtp.client-ip=57.103.76.63
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-6 (Postfix) with ESMTPS id 203741802091;
	Mon, 29 Jun 2026 15:48:49 +0000 (UTC)
X-ICL-RepId: 019f1411-aac1-7c75-9523-705f8db351fd
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQtJBEMGXAVeDU8dXA9fEhVdRV4MXgdyFU0dWxlEDlNeVB0TC1NWVwRcEEceUgocHVxYQQ4KWgNQUR1fAgoERwRbF0YDU0VBBBcRUAFYHlZeWhdeTUcfQE1iSQFaGVscQBdKbk1TDw8VTR1bGUQOU15UHRMAXg8PTAtIAVsHXQBJCE0HVQZZHEkJTgVAAkZfEVAUcwhDDloESh1SQ1oODFBNAUMICghHA00XXjJTBF8RUBY=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1782748133; x=1785340133; bh=wVm4n6U2mxb1jAMB2xT+3KE4DHy9V5nCLK9Uksr+Kr0=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=ECzdoNyV0W9I1Ui/SD0hD1vRrY0zO351vDF+5B4NdJS2qS+eVlVxZL6b6YTStAZngpL0LePM2vSA2tb4JJ0kutbM8qe+Z3okV+STnijohUeUBjRp1lRWz37raYF7srMMnug8fXQntNXrqp4lSwGKRNLWAF+RjNvCDVd8Umgq/926w+pEO6znTxNc6pvO2FpQxap4eq9nxyO6rOYq+qi8jNaHiCisbTJPa8IEAW0erOIEjpkmZgpxxLV3q/zqKsEkvWUd6yzvAmih9XgdEiS0Frv8LJn5BSl/togpCH0imJp4zEnSUNHHwEDiNf5sOr+DNjzH1x5+B1VeER0G+S7bbg==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-6 (Postfix) with ESMTPSA id 3DAE7180208F;
	Mon, 29 Jun 2026 15:48:46 +0000 (UTC)
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
Subject: [PATCH v6 4/4] firmware: qcom: scm: Allow QSEECOM on Honor Magicbook Art 14
Date: Mon, 29 Jun 2026 22:48:12 +0700
Message-ID: <20260629154812.9066-5-mail@etehtsea.me>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629154812.9066-1-mail@etehtsea.me>
References: <20260629154812.9066-1-mail@etehtsea.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: miJks0s18T5uiqsw0EX0qlS37YyaNgEM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEzMiBTYWx0ZWRfX+TLzV2REKoOw
 G858I/rw1+l4znWntk/bBb2YMFsOhYsleplEiPHB1RRhghq7EdfKER78oteuqfwIsovZzSEC57b
 7A/ee19z5vylwVKtqyCedkzzdIzdLyQPDFcvMD59jTWhtixIzTKChWK5K5Jjl23Az5eR28JB1lg
 SNrC6jeaHMHblQBMCNelyZx7kt1pEodS7kKXuh7LCfdBAh6of3sBAlRAJ0OpKx7f1qpCSXvCfMz
 qK2/aPADH5XOs27aLgoKYUxsMWGvYWdFAv7qP8swCCoPVWFKNM3076wO9j962VZW63Y6LZmKvg4
 rzWlSNn5aWSClERBFe3
X-Proofpoint-ORIG-GUID: miJks0s18T5uiqsw0EX0qlS37YyaNgEM
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[etehtsea.me:s=sig1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-115204-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[mail@etehtsea.me,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:valentin.manea@mrs.ro,m:mail@etehtsea.me,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[etehtsea.me];
	DKIM_TRACE(0.00)[etehtsea.me:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[etehtsea.me:dkim,etehtsea.me:email,etehtsea.me:mid,etehtsea.me:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 716EC6DD0B6

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


