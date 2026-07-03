Return-Path: <linux-arm-msm+bounces-116281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qlSoLE6WR2q1bgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 13:00:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC2B7018B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 13:00:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=oGbcWFTh;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116281-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116281-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0EBE43162AAF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 10:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C8183D9678;
	Fri,  3 Jul 2026 10:32:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8589A3D9527
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 10:32:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783074759; cv=none; b=boAnUYQbhAmtAYwD+ko+YVfnNNVUPEcEgPAugdhbFarC6NmHZfjpqcn5Qqs7bHjYmwsUg49vhg9uDctXVQoVaeoe3YnJtf+eKBCwWTdaTkHRmblF8e+CNHjMyzdu5tevbEUE7bb0rgWPdpuQjebAdTT2ITCoV0k+P0FBzZ8ndd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783074759; c=relaxed/simple;
	bh=D5ijQV3bUdGx6RAeOYDDyhV2oxFHO7V4Y7ge4JRyKaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PMFaj3AEgu+c74wdSVfKmtWA71CiV3ZcUlT+heFRUJeGXaBwbWo2FP1fnzyvt8umXTplwl+hO8u1/nhcATw0bWOK+v7bDX2h94yJK0veY8RRME6uO3eWFzD7wt8W2E0ACBwhAg069vP5XBdIETa73KAFaVJGcn8D+74OoPYJY7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oGbcWFTh; arc=none smtp.client-ip=209.85.221.42
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-46ed4f66256so371917f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 03:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783074754; x=1783679554; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xXqnKE5BVSq5meuyy3aSxrzRU5PavHRibtLm4NqA0hs=;
        b=oGbcWFTheGuatgzxnFFH6wuCsl5Qb0XbSOH9emVtGr4Wp/p5s+9UGaT95T1+QNp7ON
         OjOMktfU4yUNmVI4+pIrLqLCBkk0FE6P4Ta8ytqAkknc2s4WZtR6c7+C0imbjlcez0X8
         dASoyUvGlF1CG5/vebFc49OJPPn9VTc5aabfhIRDhy/GDoAyyIWjFAI+P5FQzJ9B60nZ
         cqVW28q5hG/KiFo1ghr7nsW6YugyyvvIqIvRN86V9ioulgmGEL7vt/p/LuKHkfsYfxtB
         RyvccYfrVkfssvIPiALGePd+e2g2UY8nuXHA9rk48upBsR+KjS3nV6PCFR1ckRIp3CpU
         +nXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783074754; x=1783679554;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xXqnKE5BVSq5meuyy3aSxrzRU5PavHRibtLm4NqA0hs=;
        b=nDNX7WR+fpoUBiGno4PRJyaVXvF4mtgzhsc+qdFNbomeAPmKzqVg17WOOO03wMyoYk
         RxJ3QOUsrC0vCIRY57Yt7xwIoLRnk6W8y6vXI1J9KHLZ8c1egvWlS7nFtCiqkC7Mf8sL
         m2kmNmuXrLf27GJlv/HSHuPV3sEuZHQu1S4h3Ts2YCAI+5SkKLL/RCMJlN6JbksQeatz
         d2LWDOsh477ga85W5CgViwRKNO7m598hQ3X+e35RHWT9yHkhdYI69N5/LDmWqY8LYlH6
         REexMH4li3tQ/C+k19GzcSUTglDvtHa2d1c6BY+6bA5V6fjInksV2EoDtPql7Iu71MyB
         h9Bg==
X-Forwarded-Encrypted: i=1; AHgh+RrtRL+demP0yDflC9tVZgCEdW7Iiek8PQ+/bEy2mCjQ0YpP2Uu3VERPbHu7kBzqO7j3TW2Kup3fdRfgFNcM@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/JxgLp/M/cPAUeSc74zYA0AIUoaQkkIxe67ZWaYZditplwhyP
	T+BIvErmeVlGqOdxcfwzM9dVlEccE1oVuzs1BI6dNY5jvG/BaQsSLZaMcNASnOAeqJI=
X-Gm-Gg: AfdE7cl+JyjxlYmwTOOnfJ7M43F8NhDoar7JAQWWEmpI963VJ826EQfbpPkeVJw1Ni/
	9/OJMM9M/pKvNldc3DyYeGrHxPHJeduSkMnPTloerXUcCwG8x1PGCrTHPB3rVB0+PoECGykG13s
	w+PRZBKRlVu6ePrC8rb4jeWZjIUTYaZDhc9f+JwOeHGklHzbczqsdH3x+vf43VhcUtX+muebjVu
	wiWyjTYHg2Jtrg6TcnBWhuOP7ud8KOaLpkCaqPdcY03xDFM2LKhpJioL6zsiWwoJmUwJYVsDxKE
	fGO0yVPLiOncz0AqcmL+TUVGXr/WKZVLkaNrPw7sUakoKBJcFnMWPV3m3K/2AqiF3lXsqSy/r2J
	y4cer5Y8YyNN14PDs97ys0RLuSbdRcms1qdkqrvJHU/W5WMRiB0Q0Dja7ERgFjLWnFP5oltqGHk
	LL/BH3aXEbrb5wFgpw4XwchK3oDNHV5e+xabxzznRigs0imK/5QrTPrlhCEb1irMR7kwDQR2uQX
	ncq2c4=
X-Received: by 2002:a05:6000:601:b0:476:5eec:309c with SMTP id ffacd0b85a97d-4775a7cb888mr13583163f8f.24.1783074753843;
        Fri, 03 Jul 2026 03:32:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:9b13:921f:4f13:6cbb? ([2a01:e0a:106d:1080:9b13:921f:4f13:6cbb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a4ad4sm18103306f8f.11.2026.07.03.03.32.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 03:32:33 -0700 (PDT)
Message-ID: <5edfa760-b5b1-4f0e-8a14-2a39d2b99090@linaro.org>
Date: Fri, 3 Jul 2026 12:32:32 +0200
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
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, sre@kernel.org,
 hansg@kernel.org, ilpo.jarvinen@linux.intel.com, linux@roeck-us.net,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260701103714.22583-1-daniel.lezcano@oss.qualcomm.com>
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
In-Reply-To: <20260701103714.22583-1-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116281-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daniel.lezcano@oss.qualcomm.com,m:sre@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux@roeck-us.net,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:replyto,linaro.org:mid,linaro.org:from_mime,linaro.org:email,linaro.org:dkim];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4EC2B7018B6

On 7/1/26 12:37, Daniel Lezcano wrote:
> Hi,
> 
> This series extends the Lenovo ThinkPad T14s embedded controller driver
> with environmental monitoring capabilities and integrates the exposed
> sensors into the Linux thermal framework.
> 
> The EC provides access to several platform temperature sensors
> covering the SoC, keyboard area, bottom cover, charging circuitry, QTM
> module and SSD. These sensors are currently used by the firmware for
> thermal management but are not exposed to Linux.
> 
> The first patch adds hwmon support for the EC temperature sensors.
> 
> The second patch exposes the EC as a thermal sensor provider in the
> device tree and defines thermal zones for the keyboard skin
> temperature and the charging circuitry temperature. This allows the
> generic thermal framework to react to EC-reported temperatures and
> apply standard Linux thermal mitigation policies.
> 
> As the EC protocol is not fully decoded, the passive trip points
> get/set actions are missing, so it is not possible to program a
> threshold and receive an interrupt when crossed the way up or
> down. Consequently, the thermal zone related to the charging circuitry
> is polled every two seconds until we can set the trip points in the
> EC.
> 
> This series fixes critical thermal issues happening on this platform
> where a kernel compilation, or heavy workloads, lead to a system
> reboot.
> 
> Tested on a Lenovo ThinkPad T14s Gen 6 (Snapdragon X Elite).
> 
> Thanks,
> 
> Daniel
> 
> ---
>   Changelog:
> 	v3:
> 	 - Removed event based because trip point are not yet well supported
> 	 - Added an empty line after variable declaration (Ilpo Järvinen)
> 	 - Used MILLIDEGREE_PER_DEGREE from units.h (Ilpo Järvinen)
> 	 - Made switch consistent (Ilpo Järvinen)
> 	v2:
> 	 - Fixed patch 1 subject prefix
> 	 - Removed the fan information part
> 	 - Added HWMON_T_ALARM
> 	 - Fixed DT change description to reflect what it does really
> 
> Daniel Lezcano (2):
>    platform: arm64: lenovo-thinkpad-t14s-ec: Add hwmon support for
>      temperatures
>    arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin
>      and charging sensors
> 
>   .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   |  68 ++++++++-
>   drivers/platform/arm64/lenovo-thinkpad-t14s.c | 130 ++++++++++++++++++
>   2 files changed, 197 insertions(+), 1 deletion(-)
> 

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on T14s OLED

