Return-Path: <linux-arm-msm+bounces-113892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LQlRE7HTNmpOFQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2026 19:53:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC83B6A96DF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2026 19:53:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=etehtsea.me header.s=sig1 header.b=MbKf07YJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113892-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113892-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 068F93014414
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2026 17:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2796347BC1;
	Sat, 20 Jun 2026 17:53:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound.st.icloud.com (p-east2-cluster3-host8-snip4-10.eps.apple.com [57.103.77.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63A2348C6D
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Jun 2026 17:53:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781978014; cv=none; b=Z3i0N1OxZjsfxW1r0imALRqJElcHQ2SMt+J73vs6hOQl3RAIzwPpzsKlcgBaSqaTRfDX4IiY2VS18jPE1Ry3zpnp8S5xtxPMXxAxhW1k85ojnvba3BKxy3RhHAPWu+JbUceg/LJYHOxRtvDiypGvBPA7a7qkrmBLsPdjwFQ8iQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781978014; c=relaxed/simple;
	bh=Nv2Xbmn8R223NXCsTFqI7f59JxfMT0JXaaCOOYJ2TqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o6uu9TU15w4qrvxAVoQDgpIWeH7arJOsoou0yZ0qq9t2n51IoP4WUur+FvbwQssmvVchjuiZbIgGs2f7otY2Vfj/SooHUmsxvg2dR80n8d6L3Vn3pa89V2pWcns4LIIAG1Rr0T8GxU+P1gMfbKqLoCpwERp0Ut3ay6g1PmpGkJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=MbKf07YJ; arc=none smtp.client-ip=57.103.77.251
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-10-percent-2 (Postfix) with ESMTPS id 3386B1800187;
	Sat, 20 Jun 2026 17:53:31 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQ5AHVwDWxxBAFYHXxcOVk1UGVoBdw5GFVEMQAhWRV8VGR5XUFIfVxhNC1YMGQZXUEsbDlwHS1oVVRcOAkIfUB9MFldDRB8cGVoUXBhTRVEfVFhDGUVWaUELTx1dGVscQmRYVwkKDkYVUQxACFZFXxUZFVoJClcAQAtOA1sFWwNHDEoCXRlaC0UPSx5YGgZTGVU4VhlSA0YDXBkdAFJVEgRACFZQVB5BBFYVbAlYBlMZVw==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1781978012; x=1784570012; bh=wVm4n6U2mxb1jAMB2xT+3KE4DHy9V5nCLK9Uksr+Kr0=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=MbKf07YJFsEvpO7SqNWbe1+NDs4M1JSGQyA2utG0w7tDgIzKrIfS+mgsq5na3mPVc4RAaXHgveu4DMkeRGxgq/x4frLADu/3ZtTw1eKmXhDXvdgCkN7Tos4soTieEgq0rcV05u33JGTgrEGCPt8ZG6Y3lSlj7k7j9tFEt9IckFBub59o5kl6Q99yxieykrHJZiefBUrjC+b9F1j1TzSWhIkRkrJSec34TL936wMxBiYUqiba7FiK4fJYKKJt30BKld4aDNNMbckKn/VlNG/3jSpG8qLoLls7oSiutRHnDky+IBBzIr3fjdAmjWAgVZ/3j1IlGiWmVJgn/2Xk6PPhOw==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-10-percent-2 (Postfix) with ESMTPSA id 19C6D18000AB;
	Sat, 20 Jun 2026 17:53:29 +0000 (UTC)
From: Konstantin Shabanov <mail@etehtsea.me>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Konstantin Shabanov <mail@etehtsea.me>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] firmware: qcom: scm: Allow QSEECOM on Honor Magicbook Art 14
Date: Sun, 21 Jun 2026 00:51:58 +0700
Message-ID: <20260620175210.19563-5-mail@etehtsea.me>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260620175210.19563-1-mail@etehtsea.me>
References: <20260620175210.19563-1-mail@etehtsea.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9yf_Ot8DeOtodI9lrnaSfS2pDGWHylh0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIwMDE4MiBTYWx0ZWRfX64PNz3/PGjSS
 FhL4kWv/5rP+b6CYfb/09X5LtGcYxeDK2ii1OdyZK0MRpUiy8m74PvTBOVzwj4sGHxy0OrGaRpN
 k5hxD7XFeLyESztnP560YVNYGm3WwDiUd4iTAA0qCGXkaL3plNo+uVMGgklyKB/tmdpDr5eQcWJ
 pFZgsJ9o4cacgMSMBNCScpr3lEPw26O2WPAacH+ZgbXpXjPIqArc1fj+gUOAlKst1E92xy+Q4gt
 Xv5cpXMMz2mIVXynD8qQ1EofPLV1I/Imy9Gxraa9AUa/ucffN+L9rDrFr05aO01pUwaXzRFbOVi
 wTwFZHCNwCGO5JX7yC4
X-Proofpoint-ORIG-GUID: 9yf_Ot8DeOtodI9lrnaSfS2pDGWHylh0
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
	TAGGED_FROM(0.00)[bounces-113892-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[mail@etehtsea.me,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mail@etehtsea.me,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[etehtsea.me:dkim,etehtsea.me:email,etehtsea.me:mid,etehtsea.me:from_mime,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EC83B6A96DF

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


