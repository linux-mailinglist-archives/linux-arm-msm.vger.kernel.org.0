Return-Path: <linux-arm-msm+bounces-109943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGXDECazFmokogcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:02:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAEE5E1799
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:02:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E24C307343D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 08:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BA123E4C68;
	Wed, 27 May 2026 08:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQacwnWZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C0C3E3D86;
	Wed, 27 May 2026 08:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779872165; cv=none; b=XT7HIHGn+wtlebUoGu99qxj3h/+zImyyZMIv1Bqu25CxxyvLhnnYQpslTs05mORJJM76W0MhwMtfXziT8BhZ9klvMeErAycToBEkD0J/GZPX+kzB8w1khKNOponc7PsDocsw1KcqE0JhSaYea5Lnl3vWwR2OCeQt1vvkVKZ5q0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779872165; c=relaxed/simple;
	bh=ow4vWUFiVDxtbUt++6nLx9mg8Qr2trl7C5lOygn+eZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N2IglAEeEyBOiG6zE3rr4+qro37wkIzzQmSfJBoHpwPpIw7Iy/GTnmYyivHjY6aaAhHIrq3AtpyujX+Qa3AKatdj6d003ZwjkuodQ0/brMG4J0XL4pGfFVtNqvurIcE0QzaHsNVYvL70FpiwzaP2g5D8zZm/h/uvD/1WOREXasE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQacwnWZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B484D1F000E9;
	Wed, 27 May 2026 08:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779872160;
	bh=ib0u8wAsUxzvlOKdNKtDF+qDqNdM6aAwqqnl17TlWSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KQacwnWZYucad3OMlH4bgCwK5+HytIlP2xmUWDWVu1aKNEcMnRkoHDS6oxA0yoXbJ
	 UOghVEifFw/Mqlc76smlZkxTGYk4NMV8VSIG85qmEL7CBZkU07KEaSYg0lGOcGeVOC
	 ZBZSwTSdOpA00S+sWnT/dgD9gnIrmYD0IuwPUo6205l0qSeDfid14p0PVruPBo9Cme
	 u+rNTr8ax//Lp4Qvgkr9sFWZqwCGAHBioxr31EE8Dy5l/xtMQfv9IKqsW/60MLTiLD
	 aINgobM7iV3C7FiarP6cZVYEZurwe5lFcxbIiinHFmNk2EbZ7lJJpu431MmJwBGERR
	 OzxXmQAfyNIFA==
Date: Wed, 27 May 2026 10:55:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com
Subject: Re: [PATCH v3 1/5] dt-bindings: arm: qcom: Document Shikra and its
 EVK boards
Message-ID: <20260527-pastel-fuzzy-mastodon-a4d9cd@quoll>
References: <20260522-shikra-dt-v3-0-80ffde8a3dc4@oss.qualcomm.com>
 <20260522-shikra-dt-v3-1-80ffde8a3dc4@oss.qualcomm.com>
 <20260526-quantum-funny-gorilla-cfc983@quoll>
 <951c9b8f-4513-47ca-afb6-481dedd3eff9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <951c9b8f-4513-47ca-afb6-481dedd3eff9@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109943-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bootlin.com:url]
X-Rspamd-Queue-Id: 7CAEE5E1799
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 27, 2026 at 12:42:20PM +0530, Komal Bajaj wrote:
> On 5/26/2026 9:15 PM, Krzysztof Kozlowski wrote:
> > On Fri, May 22, 2026 at 11:32:24PM +0530, Komal Bajaj wrote:
> > > Shikra is a Qualcomm IoT SoC available in a System-on-Module (SoM)
> > > form factor. The SoM integrates the Shikra SoC, PMICs, and essential
> > > passives, and is designed to be mounted on carrier boards.
> > > 
> > > Three eSoM variant are introduced:
> > >    - CQM: retail variant with integrated modem
> > >    - CQS: retail variant without modem
> > >    - IQS: industrial-grade variant without modem
> > Industrial/consumer variants differ often only with thermal, so how is
> > it here? Thermal difference does not make them incompatible. Honestly,
> > usually industrial one does not even receive dedicated compatibles.
> 
> The IQS variant uses a PM8150 PMIC, while CQS/CQM use PM4125 + PM8005. These


This should be part of commit msg. You explained WHAT you did, not WHY.
We see the diff and we see you added cqm, cqs and iqs...

Also:
Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

Best regards,
Krzysztof


