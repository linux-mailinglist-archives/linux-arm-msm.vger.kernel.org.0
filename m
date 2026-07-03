Return-Path: <linux-arm-msm+bounces-116333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lGnZEpnCR2pwewAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 16:09:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD0D70343E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 16:09:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=C6brIbdR;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116333-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116333-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8FF00301A7F0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 14:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3DCA3D9DBB;
	Fri,  3 Jul 2026 14:09:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66F134F270
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 14:09:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783087760; cv=none; b=fnIZykiwe2bwCLzwz+kk/OnGeM38BpKjetWWvgWTYyVcWN9uUoyHWp0lMXziOkQqkvUBZSuKcS8F/skYLWJMBWGzRqmykUGAypfP/v7nVAEgfow6r94UpSH6wgDn34inWS6uO+kFPaZlsapJoH1DVTWslpayTspCxNhVh/fYdmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783087760; c=relaxed/simple;
	bh=d+OXytV2ebkUyD2yp+ya6NCaRMIez7CYGr9oi6b7Unc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=TcRTqIusS5mmWZ0HnBlRADawlMdQA2opf3CQ8mjkHcIgqhgvv1p9D3E9IBunAQ6t4qcDcNHYPK0m73Tefc5M5VdCmjico8flsgYAZ71fNBH5fY5/EJsvho+s3GyB2Mkjw94ZG3qOFLQLvywzpjNPrDv5/sYLge4z3oUKr2VioMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C6brIbdR; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493b779003fso2920705e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 07:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783087756; x=1783692556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lfO1X26POMkNONMKCAH4khlnd1ko4GHBpFbhLRAY8BA=;
        b=C6brIbdR7AaVCl3n4ymNz7qiHFQms2ygBgyAqoD0Qj+NQ56i2dZqz/1EbqsEe9rhxV
         FqXke+oQ0Hr28SM4pZDf9nXXU+/JAQzjCXpvNqtejxgpfAu5DxIW9hYNcyoyynGGT69Q
         JJrWWeIMw4NZAKcdGbM4nybU1pW3d0lcaFM6eXKNodNcCNz4vCZbNaDTEeaKzOfO2ZDH
         kWTU3k29ZJCjU8aq21o4hpGi1OtHmVppVH8AnL48nrdscASHN+Fl54FFe0OkUZfHs3f2
         /r7W7RKjnMQURaG38Ot/XZJpT59uDGMvsnuiCMSXqbvGBQ0Bhl6UvXK3bbhZEdImRXPF
         jcDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783087756; x=1783692556;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lfO1X26POMkNONMKCAH4khlnd1ko4GHBpFbhLRAY8BA=;
        b=kMTZUhhHDeio9/J9lre29c93Ea3PrZlnJbgPnOmRQ2xELGWF1b3lYi9erXp+BC2kWX
         x6YKcG0BHIOL9I28q14CFGFpHRwwJNCkT1i59DmmnvZjoUo2OCsc17ryG1OfMctaoXVK
         vZrygKYujnHAWoI6f0a8ZIkvErN3OK5iJST68oAw97EYZUmunSaNAdA3hhW5Lb9lbAx0
         t9HPjsLJ2nwsvOW3SB4lBtQ19duU6LAj9+ZDfsOHG8WhB44ZflcxONrwX9Ngp3Ifm+/A
         qcB0V2Xrz0I22qSooQ9wXNd+smpFAzGx4ji2OyC0g/Y7rxUH7kuWjq3FngZsijpGzYOB
         jYfg==
X-Forwarded-Encrypted: i=1; AFNElJ9UZ3ZKbzbBXItXOCr9RRx7AK0HiANAkwUOQ+mTScQCRP1od5dE0jaoyLqQseFhaTNBNKbzjfLSyu/C0Ks3@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt6kyxjCLkn0p9PV2IOsuKbc42sVQrNDCLkFZQV9/J7zCSM3jO
	t9RtMIz5tgw1WZqF6eA4rKm3OQmBgKVa4BhsfPZLL/zvMET8NE8aNyw8LjTDVB/egU0=
X-Gm-Gg: AfdE7ckQpCZc8gT9L9HAFwkY8678xXpJ6fpnXemLO1BQOEEa/lhIkJrsQaxBc8jQ9if
	UawkRcldSaqqHC8+jFGLgmDJ/4PzUF/dJnB9OJL8Z2lD043hQMZDam0hTa5nTbd6cdDn2CwNGjj
	BSfMsFGSpcEJzYaWftbEq1xRD7RIFrw0JIL044JXjEFyoedJ3FlPJUhsJHR5QODj/gWD5EWazzQ
	Xuzpdc1jr/jXxf/4ZDyu7Hih6wk+5kKpkKLTp3F5FgB5ai3UJfdfNcd2AOTRZ7XOX2UIZWU+/AE
	5+5c9u65R5VD+51cTXItZzPrSxQYEEdHlEu5+jldwtppaIerR8nZJ6S7D8tjT6ETKREyz1wr+4c
	PxLDEBEIZebBZF782oD9p/MfTtP78UAyVUSjFL30VBsbnWoCk45ugzlC37VuuDygqEwfo+nLk5o
	ioylMAXqRE/d+PLHdSuZczGT9OCeCwjUQ/gmLq0uUrejrdvU3S8Qy5aW6QTGLWyPk04Dzu
X-Received: by 2002:a05:600c:c3c1:20b0:492:4363:e7eb with SMTP id 5b1f17b1804b1-493d0f3ca40mr3345e9.32.1783087755967;
        Fri, 03 Jul 2026 07:09:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:9b13:921f:4f13:6cbb? ([2a01:e0a:106d:1080:9b13:921f:4f13:6cbb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477ddf0fb15sm16668205f8f.29.2026.07.03.07.09.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 07:09:15 -0700 (PDT)
Message-ID: <45736af3-cdd4-4398-8509-a3593af989e1@linaro.org>
Date: Fri, 3 Jul 2026 16:09:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 0/2] Lenovo ThinkPad T14s EC thermal monitoring and
 thermal zone integration
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, sre@kernel.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux@roeck-us.net,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260701103714.22583-1-daniel.lezcano@oss.qualcomm.com>
 <5edfa760-b5b1-4f0e-8a14-2a39d2b99090@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <5edfa760-b5b1-4f0e-8a14-2a39d2b99090@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116333-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daniel.lezcano@oss.qualcomm.com,m:sre@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux@roeck-us.net,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:replyto,linaro.org:mid,linaro.org:from_mime,linaro.org:email,linaro.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DFD0D70343E

On 7/3/26 12:32, Neil Armstrong wrote:
> On 7/1/26 12:37, Daniel Lezcano wrote:
>> Hi,
>>
>> This series extends the Lenovo ThinkPad T14s embedded controller driver
>> with environmental monitoring capabilities and integrates the exposed
>> sensors into the Linux thermal framework.
>>
>> The EC provides access to several platform temperature sensors
>> covering the SoC, keyboard area, bottom cover, charging circuitry, QTM
>> module and SSD. These sensors are currently used by the firmware for
>> thermal management but are not exposed to Linux.
>>
>> The first patch adds hwmon support for the EC temperature sensors.
>>
>> The second patch exposes the EC as a thermal sensor provider in the
>> device tree and defines thermal zones for the keyboard skin
>> temperature and the charging circuitry temperature. This allows the
>> generic thermal framework to react to EC-reported temperatures and
>> apply standard Linux thermal mitigation policies.
>>
>> As the EC protocol is not fully decoded, the passive trip points
>> get/set actions are missing, so it is not possible to program a
>> threshold and receive an interrupt when crossed the way up or
>> down. Consequently, the thermal zone related to the charging circuitry
>> is polled every two seconds until we can set the trip points in the
>> EC.
>>
>> This series fixes critical thermal issues happening on this platform
>> where a kernel compilation, or heavy workloads, lead to a system
>> reboot.
>>
>> Tested on a Lenovo ThinkPad T14s Gen 6 (Snapdragon X Elite).
>>
>> Thanks,
>>
>> Daniel
>>
>> ---
>>   Changelog:
>>     v3:
>>      - Removed event based because trip point are not yet well supported
>>      - Added an empty line after variable declaration (Ilpo Järvinen)
>>      - Used MILLIDEGREE_PER_DEGREE from units.h (Ilpo Järvinen)
>>      - Made switch consistent (Ilpo Järvinen)
>>     v2:
>>      - Fixed patch 1 subject prefix
>>      - Removed the fan information part
>>      - Added HWMON_T_ALARM
>>      - Fixed DT change description to reflect what it does really
>>
>> Daniel Lezcano (2):
>>    platform: arm64: lenovo-thinkpad-t14s-ec: Add hwmon support for
>>      temperatures
>>    arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin
>>      and charging sensors
>>
>>   .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   |  68 ++++++++-
>>   drivers/platform/arm64/lenovo-thinkpad-t14s.c | 130 ++++++++++++++++++
>>   2 files changed, 197 insertions(+), 1 deletion(-)
>>
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on T14s OLED

The charging sensor can go very high aswell and when cpu load is high the charging
is throttled down, so perhaps it would be nice to also have a thermal zone for the
charging sensors.

On my setup when charging the battery at 60W the charging sensor reports ~63C but
goes up to 80C when building a kernel, but stays around ~70C if the charger is not
connected.

Neil

