Return-Path: <linux-arm-msm+bounces-91928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4C+pCmSYhGmh3gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 14:17:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B61DAF323E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 14:17:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68CCC302EE93
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 13:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 827153D6476;
	Thu,  5 Feb 2026 13:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pC4xAqvC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9C23A0B0E;
	Thu,  5 Feb 2026 13:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770297205; cv=none; b=DAjpKm827tFpjkOnrwZapvd+zYqUKPJObHNZIOYsk5rbUPStw8+4dJA6LApwmkMWOphG+ks/37E59Ij0ono7Vq2EQ+DKM80UH1+a/mZ4jQ8236dGshbpo3oXqZHMNuJrlu0+ywK7B7/uivUbKz0j4bvblHVYsd88/wU5UcZ5mFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770297205; c=relaxed/simple;
	bh=WFKLVZiOEskGvRyyMIdRKE5mXcVlwT0fwqt8gnqT9qQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tS4DrPNRimWpK+mn3TwIx5YQ8m9Gw2DPCVXWw4M/Cnfhs9VAmWpD87V3QfblqPyJXgx9he8u5lnkIK/xPRC0dg8HSAmfYTRkkDbcWWXrdIr7Ns8IsSOC22tLzHbQnG6QkOZ6IOHDkgJZApXps6d5ZWUX7oRBhC7xFos2CO8HAQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pC4xAqvC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AA41C4CEF7;
	Thu,  5 Feb 2026 13:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770297205;
	bh=WFKLVZiOEskGvRyyMIdRKE5mXcVlwT0fwqt8gnqT9qQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pC4xAqvCB9C1ZGNaoEHAtxDqDf28oqrobWlZZqZGUomJxl7QkJRY3OKlIue6zbAOw
	 lp8ZzaIZrGZSqg4rlPXJcVTibbCv6aHE+Ihz4p8mhsxY3RbsNAhGc7Y9rcxROYcGk2
	 po8pWziGmDJuAKET6xJiRUSJjxu31Fm2r0HCYNr4n3MHjErLWRsMXlVZ7ZKMW/4kVP
	 wyLrDwZdi0LBB8ERKFKWZ7BUOUQzTc0OCxjSRGb+CysROzfwdAdGJkGcPeRT6ExJYR
	 8HUlJaGZlHkWWFAXTHxKu3hRMmxX+ESkAA/eRYqQZR99Y9sO38lIDbIJ4gl+zoXtRv
	 pajentDYTG5Pw==
Date: Thu, 5 Feb 2026 14:13:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Griffin Kroah-Hartman <griffin.kroah@fairphone.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/3] Input: aw86938 - add driver for Awinic AW86938
Message-ID: <20260205-polar-falcon-of-fame-b8db72@quoll>
References: <20260128-aw86938-driver-v2-0-b51ee086aaf5@fairphone.com>
 <20260128-aw86938-driver-v2-2-b51ee086aaf5@fairphone.com>
 <aX6whqw7XyaKMd9m@google.com>
 <472d7db3-db34-4966-aa17-588e1153ba12@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <472d7db3-db34-4966-aa17-588e1153ba12@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91928-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,fairphone.com,kernel.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B61DAF323E
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 11:12:26AM +0100, Konrad Dybcio wrote:
> On 2/1/26 2:49 AM, Dmitry Torokhov wrote:
> > Hi Griffin,
> > 
> > On Wed, Jan 28, 2026 at 04:51:14PM +0100, Griffin Kroah-Hartman wrote:
> >> @@ -717,9 +746,19 @@ static int aw86927_detect(struct aw86927_data *haptics)
> >>  
> >>  	chip_id = be16_to_cpu(read_buf);
> >>  
> >> -	if (chip_id != AW86927_CHIPID) {
> >> -		dev_err(haptics->dev, "Unexpected CHIPID value 0x%x\n", chip_id);
> >> -		return -ENODEV;
> >> +	switch (haptics->model) {
> >> +	case AW86927:
> >> +		if (chip_id != AW86927_CHIPID) {
> >> +			dev_err(haptics->dev, "Unexpected CHIPID value 0x%x\n", chip_id);
> >> +			return -ENODEV;
> >> +		}
> > 
> > If we are able to query chip ID why do we need to have separate
> > compatibles? I would define chip data structure with differences between
> > variants and assign and use it instead of having separate compatible.
> 
> dt-bindings guidelines explicitly call for this, a chipid comparison

No, they don't. If devices offer autodetection, then they are in fact
fully compatible for the SW.

Best regards,
Krzysztof


