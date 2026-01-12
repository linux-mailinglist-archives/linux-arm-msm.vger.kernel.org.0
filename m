Return-Path: <linux-arm-msm+bounces-88488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBBBD114E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 09:46:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3EFE8300ACF6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 08:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE8A31B83B;
	Mon, 12 Jan 2026 08:45:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EFE343D90;
	Mon, 12 Jan 2026 08:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768207545; cv=none; b=LXRuqhXby8m3ewP+Wj/Lj09XN2aVXELtkU2w0OdyN5x4LBkhAl3xAme5iSwiJJUKrpjbtLG5DrXIa71ZmZXi7TcwtYaKVRgIL1T/z3iUgjYRjAgWINoc1NbI6qdui2bXF76GLg1b3BDH4X/FSUgUgUw2cDX5WAizJqRjcUQfPPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768207545; c=relaxed/simple;
	bh=0RWWtKqbT8y/0oCPzc3x++/INVU07EJinbt5K8tLSnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=la+/wrlbv0mZlecQy7qKGzYc7m9w7zOWO62Hxxz4VYunxJh3f1SatbqLH9N2ONAOmNFiI4foveH2ge+Uv3xC7GhHyA/P6bmv08rtwCT6aZ5A9i4KT4dDRFuXOvypJy4TeCmuWhhYW+4RaeoTmTK6ff1aAuAf5Ieos3bSFkbtcfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpgz4t1768207503t46538021
X-QQ-Originating-IP: No/iic3a9D/6g3qukB23n+O3HzQ9Cq5/4EDsCy+J4VY=
Received: from [127.0.0.1] ( [116.234.96.45])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 12 Jan 2026 16:45:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9623093880798620638
Message-ID: <5B7B8ACBA1105D89+a1ddf0aa-8eb9-4704-a512-f1e545cd8d39@radxa.com>
Date: Mon, 12 Jan 2026 16:45:01 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm/dpu: Filter modes based on adjusted mode clock
To: Val Packett <val@packett.cool>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250506-filter-modes-v2-1-c20a0b7aa241@oss.qualcomm.com>
 <F4CDF36128041430+0d030e3b-054c-4910-a132-72273c541948@radxa.com>
 <caf44ce9-48ec-45b4-b633-3a49b7705b1e@packett.cool>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <caf44ce9-48ec-45b4-b633-3a49b7705b1e@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: N4ZILu3POr3OXF1PuzZFi/STzd/ukakWMM0s/7fIqBXEYEc7Rv5uuuMZ
	9qZo+Yg5FzVdV8Hb+RsRGffrgnIMvhPhT+NyqYqxPDOLeHE0B+VtYCtEbod/GAua+GlohmM
	7VWwq7sP2AjKsfRJ/0tHb6I7YrFTuJ9FwpOBz4cDZHa/tNnvqvu8p/+i+ktaQtcI/ktDpyU
	EzrZcMWzu1+dElJ+U0bTXqgyPf69tUWV33o88EbJF1tV15prnbXBhLYQqAWpVda4JsTPN3/
	8EMICTL/cN0ud+qDOluiVJjqDpO2ExRks4O9cGaGYbjbaXJsZPbaOd+ULrhRadwTGWatN4j
	pY63v1r/zVywvfSn12ZzMWkrgkEg9eah6tkx7RMf8zWimXxsJ+JUe1jOkDkOWf1jco7gaHU
	yd2yP/BJm6Lq3eJgwmY3czNHrFNXm0Rr0K+sB3PSxYY9xCihQoV5r+a2XiC31XRbrccA/Ws
	fc9t4e6JY67ut69hg+bQQFecdaH1EEo9FrzY7TWWW4Nqiv+kEVYXvbFqUfianbOztQeTk8G
	9f+wilblrmw36nWfLb3uPubYUx3AVpVmtTRPGirSMKgUA052XimWM5CWil4Vs7n423g59yI
	ktrFUOrOp5MhrVxSL6g1qHtHFoX3g3TSENDfctgA7C+t8d6FjXOXjUmjDeOZXz3ZXbfM1s+
	dLniZCuHhOWwEt5Ae/MfR299QFFAPqJWbFTdvuo/wI1/Pr5LoMpv9g7/f9d1odXFtSD2CXB
	ZA7S9p7PhqKy/+CMTTelq9I3hIQOdMTRbrS5XLhR0Kx2cpT12VxHmUKg84Y5XMx+B6URqF6
	bFH3lyjVjyIIfwOJQCOlSl00p9bgllYIQnTmzIf2wySmnf17E9ZvUGZQwnVdmHA/6kw7WMW
	e//dHyd9TO5Wek6+q6686qk4SVbrVy0ppcn44fbyxgiBVIDsWchE8CVkN85FDwPHT8Nxl1n
	Q5JgBHr4iWB8KPEfHjIPi1tl0wFgELP6RjPLRtFGHvGM+sJrCOzRAKK+UmArJUSm4dXVMcE
	11Vgxo0WQSQR8kXu5PpZY4cmrBwiY=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

On 1/12/2026 3:54 PM, Val Packett wrote:
> 
> On 1/12/26 3:31 AM, Xilin Wu wrote:
>> On 5/7/2025 9:38 AM, Jessica Zhang wrote:
>>> Filter out modes that have a clock rate greater than the max core clock
>>> rate when adjusted for the perf clock factor
>>>
>>> This is especially important for chipsets such as QCS615 that have lower
>>> limits for the MDP max core clock.
>>>
>>> Since the core CRTC clock is at least the mode clock (adjusted for the
>>> perf clock factor) [1], the modes supported by the driver should be less
>>> than the max core clock rate.
>>>
>>> [1] https://elixir.bootlin.com/linux/v6.12.4/source/drivers/gpu/drm/ 
>>> msm/disp/dpu1/dpu_core_perf.c#L83
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>>> ---
>>
>> Hi. This patch effectively filters out the 3840x2160@120Hz mode on 
>> SC8280XP CRD. The calculated adjusted_mode_clk is 623700, which 
>> slightly exceeds the supported max core clock of 600000.
>>
>> However, 4K 120Hz works flawlessly with the limit removed on this 
>> platform. I even tried connecting two 4K 120Hz displays, and they can 
>> work properly simultaneously. Is it possible to bring back support for 
>> this mode, or adjust the limits? 
> 
> hm, interestingly on X1E80100 we didn't hit *that* limit, 
> the adjusted_mode_clk (576318) was only above what disp_cc_mdss_mdp_clk 
> was set to (575000), and reducing the clk_inefficiency_factor from 105 
> to 104 was enough to lower it.
> 
> https://gitlab.freedesktop.org/drm/msm/-/issues/38#note_3216051
> 
> I guess it's also sink dependent, like if the mode for some monitors has 
> much more front/back porch etc.? What's the entire modeline that 
> resulted in 623700?
> 
> ~val
> 
> 

The modeline here is "3840x2160": 120 1188000 3840 4016 4104 4400 2160 
2168 2178 2250 0x40 0x5

1188000 / 2 = 594000
594000 * 1.05 = 623700

-- 
Best regards,
Xilin Wu <sophon@radxa.com>

