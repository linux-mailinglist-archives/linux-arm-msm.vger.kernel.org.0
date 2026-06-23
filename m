Return-Path: <linux-arm-msm+bounces-114113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VxASDrpIOmo15QcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:50:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD346B5649
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:50:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=QI+SsjlK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114113-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114113-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDD9B302BEBB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 08:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A97E7342173;
	Tue, 23 Jun 2026 08:47:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA06C340A52;
	Tue, 23 Jun 2026 08:47:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782204441; cv=none; b=VOlK0j5SDq9JfaxHyXXJF61l+HgSyhTtOOBwsekYM3It/QMaq+NkRKnliVb//Hls5DZ/YHBn91w/RITzw4bJKHSzQsIdwxF8ycTNppqKuvpqjGVp81nlLmmKjw88HyRtikG7USLAQSBN1ewqRXPDTbD4wYPklWQJ5RHlEtZsRwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782204441; c=relaxed/simple;
	bh=22XTkqW7CDBu1Unu93XQsfhW/9xKvJM8H0+10waFM08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p5K5Uui0mDHh2+lrNcsaf8zCxdKV8Y6I7PqJpYR+ntaNuuMJilj+5tS857kHnVOhRoFXDdt3zmMC1YSIjM1tRVn0VWt3y6uMdg9cst7mU6MEI1KEVqiao5nwe1SgDaFbDLAk79SE6u4JzCX2iAVLv99jkSBerUPoRVxuLCWgh8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QI+SsjlK; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 980DD1F000E9;
	Tue, 23 Jun 2026 08:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782204440;
	bh=x2PkEy5u/GL603lnFnZZuJh+bWGAaKDSaHX9lX4UrfI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QI+SsjlKPe4aJthGKAM/stCcBEtoubIOH6yFA9R5C4+UCYVxFviilxQUd4kWlfT1Z
	 T74WwPIUlP4xvFHEpyeGxVWwdi6ttVXmPpqmoUnzb1lxpkpGYgGNSFWiQGq6Izp2+U
	 UwFKWtRxuVqHe6Psz3A3CRvsKjEPmnH+sVLABvwWtrIJjekXGAWjP9rGsj3zZnXq5z
	 1FaTnVuklEumZbbGSwkXQdsFVqOwv6g040J7mG00POXmjeulffeqE+kJXjqlIucd9L
	 cftdTGOKsfAKPKEanKLoM/k5XrOZSxjG5O/A/Lo6tFrFAj26K+Lz7z32WeO88o4LEW
	 XdsA60OtvyJNg==
Date: Tue, 23 Jun 2026 09:47:14 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Amir Vajid <amir.vajid@oss.qualcomm.com>,
	Ramakrishna Gottimukkula <ramakrishna.gottimukkula@oss.qualcomm.com>
Subject: Re: [PATCH RFC v7 0/9] firmware: arm_scmi: vendors: Qualcomm Generic
 Vendor Extensions
Message-ID: <20260623-busy-beautiful-trout-8cc2ea@sudeepholla>
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
 <20260616-responsible-junglefowl-of-chaos-7eda7d@sudeepholla>
 <8725caf9-cebb-49ce-b2c8-4960a6073322@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8725caf9-cebb-49ce-b2c8-4960a6073322@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:pragnesh.papaniya@oss.qualcomm.com,m:cristian.marussi@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:myungjoo.ham@samsung.com,m:kyungmin.park@samsung.com,m:cw00.choi@samsung.com,m:digetx@gmail.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:rajendra.nayak@oss.qualcomm.com,m:pankaj.patil@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:amir.vajid@oss.qualcomm.com,m:ramakrishna.gottimukkula@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114113-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[sudeep.holla@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sudeep.holla@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[arm.com,kernel.org,oss.qualcomm.com,samsung.com,gmail.com,nvidia.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sudeepholla:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6FD346B5649

On Fri, Jun 19, 2026 at 06:01:23PM +0530, Pragnesh Papaniya wrote:
> 
> On 16-Jun-26 1:57 PM, Sudeep Holla wrote:
> 
> > Not sure if it was discussed in the previous versions or not, it would be
> > good if you can capture why some of bus scaling doesn't work with the existing
> > SCMI performance protocol and the monitors don't fit the MPAM mode.
> > 
> > Please capture them in 1/9 as a motivation for this vendor protocol. It will
> > then help to understand it better as I am still struggling to. Sorry for that.
> 
> Thanks for the input!
> 
> SCMI perf protocol exports perf domains to kernel where kernel can set
> the frequency but here the scaling governor runs on the SCP while kernel
> just observes frequency changes made by remote governor.

OK if it is sort of read-only w.r.t kernel, why not perf domain notifications
work to consume the change done by the SCMI platform.

And why do you have set operations in the vendor protocol being proposed then.
It all looks like something just cooked up to make things work. I need
detailed reasoning as why the existing perf protocol can't work considering
all the existing notifications in place.

> While MPAM is not enabled/supported on all hardware (Hamoa).

Fair enough but I still don't fully understand to rule that out yet.

-- 
Regards,
Sudeep

