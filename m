Return-Path: <linux-arm-msm+bounces-115323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mqD2GRV6Q2pxZAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 10:11:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBE26E18DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 10:11:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=F+Tiyq6Z;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115323-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115323-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BD883010500
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 08:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4FF938CFFA;
	Tue, 30 Jun 2026 08:10:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8751B369D5A;
	Tue, 30 Jun 2026 08:10:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782807025; cv=none; b=MyznWWxQ2Nc/IP80mms6Hn6fLH5i8GZIQ4qan8QhBD68E0c6AS0OqDu0Tj5SuNvluc4pxBBf4zzR9/BOZX9SfjjLGrpGWxx3IoOnAxlitH90qfo2y1wNBzFR+yr+FTwVqpvgUJY5T3zEw4PSKaLy//CGI2UxghydPT1YsgxdH/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782807025; c=relaxed/simple;
	bh=Y44WNqCqpvHywWSbjQZkdja/2YAXek3Djdm80xnI13M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EC+PQ1iA9t53TWUWSelGSrP6NSTIHd/nqTTFDo4endL4B0W56gygD9Iug+hBPliFbeizqOLs4wrmgwepRdVMlWlZGTbOc9crTY0nntn9ZDLW0YrGnzcBY9sFmxF63wTX3ch9psdUi1CYQyGqzr5FGCNRtB08OSv1XsYU+orr6JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=F+Tiyq6Z; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77C7E22D9;
	Tue, 30 Jun 2026 01:10:19 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 709923F905;
	Tue, 30 Jun 2026 01:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782807023; bh=Y44WNqCqpvHywWSbjQZkdja/2YAXek3Djdm80xnI13M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F+Tiyq6Z2r/ysjEKRkLNrZe7WjxZIFrfI16Q00mNuwaXZzLMYamHP76j8c0Oj0ZCx
	 oATd1jsV20bjvkqASMMW347xXShaAapUryOwNBm+XzYUyZ3gjF4T51Lf8EwdFwn8IR
	 kDB0PB5aoGQRJlOi/uL4tsBaGPeeiVJoJ3GJTmgs=
Date: Tue, 30 Jun 2026 09:10:21 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
Message-ID: <20260630081021.GD1812158@e132581.arm.com>
References: <20260624151610.GC575984@e132581.arm.com>
 <a13fb65c-726b-4c99-b741-29040c4564d0@oss.qualcomm.com>
 <20260625085643.GD575984@e132581.arm.com>
 <065853f5-b11b-4316-814e-202f07acb6ea@oss.qualcomm.com>
 <20260626103015.GE575984@e132581.arm.com>
 <c1ac3ab4-f214-4947-b42f-cbc635be6bbb@oss.qualcomm.com>
 <20260626154949.GA1812158@e132581.arm.com>
 <9432df20-08bf-4134-b4b9-e6b5d618af81@oss.qualcomm.com>
 <20260629142848.GB1812158@e132581.arm.com>
 <adb45638-1787-45cd-b4fd-d957323cc608@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adb45638-1787-45cd-b4fd-d957323cc608@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115323-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jie.gan@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:yuanfang.zhang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[e132581.arm.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,arm.com:dkim,arm.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DEBE26E18DE

Hi Jie,

On Tue, Jun 30, 2026 at 09:03:52AM +0800, Jie Gan wrote:

[...]

> >    - How can you guarantee that a interconnect TraceNoC will never
> >      require ATID in the future?

> From a hardware perspective, there is no fundamental difference between an
> itnoc and an AG TraceNoC. They use the same TraceNoC hardware implementation
> and share the same AMBA bus type. The distinction is purely functional: an
> itnoc is used for local trace aggregation within a subsystem, whereas an AG
> TraceNoC serves as the top-level aggregation point for the SoC.

I'm still not convinced that adding "arm,primecell-periphid" is the
right approach.

From the description above, I'd expect either the hardware to expose
bits in a register to distinguish these two module types, or as I
suggested earlier, to use a DT property to indicate the module type (or
whether ATID is required).

Or have you tried to detect the last tnoc on a path and allocate ID for
it? (You can retrieve csdev->path).

Thanks,
Leo

