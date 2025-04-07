Return-Path: <linux-arm-msm+bounces-53352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C48A7DA81
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 11:59:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B0C37A2B20
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 09:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0E0230269;
	Mon,  7 Apr 2025 09:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="edUxBtwS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46CD22FF4C
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Apr 2025 09:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744019937; cv=none; b=DWYl3vaKtPNXcD40LhoTjem3sE7knt9t3B8W5vdH0ar+bHGUbRc5a5sjx3oQJekKMoQAdnlwIp2KC9Qvaby/pV1N91yIycmeFPgBkPWAlOiFxorQQxh4Taa8frJYk+kwX39ir429bTKMV3QQKRoSW5clEPHzIjl+43qoN1ja8uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744019937; c=relaxed/simple;
	bh=v29T1FbGbcKeRMuW0VbePwisgAp9BsYkH9UNPlwsybg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u1qQUh2x4xn+iuQ9042JZ+k/nwQaDxIEgMnlmsDJc8MLi/GJ7HjyBCtqmXPDx4MngjqAsj6Q+pWsbGOmYprCi0g8iHN1GDvlDtkE/2+2oTytpyenONjXc+r7tDyJxwjqiUXnXkN/Q7yy3EhJWE6Fjqr2LLcfCMOwx+fYCU6AGv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=edUxBtwS; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4394a823036so37766065e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Apr 2025 02:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744019934; x=1744624734; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vrZNuJsrn23JwdNkrVTHfCKc6rDwAMWYvk+A+tg7J78=;
        b=edUxBtwSu7i/SE+y974xBKU7Qag3//f751DnkXuDgDX+m1K0oqJVGORzJp93HQLVSd
         IkQAx24itg9gtodyNqslx3hs0cSoqnkYtLCXxMV5ve6KqQ2ox094C+LJetqVrSh8vaLz
         n/7f/jeRAhulHHiCgZ+OE1n9lwWA5DDWZqzUJ8Q6il1y0HRXd0PTPisacW1CqwWt5JLy
         0swNsLTyvDLxt3eIai/SDpSCxCVIb4cx47lmycvhC+1sxi8QcDzML7rA6+OmD4sdIfaa
         xptKySFE6NhwX8TgbJvR2GLxbm1+TP9B1huK/uSqNsgQBWoEF6rqthIOFzHfeaovFWUg
         c9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744019934; x=1744624734;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vrZNuJsrn23JwdNkrVTHfCKc6rDwAMWYvk+A+tg7J78=;
        b=EDvYNuelCtlHSHiWTm8RUaLVA96oB1QNJfd0Gw0SjyZwlHGPMIvXiS4arZc+oUNWKf
         2eZYmGIZe15349CgbE+yBAtvXbjpYH2RsM2evWZB8HYENY9RGYdbxlVTuC1GvHTRNnnF
         vxvL8peXRtOc2ayGekkLC+ocknw5RDj6VADNelIbAptaMGuQLZL07XpShU/NIhZyuhiv
         tTx8O4bDub7ADZB3alP5KYW+uJTR+HdZ8UoPHgQvIku6K38DVkSTLMDF5EWt673a08LS
         GkvF/Oa6qzMxJ5YcY7BSOt+FmyXdfWwEnZkgwxJ4R49kd0JDCa9uB93jBD1W2PZ0q0eh
         j4Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUGuc/E5TGGgsrdBsVLNYiVj+mKZTX14ny3tOIjLNBaKpo2Ptf2RH4/wofhR8zYe+XCMLCtq2s58AdGuXef@vger.kernel.org
X-Gm-Message-State: AOJu0YyMU/2uyCARniB9ZJZpj+85HbM4v2SgWWqc6vgjoQkYLEKZpDNR
	FX3h0nejB3pB5r8oiJapWzm/OgkbpiAXnkUJBNmPPjM/Xsm3IDJSfBeMCGDGyCA=
X-Gm-Gg: ASbGncvlJ7svgBp+H23T/NFyhdpa9pCrekC/SUMWkIFIcRqm0b1vavF9jRSpVseXY3U
	j2l9TgjljooGm6kNqvgS8tbZHOzDxEBvo3VyOIuCWzg0/ckgp2uTT6/6INOfTMn8KODk1lyP3lc
	L5TJeKO7VCkcIObpCUVIWP+7geD6AOqYwKcfC9kpI140HnTvHrbKu3getFeUoebNTvP5jqp1Vim
	Ohc3q1slyzMZ5rZzJapRGkJSP+enLw+qKQDXaFK8LhDvpTjjSH1JNuDEF1jYCt2V4On9mz/1+GG
	ZGb1lo+PXgjUua4U2M52dY5G3LGyvAiAk/tdX0r6HC6Kqex9GXmw/DPRt/6WdOjttxUD+oi+uY1
	aYBf/P5diDw==
X-Google-Smtp-Source: AGHT+IFa6RmlxDVU+Z/fAcwEEKxjPn906JwxGNMAIQ21GqtzU5bzQldRFT4YWzFFJnbZpVCs+q7ukw==
X-Received: by 2002:a05:600c:4754:b0:43c:eec7:eab7 with SMTP id 5b1f17b1804b1-43ee0640054mr78338955e9.11.1744019934216;
        Mon, 07 Apr 2025 02:58:54 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d938sm11679731f8f.65.2025.04.07.02.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 02:58:53 -0700 (PDT)
Message-ID: <778e2cd0-5371-424f-809d-20f7c3ae5343@linaro.org>
Date: Mon, 7 Apr 2025 10:58:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: camss NULL-deref on power on with 6.12-rc2
To: Johan Hovold <johan@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <Zwjw6XfVWcufMlqM@hovoldconsulting.com>
 <Z_OXELLDIfQII6wV@hovoldconsulting.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <Z_OXELLDIfQII6wV@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/04/2025 10:12, Johan Hovold wrote:
> On Fri, Oct 11, 2024 at 11:33:30AM +0200, Johan Hovold wrote:
> 
>> This morning I hit the below NULL-deref in camss when booting a 6.12-rc2
>> kernel on the Lenovo ThinkPad X13s.
>>
>> I booted the same kernel another 50 times without hitting it again it so
>> it may not be a regression, but simply an older, hard to hit bug.
>>
>> Hopefully you can figure out what went wrong from just staring at the
>> oops and code.
> 
> Hit the NULL-pointer dereference during boot that I reported back in
> October again today with 6.15-rc1.
> 
> The camss_find_sensor_pad() function was renamed in 6.15-rc1, but
> otherwise it looks identical.
> 
> Johan
> 
> 
> [    5.740833] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000030
> [    5.741162] Mem abort info:
> [    5.741435]   ESR = 0x0000000096000004
> [    5.741707]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    5.741980]   SET = 0, FnV = 0
> [    5.742249]   EA = 0, S1PTW = 0
> [    5.742253]   FSC = 0x04: level 0 translation fault
> [    5.742255] Data abort info:
> [    5.742257]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> [    5.743264]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [    5.743267]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [    5.743269] user pgtable: 4k pages, 48-bit VAs, pgdp=000000010fb98000
> [    5.743272] [0000000000000030] pgd=0000000000000000, p4d=0000000000000000
> [    5.744064] Internal error: Oops: 0000000096000004 [#1]  SMP
> 
> [    5.744645] CPU: 3 UID: 0 PID: 442 Comm: v4l_id Not tainted 6.15.0-rc1 #106 PREEMPT
> [    5.744647] Hardware name: LENOVO 21BYZ9SRUS/21BYZ9SRUS, BIOS N3HET87W (1.59 ) 12/05/2023
> [    5.744649] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    5.744651] pc : camss_find_sensor_pad+0x20/0x74 [qcom_camss]
> [    5.744661] lr : camss_get_pixel_clock+0x18/0x64 [qcom_camss]
> [    5.744666] sp : ffff800082dfb8e0
> [    5.744667] x29: ffff800082dfb8e0 x28: ffff800082dfbc68 x27: ffff143e80404618
> [    5.744671] x26: 0000000000000000 x25: 0000000000000000 x24: ffff143e9398baa8
> [    5.744675] x23: ffff800082dfb998 x22: ffff143e9398d9a0 x21: ffff800082dfb9a8
> [    5.744678] x20: 0000000000000002 x19: 0000000000020001 x18: 0000000000000020
> [    5.744682] x17: 3030613563613a33 x16: ffffac4db3ccf814 x15: 706e65672f6b6e69
> [    5.744686] x14: 0000000000000000 x13: ffff143e80b39180 x12: 30613563613a333a
> [    5.744690] x11: ffffac4db50a8920 x10: 0000000000000000 x9 : 0000000000000000
> [    5.744693] x8 : ffffac4db4992000 x7 : ffff800082dfb8e0 x6 : ffff800082dfb870
> [    5.744697] x5 : ffff800082dfc000 x4 : ffff143e9398cc70 x3 : ffff143e9398cb40
> [    5.744701] x2 : ffff143e9398be00 x1 : ffff143e9398d9a0 x0 : 0000000000000000
> [    5.744704] Call trace:
> [    5.744706]  camss_find_sensor_pad+0x20/0x74 [qcom_camss] (P)
> [    5.744711]  camss_get_pixel_clock+0x18/0x64 [qcom_camss]
> [    5.744716]  vfe_get+0xb8/0x504 [qcom_camss]
> [    5.744724]  vfe_set_power+0x30/0x58 [qcom_camss]
> [    5.744731]  pipeline_pm_power_one+0x13c/0x150 [videodev]
> [    5.744745]  pipeline_pm_power.part.0+0x58/0xf4 [videodev]
> [    5.744754]  v4l2_pipeline_pm_use+0x58/0x94 [videodev]
> [    5.744762]  v4l2_pipeline_pm_get+0x14/0x20 [videodev]
> [    5.744771]  video_open+0x78/0xf4 [qcom_camss]
> [    5.744776]  v4l2_open+0x80/0x120 [videodev]
> [    5.755711]  chrdev_open+0xb4/0x204
> [    5.755716]  do_dentry_open+0x138/0x4d0
> [    5.756271]  vfs_open+0x2c/0xe8
> [    5.756274]  path_openat+0x2b8/0x9fc
> [    5.756276]  do_filp_open+0x8c/0x144
> [    5.756277]  do_sys_openat2+0x80/0xdc
> [    5.756279]  __arm64_sys_openat+0x60/0xb0
> [    5.757830]  invoke_syscall+0x48/0x110
> [    5.757834]  el0_svc_common.constprop.0+0xc0/0xe0
> [    5.758369]  do_el0_svc+0x1c/0x28
> [    5.758372]  el0_svc+0x48/0x114
> [    5.758889]  el0t_64_sync_handler+0xc8/0xcc
> [    5.759184]  el0t_64_sync+0x198/0x19c
> [    5.759475] Code: f9000bf3 52800033 72a00053 f9402420 (f9401801)
>   
>   
>> [    5.657860] ov5675 24-0010: failed to get HW configuration: -517
>> [    5.676183] vreg_l6q: Bringing 2800000uV into 1800000-1800000uV
>>
>> [    6.517689] qcom-camss ac5a000.camss: Adding to iommu group 22
>>
>> [    6.589201] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000030
>> [    6.589625] Mem abort info:
>> [    6.589960]   ESR = 0x0000000096000004
>> [    6.590293]   EC = 0x25: DABT (current EL), IL = 32 bits
>> [    6.590630]   SET = 0, FnV = 0
>> [    6.591619]   EA = 0, S1PTW = 0
>> [    6.591968]   FSC = 0x04: level 0 translation fault
>> [    6.592298] Data abort info:
>> [    6.592621]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
>> [    6.593112]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>> [    6.593450]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>> [    6.593783] user pgtable: 4k pages, 48-bit VAs, pgdp=000000010daef000
>> [    6.594139] [0000000000000030] pgd=0000000000000000, p4d=0000000000000000
>> [    6.594214] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> 
>> [    6.594868] CPU: 0 UID: 0 PID: 557 Comm: v4l_id Not tainted 6.12.0-rc2 #165
>> [    6.594871] Hardware name: LENOVO 21BYZ9SRUS/21BYZ9SRUS, BIOS N3HET87W (1.59 ) 12/05/2023
>> [    6.594872] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> [    6.594874] pc : camss_find_sensor+0x20/0x74 [qcom_camss]
>> [    6.594885] lr : camss_get_pixel_clock+0x18/0x60 [qcom_camss]
>> [    6.594889] sp : ffff800082d538f0
>> [    6.594890] x29: ffff800082d538f0 x28: ffff800082d53c70 x27: ffff670cc0404618
>> [    6.594893] x26: 0000000000000000 x25: 0000000000000000 x24: ffff670cd33173d0
>> [    6.594895] x23: ffff800082d539a8 x22: ffff670cd33192c8 x21: ffff800082d539b8
>> [    6.594898] x20: 0000000000000002 x19: 0000000000020001 x18: 0000000000000000
>> [    6.594900] x17: 0000000000000000 x16: ffffbf0bffbecdd0 x15: 0000000000000001
>> [    6.594902] x14: ffff670cc5c95300 x13: ffff670cc0b38980 x12: ffff670cc5c95ba8
>> [    6.594905] x11: ffffbf0c00f73000 x10: 0000000000000000 x9 : 0000000000000000
>> [    6.594907] x8 : ffffbf0c0085d000 x7 : 0000000000000000 x6 : 0000000000000078
>> [    6.594910] x5 : 0000000000000000 x4 : ffff670cd3318598 x3 : ffff670cd3318468
>> [    6.594912] x2 : ffff670cd3317728 x1 : ffff800082d539b8 x0 : 0000000000000000
>> [    6.594915] Call trace:
>> [    6.594915]  camss_find_sensor+0x20/0x74 [qcom_camss]
>> [    6.594920]  camss_get_pixel_clock+0x18/0x60 [qcom_camss]
>> [    6.594924]  vfe_get+0xb8/0x504 [qcom_camss]
>> [    6.594931]  vfe_set_power+0x30/0x58 [qcom_camss]
>> [    6.594936]  pipeline_pm_power_one+0x13c/0x150 [videodev]
>> [    6.594951]  pipeline_pm_power.part.0+0x58/0xf4 [videodev]
>> [    6.594960]  v4l2_pipeline_pm_use+0x58/0x94 [videodev]
>> [    6.594969]  v4l2_pipeline_pm_get+0x14/0x20 [videodev]
>> [    6.594978]  video_open+0x78/0xf4 [qcom_camss]
>> [    6.594982]  v4l2_open+0x80/0x120 [videodev]
>> [    6.594991]  chrdev_open+0xb4/0x204
>> [    6.594996]  do_dentry_open+0x138/0x4d0
>> [    6.595000]  vfs_open+0x2c/0xe4
>> [    6.595003]  path_openat+0x2b4/0x9fc
>> [    6.595005]  do_filp_open+0x80/0x130
>> [    6.595007]  do_sys_openat2+0xb4/0xe8
>> [    6.595010]  __arm64_sys_openat+0x64/0xac
>> [    6.595012]  invoke_syscall+0x48/0x110
>> [    6.595016]  el0_svc_common.constprop.0+0xc0/0xe0
>> [    6.595018]  do_el0_svc+0x1c/0x28
>> [    6.595021]  el0_svc+0x48/0x114
>> [    6.595023]  el0t_64_sync_handler+0xc0/0xc4
>> [    6.595025]  el0t_64_sync+0x190/0x194
>> [    6.595028] Code: 52800033 72a00053 d503201f f9402400 (f9401801)
>> [    6.595029] ---[ end trace 0000000000000000 ]---

I've never seen this myself.

I wonder, are you building camcc, camss and the sensor driver into your 
initrd ?

---
bod


