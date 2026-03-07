Return-Path: <linux-arm-msm+bounces-95986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LyoGllerGl/pAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 18:20:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F9222CE1A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 18:20:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C95383011870
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2026 17:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2081227A92E;
	Sat,  7 Mar 2026 17:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="DYyM21Js"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA2126B973
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Mar 2026 17:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772904013; cv=none; b=uq6Nt2Xb3dSpRSO3SvLbse5OlTzYSDGZAkW9mhDQF+XOo76EYYBz/rJkQaD39eOWqdeaUQXCFdSEtolxIRvrR5S0ObHc5waKC/oJeRVa6kWonbtXxMqIPQIcvwRVtYDs7QL/bCCDVU2Xlw4vppHrxl/oa5VR8RqKdLtKNlJdk2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772904013; c=relaxed/simple;
	bh=41c5YB62NkVj4QXCQGXjaY+g6aVFcAXV/YuneE0W+eA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ndAonSfk4z0McjF6BUoPZnUxzzr4OKA1xRhaIRmgYBxet1/12/y29YOWUMugSwkCF1gbP24+zRaSGjL16WCGXYBRdrjPfBBtrOg466hCJNNxXuhHHDuXSzJVrQpGrz+EsF2MLML3e4sCDu2jaO7c0ghGrIWhGQwsLC/UkfRi/qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=DYyM21Js; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 33BBF240028
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Mar 2026 18:20:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1772904009; bh=TeLxd/uTrJmEOGEZ+zvsDQYaz9O1UZJAm/pt9kYs3jc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:From;
	b=DYyM21Jsw6HGFIq+iKmRwlI972EckAKed3Bet4l2g4AiDmrGs4m5bvpaDyaldwGfv
	 7AdVJWDQVVTRotuzxNbgk2iN3fI4ahR3rIS4YnGT0XGn/Nv3pFpekfupgg+sbiNx5J
	 3x62Z8SOJwryvCfgO3a5m9eh8JcndoEfUo10D7snLweSe4T/4HOqdD4oPtU+3iivZu
	 OqVyCbkXHnGLuTMTInToJmoI7wmEZTwinJ7fp5go2wowxywBCYXimR81DB84dnPxjQ
	 bDsaXKyoefyIcek9qMVsxcUYKRk+S5YggumoqGJaWVzJZvk/mRv54B6Q1MFi1p4ZvD
	 0RBdShfudgZuA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fSqlq38qwz6tws;
	Sat,  7 Mar 2026 18:20:07 +0100 (CET)
Date: Sat, 07 Mar 2026 17:20:08 +0000
From: Paul Adam <adamp@posteo.de>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: msm8916-wiko-chuppito: add
 initial devicetree
Message-ID: <aaxeRXsQlR-1CTKV@MyryksLaptop>
References: <20260301-wiko-chuppito-v3-0-9b36a2a7aed5@posteo.de>
 <20260301-wiko-chuppito-v3-3-9b36a2a7aed5@posteo.de>
 <aalRKuqzX48PzyL-@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aalRKuqzX48PzyL-@linaro.org>
X-Rspamd-Queue-Id: 14F9222CE1A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[posteo.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95986-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[posteo.de:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adamp@posteo.de,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.967];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 26/03/05 10:47, Stephan Gerhold wrote:
> Did you mean "sleep" instead of "suspend" here? By default, there is
> "default", "init", "idle" and "sleep" [1], although drivers can request
> custom pinctrl states as well.
> 
> Note that even with "sleep", the pinctrl state will be rarely used on
> Linux. Drivers need to explicitly call pinctrl_pm_select_sleep_state()
> to trigger these, but only few drivers do that [2]. From a quick look,
> I suspect that only the &sdhc_2 sleep pinctrl here is currently used on
> Linux.
> 
> That doesn't mean that you can't add these pinctrl states (the DT is not
> supposed to be specific to one particular operating system), but it does
> mean that most of these are effectively untested right now. I would
> personally omit them.
> 
> [1]: https://elixir.bootlin.com/linux/v7.0-rc1/source/include/linux/pinctrl/pinctrl-state.h#L36
> [2]: https://elixir.bootlin.com/linux/v7.0-rc1/A/ident/pinctrl_pm_select_sleep_state

Thanks, I will remove them.

[...]

> Does this need to be always-on?

Still works without, will take it out.

Paul

