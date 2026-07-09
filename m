Return-Path: <linux-arm-msm+bounces-117845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V3m7KXY4T2pjcQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 07:58:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2451872CEDA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 07:58:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=RVW7YGgX;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117845-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117845-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C79F300EAAD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 05:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5DDC3AB5DE;
	Thu,  9 Jul 2026 05:56:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24803A4F4B;
	Thu,  9 Jul 2026 05:56:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783576589; cv=none; b=US7E+S0MICnfPjJ8EzfngAVOfJN5SHB2F92vGLqhd8nGat3wRmh2SLjwUKKNzBr/FEktiGqq+7yN/vXdAxUr7NcbWpbboztKGLj6rWiITYpYGQUDaPTito9GTGcGURgzJY4RtUf77vgbc5ocn4T/aPBt2pbodmf4sV4+EkQ0Qhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783576589; c=relaxed/simple;
	bh=WCWOCcosvf1a3H0MeXBzocDS82Ys6gxGxDYJ8S3McbE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oAA+NO9zu4XvWSBuOg8ne5Swu9HZCOrvspjZLAqGyBgwuu3tQHPWR9sjDKmLpW56jLAjbNb9b3Umn74hX/oWUvFfTxVV5IWiVCGVePX7E0jVb2vBXI3lp6lCTklIdIWg5OcyFXlwnmUV2eZqDFWOuZDQC1J/5CpJQeBuys8LLH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RVW7YGgX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1780F1F000E9;
	Thu,  9 Jul 2026 05:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783576588;
	bh=XbT1KfJ5qWiKVVsJNIrbamwA3zZFgvVNAtExcvXw14g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RVW7YGgXrF/ggPJfn/KSozQ+F/lbytsaTVX+clbk84IR9Zh3ESwnC5dDpyjuMKxM+
	 BDM711duEXOBNAH4KRf6CoweP7B0/O8CrbIqG2ziMAL7fkv2cblg1taIITdKCzdJO8
	 BFRlHBojEX1FlrdN+pM2c94G8dlKWE19FGcHGJYAvkHkWNenJYPnvjH+RRJHhXcMSJ
	 V1mDmCgMV713KfjQ+oZ4R8rdLeTjTmrMm1nOY9e8CjNzlD6k9SSJZ2f8vMmlKTv8jF
	 5+SWzop80UApNPzFAZzj6xMbjjF4lAfiRGr44dmHRspl5pPIJwTXL1Mjd74Ox7Mcn2
	 mGQ5Byv2cYjuQ==
From: Manivannan Sadhasivam <mani@kernel.org>
To: kees@kernel.org, Qingtao Cao <qingtao.cao.au@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Vivek Pernamitta <quic_vpernami@quicinc.com>, 
 Qingtao Cao <qcao@digi.com>
In-Reply-To: <20260603011333.3306102-2-qingtao.cao.au@gmail.com>
References: <20260603011333.3306102-2-qingtao.cao.au@gmail.com>
Subject: Re: [v1 PATCH 1/1] bus: mhi: core: fix sys error handling latency
Message-Id: <178357658570.735095.2248320106411171417.b4-ty@b4>
Date: Thu, 09 Jul 2026 07:56:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kees@kernel.org,m:qingtao.cao.au@gmail.com,m:linux-arm-msm@vger.kernel.org,m:mhi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:quic_vpernami@quicinc.com,m:qcao@digi.com,m:qingtaocaoau@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117845-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2451872CEDA


On Wed, 03 Jun 2026 11:06:11 +1000, Qingtao Cao wrote:
> Bring forward the idea to fix the power down latency in
> mhi_pm_disable_transition() further to mhi_pm_sys_error_transition()
> so that the transition into system error (triggered by AT!RESET)
> won't have to return only after the timeout of up to 24 seconds

Applied, thanks!

[1/1] bus: mhi: core: fix sys error handling latency
      commit: 22568e8f13a42ab69b7d624741768cbf15dded74

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



