Return-Path: <linux-arm-msm+bounces-118337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zVP6BzYuUWrKAQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 19:39:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A413973D10B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 19:39:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=UH5ynHlt;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118337-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118337-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C70930048D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 17:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9645E36A379;
	Fri, 10 Jul 2026 17:37:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815942ED860;
	Fri, 10 Jul 2026 17:37:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783705035; cv=none; b=YAAh7+IWszmNU/uB1D5bMa7E5DXmhkUahDh/xNOjKtJwWH5vXl2sPYBtg0jGVqZi2pNmG1wQniDAVc8g3XBmck/18eCzBF5cXcPkBCn22hZCc3LFgyG1Hbu1AM/jFZ2sA3pgChIQYOi0UI8hZrC2E9WzE26uUpzxI2eht85RHQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783705035; c=relaxed/simple;
	bh=x1GlKTg8FbOL0BWGdUPOCXDPn+D15oI3vKoYMmX6FWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f07Ce/UujoCf77/i8Rp/Acsm6PUFMfS+WiNhibo1UQGREgLfHhuIwN+qAw2Az1A7hkHSX3LWjq43g4O1eHCgYNkDCEmhpXSnH5mHe0u3fQm6EQwv7teT9u5tZhPmEheFX6joXVdu8Xd+TKrVSq78MsmBl8k+Q9Sx2z2rgkQOpUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UH5ynHlt; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 803171F000E9;
	Fri, 10 Jul 2026 17:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783705034;
	bh=u4OHDBQeXad2wbx5s3NZJrq/DrBuZJoBPcpehHKeabQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UH5ynHltUWpeAZufCEwAbt04w3+OAyOCYh4EsAsKn5ZNW+bOEa9Zyw4NFl4e3I3Zu
	 tsU0Owz5KQsV3iRoYQBsHmniNK7vME87FKgWz8QpeWr+oVuHhZtRcSZCWYkfBFKxID
	 CGLpt/tR0o+I7OdX8XvWIrOcfqFyulrIr54MUgouLjn5B85ShulZr7wiWePVVX6NzM
	 mCrh0t74BWmxgz+VrexcNGrZNe6NURyfE7mO8iAofbQqw9YLv07mwD6V8Fpgrr38VQ
	 hmUlBh7LkhMVJIylKsyRhVLIPI2ye/27+XFywR35AS/9ODtUtkWbl4rFfU/qWugrE+
	 1KJz3MadETS3w==
Date: Fri, 10 Jul 2026 18:37:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	aniket.randive@oss.qualcomm.com,
	chandana.chiluveru@oss.qualcomm.com
Subject: Re: [PATCH 1/2] soc: qcom: geni-se: trace: Add trace event support
 for GENI SE registers dump
Message-ID: <a2491042-b7a4-429c-828f-905c07adbc5f@sirena.org.uk>
References: <20260706-add-tracepoints-for-se-reg-dump-v1-0-48bd08e28cf2@oss.qualcomm.com>
 <20260706-add-tracepoints-for-se-reg-dump-v1-1-48bd08e28cf2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HutsUxBLtgJehPCC"
Content-Disposition: inline
In-Reply-To: <20260706-add-tracepoints-for-se-reg-dump-v1-1-48bd08e28cf2@oss.qualcomm.com>
X-Cookie: No directory.
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-spi@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-118337-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A413973D10B


--HutsUxBLtgJehPCC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 06, 2026 at 04:38:12PM +0530, Praveen Talari wrote:
> Add a new trace event header for the Qualcomm GENI Serial Engine (SE)
> framework providing a geni_se_regs tracepoint. This tracepoint
> captures a comprehensive snapshot of the GENI SE hardware state in a
> single trace record, making it possible to correlate register values at
> a precise point in time without multiple sequential reads.

>  /* Common SE registers */
> +#define SE_DMA_IF_EN			0x4

drivers/soc/qcom/qcom-geni-se.c defines this as 0x2004, that'll break
allmodconfig builds.

--HutsUxBLtgJehPCC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpRLcQACgkQJNaLcl1U
h9DuxAf+JLBNnYSU484aZiUhk1zfUxqrLAyUYl5H403u8W2qRB6/LEKGSv2r/oVW
O899oFRh2Vl9u94pqQwpZofaBp1pdCttuZYBVYunS2DsjemneduNFOlStqdD3SD8
Cn1x9ra9tMq4jtAgtJkCiRWyCytal6VTQMA83pCMXWHkP3jXAacDDfkreUUD01aD
3AO9XcAWFNXB7OHMFUGtARTrjzn4BW4GzY6kGZuGoeVqdOrWT7fcJghK6Qk3Yq/1
CRmPYs78BajKU7qsY0DdCR/64HWpQRTHHeA8alEVNtlIkX3t0Xpl5T8rCte+R5+Y
1SxalS8eBpf6UXg52/onGLE/gSJfaA==
=Z2z+
-----END PGP SIGNATURE-----

--HutsUxBLtgJehPCC--

