Return-Path: <linux-arm-msm+bounces-114779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wTIcLpkpQWpJlwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 16:03:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4107D6D3F9E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 16:03:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=dc9vNvjB;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114779-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114779-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46EFE3007E11
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 14:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A79379EC4;
	Sun, 28 Jun 2026 14:03:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380EA42AA9
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 14:03:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782655381; cv=none; b=iwll0ShfierR+zAaHQduQV6IK4QQA5KEw3MTwOihIJv4yI7u0SdoYQkG52h6nqHUzaNslQnYYrnfkDbDE5R6VT5hd7QTGWpT+dIKO47zzaKy/NfnPjxv3NWwhAE218hXr68SRImfjdOtrjuML6+L/vEKvCuuWBuL9dTF4KH2Y8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782655381; c=relaxed/simple;
	bh=OQ5yhZ1oEV14Y+jT/b/a7GaOoJ1UaVSImFMvRqg9/0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s1nRVdsfavWt/j02s5C68bIZ05W+CCcD5F9V4VKs/r8ifyMCd1/8zEzmic4M1bp9mODI93KfQrwA/LqixsHVxl/yu2seNVhwKsgsyW6X//5flgCfX7ES+4DpQfPzPztn5a6x9GUFGr73vvZARy+Dwz/X02+6seRswmiixaIL934=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dc9vNvjB; arc=none smtp.client-ip=74.125.82.180
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30df5854e1eso456450eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 07:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782655379; x=1783260179; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=EUdgbv53aIghJCqB+1zZYKm53UkH3WojYHbSrrOE1g0=;
        b=dc9vNvjBU3DflcpXuWx7V1SqC6037N69PGEJ2vfeoJatX2yv1fbs/XuIdTaDKD+DmC
         siVxqEw0FImV6QJZWn2xT57RhK687RCXiCZIIHYXJreCD/808v28VUcu5iByOMEdzLTp
         K/lsbn4ajO1vjK7gfv2ck9vvBhIzAeqRQLM14EkXal86G3JjATCS7P3lvIH0TL1wqxWH
         4sDHfGHq4YmB9DfzHq6/caU638XjVBZdq328SMx/jfBdAT+GeHDwMFUNhXbZvk1mDKp9
         sdxKy3uqb3yW8du8yB6P9EJaJBGVASTV35lT3JD3QvSNYEYXkDfUcqjLioi+w8RrGS/3
         LBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782655379; x=1783260179;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EUdgbv53aIghJCqB+1zZYKm53UkH3WojYHbSrrOE1g0=;
        b=pDsEHQkXrntIcIhjHGqwGL73VYqWDEIrUxVkEBSVQPWeqLqVApHLLvlOzwx6gAN7ef
         5o1yg3EN8wyWwdDQ7WnQH5RoCsrlbZkGcRCd8AUiI7bZCIDPCm4w+Wqa+4xtpgDAPGIF
         BZO27EhSX8MuuviLHFt8Er9iTX6tQrnQOY9g2T7YeG6evrtpEPDmoIU0stEhf9n5xs35
         5Uulu53iGBNP7p63WOBeMn5drh7JGytsWE9tIm1374sDOpKPiqg1NInj+0TozvjcGs0C
         w9dQkpyhS/fugFHnW/91agGiYA6N34RNdRL1CMYSo0XXS3/bCsXU7FOiWYVulcblg5Pr
         MbAQ==
X-Forwarded-Encrypted: i=1; AHgh+RoWtairTnNYd47iJsH70ag6f+V0rRlJoViGOyE/ZqkVhw/zuQGtjd/8QsozIpRqQtXRxCHXsEIYBMP1hZ4Z@vger.kernel.org
X-Gm-Message-State: AOJu0YwpRuBGxQzVnYMbIP7fCp2Vnno5/DSOmV69OXShA6bvIZe4C5PJ
	NDgGP2sW6xZjuDv1PZRABAGJFTWXLbuUVKBGbH+HvZRtqTs8V/kPqVzb
X-Gm-Gg: AfdE7clb7AHuGaIsFGCw2QRNEvc5BPga/7Uk98GF+J7T5fPJl1IWFqIn0X99fLwqo7t
	CxvtB9GwdpMt1Zm9biadoYHvXxPw1yqD5QxcD14vd7KxU0MHn8qovHMMvoWNN402jS/j4+gbsz0
	1tCnPSzS1c1UGQpYTI2PwV79cErVkFqjsaUmQkpDjR+UMDnLt40JfDhmQucFBrZPumOhAV25POC
	PDLuZ5rwyiLVmQH6P9SfuCxm72EsGqqmU2hW7z5TdIqLrFKEEzem83LlD1O1wnaMVfG8BAotgqn
	KbFsZopIrFPr+iH/UvcsxV/kSZu8BkqplGGH7rSOn7upnRuZpebJiEHNUq9T9iqN2mkyOXjfVIQ
	Lps5nQGgkUtGlzNENkPsG0MH/jLqTC+6R5BxFWrQvx1hZZ/UuWJXZfpC/xRHB54dF6ycJblRqFK
	aNsMdGwIewfYwWAaWmhr0D28NtS7IUPDWHwIJFaCIOUQzTnm8CUTmnHisWGUV5dZwVRo9G2wjZ
X-Received: by 2002:a05:7300:aca8:b0:304:70d0:4f03 with SMTP id 5a478bee46e88-30c858d23aamr11142737eec.6.1782655379179;
        Sun, 28 Jun 2026 07:02:59 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a75sm36165406eec.19.2026.06.28.07.02.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 07:02:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <faebd355-a9f4-4360-b123-87103ac512e8@roeck-us.net>
Date: Sun, 28 Jun 2026 07:02:56 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] drivers/platform: lenovo-t14s-ec: Add hwmon
 support for temperatures and fan speed
To: Sebastian Reichel <sre@kernel.org>,
 Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, bryan.odonoghue@linaro.org,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
 <20260624210825.264454-2-daniel.lezcano@oss.qualcomm.com>
 <akEj6XEByCOkuJaY@venus>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <akEj6XEByCOkuJaY@venus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114779-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sre@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	DMARC_NA(0.00)[roeck-us.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4107D6D3F9E

On 6/28/26 06:50, Sebastian Reichel wrote:
> Hi,
> 
> On Wed, Jun 24, 2026 at 11:08:23PM +0200, Daniel Lezcano wrote:
>> Expose the Lenovo ThinkPad T14s EC environmental sensors through
>> the hwmon subsystem.
>>
>> The driver now registers a hwmon device providing access to six EC
>> temperature sensors corresponding to the SoC, keyboard area, base
>> cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
>> are exported to allow user space to identify each measurement.
>>
>> Additionally, expose the system fan speed by reading the fan RPM
>> registers from the embedded controller.
>>
>> This allows standard monitoring tools such as lm-sensors to report
>> platform temperatures and fan speed.
>>
>> Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com
>> ---
> 
> I gave this a try and for me the fan data is always 65535 (i.e. -1):
> 
> $ cat /sys/class/hwmon/hwmon66/{name,fan1_input}
> t14s_ec
> 65535
> 
> This is with the fan running:
> 
> $ cat /sys/class/hwmon/hwmon57/{name,fan1_input}
> fan-controller
> 2564
> 

Not really my concern, but those names really add zero value,
and I would argue that they do not "allow user space to identify
each measurement".

Also, do you really have 66 hwmon devices on those systems ?
Seems unusual.

Guenter


