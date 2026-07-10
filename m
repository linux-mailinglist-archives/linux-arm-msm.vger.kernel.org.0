Return-Path: <linux-arm-msm+bounces-118189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Mg0wFlaxUGot3gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 10:46:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC0E738A23
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 10:46:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=Cg5JU9TK;
	dmarc=pass (policy=none) header.from=arm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118189-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118189-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82418309948B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 08:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD5AD3F0A88;
	Fri, 10 Jul 2026 08:40:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA4723F12F2;
	Fri, 10 Jul 2026 08:40:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783672813; cv=none; b=CUmloS+O9d4Km4uJhIctQF0BqhTWnRE3ZRbuG5eyhcSQQL+v/m2pqSKZNuFkZEZr1ERvFiN1ZWpO+I5nVJbViGGRYL2B/2iVxxRW8IS3QYAqUS34DQTmDJ8ftrUwa90P1sPeX6Gl5IEUY38LhprMsgM31S59gtUQ6XumtIz0oGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783672813; c=relaxed/simple;
	bh=Vrfha6a/wvRPJaZ4UkRBNv5gq9QhvAOUqgTI4ipo0mU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XNxpoIAVQipZfYrFa6b0kqML6dTKp4K2AcLmrqF0/rfcbdtyqsh5cVhpKKisbrAUKhXyMYbRZC60ULB8FimEvyxfvhbXySysiChJ8qVK22gZzgFuqYsOHuejvgNwgQHIKDo3sUVJoReXvk7J8rACU1LN4Uqb/yhC83NHGWhWGv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Cg5JU9TK; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3A7C1D70;
	Fri, 10 Jul 2026 01:40:04 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBF053F85F;
	Fri, 10 Jul 2026 01:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783672809; bh=Vrfha6a/wvRPJaZ4UkRBNv5gq9QhvAOUqgTI4ipo0mU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cg5JU9TKlCx8XNZ5bsggIPdE/EgxVBGKfQccZvkihY79vxpPQzPnW2Q9GzQC98UG5
	 m2O4kpoPfuJ1ZENVI3QVr5zpxVpelMiqemv9ma8XeM7+e+riIKno33WFmtxpi9EaFH
	 1W0fJ1si5wvzE5nuOuFH0JbYG7I9LmJ4S5JT8jsw=
Date: Fri, 10 Jul 2026 09:40:07 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 2/5] coresight: tnoc: Bind Aggregator TNOC on the
 platform bus
Message-ID: <20260710084007.GI1024232@e132581.arm.com>
References: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
 <20260710-fix-tracenoc-probe-issue-v6-2-41eb36fef8d9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710-fix-tracenoc-probe-issue-v6-2-41eb36fef8d9@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-118189-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jie.gan@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:yuanfang.zhang@oss.qualcomm.com,m:abelvesa@kernel.org,m:alexander.shishkin@linux.intel.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[leo.yan@arm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:from_mime,arm.com:email,arm.com:dkim,e132581.arm.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8AC0E738A23

On Fri, Jul 10, 2026 at 10:39:01AM +0800, Jie Gan wrote:

[...]

> The ATID-unsupported handling keyed off dev_is_amba(), which disabled ATID
> allocation for every platform-bus device. With the Aggregator TNOC now on
> the platform bus, that check would wrongly disable its ATID, even though
> the Aggregator TNOC owns the ATID that tags the whole aggregation path.
> The Interconnect TNOC aggregates trace within its subsystem but carries no
> ATID of its own, because the downstream Aggregator TNOC already owns the
> ATID for the path. So base the check on the "qcom,coresight-itnoc"
> compatible and let every other form allocate a trace ID.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

Reviewed-by: Leo Yan <leo.yan@arm.com>

