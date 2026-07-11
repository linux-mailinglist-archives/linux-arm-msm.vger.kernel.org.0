Return-Path: <linux-arm-msm+bounces-118493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7ZCkDGCKUmrcQgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 20:24:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B337427C6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 20:24:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=U3Rzk49z;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118493-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118493-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31F5F300DDDF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 18:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34DC2BFC8F;
	Sat, 11 Jul 2026 18:24:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825FB250BEC;
	Sat, 11 Jul 2026 18:24:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783794269; cv=none; b=KMijNuGMREczF6BFshcfDT7Fz5TbtjnDJa6c9QgrD0SQcJRd4hjnNRxMGam1dlA4ahG8m54BefcpSE5NWXdvFKU36m4ionMf5RAvedTYsiPNMyG/QbgTsH052sc9aYjtpkCFS2bBVDJCt3Rw3e55X2voQ1ihhJ+TBXLASrNWXro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783794269; c=relaxed/simple;
	bh=59QFvNh+R0E4a9ilNB7fXm4jg7Sro8iXc+N7g0UYvKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LtcbQxOTtG1a0Jpwc5KdUy2Ds2TvUAXk39uffEjMvX65Q2p6PoQk266VFLQC7nmb/4UTBWUJz0FG5vfZcUj8bX8RM4zGyMmesPEDWFYM6J3u5mzZ1HCYdBGwumVoiri7xLpsxAEutOMsosVsqW8zqR6Vm+ALOXGjMqVGDCvuOPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U3Rzk49z; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E013E1F000E9;
	Sat, 11 Jul 2026 18:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783794268;
	bh=MOnSftGWUGx7G7EEKEGekpV83XZP1z2R+lUyQigUCk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U3Rzk49z0V7YEdDrT9DK2kUB6O71gJWmLsyevpMMm9SaBRhICzGz8n1VRKb4LnA5b
	 WyUtZLC1F4aHGqetwB37fN0iO4OGt0/iwa2J9zFlpUwGZQYIuB6tHmJb9b6w9tcJSQ
	 rmHtunoBnyhLfjzocpbCHS8flFhIo9dyHjrB1J2Fv1+XJR/VkqVuM8lGl8U9GHlIbC
	 hZ7D3UT3hJ4mHQabMyaEkj9RD50dz65yFa/lhldOkKlUCDbRf1zuvcYVZyk8l1Zx6r
	 mVmV40Psg0+nLJdNBhV8L6Eel95dmb/LxKcfI3o19L9XLMy4AgHfOyz5pZLCOwr6tv
	 5lZLgovzYB6Dw==
Date: Sat, 11 Jul 2026 13:24:24 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Michael Scott <mike.scott@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, 
	dmitry.baryshkov@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com, abelvesa@kernel.org, 
	faisal.hassan@oss.qualcomm.com, linux-phy@lists.infradead.org, konradybcio@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, val@packett.cool, laurentiu.tudor1@dell.com, 
	alex.vinarskis@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1-dell-thena: bump linux,cma
 to 256 MiB
Message-ID: <alKJcT5d7SI-iOgz@baldur>
References: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
 <20260521010935.1333494-5-mike.scott@oss.qualcomm.com>
 <ac559877-f4f2-48d7-b00c-4cf24fc64489@linaro.org>
 <581cc180-b993-4b86-81ae-17822a35a1fb@oss.qualcomm.com>
 <a03fa27c-57ad-48e3-9223-b4d30978ded5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a03fa27c-57ad-48e3-9223-b4d30978ded5@linaro.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:mike.scott@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:dmitry.baryshkov@oss.qualcomm.com,m:wesley.cheng@oss.qualcomm.com,m:abelvesa@kernel.org,m:faisal.hassan@oss.qualcomm.com,m:linux-phy@lists.infradead.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:val@packett.cool,m:laurentiu.tudor1@dell.com,m:alex.vinarskis@gmail.com,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:alexvinarskis@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118493-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,kernel.org,linaro.org,lists.infradead.org,packett.cool,dell.com,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,baldur:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 79B337427C6

On Fri, May 22, 2026 at 10:33:45PM +0100, Bryan O'Donoghue wrote:
> On 22/05/2026 18:16, Michael Scott wrote:
> > > └─[$] <git:(0.7.0-multipass-v0*)>
> > 
> > Good point about the libcamera version. I debugged this on Ubuntu 26.04
> > (v0.7.0+patches). I tried testing v0.7.1, but it caused a crash due to
> > API changes with other parts of the subsystem.  I checked the diff of
> > upstream between v0.7.0 and v0.7.1 for the dma allocator code and I
> > didn't see any changes, but I wasn't looking at the software ISP
> > changes.
> > 
> > This highlights that "I'm doing this wrong". I'll move to a cleaner
> > rolling distro where staying current is a lot easier.
> > 
> > The GPUISP support looks great!
> > 
> > Dropping this patch as I'm not understanding the full allocator story.
> > Sorry for the noise.
> 
> The whole make CMA bigger thing is an error I was pushing myself.
> 
> CMA is required for some systems like say Hantro on i.MX where - the encoder
> doesn't know how to deal with non PHYS contig memory so when you are passing
> framebuffers around from once hw block to another, you need to make them
> physically contiguous.
> 
> Not a problem for us on Qcom hw though. Like Rob said, I'm actually not sure
> why we need a CMA block on Qcom hardware at all.
> 

&pcie_smmu { status = "reserved" }; means that typical Makena and Hamoa
machines need CMA. Which should be unrelated...

Regards,
Bjorn

> GPU or WiFi I think but not for Camera anymore anyway.
> 
> ---
> bod

