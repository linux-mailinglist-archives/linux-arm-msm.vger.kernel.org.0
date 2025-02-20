Return-Path: <linux-arm-msm+bounces-48765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA407A3E787
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 23:32:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B974C19C4388
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 22:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20992264F9C;
	Thu, 20 Feb 2025 22:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lll1Todw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659E91EF08F
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 22:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740090713; cv=none; b=IeUpoCATAAWFQmTTcg0unQSiLXywZCQ1J/AzP4US0ruo8AuFoa0BOehkBprLzjTFaJOHbG7cx+IfSlxn7Z2lpVg5yY1HsKPpM8GzYWo2LLk9Jl6w+4NYma9v92m+3j/8Ep37Re+2CB1kSs3pnut6v5w4fmejhFwMqu4lez67K8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740090713; c=relaxed/simple;
	bh=UJmwKwS5vpUchWSHj3fBjoBfKVUKvqAkuif3rzQLzcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yp42i8uYu309R522bjHbRKuFGB1wAnF2kaymfzS1PJ5odREj6xsvZDGH/0OJ+13zgdoEdFDl/GOM8xilRXGsdJdIRZoh47cf45EMroqY9IY4I31BY8bNQ9H+4wO3NOGjtN14EMIfSWUlnRxvWS/pRnCAKPLGDFStwFgjgITzqzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lll1Todw; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38f2b7ce2f3so1107696f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 14:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740090707; x=1740695507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eNSunc2N3UfKB+pU9gO6Fl69CrsNc7AgcIOuTSeCfNA=;
        b=lll1TodwxKznv0M6sCVazTgrUA+/6Y9pEwa9Fhy/M8m98rbZSWWW9Jdp6iH6wbhpBS
         gpI8JvV0+NjSWY9qvdUc+ZCcSyOgleVlHD8OADPbfX4n9n6OyO0lvXMJdrbdiIT8gLFR
         eqRchysGgYdXWvCy0PjIlN6JapLAEVNEbpga8zZv6QoqvQmZKs4+pPGfiVuXXGAmqsqf
         Q9boVtGEKyi1HZl8pSorNTniDtPpaGeYngFt2ST5xrqOw5Eu1GOY5sMrRKZ2B7G2avwM
         /ceDxsEL+DDALjNuDFiP85H2T/Yaorf1lIPCIK75Wy+aAv12j1J0oxeDtItujbg7mMDm
         WKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740090707; x=1740695507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eNSunc2N3UfKB+pU9gO6Fl69CrsNc7AgcIOuTSeCfNA=;
        b=kgjy5S2z7W4Ff9InUujQLojZtVCIZfBS04LUnX/gJl4z53Fk3QOutpzJoXmo4x5akp
         BNbjOVo5DTJnFHMCyXeErMthClOjkKxq4vd11p3Gx7q6g3SppyFkZfZr0pZajuV1X8Hg
         1r06y+kLlA3wOS1T4lcRE4N+C9rK8kzRhz4W6xxiM9ymp34CtsACH/TQwTV9dBPIUu5w
         dLonsbH1xs302ZWZ9EXYFxKfojaFIWvbk3cD21HntGReGt1Yw2BM/JyHkYTvNMDEnr8c
         Uxm+OGmh4SNUEljg8wOWXXbDh+pklM+LQOwB5d6fVKDLRnUFvw1X0m5wf6O4CKKTrT78
         g3gg==
X-Forwarded-Encrypted: i=1; AJvYcCVlK1uAYly9alOAad/8qnGQyPm5HqkDjAtvy2xOlPhD+Ult3m1z4LhiwryhUyW9Z/L8PTnfhulAXqKVaYcK@vger.kernel.org
X-Gm-Message-State: AOJu0YzsRaWCUvgvS4xHIo4YiqYn3M74CNTyrEwOyaPzh7JUdJMbbdRv
	nffK9hbrrSdQjhLkI6XlCmQ7Yc/uxuaIUS8xUD8nwuM2Bdwv7Gd3OlQysocMLH0=
X-Gm-Gg: ASbGncvgr7I4sBvEzviS3fyuhffYb9pyQuMTh4y85rC2gZ9HAyNvOUjk7qqJnGG1kG7
	ff4Z0WmxqSFZC2WioycsCl/xpTsZr4VvMqUd5hcAJCRCsw+dRe96gsMTLKllxh+PZb8yA/eCNWD
	LqpmBsuvuCczsQIE3xUbggpPYL9nwuJtzf8HJtr6UQc2wIt3Xc/LmS5+SIMcVOP7pwS5dLLFfFl
	dGJf+VqIE4JJpkVp6rjRQHIGnLe6ap3XcN78vTiG0tcrEvDexl2qr7S1hDjbykkHzDfcigSm7hV
	QwOuNjmIhLsB54JhWiCKqelB53IbR0VrvzLmzee59aumw8lNUgnmMDTZ
X-Google-Smtp-Source: AGHT+IEnKDgvKIxrYwHIuE0TSXPZDATcRdaThIittakC0csdPszVUOy99MpJ3/OgKLd+tYoBJ8gvqg==
X-Received: by 2002:adf:e309:0:b0:38f:2b59:b550 with SMTP id ffacd0b85a97d-38f70857b6bmr283487f8f.50.1740090706474;
        Thu, 20 Feb 2025 14:31:46 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4398a44264csm115810795e9.25.2025.02.20.14.31.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 14:31:46 -0800 (PST)
Message-ID: <6b0684a0-a519-463f-b7be-176a4752a786@linaro.org>
Date: Thu, 20 Feb 2025 22:31:44 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: qcom: videocc: Add support to attach multiple
 power domains
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com>
 <20250218-videocc-pll-multi-pd-voting-v1-4-cfe6289ea29b@quicinc.com>
 <eec2869a-fa8f-4aaf-9fc5-e7a8baf0f864@linaro.org>
 <huluiiaqmunvmffoqadrhssd3kl2toutqtcw7rzamv3sqdglsf@7lz66x4sj3gv>
 <d4c4ecf0-9094-4341-8711-78a48e5d1344@linaro.org>
 <d444f1fb-42a0-48ef-83bc-d5aab9282b22@quicinc.com>
 <gzjyyl2kzv52zsewn5zf6ei65fymyi4pspvsmsjaqj5sklfxvc@bkg46saulni5>
 <fcc31cc7-67bd-4102-a53f-ebe66b4fd1a7@linaro.org>
 <3da96df2-1127-49bf-8114-282cc488c194@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <3da96df2-1127-49bf-8114-282cc488c194@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20/02/2025 07:15, Jagadeesh Kona wrote:
> 
> 
> On 2/19/2025 5:37 PM, Bryan O'Donoghue wrote:
>> On 19/02/2025 11:59, Dmitry Baryshkov wrote:
>>> On Wed, Feb 19, 2025 at 05:11:03PM +0530, Jagadeesh Kona wrote:
>>>>
>>>>
>>>> On 2/19/2025 6:51 AM, Bryan O'Donoghue wrote:
>>>>> On 18/02/2025 17:19, Dmitry Baryshkov wrote:
>>>>>> On Tue, Feb 18, 2025 at 03:46:15PM +0000, Bryan O'Donoghue wrote:
>>>>>>> On 18/02/2025 14:26, Jagadeesh Kona wrote:
>>>>>>>> During boot-up, the PLL configuration might be missed even after
>>>>>>>> calling pll_configure() from the clock controller probe. This can
>>>>>>>> happen because the PLL is connected to one or more rails that are
>>>>>>>> turned off, and the current clock controller code cannot enable
>>>>>>>> multiple rails during probe. Consequently, the PLL may be activated
>>>>>>>> with suboptimal settings, causing functional issues.
>>>>>>>>
>>>>>>>> To properly configure the video PLLs in the probe on SM8450, SM8475,
>>>>>>>> SM8550, and SM8650 platforms, the MXC rail must be ON along with MMCX.
>>>>>>>> Therefore, add support to attach multiple power domains to videocc on
>>>>>>>> these platforms.
>>>>>>>>
>>>>>>>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>>>>>>>> ---
>>>>>>>>      drivers/clk/qcom/videocc-sm8450.c | 4 ++++
>>>>>>>>      drivers/clk/qcom/videocc-sm8550.c | 4 ++++
>>>>>>>>      2 files changed, 8 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/clk/qcom/videocc-sm8450.c b/drivers/clk/qcom/videocc-sm8450.c
>>>>>>>> index f26c7eccb62e7eb8dbd022e2f01fa496eb570b3f..b50a14547336580de88a741f1d33b126e9daa848 100644
>>>>>>>> --- a/drivers/clk/qcom/videocc-sm8450.c
>>>>>>>> +++ b/drivers/clk/qcom/videocc-sm8450.c
>>>>>>>> @@ -437,6 +437,10 @@ static int video_cc_sm8450_probe(struct platform_device *pdev)
>>>>>>>>          struct regmap *regmap;
>>>>>>>>          int ret;
>>>>>>>> +    ret = qcom_cc_attach_pds(&pdev->dev, &video_cc_sm8450_desc);
>>>>>>>> +    if (ret)
>>>>>>>> +        return ret;
>>>>>>>> +
>>>>>>>>          ret = devm_pm_runtime_enable(&pdev->dev);
>>>>>>>>          if (ret)
>>>>>>>>              return ret;
>>>>>>>> diff --git a/drivers/clk/qcom/videocc-sm8550.c b/drivers/clk/qcom/videocc-sm8550.c
>>>>>>>> index 7c25a50cfa970dff55d701cb24bc3aa5924ca12d..d4b223d1392f0721afd1b582ed35d5061294079e 100644
>>>>>>>> --- a/drivers/clk/qcom/videocc-sm8550.c
>>>>>>>> +++ b/drivers/clk/qcom/videocc-sm8550.c
>>>>>>>> @@ -542,6 +542,10 @@ static int video_cc_sm8550_probe(struct platform_device *pdev)
>>>>>>>>          int ret;
>>>>>>>>          u32 sleep_clk_offset = 0x8140;
>>>>>>>> +    ret = qcom_cc_attach_pds(&pdev->dev, &video_cc_sm8550_desc);
>>>>>>>> +    if (ret)
>>>>>>>> +        return ret;
>>>>>>>> +
>>>>>>>>          ret = devm_pm_runtime_enable(&pdev->dev);
>>>>>>>>          if (ret)
>>>>>>>>              return ret;
>>>>>>>>
>>>>>>>
>>>>>>> What's the difference between doing the attach here or doing it in
>>>>>>> really_probe() ?
>>>>>>
>>>>>> I'd second this. If the domains are to be attached before calling any
>>>>>> other functions, move the call to the qcom_cc_map(), so that all drivers
>>>>>> get all domains attached before configuring PLLs instead of manually
>>>>>> calling the function.
>>>>>>
>>>>>>> There doesn't seem to be any difference except that we will have an
>>>>>>> additional delay introduced.
>>>>>>>
>>>>>>> Are you describing a race condition ?
>>>>>>>
>>>>>>> I don't see _logic_ here to moving the call into the controller's higher
>>>>>>> level probe.
>>>>>>>
>>>>>>> Can you describe some more ?
>>>>>>>
>>>>>>> ---
>>>>>>> bod
>>>>>>
>>>>>
>>>>> Here's one way this could work
>>>>>
>>>>> Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>>> Date:   Tue Feb 18 19:46:55 2025 +0000
>>>>>
>>>>>       clk: qcom: common: Add configure_plls callback prototype
>>>>>
>>>>>       Add a configure_plls() callback so that we can stage qcom_cc_attach_pds()
>>>>>       before configuring PLLs and ensure that the power-domain rail list is
>>>>>       switched on prior to configuring PLLs.
>>>>>
>>>>>       Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>>>
>>>>> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
>>>>> index 9e3380fd71819..1924130814600 100644
>>>>> --- a/drivers/clk/qcom/common.c
>>>>> +++ b/drivers/clk/qcom/common.c
>>>>> @@ -304,6 +304,9 @@ int qcom_cc_really_probe(struct device *dev,
>>>>>           if (ret < 0 && ret != -EEXIST)
>>>>>                   return ret;
>>>>>
>>>>> +       if (desc->configure_plls)
>>>>> +               desc->configure_plls(regmap);
>>>>> +
>>>>>           reset = &cc->reset;
>>>>>           reset->rcdev.of_node = dev->of_node;
>>>>>           reset->rcdev.ops = &qcom_reset_ops;
>>>>> diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
>>>>> index 7ace5d7f5836a..4955085ff8669 100644
>>>>> --- a/drivers/clk/qcom/common.h
>>>>> +++ b/drivers/clk/qcom/common.h
>>>>> @@ -38,6 +38,7 @@ struct qcom_cc_desc {
>>>>>           const struct qcom_icc_hws_data *icc_hws;
>>>>>           size_t num_icc_hws;
>>>>>           unsigned int icc_first_node_id;
>>>>> +       void (*configure_plls)(struct regmap *regmap);
>>>>>    };
>>>>>
>>>>> and
>>>>>
>>>>> % git diff drivers/clk/qcom/camcc-x1e80100.c
>>>>> diff --git a/drivers/clk/qcom/camcc-x1e80100.c b/drivers/clk/qcom/camcc-x1e80100.c
>>>>> index b73524ae64b1b..c9748d1f8a15b 100644
>>>>> --- a/drivers/clk/qcom/camcc-x1e80100.c
>>>>> +++ b/drivers/clk/qcom/camcc-x1e80100.c
>>>>> @@ -2426,6 +2426,21 @@ static const struct regmap_config cam_cc_x1e80100_regmap_config = {
>>>>>           .fast_io = true,
>>>>>    };
>>>>>
>>>>> +static void cam_cc_x1e80100_configure_plls(struct regmap *regmap)
>>>>> +{
>>>>> +       clk_lucid_ole_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
>>>>> +       clk_lucid_ole_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
>>>>> +       clk_rivian_evo_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_config);
>>>>> +       clk_lucid_ole_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
>>>>> +       clk_lucid_ole_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_config);
>>>>> +       clk_lucid_ole_pll_configure(&cam_cc_pll6, regmap, &cam_cc_pll6_config);
>>>>> +       clk_lucid_ole_pll_configure(&cam_cc_pll8, regmap, &cam_cc_pll8_config);
>>>>> +
>>>>> +       /* Keep clocks always enabled */
>>>>> +       qcom_branch_set_clk_en(regmap, 0x13a9c); /* CAM_CC_GDSC_CLK */
>>>>> +       qcom_branch_set_clk_en(regmap, 0x13ab8); /* CAM_CC_SLEEP_CLK */
>>>>> +}
>>>>> +
>>>>>    static const struct qcom_cc_desc cam_cc_x1e80100_desc = {
>>>>>           .config = &cam_cc_x1e80100_regmap_config,
>>>>>           .clks = cam_cc_x1e80100_clocks,
>>>>> @@ -2434,6 +2449,7 @@ static const struct qcom_cc_desc cam_cc_x1e80100_desc = {
>>>>>           .num_resets = ARRAY_SIZE(cam_cc_x1e80100_resets),
>>>>>           .gdscs = cam_cc_x1e80100_gdscs,
>>>>>           .num_gdscs = ARRAY_SIZE(cam_cc_x1e80100_gdscs),
>>>>> +       .configure_plls = cam_cc_x1e80100_configure_plls,
>>>>>    };
>>>>>
>>>>>    static const struct of_device_id cam_cc_x1e80100_match_table[] = {
>>>>> @@ -2461,18 +2477,6 @@ static int cam_cc_x1e80100_probe(struct platform_device *pdev)
>>>>>                   return PTR_ERR(regmap);
>>>>>           }
>>>>>
>>>>> -       clk_lucid_ole_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
>>>>> -       clk_lucid_ole_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
>>>>> -       clk_rivian_evo_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_config);
>>>>> -       clk_lucid_ole_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
>>>>> -       clk_lucid_ole_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_config);
>>>>> -       clk_lucid_ole_pll_configure(&cam_cc_pll6, regmap, &cam_cc_pll6_config);
>>>>> -       clk_lucid_ole_pll_configure(&cam_cc_pll8, regmap, &cam_cc_pll8_config);
>>>>> -
>>>>> -       /* Keep clocks always enabled */
>>>>> -       qcom_branch_set_clk_en(regmap, 0x13a9c); /* CAM_CC_GDSC_CLK */
>>>>> -       qcom_branch_set_clk_en(regmap, 0x13ab8); /* CAM_CC_SLEEP_CLK */
>>>>> -
>>>>>           ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_x1e80100_desc, regmap);
>>>>>
>>>>>           pm_runtime_put(&pdev->dev);
>>>>>
>>>>> Or a least it works for me.
>>>>>
>>>>
>>>> This patch will not work in all cases, maybe in your case required power domains might be ON
>>>> from bootloaders so it might be working.
>>>
>>> But with his patch domains are attached before configuring the PLLs, are
>>> they not?
>>
>> Yes, its logically the same just done in core code.
>>
> 
> Yes, this code attaches domains before configuring the PLLs, but it attaches PDs after get_sync()
> is called on device. As I mentioned in other patch earlier, if we attach PDS after get_sync() is
> already called on device, then power domains are not getting enabled during the probe, leading to
> the same improper PLL configuration issue. But the current patch series posted will fix this issue
> 
>>>>
>>>>> New clock controllers would then use this callback mechanism and potentially all of the controllers to have uniformity.
>>>>>
>>>>
>>>> No, above approach also requires changes in each individual clock driver to define the callback. So I don't see any advantage
>>>> with this than the current approach.
>>>
>>> Bryan's proposal moves us towards having a common code, so it's better.
>>>
>>
>> I can take the time to do the whole sweep and publish a RFC.
>>
> 
> Yes, but moving the PLL configuration to callback will not solve the actual PLL configuration
> issue being discussed here.
> 
> Thanks,
> Jagadeesh
> 

Right what you are really saying is that the power-rails for the clock 
controller need to remain always on at the moment.

Where we can zap the GDSCs the power-rails for the block should be 
always on because the initial PLL configuration we typically do in 
probe() would be negated as soon as the power rail for the block is 
switched off.

True.

In my opinion:

- We should only do the pd list addition in one place
   Either that or push it into each driver.

   I don't favour doing it in each driver since it is boilerplate
   code that we basically just end up copy/pasting again and again.

- We can start off by only including a configure_pll callback
   for the 2-3 blocks where we know we have multiple rails

This here works well for me on x1e:

Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date:   Tue Feb 18 19:46:55 2025 +0000

     clk: qcom: common: Add configure_plls callback prototype

     Add a configure_plls() callback so that we can stage 
qcom_cc_attach_pds()
     before configuring PLLs and ensure that the power-domain rail list is
     switched on prior to configuring PLLs.

     Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 9e3380fd71819..4aa00ad51c2f6 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -304,6 +304,12 @@ int qcom_cc_really_probe(struct device *dev,
         if (ret < 0 && ret != -EEXIST)
                 return ret;

+       if (desc->configure_plls) {
+               ret = desc->configure_plls(dev, desc, regmap);
+               if (ret)
+                       return ret;
+       }
+
         reset = &cc->reset;
         reset->rcdev.of_node = dev->of_node;
         reset->rcdev.ops = &qcom_reset_ops;
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 7ace5d7f5836a..77002e39337d7 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -38,6 +38,9 @@ struct qcom_cc_desc {
         const struct qcom_icc_hws_data *icc_hws;
         size_t num_icc_hws;
         unsigned int icc_first_node_id;
+       int (*configure_plls)(struct device *dev,
+                             const struct qcom_cc_desc *desc,
+                             struct regmap *regmap);
  };

+static int cam_cc_x1e80100_configure_plls(struct device *dev,
+                                         const struct qcom_cc_desc *desc,
+                                         struct regmap *regmap)
+{
+       int ret;
+
+       ret = devm_pm_runtime_enable(dev);
+       if (ret)
+               return ret;
+
+       ret = pm_runtime_resume_and_get(dev);
+       if (ret)
+               return ret;
+
+       clk_lucid_ole_pll_configure(&cam_cc_pll0, regmap, 
&cam_cc_pll0_config);
+       clk_lucid_ole_pll_configure(&cam_cc_pll1, regmap, 
&cam_cc_pll1_config);
+       clk_rivian_evo_pll_configure(&cam_cc_pll2, regmap, 
&cam_cc_pll2_config);
+       clk_lucid_ole_pll_configure(&cam_cc_pll3, regmap, 
&cam_cc_pll3_config);
+       clk_lucid_ole_pll_configure(&cam_cc_pll4, regmap, 
&cam_cc_pll4_config);
+       clk_lucid_ole_pll_configure(&cam_cc_pll6, regmap, 
&cam_cc_pll6_config);
+       clk_lucid_ole_pll_configure(&cam_cc_pll8, regmap, 
&cam_cc_pll8_config);
+
+       /* Keep clocks always enabled */
+       qcom_branch_set_clk_en(regmap, 0x13a9c); /* CAM_CC_GDSC_CLK */
+       qcom_branch_set_clk_en(regmap, 0x13ab8); /* CAM_CC_SLEEP_CLK */
+
+       pm_runtime_put(dev);
+
+       return 0;
+}
+
  static const struct qcom_cc_desc cam_cc_x1e80100_desc = {
         .config = &cam_cc_x1e80100_regmap_config,
         .clks = cam_cc_x1e80100_clocks,
@@ -2434,6 +2465,7 @@ static const struct qcom_cc_desc 
cam_cc_x1e80100_desc = {
         .num_resets = ARRAY_SIZE(cam_cc_x1e80100_resets),
         .gdscs = cam_cc_x1e80100_gdscs,
         .num_gdscs = ARRAY_SIZE(cam_cc_x1e80100_gdscs),
+       .configure_plls = cam_cc_x1e80100_configure_plls,
  };

This has the same effect as you were alluding to and in fact we could 
probably even move the pm_runtime_enable/resume_and_get and 
pm_runtime_put into really_probe().

It seems to me anyway we should try to push as much of this into core 
logic to be reused as possible.

---
bod

