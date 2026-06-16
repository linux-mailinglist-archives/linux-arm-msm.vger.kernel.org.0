Return-Path: <linux-arm-msm+bounces-113484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fEgqCXzcMWqWrAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 01:30:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 960B6695B6A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 01:30:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=OG3EPA8x;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113484-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113484-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72E8E313996D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 23:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F4E3B14D7;
	Tue, 16 Jun 2026 23:30:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE70C305688;
	Tue, 16 Jun 2026 23:29:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781652600; cv=none; b=jD75XBI59I1GZgBdvbhep56dVdhx3nyciaXz0K7b3LqkjEP6Ip5DMaTT9w3GbpLv9IT+yajYjNxL3gX39FQB0LPCmG0TdKoVnXGvv9JRaCIkOHbLDI2bKTiPaBEs75wNSW3SXF+BhtuOszF1ZHcivcF1TWjQhyzyA5gDnVasaWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781652600; c=relaxed/simple;
	bh=7CY3W6QW4QbyrNIEnnhsSjZhwAo5bGvn+JcS54OtcHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tOKpt0y7aeiVcXWwm9XQNazweHmV4D1Kzw8yH+2OyTT/D8HrmE2TYQNUC6g31uLagXSqpl5X+e0vDaZk/kq6Gdg/hvWwkUg8JPNwKUWdHozD4hU+JZ5LSUCMY4RS1v827V0r8e3nzqmibRVNDssP/91LnlemYMoynADNDdXXoEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OG3EPA8x; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 141B01F000E9;
	Tue, 16 Jun 2026 23:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781652599;
	bh=r4IoNwHoTnEmG53kaXwe3DNjPHkKDu0Ki84EcbgZzgQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OG3EPA8xYjcflG010VYBLS6Ps/mOqipg/R1jNcsP68WV6ijdc8RUz+gyQsr69Ynl8
	 vge4K10D9BPBlNOQE1bp0B+vbY48hIPgO/YMqZCEp5WPKL0hD2y6qFWjuPRqnOZT9s
	 zRFAtL4dLliD4DkXV0NWKd0vGncMvyk36vy6AOwHWudhinSf1ARwUQg17KIHpj+kdY
	 ho6uUBcAxGY+qVJcMbvPgwol2GR8YonY3fayvhgC7dnMPIQ3ln6nts6dn69O9gWE0a
	 TalN2h59StQO/6WKAcTcKQac5Y3sdVGDnRj8TBEMFbIWl2SIy0pY2S+kSSHdOPdAA5
	 xiXmteK/eASeA==
Date: Wed, 17 Jun 2026 01:29:53 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	=Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] i2c: qcom: Unify user-visible "Qualcomm" name
Message-ID: <ajHcYF42Qp7L-qE2@zenone.zhora.eu>
References: <20260423173550.92317-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423173550.92317-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andi.shyti@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-113484-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andi.shyti@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,zenone.zhora.eu:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 960B6695B6A

Hi Krzysztof,

On Thu, Apr 23, 2026 at 07:35:50PM +0200, Krzysztof Kozlowski wrote:
> Various names for Qualcomm as a company are used in user-visible config
> options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
> "Qualcomm" so it will be easier for users to identify the options when
> for example running menuconfig.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

merged to i2c/i2c-host.

Thanks,
Andi

