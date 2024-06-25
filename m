Return-Path: <linux-arm-msm+bounces-24086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 329B39160F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 10:20:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF0601F2005B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 08:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F85C1474AF;
	Tue, 25 Jun 2024 08:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zDEqWpDK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2888222313
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 08:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719303612; cv=none; b=cvoyoWucHG3mEo62jNHgS1nu72OgTkpvvd0DLMHd4fmS7eQg8utiE18bximEjR6q05u6e4bumSRf1Gtkq7RIqqz4uOhYNNgo1ZEmno8VyzBYdQcrhb4qvlIwXt0KSxJFZKISqzxp1H8g8tzTAoQrDggb17hn/oGrJkYNs4BqKPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719303612; c=relaxed/simple;
	bh=QVq4HM7y2dnXQGL6NEAuXEayijUuHVo9Mn2wpAEGeSQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ub+xWfpdKDIhX+DOeltetrOu5k+cAbH8IdxaOSu8XDAqaJl2o2uCf8X8ZFMp+OjdMKhN7Qem+nblTleLNEKUJngDPPiz7FT0oXn0ajM6VGriW3z4ejTPTpWUIpP+li+/XIzqSe96B4WucJwqSStvGQEc0KOVMaCTURPkHTmFmcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zDEqWpDK; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52cdbc20faeso4025462e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 01:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719303609; x=1719908409; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EWCiwD2F7GvS6ILidCuuM+NWtCPTY//mkBwwHB/PAwU=;
        b=zDEqWpDKsacFqeQFvEa1y1hGqzOtIyhdpD35XN51wSZ6hYBRccLuV8mHjbmzYAHuGg
         dyRyTEr5B4Kz5OEE/Ig+dAdokNwx/oC2vw2PGujYoiGUIE3K8oyG/spOHd3+D7allKv1
         mOWtSpEiAIdnDe5O9syyyCcd2cUK7BMp18to1vkNtUFRD5FxyEhyMDRqBQZm/gO/9SM2
         kilrBAUJUly5hntEhdSNqMk5omt4h5N4zk5wBthDP29g4SqDZ0WclM6P8TPgkiSBMTtR
         y7gpltdmNbhOqGK+7sodl7J8R7FWlgc5uW0VqZZPB/FYvnUXq2ZoIp7SyoVmtoJpCyMO
         Rs8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719303609; x=1719908409;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EWCiwD2F7GvS6ILidCuuM+NWtCPTY//mkBwwHB/PAwU=;
        b=i3lnyoue6dWpy78SUPmy9HoAeMSTDwJIgwx+0+KUS8SAIAMe+2kfH5eG56ACDaREX3
         x6Yi8yiKqwyDwrr5WQ5E3eJPLgInnUue41icIw9WbBOtXfppGbKVZsTHoBp32vWPMx2w
         HSof8wc+sbifQx7G44r1E0S4aWuWA6DtNavCIG3OwGjfd52dAfbjhUY3bfNDQHi7/fdE
         gIqtuzWDo0YYTMO415dpkNHzuk8USXTJ7nA66fWSrns7J2ISepFsADnkYrXKv89R9rcb
         KVyn9p2V1YEq+15+vd8lfH6ftvA0pbOt+pFZe0JviqDrEU52Ql1vM8Ja7eLqei+JKfTl
         ntfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR9sKN4V5WynIqsFYIq3B8iLlB7SMNCBY/zDjXgzwwEz505kU0Y6mM9iTn3cbcYz7vC9VvBRygz9eW+UTFnEi8EtWiAHfSWvIfbK+a8g==
X-Gm-Message-State: AOJu0Yzws6mYUN/T58px3jpdTgajnc85d9YycZkibWXUZyiZA3oKYRL5
	vgk4D9HhkXMJfRJm1F4rfTbY61JD9GOgqGV4UcWxR+wge9tPaT7u87Oy56fdZ74=
X-Google-Smtp-Source: AGHT+IGschyJIRrjSGV8MI/uUMMke9I7XA20tehM3rxh0wtEbI4ylJlNZVV28a0dcLcxUWKiEyqonQ==
X-Received: by 2002:ac2:4838:0:b0:52b:c27c:ea1f with SMTP id 2adb3069b0e04-52ce185faa8mr3407033e87.55.1719303606782;
        Tue, 25 Jun 2024 01:20:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:bd71:2ff1:592d:f52a? ([2a01:e0a:982:cbb0:bd71:2ff1:592d:f52a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424817b5ca0sm161908245e9.24.2024.06.25.01.20.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 01:20:06 -0700 (PDT)
Message-ID: <2e22734e-6577-445d-af5e-846dbcce076e@linaro.org>
Date: Tue, 25 Jun 2024 10:20:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: Lockdep broken on x1e80100
To: Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20230208190200.2966723-1-abel.vesa@linaro.org>
 <ZnpoAVGJMG4Zu-Jw@hovoldconsulting.com> <ZnpzuhXqSLPkpkhn@linaro.org>
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
In-Reply-To: <ZnpzuhXqSLPkpkhn@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/06/2024 09:37, Abel Vesa wrote:
> On 24-06-25 08:47:29, Johan Hovold wrote:
>> On Wed, Feb 08, 2023 at 09:01:53PM +0200, Abel Vesa wrote:
>>> This patchset adds support for the eUSB2 repeater found in pmic PM8550B,
>>> used along with SM8550. Since there is no dedicated generic framework
>>> for eUSB2 repeaters, the most appropriate subsystem to model it is the
>>> generic phy. This patchset also adds support for such repeater to the
>>> eUSB2 PHY found in SM8550. Basically, the eUSB2 PHY will have its own
>>> "phy" which is actually a repeater.
>>
>> The decision to model the repeater as a PHY unfortunately breaks lockdep
>> as you now have functions like phy_init() calling phy_init() for a
>> second PHY (the repeater, see splat below).
>>
> 
> This was reported by Bjorn off-list a couple of months ago. I did check
> it then and the order is perfectly fine. The solution here should be to
> use mutex_lock_nested in the PHY framework. This would allow supporting
> chain-linked PHYs. The possibility of moving out the repeater out of PHY
> was also discussed. Unfortunately, I didn't have the bandwidth to
> circle back and properly investigate and fix it.

Well technically it's a PHY, and moving out from PHY will basically duplicate
the PHY core code... so we should rather make sure we can call phy code from
phy callbacks safely.

Neil

> 
>> As long as the locks are always taken in the same order there should be
>> no risk for a deadlock, but can you please verify that and add the
>> missing lockdep annotation so that lockdep can be used on platforms like
>> x1e80100 (e.g. to prevent further locking issues from being introduced)?
>>
>> Johan
>>
>>
>> [    8.613248] ============================================
>> [    8.669073] WARNING: possible recursive locking detected
>> [    8.669074] 6.10.0-rc5 #122 Not tainted
>> [    8.669075] --------------------------------------------
>> [    8.669075] kworker/u50:0/77 is trying to acquire lock:
>> [    8.669076] ffff5cae8733ecf8 (&phy->mutex){+.+.}-{3:3}, at: phy_init+0x4c/0x12c
>> [    8.669087]
>>                 but task is already holding lock:
>> [    8.669088] ffff5cae8a056cf8 (&phy->mutex){+.+.}-{3:3}, at: phy_init+0x4c/0x12c
>> [    8.669092]
>>                 other info that might help us debug this:
>> [    8.669092]  Possible unsafe locking scenario:
>>
>> [    8.669093]        CPU0
>> [    8.669093]        ----
>> [    8.669094]   lock(&phy->mutex);
>> [    8.669095]   lock(&phy->mutex);
>> [    8.669097]
>>                  *** DEADLOCK ***
>>
>> [    8.669097]  May be due to missing lock nesting notation
>>
>> [    8.669097] 4 locks held by kworker/u50:0/77:
>> [    8.669099]  #0: ffff5cae80010948 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x1a4/0x638
>> [    8.669108]  #1: ffff800080333de0 (deferred_probe_work){+.+.}-{0:0}, at: process_one_work+0x1cc/0x638
>> [    8.669112]  #2: ffff5cae854038f8 (&dev->mutex){....}-{3:3}, at: __device_attach+0x38/0x1d4
>> [    8.669117]  #3: ffff5cae8a056cf8 (&phy->mutex){+.+.}-{3:3}, at: phy_init+0x4c/0x12c
>> [    8.669121]
>>                 stack backtrace:
>> [    8.669122] CPU: 9 PID: 77 Comm: kworker/u50:0 Not tainted 6.10.0-rc5 #122
>> [    8.669124] Hardware name: Qualcomm CRD, BIOS 6.0.231221.BOOT.MXF.2.4-00348.1-HAMOA-1 12/21/2023
>> [    8.669125] Workqueue: events_unbound deferred_probe_work_func
>> [    8.669128] Call trace:
>> [    8.669129]  dump_backtrace+0x9c/0x11c
>> [    8.870384]  show_stack+0x18/0x24
>> [    8.870386]  dump_stack_lvl+0x90/0xd0
>> [    8.870391]  dump_stack+0x18/0x24
>> [    8.870393]  print_deadlock_bug+0x25c/0x348
>> [    8.870396]  __lock_acquire+0x10a4/0x2064
>> [    8.870399]  lock_acquire.part.0+0xc8/0x20c
>> [    8.870401]  lock_acquire+0x68/0x84
>> [    8.870403]  __mutex_lock+0x98/0x428
>> [    8.870407]  mutex_lock_nested+0x24/0x30
>> [    8.870410]  phy_init+0x4c/0x12c
>> [    8.870412]  qcom_snps_eusb2_hsphy_init+0x54/0x420 [phy_qcom_snps_eusb2]
>> [    8.870416]  phy_init+0xe0/0x12c
>> [    8.870418]  dwc3_core_init+0x484/0x1214
>> [    8.870421]  dwc3_probe+0xe54/0x171c
>> [    8.870424]  platform_probe+0x68/0xd8
>> [    8.870426]  really_probe+0xc0/0x388
>> [    8.870427]  __driver_probe_device+0x7c/0x160
>> [    8.870429]  driver_probe_device+0x40/0x114
>> [    8.870430]  __device_attach_driver+0xbc/0x158
>> [    8.870432]  bus_for_each_drv+0x84/0xe0
>> [    8.870433]  __device_attach+0xa8/0x1d4
>> [    8.870435]  device_initial_probe+0x14/0x20
>> [    8.870436]  bus_probe_device+0xb0/0xb4
>> [    8.870437]  deferred_probe_work_func+0xa0/0xf4
>> [    8.870439]  process_one_work+0x224/0x638
>> [    8.870441]  worker_thread+0x268/0x3a8
>> [    8.870442]  kthread+0x124/0x128
>> [    8.870443]  ret_from_fork+0x10/0x20


