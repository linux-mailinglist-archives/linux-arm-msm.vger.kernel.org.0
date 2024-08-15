Return-Path: <linux-arm-msm+bounces-28646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FA39537F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 18:10:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 965901F24286
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 16:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E45ED1B29A3;
	Thu, 15 Aug 2024 16:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r1D0FVaQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DA11B4C59
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 16:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723738211; cv=none; b=B7Fid0ycc//jf8DgLawBJD4wgps9GuMNifJU2ahQOlo/vto4EE03UnhlPUHafyTwnOgusXiiFbowchxpwSnYxWV8OruTwDeg6EFgDF6X+ezDUB94mVjC+A/4eaTy/bXLoOuvlsWRSMWuzEDza0BgbSjBllbhvbkTV5Q5jdyBs4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723738211; c=relaxed/simple;
	bh=u7TvbK3WD9JGvuuqyWQIMqBEruAdfoxECZ0duiUt5kk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=olQHrqtKPPqJGCxjfgrXc8wvDMFIiRQhDHEwwNtJQ/RIHowNaeyDBvlXbukFpEdplrJx+bvs+vgbEmUGfbPZIB1lJbqBMI9hL6WF2VCHYZwu90/i0etGPPRQzpncyOoIh4YJKDr5Fupuf4PpM16fEcknjVjL54p4NuJSVkdTtHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r1D0FVaQ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-429c4a4c6a8so7628055e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 09:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723738208; x=1724343008; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dmkiJ4k0iP8rLehKXXA87IwgLNjvAKrkUrp7KICnqGw=;
        b=r1D0FVaQcNIN7CNiM3zTvQWhC5dyTP4fruBwwDM2YZry3AqcGLSkcrSMMk1l1ScXDP
         DMHQ7RCYG5zPyM3ObLy8LVmXONSLGlTn0E8VJXWb6tdYTRy8zq8aBtWZhu1zpJQGtNv1
         s5SyCNoK8Qk3X2ZI6qAAoip9OXriPmMXtKpjVFM/Lrk/avew3eJoPEpOXgQaCvbx5/4B
         MpSq66RzbF0IbOIFRjRX4oU2sl94hVwu40pjwBu0pcj8Fz69ODdmfrgdmC5AD2f4bHgN
         LphMLiQfqVHUIE0YVCjRklBw+C9qwo3uIUrvxT+20MhMTTRjVnl7Cz13qjLfWA5Lvd8h
         DCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723738208; x=1724343008;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dmkiJ4k0iP8rLehKXXA87IwgLNjvAKrkUrp7KICnqGw=;
        b=nY+6zoht5yIttsLi8fM89e3kcaHGJxiadjUY1ySElZzyoQruoAUjcfPPwwPaNTvg+H
         TpacOCu0fQJvorNbO14FRVBASOKnOlU3ytq8sUiuwl1N67WlTBNYG5KXzdbnxTJktykW
         s05ffWHyw4D7x/1VFMshIbTUYGoSuIG8+Y5bC03hFRjDKXY0/WUPcn4coRwgXm56qqyp
         Q7Y1nitzhPiKBU/Hxb7q0CN8krCAUjNBVi7pQq1RN0ZDIIr3rCrJgC+11Ytx6zOq9QlZ
         y3WlMIEAGpGOQcRrPaGqO1M/T+/BnlfZFIjM2QiLUgRQXTmfRAGRe9xzHBpMPmRnIl0I
         VeAw==
X-Gm-Message-State: AOJu0YzCypl3QwdeXTY/aaZYX/doAgLa4fMXBjz3VpIqs5gN7oqCvrCF
	Rxm7j9V9pJCqvp8E4slj6FpI7bAvQee9VHGwIPjzgt2tSTz8yNxaqujtZwqQx/o=
X-Google-Smtp-Source: AGHT+IHbfwiW1pXKhSkWxn6GIvztBdPu73+tN1vtom1RsFUih70ii2khzdjpmDpbjtaZGLOsuAalzA==
X-Received: by 2002:a05:600c:35ca:b0:428:f0c2:ef4a with SMTP id 5b1f17b1804b1-429dd2384d2mr49692865e9.13.1723738207592;
        Thu, 15 Aug 2024 09:10:07 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded299a9sm51617595e9.18.2024.08.15.09.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2024 09:10:07 -0700 (PDT)
Message-ID: <be0b5f96-2863-4b10-b003-6829dfb04b95@linaro.org>
Date: Thu, 15 Aug 2024 17:10:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] media: qcom: camss: Add CSID Gen3 support for
 sm8550
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-13-quic_depengs@quicinc.com>
 <44efa3ba-f60d-4a17-a8a1-fa7d49aa3234@linaro.org>
 <ff261ab4-b59d-48a1-9ede-3c691842d913@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <ff261ab4-b59d-48a1-9ede-3c691842d913@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15/08/2024 16:14, Depeng Shao wrote:
> Hi Bryan,
> 
> 
>>> ---
>>>   drivers/media/platform/qcom/camss/Makefile    |   1 +
>>>   .../platform/qcom/camss/camss-csid-gen3.c     | 339 ++++++++++++++++++
>>>   .../platform/qcom/camss/camss-csid-gen3.h     |  26 ++
>>
>>
>> So this "gen2" and "gen3" stuff would make sense if we had a number of 
>> SoCs based on gen2 and gen3 which were controlled from the upper-level 
>> gen2.c and gen3.c.
>>
>> What you're submitting here is csid-780 so the file should be named 
>> csid-780.
>>
>> When we add 680 or 880 then it makes sense to try to encapsulate a 
>> class of generation into one file - potentially.
>>
>> I'd guess that was the intent behind gen2.c.
>>
>> TL;DR please name your file csid-xxx.c
> 
> Sure, I will use csid-780.c
> 
>>> +
>>> +    writel(val, csid->base + CSID_CSI2_RX_CFG0);
>>> +
>>> +    val = 1 << CSI2_RX_CFG1_ECC_CORRECTION_EN;
>>> +    if (vc > 3)
>>> +        val |= 1 << CSI2_RX_CFG1_VC_MODE;
>>
>> So again these are needless bit-shifts.
>>
>> #define CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN BIT(0)
>>
>> val = CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
>>
> 
> You posted same comments in v3 series, I also replied it.
> https://lore.kernel.org/all/eeaf4f4e-5200-4b13-b38f-3f3385fc2a2b@quicinc.com/
> 
> Some of register bits which just need to be configured to 0 or 1, then 
> can use BIT(X), but some register bits need to configure a specific 
> value, e.g.,  CSID_RDI_CFG0 bits[22:26] need to configure a vc vaule, 
> bits[16:21] need to configure a dt value, then we can't use BIT(x) to 
> handle this.

Yes please use macros() to bury any _necessary_ bit shifts to populate a 
_bit_field_ away but as an example CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN 
is not a bit-field.


> 
> 
>>>       case MSM_CSID_PAD_SRC:
>>> -        if (csid->testgen_mode->cur.val == 0) {
>>> +        if (!csid->testgen_mode || csid->testgen_mode->cur.val == 0) {
>>
>> See my comments on adding new guards to core functionality.
>>
>> Is this sm8550 specific or generic ?
>>
> 
> It is sm8550 specific, since we don't have testgen mode in sm8550 csid, 
> so need to add some guards, the guards are added for similar reason.

Hmm, I see in my tree I just assigned testgen_mode to some dummy data. 
You're right, retain this, when we enable testgen as a standalone entity 
outside of CSID we can address this again.

> 
>>>               /* Test generator is disabled, */
>>>               /* keep pad formats in sync */
>>>               u32 code = fmt->code;
>>> @@ -1042,6 +1042,7 @@ static int csid_init_formats(struct v4l2_subdev 
>>> *sd, struct v4l2_subdev_fh *fh)
>>>   static int csid_set_test_pattern(struct csid_device *csid, s32 value)
>>>   {
>>>       struct csid_testgen_config *tg = &csid->testgen;
>>> +    const struct csid_hw_ops *hw_ops = csid->res->hw_ops;
>>>       /* If CSID is linked to CSIPHY, do not allow to enable test 
>>> generator */
>>>       if (value && media_pad_remote_pad_first(&csid- 
>>> >pads[MSM_CSID_PAD_SINK]))
>>> @@ -1049,7 +1050,10 @@ static int csid_set_test_pattern(struct 
>>> csid_device *csid, s32 value)
>>>       tg->enabled = !!value;
>>> -    return csid->res->hw_ops->configure_testgen_pattern(csid, value);
>>> +    if (hw_ops->configure_testgen_pattern)
>>> +        return -EOPNOTSUPP;
>>> +    else
>>> +        return hw_ops->configure_testgen_pattern(csid, value);
>>
>> If you just add a dummy configure_testgen_pattern we can get rid of 
>> this branching stuff.
>>
> 
> Do you mean add dummy function in csid-780/gen3.c? How about the other 
> ops in vfe_ops_780, add dummy function or use NULL? We need to guards if 
> we set it as NULL.

See above, you're right what you have is fine.

> 
> static int csid_configure_testgen_pattern(struct csid_device *csid, s32 
> val)
> {
>      return 0;
> }
> 
>>>   }
>>>   /*
>>> @@ -1121,6 +1125,19 @@ int msm_csid_subdev_init(struct camss *camss, 
>>> struct csid_device *csid,
>>>           csid->base = devm_platform_ioremap_resource_byname(pdev, 
>>> res->reg[0]);
>>>           if (IS_ERR(csid->base))
>>>               return PTR_ERR(csid->base);
>>> +
>>> +        /* CSID "top" is a new function in new version HW,
>>> +         * CSID can connect to VFE & SFE(Sensor Front End).
>>> +         * this connection is controlled by CSID "top" registers.
>>> +         * There is only one CSID "top" region for all CSIDs.
>>> +         */
>>> +        if (!csid_is_lite(csid) && res->reg[1] && !camss- 
>>> >csid_top_base) {
>>> +            camss->csid_top_base =
>>> +                devm_platform_ioremap_resource_byname(pdev, res- 
>>> >reg[1]);
>>
>> That's a complex clause.
>>
>> Let me send you a patch to do it a different way.
>>
> 
> I was also thinking to addd it in camss level, then I thought it is in 
> csid block, so I moved it to csid, but it is also fine to add it in 
> camss. Can I add your patch into this series? Just like the csiphy patches.

static const struct resources_wrapper csid_wrapper_res_sm8550 = {
         .reg = "csid_wrapper",
};

Yes go ahead, all you should need to do then is add 
"&csid_wrapper_res_sm8550" to your resources.

static const struct camss_resources sm8550_resources = {
         .version = CAMSS_SM8550,
         .pd_name = "top",
         .csiphy_res = csiphy_res_sm8550,
         .csid_res = csid_res_sm8550,
         .ispif_res = NULL,
         .vfe_res = vfe_res_sm8550,
         .csid_wrapper_res = &csid_wrapper_res_sm8550,
...
};

---
bod

