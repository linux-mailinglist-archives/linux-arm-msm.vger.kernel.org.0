Return-Path: <linux-arm-msm+bounces-92753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIPnMcHojmkDFwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 10:02:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E56F1344A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 10:02:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2C94C30068DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 09:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7C5A2FFFB8;
	Fri, 13 Feb 2026 09:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PNI9Dw2V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31820342158
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 09:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770973373; cv=none; b=vFMoaHgcDlsJsQ6+s63aqALsxVWkJOgBleuvE9n1TY6i2TTblElw3X+0mdFzTYNFlYJy1LS08CQLy0pEdVQy2tT0ZLgRdA74Qy0E08CM7AlyMq4WT8gQzdLo4mDZ2XMWTlAsVG9pwHsAxubDQR6wvqymg02hpzcqUc6VmFYG6XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770973373; c=relaxed/simple;
	bh=GCNLHpourJK+ggk57xu+21UuS50fiPYl9qw9FnaS074=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HxW97y0qZ417q4GrZnqfbJUKlrggl1odCNjOHbao4tMm5qi/QVReG0TkUh9cXnfJuMedn7J8Q1iGPkHXI2TDbJtwnAjmIT3Dqz4gsxP9YLCSX39S7wXxoD32XbKNBIEZ05SGOevmXz2Y0zVwd+pkv+DnjHzkkNZ8foJzx6z9P9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PNI9Dw2V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C85C116C6;
	Fri, 13 Feb 2026 09:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770973372;
	bh=GCNLHpourJK+ggk57xu+21UuS50fiPYl9qw9FnaS074=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PNI9Dw2Vzi88bVgK5GTgp5hPuv3JBV/acTEX4BdT5rlDJoJhBCCywx09vNT21WSrC
	 H+kk76KSVyTxY/uBvRctWMKzjdPoiD2UKDTciL6lnTps/+SBOMySMuiPzaecKTnS7B
	 cJH1iOP6Ijj9cqbBPDtgI/EXz9WB+vZDurh51sllJDpzAZxMd1zmE1rT1AulS171Oc
	 kdcHvO4yMB5EbK1XZfnXcLfz261Jjh6h3WBHpssFOCkcIa4efOfBeGGaxdB0fABd2n
	 abo6nrwcdYOe3pvZZPsJfoATFWqoAIva4MEdl20gmVRcDFJ3XAstezUOliEofsh1H+
	 Zf+qScQ/kDozw==
Received: from johan by rho.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vqp4W-0000000010y-1ei7;
	Fri, 13 Feb 2026 10:02:44 +0100
Date: Fri, 13 Feb 2026 10:02:44 +0100
From: Johan Hovold <johan@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: vkoul@kernel.org, kishon@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org, konrad.dybcio@oss.qualcomm.com,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/5] phy: qcom: qmp-usb-legacy: Fix possible
 NULL-deref on early runtime suspend
Message-ID: <aY7otFH-XdY0xwZu@hovoldconsulting.com>
References: <20260205160240.748371-1-loic.poulain@oss.qualcomm.com>
 <20260205160240.748371-4-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205160240.748371-4-loic.poulain@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92753-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3E56F1344A8
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 05:02:38PM +0100, Loic Poulain wrote:
> There is a small window where the runtime suspend callback may run
> after pm_runtime_enable() and before pm_runtime_forbid(). In this
> case, a crash occurs because runtime suspend/resume dereferences
> qmp->phy pointer, which is not yet initialized:
>         `if (!qmp->phy->init_count) {`

So here too, what would trigger a suspend in this window? (Except
possibly user space disabling and reenabling runtime pm, which can't
happen in practice).

> This can also happen if user re-enables runtime-pm via the sysfs
> attribute before qmp phy is initialized.

This I guess can happen in theory, but you'd need to try pretty hard.

But I think the commit message should better reflect this is all mostly
theoretical (currently it sounds like something you've actually hit).

Johan

