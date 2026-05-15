Return-Path: <linux-arm-msm+bounces-107938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFszOTsyB2qQswIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 16:48:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 898ED551A93
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 16:48:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2A28F3002B08
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 14:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFFDD38C400;
	Fri, 15 May 2026 14:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bLs6IJYr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E2A2DFF04;
	Fri, 15 May 2026 14:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778856498; cv=none; b=PI32Hh+uf8JwYTcP3LJihjMcLLTgLNsrr/UuVMjKRQRdGuflAxjTCvLfIyzU7yBedHUiQe1NDPqNUS74aIaHGFtvqQG5ZdMM+gaXfZGqayDwyQa+AksGHA8RPT0Z4ETTuK3uWN+jKnkg0BY/RGRjbtCI1Gko90vkE9W/KPjf7XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778856498; c=relaxed/simple;
	bh=o17vMuYjKsLRjXfW7PBkXxDGIdqEtydbCUMZil2l8Z4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UuUgm4PMVtQ5FN8zprC03ySuGUWBhJ5h95ddhT8ZCPFhl3MnRccd7l5W5zxNDdTglxn93hAbxBHvzmQ67wdyHcphJAEdpKDI2wCyLoP2qsHBqfXzjzLcpYPRCXz9baSfRid8XpfNrYR85ew3Xi2zbi45AIFbaDxOEmAQ71+7Dlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bLs6IJYr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42823C2BCB0;
	Fri, 15 May 2026 14:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778856498;
	bh=o17vMuYjKsLRjXfW7PBkXxDGIdqEtydbCUMZil2l8Z4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bLs6IJYr6lcA4flbAaVgWg/P4X1jxUlL4xwMFPvQw+EM2UaUNPRXtqKlkpWZO5lZj
	 k6OBQq1OJNnTco0mqSu8+ibE4Yu/r+Yi7RexdsevMHyz10ksTOcpd1G6SyxSA3hyBu
	 WZKp3op+N/Pnr6qallc3iyNWN9bAi4/yA3ap8GXyarw/OnXqa1L5mNNky/vO3tKPSk
	 nC3Mp8QwxfOZ+7iv90fHlHm0DN0lbgZg5KTGCaT466ZSU7wJ59HoY6w3kgBz4Y3aoY
	 wEIre0DI3NtM6vSaOiXYk5+bUeUY8CvTt1P2h3bIBJdGEZRfH6s5fGT88UaKKf6UzH
	 JNUFFfqJgogLQ==
Message-ID: <f0b90edc-6584-4b30-a2d1-e72139983fdb@kernel.org>
Date: Fri, 15 May 2026 16:48:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] soc: qcom: ice: Enable PM runtime for ICE driver
To: Linlin Zhang <linlin.zhang@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
 Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
 bjorn.andersson@oss.qualcomm.com
References: <20260512033750.3393050-1-linlin.zhang@oss.qualcomm.com>
 <20260512033750.3393050-3-linlin.zhang@oss.qualcomm.com>
 <b07a3634-a7a6-4f28-994b-fc900be26879@kernel.org>
 <01578e6a-d10a-46df-bb32-fd45ecb365d7@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <01578e6a-d10a-46df-bb32-fd45ecb365d7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 898ED551A93
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107938-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 15/05/2026 16:22, Linlin Zhang wrote:
> 
> Hi Krzysztof,
> 
> Thanks for the review.
> 
> For the SCMI-based platforms (e.g. sa8255p), the ICE resources such as
> clocks are not controlled directly by the ICE driver. Instead, they are
> managed by remote firmware and exposed to Linux via power domains. As a
> result, the ICE driver cannot use clk_prepare_enable() directly to
> control the hardware clock.
> 
> The intention of moving the clock handling into runtime PM callbacks is
> to align the ICE driver with the power domain framework used on these
> platforms. When the ICE device is attached to a power domain, invoking
> pm_runtime_resume_and_get() will trigger the provider (remote firmware
> via SCMI) to power up the device, which in turn enables the underlying
> clock and other resources.
> 
> This design follows the guidance where the runtime PM framework is
> used as the common mechanism to abstract both:
>   - direct clock control on non-SCMI platforms, and
>   - firmware-controlled resources via power domains on SCMI platforms.
> 
> In both cases, the runtime PM callbacks are responsible for performing
> the actual resource enable/disable:
>   - for legacy platforms: clk_prepare_enable()/disable_unprepare()
>   - for SCMI platforms: power domain on/off handled by firmware
> 
> So while it may look like an additional layer on legacy platforms, this
> approach provides a unified mechanism without requiring separate driver
> entry points or special handling in the upper layers (e.g. UFS driver).
> 
> That said, I understand your concern that introducing runtime PM solely
> for clock gating can be seen as unnecessary overhead on existing
> platforms. I will revisit the implementation to ensure that:
>   - the runtime PM integration does not introduce regressions for legacy
>     platforms, and
>   - the design clearly justifies the common abstraction for both SCMI
>     and non-SCMI cases.
> 
> In addition, I rewrite the commit message as the following to make the
> intention more clear.
> 
>   On some platforms the ICE device is placed in a firmware-managed power
>   domain. In those cases the ICE core resources (including the clock) are
>   not directly controllable by Linux and are instead toggled by the power
>   domain provider (e.g. remote firmware via SCMI).
> 
>   Wire the ICE device into runtime PM so that a single pm_runtime
>   transition is used to bring the ICE device up/down. When the device is
>   attached to a PM domain, pm_runtime_resume_and_get()/pm_runtime_put_sync()
>   will invoke the PM domain callbacks and let the provider manage the
>   resources. On platforms without a PM domain the runtime PM callbacks
>   continue to perform the existing clock enable/disable locally.
> 
>   No functional change is intended for non-firmware-managed platforms; the
>   change provides a common control point that allows ICE to operate when
>   resources are owned by a PM domain provider.
> 


Nothing here resolves the comments. Also, it's top posted. Honestly, I
won't be talking through you with LLM, so consider patch NAKed.

Best regards,
Krzysztof

