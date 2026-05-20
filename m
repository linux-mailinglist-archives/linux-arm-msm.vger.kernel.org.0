Return-Path: <linux-arm-msm+bounces-108685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJolNumJDWpdygUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:16:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D518358B8B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:16:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DFBE33003808
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDB8F39934B;
	Wed, 20 May 2026 10:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l7kYwrYd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8F662809;
	Wed, 20 May 2026 10:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271986; cv=none; b=TWPUTKS5x5f9SfMKBVuC+KSrYQmHnQbnw4qudst+313LPPvJonVzZs0l2IB5TmEoXDN8wLklvi5K3fd+vv2dKCp44UUwwfABz8BdvP1of3omqlBZ4LDUudbbZeQ+9cV9YbjqQFWLQKYO3CrfBmM1N1b9HGLSEXbjqzKn4jov+po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271986; c=relaxed/simple;
	bh=Jpb7VE9uICEb96rmejOXYaUww2wwZYt5AoYOgp31crY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ygc7prEa8aapQdKP+tmzyiBsv8ohZVy2yB6lLqAKsVZ7b6Bihe0UEBTb9O/FwdEAA2HlwcSZtgQw5DaCR/dW1Ce6Qy08X/I2G7GCDaXwfZDMPzi2bftdRr8pf1FI+4kTXflO97jU0et3te1qSL9wUYYImSGL+/E+d2x9UGsknLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l7kYwrYd; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC0DD1F000E9;
	Wed, 20 May 2026 10:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779271985;
	bh=ezmH9NFnKJocOGDjlXHbRY3fjedXko8UdvhfhS1bXCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l7kYwrYdRjmqoz/rpaS8rHDA9UslABNJYuz8/ycaISqEDY05NR5KGyj0YP0M/Hec6
	 GDfCrNYkl0FVNXpYcgCsQgslSUT0JPCrSWKqbYtsfmpIo86QHI3mXNfZi7Me0evDNB
	 64cSUbbIz2sXJyVlyMbjEz3v3rE3rbxTTMjpo13p2Qs3eLxEHjbGjbqqyq183MRoqk
	 DWD0nAX+iVsQ95LfrUF+sWucIMKQBCQ6VnABUPQP+0RmXhxsSdolxbyECUmNykKmL+
	 mU5pPOOI/mF9XpUsCQNX7unbrKi4Ge4QXrZhiPEC+V/Mqkb9I1m05eSsN5TvrKOYjn
	 kHRXxtucSSNPw==
Date: Wed, 20 May 2026 12:13:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add Eliza CQS EVK board
Message-ID: <20260520-innocent-tuna-of-cookies-feec9b@quoll>
References: <20260519-eliza-dts-qcs-evk-v2-0-ad7303659d24@oss.qualcomm.com>
 <20260519-eliza-dts-qcs-evk-v2-3-ad7303659d24@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260519-eliza-dts-qcs-evk-v2-3-ad7303659d24@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-108685-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: D518358B8B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 07:09:54PM +0300, Abel Vesa wrote:
> The Eliza CQS EVK board combines the CQ7790S-based (Eliza) SoM with the
> common Eliza EVK base board, which provides connectors for different
> peripherals.
> 
> Add a common Eliza EVK dtsi for the base board bits that can be reused
> alongside other Eliza SoM variants. Then, add the final Eliza CQS EVK dts,
> including the CQS SoM and common EVK dtsi.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile          |  1 +
>  arch/arm64/boot/dts/qcom/eliza-cqs-evk.dts | 20 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/eliza-evk.dtsi    | 20 ++++++++++++++++++++

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


