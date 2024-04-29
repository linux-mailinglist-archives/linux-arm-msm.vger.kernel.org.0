Return-Path: <linux-arm-msm+bounces-18807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5EC8B5B8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 16:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 858001F223CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Apr 2024 14:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F7CE80029;
	Mon, 29 Apr 2024 14:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QYWCKb9c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC7C80023
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 14:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714401554; cv=none; b=PGbB8ygHtvfZeD/YC8dh9vibz/tkWG/vcDtTHLxthFCPVF9dFAkBkVz5HezV+U/Gs9NDxBDTvL0ZuMZnbWWXII4RvOG4laqi+md55ReCJj5gqPUbFG2D0HEuFFesbA10IAynfX3/wKSqgL+N/4joxD3n4kNkAn3VlALhrh17dzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714401554; c=relaxed/simple;
	bh=znCjHwEg7xtePPdSc9xOaXcPiCNKinHDglBLDvVPZ0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A6DAwQTxIiJEprSHZHYmmK7LcRpy6PRrdEfBPcwtfojWf6JILwP8RdfQkvFQ7G+BGz/fXvQ6FzeoMHZ8IUdgCF45ATUJcTLzrcI3qKpkae504TpsBZf4KPS0qNq3/8sun5faqkhbCzXGNBUe4Gji5jU/2EJ0qqkJYBhr8HEcqaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QYWCKb9c; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-418e4cd2196so36699745e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 07:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714401551; x=1715006351; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KWmFDPlfuGY+XBEUdkO8nlMKky4FXK4cahdVf7Dpo/E=;
        b=QYWCKb9cJtDCTo7VrtP0m9TiZBFO7lVjcMrwy+4TxdjYdDqKNFbXoYgfAx4onRTuen
         4MtJ9e8nxYZMktrt8jR87loHc/OinUmZ8V2ulTY+ar2bXD649iQeHTNR0SOs+8vZPLYu
         8dzJc1VOhiVfi5mtubb5+Z5VCg5Amlr8bG9fgszEUe2xABK9p5yYxUHWWJxsmPS+IoWu
         IjrBrJEO//yCxB46sM5VlH98vmCoz8weSY25Zq9+0hZEH62O6r5KSMMltqvSPUNdPsru
         DulVo3b01F2Zj8+QyJEseTz6xaqpxOJfwnr/Zs4BGUETwBVroWeNtAXq1maQDZ8veiUB
         PCWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714401551; x=1715006351;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KWmFDPlfuGY+XBEUdkO8nlMKky4FXK4cahdVf7Dpo/E=;
        b=CMsFmV1ZNAfMhFyfU7q7hrS0Uc4pDTV0rj7X+SbNeicI4hMBTZd4pNaLF7qlSP3545
         qvYcE3EpQmTKDoFLl6l1hWda88aaFM781RHLxRe/b4Y4gLK4b9tLLclj42DZatJgM4H3
         QP461ozp1ITIq6GcG7HZjvHFYY57ArDYKn/oz4DPugxlqnexEqD1tkaHlOah3T6Erwkb
         SZRPGclrNoulAdnrH5rSKFYVTDrDrqzcbNTv8UaW0h5bAcdAaSCVlS8nTLNs00L9Fzcg
         EI645G+ebXjlruVSUXB9oLV3t0eZZC8N6RPTsmS9NOddbilmPtL3vbzy0vs93KJifinL
         7dKg==
X-Gm-Message-State: AOJu0YxXPCapjmbT5OfK839xeJRdYxoEJtrLnA9FwHrec+hZDde76ADv
	DHBLBfzlyV5Lfb7UYn7nUVUSOu3zuh19KTAWgotmqXHeqqwAnMELTBFxncXnUP8=
X-Google-Smtp-Source: AGHT+IHXUH0DoRtDDpwFz6lq/buHnD3S41XTDI3UG/MFnsul9ZWoDRmfPwVBf8zur/DHKQlpOHcVpw==
X-Received: by 2002:a05:600c:1f87:b0:41b:f99c:f677 with SMTP id je7-20020a05600c1f8700b0041bf99cf677mr13256wmb.6.1714401550863;
        Mon, 29 Apr 2024 07:39:10 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id k41-20020a05600c1ca900b00417e8be070csm41985611wms.9.2024.04.29.07.39.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 07:39:08 -0700 (PDT)
Message-ID: <1bbd5175-31a3-4c4c-b2b6-6ee7c65bb17f@linaro.org>
Date: Mon, 29 Apr 2024 15:39:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] clk: qcom: mmcc-msm8998: fix venus clock issue
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>, Bryan O Donoghue <bryan.odonoghue@linaro.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>, linux-clk
 <linux-clk@vger.kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
References: <ff4e2e34-a677-4c39-8c29-83655c5512ae@freebox.fr>
 <171424646121.1448451.7219465997551736348.b4-ty@kernel.org>
 <c595791a-bf36-481d-a2f5-aa99ec28a4b7@freebox.fr>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <c595791a-bf36-481d-a2f5-aa99ec28a4b7@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/04/2024 14:45, Marc Gonzalez wrote:
> On 27/04/2024 21:34, Bjorn Andersson wrote:
> 
>> On Thu, 25 Apr 2024 17:07:07 +0200, Marc Gonzalez wrote:
>>
>>> Right now, msm8998 video decoder (venus) is non-functional:
>>>
>>> $ time mpv --hwdec=v4l2m2m-copy --vd-lavc-software-fallback=no --vo=null --no-audio --untimed --length=30 --quiet demo-480.webm
>>>   (+) Video --vid=1 (*) (vp9 854x480 29.970fps)
>>>       Audio --aid=1 --alang=eng (*) (opus 2ch 48000Hz)
>>> [ffmpeg/video] vp9_v4l2m2m: output VIDIOC_REQBUFS failed: Connection timed out
>>> [ffmpeg/video] vp9_v4l2m2m: no v4l2 output context's buffers
>>> [ffmpeg/video] vp9_v4l2m2m: can't configure decoder
>>> Could not open codec.
>>> Software decoding fallback is disabled.
>>> Exiting... (Quit)
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [1/1] clk: qcom: mmcc-msm8998: fix venus clock issue
>>        commit: e20ae5ae9f0c843aded4f06f3d1cab7384789e92
> 
> Yes!
> 
> Going on a tangent.
> 
> During my tests, I saw an unrelated error in the boot log:
> 
> [   10.404521] clk: Disabling unused clocks
> [   10.412141] ------------[ cut here ]------------
> [   10.415538] vmem_ahb_clk status stuck at 'on'
> [   10.415570] WARNING: CPU: 0 PID: 1 at drivers/clk/qcom/clk-branch.c:87 clk_branch_toggle+0x160/0x178
> [   10.424420] Modules linked in:
> [   10.433586] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.9.0-rc1-00027-g483ea571c987 #70
> [   10.436478] Hardware name: Freebox Delta (DT)
> [   10.444356] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   10.448884] pc : clk_branch_toggle+0x160/0x178
> [   10.455642] lr : clk_branch_toggle+0x160/0x178
> [   10.460154] sp : ffff80008005bc40
> [   10.464574] x29: ffff80008005bc40 x28: 0000000000000000 x27: ffff800082df9070
> [   10.467982] x26: ffff800082d100b0 x25: ffff800082c57cb0 x24: ffff800082b23958
> [   10.475100] x23: 0000000000000000 x22: 0000000000000000 x21: ffff8000833b6208
> [   10.482218] x20: ffff80008072bbec x19: 0000000000000000 x18: ffffffffff00d218
> [   10.489337] x17: ffff800083476aa8 x16: ffff800083476a38 x15: 0000000000000030
> [   10.496454] x14: 0000000000000000 x13: ffff0000f5348000 x12: 000000000000086d
> [   10.503572] x11: 00000000000002cf x10: ffff0000f7f4c368 x9 : ffff0000f5348000
> [   10.510692] x8 : 00000000fff7ffff x7 : ffff0000f7f48000 x6 : 00000000000002cf
> [   10.517809] x5 : 00000000005ffff4 x4 : 40000000fff802cf x3 : 0000000000000000
> [   10.524926] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000080118000
> [   10.532046] Call trace:
> [   10.539137]  clk_branch_toggle+0x160/0x178
> [   10.541402]  clk_branch2_disable+0x1c/0x28
> [   10.545569]  clk_disable_unused_subtree+0xfc/0x138
> [   10.549652]  clk_disable_unused_subtree+0x2c/0x138
> [   10.554427]  clk_disable_unused_subtree+0x2c/0x138
> [   10.559201]  clk_disable_unused_subtree+0x2c/0x138
> [   10.563975]  clk_disable_unused_subtree+0x2c/0x138
> [   10.568749]  clk_disable_unused_subtree+0x2c/0x138
> [   10.573525]  clk_disable_unused_subtree+0x2c/0x138
> [   10.578298]  clk_disable_unused+0x50/0x138
> [   10.583070]  do_one_initcall+0x6c/0x1b0
> [   10.587147]  kernel_init_freeable+0x1d4/0x2cc
> [   10.590883]  kernel_init+0x20/0x1d8
> [   10.595391]  ret_from_fork+0x10/0x20
> [   10.598693] ---[ end trace 0000000000000000 ]---

Taking sm8250 as an example the vidoecc ahb clk is a candidate to be 
always-on.

drivers/clk/qcom/videocc-sm8250.c
         qcom_branch_set_clk_en(regmap, 0xe58); /* VIDEO_CC_AHB_CLK */

---
bod


