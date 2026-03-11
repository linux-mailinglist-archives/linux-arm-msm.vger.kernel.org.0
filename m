Return-Path: <linux-arm-msm+bounces-97008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2E9sEeRysWlVvAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:49:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C879264D4F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 14:49:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 11C6A300868A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E3930C353;
	Wed, 11 Mar 2026 13:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nehGgZdp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AA61C84C0;
	Wed, 11 Mar 2026 13:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773236761; cv=none; b=X9DeuJJ0UpWj3+alE0M6s0gsHNFu0ZP9uCK3La+U1+CcVZlqA7T6W/3PXiwccAdQuf1u3380T42wuHOSxywq1Cy3L5D8QcjWmZIrs2lakkkPLc9epTK9fclwjfoZIQP3E3HScugbIZQFx5+W5Zr1sZsY+K6GRLURoqVIzrwP3mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773236761; c=relaxed/simple;
	bh=sA5VtIwFalDefpBU5WsVNiqh0/07Kxus4EY1iWzd0wU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hf/zcSQNT/oYr4cOeMfwWdpRJCdCpIKDfYyofstKMXcsqTG9/Y1aI90Y8fZt1UmIEM9WVACSIExPXsizhKLXxoep+gevmWp6hiXa++R4/NGl1M2JCMHNV5gBWkWbCz+QRgWI0UrLW12f30T0jENOTIP3/bKS/79oW0U7PoPj7aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nehGgZdp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 046D7C4CEF7;
	Wed, 11 Mar 2026 13:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773236760;
	bh=sA5VtIwFalDefpBU5WsVNiqh0/07Kxus4EY1iWzd0wU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nehGgZdpu6pGOfPoB5Io4mXoXeYozBDAGbvJNTH345/cItl5+8E+eryn5NxR9Ifdm
	 j8mGnneRT3NG7PO/qgQfdJoXW2RplxEEnt62m6wxLvGMqeJJYbqDX8AV8+n8xQ3vc9
	 XG32vk6EGlPGUZE2hT/Er6TPPQRrNRFrvhCt/MIXBOfgguGymM0OYQNW+q7pr+CXfq
	 1Oj4Pn8nhN2+8SAa5zqScV+kM8S+AePvSxM2zfohsrCuDOv+seTO8eDk75a8HXxpFV
	 Ydo1LNpJhVPA1MSsienkynDlnuA8dS73m5WpTB0qxknaTP+cqwyalhSZ8Z351Jj3rt
	 sIV6N/F15xpsg==
Message-ID: <09904716-69d3-4ecb-8bf6-6e2283631326@kernel.org>
Date: Wed, 11 Mar 2026 15:45:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] arm64: qcom: sm8550: add DDR, LLCC & L3 CPU
 bandwidth scaling
To: Aaron Kling <webgeek1234@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260219-sm8550-ddr-bw-scaling-v3-0-75c19152e921@gmail.com>
 <CALHNRZ9R1XaYWeTneZmyAvGY-s2-rbSC_=bSV-nC8_zU+bGLqA@mail.gmail.com>
 <97134126-f1a0-43f4-a4f6-0c1bd85e0c92@oss.qualcomm.com>
 <CALHNRZ8vEcq75O_M2A4F6p_Y000SvVgu4pAW5OLtX0ucAGAqFg@mail.gmail.com>
Content-Language: en-US
From: Georgi Djakov <djakov@kernel.org>
In-Reply-To: <CALHNRZ8vEcq75O_M2A4F6p_Y000SvVgu4pAW5OLtX0ucAGAqFg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4C879264D4F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97008-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[djakov@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

On 3/10/26 10:31 PM, Aaron Kling wrote:
> On Tue, Mar 10, 2026 at 3:20 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com> wrote:
>>
>> On 10/03/2026 21:05, Aaron Kling wrote:
>>>> ---
>>>> Aaron Kling (2):
>>>>        dt-bindings: interconnect: OSM L3: Document sm8550 OSM L3 compatible
>>>>        arm64: dts: qcom: sm8550: add cpu OPP table with DDR, LLCC & L3 bandwidths
>>>>
>>>>   .../bindings/interconnect/qcom,osm-l3.yaml         |   1 +
>>>>   arch/arm64/boot/dts/qcom/sm8550.dtsi               | 367 +++++++++++++++++++++
>>>>   2 files changed, 368 insertions(+)
>>>> ---
>>>> base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
>>>> change-id: 20260207-sm8550-ddr-bw-scaling-b1524827f207
>>>>
>>>> Best regards,
>>>> --
>>>> Aaron Kling <webgeek1234@gmail.com>
>>>
>>> What is the normal merge sequence and window for linux-arm-msm? I see
>>> several things that have been picked up for -next recently, but none
>>> of my sm8550 patches that have been reviewed / approved have been
>>> picked up yet.
>>
>>
>> This one is probably waiting on interconnect, no? Not saying that
>> merging here is easy, quite the opposite - it's frustrating, but you can
>> help by responding with actual data, e.g. bindings were merged and DTS
>> can go, instead of just content-less ping.
> 
> So patch 1, the bindings, has to go via a different tree; then patch 2
> goes via linux-arm-msm? Or does the first patch need an ack from other
> people? I was assuming both of these could be handled by the
> linux-arm-msm maintainers.
> 
> Part of this was a reminder, yes, but the question is still honest. I
> don't know what the expected merge window is here, knowing that is
> good to know if something got lost in the mix. I've got a couple other
> patches as well that are standalone dt changes with no other deps.
> I've had patches to other subsystems that have sat for four or five
> cycles just waiting on the subsystem maintainers.

Hi Aaron,

Last week i picked the 1st patch, so it's in this week's linux-next
releases already. I usually push an immutable branch if there are other
patches that depend on the one i picked, so i did that (icc-sm8550-osm-l3
branch).

Now the Qualcomm maintainers can pick the dts change if they want. My
observations are that the qcom dt tree is closing around -rc5, to give
some time for new patches to get tested before they send a pull request
to the arm-soc maintainers. If some patch is not picked, it's a good
idea to re-base and re-send when the next -rc1 is out.

Thanks,
Georgi


