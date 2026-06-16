Return-Path: <linux-arm-msm+bounces-113432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dmURN4ZWMWpUhAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 15:58:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 658636902A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 15:58:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="CsPAd/BJ";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113432-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113432-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0356A3077DDB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D2433AD9B;
	Tue, 16 Jun 2026 13:53:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9472303C9C;
	Tue, 16 Jun 2026 13:53:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781617998; cv=none; b=Lyso1GmTBCT4z/Mo15m1UBgz07yZ+esCGP742ChP0MzTdqsoS8XvJRkQo1cxtURvdmWKJPyuPZOYS+dFHuA+to+QVe+XQnCqbSPatIi/b86T7dngcNBseFs8redxo3uNKOyC/6eUspdkD3UxRRLn4K90OainHbMivC9DoI4N5cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781617998; c=relaxed/simple;
	bh=WTatwfI22UxeblDbcKSwQlC1ZG2dALRea85VAx0sQzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i7Y1Zz/K6ejCTvbstRbMzCNfWjsH20l4vjIRA/mHY/+HoV+etp1mW+F3P44PwBRiIndRGPhrz6ixHDo9VgIa2bHdoBjV36btl6p6/OEuIxedb11y0m9VUqIx9E5BIhjKnvqAy6RIDa71qruhPIc1JQCHJTqckjS3S208mv+JHu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CsPAd/BJ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26BE91F000E9;
	Tue, 16 Jun 2026 13:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781617997;
	bh=8apPuupUBTzcIqJ0vwU4f4jvZub+nypFR7A9VH4COf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CsPAd/BJrw+CCOe3DOSKfMW83AbCDWFD+KFf//7HsTS9WqH4VeLPFQPicm/gvvGO9
	 JiAWh505xKBXng+USuqaSw5W7Bf/qVk780fmSiFqeuHwdk/dhKZnAoUVtrMQ/hmnBR
	 ffWpRFg+oct606/DxKUagD0MbiC0Oqil0zWWctXp8DKsvwGEoR3gi5a2MaCTmH6Pd+
	 wfYQH8stWS30BAiluKBbQ+oKAvr5IlH9yivFy8crxdshkODLRFxlopCayQQlsKLkF5
	 0r7B+M/p5la6HrrGUoEFUYiIyriOMTqxtTT0c5UCDYhDx+3fhoUsYOLeWPWqr82f6a
	 OdWR+PPJVNltw==
Date: Tue, 16 Jun 2026 08:53:13 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH RESEND] dt-bindings: interrupt-controller: qcom,pdc: Add
 Maili compatible string
Message-ID: <178161799282.2361519.14936351019925087319.robh@kernel.org>
References: <20260615-maili-pdc-v1-1-add21e8eec3e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615-maili-pdc-v1-1-add21e8eec3e@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113432-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:yijie.yang@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:tglx@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:krzk+dt@kernel.org,m:andersson@kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 658636902A1


On Mon, 15 Jun 2026 16:28:37 +0800, Yijie Yang wrote:
> Register qcom,maili-pdc as a supported compatible string for the
> Qualcomm PDC interrupt controller binding.
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!


