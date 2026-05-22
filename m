Return-Path: <linux-arm-msm+bounces-109173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CLtM5n4D2pBSAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:32:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB2F5AF897
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 08:32:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 56ADF30157AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 06:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F0CB3382EC;
	Fri, 22 May 2026 06:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NWusDrkJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5D31DF73A;
	Fri, 22 May 2026 06:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779431561; cv=none; b=u5GnA9b60KDbP35IGWKehno+NwRj0OsaAmehJSx8qMxs4E6paSR6gexDLd6xclPU6D9YjG4uGlb8FeI/RLAcHIWyeyXt7qCTssrqg+N4URV77paeYKa2Y4kJHrJLh8heGcA8eopCYLVQAr8mPRsXQYnDZU/lUYojdjp6+qEsqqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779431561; c=relaxed/simple;
	bh=hhw1iwzqHPebr8h8OrEOAb3a4MvQ+w3rLcybElOIaaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m2qMgQjNKwjufQGPaX4cohAZ6bvaCzZuubQRrvtwzm5UgutDGY7TeDfcrvDPL+CJil3aKde6a/JW3jQ0SeKNWito0T57t45RnbeB/uMJ8GP66ppyrezao9nl7kIMAnp727oS6MxNpwebbvjJU4SVDiy9O5EFxCSqqHQwOsildOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NWusDrkJ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B23A51F000E9;
	Fri, 22 May 2026 06:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779431560;
	bh=hppHeyHOJksZUfYDFIRGII3QlauFrwPlMGfG2ltp+NI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NWusDrkJLqji20MOhcN6avCpRrGpWtBCHDsbAQvVwYBriNTR0Vu+wwZgkdAVxkSWy
	 l7HH32qdhom7w3NdFIo6U06emGZWHGPsKO5qP05KEDPFXJ3IUWztXZQg7N1tIUdwe6
	 x4D7X+75Fk83iDFQ1fRfUc6N/ZJ2gwvwyjJEEFiYUnT0geLP0drL2otRjHOoVWDpgg
	 xfRsPeyzYk+KElc8p729g21mWkBqQ1UbccpBr71wfLWlTwtcbar7AtYSNTTTb6oJFJ
	 GZo/nKqeC6XBap3e45cpbQZr5kcOmenYleYXpzeYbXHsVohRqdE/4LmIH5DAp0IzKQ
	 VmBcqBYGC87qA==
Date: Fri, 22 May 2026 08:32:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: remoteproc: qcom,shikra-pas:
 Document Shikra PAS remoteprocs
Message-ID: <20260522-enthusiastic-burgundy-shrew-548ba9@quoll>
References: <20260521-shikra-rproc-v3-0-2fca0bbe1ad7@oss.qualcomm.com>
 <20260521-shikra-rproc-v3-1-2fca0bbe1ad7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260521-shikra-rproc-v3-1-2fca0bbe1ad7@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109173-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: DBB2F5AF897
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 06:51:37PM +0530, Komal Bajaj wrote:
> Document the bindings for the CDSP, LPAICP and MPSS PAS on
> the Shikra SoC.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  .../bindings/remoteproc/qcom,shikra-pas.yaml       | 167 +++++++++++++++++++++
>  1 file changed, 167 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


