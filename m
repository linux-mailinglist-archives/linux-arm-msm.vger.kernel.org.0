Return-Path: <linux-arm-msm+bounces-108236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFmBM0tAC2p5FAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 18:37:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F03571062
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 18:37:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE4D63028EDD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 16:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A9FB371CF1;
	Mon, 18 May 2026 16:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iokpp.de header.i=@iokpp.de header.b="g6CzcHo5";
	dkim=permerror (0-bit key) header.d=iokpp.de header.i=@iokpp.de header.b="w8B+OE1w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D23364EB1;
	Mon, 18 May 2026 16:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779122154; cv=pass; b=unrDu/3GMR1Vzmvho75YVafehLMxipAstF/02/ZIO7QBNdhRPU83+BCSQL1oGrciKOWxjAp01Nt7jo8Oe+OyWJkKRp8yj75y7XpYOY7zTdq3s0WVJYE/WzsSCwjwvjykVC3b3sHdaMnd2Cw8O6192fo54r0qJdNmFKYExO+Ra0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779122154; c=relaxed/simple;
	bh=tRkIlgIojB8/e6m0sIUL51+r0cZc6wuxmCbqDTe/8dg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MutvgCUx53QYrjVdmFPKd9MLYQ6puq/IPtVIRNtBXs/NwraiMC6Wok5HXMshqbkqeRh6Hbab2zOJNCZ7L+/6ACbHxOrjRJX++7E+2xGPYReqMA+I5Fm7vXPzYOXaIqh56gaDuUOpOustTP1InQ5LT/lUzvhFDRPDDy092yPvNbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iokpp.de; spf=none smtp.mailfrom=iokpp.de; dkim=pass (2048-bit key) header.d=iokpp.de header.i=@iokpp.de header.b=g6CzcHo5; dkim=permerror (0-bit key) header.d=iokpp.de header.i=@iokpp.de header.b=w8B+OE1w; arc=pass smtp.client-ip=85.215.255.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iokpp.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=iokpp.de
ARC-Seal: i=1; a=rsa-sha256; t=1779121429; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=b2vEIJj27fkSV+W3JBjNVSiiLOIYr/PSPG849nQ4amHHwbnTYBzzZVoz6Bwz3wwFQ+
    2dpPUtMnfKcEfQ2gZNlQgUDCmhzvwwpkG5gkS6av9qkTXRPg5b8HWIm2qnucmxOF42j1
    JjBEOV4gaxHjZQj0HA3Ypkqoqy5VECFx1Y5M9f6delAakkThnzvs7VmUekUtoHUqqLlX
    6GkGZ10L45NMvEcnqjTgSF8tnMtxN1g/GkhgTwMXcViHZ0AW0xMj5dUmbgBGHHQknAL9
    QzpwR5priTJfz2r3Qm/gqbsfBMCiO6gnSBMzRxqUNfsiC0q6GHNLhhI3Rs+IQ+6jfBGG
    hjeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1779121429;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=tRkIlgIojB8/e6m0sIUL51+r0cZc6wuxmCbqDTe/8dg=;
    b=Eul4Oo4MOxVA6/PtyhDE4/5VTLXoSsc3RG3ZHCr2OCJIz6TRmF+7m/z95OnLrZJmb9
    Fk3MJGiWAhWUOr57HUA3RYnq9ZcJOU6dAHC3AQamtJsmqAGf1pIZXECZlFzdpy2Upg4a
    CyYHPuqfXlYVrsrCtsO2t1oewFHoUijZ2X4ByE1cVWMBi2MuUkMC+CTbsjFQxHkKhvvE
    G5orLDfhrN1pQzcWWCYq3KRNGEXvQsQ4TnMN6dhsdudQ/Zvvss0rqWcPftZrUTQeMXwr
    YdHRKId/GVKVgn5QQSKrJOd4Fl2j1ljudR1F54/OP5RsMLCvitoZOjTsdvtsOa8Py6TW
    +T9Q==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1779121429;
    s=strato-dkim-0002; d=iokpp.de;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=tRkIlgIojB8/e6m0sIUL51+r0cZc6wuxmCbqDTe/8dg=;
    b=g6CzcHo5I7e8yMtS81DgxiKajhr3SYkn+ZcWrzD2iNt3vPuygONuArTXlZNAlZC5At
    V0d1KaC4+dME8N6+WFW+/nyTA1X/sjF0S5Ic5h14wSQUxgmSIVLFIIB7eKxni+wmSKUL
    yc9zSqOJy1mXmTC8n5eg1wGPNiY9LSlGMA8N+enc34ZhemyWBTOXW3QDrnYhT3RWJjbR
    75UqA2VuRDEnAhX+aqtKfqt8eq9sz5lcgheOuPgMxJE65Mot70BYfeQ7lvESC05Tk3Nl
    flUpTJ1Q4ipRuXSKBWOQPn7G9obYh/sJmUcC8tu/ABnImtS3/RF9yL5vA/k3WDwWuiRv
    EmsQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1779121429;
    s=strato-dkim-0003; d=iokpp.de;
    h=References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=tRkIlgIojB8/e6m0sIUL51+r0cZc6wuxmCbqDTe/8dg=;
    b=w8B+OE1wHGA0uoWRTcATrbw5v/yXzOcfebGL1hdZZjb7nkfP9gwh8eJ//qkA6V7sgH
    mrPfxf4bNE1nbOdLxkDg==
X-RZG-AUTH: ":LmkFe0i9dN8c2t4QQyGBB/NDXvjDB6pBSe9tgBDSDt0V0DBslXBtZUxPOub3IZik"
Received: from [10.176.237.182]
    by smtp.strato.de (RZmta 55.0.1 AUTH)
    with ESMTPSA id z7934524IGNmwv6
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 18 May 2026 18:23:48 +0200 (CEST)
Message-ID: <32316857f11bf1ccbcb22f3eb370cca108e18a64.camel@iokpp.de>
Subject: Re: [PATCH 2/2] scsi: ufs: ufs-qcom: Use quirk
 EXTENDED_TX_EQTR_ADAPT_LENGTH_L0L1L2L3
From: Bean Huo <beanhuo@iokpp.de>
To: Can Guo <can.guo@oss.qualcomm.com>, avri.altman@wdc.com,
 bvanassche@acm.org,  beanhuo@micron.com, peter.wang@mediatek.com,
 martin.petersen@oracle.com,  mani@kernel.org
Cc: linux-scsi@vger.kernel.org, "James E.J. Bottomley"
	 <James.Bottomley@HansenPartnership.com>, "open list:UNIVERSAL FLASH
	STORAGE HOST CONTROLLER DRIVER..."
	 <linux-arm-msm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Date: Mon, 18 May 2026 18:23:48 +0200
In-Reply-To: <20260501131641.826258-3-can.guo@oss.qualcomm.com>
References: <20260501131641.826258-1-can.guo@oss.qualcomm.com>
	 <20260501131641.826258-3-can.guo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[iokpp.de,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[iokpp.de:s=strato-dkim-0002,iokpp.de:s=strato-dkim-0003];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108236-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[iokpp.de:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[beanhuo@iokpp.de,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[micron.com:email,iokpp.de:mid,iokpp.de:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 31F03571062
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 2026-05-01 at 06:16 -0700, Can Guo wrote:
> Use UFSHCD_QUIRK_EXTENDED_TX_EQTR_ADAPT_LENGTH_L0L1L2L3 for UFS Hosts
> HW major version 0x7 & minor version 0x1.
>=20
> Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>

Reviewed-by: Bean Huo <beanhuo@micron.com>

