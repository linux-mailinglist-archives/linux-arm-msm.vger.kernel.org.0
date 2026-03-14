Return-Path: <linux-arm-msm+bounces-97644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDPfAdentGlvrgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 01:12:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D934C28AD9A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 01:12:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 42B64300AC9B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 00:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E16D81D5160;
	Sat, 14 Mar 2026 00:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="d0VCZhPf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F135C1D555
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 00:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773447124; cv=none; b=rboX2y5JPT4nI+YKWfQnGYUay8wRCSaR7StjHyUI+bo0O0I5Z9OJLX1rRlsvMVcz6EwuMUa6qbc0Rnc8vmYyPRv1CGBZHZNpC/omI0ihti620evXioaeo7E9+pUP4XJhkrlVZz0jaSYG93fPe/iUKfAnOiqq5NpCv+RYqGumNdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773447124; c=relaxed/simple;
	bh=4segyY3QMSl/1qA0TXzeBzgo3C16gzxb9Rr8GiYr/ys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HtvtP4mME8OKNUl9xFogjA9TZI13bmlXtrBMU9FykhhagCo9iJVR/nc7RaOe51yEerksl2w/0Yt8/J3xqj+I+s/ONQIfY6oyVkTF0A0UZGpFm1QWN0Gr5KqUe1aXjSIdq4eQleWuuFw9nAb+sV+w55q9ae1d8Vs7i8qcF87ZCZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=d0VCZhPf; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <a045299f-9be1-4e91-8b3c-132a30613f41@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1773447111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UoeQv1cqLOVzIDScwdugzORdwsDIfs8B+RKp94VQiZ4=;
	b=d0VCZhPfV3Iphz1t3h7pNC9gF6IjFwqoz9a66qh5lTiHTSOjWMkv/RHTy/S3MlhBrQDV29
	jnLMOUTWN7jyTrn0T1leW+jC2aoufL9X+JGbL8Ta5kzYIlYej/ANi0u6GhAkd3VW41yoRg
	hXvdPW6t91t1HmDj5P6lGky0x5N9XZV0MZakLwhidGGg3BM5OW5H96k50jrsp9kT1eoIp9
	q5cvV59iNX6lSMVmzZl/oB6M+3ai6o09ON9bHVZtq3YIPyURIvwXXpap92hCyymetSQvZm
	xTZ8NKD+ers9jyiZbWY7Vb4KbPqHnPIvjUk/fy6jikizyWXNZA3HFrnrar3CFw==
Date: Fri, 13 Mar 2026 21:11:41 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/5] arm64: dts: qcom: Add AYN QCS8550 Common
To: Aaron Kling <webgeek1234@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Teguh Sobirin <teguh@sobir.in>
References: <20260311-ayn-qcs8550-v2-0-e66986e0f0cb@gmail.com>
 <20260311-ayn-qcs8550-v2-2-e66986e0f0cb@gmail.com>
 <4757fd22-fe9f-4228-a0a5-11d9309549ac@packett.cool>
 <CALHNRZ_RU+uHXfUtSO+8pKOYfBuK9jbYgqWE70WMQ=5Qz2MvvQ@mail.gmail.com>
 <quybzbqxlohu6kiqmno2wzyltwejnc2vebxdgvdl3fdib7zg7u@wz3bkop7psu6>
 <20260313-urban-prawn-of-success-cff01f@quoll>
 <CALHNRZ8iBqGGRDKhDNOasfyf8TY43ne1N82irkuzDZfWUuV5sg@mail.gmail.com>
 <wzle4bdmemfknhflwhxikq7rk7x3ao3z474bhsr5zdkvtp67cc@jddzjpzwlfrc>
 <CALHNRZ8_Lzn=mr89dezkC6hVwgxh9kYmg8ntLf5RDuNydc9VLQ@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <CALHNRZ8_Lzn=mr89dezkC6hVwgxh9kYmg8ntLf5RDuNydc9VLQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97644-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[packett.cool:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sobir.in:email,qualcomm.com:email]
X-Rspamd-Queue-Id: D934C28AD9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/13/26 3:21 PM, Aaron Kling wrote:
> On Fri, Mar 13, 2026 at 12:48 PM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>> On Fri, Mar 13, 2026 at 12:34:21PM -0500, Aaron Kling wrote:
>>> On Fri, Mar 13, 2026 at 3:37 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>> On Fri, Mar 13, 2026 at 05:19:27AM +0200, Dmitry Baryshkov wrote:
>>>>> On Wed, Mar 11, 2026 at 08:39:37PM -0500, Aaron Kling wrote:
>>>>>> On Wed, Mar 11, 2026 at 7:49 PM Val Packett <val@packett.cool> wrote:
>>>>>>> On 3/11/26 2:44 PM, Aaron Kling wrote:
>>>>>>>
>>>>>>>> From: Teguh Sobirin <teguh@sobir.in>
>>>>>>>>
>>>>>>>> This adds a base dtb of everything common between the AYN QCS8550
>>>>>>>> devices. It is intended to be extended by device specific overlays.
>>>>>>>>
>>>>>>>> Signed-off-by: Teguh Sobirin <teguh@sobir.in>
>>>>>>>> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
>>>>>>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
>>>>>>>> ---
>>>>>>>>    arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>>>>>>>>    arch/arm64/boot/dts/qcom/qcs8550-ayntec-common.dts | 1777 ++++++++++++++++++++
>>>> Common is not a board, NAK. This could only be DTSI if you provide some
>>>> sort of HARDWARE arguments explaining the common parts of schematics or
>>>> hardware design.
>>>>
>>>> Not enough. We do not add compatibles not representing actual hardware,
>>>> just to streamline boot image handling.
>>>>
>>>> Plus this code is not even truly correct.
>>>>
>>>> We do not write DTS to fulfill broken Android boot process.
>>> I have been trying rather hard to find a reasonable compromise between
>>> mainline requirements and a normal Android use case, something I can
>>> actually ship to normal users. This seemed fairly reasonable to me,
>>> since it can generate standalone dtb's transparently. But if my use
>>> case can never meet submission requirements, then why am I even here,
>>> getting shamed for working on Android? If I have to fork the
>>> device-tree anyways to fit my requirements, then there's no reason for
>>> me to put the time and effort in to submitting something I can't use.
>>> I'd be better off just keeping everything out of tree as googles
>>> kernel-platform supports. And never look at mainline qcom again.
>> Well... It's a tough argument. Getting your DTs into mainline would help
>> occasional users that would like to run something else than Android
>> (PmOS or some other distro). Also it ensures that you can run Android
>> even when Google (Qualcomm) EOL the current SM8550 msm-something tree.
> Oh, I'm not working on the downstream kernel either way. The question
> is whether device support gets mainlined or if I keep all support out
> of tree and only update when Google forks the ack from a new lts.

IMO landing everything with proper upstream style and having minimal 
customization/patching during your Android build process to convert it 
into a base dtb + dtbos setup (or a blank base + everything as dtbos 
one?) during would already be really valuable.

>> Speaking about the boot process. I remember that historically it was
>> possible to pass several DTBs in the the Android boot image. Is it no
>> longer the case? Is there any way to identify the boards (I think
>> historical code was using qcom,board-id for that)? Then you would be
>> able to squash all your DTBs in a single boot image.
> That functionality is still there, the concatenated dtb slot in the
> vendor_boot image. Unfortunately for this context, the odm did not
> change those ids per hardware variant. I think they just left them at
> the hdk or qrd default that came with the bsp. I do have to jump some
> software hoops to slot in the correct dtbo to the dtbo partition
> during inline updates because of this, but it's not terrible. And
> that's not something I can reasonably do for the vendor_boot image. To
> my knowledge, there is no way for the bootloader to tell these devices
> apart and any attempt to do so would require a custom abl build,
> probably per variant, which would then desync the boot firmware from
> the official OS, plus make first install more difficult for users,
> both of which I'm trying not to do.

Leaving the default board ID is a classic… but on many old Android 
phones you (read: an intermediate bootloader) can use the cmdline 
injected by ABL to distinguish between models. Nothing like that here?

~val


