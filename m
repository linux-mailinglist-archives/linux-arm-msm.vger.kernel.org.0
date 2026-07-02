Return-Path: <linux-arm-msm+bounces-115838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZgXbNK8KRmrAIAsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 08:52:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9FC6F3EDB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 08:52:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=HmFjEHGg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115838-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115838-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8D3893004F10
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 06:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F19738E113;
	Thu,  2 Jul 2026 06:52:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C6038C2DE;
	Thu,  2 Jul 2026 06:52:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782975130; cv=none; b=DZO/IglvThZ0mczZvLc1v3K2X8hyPpDU5JUkhaUIlZSJ2i0BSxAjkauknaManstQlHwx3OoDJAfyylBsjOS6ux+94ncR3a2oaLlPePwGwuwndYVfcecOaJNDnrRoTiB5Q6oLwZS4O37DGpUzSbmEIjVbAU8OzRpTX0HBfTdiv/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782975130; c=relaxed/simple;
	bh=z5juTYppv3hglVk9pFl3OKQfrrA2rLpOq/fWAfzpx+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BEwOb/OaxNjacef6/QEOAlnlEBXgQM5h6rcS85qu0BqiTZfTWslp8Uf6woAPbEZvEfttrrOrM5uUZTZ+TaJ9guMxdNKP+u2OU8H3PZ0PNyFOzHwK82u2Km10XS7ZqC1mmvfiK2D2n5RiMQBEFXoSrWHLDyghznLi6dfm2lHxVuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HmFjEHGg; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D2D1F000E9;
	Thu,  2 Jul 2026 06:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782975129;
	bh=cwYgFh/lIOQM8280g3jiflfg/eoy6mG7p30/EL3zVVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HmFjEHGgekX+zAC2pTg/5wJAUay4UOvoh3XnYl0eIOJQzVqlc/8roKXFhHFWdvu/f
	 bLJo30g80chzGsMZ8wnpsWOBcNi8aqLk86gqeMgU66zKIOIeYvb6U0p1dYuV00QJim
	 TiZ2LPzaw6WKWIO2AbbXQdCBp8bg6IqHpekvcJmOJgumDx7VN33MV9rQd+Rlho+46p
	 ofoq8lJe/2kZcjIQM+zdqkPYsrS0Kq4pnQkHYAmX492Glonf8m4qpq7FuHOhscmsfC
	 YU9+e4kDxVTEzYXy0/QMSZ4br4ou8SdxhVBhKLIgFF/N3c2PRdCFF2TzX/5IPVlF09
	 ZQCpEJNSOnDjg==
Date: Thu, 2 Jul 2026 08:52:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Harendra Gautam <harendra.gautam@oss.qualcomm.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/11] dt-bindings: sound: qcom,qaif-cpu: Add binding
Message-ID: <20260702-upbeat-furry-cuttlefish-d12f4d@quoll>
References: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
 <20260701105757.2779738-2-harendra.gautam@oss.qualcomm.com>
 <c1a5a8ac-9e09-406b-bde7-bca74af6bc2f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c1a5a8ac-9e09-406b-bde7-bca74af6bc2f@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:harendra.gautam@oss.qualcomm.com,m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115838-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AC9FC6F3EDB

On Wed, Jul 01, 2026 at 01:04:23PM +0200, Konrad Dybcio wrote:
> On 7/1/26 12:57 PM, Harendra Gautam wrote:
> > Add a dt-bindings header for the Qualcomm Audio Interface (QAIF) controller
> > DAI IDs. This provides shared constants for devicetree sound-dai references
> > and QAIF aif-interface reg values instead of using raw numeric IDs.
> > 
> > Add a Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU DAI
> > controller used on the Shikra audio platform.
> > 
> > QAIF moves PCM data between system memory and external serial audio
> > interfaces through the AIF path, and between memory and the internal Bolero
> > digital codec through the CIF path. The controller needs a binding so
> > platform Devicetree files can describe its MMIO region, DMA IOMMU stream,
> > clocks, interrupt, DAI cells and per-interface AIF configuration.
> > 
> > Describe the single register region, one EE interrupt, the required GCC
> > LPASS and audio core clocks, the DMA IOMMU mapping, and 'aif-interface@N'
> > child nodes used for static PCM, TDM or MI2S configuration.
> > 
> > Depends-on: [PATCH 0/4] clk: qcom: Add Audio Core clock controller
> >   support on Qualcomm Shikra SoC
> >   https://lore.kernel.org/linux-clk/20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com/
> 
> This should most definitely not be part of the commit message (which
> lands in git history..)

And internal review (by tools and/or by people) would tell that, so no
one ever reviewed this internally. Neither our internal tools did.

Best regards,
Krzysztof


