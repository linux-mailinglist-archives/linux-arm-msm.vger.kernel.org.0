Return-Path: <linux-arm-msm+bounces-113844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CTTFAZk9NWrMpgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 15:01:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5623D6A5E7C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 15:01:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=SJTOifDt;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113844-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113844-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 460793041A59
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2026 12:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8117C38D40A;
	Fri, 19 Jun 2026 12:59:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F405038B7A5
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 12:59:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781873987; cv=none; b=DoswNgZBKfVxsiLSKN40r1FPBY/A+CMSfnG654KBw8UlD6QrSRrJKDImXFRzJjEG7qGLPTwSYoJo3tiNzWSb3yo9R5mgjoyjVVy+LyrTdiGtOga21jTrYgZW35ntLMV+nGIFSXhb4f0jiIJwsMTVsJ+iF14hlK74gAQLMSYlkHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781873987; c=relaxed/simple;
	bh=B5pCpCW3fPa2uQlAQe2jred8xTwAmDOhSnaUI3XNfYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RWFTeK14Yiy5xV8Nn9gdDD9FPquZPSdiPKZG8AVFzijohXL1RHcYE0wACHrQHuQe2yZdqYgt/aIMyFjDEZoyLT3vFOuqTX0gxPQVtlHo1ehBIegkCdBX3eWGaa0tognn0MGMryBYbyGXBlujcVMVcIQEsu4CSo3BfE0QR9rKYAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SJTOifDt; arc=none smtp.client-ip=209.85.208.180
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3967720c093so1989701fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2026 05:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781873984; x=1782478784; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNXNfs7OoHqiz3UZ4G1yzyr8/Xuq38knH16nIszO0oc=;
        b=SJTOifDtEPMABEmTi/2y24pCu17o24gHAvA8A1e+kpCbDzm+0nNIRns+gxXk/W/LMI
         1qaI72vE/xCi7foFsal8R0i7AQBb4hp0xjW/q8dInmDCsn5Bgui2Q0JBftQChds8AcXK
         Os3VZrPPtHE1n9jLljiG7Gm7P9Npy0eVDNB0Kief3zKOIP/0lPy0ZX2F2HQbXH0A6LI/
         5oqzEdNsCDDgi8Xbl/a811WZDj0rUer1ilgSF2czVHMnNXC/KbeMIynQUYLRuuw7ULBR
         kboG/O+Jk4FfEDIGljQzYg3TNXDTkHN1uqo1fxq8IseOMm8h9ja7XUlnB0XGEOTMdktm
         3LNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781873984; x=1782478784;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sNXNfs7OoHqiz3UZ4G1yzyr8/Xuq38knH16nIszO0oc=;
        b=lpWKPyySGyEL2JnHCbRcnof9nHvU9+sMJNRcsy3ZgEyv5S7XKkza5OFBUn58rgTF92
         0vT3UPXzKhB3z56BLzzHHQNNLktyWZ4P7N1NWfH1rKCI+OtCsUnx0iIQZCLAB69tWwpA
         EIWJfd9MPK7Yk7nvacXTP/ksws4kAm4UjOquNB52/0lwxWOOrVU0H968u3HD7nlFZ/1t
         ZXSspb343p4PMbVEZuJj6WNmTci7zyQaDC0yjb8Rpj6l8KBdxW9xdZQqRmfnoLQ2l3A3
         6V6WN7qW7lnqYxSxvWPoWqIaRISxt+MvsWNWhTEnojKouDD11WEXH3C0Qq+nvIcnr4lZ
         R/4Q==
X-Forwarded-Encrypted: i=1; AFNElJ+JvMWZYxPhG7fswk0CG9+/pP5IXUPe6suxRI9XN6sMpHauRk6UfsKifzsXSWxzDuIhm4/cVBIOEh0ZmAd8@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk78A85Ij/dK6uNJAmWptVlaQdf1KUmHTLJvkmbjGguk4DPqbC
	UbdTZRPuVZEuHHwnJ1tttZTksB3j2CF8hnol/SW8IRX0l0d5wKXhdDX8HgQDZB7goWY=
X-Gm-Gg: AfdE7clmyKR1qGFKjcxy1LlcvsQ4tSmTgvW5bkD4zQKZscaCuATM4vujIPAs9Bg1T8j
	BaaaVf5yqvpWxRC7OBvkSouMVv/u1NKWlMwOV0iMWjPXAYqhh8pDwFw4aV9OHUOP5+0DOG+rqqC
	pinupkBLO88g0rsJ580pOrPJzkbHYzAmt0y+NVyo8VeS7JS8D/ILbA+O2aM7cWVUo1DBErQEVkJ
	OH71K+T6D2hPjNVYQqJCpbxZAxYlBOEIP9jLJRU2ABRn64ogslEEl8u3DCChU4PPvpGnKq9MFRT
	HGE8WzyYpLOi2IY9aK+CbvnkQUJdNrOkddRkYDlDLhcTi42G2W+EmirER0OhoKMeNak+UAp3MhW
	Jq3SYQkebtM6jrpiAB+XpwanIGeBLuGnXSrVvIhSiXKIM0XHFNmacUx7cP/4kFRmLdufvSUNjYw
	KxxB9fUVgYjqWE1XJ74uc+7SMu0cxwntK5aIwtj6/lG/OhJaCmx+A34jevz1R/T1jLjFtLSLWmM
	IaPbg==
X-Received: by 2002:a05:651c:19a7:b0:393:9d8c:73d2 with SMTP id 38308e7fff4ca-39996b0af9emr606311fa.7.1781873984104;
        Fri, 19 Jun 2026 05:59:44 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3998bfeb6edsm4502291fa.19.2026.06.19.05.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 05:59:36 -0700 (PDT)
Message-ID: <12a89ab8-dc43-4b55-9c95-36d44c75dcab@linaro.org>
Date: Fri, 19 Jun 2026 15:59:35 +0300
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
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <423b4e86-3837-4d69-8f56-d8259be53ff5@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-113844-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:mitltlatltl@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5623D6A5E7C

On 6/19/26 15:35, Konrad Dybcio wrote:
> On 6/11/26 7:29 AM, Pengyu Luo wrote:
>> On Tue, Jun 9, 2026 at 8:17 PM Konrad Dybcio
>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>
>>> On 6/7/26 6:04 PM, Pengyu Luo wrote:
>>>> Define pinctrl definitions to enable camera master clocks on sc8280xp.
>>>>
>>>> Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 56 ++++++++++++++++++++++++++
>>>>   1 file changed, 56 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>>>> index a2bd6b10e475..0dbcd3069a3b 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>>>> @@ -5484,6 +5484,62 @@ tlmm: pinctrl@f100000 {
>>>>                        gpio-ranges = <&tlmm 0 0 230>;
>>>>                        wakeup-parent = <&pdc>;
>>>>
>>>> +                     cam_mclk0_default: cam-mclk0-default-state {
>>>> +                             pins = "gpio119";
>>>> +                             function = "cam_mclk";
>>>> +                             drive-strength = <6>;
>>>
>>> Other platforms set this to 2 by default.
>>>
>>> What's the value set on Windows when the camera is in use?
>>>
>>
>> It is 6mA.
>>
>> Let us get ctl_reg first on Windows
>>
>> lkd> !dd f111000 L8
>> # f111000 00000284 00000002 000000e2 00000000
>> # f111010 00000001 00000801 00000000 00000000
>>
>> ctl_reg => 0x284
>>
>> in msm_gpio_dbg_show_one()
>> ...
>> drive = (ctl_reg >> g->drv_bit) & 7; // (0x284 >> 6) & 7 == 2
>> ...
>> seq_printf(s, " %dmA", msm_regval_to_drive(drive)); // (drive + 1) * 2 == 6;
>> ...
>>
>> x13s should be the same as gaokun3 in this part.
> 
> I confirmed as much and I'm willing to believe this is a default for
> all 8280 devices
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> for the second patch, please mention in the commit message that the value
> will now match windows and please add a fixes tag
> 

I believe the second change cannot be tagged as Fixes in sense that it
strictly depends on a not going to be backported non-fix commit, and thus
backporting of just 2/2 change as is will break the matter. Reordering of
the commits placing the fix commit as the first one should be fine though.

-- 
Best wishes,
Vladimir

