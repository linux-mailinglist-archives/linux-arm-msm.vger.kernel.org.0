Return-Path: <linux-arm-msm+bounces-114731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xDXWDHjaP2qWZQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 16:13:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C31266D212A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 16:13:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="JnpZG/ZV";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114731-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114731-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2F4563009F43
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 14:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F4F3ABD8F;
	Sat, 27 Jun 2026 14:13:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CE0BE63;
	Sat, 27 Jun 2026 14:13:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782569589; cv=none; b=rNP/F/vjoSNzObeiUN03vJUyp8/AxXfgm1R37fYUE6yvjnmcZDJ7383kIPaKwZma5zowLSnyxQ776IgDRWlpz3TkNtQ9jgk2KFBAMhekyWXjtprRUPUaecLfHSFMnGw4sAE2tYJ5kDjE4XOZ35wNX353YXeuq/C37hVCLKfCnz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782569589; c=relaxed/simple;
	bh=g4koX41JGn64lh65JFCkF5PrPq+J6QkdQJejseRwjPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GFBC9bZhFF+m26rj2IHmcL2EJa+PGepQVUbWB5bUJh1w+vn03Un+prRfRlaXxJB9pubYOFb+GD6xxFh64H+xWpI6AjOEKZWZxBlHoyV2f0G5FWIITWQRJfmoUyYwl/ZPc73fCh43+BPPDZJEWcD6vqwRV8sun4aPey9PsPShUKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JnpZG/ZV; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 888B71F000E9;
	Sat, 27 Jun 2026 14:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782569588;
	bh=Gzh2plBXJ+V5rVAo9UH0lZu//mdnWSb19kyOOoCk0VM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JnpZG/ZVd5B/C2reKUrIBHrC31EZoCUQUouaF9Ti+GxmZecEzJJ3lo6HKvTt6qIXS
	 1BCW73i///CgG0wfzEpeWf51FQIchi9EBBDoz7e2TMfWH1NG+PZv3asA4GxL7B6yxv
	 PKCtNi1c8JgcvT1P+ynkE1VIrs/F530SdF2umAJ9jXYo2M6g9+EjbDsW44W1CLlL2Q
	 L0tSq4H+6nyJDpny9Nw2VWZTtB5kdnSPKtXNH6FGohGVvFerRyEiv1TkInjmV13ZAl
	 eW3q2xtQyszuvO+iSuJueq80I2LSLdYsknrVGo2dbvk9R1NAeOD7v31kw2DdiYgYOk
	 fap6XfIkbWYxA==
Date: Sat, 27 Jun 2026 15:13:02 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
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
Message-ID: <20260625-metal-chachalaca-of-fascination-eabc0f@sudeepholla>
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
 <20260616-responsible-junglefowl-of-chaos-7eda7d@sudeepholla>
 <8725caf9-cebb-49ce-b2c8-4960a6073322@oss.qualcomm.com>
 <20260623-busy-beautiful-trout-8cc2ea@sudeepholla>
 <ea9d0c11-e110-4d13-b165-1548875ef9cd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea9d0c11-e110-4d13-b165-1548875ef9cd@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:pragnesh.papaniya@oss.qualcomm.com,m:cristian.marussi@arm.com,m:sudeep.holla@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:myungjoo.ham@samsung.com,m:kyungmin.park@samsung.com,m:cw00.choi@samsung.com,m:digetx@gmail.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:rajendra.nayak@oss.qualcomm.com,m:pankaj.patil@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:amir.vajid@oss.qualcomm.com,m:ramakrishna.gottimukkula@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114731-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C31266D212A

On Thu, Jun 25, 2026 at 10:57:40AM +0530, Pragnesh Papaniya wrote:
> 
> 
> On 23-Jun-26 2:17 PM, Sudeep Holla wrote:
> > On Fri, Jun 19, 2026 at 06:01:23PM +0530, Pragnesh Papaniya wrote:
> >>
> >> On 16-Jun-26 1:57 PM, Sudeep Holla wrote:
> >>
> >>> Not sure if it was discussed in the previous versions or not, it would be
> >>> good if you can capture why some of bus scaling doesn't work with the existing
> >>> SCMI performance protocol and the monitors don't fit the MPAM mode.
> >>>
> >>> Please capture them in 1/9 as a motivation for this vendor protocol. It will
> >>> then help to understand it better as I am still struggling to. Sorry for that.
> >>
> >> Thanks for the input!
> >>
> >> SCMI perf protocol exports perf domains to kernel where kernel can set
> >> the frequency but here the scaling governor runs on the SCP while kernel
> >> just observes frequency changes made by remote governor.
> > 
> > OK if it is sort of read-only w.r.t kernel, why not perf domain notifications
> > work to consume the change done by the SCMI platform.
> > 
> > And why do you have set operations in the vendor protocol being proposed then.
> > It all looks like something just cooked up to make things work. I need
> > detailed reasoning as why the existing perf protocol can't work considering
> > all the existing notifications in place.
> 
> Please do take another look at the documentation and driver changes to see
> how it all comes together, since it's apparent that we use SET operation for
> a ton of things. Taking another stab at explaining how the MEMLAT uses all
> the ops exposed by the vendor protocol.
> 

Sure I will have a look at the documentation again and sorry if I missed
anything. But in general I would expect the document to be self-explanatory
and not having to look at the driver on how it is used to understand the
firmware interface. Please make sure of that if not already.

> We use the SET operation to pass on various tuneables (IPM CEIL, stall floors,
> write-back filter, freq-scale params, adaptive low/high freq, sample ms),
> the core-freq -> mem-freq map, and min/max clamps) required to run the
> MEMLAT algorithm on the SCP. You might ask why can't we have these values
> stored somewhere on the SCP itself?

Exactly, thanks for saving a round trip.

> We would like to but all of these are tuneable values, that can change for
> various boards for the same SoC.
> 

Sure and where do these boards get these values from ? I assume device tree ?
If so, are the fixed and can be done once at boot ?

> The START/STOP operations are meant to start/stop the algorithm, in this case
> the bus scaling algorithm.
> 

Yes you need to add more details on that algorithm. Can firmware take random
strings as input. I guess not. Please list the valid strings and explain them.
Filter invalid strings in the driver if only handful of values are valid.

> We use the GET operation to get the current frequency of memory that we
> are trying to scale. It can be also used to read back all the parameters
> that we are trying to set. Another thing to note is that exposing the current
> frequency to the userspace was something that the community wanted.
> 

More fun, user ABI involved, so the firmware interface needs to be as clear
as possible.

> With all of ^^ in mind, re-using the perf protocol becomes impossible.
> 
> https://lore.kernel.org/lkml/k4lpzxtrq3x6riyv6etxiobn7nbpczf2bp3m4oc752nhjknlit@uo53kbppzim7/
> https://lore.kernel.org/lkml/20241115003809epcms1p518df149458f3023d33ec6d87a315e8f6@epcms1p5/
> 

It is good to capture summary of these old discussions if they are relevant.

> We'll add more call flow diagrams as part of the documentation for the next
> re-spin to make reviews a bit more easier.
> 

Anything that improves and helps in understanding this is always welcome.

-- 
Regards,
Sudeep

