Return-Path: <linux-arm-msm+bounces-119186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KIrmAwhOV2rNIwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 11:08:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD9B75C3E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 11:08:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Pf7KbW7D;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119186-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119186-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E410D316452B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 08:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C1563DA5B7;
	Wed, 15 Jul 2026 08:54:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923BB3D9552;
	Wed, 15 Jul 2026 08:54:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105679; cv=none; b=sx5bxY8vfYqKiCYko5/iF7T8LZyj+XNmt+hQqd6iJKRpMs0YSucsAjttUxReDf8EWfC7AXYOxk8UT1kLR864BJprX+kg2YdBf0qvw6WGlgom5cm8ghgcR2b+eKdR9Lz+G0jB+9ITXRx5Q1bnbczYmM1iMn1z+XvdKE9x4A4rx5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105679; c=relaxed/simple;
	bh=kKa5i3O+lTaNX3MBMykdBIvndb2viq76Ss6Dd3Jb5Oo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cyxUFDv0CE0JFOnQEHJ27pL5iuXhOhXrui+89uPHFTr6fmPi83mRz/BttF2Pg8YtkZGfFC9IW7fPS+Aek6NOhT+aLFMkWNZjpZeHdwwZJz99SaJZ06qA2uleIPxmEFeZVkM1tpwACt38Pu48jQoHLosiqrD2mEROUDm+DyrD0zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pf7KbW7D; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 186081F00ADF;
	Wed, 15 Jul 2026 08:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784105677;
	bh=p4bbLxO6+Mcw6D/fGu0RpC/0XogS4o0qXioEZd6VANI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Pf7KbW7DHueek+8LJwHPtlRFoPHHsFa5/IENerYDmRvzWGV9IJzGXS/b5kNHTHylY
	 4RytBAE0iCbWf8p+bFuYDs9E9rUxGB+jJrLMiUCEzfarYkg5pDmnSkRw8l6wOonAye
	 tA6Xunp67X8YVH1cSadYKnQpICyYp11EFn0kUkXvqOR9+uZtbmQeEa3XChgMuqboUk
	 CFTKCYjXPbebDVhI9ejCSQ5JXULV+SQky1H2SYvgSRq1fPhZyx8HPMjAvB1cDyAEhL
	 Z9FOXFYd0aCfO+kUT2q723wJ4//qLNEYdNs6ts5jKvwCGf7e8Ss4bmf2Ok9ZoG9mLa
	 ZCx2LBqO45zGQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wjvNz-00000005DLs-0IQS;
	Wed, 15 Jul 2026 08:54:35 +0000
Date: Wed, 15 Jul 2026 09:54:34 +0100
Message-ID: <86cxwoocol.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Sneh Mankad
	<sneh.mankad@oss.qualcomm.com>,
	Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio
	<konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner
	<tglx@kernel.org>,
	Shawn Guo <shawn.guo@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: interrupt-controller: mpm: Document power-domains property
In-Reply-To: <3dac25b9-a464-4350-aff5-0ada4dc1d65e@samsung.com>
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
	<20260713-b4-shikra_lpm_addition-v1-1-3d858df2cbbf@oss.qualcomm.com>
	<87ik6i6i22.wl-maz@kernel.org>
	<CGME20260715063901eucas1p2a4c2d72e4d9dbd9fd2f1e686d1a6c89c@eucas1p2.samsung.com>
	<3dac25b9-a464-4350-aff5-0ada4dc1d65e@samsung.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: m.szyprowski@samsung.com, sneh.mankad@oss.qualcomm.com, ulf.hansson@oss.qualcomm.com, andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, tglx@kernel.org, shawn.guo@linaro.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-119186-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:m.szyprowski@samsung.com,m:sneh.mankad@oss.qualcomm.com,m:ulf.hansson@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:shawn.guo@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[maz@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maz@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,samsung.com:email,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8BD9B75C3E7

On Wed, 15 Jul 2026 07:38:59 +0100,
Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> 
> On 13.07.2026 17:11, Marc Zyngier wrote:
> > On Mon, 13 Jul 2026 11:25:41 +0100,
> > Sneh Mankad <sneh.mankad@oss.qualcomm.com> wrote:
> >> Remove #power-domain-cells property and add power-domains property for
> >> MPM device.
> >>
> >> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> >> ---
> >>  .../devicetree/bindings/interrupt-controller/qcom,mpm.yaml          | 6 +++---
> >>  1 file changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
> >> index ebb40c48950ab3a8fc86f5708acfc33c33d68993..3f9645fbc3c20633077aaa589e5d5a43928dab51 100644
> >> --- a/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
> >> +++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
> >> @@ -68,8 +68,8 @@ properties:
> >>          - description: MPM pin number
> >>          - description: GIC SPI number for the MPM pin
> >>  
> >> -  '#power-domain-cells':
> >> -    const: 0
> >> +  power-domains:
> >> +    maxItems: 1
> > What makes you think it is OK to change an existing binding in an
> > incompatible way?
> 
> 
> Ulf suggests that this has been modeled upside down in the initial
> submission:
> 
> https://lore.kernel.org/all/CAPx+jO9d1qH12mxg-n1rkbp6Xd__sdrSMeoc7CPELE+jgxRYHA@mail.gmail.com/

Sure. We have collectively fucked up a lot of bindings over the years,
mostly because of the lack of accurate documentation and people not
giving a damn about the correctness of these descriptions. I'm glad
that Ulf is now able to make it right.

But that is not a license to invalidate DTs retrospectively. We don't
update DTs in lockstep with the kernel (I *never* do), and something
that existed must be supported in the long run.

Properties can be deprecated, but:

- they must be kept in the binding

- drivers must still honor them if they are present in the DT

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.

