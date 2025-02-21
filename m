Return-Path: <linux-arm-msm+bounces-48881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7821A3F468
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 13:32:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4B363BE6EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 12:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E754120ADC9;
	Fri, 21 Feb 2025 12:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e3uZI1jz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FF71E9B0D
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 12:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740141159; cv=none; b=cnBt+MBhQTPUKCQXXk+LZD+SO1sqRFuGU+kaBpfOCG6nq4ufob9bYeEWGVEb4AOaSQVMid8njAoTY0nWS+YRBboYcUOSfNc6QtzlbfX14dqL9kp7NxlmdKtDLumJsJpYbGYGqL8OJmVN0LUQz+eHXkHyoDyZb7jT3Y7qJm7/xH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740141159; c=relaxed/simple;
	bh=Zp7Aa4jFSlh4ElbTt2xJbxRu0SjM9VnnwLMLWXV97Ko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NBC9KFTrQYgaCfUgpDUczME/6vK1kUzZOKVTFCrmLhbFatJTMS93vJodjHSEkNzgy/K7Ck0Dtm0OZ89+EPQH1p1B5qe+s8wDPz38kPWCa36L7T5djwVG+jHoVPUrejFMZLX3UCkD4Cr569h6lUZyft9AbN3dXAIIB2uJpjwLTXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e3uZI1jz; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so14036825e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 04:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740141156; x=1740745956; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D359ivOE2zxHlaoHqwZgIwaRsgi4PQ/YmLwVS7Y57+A=;
        b=e3uZI1jzDE5cDRtS1Bi4caUDwPaMBkxlRsYmaIsDgKY+MCP7cdg1KL6I7oqwyCh4Fx
         c1LlrEE+icGANwbwxerovDnKeeEGbrzvKnUeyLkEfpso/ZDeqVHU2rHpGm0olvibnelf
         EKMaMuLfGGo0EOvos4h9/Ts1L3vr0f/BVWUU+QPB07tEoiT8rrji4iuMyxmpmOcNf3FK
         satXT57IhPR0sHpeVlHEaXlEbaz6NY3I4d6K1f2ACBrvAZWowNmGC2XHp0teH0zAl2pC
         ptNlpd7G4rMs9Jipp3J2LCBXbpd/FBKSR2OlmjPyy4pM48N6e0DtQVuHQcfURDgU24M+
         dBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740141156; x=1740745956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D359ivOE2zxHlaoHqwZgIwaRsgi4PQ/YmLwVS7Y57+A=;
        b=cLlX3+7qcLCRyH98BKFN2VqRwiBizF/0dwSEQXsW7d4XFRVcLUIvXEnrtzqFyRF4L7
         nOnk8KCJXH0JuwmP6hfjiZf+rq5IxTYygKxz3H96Klbbg7lh4V3MG5iaLMi3M+LSOAo+
         5rqHPxxIoa7Sba+D/Xf6Uuosi3HfcSv9lCK5+3I2dig3Lk+9MP00SxtDKWGq4t5lT61z
         6kjyCF//UTWmOn41+XXyl8Qu3oJNqjdFXwFHUohFaSqyyOApS44KTti+9v4gf9D3+Nxt
         wLPX0s2I5pJ6kkMLeGWVsiyBSpx+0EZkwbncysiP5wC7hI3KpoAc7PHZCHE3SK2lA/XM
         FfEw==
X-Forwarded-Encrypted: i=1; AJvYcCXPrn4x47NMn3ctcxN1Pi+XTQXPMFoqIb/SHF+3nBvwI5lLZ7zaE6XWDasAMnk2iZ2rFjPTmv69GgRmX7iz@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/NGc7UK298iFow5Blrb2pBhYZ74FeylhRZnin23GJqwTWQr0w
	Os4gXBqeOGFkU18lEcIDrOj5jAXE7Nc52pXgutoayA5CQviG6Kah8U5H2MiHstc=
X-Gm-Gg: ASbGncvegA0hHn3MjX09SzXv/GfwGe/h21iP+H7ZapV5bKLNLG5nohEHfmWfs2nCNrF
	sTaEQeahXhZvcP8eBf31EkF6uChyhU6GMPqa1BHMB3bEvOyE4taEbaKuGeTSrGAZRk/1tICAexr
	j6ZOowIc4+0wdjZud5WEEJjniDuBIMXGOCc5W51r1/gBXarW/bFHSp5xTrCNBOXgyr/txJrwwhp
	gD1mPbFarNzS2fNLFv6lx5hPzO+pGGXWN9F03cuEhquHSahAomWqK7tjKdwUNNWd+RTka1w1ATu
	+rBnNNFPBB1vFGOHbHb++0SoNk7wnh1uU2aDHKrG6GSDJq02vj+VMf0L2lF+MytdGmU=
X-Google-Smtp-Source: AGHT+IFpMF36oztzt9CHoXp+fN1X7pMda6Y5lLxejhPdgK3kD9Sax6us3ykZL8UDbJlOJAqDYAFgFw==
X-Received: by 2002:a05:600c:1c08:b0:434:f0df:9f6 with SMTP id 5b1f17b1804b1-439ae1d97fbmr26062225e9.3.1740141155447;
        Fri, 21 Feb 2025 04:32:35 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b0132a6asm16604865e9.0.2025.02.21.04.32.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 04:32:34 -0800 (PST)
Message-ID: <b1cf82bf-90a1-4b87-b392-b1f186e97a7c@linaro.org>
Date: Fri, 21 Feb 2025 12:32:33 +0000
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
 <6b0684a0-a519-463f-b7be-176a4752a786@linaro.org>
 <e9bbf39c-dde7-4ace-b134-da15ca092c6a@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <e9bbf39c-dde7-4ace-b134-da15ca092c6a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/02/2025 11:43, Jagadeesh Kona wrote:
> 
> 
> On 2/21/2025 4:01 AM, Bryan O'Donoghue wrote:
>> On 20/02/2025 07:15, Jagadeesh Kona wrote:
>>>
>>>
>>> On 2/19/2025 5:37 PM, Bryan O'Donoghue wrote:
>>>> On 19/02/2025 11:59, Dmitry Baryshkov wrote:
>>>>> On Wed, Feb 19, 2025 at 05:11:03PM +0530, Jagadeesh Kona wrote:
>>>>>>
>>>>>>
>>>>>> On 2/19/2025 6:51 AM, Bryan O'Donoghue wrote:
>>>>>>> On 18/02/2025 17:19, Dmitry Baryshkov wrote:
>>>>>>>> On Tue, Feb 18, 2025 at 03:46:15PM +0000, Bryan O'Donoghue wrote:
>>>>>>>>> On 18/02/2025 14:26, Jagadeesh Kona wrote:
>>>>>>>>>> During boot-up, the PLL configuration might be missed even after
>>>>>>>>>> calling pll_configure() from the clock controller probe. This can
>>>>>>>>>> happen because the PLL is connected to one or more rails that are
>>>>>>>>>> turned off, and the current clock controller code cannot enable
>>>>>>>>>> multiple rails during probe. Consequently, the PLL may be activated
>>>>>>>>>> with suboptimal settings, causing functional issues.
>>>>>>>>>>
>>>>>>>>>> To properly configure the video PLLs in the probe on SM8450, SM8475,
>>>>>>>>>> SM8550, and SM8650 platforms, the MXC rail must be ON along with MMCX.
>>>>>>>>>> Therefore, add support to attach multiple power domains to videocc on
>>>>>>>>>> these platforms.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>>>>>>>>>> ---
>>>>>>>>>>       drivers/clk/qcom/videocc-sm8450.c | 4 ++++
>>>>>>>>>>       drivers/clk/qcom/videocc-sm8550.c | 4 ++++
>>>>>>>>>>       2 files changed, 8 insertions(+)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/clk/qcom/videocc-sm8450.c b/drivers/clk/qcom/videocc-sm8450.c
>>>>>>>>>> index f26c7eccb62e7eb8dbd022e2f01fa496eb570b3f..b50a14547336580de88a741f1d33b126e9daa848 100644
>>>>>>>>>> --- a/drivers/clk/qcom/videocc-sm8450.c
>>>>>>>>>> +++ b/drivers/clk/qcom/videocc-sm8450.c
>>>>>>>>>> @@ -437,6 +437,10 @@ static int video_cc_sm8450_probe(struct platform_device *pdev)
>>>>>>>>>>           struct regmap *regmap;
>>>>>>>>>>           int ret;
>>>>>>>>>> +    ret = qcom_cc_attach_pds(&pdev->dev, &video_cc_sm8450_desc);
>>>>>>>>>> +    if (ret)
>>>>>>>>>> +        return ret;
>>>>>>>>>> +
>>>>>>>>>>           ret = devm_pm_runtime_enable(&pdev->dev);
>>>>>>>>>>           if (ret)
>>>>>>>>>>               return ret;
>>>>>>>>>> diff --git a/drivers/clk/qcom/videocc-sm8550.c b/drivers/clk/qcom/videocc-sm8550.c
>>>>>>>>>> index 7c25a50cfa970dff55d701cb24bc3aa5924ca12d..d4b223d1392f0721afd1b582ed35d5061294079e 100644
>>>>>>>>>> --- a/drivers/clk/qcom/videocc-sm8550.c
>>>>>>>>>> +++ b/drivers/clk/qcom/videocc-sm8550.c
>>>>>>>>>> @@ -542,6 +542,10 @@ static int video_cc_sm8550_probe(struct platform_device *pdev)
>>>>>>>>>>           int ret;
>>>>>>>>>>           u32 sleep_clk_offset = 0x8140;
>>>>>>>>>> +    ret = qcom_cc_attach_pds(&pdev->dev, &video_cc_sm8550_desc);
>>>>>>>>>> +    if (ret)
>>>>>>>>>> +        return ret;
>>>>>>>>>> +
>>>>>>>>>>           ret = devm_pm_runtime_enable(&pdev->dev);
>>>>>>>>>>           if (ret)
>>>>>>>>>>               return ret;
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> What's the difference between doing the attach here or doing it in
>>>>>>>>> really_probe() ?
>>>>>>>>
>>>>>>>> I'd second this. If the domains are to be attached before calling any
>>>>>>>> other functions, move the call to the qcom_cc_map(), so that all drivers
>>>>>>>> get all domains attached before configuring PLLs instead of manually
>>>>>>>> calling the function.
>>>>>>>>
>>>>>>>>> There doesn't seem to be any difference except that we will have an
>>>>>>>>> additional delay introduced.
>>>>>>>>>
>>>>>>>>> Are you describing a race condition ?
>>>>>>>>>
>>>>>>>>> I don't see _logic_ here to moving the call into the controller's higher
>>>>>>>>> level probe.
>>>>>>>>>
>>>>>>>>> Can you describe some more ?
>>>>>>>>>
>>>>>>>>> ---
>>>>>>>>> bod
>>>>>>>>
>>>>>>>
>>>>>>> Here's one way this could work
>>>>>>>
>>>>>>> Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>>>>> Date:   Tue Feb 18 19:46:55 2025 +0000
>>>>>>>
>>>>>>>        clk: qcom: common: Add configure_plls callback prototype
>>>>>>>
>>>>>>>        Add a configure_plls() callback so that we can stage qcom_cc_attach_pds()
>>>>>>>        before configuring PLLs and ensure that the power-domain rail list is
>>>>>>>        switched on prior to configuring PLLs.
>>>>>>>
>>>>>>>        Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>>>>>>
>>>>>>> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
>>>>>>> index 9e3380fd71819..1924130814600 100644
>>>>>>> --- a/drivers/clk/qcom/common.c
>>>>>>> +++ b/drivers/clk/qcom/common.c
>>>>>>> @@ -304,6 +304,9 @@ int qcom_cc_really_probe(struct device *dev,
>>>>>>>            if (ret < 0 && ret != -EEXIST)
>>>>>>>                    return ret;
>>>>>>>
>>>>>>> +       if (desc->configure_plls)
>>>>>>> +               desc->configure_plls(regmap);
>>>>>>> +
>>>>>>>            reset = &cc->reset;
>>>>>>>            reset->rcdev.of_node = dev->of_node;
>>>>>>>            reset->rcdev.ops = &qcom_reset_ops;
>>>>>>> diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
>>>>>>> index 7ace5d7f5836a..4955085ff8669 100644
>>>>>>> --- a/drivers/clk/qcom/common.h
>>>>>>> +++ b/drivers/clk/qcom/common.h
>>>>>>> @@ -38,6 +38,7 @@ struct qcom_cc_desc {
>>>>>>>            const struct qcom_icc_hws_data *icc_hws;
>>>>>>>            size_t num_icc_hws;
>>>>>>>            unsigned int icc_first_node_id;
>>>>>>> +       void (*configure_plls)(struct regmap *regmap);
>>>>>>>     };
>>>>>>>
>>>>>>> and
>>>>>>>
>>>>>>> % git diff drivers/clk/qcom/camcc-x1e80100.c
>>>>>>> diff --git a/drivers/clk/qcom/camcc-x1e80100.c b/drivers/clk/qcom/camcc-x1e80100.c
>>>>>>> index b73524ae64b1b..c9748d1f8a15b 100644
>>>>>>> --- a/drivers/clk/qcom/camcc-x1e80100.c
>>>>>>> +++ b/drivers/clk/qcom/camcc-x1e80100.c
>>>>>>> @@ -2426,6 +2426,21 @@ static const struct regmap_config cam_cc_x1e80100_regmap_config = {
>>>>>>>            .fast_io = true,
>>>>>>>     };
>>>>>>>
>>>>>>> +static void cam_cc_x1e80100_configure_plls(struct regmap *regmap)
>>>>>>> +{
>>>>>>> +       clk_lucid_ole_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
>>>>>>> +       clk_lucid_ole_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
>>>>>>> +       clk_rivian_evo_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_config);
>>>>>>> +       clk_lucid_ole_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
>>>>>>> +       clk_lucid_ole_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_config);
>>>>>>> +       clk_lucid_ole_pll_configure(&cam_cc_pll6, regmap, &cam_cc_pll6_config);
>>>>>>> +       clk_lucid_ole_pll_configure(&cam_cc_pll8, regmap, &cam_cc_pll8_config);
>>>>>>> +
>>>>>>> +       /* Keep clocks always enabled */
>>>>>>> +       qcom_branch_set_clk_en(regmap, 0x13a9c); /* CAM_CC_GDSC_CLK */
>>>>>>> +       qcom_branch_set_clk_en(regmap, 0x13ab8); /* CAM_CC_SLEEP_CLK */
>>>>>>> +}
>>>>>>> +
>>>>>>>     static const struct qcom_cc_desc cam_cc_x1e80100_desc = {
>>>>>>>            .config = &cam_cc_x1e80100_regmap_config,
>>>>>>>            .clks = cam_cc_x1e80100_clocks,
>>>>>>> @@ -2434,6 +2449,7 @@ static const struct qcom_cc_desc cam_cc_x1e80100_desc = {
>>>>>>>            .num_resets = ARRAY_SIZE(cam_cc_x1e80100_resets),
>>>>>>>            .gdscs = cam_cc_x1e80100_gdscs,
>>>>>>>            .num_gdscs = ARRAY_SIZE(cam_cc_x1e80100_gdscs),
>>>>>>> +       .configure_plls = cam_cc_x1e80100_configure_plls,
>>>>>>>     };
>>>>>>>
>>>>>>>     static const struct of_device_id cam_cc_x1e80100_match_table[] = {
>>>>>>> @@ -2461,18 +2477,6 @@ static int cam_cc_x1e80100_probe(struct platform_device *pdev)
>>>>>>>                    return PTR_ERR(regmap);
>>>>>>>            }
>>>>>>>
>>>>>>> -       clk_lucid_ole_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
>>>>>>> -       clk_lucid_ole_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
>>>>>>> -       clk_rivian_evo_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_config);
>>>>>>> -       clk_lucid_ole_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
>>>>>>> -       clk_lucid_ole_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_config);
>>>>>>> -       clk_lucid_ole_pll_configure(&cam_cc_pll6, regmap, &cam_cc_pll6_config);
>>>>>>> -       clk_lucid_ole_pll_configure(&cam_cc_pll8, regmap, &cam_cc_pll8_config);
>>>>>>> -
>>>>>>> -       /* Keep clocks always enabled */
>>>>>>> -       qcom_branch_set_clk_en(regmap, 0x13a9c); /* CAM_CC_GDSC_CLK */
>>>>>>> -       qcom_branch_set_clk_en(regmap, 0x13ab8); /* CAM_CC_SLEEP_CLK */
>>>>>>> -
>>>>>>>            ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_x1e80100_desc, regmap);
>>>>>>>
>>>>>>>            pm_runtime_put(&pdev->dev);
>>>>>>>
>>>>>>> Or a least it works for me.
>>>>>>>
>>>>>>
>>>>>> This patch will not work in all cases, maybe in your case required power domains might be ON
>>>>>> from bootloaders so it might be working.
>>>>>
>>>>> But with his patch domains are attached before configuring the PLLs, are
>>>>> they not?
>>>>
>>>> Yes, its logically the same just done in core code.
>>>>
>>>
>>> Yes, this code attaches domains before configuring the PLLs, but it attaches PDs after get_sync()
>>> is called on device. As I mentioned in other patch earlier, if we attach PDS after get_sync() is
>>> already called on device, then power domains are not getting enabled during the probe, leading to
>>> the same improper PLL configuration issue. But the current patch series posted will fix this issue
>>>
>>>>>>
>>>>>>> New clock controllers would then use this callback mechanism and potentially all of the controllers to have uniformity.
>>>>>>>
>>>>>>
>>>>>> No, above approach also requires changes in each individual clock driver to define the callback. So I don't see any advantage
>>>>>> with this than the current approach.
>>>>>
>>>>> Bryan's proposal moves us towards having a common code, so it's better.
>>>>>
>>>>
>>>> I can take the time to do the whole sweep and publish a RFC.
>>>>
>>>
>>> Yes, but moving the PLL configuration to callback will not solve the actual PLL configuration
>>> issue being discussed here.
>>>
>>> Thanks,
>>> Jagadeesh
>>>
>>
>> Right what you are really saying is that the power-rails for the clock controller need to remain always on at the moment.
>>
>> Where we can zap the GDSCs the power-rails for the block should be always on because the initial PLL configuration we typically do in probe() would be negated as soon as the power rail for the block is switched off.
>>
>> True.
>>
>> In my opinion:
>>
>> - We should only do the pd list addition in one place
>>    Either that or push it into each driver.
>>
>>    I don't favour doing it in each driver since it is boilerplate
>>    code that we basically just end up copy/pasting again and again.
>>
>> - We can start off by only including a configure_pll callback
>>    for the 2-3 blocks where we know we have multiple rails
>>
>> This here works well for me on x1e:
>>
>> Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Date:   Tue Feb 18 19:46:55 2025 +0000
>>
>>      clk: qcom: common: Add configure_plls callback prototype
>>
>>      Add a configure_plls() callback so that we can stage qcom_cc_attach_pds()
>>      before configuring PLLs and ensure that the power-domain rail list is
>>      switched on prior to configuring PLLs.
>>
>>      Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>
>> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
>> index 9e3380fd71819..4aa00ad51c2f6 100644
>> --- a/drivers/clk/qcom/common.c
>> +++ b/drivers/clk/qcom/common.c
>> @@ -304,6 +304,12 @@ int qcom_cc_really_probe(struct device *dev,
>>          if (ret < 0 && ret != -EEXIST)
>>                  return ret;
>>
>> +       if (desc->configure_plls) {
>> +               ret = desc->configure_plls(dev, desc, regmap);
>> +               if (ret)
>> +                       return ret;
>> +       }
>> +
>>          reset = &cc->reset;
>>          reset->rcdev.of_node = dev->of_node;
>>          reset->rcdev.ops = &qcom_reset_ops;
>> diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
>> index 7ace5d7f5836a..77002e39337d7 100644
>> --- a/drivers/clk/qcom/common.h
>> +++ b/drivers/clk/qcom/common.h
>> @@ -38,6 +38,9 @@ struct qcom_cc_desc {
>>          const struct qcom_icc_hws_data *icc_hws;
>>          size_t num_icc_hws;
>>          unsigned int icc_first_node_id;
>> +       int (*configure_plls)(struct device *dev,
>> +                             const struct qcom_cc_desc *desc,
>> +                             struct regmap *regmap);
>>   };
>>
>> +static int cam_cc_x1e80100_configure_plls(struct device *dev,
>> +                                         const struct qcom_cc_desc *desc,
>> +                                         struct regmap *regmap)
>> +{
>> +       int ret;
>> +
>> +       ret = devm_pm_runtime_enable(dev);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret = pm_runtime_resume_and_get(dev);
>> +       if (ret)
>> +               return ret;
>> +
>> +       clk_lucid_ole_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
>> +       clk_lucid_ole_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
>> +       clk_rivian_evo_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_config);
>> +       clk_lucid_ole_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
>> +       clk_lucid_ole_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_config);
>> +       clk_lucid_ole_pll_configure(&cam_cc_pll6, regmap, &cam_cc_pll6_config);
>> +       clk_lucid_ole_pll_configure(&cam_cc_pll8, regmap, &cam_cc_pll8_config);
>> +
>> +       /* Keep clocks always enabled */
>> +       qcom_branch_set_clk_en(regmap, 0x13a9c); /* CAM_CC_GDSC_CLK */
>> +       qcom_branch_set_clk_en(regmap, 0x13ab8); /* CAM_CC_SLEEP_CLK */
>> +
>> +       pm_runtime_put(dev);
>> +
>> +       return 0;
>> +}
>> +
>>   static const struct qcom_cc_desc cam_cc_x1e80100_desc = {
>>          .config = &cam_cc_x1e80100_regmap_config,
>>          .clks = cam_cc_x1e80100_clocks,
>> @@ -2434,6 +2465,7 @@ static const struct qcom_cc_desc cam_cc_x1e80100_desc = {
>>          .num_resets = ARRAY_SIZE(cam_cc_x1e80100_resets),
>>          .gdscs = cam_cc_x1e80100_gdscs,
>>          .num_gdscs = ARRAY_SIZE(cam_cc_x1e80100_gdscs),
>> +       .configure_plls = cam_cc_x1e80100_configure_plls,
>>   };
>>
>> This has the same effect as you were alluding to and in fact we could probably even move the pm_runtime_enable/resume_and_get and pm_runtime_put into really_probe().
>>
>> It seems to me anyway we should try to push as much of this into core logic to be reused as possible.
>>
> 
> As per the issue I pointer earlier, I see now you moved the get_sync() call to after the attach_pds().
> But this PLL callback approach also requires changes in each individual clock driver,

That's up for discussion.

We can do it for new drivers and for existing drivers where we know we 
have multiple rails. It need not be a blanket sweep of all of the older 
drivers - for example 8996 or 8916.

That's why the example code I sent you checks for the validity of the 
callback.

Right now the only places we _require_ this sequencing are what

- sm8450 videocc/camcc
- x1e videocc/camcc
- sm8550/sm8650/sm8750 videocc/camcc ?

Certainly not the ~ 80 something clock drivers we have.

  and adding a callback
> in each clock controller driver to configure the PLLs doesn't reduce any boiler plate code in my opinion.
> Infact I feel this is harder to maintain as the code in callback is not constant and vary from one
> driver to another. Instead the current approach to explicitly attach pds if we have multiple power
> domains is much easier to maintain since it is the same function call in every driver.

I understand your reluctance to change 80 drivers but, that's not the 
proposal.

We need only fix for new and existing - where its required.

> Kindly review the discussion in another thread[PATCH 3/5] as that will avoid these extra callbacks in
> each driver and the code will be uniform across all the clock drivers

My feedback is - still:

- Don't do qcom_cc_attach_pds twice, that is incorrect.
- Move the sequencing into core because it is replicated over and over
   again so it is a waste of time just copy/pasting over and over again.
- Describe the change correctly - you need the power rails to stay
   always on so you need to do qcom_cc_attach_pds prior to
   devm_pm_runtime_enable

And in fact this whole dance with pm_rumtime_dostuff() should go into 
common code - so that it gets fixed _once_

That's my honest and unfiltered feedback.

---
bod

