Return-Path: <linux-arm-msm+bounces-92804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHA0J8Y8j2mtNgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 16:01:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BD1137612
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 16:01:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4A4A300BCA8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 15:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14C1533FE05;
	Fri, 13 Feb 2026 15:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EyMjC2n7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49211B4224;
	Fri, 13 Feb 2026 15:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770994876; cv=none; b=T+ozp8yjjdTaXLj88W901b+sRDPl7gc5oLnluprNfAdzHrkZavo7EXzsMGYZCHl8Zk/P1fzSh7YeJsY0F9XCJiGVta8PQ2FCERq7LreSXlspVkm7eUEfMyHwmBUFBYjhIRfYCJ6kTtPaB8bYo1CHpoHoyuKRrNo/T0o/hTPfAEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770994876; c=relaxed/simple;
	bh=i9Z1d9mtyD9VgpCG+vwLj2SdGmPboVbb0boZz52wsMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pNG4SWZG7eZz2Vct2o9pzwFZfBhXUPtPGO3sQOyjmjTKf/hkIqsMYU0y27Sz7WI4H39m1DG09DD/74S9ZOHdSOrSDgyIZyOI8nYwoRRW6PMz6aqY5yUlC2nVj7FHXbuToIzOJc1cv4lwX2scTt1eMDcBsSOqGi79YY1POWnoSCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EyMjC2n7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EDCBC116C6;
	Fri, 13 Feb 2026 15:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770994875;
	bh=i9Z1d9mtyD9VgpCG+vwLj2SdGmPboVbb0boZz52wsMM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EyMjC2n7IMPmDbmI7DcdPyLWe1wqY9BvMpSkTXHOoTF1ZHwabuuL6fLci8xqhxr53
	 elhU2yoIy8cC2ex9TzEgzamEsJdmJHAwGfUUQnFPBtlr79dA5jpv5oZ319+WLpEfQ/
	 iM/6fET5gGJ3uMqKlk7pRgCbPzmIbO9onbqLzW3Al2RIh1w3KwEy0S5/TwCC6jKpbz
	 Max5zmGg4g4vv0p67dQM4zlX2oa6r3Hy5rHvhywlqS1elCyfQH0FcDVBEwFRGrI5Xg
	 i41Fs9selWGsN7RBTktbNywpczGPc4ANLtLRLITWXcNv9R8qdggxRBiMIIi8ulmAQz
	 t823HwuOrrv8w==
Message-ID: <bedf5751-8186-4197-95f7-24682f24dee3@kernel.org>
Date: Fri, 13 Feb 2026 16:01:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: Fix DTBO boot failure
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kumar Sharma <quic_vksharma@quicinc.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
References: <20260207-sm8550-abl-dtbo-v2-1-83afaa6f3ce9@gmail.com>
 <d4faaf8d-1517-4187-8801-a2dd52d8dde3@kernel.org>
 <CALHNRZ9k3yxXb9OfYXMSfEwyYKU8Rrrrjb-hPqLgU90X9YBP8g@mail.gmail.com>
 <487e4605-0a21-48d6-8b77-9ce2799ad212@kernel.org>
 <CALHNRZ8sqCpUMyCFP99b7nHu2onojZ0EY6YGQZ9RMP0kH8jWzw@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CALHNRZ8sqCpUMyCFP99b7nHu2onojZ0EY6YGQZ9RMP0kH8jWzw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-92804-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	RSPAMD_EMAILBL_FAIL(0.00)[pavan.kondeti.oss.qualcomm.com:query timed out,krzk.kernel.org:query timed out];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 06BD1137612
X-Rspamd-Action: no action

On 11/02/2026 16:10, Aaron Kling wrote:
> On Mon, Feb 9, 2026 at 1:51 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 08/02/2026 16:10, Aaron Kling wrote:
>>> On Sun, Feb 8, 2026 at 3:07 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>
>>>> On 08/02/2026 02:16, Aaron Kling via B4 Relay wrote:
>>>>> From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
>>>>>
>>>>> ABL requires certain things in the base dtb to apply a dtbo. Namely:
>>>>>
>>>>> * A label named qcom_tzlog must exist, but doesn't have to contain any
>>>>>   specific properties
>>>>> * The timer node must have a label named arch_timer
>>>>>
>>>>> This aligns the sm8550 soc dtsi with those requirements. Without these
>>>>> in the base dtb, when ABL attempts to apply any dtbo, it will fail to
>>>>> the bootloader menu.
>>>>>
>>>>
>>>> Incomplete DCO chain.
>>>>
>>>>> Co-authored-by: Aaron Kling <webgeek1234@gmail.com>
>>>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
>>>>> ---
>>>>> With a current mainline sm8550 base dtb, ABL will fail to apply any dtbo
>>>>> and fail back to the bootloader menu. There are two changes needed:
>>>>
>>>> Since when? We were testing SM8550 (me on QRD) all the time and there
>>>> was no problem.
>>>>
>>>> You need to provide details which hardware needs it, if this is about to
>>>> expected, but honestly, we don't add such nodes/labels for downstream
>>>> bootloader. Qualcomm should fix the bootloder instead.
>>>
>>> This discussion has been ongoing in a couple places. It is needed on
>>> all semi-recent recent qcom socs. See this chain [0] on my sm8550
>>
>>
>> Explanation must be in this commit, not in other places.
>>
>>> questions thread and the previous revision of this series [1]. This
>>> has been a known issue for a while, see this comment [2] on the gunyah
>>> watchdog series, which is what the series was based on.
>>
>> But that [2] still speaks about overlay. You are suppose to boot
>> standard kernel with typical setup - concatenated DTB.
>>
>> If you want some other ways, like choosing overlays by ABL or whatever
>> else, you need to fix ABL.
>>
>> You want to use some custom boot way of ABL, but it's broken... yet it
>> is no reason to add these properties. What if I want to boot DTJUNK
>> files via my custom ABJUNK - can I add such things to upstream? No.
>>
>> You cannot add properties to support custom boot of ABL if that boot is
>> broken.
> 
> My use case here is an open source Android rom. I would like to think
> that android would be a supported use case. Not necessarily a driving

Android required in the past a lot of out of tree code and for years did
not care about mainlining these, so I do not care about Android really.
It's a fork, which for years decided to be separate, so we are not bound
by fork rules. Whatever the fork now wants to do together with upstream,
the fork must adjust, not upstream.


> force for decisions, but at least supported. And I'm using the
> standard boot image v4 setup with dtb on vendor_boot and dtbo's on the
> dedicated partition. This isn't some weird and wacko setup, it's what
> the vast majority of devices this soc is used in are designed for.

On downstream trees. With ABL designed for downstream trees. With
engineers designing all this WITHOUT single consultation with upstream,
so sorry, this is wacko in upstream :)


> 
> Also, the vast majority of devices can't replace the bootloader. This

We all were running Androids as well when upstreaming all Qualcomm
flagship models and we did not have to replace the bootloader. We did
not need any of such changes like here. Although maybe our devices had a
bit different bootloader - this I don't know. It was ABL for downstream
Android, though.

> isn't an option, the devices are fused. The qrd and hdk are not
> available to consumers. There are a handful of qcs8550 devices like
> what I'm using that are unfused and thus are able to replace abl, but
> I would prefer not not add that extra step for users to install my
> project. Plus, I am trying to not just make changes that only affect
> my devices, when they could be generic and benefit all devices using
> the soc.

... and why standard way, like we all were doing this, of booting
QCS8550 does not work? You append the DTB.

Anyway, this is not 2010 anymore, so vendors and bootloaders if they
want to ask for something MUST:
1. Obey DT spec and upstream recommendations for the DTS they use
2. Follow standard industry interfaces (and "foo_bar" requirement is not
standard industry interface)

I know that you cannot change ABL so the actual complain goes to
Qualcomm and/or Google.

Best regards,
Krzysztof

