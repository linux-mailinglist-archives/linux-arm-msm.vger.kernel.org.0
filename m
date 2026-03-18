Return-Path: <linux-arm-msm+bounces-98556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKoPOW7xumkBdQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 19:39:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E36A2C171C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 19:39:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 77738302E0CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 18:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 662CE3E51C5;
	Wed, 18 Mar 2026 18:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bVNAOC3L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC6C377EC8
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 18:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773859173; cv=none; b=H6LuMW/nc8bK6zhgX3XZnYrur2Meus8Ks9e49aqOi9RtimHBS4dFRtasJR/EpKJQhz0fwly1C+bESdmuUukgdIPAocVUO04VVleoIV7Auj+BqYPJlSHUfEp9Ig6pyYVLiq3UXQRxxM8X4OeaWCGo45wpp38USuWCFqTc5mRoLgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773859173; c=relaxed/simple;
	bh=OhK95wo/LYj7R7tzUElFwcUK2IiZRunuZ2g5LeCSFgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xf8cF0GyLpas8vw2/CGrZVUkHLcQPveo9XbBbTomjvxtPuNYxb95u5Gll71quKWnaIArpZES0450hJgcnPdf/A2gA8n9LxRKt3BkYc0qO5Z85DKzCu0nopTdND//xvYXe4yyfFuURSaZmnkk+LiLUpD5ts+kPQbNmS4w4CcFUaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bVNAOC3L; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-128ebee22caso261572c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773859170; x=1774463970; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=15qwLCeSSBieP/miy+9XAN8j6MaIvEBFpVF+G71Ltsk=;
        b=bVNAOC3LMkaSUxzdQkPMaC6DqNNji7u439ThmPbwIepGZhL6MeiLrWp06HYXC9dfAf
         uV5X2rOL2mAwBwSlxRMWj7O3nhpBzrbaRMZWNd5PArmLRn4ZRAaih1WHptqFsKvJDtZi
         GjwSmJ8HHCzUzSADP2syuJgdVNLi+l1PgW+XUtRSaGF/3PCe7gm4ty5ieiPWpMG9NyFp
         UOiD7OZp0mucNBpPz7Q1E0x+BCyqtbxsUjpNwn9jrpnvQaiEXRWDlQLX7tonBiDBb7DH
         B983bP7ind2F94qIAgfCb1Fx3QtrdrYWl09H+pkKw9xaw4m8Iee7wJtgiVsw/EB2H9eB
         49ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773859170; x=1774463970;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=15qwLCeSSBieP/miy+9XAN8j6MaIvEBFpVF+G71Ltsk=;
        b=YpjWqgSUGpwLG/GCUQqynLWJG2+Aiw833JrbIQUXCu34CoByOhoDoeV4ARECqI1And
         lZZbAHp2J+X3vlpmYQm3QLxxR3Nh9JSvJ0zYHtTxrq3DejnSvwE+AaqwKWQP7GAVUfl8
         U+slGCG+tjcZToao0GghkpRzEPPfaIvQkr0pehMjN98ETkMtXmf35o+L2K3GFyaOTELY
         XZGCCppdeNqq7ZMMxsk+fTE1Wl5KBOuRQ1+U8tfcLU0i41f2th2iqWt/zoOcoHNp5gex
         wW4gm2bwQ3cfQJFWaLDD8GOpjYKFX9nq+Ih4rlHW3ZMs4WTdWeGv0kQNp0zXI8lTzjs3
         nSMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBmYGUaloiVfBdymFy7EXtMLpAmTqhyqIKCDBi8Vskt2JjbaYlY7ONKSHc75xInckuP6h7rx4nyB4QQj9p@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp8IT070idNOHnW2fenA+OzV6QPO0YvFlq233EepdxpX1cY4rB
	/TA4wJSpvzjCXt0zfRlw5DV2nYHi748e53wrTTa8/BdcrFFLzwuSu26/
X-Gm-Gg: ATEYQzySgZMAka7G59mF0t4AkY1yTvG5Re1tNPMGWNzhSoIo4zbsZbHxv/BmiDLn5DM
	4RBeOAyPlYziUdkF/xqudI14CPNlW2dCSXktWAimOasnTABr9nxyUSrH5jH+E3jQNe1XNcMEXuL
	SuiFhtRG4wqx1GRtRx+SYdLsNhinpp+F5rdp+Od/Rr/MsIczH8ihCAynpgjMj0kLJRohAShcDoQ
	mPbcVBTM1vvQdy40IxghbeGV5QdIb3hvrs5hVuNd4ip6X3B8Wc9vQOg32iSubB3iRJM9fMorewM
	zzudvO73koywtm5/IvstP0L9hB+asakcq/eSHxaq+zYuYxQf2krc4yBI2Rq7P+O2OZWxovsUwS8
	4OadB15qa0NNNRB0AZrznKsSl85vMpGC/h9+CDOuckApu5vL4RjnEHp2B3T/5AypCN+/qUkddhy
	xk+Dg8CUmLm/K7U1izTdrVU9SinvU5m8KfkSjfOr1mCNVh/AAFORKC90FQqg6DYe80OoDrgczko
	85ICQ==
X-Received: by 2002:a05:7022:2507:b0:11a:3483:4a87 with SMTP id a92af1059eb24-129a70e09ddmr2437571c88.13.1773859169868;
        Wed, 18 Mar 2026 11:39:29 -0700 (PDT)
Received: from [192.168.68.65] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-129a72562bcsm4285798c88.5.2026.03.18.11.39.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 11:39:29 -0700 (PDT)
Message-ID: <39226c91-a7a7-4f9e-a10f-4c3ddafeb432@gmail.com>
Date: Wed, 18 Mar 2026 11:39:28 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ARM: dts: qcom: msm8960: expressatt: Add camera flash
To: David Heidelberg <david@ixit.cz>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260306-expressatt_camera_flash-v1-0-b1996f7cdfdd@gmail.com>
 <20260306-expressatt_camera_flash-v1-3-b1996f7cdfdd@gmail.com>
 <b2cbd264-55c8-4dda-9545-fa79ce6517c6@ixit.cz>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <b2cbd264-55c8-4dda-9545-fa79ce6517c6@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98556-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guptarud@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9E36A2C171C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/7/26 00:23, David Heidelberg wrote:
> On 07/03/2026 01:58, Rudraksha Gupta via B4 Relay wrote:
>> From: Rudraksha Gupta <guptarud@gmail.com>
>>
>> Add camera flash support for the Samsung Galaxy Express (expressatt).
>>
>> The flash IC uses a one-wire pulse-count protocol on GPIO 3, gated by
>> PMIC MPP 4 which must be driven high to unlock the flash circuit.
>>
>> Downstream references:
>> Link: 
>> https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/drivers/leds/Makefile#L51
>> Link: 
>> https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/cm-12.0-YNG4N/arch/arm/mach-msm/board-apexq-camera.c#L591
>>
>> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
>> ---
>>   .../dts/qcom/qcom-msm8960-samsung-expressatt.dts   | 31 
>> ++++++++++++++++++++++
>>   1 file changed, 31 insertions(+)
>>
>> diff --git 
>> a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts 
>> b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
>> index c4b98af6955d..96460775a4ec 100644
>> --- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
>> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
>> @@ -1,5 +1,6 @@
>>   // SPDX-License-Identifier: GPL-2.0
>>   #include <dt-bindings/input/input.h>
>> +#include <dt-bindings/leds/common.h>
>>   #include <dt-bindings/reset/qcom,gcc-msm8960.h>
>>     #include "qcom-msm8960.dtsi"
>> @@ -61,6 +62,20 @@ touchkey_enable: touchkey-enable {
>>           regulator-boot-on;
>>       };
>>   +    camera_flash: led-controller {
>> +        compatible = "richtek,rt8515";
>> +        enf-gpios = <&tlmm 3 GPIO_ACTIVE_HIGH>;
>> +        unlock-gpios = <&pm8921_mpps 4 GPIO_ACTIVE_HIGH>;
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&cam_flash_en>;
>> +
>
> LGTM, just please order pinctrl-n before pinctrl-names :)
>
> Reviewed-by: David Heidelberg <david@ixit.cz>
>
> Nitpick: if you can, add phone-devel@vger.kernel.org for next time,
> it's easier to distinguish the phone patches in huge linux-arm-msm 
> pile :)

Hello David,

Thanks for your comments! I have addressed them in v2 :)

Rudraksha


>
> David
>

