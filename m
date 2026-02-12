Return-Path: <linux-arm-msm+bounces-92700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJCgBqzUjWlA7wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 14:25:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B2312DC87
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 14:24:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6E87D301CDA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 13:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E9A35B630;
	Thu, 12 Feb 2026 13:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RQCLyUl7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B5B3502BE;
	Thu, 12 Feb 2026 13:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770902695; cv=none; b=ElE9xyq8f/nThb2Y067DeB0F/d844fFaAZbHnoCsMvfhJUwNEP8ZKXJ0G1UVKYmylsaBq5brOm60KO4XsKW5QuOkXocuoPqe8/lVwKgeO5azOrbD21yQBzShjkZP0b+M6Oi1K7EB/G9GwQLdrk1mq5XHdf0kuDabWbW2laMMEDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770902695; c=relaxed/simple;
	bh=3W47sWgbdsLfZh/NdwqxiVWYn/yjoN2UVZ4sy5Q9l10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NWNS8vxbkZv9zeJIhkesGYjAT/GXo7y4aTCd4MF6HOXKe/hKBvyNYb1B1auus86C2r92AxzwslDrUqsied9o7EjGT1LZdtRYsxifKdjFGADEZ/92eFP2Z/KtmN6qSZ8KSi7ArTWmHiiEgbGid2atlvkF6SnNSDBp5yo6JBRetlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RQCLyUl7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C14EC4CEF7;
	Thu, 12 Feb 2026 13:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770902695;
	bh=3W47sWgbdsLfZh/NdwqxiVWYn/yjoN2UVZ4sy5Q9l10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RQCLyUl7kJd3DUhlY/VfK74JyXS/Q1ir3lgVmZeUldpqARrYWbc2P2my9gJXw4e/W
	 IosrfpEp1bgU6caupsUyPGTAn1kXTCYR8qv4RlmfznjKSTeJeR4NKg/HzeNpuSALFk
	 XlX387aD0nXfg9Z5HENBrLT1piyQm8omwGdVtgvgDX3oxatO1/9qUXQrbckguStlDo
	 PeUrDyY8q4G7Mwaom97i6tZ6Q17tVuwAFpShhrqqOzyk4dBLIObAMXEvrAjnDtL7wi
	 sJpiPoYSQekD/63dHsizVjcwvwMScHvc7NA5foazYVb+XPY+NH+opZnfSWfaCHsurG
	 9i94RvntYp0jg==
Date: Thu, 12 Feb 2026 07:24:52 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Enable tertiary USB controller in OTG mode
Message-ID: <cuaantvlrghl6wf2zqg7rjodsxzj3cegjdml73ax2k7sffl5mn@osbasubcz5rl>
References: <20260210125348.2800846-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210125348.2800846-1-swati.agarwal@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92700-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 80B2312DC87
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 06:23:46PM +0530, Swati Agarwal wrote:
> Enable tertiary USB controller in OTG mode on lemans EVK platform.
> 
> Changes in v2:
> Added interrupsts for all expanders.
> Minor formatting changes.
> 
> Link to v1:
> https://lore.kernel.org/all/20260206104642.1038381-1-swati.agarwal@oss.qualcomm.com/
> 
> This patch depends on:
> https://lore.kernel.org/all/20260122092852.887624-1-swati.agarwal@oss.qualcomm.com/

You're the author of both series, there's no reason to have them active
at the same time. Group them together, or prioritize finishing the first
one.

Regards,
Bjorn

> 
> Swati Agarwal (2):
>   arm64: dts: qcom: lemans-evk: Enable GPIO expander interrupt for
>     Lemans EVK
>   arm64: dts: qcom: lemans-evk: Enable the tertiary USB controller
> 
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 96 +++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/lemans.dtsi    |  7 ++
>  2 files changed, 103 insertions(+)
> 
> -- 
> 2.34.1
> 

