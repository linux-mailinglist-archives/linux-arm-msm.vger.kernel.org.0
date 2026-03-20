Return-Path: <linux-arm-msm+bounces-98962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QM62A5p/vWnH+QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 18:10:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A2D2DE546
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 18:10:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7E35320C9A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 16:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D0D3C9EEB;
	Fri, 20 Mar 2026 16:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ij474Kf7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C293C7E1E
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 16:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774025966; cv=none; b=izmaqYpITxJljrwH7hToFx8s4iJK5Cnkpz92WrhXuAO7ZbJubXBwZX3Uv98Nhq86bF+9xGtFesu0UGnL8NDyDUcZ3peJDk3BJyEVOpGwJwaRFqobP/9w6q5uWntvqvX6n9Fy5Cevm4S1yXCNv6gpEStnZrAuERYC6M1LRox8nN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774025966; c=relaxed/simple;
	bh=L2W9w+6vxLH9URQi7p+/IvyA/+Uzq/UxyMxJZ9bBeRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UnmPGTUYue5ggBjg8JtwLMvfMgQfo4FC+RvEiTdMcQx9QeOLxbis1NWs0eJBOdg/9KOmrLg5zV5wrTyTjSKfDyJnMgoyP6i6G0nzrSvYt5SYJh/vmuO6jTArEdxl3XwvwGZK4ZTnHzdSacKf8YTRg4BYCIFUeuj4swP06ZN2nGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ij474Kf7; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2c10a2e2cd1so2398421eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 09:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774025964; x=1774630764; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=DH6eZIfXMuPqwWwyaGQJpfDG4fu2ZIQmnG7Lhe0n2FY=;
        b=ij474Kf7H5mM4VhNNeRo0GfJmmtxrREkgisZywWXi1VlC0rl68CSnY0p951yc0UZGZ
         xXik3R9X/UyWJyx45G/IIXYamH77rLsmy83FD37PgGFeeNZdK2MT1PtG59v94ZgnY41Z
         b3OMrDRdDlT9LnlL1r1mEvX89aP9kMuKGYWGapmz6z5IuaEwepjqGrCpdUCD6zJ9f8tc
         NKQZT4wf0e85SW/Z8EmwnKjk95EnenM3rHMHZt/x2fGjiK10G0ljaSqFXv+YWp8g26yV
         TxQAc90THXa8eWRu65SfXRBIPmVsXY70CuUIi8w58lNoI8bwVt2hWAlhDtThUmqCvilT
         Gazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774025964; x=1774630764;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DH6eZIfXMuPqwWwyaGQJpfDG4fu2ZIQmnG7Lhe0n2FY=;
        b=mOs2fYJyRPg41I3U5ZkqlJINm5+YksmTYyUfCZW0iAcqu7r1Eb8AzAytQzGDeCHRVt
         3Pwraa1RPAURgnZDnphlPwcun0u5gDRYhoQFydLkblJg6L62LzBPSL69oebJ6d3T43vg
         o6+IaPRXjuxTqmXbmDrbJZ9ZmcOMJeB/Mx9Ir1RzpF1HhpKcx+4yJdM8vB2RJUFalrH+
         LS4VpOCgtphHndKwqDevBjrglF1sOU7RUxuT8npaDOlx70rM0TVhVFKzyQI7PCuSxf+v
         EfYmGaP2Y24nQWE6Mk8uschAwDzmSSyZeZD19buUI5kAXzqpmYqRdGmxsQhQNYmoyTUE
         zhhw==
X-Forwarded-Encrypted: i=1; AJvYcCVBGjBge/mI7iZbJn3Z3FCWXZ7l9krgF9Xxvw+pfc8d8H/ULEFVkGQcF5v2iwqaT+Pnsi9LPZzOpgE0anCC@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp5sKneg2QHVyNRmnBaymUe5UsOV8HSTik7UGWkoof++b21Dg9
	zgHnK2y7WR+8lO1ucDeJn6ot9auqH29H8ppLd/dos7lEHt6IDSzC10sb
X-Gm-Gg: ATEYQzwXQQ/jiwxTTQ0GlVyXXEujfatad/Yt5b+NtFsC40tVWM+zoL8QRPJyw4YthX+
	Zt4BLBUsBpgcII58RXcsOVevQtnceOrGnbQF5L6JnI3r6AvTUfxbmnVtOTVRapgRDsKCyamjgo0
	P7rhB+hp9MKmyureUeJ3wMOO2OIfTzfuHSfnfLleJ0QSlX9yVV3yRQaN5rMMllXyMpHeayMlNf/
	mhb5hUZ3KOk5Q7zrWLG7iUurdqLWGBUnP56DWWTrK4ZONOzqJM80hjCXEPhYotGtuB26of/EG+/
	tgDCmflktoZFc2kpX7oGQivDbge5XpfPgm7d3SOmy+2ZvhgYqqYxx6ATK1ffwKt+mj1SEn4LhBz
	klyVEdkoPw5BklDflWVmE97VLa9aM6BZ0JwBWX/ZuNC2d02auk080n0ChmTC6yfZEJ40MxSmh/d
	gHMYT1mgf97qBiCuLsBZ/D3RN+urmodX3BMvV3r19SbvE7CWi97hs668ICxz8Le0KiqgO5emuVT
	47RCt0FFig=
X-Received: by 2002:a05:7301:4198:b0:2b8:26b8:3444 with SMTP id 5a478bee46e88-2c109712d6fmr2027659eec.19.1774025963508;
        Fri, 20 Mar 2026 09:59:23 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14c299sm3862969eec.6.2026.03.20.09.59.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 09:59:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1db8667b-5546-47bb-8ba5-cdb99fd60848@roeck-us.net>
Date: Fri, 20 Mar 2026 09:59:20 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hwmon: Add Qualcomm PMIC BCL hardware monitor driver
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
 Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>, linux-hwmon@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-2-7b426f0b77a1@oss.qualcomm.com>
 <ab1fSWx7pqlSANph@mai.linaro.org>
 <a922cf55-ebe7-4256-b3bb-cc732e45e1ff@roeck-us.net>
 <6f4b27c5-074e-403a-90b8-fe7ef3a993b5@oss.qualcomm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <6f4b27c5-074e-403a-90b8-fe7ef3a993b5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-98962-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[roeck-us.net:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A7A2D2DE546
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/20/26 09:08, Daniel Lezcano wrote:
> 
> Hi Guenter,
> 
> On 3/20/26 16:22, Guenter Roeck wrote:
>> On 3/20/26 07:52, Daniel Lezcano wrote:
> 
> [ ... ]
> 
>>>> +
>>>> +ADD_BCL_HWMON_ALARM_MAPS(in, min, lcrit);
>>>> +ADD_BCL_HWMON_ALARM_MAPS(curr, max, crit);
>>>> +
>>>> +/* Interrupt names for each alarm level */
>>>> +static const char * const bcl_int_names[ALARM_MAX] = {
>>>> +    [LVL0] = "bcl-max-min",
>>>> +    [LVL1] = "bcl-critical",
>>>> +};
>>>
>>> IIUC there are three levels of alarms but the hwmon only has max/min
>>> and critical. Would it make sense to do adaptative min / max ? So when
>>
>> hwmon has lcrit, min, max, and crit alarms for all sensor types, plus
>> an additional _cap_alarm for power attributes and _emergency_alarm
>> for temperature attributes. There is also a generic _alarm attribute
>> for each sensor, which is supposed to be used if the specific alarm
>> type is not known.
>>
>> What exactly are the three levels of alarms ?
> 
> Manaf can give more clarifications, but it is like we have yellow, orange and red alarms. So there is an additional alarm comparing to what is available in hwmon. The proposed driver maps orange and red alarms, respectively to bcl-max and bcl-critical.
> 
> I'm just asking if it is important to have this 'yellow' alarm ? And as there is a missing alarm to describe it in hwmon, how can we use it ?
> 

Is this for high alarms only or also for low alarms ?

I would not mind adding _emergency attributes for non-temperature
alarms if needed. We could also add another low alarm if needed,
though I don't have a good idea for a good name for that.

Guenter


