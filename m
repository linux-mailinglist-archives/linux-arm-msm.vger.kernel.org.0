Return-Path: <linux-arm-msm+bounces-114438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yYcwOjqRPGrFpQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 04:23:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC0B6C25E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 04:23:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=proton.me header.s=lhjreogzzragvezzbpqetq5pkq.protonmail header.b=hC25C7qQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114438-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114438-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=proton.me;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC1B83020A46
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 02:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12FE736A36C;
	Thu, 25 Jun 2026 02:23:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78790233723;
	Thu, 25 Jun 2026 02:23:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782354191; cv=none; b=DfZC9qYeEYKi2yw0OM+m/PRgL7pfi8gpn74prnaboCCI+DGK9uem5YX8U3y3t1PzDMc88ddcwb+HvS6fg6SLWJI5q1MGnT755meaF7Qvh0QCjafsFPoaN0UIC+wcaIaelsedO7GMipS449y/3D97CVmjSu0Ko6F4djHETIy5Bn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782354191; c=relaxed/simple;
	bh=JnOh6DAm+iyJOY8k9lF1wLJxsL5PuyoGuxA7tFKj+gQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gOV0MKlUUviGQsZjorDIQmFNg/0ae0qz08cwvTEB8nw3aqmBqIpbtWcxbHaECtsaToyW+H1dM/enHiv4bndjoCUgaH1Z711a+CJ17tMHANgk/yiwgx+EjTk41fsFIqpzoO7PxS1BgPe8hnLcHLe5OBNYlu8eOqQpF4B5+3uADvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=hC25C7qQ; arc=none smtp.client-ip=185.70.43.16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=lhjreogzzragvezzbpqetq5pkq.protonmail; t=1782354178; x=1782613378;
	bh=JnOh6DAm+iyJOY8k9lF1wLJxsL5PuyoGuxA7tFKj+gQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=hC25C7qQy5j6iwI4a0K1wmFvikllCXNDl6SKSxdSkhxW0mxWxC6eSr/7iO1N8UWzT
	 2g3rMnIkX2Dtro8UcbuKCPzvYLMi+iegQ4wTwEnFtnQruqOKFmI7LGugF4KOqJOIx9
	 WFdHwFJyvAhX7Dac/lJ8sBMpht9lnNnFFrI00IAuxq/RuQizk4P7vMbGZ7CeUXLP8P
	 v6YresBYDL6L5lvmxQxVU6TC4TWHZ++kFj6zDsUHWxHb1stLECEFDMoX4LF/T2B/EA
	 ihkU8Cl0Nr50OyD5rQij5eitWnQ4EY5qCg/9iqXDc8zcd87hsxWgSj9LBWiLnwREwE
	 B6ud6H57li8IQ==
Date: Thu, 25 Jun 2026 02:22:52 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 1/8] clk: qcom: dispcc-sm8450: Fix mdss clocks
Message-ID: <9bc524b9-c6da-47a1-a7cf-abeb131416a7@proton.me>
In-Reply-To: <65873506-1a9a-40ec-ac67-60f61a0b4b4c@oss.qualcomm.com>
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me> <20260622-sm8450-qol-v1-1-37e2ee8df9da@proton.me> <65873506-1a9a-40ec-ac67-60f61a0b4b4c@oss.qualcomm.com>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 2189097c3afc9ff31fb66855912a0f096fff92fc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[proton.me,quarantine];
	R_DKIM_ALLOW(-0.20)[proton.me:s=lhjreogzzragvezzbpqetq5pkq.protonmail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114438-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-phy@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[esteuwu@proton.me,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[esteuwu@proton.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[proton.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,proton.me:dkim,proton.me:mid,proton.me:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3BC0B6C25E3

On 6/23/26 11:50 AM, Konrad Dybcio wrote:
> This can also be fixed by migrating to use qcom_cc_driver_data,
> which takes a list of alpha PLLs to be configured, and thenthere's
> a switch-statement in clk-alpha-pll.c that always assigns the
> correct function

If this is done, should a patch that migrates to qcom_cc_driver_data and a
patch that fixes the issue be sent, or should only a single patch be sent?

Regards,
Esteban


