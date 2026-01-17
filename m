Return-Path: <linux-arm-msm+bounces-89531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F7BD39132
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 22:46:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5CFF63003B2A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 21:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32A8D2DA75B;
	Sat, 17 Jan 2026 21:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="AJGkrbtc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360E92882D7
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jan 2026 21:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768686383; cv=none; b=ZmjWFFS7O0D9KDC7ZDS69w0/OynrRlZMUh1h+0ZwwwaND0wS5RbJIXOitWndWjtNq4pwGywIgESwJutyo615pf6/NwdsFNUtlzfJjxnkxYymqH/94DERUQJfx2EEduQ1MBYNigaAFRCKIMlVHwu96PLeXm6UxYf61Z9krkM5ObE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768686383; c=relaxed/simple;
	bh=m9v1dQcQ6XYXgBWNtYYSthJq8/+YjDjCjUMbIgbYyWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W1CKRHRiKgxJfcTtogPjcBEAtEWGuPY4En8lGC9243EGD1EDyCURnwaTr/VV0pbbdM3ESl2b7piF6iPhtZHgipPu6oXUZidobMx6JFJk07YdyOias3fMaJUd32x5zMZh65eaBSgY+shqpkoJFtjDqkuk4P6MYCrRvjL93AAoJpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=AJGkrbtc; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <a5efb372-1a2a-4262-abc8-49bbeffa6961@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1768686377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tf7bG0pQMeMOUwUX/zh90P2Catwiv2K+Qr3H1Jwo+Tw=;
	b=AJGkrbtcsIl7HSbVXnUybuvEQfv79OxyzwvRJjoKwJRzBGFv5IJQB7YNUoAwXgu50dwMNp
	ivCW9AtS1P4ro+u238vouoMO5E9KqawfzZZ5o0sjFK3n97BLYkDvxpAP6coNYuJmnfB5p7
	8/PEpynJU2f1u3tGJxXrd9GQ+qjhUe1txEfK0JbgGatPtuo971nUP0ys1mBwJZnLZ/jEbr
	qVg1ukyZDillqvjI32WB5HDTu7E5sB2FbOHTJD7PG/vi6mOE2fLGePDaysYfUQF9ie14dA
	5oFtosuXH6hjgdVzQ7ICIxyndA7M0LQ00SBTo2rKrSF/2m557nfAFS96NrpgdQ==
Date: Sat, 17 Jan 2026 18:46:09 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] drm/msm/dpu: Filter modes based on adjusted mode clock
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Xilin Wu <sophon@radxa.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250506-filter-modes-v2-1-c20a0b7aa241@oss.qualcomm.com>
 <F4CDF36128041430+0d030e3b-054c-4910-a132-72273c541948@radxa.com>
 <caf44ce9-48ec-45b4-b633-3a49b7705b1e@packett.cool>
 <iqst4yq3z5jlpr6f3r7fqbkzaxtn5ugene2j7tcvaa6jy2jwdi@k5zgxvqgxymi>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <iqst4yq3z5jlpr6f3r7fqbkzaxtn5ugene2j7tcvaa6jy2jwdi@k5zgxvqgxymi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 1/15/26 6:08 PM, Dmitry Baryshkov wrote:
> On Mon, Jan 12, 2026 at 04:54:28AM -0300, Val Packett wrote:
>> On 1/12/26 3:31 AM, Xilin Wu wrote:
>>> On 5/7/2025 9:38 AM, Jessica Zhang wrote:
>>>> Filter out modes that have a clock rate greater than the max core clock
>>>> rate when adjusted for the perf clock factor
>>>>
>>>> This is especially important for chipsets such as QCS615 that have lower
>>>> limits for the MDP max core clock.
>>>>
>>>> Since the core CRTC clock is at least the mode clock (adjusted for the
>>>> perf clock factor) [1], the modes supported by the driver should be less
>>>> than the max core clock rate.
>>>>
>>>> [1] https://elixir.bootlin.com/linux/v6.12.4/source/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c#L83
>>>>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>>>> ---
>>> Hi. This patch effectively filters out the 3840x2160@120Hz mode on
>>> SC8280XP CRD. The calculated adjusted_mode_clk is 623700, which slightly
>>> exceeds the supported max core clock of 600000.
>>>
>>> However, 4K 120Hz works flawlessly with the limit removed on this
>>> platform. I even tried connecting two 4K 120Hz displays, and they can
>>> work properly simultaneously. Is it possible to bring back support for
>>> this mode, or adjust the limits?
>> hm, interestingly on X1E80100 we didn't hit *that* limit,
>> the adjusted_mode_clk (576318) was only above what disp_cc_mdss_mdp_clk was
> Hmm, what is your modeline then? Xilin's mode params looks sane and
> standard enough.

as mentioned in 
https://gitlab.freedesktop.org/drm/msm/-/issues/38#note_3216051:

"3840x2160": 120 1097750 3840 3888 3920 4000 2160 2166 2176 2287 0x40 0x9

## 1097750 / 2 = 548875; 548875 * 1.05 = 576318.75

vs.

"3840x2160": 120 1188000 3840 4016 4104 4400 2160 2168 2178 2250 0x40 0x5

## 1188000 / 2 = 594000; 594000 * 1.05 = 623700

Yeah, what's interesting is that both are just slightly above the max 
disp_cc_mdss_mdp_clk_src on the respective platforms. 576318 is only 
slightly above 575000, and 623700 is only slightly above 608000. So it's 
actually the *same* limit, just that the numbers are different per 
platform (sorry for any confusion).

Sooo.. what *is* the deal with the 105% inefficiency factor, is it 
possible to find out where it came from and why it's hardcoded to that 
number everywhere?

Can we add a loop that reduces it until the result fits into the max 
clk? Or should the factor be ignored for this calculation maybe?

~val


