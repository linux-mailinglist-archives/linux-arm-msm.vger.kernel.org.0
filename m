Return-Path: <linux-arm-msm+bounces-111277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TzsgNaQeImq4SgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111277-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 02:56:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DF36442A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 02:56:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=protonmail.com header.s=protonmail3 header.b=B6dlvx61;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111277-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111277-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=protonmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DDE553017E78
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 00:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F24F620297C;
	Fri,  5 Jun 2026 00:56:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch [185.70.43.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7155519ABC6;
	Fri,  5 Jun 2026 00:55:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780620960; cv=none; b=VIPTvFMwvfd0c1cEM1IIJS0YRFKiTQ5CeXtAzJAPhWE/4ZD757YUp8sUuomufgjaNLoVhAyGjS2vo7DUFFyKVjvYfehNdpvN20NMXtKwWMCU745clbQL5As4hijmDRohmwlYajhA8s5nxQ+7umwPWoYmzeEY30IwUFqVqHsyzBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780620960; c=relaxed/simple;
	bh=sxquBZx0t5h7mUqD4ZdzXSu4g7vPg1HNi1UCLHJlBQ4=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EVcgKlLNZ/z+sv/SpS+zalVSHg49gpg4Zobw9Ofq2SIcq4aDzWVpXMLDPjILw6kpTLgl/V6BOgabBG6h7ahePQRcCU+FRuUAkAcczu7hjlHHjeG0VIfCcOnVyaM/Pugyd/loMYjKONvOr9vjnz2PR9panqDimcbceBRj9aonln4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=B6dlvx61; arc=none smtp.client-ip=185.70.43.167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1780620951; x=1780880151;
	bh=pXWjnuE5TYeSrab+2gCEGBFcQs2drj3wOwPxsv+Rz+Q=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=B6dlvx61Fj99Lgh0CAfO8AwpikHHy25KeMdCYXA93svM/6muJwUtlv3P67J0zeYoF
	 VgAl8qCbjwsqfhDqH766PNqI+OLgGbotKFLeGqdVhgfmzhYsbsK1oFwTNFnLeFM8Y4
	 uFjOzhN8lEChRfsJfosKoYtWHwcm+73gPL0T7DegsDf1E/niXC4Qq0jbFMsVOAVa2z
	 yPl6v5EYdF+FEUiVVK1IhJ/fHCW7lQmhIT4LkMvv8xU8ImtNH2kTj6P7cH0uHn25m+
	 +L+O4yzuuRVjhBIv4k1DnQiSeC5/PrLa8AarYC5HxuiiErtsy8mbGMiY1mQIkH8/Ck
	 ZFJeLM6GB0WJg==
Date: Fri, 05 Jun 2026 00:55:45 +0000
To: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org
From: Phillip Varney <pbvarney@protonmail.com>
Cc: bmasney@redhat.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Phillip Varney <pbvarney@protonmail.com>
Subject: [PATCH] clk: qcom: a53: Corrected frequency multiplier for 1152MHz
Message-ID: <20260605005502.313928-1-pbvarney@protonmail.com>
Feedback-ID: 5539158:user:proton
X-Pm-Message-ID: 0a985e75bfc505b31fd0aedcf509c13f245e84ec
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[protonmail.com,quarantine];
	R_DKIM_ALLOW(-0.20)[protonmail.com:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111277-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[redhat.com,vger.kernel.org,protonmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[pbvarney@protonmail.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:pbvarney@protonmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[protonmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pbvarney@protonmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[protonmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,protonmail.com:mid,protonmail.com:dkim,protonmail.com:from_mime,protonmail.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 73DF36442A0

The 1152MHz frequency entry for the a53 currently selects a multiplier of 6=
2, giving 1190MHz. This changes the mulitiplier to 60 giving the intended 1=
152MHz.

Signed-off-by: Phillip Varney <pbvarney@protonmail.com>
---
 drivers/clk/qcom/a53-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
index 724a642311e5..0549b214fcfc 100644
--- a/drivers/clk/qcom/a53-pll.c
+++ b/drivers/clk/qcom/a53-pll.c
@@ -20,7 +20,7 @@
 static const struct pll_freq_tbl a53pll_freq[] =3D {
 =09{  998400000, 52, 0x0, 0x1, 0 },
 =09{ 1094400000, 57, 0x0, 0x1, 0 },
-=09{ 1152000000, 62, 0x0, 0x1, 0 },
+=09{ 1152000000, 60, 0x0, 0x1, 0 },
 =09{ 1209600000, 63, 0x0, 0x1, 0 },
 =09{ 1248000000, 65, 0x0, 0x1, 0 },
 =09{ 1363200000, 71, 0x0, 0x1, 0 },
--=20
2.54.0



