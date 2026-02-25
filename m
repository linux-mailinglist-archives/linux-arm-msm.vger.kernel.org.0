Return-Path: <linux-arm-msm+bounces-94078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGtqKJzVnmkTXgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 11:57:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 261A41961AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 11:57:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4CE7530BC123
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 10:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51CFA393DE3;
	Wed, 25 Feb 2026 10:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uzs9wf9K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF50393DCF;
	Wed, 25 Feb 2026 10:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772016928; cv=none; b=Jj+MoUHtEd3Hwe96OQugxTAcX90UpDvlXv7/zButDfyQBr8zwhZaKoSiz750UsrPUiEgh1BiX7EeN5/PCg50f2KxXLElZ3pWQDLHn648gKVViwfOkCJVghqcfTcWrTUc1TF5XZ1kOuf04fnrn0g8lI4K4P+7FRf4P2029kNOAr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772016928; c=relaxed/simple;
	bh=OxGgfo+ZpaLu6Bi1wZtbUe76fI8tY1bhVNTo/MAqvB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B7wRmJFHOqWuWIxCCH3Auoiv8bFoGgQ8zVHaCFeTfLEATXZ7SA6r+IFa3ZPy6+nBmUxjBH30HmCKUO2bPNysFRY0RMkOhNXVF95Zl3oRDKMAW/UXXlWEpf4lv3TIDHBaU7H7LRT47a1tsRhKIXePVNNlmJYqkS/khbHyLA7SUNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uzs9wf9K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F32FC19421;
	Wed, 25 Feb 2026 10:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772016927;
	bh=OxGgfo+ZpaLu6Bi1wZtbUe76fI8tY1bhVNTo/MAqvB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uzs9wf9KlsXyQrrjIMa6E5y6s7XQquwzOM+/WgguLH7o/GvzrI99niBGxeC/4EwQS
	 YG/vVlgay+Ddx2ItNaFz2Z9fnJfgWcjWtY+7YZlVC5VHCvFi9uao+jW7nk/lPQXuon
	 JAALqsCax5Fznqhm8UD3phGHlmn2HRCh3AILtg5O7T9CJDY8Hh3VqXMV/87ovhqefS
	 wNm/AT5g0KyqcCK2rwilZmciMYrvfs91z+5313MCBSR9wYgKxSYe/PMw6Y/cCTFATy
	 2Xc6FAOAfeIou4z490YSxvKtoAGdfcaYIs1vO16jH5TCLVf/M8sQdfOEf7qqg9BZFn
	 CmqI0hOcftL7w==
Date: Wed, 25 Feb 2026 11:55:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: Document Eliza and its MTP
 board
Message-ID: <20260225-aromatic-rough-cuttlefish-eda787@quoll>
References: <20260224-eliza-base-dt-v1-0-54e8e3a5fe43@oss.qualcomm.com>
 <20260224-eliza-base-dt-v1-1-54e8e3a5fe43@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260224-eliza-base-dt-v1-1-54e8e3a5fe43@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94078-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 261A41961AB
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 02:13:25PM +0200, Abel Vesa wrote:
> Qualcomm Eliza is a high-tier SoC designed for mobile platforms.

Not for mobile platforms. Or not completely, so better do not add
untrue/incomplete statements. For example I sent CQ7790 SoC IDs
which are Eliza and are not mobile platforms. See also explanation in my
commits/cover letter.

> The reference development platform for the Eliza SoC is the Mobile Test
> Platform (MTP).

I would not claim that MTP is the reference development platform. It is
one of the platforms we got, even though the SoC we are doing is not
mobile and has no modem.

All these claims then confuse people saying you need to cc some other
lists, because MTP is mobile. No. It not, even if they call it like
that. Thing without modem cannot be mobile as in "mobile phone".

> 
> Document both the SoC and MTP board compatibles.

Best regards,
Krzysztof


