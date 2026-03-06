Return-Path: <linux-arm-msm+bounces-95725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFPmEP+Oqml0TQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 09:23:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C969B21D054
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 09:23:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 34EA83061293
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 08:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDFFC3195FC;
	Fri,  6 Mar 2026 08:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XXNd8oLu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5B9372B5A;
	Fri,  6 Mar 2026 08:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772785319; cv=none; b=UBEkOTT9j2E1NxWu60jjKMKwmPYH8CdJZbpkiwHzNBRQ3MrU6PJnSK+b0zXOM53UfwaGk/PFcS5uBdP1qfftkHLrwT7FkZ+nNZPnLgBVIC0SPdnr7xJXOnNDlnA6dqI5k5SCQBvVz0ncigwpRejD1e6XNCTfptet2/cqlA9GRFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772785319; c=relaxed/simple;
	bh=bwcXHgMXXwwNeKgsDC7lmXwiCUcXfei4LSYDSM+Os7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pwZt5XVafSJ5V5WUg0nF++xsn6o62FC9a2SlwXI8IU4tPKceLVMkOroWCo4c2roVfk7jaoCZ65OABeskEyfCkVQWnk3VT0UQkWGo1klFDVJg8scT9boF/KLxFF+ilN4zUOHa5LJlGoyJgQqmWveWZWSfKVDLmh69gs/tb2vxEq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XXNd8oLu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D66D7C4CEF7;
	Fri,  6 Mar 2026 08:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772785319;
	bh=bwcXHgMXXwwNeKgsDC7lmXwiCUcXfei4LSYDSM+Os7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XXNd8oLutUCq6sGbTXU//Zt8ry25EtA1BpLXlWuGDo6lVcR9Xok82boslNfBPJbrC
	 /SJTkKI9fSBXmxq7Cm7ZiHFcfUt3EBNvs7UEgUyywXT/vMWGdhzPE5l6jTIj6hyjQJ
	 A/DbhXT+xTzDCNhWxKVj0zsmj38vygsnj2xWkkg+2/W2kPeljJwmdeBpzjnMUS6iyv
	 sNq7UOwFopVax/BDHF8ViZXcc5us6ltOWKcoBAY261DMRRWqF0uGhchGW26/ADzvJa
	 /dOcmKaGljNRteCfhM6GBTZp0KQArhzw5FL5QVUwwIHpjpKnW+bVgLgTPVn4gD7Lwt
	 vJ6i0N1W4kwzQ==
Date: Fri, 6 Mar 2026 09:21:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 4/5] dt-bindings: arm: qcom: Add Redmi Go
Message-ID: <20260306-daft-squid-of-whirlwind-afcea0@quoll>
References: <20260305-riva-common-v1-0-436f1f4b7399@mainlining.org>
 <20260305-riva-common-v1-4-436f1f4b7399@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260305-riva-common-v1-4-436f1f4b7399@mainlining.org>
X-Rspamd-Queue-Id: C969B21D054
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
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95725-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 06:28:36PM +0100, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wr=
ote:
> Add Redmi Go (tiare).

Squash the two binding patches, please.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


