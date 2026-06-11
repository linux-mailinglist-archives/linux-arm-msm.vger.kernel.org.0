Return-Path: <linux-arm-msm+bounces-112787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Pp3OBD79Kmr00gMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 20:23:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C9A674689
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 20:23:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=fZvC0BiE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112787-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112787-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49D12321C40B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 18:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 395CA4BC014;
	Thu, 11 Jun 2026 18:18:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6452544A739;
	Thu, 11 Jun 2026 18:18:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781201925; cv=none; b=m0nOECI+PhofYrsQhded4cy8LprM3+ys4EE46ytLkXarbefHR/SRav5QZdQ1dOuI7FmusMulo/scimsx5GGU7V9fYFuhSLfo5N5gsbEFjwnffyep8qv1HulQDHfAXsAoxb2ZgkUvwFH3Jgu88Kjiobcuj6rLKGsZOuM5E4y1hfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781201925; c=relaxed/simple;
	bh=031qLjuDRfakEuZQ/std6tMWIl4uwcgzuDI8YGO20Qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pqDLX3FDNghgNnGUTGerTE1Y/bbYI/NjlUyt3NUqfJtW+/o8uD0nRq+KvIordig2qTdaX6obHRHcBK7v87GIq/yrKvkszb6DfQELqaktLD+TO6a8r/Qq1CUcu9H9JawyIfEBx5byewkzyNhYAFPlFpfpZ/e+R9Ec0dSbi/zWr3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fZvC0BiE; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9023D1F000E9;
	Thu, 11 Jun 2026 18:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781201922;
	bh=hFDThq6/pkUuUwQ7LYJNLndIpy/hj5He8RSY5SpOSt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fZvC0BiEi32YEBEdq5HvP5IDSdLpIuV9cUDrDHwtdZou2rrIQMM0GccYpPAWbQDBp
	 W02MrzBwmpHNpLj87aspCMDaAPfDCIohPlhA0unELniCoZYpFuLapjdy9UalsAttX4
	 xawD7WHb7gwdyhDsutvgskPg14AGRFZylTCAPBUKSI02BdDpwlQGPyKOEusJtYzEug
	 4w6LXBbeSC/LE3EGxzXOeCDvi1K5YCVwTe7/l7CSjuGkvJ+W8T0Fb3nbz93FvMhwUY
	 Hqh0OtjqAtjAmSNY24k3ccNGdcct7+d82HTKY4MJCIXyDARba7v+uLOVYvttbpt/vT
	 doJIkh0NBBjrA==
Date: Thu, 11 Jun 2026 13:18:41 -0500
From: Rob Herring <robh@kernel.org>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Ulf Hansson <ulfh@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-mmc@vger.kernel.org,
	monish.chunara@oss.qualcomm.com
Subject: Re: [PATCH v5 1/5] dt-bindings: arm: qcom: Document Shikra and its
 EVK boards
Message-ID: <20260611181841.GA3163205-robh@kernel.org>
References: <20260611-shikra-dt-v5-0-103ed26a8529@oss.qualcomm.com>
 <20260611-shikra-dt-v5-1-103ed26a8529@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-shikra-dt-v5-1-103ed26a8529@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112787-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:komal.bajaj@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:quic_wcheng@quicinc.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:monish.chunara@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 51C9A674689

On Thu, Jun 11, 2026 at 03:40:08PM +0530, Komal Bajaj wrote:
> Shikra is a Qualcomm IoT SoC available in a System-on-Module (SoM)
> form factor. The SoM integrates the Shikra SoC, PMICs, and essential
> passives, and is designed to be mounted on carrier boards.
> 
> Three eSoM variant are introduced:
>   - CQM: retail variant with integrated modem (PM4125 and PM8005 PMIC)
>   - CQS: retail variant without modem (PM4125 and PM8005 PMIC)
>   - IQS: industrial-grade variant without modem (PM8150 PMIC)
> 
> Each SoM variant pairs with a common EVK carrier board provides debug
> UART, USB, and other peripheral interfaces.
> 
> Add compatible strings for the CQ2390M, CQ2390S, IQ2390S SoM variant and
> its corresponding EVK boards.
> 
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Missing Krzysztof's reviewed-by.

