Return-Path: <linux-arm-msm+bounces-113331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6hNsAy0JMWqjagUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 10:28:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CD368D27E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 10:28:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Uo0jo+1X;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113331-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113331-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75B1B30207D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 08:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FF8E40E8D9;
	Tue, 16 Jun 2026 08:27:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCD43B47CF;
	Tue, 16 Jun 2026 08:27:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781598453; cv=none; b=ThKx9wbBwtTIReRZbb9VYjbnH+/Hj/wWRCgFmunBxAO3da4WaodJ1NQq5UIDCI5bu+UEaVl/dRjM2CB506s+sHM4XozlWiV/rmSGXn63LDbxjYxAcxc2RMAErBFiLr4NbCQjw45m87wLbNHp12n/5xpke4rbYo8FenU8EleA24k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781598453; c=relaxed/simple;
	bh=OZlrVaq8cSFNA3Rt09tG3hk2INw3iVFCfo5f5Ru+45M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UHHU3mLpJyMun35zKKLW4Y3l9wHiqeNZx4eZgivKMed8xcII4ZVToopNRz3FSYKduxiea670f5ysov8OH4Bkgp3R4a71fuKdqy39JjieTi1F+yKXOao/IKdMiRISWa328fDhgamoS+BK+e+yALKU4Kv7x9tbOH/7CH95cBDNftE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uo0jo+1X; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30781F000E9;
	Tue, 16 Jun 2026 08:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781598452;
	bh=Q0fLaFQ950eBptOVg8md2eixmDLx1TIa5yy+9sn5UnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Uo0jo+1XthHZVO2hdLrC0mDJGqQqRvUVfi5P8TKbPbggYu92RYZGF270mBt2damKG
	 fYpKdCUQDLPeW8jfZrn39XtOZTuuoiTJiTIY6cb1UFquKj26esMnjxENMI7AcviBmi
	 gEtac6MDfV048DQLSM65MTyRvmhfjkVcMddqm/WQ5v5hWHsW1HXtY5u9bWg6kn9nJk
	 oSQCt8WHPSn5gu2VkLuKYjVwloWEkEaKPDmzrMQIRECcK8NNVp1C1rLYoY+mQ51LhP
	 m8dAMVkVtvxcoa1vPBC7o6Mv0fGDQOJkLHsaqSAcovFRy0X+yipacJIlJzz0GNI8m8
	 zUb1VMOLk2ZHA==
Date: Tue, 16 Jun 2026 09:27:25 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
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
Message-ID: <20260616-responsible-junglefowl-of-chaos-7eda7d@sudeepholla>
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
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
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:pragnesh.papaniya@oss.qualcomm.com,m:cristian.marussi@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:sudeep.holla@kernel.org,m:conor+dt@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:myungjoo.ham@samsung.com,m:kyungmin.park@samsung.com,m:cw00.choi@samsung.com,m:digetx@gmail.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:rajendra.nayak@oss.qualcomm.com,m:pankaj.patil@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:amir.vajid@oss.qualcomm.com,m:ramakrishna.gottimukkula@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113331-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 88CD368D27E

On Wed, Jun 10, 2026 at 02:21:27PM +0530, Pragnesh Papaniya wrote:
> The QCOM SCMI vendor protocol provides a generic way of exposing a number of
> Qualcomm SoC specific features (like memory bus scaling) through a mixture of
> pre-determined algorithm strings and param_id pairs hosted on the SCMI
> controller. On Qualcomm Glymur and Hamoa SoCs, the memlat governor and the
> mechanism to control the various caches and RAM is hosted on the CPU Control
> Processor (CPUCP) and the method to tweak and start the governor is exposed
> through the QCOM SCMI Generic Extension Protocol.
> 
> This series introduces the devfreq SCMI client driver that uses the MEMLAT
> algorithm string hosted on the QCOM SCMI Generic Extension Protocol to detect
> memory latency workloads and control frequency/level of the various memory
> buses (DDR/LLCC/DDR_QOS). DDR/LLCC/DDR_QOS are modelled as devfreq devices
> using the remote devfreq governor. This provides basic insight into device
> operation via trans_stat and lets userspace further tweak the parameters of
> the remote governor.
> 
> trans_stat data for DDR/LLCC/DDR_QOS is now available with this series:
> 
>      From  :   To
>    315000000 479000000 545000000 725000000 840000000  959000000 1090000000 1211000000   time(ms)
>    315000000:         0         3         6         6         6         7         0        30    143956
>    479000000:         2         0         7         1         1         1         0         3       356
>    545000000:         7         6         0         5         5         0         0        10      1200
>    725000000:         3         0         5         0         6         1         0         6      2172
>    840000000:         8         2         3         2         0         4         0        12      1188
>    959000000:         3         0         1         2         2         0         0        13       272
>   1090000000:         0         0         0         0         0         0         0         0         0
>   1211000000:        35         4        11         5        11         8         0         0     21684
> Total transition : 253
> 
> QCOM SCMI Generic Vendor protocol background:
> A lot of the vendor protocol numbers used internally were for
> debug/internal development purposes that were either highly SoC-specific
> or had to be disabled because some features were fused out during
> production. This led to a large number of vendor protocol numbers being
> quickly consumed and never released. Using a single generic vendor
> protocol with functionality abstracted behind algorithm strings gives us
> the flexibility of letting such functionality exist during initial
> development/debugging while still being able to expose mature features
> (like MEMLAT) once they have stabilised. The param_ids are expected to
> act as ABI for algorithm strings like MEMLAT.
> 

Not sure if it was discussed in the previous versions or not, it would be
good if you can capture why some of bus scaling doesn't work with the existing
SCMI performance protocol and the monitors don't fit the MPAM mode.

Please capture them in 1/9 as a motivation for this vendor protocol. It will
then help to understand it better as I am still struggling to. Sorry for that.

-- 
Regards,
Sudeep

