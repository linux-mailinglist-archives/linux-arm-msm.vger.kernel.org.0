Return-Path: <linux-arm-msm+bounces-111349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D7XjOUidImrrawEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 11:56:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB3664718D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 11:56:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=dBPTbZPN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111349-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111349-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C27CE300F9DD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 09:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 449BA3B841B;
	Fri,  5 Jun 2026 09:41:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6564192EF;
	Fri,  5 Jun 2026 09:41:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780652497; cv=none; b=OtHsU7/x1JhtkeLSGxdGzDdFyzSZe7DLys12Ef/A4TzLvTuDmNtU0CFTBLj9Q8o+rm5qBW7QHGoRKOA2Sk7Oknx5XXeTo3Bgx4MlACzuEkmnuX7r4JaXKi6dX/MPJDnXJVf4kqJhWB+zpujdBW/o7FU8BiJIoq8I7kf7eeFc5Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780652497; c=relaxed/simple;
	bh=R9nrahG7pBdmSE2v7RBQ6LgfEBhcJ/fI/1RCImUUfew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jKieenxATR00oPamdeYx4F4jVeG4VNAiaeYZz/or/THjamZhMuwd3PtQ4jmJXMkUrgYq/5IccSgHlHF1DfmyVuVPZkFAnyo6BbN66AAxD3V8Q4vSeUea1KHWjhRrRzWkF6Uj2T2O7LUjv1w8pR3FbL3NZvxA5ScJzr++4SkzN5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dBPTbZPN; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B93F11F00893;
	Fri,  5 Jun 2026 09:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780652496;
	bh=I0FZ92PYOMm68xR2H78ImOPn2pBA+u3S3K17i9mGtUY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=dBPTbZPNHc/+eWcg30TsQQTVIottIuLQxHzyfUGbRjqmYaG3rvIKn5yJJpk8JEcsc
	 F7Q8ZRO9HOmL8b+EzbR/snglem4BY5mMpZsOn/1S+v13OF7hJxg3RCDYuHR/8dzfcu
	 Y141fjx6uHmHBCmqwP8m4/WCADp0G+lPoJEu1bh8Q4HKRGpiJk5rLsfLB7fwU8QR7K
	 4hvknMRjn2Q+CyG9ZsVp5GTTVW2h2jpmzYjPBwrPlXvPC0jv3w1rpR/OLoDd/DbR/x
	 o4qBJP+y5zVeMWZIZJaPVygW1+3xlKglJaSj5drhACpbb41a5Ytj1OTckh+d38sSD3
	 T3gl5/1J6t0ew==
Message-ID: <e256edef-fc24-4ccc-b031-4387a127fc83@kernel.org>
Date: Fri, 5 Jun 2026 10:41:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ASoC: qcom: Refactor of_xlate_dai_name into common
 helper
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260605092812.3495852-1-harendra.gautam@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260605092812.3495852-1-harendra.gautam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111349-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:harendra.gautam@oss.qualcomm.com,m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5DB3664718D



On 6/5/26 10:28 AM, Harendra Gautam wrote:
> Multiple Qualcomm ASoC CPU DAI drivers implement the same logic to
> resolve a sound-dai phandle argument to a DAI name: iterate the
> component's DAI driver array and match by ID. This is currently
> duplicated between lpass-cpu.c and qaif-cpu.c.
> 
> This series extracts the common logic into a shared helper
> asoc_qcom_of_xlate_dai_name() in common.c and refactors lpass-cpu.c
> to use it. The QAIF driver (in a separate series) will also use this
> helper instead of its own private implementation.
> 
> Patch 1: Add asoc_qcom_of_xlate_dai_name() to common.c/h
> Patch 2: Refactor lpass-cpu.c to use the new helper

series itself does not make sense, as you only have one user for this at
the moment.

Please consider making it part of the series that actually has more than
one user for this.


--srini
> 
> Harendra Gautam (2):
>   ASoC: qcom: Add generic of_xlate_dai_name helper to common
>   ASoC: qcom: lpass-cpu: Use asoc_qcom_of_xlate_dai_name helper
> 
>  sound/soc/qcom/common.c    | 34 ++++++++++++++++++++++++++++++++++
>  sound/soc/qcom/common.h    |  5 +++++
>  sound/soc/qcom/lpass-cpu.c | 19 +++++--------------
>  3 files changed, 44 insertions(+), 14 deletions(-)
> 


