Return-Path: <linux-arm-msm+bounces-29281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDDD95B57D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 14:56:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D3371C2323A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 12:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52A321C9DDD;
	Thu, 22 Aug 2024 12:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q0zslUbW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306261C9DDB
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Aug 2024 12:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724331400; cv=none; b=j7ddRxTRUN83o+aa/VV4z+rUbr+PI17mrnu3Su+s4JItsAwcZAJO5DyWhHNMtjKb8RwH9+pktPnoOMDwLOqPkd8w+oDULYiLzH4x4NQ3NbWQZpR9Qs0HLHLXiZjRxVZvjHcY3PBHp1yIWEGKfbX/VVDsP9IlH2hoYxaBle5JTdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724331400; c=relaxed/simple;
	bh=oZQW9gysa9kbvHWb4PVjqVBkPCHtSRJXRiGFa4IvQdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A0OyH+6T8FmqzVZAHtVk3hn1iSKyLZFQck/au9W8ZPBoumPOmx5Yq42D29nVrq9hC0cFiQOsm4BuQ32BnBILwS8Fuq4NCV0B9M1CKEtl1peHGhVquOwszimYtskvmhR6OjqUDMC0Gd0egMmWQbjEoiftAd+7xXCdMYC4oVG3100=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q0zslUbW; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3719f0758c6so401171f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Aug 2024 05:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724331396; x=1724936196; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:reply-to
         :autocrypt:from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2NI5LFlNxsloHO/MXLodkDWQJ7BpVf9SBIBu3OZTDp0=;
        b=q0zslUbWJoXRXjkaNOulYQnS11wPjLzcEw1pvXVDsMY0t4j3C5rB+RlGyhwr1cSISX
         nizzVu3gHF2BhQMNMxYQ83RFEnzeyBygVr2N0WtX4A7NSaCtBZ2SRVItG0Tda3skttH7
         FE5+bPd9b0uua8SfpZyIvVi2aPHx0zt99tRSuh2rODxwHeqxPGG20gd8WE0XpASbuc8r
         GNq8ATQnVel41oj3u0NYeLn1yJHIwFvgwVD7de9YYD9riutP+64roQY7pyOX/hvNxeYm
         zv47JzyqTUt8Qv5b0cjzouQj2Gt5PngPZxRptkO/5iTWGAbLeG0DqDppf0t2lwA/sS1k
         dcwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724331396; x=1724936196;
        h=content-transfer-encoding:in-reply-to:organization:reply-to
         :autocrypt:from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2NI5LFlNxsloHO/MXLodkDWQJ7BpVf9SBIBu3OZTDp0=;
        b=afTAzzytWmTTJ1vtriCcelJIkr6/VEsdju++CAHFCU493dIRU1N2a2JOgrzW5+xPyP
         vwrk6l2is2/JNTQ8vcUq8ryGCyexbdAj4MmXtCM85OcwCpQM2yORmXe2xKgU9eAUflnj
         oaelIVKWHJxBuUDtwyEEeo9qrgzW7Kd8BJvGemgeqQr/EECp4fXVaEl/jfQFDlDgYIaA
         VhQ5aLfYIXVx/6oI3GX+SaxXl1GsynCEYAWgYSgkukpFs+tSVb2taIOyOKW8KF9CcO+3
         jvKXGnV5/RhnRlIUfInIlZWrUPkJ9X+R0NnL/GLE0ew+Q8X5xC9UciUbI8lDjplVWWpM
         +xVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpswp+Qv7f3KcOo3c2cQ/F6Glfz+hb4uQ59Nhc0gyBLLc3uHrRL6oIKhJs4lhhCyjnJxQeImFZKwvh1IWf@vger.kernel.org
X-Gm-Message-State: AOJu0YxsPFlWTVEuyUPyGIPSiLEqz0aivjZzIJ9Mg4+IMsXzs+wIgC+r
	U9N0Cl5tQNW7/Ck4VKZRaA3Nyj/fr+I7Zs5yp0F9qZESOqBD3KOvu2vz8A/MOqQ=
X-Google-Smtp-Source: AGHT+IH7Npize1/MPoSbHq38Pg4ilRoun8TonDorBUmkSbOd4DbVQXUFq81/s+M6Mld9Z4V2DcuVXw==
X-Received: by 2002:adf:e60a:0:b0:371:87d4:8f12 with SMTP id ffacd0b85a97d-372fd58cf57mr3585916f8f.17.1724331395960;
        Thu, 22 Aug 2024 05:56:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f06:7793:d95e:24b? ([2a01:e0a:982:cbb0:f06:7793:d95e:24b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730815c035sm1624377f8f.55.2024.08.22.05.56.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2024 05:56:35 -0700 (PDT)
Message-ID: <91ed1523-faeb-4e04-8000-c411dba5a542@linaro.org>
Date: Thu, 22 Aug 2024 14:56:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: next-20240822: rcu: Unless rcu_preempt kthread gets sufficient
 CPU time, OOM is now expected behavior.
To: Naresh Kamboju <naresh.kamboju@linaro.org>, rcu <rcu@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Mark Brown
 <broonie@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Anders Roxell <anders.roxell@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
References: <CA+G9fYvZAUOKhf+Yg6J=OUxnJ0ckv4jxyDLGyKsqwUpAak84hw@mail.gmail.com>
Content-Language: en-US, fr
From: Neil Armstrong <neil.armstrong@linaro.org>
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
Reply-To: neil.armstrong@linaro.org
Organization: Linaro
In-Reply-To: <CA+G9fYvZAUOKhf+Yg6J=OUxnJ0ckv4jxyDLGyKsqwUpAak84hw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 22/08/2024 13:16, Naresh Kamboju wrote:
> The following kernel crash was noticed on arm64 Rock-pi 4b,
> Qcomm dragonboard 410c and 845c devices while booting / loading kernel modules
> on today's Linux next-20240822.

I see the same crash log on the following devices built with next-20240822 and ARM64 defconfig:
- Libre Computer AML-S805X-AC (Amlogic S805X)
- BananaPi M2S (Amlogic A311D)
- Snapdragon DB410c
- Qcom SM8250-HDK

I do not see the same crash log, but the following board fails to complete boot:
- Banana Pi BPI-M5 (Amlogic S905X3)
- Libre Computer AML-S905X-CC (Amlogic S905X)
- Qcom SM8150-HDK
- Qcom DB845c
- Qcom SM8350-HDK
- Qcom SM8450-HDK
- Qcom SM8550-HDK
- Qcom SM8550-QRD
- Qcom SM8650-HDK
- Qcom SM8650-QRD

Neil

> 
> First seen on next-20240822.
>    Good: next-20240821
>    BAD:  next-20240822
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> We are bisecting this problem.
> 
> Crash log:
> --------
> [    0.000000] Linux version 6.11.0-rc4-next-20240822
> (tuxmake@tuxmake) (Debian clang version 18.1.8
> (++20240731024919+3b5b5c1ec4a3-1~exp1~20240731145017.142), Debian LLD
> 18.1.8) #1 SMP PREEMPT @1724309008
> [    0.000000] KASLR disabled due to lack of seed
> [    0.000000] Machine model: Radxa ROCK Pi 4B
> ...
> [   16.923808] coresight-cpu-debug fe430000.debug: Coresight
> debug-CPU0 initialized
> [   16.933919] coresight-cpu-debug fe432000.debug: Coresight
> debug-CPU1 initialized
> [   16.935653] coresight-cpu-debug fe434000.debug: Coresight
> debug-CPU2 initialized
> [   16.937846] coresight-cpu-debug fe436000.debug: Coresight
> debug-CPU3 initialized
> [   16.939744] coresight-cpu-debug fe610000.debug: Coresight
> debug-CPU4 initialized
> [   16.942132] coresight-cpu-debug fe710000.debug: Coresight
> debug-CPU5 initialized
> [   37.987966] rcu: INFO: rcu_preempt self-detected stall on CPU
> [   37.989037] rcu: 2-...!: (5248 ticks this GP)
> idle=d1f4/1/0x4000000000000000 softirq=1552/1553 fqs=0
> [   37.990715] rcu: (t=5250 jiffies g=1269 q=784 ncpus=6)
> [   37.991667] rcu: rcu_preempt kthread timer wakeup didn't happen for
> 5249 jiffies! g1269 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402
> [   37.993718] rcu: Possible timer handling issue on cpu=4 timer-softirq=296
> [   37.994966] rcu: rcu_preempt kthread starved for 5250 jiffies!
> g1269 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=4
> [   37.996844] rcu: Unless rcu_preempt kthread gets sufficient CPU
> time, OOM is now expected behavior.
> [   37.998499] rcu: RCU grace-period kthread stack dump:
> [   37.999419] task:rcu_preempt     state:I stack:0     pid:18
> tgid:18    ppid:2      flags:0x00000008
> [   38.001117] Call trace:
> [   38.001565]  __switch_to+0x15c/0x208
> [   38.002229]  __schedule+0x54c/0x9d0
> [   38.002870]  schedule+0x12c/0x1e0
> [   38.003479]  schedule_timeout+0x9c/0x1b0
> [   38.004202]  rcu_gp_fqs_loop+0x1e0/0x880
> [   38.004926]  rcu_gp_kthread+0x70/0x230
> [   38.005616]  kthread+0x104/0x198
> [   38.006209]  ret_from_fork+0x10/0x20
> [   38.006877] CPU: 2 UID: 0 PID: 237 Comm: (udev-worker) Not tainted
> 6.11.0-rc4-next-20240822 #1
> [   38.008442] Hardware name: Radxa ROCK Pi 4B (DT)
> [   38.009284] pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   38.010551] pc : smp_call_function_many_cond+0x468/0x6b8
> [   38.011521] lr : smp_call_function_many_cond+0x428/0x6b8
> [   38.012490] sp : ffff800083d1bb50
> [   38.013094] x29: ffff800083d1bb90 x28: 0000000000000006 x27: 0000000000000000
> [   38.014399] x26: ffff80008269e000 x25: 0000000000000000 x24: 0000000000000001
> [   38.015702] x23: ffff8000801bc470 x22: ffff800074e75000 x21: ffff0000f74d8c20
> [   38.017005] x20: ffff0000f746cb80 x19: ffff8000826a3470 x18: ffff80007afc2000
> [   38.018308] x17: 000000000909008e x16: 0000000000000000 x15: ffff8000816092a0
> [   38.019611] x14: 060a090000000000 x13: 0000000000000003 x12: 000000000000003f
> [   38.020914] x11: 0000000000000001 x10: 0000000000000000 x9 : 0000000000000011
> [   38.022218] x8 : ffff0000f74b6c28 x7 : 0000000000000000 x6 : 0000000000000080
> [   38.023520] x5 : 000000000000003f x4 : 0000000000000000 x3 : 0000000000000006
> [   38.024823] x2 : 0000000000000004 x1 : 0000000000000004 x0 : 0000000000000004
> [   38.026126] Call trace:
> [   38.026574]  smp_call_function_many_cond+0x468/0x6b8
> [   38.027481]  kick_all_cpus_sync+0x44/0x78
> [   38.028216]  flush_module_icache+0x38/0xe0
> [   38.028965]  load_module+0x1374/0x1778
> [   38.029654]  __arm64_sys_finit_module+0x238/0x348
> [   38.030516]  invoke_syscall+0x4c/0x110
> [   38.031207]  el0_svc_common+0x8c/0xf0
> [   38.031880]  do_el0_svc+0x28/0x40
> [   38.032490]  el0_svc+0x40/0x88
> [   38.033054]  el0t_64_sync_handler+0x90/0x100
> [   38.033837]  el0t_64_sync+0x190/0x198
> [   38.034509] Sending NMI from CPU 2 to CPUs 4:
> [   48.036555] Sending NMI from CPU 2 to CPUs 5:
> [   78.247966] sched: DL replenish lagged too much
> [  121.047963] rcu: INFO: rcu_preempt self-detected stall on CPU
> [  121.049009] rcu: 2-...!: (21002 ticks this GP)
> idle=d1f4/1/0x4000000000000000 softirq=1552/1553 fqs=0
> [  121.050702] rcu: (t=26015 jiffies g=1269 q=784 ncpus=6)
> [  121.051669] rcu: rcu_preempt kthread timer wakeup didn't happen for
> 26014 jiffies! g1269 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x200
> [  121.053735] rcu: Possible timer handling issue on cpu=4 timer-softirq=296
> [  121.054982] rcu: rcu_preempt kthread starved for 26015 jiffies!
> g1269 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x200 ->cpu=4
> [  121.056876] rcu: Unless rcu_preempt kthread gets sufficient CPU
> time, OOM is now expected behavior.
> [  121.058530] rcu: RCU grace-period kthread stack dump:
> [  121.059447] task:rcu_preempt     state:R stack:0     pid:18
> tgid:18    ppid:2      flags:0x00000008
> [  121.061140] Call trace:
> [  121.061587]  __switch_to+0x15c/0x208
> [  121.062245]  __schedule+0x54c/0x9d0
> [  121.062885]  schedule+0x12c/0x1e0
> [  121.063494]  schedule_timeout+0x9c/0x1b0
> [  121.064214]  rcu_gp_fqs_loop+0x1e0/0x880
> [  121.064936]  rcu_gp_kthread+0x70/0x230
> [  121.065625]  kthread+0x104/0x198
> [  121.066217]  ret_from_fork+0x10/0x20
> [  121.066874] CPU: 2 UID: 0 PID: 237 Comm: (udev-worker) Not tainted
> 6.11.0-rc4-next-20240822 #1
> ...
> [  785.590550] Sending NMI from CPU 2 to CPUs 4:
> [  795.592594] Sending NMI from CPU 2 to CPUs 5:
> 
> boot Log links,
> --------
>   - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240822/testrun/24939658/suite/boot/test/clang-18-lkftconfig/log
>   - https://lkft.validation.linaro.org/scheduler/job/7816099#L523
>   - https://lkft.validation.linaro.org/scheduler/job/7815910#L2448
> 
> Boot failed comparison:
>   - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240822/testrun/24939658/suite/boot/test/clang-18-lkftconfig/history/
> 
> metadata:
> ----
>    git describe: next-20240822
>    git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>    git sha: 6a7917c89f219f09b1d88d09f376000914a52763
>    kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/2l0EZh4ZCNgUovHichD9yUraMrY/config
>    kernel version: 6.11.0-rc4
>    artifact location:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/2l0EZh4ZCNgUovHichD9yUraMrY/
>    build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2l0EZh4ZCNgUovHichD9yUraMrY/
>    toolchain: clang-18 and gcc-13
> 
> Steps to reproduce:
> ---------
>   - https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2l0EbxmBUpGzF37iIJ51WvkJFt8/reproducer
>   - https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2l0EbxmBUpGzF37iIJ51WvkJFt8/tux_plan
> 
> --
> Linaro LKFT
> https://lkft.linaro.org
> 


