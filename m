Return-Path: <linux-arm-msm+bounces-114616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LsiCGhVVPmq1DwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114616-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 12:31:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF396CC1BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 12:31:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=YtZlT4mW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114616-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114616-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2AA07300515E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 10:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 527D33EFFC0;
	Fri, 26 Jun 2026 10:30:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B1873EFD25;
	Fri, 26 Jun 2026 10:30:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782469825; cv=none; b=S9GbLpSEJjOkVbLv1VSutTh8Eb4Tsfdl6yFlmo6Zq+NfzwyT9ty04fiVhGHV94D27XH4Vql+cuEVaMS7RuD32c/NhzDrUWNdRxB7JWGA9buM6h/4wMuvnXK8XJWPahFjuRF4lBBTJFPAvmQlT1hBIzL9RM97B7iL/L01rpvs4fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782469825; c=relaxed/simple;
	bh=RPGjuxweSBX9qRHLJv2h8Lc6/pXmWzN6MYxGMUlho+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nEz2PerXbShj/ui5B73KyIwZktteadEM0vkIfK2kLLw/a4lXDDfKa0l/27x0IqN5oL2hE5Qa2MbpAH1q8rJgRfub6mTg9HzWlTrM+RPWvOBTs9hlSgJekDhKtJOmUhZuPLB7essWogR5Dik698xz+5G76+v7oRqwMM/IsL2r4pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YtZlT4mW; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B4ED1E7D;
	Fri, 26 Jun 2026 03:30:13 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BF623F905;
	Fri, 26 Jun 2026 03:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782469818; bh=RPGjuxweSBX9qRHLJv2h8Lc6/pXmWzN6MYxGMUlho+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YtZlT4mW9DHylU7QLNesKElwkkpftd5nTIxv+S9wuUMph7P9GGp96HJDF2jvsOYDu
	 I9zYagqIC/ZzmHL76+l2jcGIX3CBhssPlBMdS1+w6QMKhZKZNtEbN4vbbNyuZ3KvNj
	 T98VxNktwCAbIgDHJHkGrjEtBHZHSrkknWolo6bg=
Date: Fri, 26 Jun 2026 11:30:15 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
Message-ID: <20260626103015.GE575984@e132581.arm.com>
References: <20260624-fix-tracenoc-probe-issue-v2-0-786520f62f21@oss.qualcomm.com>
 <20260624-fix-tracenoc-probe-issue-v2-2-786520f62f21@oss.qualcomm.com>
 <f0634a64-1141-4ff9-9033-825e3c75d28d@oss.qualcomm.com>
 <f39ec59f-97c4-4d5f-bf02-560adae312d9@oss.qualcomm.com>
 <471d7a92-3629-4274-a303-8906d3626037@arm.com>
 <25d7d3a1-58e0-4f25-a73a-59a978130c47@oss.qualcomm.com>
 <20260624151610.GC575984@e132581.arm.com>
 <a13fb65c-726b-4c99-b741-29040c4564d0@oss.qualcomm.com>
 <20260625085643.GD575984@e132581.arm.com>
 <065853f5-b11b-4316-814e-202f07acb6ea@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <065853f5-b11b-4316-814e-202f07acb6ea@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114616-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jie.gan@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:yuanfang.zhang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[leo.yan@arm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[arm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leo.yan@arm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,e132581.arm.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6BF396CC1BC

Hi Jie,

On Fri, Jun 26, 2026 at 10:03:41AM +0800, Jie Gan wrote:

[...]

> Hi Leo,
> 
> To be honest, I would prefer not to modify the interconnect platform driver.
> On some Qualcomm platforms, multiple itnoc devices reside within small
> blocks(one or more than one for each block) and are connected to a dummy
> source. In such cases, two ATIDs are allocated for a path (the dummy source
> and the itnoc), which is inefficient. This is why the itnoc platform driver
> created to avoid this waste.
> 
> The TraceNoC (called as AG TraceNoC) is a generic TraceNoC device which
> connected to multiple source and link devices, aggregating data from all
> source devices into a single output path.

As I said, it may be fragile to couple a specific device property (ATID)
to the AMBA driver.

You're now facing a case where a device cannot be registered as an AMBA
device, so it cannot use ATID. Likewise, I can imagine in future where a
device is registered as an AMBA device, but you don't want ATID.

> This device is implemented as an AMBA device but lacks proper hardware
> configuration. As a result, it must be handled in the driver as a
> workaround, which unfortunately breaks the original design intent.

Seems to me, it is not reasonable to pretend an AMBA device but AMBA
ID registers are absent.

How about add a new DT property ("qcom,tnoc-enable-atid") to force
enabling ATID?

Thanks,
Leo

