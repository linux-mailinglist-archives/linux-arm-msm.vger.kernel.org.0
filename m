Return-Path: <linux-arm-msm+bounces-18802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 702C98B5A61
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 15:45:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BE51282ADE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 13:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D4774404;
	Mon, 29 Apr 2024 13:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="WGyXNhiB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF59651B6
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 13:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714398331; cv=none; b=sgt7Tlf1F2629RNM5syxbWJ/3NH926weamzDmrHHMlVjwPy8sxYZaf1CYDdopjfm6ZUZmt1XNw/PykVBGptd0kyvt9vZmZoSMkACX5HaAdQ4xqToj1n6sFa8aL8SU6YUT7+5AL3TdHOOh/lytIP/hHM453G0l143U0Bw6FggZSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714398331; c=relaxed/simple;
	bh=vtbvaC21ZvS54m3NkJLVn/TRbwfNyAghSlO0A4SPHOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fSZSjO8RwpocDByT19FB9qHDbZdNBYqa48G4aq39IwuSkSMZjNoF3KPeiV84INIu3W76DGk+c1j7ghROIc0l9RLTA92NPl5uDmu1y0JdYOnkXC4TE6KainUa3yV+krWw3ZL7PAUe5L3+/xYbzbN9FhEFGCCX5g7uW5bchTvcpkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=WGyXNhiB; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-41b794510cdso26999495e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 06:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1714398327; x=1715003127; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hgm0JV0g+EuEQXNEVE6w0LpnECwwFk89ooo6qDS/rJY=;
        b=WGyXNhiBeHGBdK9HzCC4F7ea+bUwk+d4xxn7iAc1Vhn2aOY8LIb7b1FOU5JQEwuauO
         IzVQoozFq30qMwnHzFTYPjRFhiDLdChZZP6qRUcOW4a+zRNpe1mSCXXXevxPuqLv13re
         pFd51c8WLDs0pRHq/9nCMUjRUiagt5XwYVIojs0eBVsLjFvbo5eupbQm1ENXoZe9flDN
         Uprlwf7YwlV2w3RdW8cHBOdguuyBnGR3/bX0OKXNCrtggoTt77voTQ+blp81nT937zZ4
         iQMnyBgT/Li8iM9Eq7CkfkTSsR62pboFUgyigMzEX12VlRSYltomUpOAlFcFChcoPswg
         SK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714398327; x=1715003127;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hgm0JV0g+EuEQXNEVE6w0LpnECwwFk89ooo6qDS/rJY=;
        b=FWF1s3ThNEjKaH8zSLjQC8Is6fca5CXJDVidIOhfGs8FWUk+RsEuDY1ufBnPctBkom
         v0ladIV7HzS3TbaVsMsV0E8JGk3TnI7Xv9YQO4brSWX5oArCiRl/ZtycZ0uurY8Tq3I0
         NnMT5QKcHDsvwJjRPQENLpTLu7YbHCT4/LZsNxlqO7yMgsYwcS+3A3Gdk7GMtVo0uQPb
         hLn265ZLqCLy1e1xXdI8M3+S9QsLJZsh7P7VvvGMm7p6nQgcuJG+ED2ZkkqXZ+yOpDnQ
         qiEIUQKWMdbBo75y1zaN0Z5Nlv3RY/ieLgOKJ2BSncxvE2B+HPxx3x4P8Xc7Nw2YjKLL
         BmpQ==
X-Gm-Message-State: AOJu0YyKXSCo0nqY+Bt/Nlgrf5H7DyAZBy9umSKFuVf91OgBaOcxeQyJ
	zc/zJwvW581rxKe0vxB/f0oYerlMNxL8l/1qjL7W2OWmlxdJ5QX0ixzE1Y+7roE=
X-Google-Smtp-Source: AGHT+IEMSMpMhXhXBd/VE2xFEJexSsaVVCJ6hk6nFG/c3P6znyBIkSqSyaaK2XgJ87h6K8r5FKbaDw==
X-Received: by 2002:a05:600c:1c10:b0:41c:7be:851 with SMTP id j16-20020a05600c1c1000b0041c07be0851mr3897406wms.9.1714398327279;
        Mon, 29 Apr 2024 06:45:27 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id m15-20020a05600c460f00b0041a964b55ddsm9101471wmo.1.2024.04.29.06.45.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 06:45:27 -0700 (PDT)
Message-ID: <c595791a-bf36-481d-a2f5-aa99ec28a4b7@freebox.fr>
Date: Mon, 29 Apr 2024 15:45:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] clk: qcom: mmcc-msm8998: fix venus clock issue
To: Bjorn Andersson <andersson@kernel.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>, linux-clk
 <linux-clk@vger.kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
References: <ff4e2e34-a677-4c39-8c29-83655c5512ae@freebox.fr>
 <171424646121.1448451.7219465997551736348.b4-ty@kernel.org>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <171424646121.1448451.7219465997551736348.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/04/2024 21:34, Bjorn Andersson wrote:

> On Thu, 25 Apr 2024 17:07:07 +0200, Marc Gonzalez wrote:
> 
>> Right now, msm8998 video decoder (venus) is non-functional:
>>
>> $ time mpv --hwdec=v4l2m2m-copy --vd-lavc-software-fallback=no --vo=null --no-audio --untimed --length=30 --quiet demo-480.webm
>>  (+) Video --vid=1 (*) (vp9 854x480 29.970fps)
>>      Audio --aid=1 --alang=eng (*) (opus 2ch 48000Hz)
>> [ffmpeg/video] vp9_v4l2m2m: output VIDIOC_REQBUFS failed: Connection timed out
>> [ffmpeg/video] vp9_v4l2m2m: no v4l2 output context's buffers
>> [ffmpeg/video] vp9_v4l2m2m: can't configure decoder
>> Could not open codec.
>> Software decoding fallback is disabled.
>> Exiting... (Quit)
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/1] clk: qcom: mmcc-msm8998: fix venus clock issue
>       commit: e20ae5ae9f0c843aded4f06f3d1cab7384789e92

Yes!

Going on a tangent.

During my tests, I saw an unrelated error in the boot log:

[   10.404521] clk: Disabling unused clocks
[   10.412141] ------------[ cut here ]------------
[   10.415538] vmem_ahb_clk status stuck at 'on'
[   10.415570] WARNING: CPU: 0 PID: 1 at drivers/clk/qcom/clk-branch.c:87 clk_branch_toggle+0x160/0x178
[   10.424420] Modules linked in:
[   10.433586] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.9.0-rc1-00027-g483ea571c987 #70
[   10.436478] Hardware name: Freebox Delta (DT)
[   10.444356] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   10.448884] pc : clk_branch_toggle+0x160/0x178
[   10.455642] lr : clk_branch_toggle+0x160/0x178
[   10.460154] sp : ffff80008005bc40
[   10.464574] x29: ffff80008005bc40 x28: 0000000000000000 x27: ffff800082df9070
[   10.467982] x26: ffff800082d100b0 x25: ffff800082c57cb0 x24: ffff800082b23958
[   10.475100] x23: 0000000000000000 x22: 0000000000000000 x21: ffff8000833b6208
[   10.482218] x20: ffff80008072bbec x19: 0000000000000000 x18: ffffffffff00d218
[   10.489337] x17: ffff800083476aa8 x16: ffff800083476a38 x15: 0000000000000030
[   10.496454] x14: 0000000000000000 x13: ffff0000f5348000 x12: 000000000000086d
[   10.503572] x11: 00000000000002cf x10: ffff0000f7f4c368 x9 : ffff0000f5348000
[   10.510692] x8 : 00000000fff7ffff x7 : ffff0000f7f48000 x6 : 00000000000002cf
[   10.517809] x5 : 00000000005ffff4 x4 : 40000000fff802cf x3 : 0000000000000000
[   10.524926] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000080118000
[   10.532046] Call trace:
[   10.539137]  clk_branch_toggle+0x160/0x178
[   10.541402]  clk_branch2_disable+0x1c/0x28
[   10.545569]  clk_disable_unused_subtree+0xfc/0x138
[   10.549652]  clk_disable_unused_subtree+0x2c/0x138
[   10.554427]  clk_disable_unused_subtree+0x2c/0x138
[   10.559201]  clk_disable_unused_subtree+0x2c/0x138
[   10.563975]  clk_disable_unused_subtree+0x2c/0x138
[   10.568749]  clk_disable_unused_subtree+0x2c/0x138
[   10.573525]  clk_disable_unused_subtree+0x2c/0x138
[   10.578298]  clk_disable_unused+0x50/0x138
[   10.583070]  do_one_initcall+0x6c/0x1b0
[   10.587147]  kernel_init_freeable+0x1d4/0x2cc
[   10.590883]  kernel_init+0x20/0x1d8
[   10.595391]  ret_from_fork+0x10/0x20
[   10.598693] ---[ end trace 0000000000000000 ]---


