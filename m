Return-Path: <linux-arm-msm+bounces-114743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rHP2MZuKQGpngAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 04:44:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBD46D2FB1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 04:44:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=n35NRAFr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114743-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114743-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1E6C3300621C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 02:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89E88265CC2;
	Sun, 28 Jun 2026 02:44:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5B1266B72;
	Sun, 28 Jun 2026 02:44:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782614677; cv=none; b=uCjAwnID6hedG17WIPYSET4LnxrOqyCErXNWJvYkuYYn+KVJRnoITu7pm01n44smcOcs2DkNC6M+HKkUeXmlJeg7NuPrd/ymOMH2qncOTxWrhR4OzJ0meHjF4XpwD8OL5K7h1WghZDsfg9PaLKh/a/Y3IPV2+Ge7Hy5qShGxfp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782614677; c=relaxed/simple;
	bh=oBo/AMEikq7jbB192C8EGmlAK/tfWAX18hIfPxjCIPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8GI+/BFNJJlTpa0mkxh2nCXKpJWMNWsG6CT9SMm1h4scZQ1KCcgNkdsh2Yno8HOV9A4SMWY3CHyvduJ6qDH/Lup9qtktvycbw9d7ao/QtveiNB5rM1zl4wFjjEobCN7wUSroPwZICLLwfDsJd1HDkKYKbiVlIZ1ovg4FQDJwQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n35NRAFr; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E70B81F000E9;
	Sun, 28 Jun 2026 02:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782614675;
	bh=8rbBQzz8+AOcEYmskmQWTiUtib75kMIGx92siQxG0+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n35NRAFr5LRyxVBKQ+hRIs+35r8fOaD0DJSjfOJGzjtE++FZ/1Y/i1X5yYXAevClj
	 sZnbsU/9Fc4nNqIhxuH0m9M+ZEiytWe+wtVMrTCPp9y+DjsBwzUEuCpDTko44STUFe
	 XRj5MTv+yIc7/p4I9q+UmwPVhMC4agpwQZ/WRj5s6WSUWBHttUPyhCT3gA2eXqzGA+
	 gg8JUeNQbMBU/Bk/XJtMXr5Lxa1c5ysC+Boja7hSirxMGa4n29sezPoM5mMFIPsTcx
	 XpyHtDG5AlWvekbLLmM6+Ftr2GDR4WXhYsVjIZAFYP/sKA1i6a9ttWJY3tu5UZq+Ei
	 CDsueTWsfYmSg==
Date: Sat, 27 Jun 2026 21:44:31 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>, Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>, 
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur: fix QUP serial engine IRQs
Message-ID: <akCKUAa-Yqh3xEZT@baldur>
References: <20260611-glymur-geni-irqs-v1-1-269428faeb6d@oss.qualcomm.com>
 <hdq5iicr3sawlkhxmeut4ms4n2x7zocwva44lhnjqjfneqwtwe@3amlnfuuanie>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hdq5iicr3sawlkhxmeut4ms4n2x7zocwva44lhnjqjfneqwtwe@3amlnfuuanie>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:pankaj.patil@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:manaf.pallikunhi@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:sibi.sankar@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114743-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,baldur:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BBBD46D2FB1

On Fri, Jun 12, 2026 at 02:04:05AM +0300, Dmitry Baryshkov wrote:
> On Thu, Jun 11, 2026 at 05:22:37PM +0000, Bjorn Andersson wrote:
> > The Geni serial-engine interrupts from QUP wrapper 0 all fall in ESPI
> > INTIDs space. While some of the i2c instances has gotten their
> > interrupt specifiers corrected, even the other functions on the same
> > serial-engines are wrong.
> > 
> > Ensure that all the serial engine interrupts for QUP wrapper 0 matches
> > the datasheet.
> > 
> > Assisted-by: Codex:GPT-5.5
> > Fixes: 41b6e8db400c ("arm64: dts: qcom: Introduce Glymur base dtsi")
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur.dtsi | 26 +++++++++++++-------------
> >  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> What about the SPI / I2C controllers which are a part of qupv3_1?
> 

They are well inside the SPI range.

Regards,
Bjorn

> 
> -- 
> With best wishes
> Dmitry

