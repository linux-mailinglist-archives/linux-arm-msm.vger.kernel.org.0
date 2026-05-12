Return-Path: <linux-arm-msm+bounces-107018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMDwBWp+AmrCtgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 03:12:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 949245180ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 03:12:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D797301571E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 01:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6728246783;
	Tue, 12 May 2026 01:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tu53em73"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814E821146C;
	Tue, 12 May 2026 01:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778548326; cv=none; b=rmb+yorGXek+pCR03F9pEFT8W10Lq/T3WwEC8pmJR0qSU/ObJhk9TkUDffa/hLqqbGLUUOfPTlte8IV29iDzBWZrOtfq3/i4beza+yxJcMNJwXXFonVG0uaxaJnSB3XO0HbxhyfHBp1xxsB89csfeQB7PMqetZ4KQrHbX4XbU9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778548326; c=relaxed/simple;
	bh=gR8Xad+Bnfc+qAKzBc7L8CKzJpi6ksY2SQ9rHR1oW8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZI2ExdI4Xi+L3klD9OevvhiCqiUOp/wP6VUQjAa+hZjsHedHP4JEI9Z4xzMBeCyky++UFuGG5sQEz7umgxRrLwxMkIzPPqs+Fxn0613xZT86irHlvCbmf6zWrAZ3yipyEyBKd1XnnRSVBheaFpo/2qaCEdzwmMZSXtZlwgGqbzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tu53em73; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56314C2BCB0;
	Tue, 12 May 2026 01:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778548326;
	bh=gR8Xad+Bnfc+qAKzBc7L8CKzJpi6ksY2SQ9rHR1oW8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tu53em73kF7B6rmK0gkuqQSR7uB/PXP/A8YfIxIxk9f8HuuXREs3luNo02d23IchQ
	 NmJaDwZvN0+88NzEm14Xh0OeOXEu4VUvif8QLmiBfoP8Z1KyXATIXei/ZM8wRMeBva
	 vX7LtEc/3EQ/7/xxspn148tSi/DSV2NLZZ/6B9a8j2BwzN/FMd1W7Byt05HZ8klPxX
	 TrnrFv9aTG9EfWu+ND8AQy0crAmvfsnVAORAH/C51OOsP14P0fr0rNf7rRd6rmvL6P
	 M9r6c43l8p+t9lbEkS0ZpUgy5QCEZxZ0ZeQydFkITw1IKEPfD7wSwPn4CcNoC2kyFo
	 XSlHbij8ozRpg==
Date: Mon, 11 May 2026 20:12:01 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: qcom: Add device tree for Nord SoC series
Message-ID: <agJ-Qc71PloUM1pI@baldur>
References: <20260427023455.236410-1-shengchao.guo@oss.qualcomm.com>
 <20260427023455.236410-2-shengchao.guo@oss.qualcomm.com>
 <20260428-dangerous-garnet-collie-dacccf@quoll>
 <e1a84d37-04a1-4c36-b6c3-f8830df9a744@kernel.org>
 <afCxhUaxLEcbosvV@QCOM-aGQu4IUr3Y>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afCxhUaxLEcbosvV@QCOM-aGQu4IUr3Y>
X-Rspamd-Queue-Id: 949245180ED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107018-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Tue, Apr 28, 2026 at 09:09:25PM +0800, Shawn Guo wrote:
> On Tue, Apr 28, 2026 at 09:28:47AM +0200, Krzysztof Kozlowski wrote:
> > On 28/04/2026 09:24, Krzysztof Kozlowski wrote:
> > > On Mon, Apr 27, 2026 at 10:34:52AM +0800, Shawn Guo wrote:
> ...
> > >> diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
[..]
> > >> +			compatible = "qcom,oryon-1-5";
> > > 
> > > I asked you to send this binding WITH the user, because they go via
> > > the same tree. I see the user, but no binding for it in the patchset.
> > 
> > And few others like SCM are also missing. I am talking about this many
> > times already, to multiple vendors, and I am still surprised why people
> > on purpose give more work to the maintainer. Well, not my tree, so not
> > my work, but if you ever wonder why your patches are not applied for
> > longer time, that could be one of the reasons.
> 
> Yes, I should have sent all those bindings targeting Bjorn as part of
> this series to make it easier for Bjorn.  But I'm not sure cpus.yaml
> change is one of them, as I'm sending it to Rob.
> 

Not sure if you have settled this by now, but I can merge such binding
change together with the dts change.

Regards,
Bjorn

