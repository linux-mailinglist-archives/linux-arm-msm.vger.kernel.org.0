Return-Path: <linux-arm-msm+bounces-115583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pwx2OWa6RGqhzgoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 08:57:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 580276EA5F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 08:57:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=eardjtRk;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115583-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115583-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E3CA301727E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 06:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F023B2FDD;
	Wed,  1 Jul 2026 06:57:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF24299927;
	Wed,  1 Jul 2026 06:57:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782889057; cv=none; b=RvQ/XYlg3oHa0reDG9ol6uNEaxa1v8vxn2rSyitWsJSHJCg6tz2xa1hpi0l0387kZjcQUG0I+3LNiH77s3nFEH6eNacp+MuOvNwUmKWT+u3vHOtf78fL+V54I+y2osxO1+2DUEzKIXDuAgcppgkdBt9lQP04ixjxW1JwOKbtzaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782889057; c=relaxed/simple;
	bh=rnV5HhhWP2HaifQNL1vvC8C3/Zy1ziB3PLME9igrVzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/IoG9n8rB31qAcTC4djHB1Tu3PbPTPgXvPNOF5fCqYCgttsjPmh4bhop/ImUJM/xIAsau8L+GJZwO0gPauUXdGWdPJ2F70TKDGdEk4DfGosFLyhcCLbC5voA1FsCYALLi/7qZBtUT363fQ/e95XmDxwkmGw0URz99GsS4f7/nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eardjtRk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0597A1F000E9;
	Wed,  1 Jul 2026 06:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782889056;
	bh=S/Br7n8skDAshjgKN/WmFTTuKkr1LxKAT3b5k1fkpvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eardjtRk0tVHOFgzGFet5eWB/jfl1S/rTNInUeK5BXbYMBX/2j8MFCLN4w3XLb3sW
	 MMTnLPihVbBVf2aGqidO2l1HxExbbjNprWS471p9MQpxyEddgh7EHPIhpwMkC1slxn
	 jyRZGPZJJ21xbvh1qHqnYJ+r9aeP/KOpk7EK4CrKuTHiKMU+MF5o9lNsr6dFjKeLEi
	 Hb54fqmJ16O4fQgeZKcm6Rz3A5OtXFRrGhov6KiBQgB79GN5r+djfskdHUz/lnTvum
	 RlVyBYrTLHA/Vo/qHApjH1RHRXcteS5FW5EwfQTUQ8S18FHW1NnY5CsSJdXfyqfXhq
	 sPM0Hio/kaN7w==
Date: Wed, 1 Jul 2026 08:57:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/5] dt-bindings: arm: coresight-tnoc: Add standalone
 qcom,coresight-agtnoc compatible
Message-ID: <20260701-stirring-piculet-of-vastness-a361e5@quoll>
References: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
 <20260701-fix-tracenoc-probe-issue-v4-1-aefab449a470@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701-fix-tracenoc-probe-issue-v4-1-aefab449a470@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:jie.gan@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:abelvesa@kernel.org,m:alexander.shishkin@linux.intel.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115583-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quoll:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 580276EA5F8

On Wed, Jul 01, 2026 at 09:53:41AM +0800, Jie Gan wrote:
> The TNOC compatible previously only allowed the two-string AMBA form
> "qcom,coresight-tnoc", "arm,primecell", which forces the device onto the
> AMBA bus.
> 
> Convert the compatible to a oneOf and add a standalone
> "qcom,coresight-agtnoc" compatible alongside the existing AMBA form. The
> standalone string carries no "arm,primecell" entry, so the device is
> created on the platform bus instead of the AMBA bus.

That's a Linux driver specific reason, so not a valid one.

Describe the hardware instead.

Also, you do not get other compatible for the same device.

Best regards,
Krzysztof


