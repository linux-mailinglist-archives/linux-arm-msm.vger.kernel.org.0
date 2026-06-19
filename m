Return-Path: <linux-arm-msm+bounces-113848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /Q4eNUBBNWr0qAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 15:16:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C08C6A605A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 15:16:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=Hv2I2P55;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113848-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113848-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 193463011741
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 13:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 023C438D419;
	Fri, 19 Jun 2026 13:16:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A808383326
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 13:16:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781875003; cv=none; b=omtZCl28dhTG2fHFa0xKcufDJba2zrXAgm4MLerPCwTWlDW4HdIafKYhhtqUi5b6N1cI6T/nASpcwhIDeew1IamxXjRhAVcDAcO6PK0dJ7ilkPMZFwIOUy8v4LL139Eu/OrHssy5wvLjPHqj/X8TAAQWSbaen9Ybkr5rJ3hrpkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781875003; c=relaxed/simple;
	bh=4sgAZRMpN+E4EFV/WjC2hK1lLof0TXc2GUU3wBWck9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ymz9FBxDHetVbE84DI+3x8klCn5U8sLZXRsAjZpiiSG9Ra9KuedTLS455qEPGQZeFZLAqkYpFmuZzBNT0oXbMT7MysYaIe9qAGABnKnwPEMU01gBRIYIvcocw72fWlcVeTT7taa/ujD0NtHEMkLXqOJhD8M5w08v7T6dPfeEWCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hv2I2P55; arc=none smtp.client-ip=209.85.167.45
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5ad560a45d8so144889e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 06:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781875001; x=1782479801; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pgcSYa5jaMnEPZ3HUYjkicq09TjBCnm74Jqw35loCI4=;
        b=Hv2I2P55R9TuDnUNArOg0uQyLd83K1vnyVWf4tWVfcdqhO91rIZqXRpTw7z2y7e4Xg
         zSmK039nzfVrmXwJN4bWbNLEE04bcfRh0oyNmgIGQ1bzPiHkGRjobojbTx931T6Cz5TA
         Wbjqx/iVipc0shqSCGRqVGLrDnhHpEr2AklKGyNWOK9W9fWYwSl+EX0tVx7enTFCNHtG
         560f/Re5c0NbctZdZjixz9hDpHCokh99FggpZVu+cGz/3BuSjs4QAy/E8jUcqoFAjE90
         J5rrUIUmcivQMRSsrJ7AutdMZXKfIL0iVhRNAatF/cOqClhuYpbGr/bmqaGcOvowvdIw
         2TKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781875001; x=1782479801;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pgcSYa5jaMnEPZ3HUYjkicq09TjBCnm74Jqw35loCI4=;
        b=iJiftI0jMZJF3gDV6h+pxTcjZi1kNdCgbzL37Z7gi5G/yaSISJ2BfCh0WhKLQzfCgN
         fQhJzP8M+xSeZ2RoKYrQHuds7abfHuP4Sy+6PXCXywCngIy7TYSQ0xW1xiErvBhCAciz
         ECfZ4jV1mP1dHVmWO8wm8oBGszYb/YhPCsGr9PceH0J8HRU7NHYy9ZVg2Hox6RaqVA6k
         jG2KidHUll9emdfN30Shf1iQMFgAWd0Rx5eV8VS4zGHzQKG4qd9d1I1rNb/w9JHdh6XY
         3Ggg1KSUhYTVd9nMDm9JPe/7auR568cqC2kpgaF8Dq3gUy08axf4bvwlMEKoSOiYG97v
         5xAw==
X-Forwarded-Encrypted: i=1; AFNElJ9eumsz65MUaGZ6wLb9Bosp8t1H7563wsrCqvriEB/iIa3PLJbnO0X8g/ZJvtmK4R51k872hVyhw+67zhys@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcj+ZzOIGE+ExrbKZff9ntHcG6L6VoGX1zW3xBLU/z1XezO5qZ
	vSy/M2qsj4hAJS74pTwtvz6cnToYZ8FCmtDknlM5VF2wIiKq/E83CKP2YzPXvQqPqB8=
X-Gm-Gg: AfdE7ckg+pCIH2L38NAsCaeEVlef8HrNtXd0fD5ig8C1H/H7UKoK3kx2q85QdAwj1TJ
	UD6XwVMKrHI7RKzSH1RX0aanS34ZP7loFDqUaduZm4pQXrBKdvQWWJburUoT2a1tvjOg+nP8CnY
	RO3XpHWccBX/taCi+gSw+K87i/OtJwyi5Exdnyqgbncxw4XjKi7tpl+Wu6bGORc0yV5Ifbb+q44
	kStxa9kOvDdSh/timnIeL+Zjh1zVlE6ORKg8AjNwfmm4vIQZdhPkmE9SJVgRWpi9CtccgZrdYi9
	7OHNaDuY297wbd5nZawhP0ocmvgUpeB2UvUxPT6vZn2rvNAOWjgG07fRdYoALaVYUDBpRo5oXiJ
	zPnR2QIwWYB0Kt+6djhUFKlIPF2hC0mYCvZ+XOKayXT8PqjrOfwO4E3MgIlKjqm+8sNPuLu+aNQ
	lJA4nbSOFJeItvC9/nxZp5W/D3b/+gP04ONUbQhyoJ9j48HYtOkvUWmeh2FmlTfb5lGAU=
X-Received: by 2002:a05:6512:118d:b0:5a8:7317:540b with SMTP id 2adb3069b0e04-5ad562e8a19mr557862e87.7.1781875000383;
        Fri, 19 Jun 2026 06:16:40 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad57246020sm583518e87.21.2026.06.19.06.16.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 06:16:39 -0700 (PDT)
Message-ID: <97105c63-4e6d-4bde-9053-6f795c2477d1@linaro.org>
Date: Fri, 19 Jun 2026 16:16:38 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc8280xp: Add camera MCLK pinctrl
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Pengyu Luo <mitltlatltl@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260607160435.36546-1-mitltlatltl@gmail.com>
 <280402c0-57bd-46a3-b95c-f9ae02122a09@oss.qualcomm.com>
 <CAH2e8h7aGiF1g_LgG4WxEj1eGbUp-T_U-yZVpoHgU8FsMOrWTg@mail.gmail.com>
 <423b4e86-3837-4d69-8f56-d8259be53ff5@oss.qualcomm.com>
 <12a89ab8-dc43-4b55-9c95-36d44c75dcab@linaro.org>
 <162da512-1142-48fa-bf7d-0b2393467a75@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <162da512-1142-48fa-bf7d-0b2393467a75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	URIBL_MULTI_FAIL(0.00)[vger.kernel.org:server fail,qualcomm.com:server fail,linaro.org:server fail,sea.lore.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-113848-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:mitltlatltl@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2C08C6A605A

On 6/19/26 16:03, Konrad Dybcio wrote:
> On 6/19/26 2:59 PM, Vladimir Zapolskiy wrote:
>> On 6/19/26 15:35, Konrad Dybcio wrote:
>>> On 6/11/26 7:29 AM, Pengyu Luo wrote:
>>>> On Tue, Jun 9, 2026 at 8:17 PM Konrad Dybcio
>>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>>
>>>>> On 6/7/26 6:04 PM, Pengyu Luo wrote:
>>>>>> Define pinctrl definitions to enable camera master clocks on sc8280xp.
>>>>>>
>>>>>> Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>>>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>>>>>> ---
>>>>>>    arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 56 ++++++++++++++++++++++++++
>>>>>>    1 file changed, 56 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>>>>>> index a2bd6b10e475..0dbcd3069a3b 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>>>>>> @@ -5484,6 +5484,62 @@ tlmm: pinctrl@f100000 {
>>>>>>                         gpio-ranges = <&tlmm 0 0 230>;
>>>>>>                         wakeup-parent = <&pdc>;
>>>>>>
>>>>>> +                     cam_mclk0_default: cam-mclk0-default-state {
>>>>>> +                             pins = "gpio119";
>>>>>> +                             function = "cam_mclk";
>>>>>> +                             drive-strength = <6>;
>>>>>
>>>>> Other platforms set this to 2 by default.
>>>>>
>>>>> What's the value set on Windows when the camera is in use?
>>>>>
>>>>
>>>> It is 6mA.
>>>>
>>>> Let us get ctl_reg first on Windows
>>>>
>>>> lkd> !dd f111000 L8
>>>> # f111000 00000284 00000002 000000e2 00000000
>>>> # f111010 00000001 00000801 00000000 00000000
>>>>
>>>> ctl_reg => 0x284
>>>>
>>>> in msm_gpio_dbg_show_one()
>>>> ...
>>>> drive = (ctl_reg >> g->drv_bit) & 7; // (0x284 >> 6) & 7 == 2
>>>> ...
>>>> seq_printf(s, " %dmA", msm_regval_to_drive(drive)); // (drive + 1) * 2 == 6;
>>>> ...
>>>>
>>>> x13s should be the same as gaokun3 in this part.
>>>
>>> I confirmed as much and I'm willing to believe this is a default for
>>> all 8280 devices
>>>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> for the second patch, please mention in the commit message that the value
>>> will now match windows and please add a fixes tag
>>>
>>
>> I believe the second change cannot be tagged as Fixes in sense that it
>> strictly depends on a not going to be backported non-fix commit, and thus
>> backporting of just 2/2 change as is will break the matter. Reordering of
>> the commits placing the fix commit as the first one should be fine though.
> 
> The Fixes tag makes the patch eligible for backporting through AUTOSEL
> but is itself not the same as "please backport"
> 

That's correct, and due Documentation/process/stable-kernel-rules.rst it
would make sense to add Cc: <stable+noautosel@kernel.org> to the next
version of the change to help stable tree maintainers, since it is known
in advance that the unmodified and Fixes tagged 2/2 change shall not be
considered as a candidate change to the stable tree. Or is it excessive?

IMHO here it might be better to properly arrange the changes and backport
the fix.

-- 
Best wishes,
Vladimir

