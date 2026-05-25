Return-Path: <linux-arm-msm+bounces-109575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FY3K0D/E2quIQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 09:50:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3C65C747E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 09:50:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BF23301BF6C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 07:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B6F93D4131;
	Mon, 25 May 2026 07:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jGP5Q6N4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DBF3D413B;
	Mon, 25 May 2026 07:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779695392; cv=none; b=MZVUMj0nkpTd/xYMO/vcxzMP+b+9dZ+0NOqv6DuC9b+nunjWbWhcjaEDGbfjQktdWDJVKqZ85CnvUCyoJD3PKb9JAyrJy2803VoQ8a9Tpqh0UXDMJD/w4KjheAU4EhtHqqpoctfTvYeTm4fRzZP2t4+dkg0C4t1Zh0YvnX6qifc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779695392; c=relaxed/simple;
	bh=MG5VQdE8wH9duQMq6GRWZ/icXsNufIafal21mAh2S5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R6TtGZ2tz4iD4V/EN+HtwMOeFw+J3NSg/pdRyWa2iU0uhk0463Mx+rP2eJiKGSqPIdr0lDB3TqQZpxzcdyB8lodjSLrHnauvD/J+NSi2SODZ1V8zNtScCoxUo+mlNYl9ePnMoiscDEmj4jXtQY4ZOWICannoJL88SzvYuNArxP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jGP5Q6N4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 371D41F000E9;
	Mon, 25 May 2026 07:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779695390;
	bh=I7vMJj5EtpdgmLSXjR+hKtvIpjLBCA8z3OnWj07DlmQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jGP5Q6N4zoAVCKIIpzFCpdo+Xy1zHeo1dbQSwrNUyQxirtJIgAxBT//taizMKjs3M
	 an1aNHzbSpWhRC/2OJimJkti7tGnY5fcLSkjwVZgNR4UgOkpsFPHLkZKZyex0TpgLN
	 gvVPVe4gcmyV/6G1oR2Y6dtYpcTwpWikPEQwqExAB25W8qO0WnaOj2AOLtmu01j9UG
	 vF6Qi6rfHSg7br0DVE+a9wTq+qmkR4kIwGsxyPS9Ejcr0ruQcvOS98XT1QjFIqIlhz
	 Jb8P95PxKovAD4JTuzCo+meu9QaY8ffhfjdJK+Yh1w0/PkmwZPJIQ6Dyk71YccfUr5
	 5jaWX+upuMJug==
Message-ID: <639c94f9-6f62-4502-ad7e-5ae60f5f6d02@kernel.org>
Date: Mon, 25 May 2026 08:49:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] clk: qcom: camcc-glymur: Add camera clock
 controller driver
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260517-glymur_camcc-v4-0-9d00acffdbf7@oss.qualcomm.com>
 <20260517-glymur_camcc-v4-2-9d00acffdbf7@oss.qualcomm.com>
 <8bd4365e-0171-425c-9738-0b186047cb15@kernel.org>
 <upcLoSPzJejUNhFiNYlTVH4d8Sh_Pv2o9OZfXsY-CMCDKw19_ci2gL9B3ZwqL1hV1pQeQMLDL8tNLbPzs0JIIg==@protonmail.internalid>
 <2a496bdf-4728-47b9-84ba-063712a6e5b6@oss.qualcomm.com>
 <0a197b43-a672-4849-91c7-6e5bfe3175f7@kernel.org>
 <amL4e4IHe75_j1HTIsmqE_GyurvudlyHQCPW14zs7ivHz0UnalN-yoknJwzaVRgHTT6ftSRCqDyCodh6ABCLxw==@protonmail.internalid>
 <66335474-d600-45ab-9ac6-e946f24142c8@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <66335474-d600-45ab-9ac6-e946f24142c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109575-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 1A3C65C747E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 25/05/2026 08:06, Jagadeesh Kona wrote:
>> That's not in your overview letter so generally I'd advise to include things like "did X because Y" - "didn't do Q because Z" anyway, how does it make a difference if the values are static ?
>>
>> They are no less magic numbers that way.
>>
>> What exactly is the resistance to defining the bits ?
>>
>> I'll state again - when a vendor is submitting something upstream where that vendor 100% controls their own documentation - there's no reason at all to be presenting magic hex numbers - even more the case with generated code.
>>
>> Just update the script to enumerate the bit fields, I honestly don't get the aversion.
>>
> Hi Bryan,
> 
> There’s no standard interface for these bits, and bit definitions/fields vary across PLL types.
> So, common macros aren’t feasible and would need redefinitions per controller. Since these bits
> are not reused elsewhere

- Asking for named bits not common macros
- Reuse isn't why you name a bit

, IMO directly using values from the hardware documentation keeps the
> implementation simpler, avoids unnecessary abstraction, and makes debugging—through direct
> comparison with the hardware spec easier.

How are hex values in upstream code easier to debug ?

Without the spec you can't change or understand hex values in upstream 
code, which is the whole point I'm making here.

---
bod

