Return-Path: <linux-arm-msm+bounces-92339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDuyBkYSimlrGAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 17:58:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D96B112C8F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 17:58:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F6403014574
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 16:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96E801DFD96;
	Mon,  9 Feb 2026 16:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C3/81C5W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392D2374162
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 16:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770656177; cv=none; b=T9wEXowUYIGFlh6PucrkuYhAKj5o7f6+BciJ5GNAZRXe94HsiQ8JLIPGcQIHVgEAzJFROKhf5JriNnii2DKPeBhcQ+xDw4P28GiCHALoNzdOvadaaJ7C0vlaX9n+Kg9uSpzocrZHesh1pLtkjYYXlAIdBIBUMTnu/KAUb6HrzjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770656177; c=relaxed/simple;
	bh=b4/Zs9JMZChUNbWR0JA9Tvu24qTK5jSxTSa2eqNVC+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dj4Qfd2UmFbH2Ymc8UPlfnaCKzLi9GeonKUCtT//yGlxXLu3g7nmaCbPZrYcKgTKgEg/nYTe1MKDXyymSU04lyd+DScUCy9q/FeAX26NuwkrvgLMiZU9NevrxFLK1mHRmu/DeyjgQmTSrkiC1akiQDpflpiiynvm4+NzvklktNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C3/81C5W; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48068ed1eccso46879885e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 08:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770656176; x=1771260976; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tduGbpOIP9Y0jtGFueV1CHj+/1lGpF10/k42uVp75Io=;
        b=C3/81C5WXpy7429npVwk/bLCLC26hZC9OoCw6Iw/hZ7MHQVPCWkQ+wIpmdqAjrncSR
         oZXrUCB1t2DYHbAUtmZEvNge1nMf2Xt5k3sx698mYf8INz6O8AjBcK335aiLconbLbTc
         5ubvq1ZbYThB8wV5Tu1J2XtLu9b8Zv2BQHkZHMhp4LGkIozVyVR0qYYKI4rdV9Kse3up
         a7f/5TcdSduS6vklyW/aQ0BUdE4vBb8uoH6qtC2enDkMH+8yPEUx3GIVlbqLTtX+CyEj
         5UjNt6Hcf6iUJkilBUXlFYbIuW97wCtxMNMLU1RWAJGq6ms2AFG7CXPK9Ra+LPeNnndM
         V/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770656176; x=1771260976;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tduGbpOIP9Y0jtGFueV1CHj+/1lGpF10/k42uVp75Io=;
        b=fYANcRq7Cr72mASO16oa3q+64bJh8LMYxSJ74PN6VMBy3W/tP0qGFKiAVm1YaVagy1
         9jWvWo1jKMEaKbcd+efoPhVGxf7oEJ4h07JQpKU296Rer9Ismbz9S+NRrg9ZVkn3iWAx
         3IP6HAIhLDxeg1N0z2U6AKWM04wrYQoxJ7SekGTvbU+Qyv/cDSJQWAeOzHwBMykU+zKb
         HBSPNJYAAPccr9MYJ85mOFPulp4LPqdiB5o1wsCsoQ5xE+tZKadHCYY29KJFuNc4gbeQ
         soS6mvvASQFWc0sV5+kNp7FCvixCsjrfCnZWvEhwslitQKkJdtZHVzKxU1sEwxlcGEmF
         vYUg==
X-Gm-Message-State: AOJu0Yz7yPhN/oaiiAbycFwZOfFXXfvxaD1rRcWv3XUbcFWUl8cbFOoG
	VUQwuPaO49QSRMjfI9DE3oHy2q5vkkiulX7KYTJVKs/WyGonA8QmcqZGkEH4dAn/IJA=
X-Gm-Gg: AZuq6aIUqvFWW/mdF20jtWt2GnWZulb5QYxAlewTh1cOKhTrFwtexdRflQdJPB69/tf
	ZNT0x9v+G9uyFb+ZFCTH2ydXeTJOaS2RFJ3LPplbeyLdIq+DLy2CzRvZP+JBpBPm+8nqmMnW6AU
	La5wyOT968+afYVRwLzIGBnG21V/5CUNKlfi2WJuCScyAvjfnFRxiTPAkMZ/gM8WEpv+omvYf+W
	Z7FdCXeKySfDxj1qaRVPE1/kg3/tn+Gi4Q6dAYRZtV68uKlVUZWjqHh7XVzCKRqI+i3XqVJfVKV
	T+VPhnf2FOLen4yLrEJH4KE+s4zZhGSRjmEv941q0ybdkNH1GjOqTZ8ei7eBnDb8xgcFMiVhs3F
	3LSPO0Btnz0X3IVMLAzCsiC9PzGqlcWYarY8hGB/9Z9/TN053S3HDcFCK/MTxR45i3Qtm26PD5+
	crA+xb5aQ+vEZcTUx/8uY+vgenI2npWQHQu6IQMK8CFrjLFbdmRNFZXxhoUew0Jm1cL5TLHxhxT
	g==
X-Received: by 2002:a05:600c:19c7:b0:477:a54a:acba with SMTP id 5b1f17b1804b1-483202161edmr190417745e9.17.1770656175570;
        Mon, 09 Feb 2026 08:56:15 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:44e3:9198:bd5d:a3f? ([2a01:e0a:106d:1080:44e3:9198:bd5d:a3f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483209e0c4fsm95401915e9.18.2026.02.09.08.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 08:56:14 -0800 (PST)
Message-ID: <90426494-f98d-4e5e-ae98-b166a752868f@linaro.org>
Date: Mon, 9 Feb 2026 17:56:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8550: add cpu OPP table with DDR,
 LLCC & L3 bandwidths
To: webgeek1234@gmail.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260207-sm8550-ddr-bw-scaling-v1-0-d96c3f39ac4b@gmail.com>
 <20260207-sm8550-ddr-bw-scaling-v1-3-d96c3f39ac4b@gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20260207-sm8550-ddr-bw-scaling-v1-3-d96c3f39ac4b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92339-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:mid,linaro.org:replyto,linaro.org:dkim,linaro.org:email];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 6D96B112C8F
X-Rspamd-Action: no action

On 2/8/26 02:28, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> Add the OPP tables for each CPU clusters (cpu0-1-2, cpu3-4-5-6 & cpu7)
> to permit scaling the Last Level Cache Controller (LLCC), DDR and L3 cache
> frequency by aggregating bandwidth requests of all CPU core with referenc
> to the current OPP they are configured in by the LMH/EPSS hardware.
> 
> The effect is a proper caches & DDR frequency scaling when CPU cores
> changes frequency.
> 
> The OPP tables were built using the downstream memlat ddr, llcc & l3
> tables for each cluster types with the actual EPSS cpufreq LUT tables
> from running a QCS8550 device.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 308 +++++++++++++++++++++++++++++++++++
>   1 file changed, 308 insertions(+)
> 
<snip>

Tested on an SM8550-HDK with mybw and sysbench, similar values reported
in performance governor on all CPU clusters.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK

