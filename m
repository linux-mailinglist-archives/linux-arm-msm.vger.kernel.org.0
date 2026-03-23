Return-Path: <linux-arm-msm+bounces-99123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YARUKSX0wGkwPAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:04:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BBA2EE0A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:04:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 033CD3002E54
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 08:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF6A370D44;
	Mon, 23 Mar 2026 08:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BX5xhkIf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE0836AB4D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 08:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774253087; cv=none; b=exfUUGozZN2G2afW2ZkvCvVK5HDfnZVIbdtVcTVNkUgj1JDqSPSwQoTM6fFlM7hHsDVPYhDLKyWKJ7aQhhIl330OuFZZGJrdFo8o3u5+JjL8v0Anu4O3wCa6MWH+H51ryr6VVHS9A4GoBT8DcPkTfJhXsRahfGDOP5YJ4MPmTt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774253087; c=relaxed/simple;
	bh=FyDVmny1lKyWZt2C7R4yP3VBgsWQOTJUxnxweCTKAwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lvuu8c1AbvST/bSGHZQcvr3tkwMZx8O//JDRR7qfolaBZM2gbl/wTGnapB4lFURwr5YzYGDx/UgDRI9Tbr45kwBoR5z0RhSqI+TdEXs1DZHm9mZxAPEP1w4o83leIPme3no+611cLps1dDcWOzkaIyZl1c8SgrLUoCW6s1QHLro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BX5xhkIf; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6694c9c02c5so2251221a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 01:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774253083; x=1774857883; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PnblP8CQvZiJ+kABfLMIcb8M41A+7UuV9nDV/q05Lhs=;
        b=BX5xhkIfvOtqQ+sjrT+1bj5fWaMel8xH5mIAqCWowwymiggcRsJCAdObEaM/ARuC8e
         ho6/k2dBk+OFzuL1SKBOB+i1X/lheByloZsQ59Dnf8L0XXM0SGlw/KaYIbJ+QGc4Tzos
         qnFmU3PeLJMOlci0HfHcUdQua4gK4ag1NAhWgRb9SHsxvT0DGSzt4c0CU8Cf4xllQZTo
         HjiCD4Bw5hRrVGetx/obZznK/jK7goDMXP0amnWcUHyN5mr+XkhdNAoO8kVl5R4pvzKg
         8p4xdM76chodZnbkIbl6rXQ0Rwe7Ju5vJmIJoSmkh1pxiMygW7xboN+chUvVIydL2Lzm
         gw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774253083; x=1774857883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnblP8CQvZiJ+kABfLMIcb8M41A+7UuV9nDV/q05Lhs=;
        b=kwnjbHeXn3PUocfg3iQEHKUNgTob1GwF2m80OxWRuiT+utL+bJvQga4RiwCjffPiLv
         9088yRWdk6tGNvCZEfJ4J6Bg1BZLQpfd+eE5zhx8AfibavHJ8ayju+f1XDcT+GNpG8BM
         1rvJonOJh/ef4BQseZ3YeRj6O0+u2V9s19IG2F+Ng7PbaSU7bNoL68Avbo8QXdta3g3b
         YKe5B/p4QZAVMsmDWBRCVbf2m7SYa1CH7tpDm7u+5BdA+EBM8z09TUYrFvcSqo9YkJn7
         WAX94zZPg8KZTeqGoRNw6STmNo6CuWky4N2QHKdR4wfg0EnwMHDMHO67ndVEyYKp6Ms9
         B1Bg==
X-Gm-Message-State: AOJu0Yyt0wGoCchdBoDi/ur1C4KIz2GRBSh3Z4WE6tfKAoqxyZw3lZOC
	dvxznjP5yxICr6q3OuyUn0mHstYO3cR2YSEJUQEsBvC69T3wfWF3351+9qxDhVmR
X-Gm-Gg: ATEYQzzzLP9ikNgE8sJpZuKneDY3E9XUmnXo2cjwY687uhUm/Rr/bwmSSyQ2sIH8QDP
	+DwgDSXQyqYuZ4gLcj1aBhfywu98CPNTF8k/aJjR1Es6eVPoDJpkb3MHyjCXMuCTEWynbAqEHcC
	WXUKmayjzl4v54WOCC6BuieST2ZDxo++6R09VwCvb+f9xYKRLmu+zz52AwEwxQxDnOe1MQ+K20j
	iat5FVdmQgu7aVyyuodUd3xrT61pjdUDM36TpD6VDHgMjlqp6P75vUDNZ/GCUxF73Ah6zWyBBhD
	fWFQJSKKBCZl/vjZe0fhtTfQJgXbbIgqgC8ZizsvwdC6H0UbFmw/N4yGz0Naps8ENa6/bvjXSDC
	LgIEpX2sKHulvMd0HpAhYhjDtFE9gfo35oskuLV49RXKtv/EHi6VRoUcjS41PZTifpZoT3e5SAG
	i7Agv1z+1EWOZatHoWRBfT/iO7
X-Received: by 2002:a17:907:1604:b0:b96:ecc3:781b with SMTP id a640c23a62f3a-b982f0a9521mr828589066b.1.1774253083079;
        Mon, 23 Mar 2026 01:04:43 -0700 (PDT)
Received: from [192.168.1.31] ([178.231.179.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8dc51sm458431466b.22.2026.03.23.01.04.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 01:04:42 -0700 (PDT)
Message-ID: <3bb1da4f-f2dc-421d-95f1-5bba9e3e1aec@gmail.com>
Date: Mon, 23 Mar 2026 09:04:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: Add Xiaomi 12 Lite 5G (taoyao)
 DTS
To: Val Packett <val@packett.cool>, devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-kernel@vger.kernel.org
References: <20260305093941.305122-1-zstaseg@gmail.com>
 <20260305093941.305122-3-zstaseg@gmail.com>
 <9ea41e6c-7643-452e-abf4-f35238807a26@packett.cool>
Content-Language: en-US
From: Stanislav Zaikin <zstaseg@gmail.com>
In-Reply-To: <9ea41e6c-7643-452e-abf4-f35238807a26@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-99123-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zstaseg@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 21BBA2EE0A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/21/26 8:36 AM, Val Packett wrote:
> Hello again :)
>
> On 3/5/26 6:39 AM, Stanislav Zaikin wrote:
>> Xiaomi 12 Lite 5G is a handset released in 2022
>> […]
>> +    touchscreen@0 {
>> +        compatible = "goodix,gt9916";
>> +        reg = <0>;
>> +
>> +        interrupts-extended = <&tlmm 81 IRQ_TYPE_LEVEL_LOW>;
>> +
>> +        reset-gpios = <&tlmm 105 GPIO_ACTIVE_LOW>;
>> +
>> +        avdd-supply = <&vreg_l7c_3p0>;
>> +        vddio-supply = <&vreg_l2c_1p8>;
>> +
>> +        spi-max-frequency = <5000000>;
>> +
>> +        touchscreen-size-x = <10800>;
>> +        touchscreen-size-y = <24000>;
>> […]
>
> I have noticed this previously and started wondering why the size was 
> 10x higher. Now with my own device (motorola-dubai) I actually found 
> out why…
>
> With the actual 1080x2400 size, the mm values reported by libinput are 
> 10x higher than what they should be, e.g. touching the bottom right 
> corner with libinput debug-events:
>
>  event3   TOUCH_MOTION              2  +1.493s  0 (0) 98.80/98.75 
> (1067.00/2370.00mm)
>
> (2.4 meter tall phone! :D) which was mooooostly "fine" except Phosh's 
> on-screen keyboard was accidentally detecting super-fast down swipes 
> as I was typing normally, and suddenly closing the keyboard as I was 
> typing.
>
I wonder why some other devices with gt9916 (there are a couple in 
mainline) that specifies 1080x2400. I don't think we can make this 
assumption unless there was a mistake already in those mainline dts.

Best regards,
Stanislav

