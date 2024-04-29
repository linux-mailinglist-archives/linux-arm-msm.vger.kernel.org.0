Return-Path: <linux-arm-msm+bounces-18808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 823898B5BF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 16:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 126681F21082
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 14:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AA597EF1C;
	Mon, 29 Apr 2024 14:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="znKTOjlu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25B0745C5
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 14:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714402365; cv=none; b=NH58QYYCLy19gsa9XYu24YO1Elr8cwQfuseQKT8P5ITkzBDG8nXM/G4zqDUeu5Yfam0+1QzuuFe5VrWZJRTEVcYbirWaKwMS+gxH9uMgdrii/Y9K1u1XeEGWr27t4bOg1ExLl6PiFuq6cAoCRTyxb2XkP7xQ/89begL4a0pK54w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714402365; c=relaxed/simple;
	bh=MS4Z/99h56EkXj1s1xDTLAHcbb8uKVqdJNHb69T3/KM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bXpXpE1SVEA6Vbj+SwSQU+dvNBlctboVz3yf/eVSMyQKNpCIf/GOwlwRKVFspLQQwFs83mw6N11xuoPrYoG85BNglWZKQMv7hH9VPCxplju5SGo3Eg4uWqSmfhbu7jSk5AecAB9TJEhLH/H49bevy3Y/dqeqQyr5YaWDhPCweZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=znKTOjlu; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2e0b2ddc54fso7622641fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 07:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714402362; x=1715007162; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jeI6KlpGQ47s60xx/kacu+/0pJ7Dz1S+XkuqYlYJc1k=;
        b=znKTOjluOj1ls9fUcn3Hi/qdrhnmqrwLD1w+krCi3pIPs0Qdl7oeE2N/pvJEKNlxIX
         WJ0B2gtJvK08aXG58URhZpXIF+Z08l9putdlpD6/BaqAltULkxGxs2oPl7WEaahbPY9/
         2dpDLyqc16ULYG6GEge0QZKbZjwylJFXz3oHq1RHRs/o3JdHYorB8S5hTu71ipHhD4gW
         +Z56yYyQhKtIFcBNkEX0xpxm+Kd24SWHRC8IucSmr+G/DN9P8sCO+ECpXpbVvaJTEB/P
         +LCAeDLlwMZ7PShBEzW6SFRy+6a/fH2uzScetGv1C4jlYHkL5SjN+w9HAWsqIhXh6ujM
         4vXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714402362; x=1715007162;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jeI6KlpGQ47s60xx/kacu+/0pJ7Dz1S+XkuqYlYJc1k=;
        b=H+XfLhEcIzP/lFe8+IJLZRkuiVm6oG+H+6OKihDRMYkDcwioBwoiBfz4hlxVpv7eg2
         idZdJ5XAZQQ6MFpIOcWBKjc3vaggwtCqoY43iq6MbhN3ITJVh/PmFiJwU4o3nHyhq1tS
         QKcZi0OuFJ9hpM7dPJRib7MzN9LHK/IINs2UsZu1OX/fwhPb511MV8xyjLukf+vqXbfY
         2sqOtD5oW0RdxJeinr9xsZ0VNnEs4+pV3IytqDKDEv9SsXgxsvOKuZhhlYP/KZP2pYgv
         qFQxAxdbIG/09Xk+WgMBnMw+NjEW3srIE3CBgSEGQvgkX/NBktno05PpcZsAKexmBFLM
         AiOw==
X-Gm-Message-State: AOJu0YyuBd1i5JJA4ZKuEKTeMXXPwaOH1vD13pS85Rh1xxsZVf0VeSqa
	Wc6pJb8r4msZcJoq+Lp25x+K4a6pwVpmiFU8kUnUVMefZ55q6ANN1R4T9teCGDGcB5ot5LDDabO
	2LyM=
X-Google-Smtp-Source: AGHT+IEewQbwh34zeC7G49ZLFBQ66k+DFEMomA4EjKArNH8E9/Mde3/EFqg6lvZYhg0V3beEIbSR/g==
X-Received: by 2002:a2e:900b:0:b0:2e0:ce1:7888 with SMTP id h11-20020a2e900b000000b002e00ce17888mr3292327ljg.25.1714402361892;
        Mon, 29 Apr 2024 07:52:41 -0700 (PDT)
Received: from [172.30.204.209] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id z1-20020a2e9641000000b002d6bc956deesm3638745ljh.99.2024.04.29.07.52.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 07:52:41 -0700 (PDT)
Message-ID: <312d3cbd-852e-4b93-8bef-c78827712f56@linaro.org>
Date: Mon, 29 Apr 2024 16:52:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] clk: qcom: mmcc-msm8998: fix venus clock issue
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Marc Gonzalez <mgonzalez@freebox.fr>, Bjorn Andersson
 <andersson@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: MSM <linux-arm-msm@vger.kernel.org>, linux-clk
 <linux-clk@vger.kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
References: <ff4e2e34-a677-4c39-8c29-83655c5512ae@freebox.fr>
 <171424646121.1448451.7219465997551736348.b4-ty@kernel.org>
 <c595791a-bf36-481d-a2f5-aa99ec28a4b7@freebox.fr>
 <1bbd5175-31a3-4c4c-b2b6-6ee7c65bb17f@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <1bbd5175-31a3-4c4c-b2b6-6ee7c65bb17f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 4/29/24 16:39, Bryan O'Donoghue wrote:
> On 29/04/2024 14:45, Marc Gonzalez wrote:
>> On 27/04/2024 21:34, Bjorn Andersson wrote:
>>
>>> On Thu, 25 Apr 2024 17:07:07 +0200, Marc Gonzalez wrote:
>>>
>>>> Right now, msm8998 video decoder (venus) is non-functional:
>>>>
>>>> $ time mpv --hwdec=v4l2m2m-copy --vd-lavc-software-fallback=no --vo=null --no-audio --untimed --length=30 --quiet demo-480.webm
>>>>   (+) Video --vid=1 (*) (vp9 854x480 29.970fps)
>>>>       Audio --aid=1 --alang=eng (*) (opus 2ch 48000Hz)
>>>> [ffmpeg/video] vp9_v4l2m2m: output VIDIOC_REQBUFS failed: Connection timed out
>>>> [ffmpeg/video] vp9_v4l2m2m: no v4l2 output context's buffers
>>>> [ffmpeg/video] vp9_v4l2m2m: can't configure decoder
>>>> Could not open codec.
>>>> Software decoding fallback is disabled.
>>>> Exiting... (Quit)
>>>>
>>>> [...]
>>>
>>> Applied, thanks!
>>>
>>> [1/1] clk: qcom: mmcc-msm8998: fix venus clock issue
>>>        commit: e20ae5ae9f0c843aded4f06f3d1cab7384789e92
>>
>> Yes!
>>
>> Going on a tangent.
>>
>> During my tests, I saw an unrelated error in the boot log:
>>
>> [   10.404521] clk: Disabling unused clocks
>> [   10.412141] ------------[ cut here ]------------
>> [   10.415538] vmem_ahb_clk status stuck at 'on'

We currently don't support VMEM (which is a small SRAM dedicated to venus)
upstream, but venus functions without it (albeit I'd expect it to be
slower or not fully capable without it)

>> [   10.415570] WARNING: CPU: 0 PID: 1 at drivers/clk/qcom/clk-branch.c:87 clk_branch_toggle+0x160/0x178
>> [   10.424420] Modules linked in:
>> [   10.433586] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.9.0-rc1-00027-g483ea571c987 #70
>> [   10.436478] Hardware name: Freebox Delta (DT)
>> [   10.444356] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> [   10.448884] pc : clk_branch_toggle+0x160/0x178
>> [   10.455642] lr : clk_branch_toggle+0x160/0x178
>> [   10.460154] sp : ffff80008005bc40
>> [   10.464574] x29: ffff80008005bc40 x28: 0000000000000000 x27: ffff800082df9070
>> [   10.467982] x26: ffff800082d100b0 x25: ffff800082c57cb0 x24: ffff800082b23958
>> [   10.475100] x23: 0000000000000000 x22: 0000000000000000 x21: ffff8000833b6208
>> [   10.482218] x20: ffff80008072bbec x19: 0000000000000000 x18: ffffffffff00d218
>> [   10.489337] x17: ffff800083476aa8 x16: ffff800083476a38 x15: 0000000000000030
>> [   10.496454] x14: 0000000000000000 x13: ffff0000f5348000 x12: 000000000000086d
>> [   10.503572] x11: 00000000000002cf x10: ffff0000f7f4c368 x9 : ffff0000f5348000
>> [   10.510692] x8 : 00000000fff7ffff x7 : ffff0000f7f48000 x6 : 00000000000002cf
>> [   10.517809] x5 : 00000000005ffff4 x4 : 40000000fff802cf x3 : 0000000000000000
>> [   10.524926] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000080118000
>> [   10.532046] Call trace:
>> [   10.539137]  clk_branch_toggle+0x160/0x178
>> [   10.541402]  clk_branch2_disable+0x1c/0x28
>> [   10.545569]  clk_disable_unused_subtree+0xfc/0x138
>> [   10.549652]  clk_disable_unused_subtree+0x2c/0x138
>> [   10.554427]  clk_disable_unused_subtree+0x2c/0x138
>> [   10.559201]  clk_disable_unused_subtree+0x2c/0x138
>> [   10.563975]  clk_disable_unused_subtree+0x2c/0x138
>> [   10.568749]  clk_disable_unused_subtree+0x2c/0x138
>> [   10.573525]  clk_disable_unused_subtree+0x2c/0x138
>> [   10.578298]  clk_disable_unused+0x50/0x138
>> [   10.583070]  do_one_initcall+0x6c/0x1b0
>> [   10.587147]  kernel_init_freeable+0x1d4/0x2cc
>> [   10.590883]  kernel_init+0x20/0x1d8
>> [   10.595391]  ret_from_fork+0x10/0x20
>> [   10.598693] ---[ end trace 0000000000000000 ]---
> 
> Taking sm8250 as an example the vidoecc ahb clk is a candidate to be always-on.
> 
> drivers/clk/qcom/videocc-sm8250.c
>          qcom_branch_set_clk_en(regmap, 0xe58); /* VIDEO_CC_AHB_CLK */

This is totally unrelated

Konrad

