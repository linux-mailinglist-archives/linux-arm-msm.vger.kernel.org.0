Return-Path: <linux-arm-msm+bounces-53863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 384EDA84937
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 18:06:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB8BC3A8EED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 16:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 649681EBFE3;
	Thu, 10 Apr 2025 16:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b176nPpm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8B21E9B2F
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 16:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744301188; cv=none; b=oQrNXtEWcdP00oNJPeqKBlWXV625a4jqJcwlzmPmcD6ARUxm8YpAOs2BIZzArgq6P6ksrG9qathu4v5KlVXxruEjtccQRwyv1WcD0yqtF2tEzWgr/6m9a1wPWLW8TiTXVldlVDRSbcBPtJnFxRoM+1XZPqJO/xFATKmPXpEbgJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744301188; c=relaxed/simple;
	bh=Z/+pIx183ZqhC6dbLA2bEzx8LGs6zCrtEsOL1W2vNFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fLOo54ED/4HAd9CcKIotNQkzpTHFFmaW1Etncg1x7OwZQk0mvhbv2byfUr/reS07ZvlVfhjtDPE1devqq4CkgY5qWH4ozC8NVx8RWv/puCDexTvspMJeb008QnhRnt5gXZIiAeOBbK7bxgUfNEEC+owY8xq86dKeG8M/jB6A+Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b176nPpm; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso5204065e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 09:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744301184; x=1744905984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uNANuCdKbQEweCi3G2Fd19BgtgZsZ5dY4zsAI5oU5dU=;
        b=b176nPpmz8YbM7HPAJsHUu/n6ct3VTHyMy/Eo8zx3gz7GCIHJ0aMPrEwA9+vj5RLdG
         hoLnlcJa36UiuKm6YFqq37pMkQxGIKJm50GD1NxQDOB0pKq+eMivPp4/0PJzlePiQf7L
         +4sWlDUNvx5oDxvtef6VH1xdKE0+ypzYy9kwm6NAxqs0J7heoQgBzF/LFGHfMmwKLpAe
         8FywjDl7dQNufjVidsnawFNyYuPVMOYPgj9ChARbkaEAPJuPog6LNx3AsGiUoVKsprmU
         ZPhnOTxIX7USW9XamAy9roWwjO928tu7YDXEnKZsqo052sp+/meQBMEkUiHUBUf7DEFe
         Oewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744301184; x=1744905984;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uNANuCdKbQEweCi3G2Fd19BgtgZsZ5dY4zsAI5oU5dU=;
        b=h9tx8PSPlmZBHua3nsZzmB+a3/H+kNdFSB0Xy2RNP8hvOmn0OxkudS80i2v9XgqQiH
         00hDR9is5p6+sGeHmFacZnveGdU4LR5YNzREyOCcrfKLr6ZQZWvEBPVJp5H6gvwtXzMt
         hoxZEf7kQ1eeNWuCMkNmIQAXCKhgOYqEKkEHmKBFBCFJdbEUIG9mXEpdv+HuPmToaHsZ
         orsmL5Sj1Ru8dwB1N4O0bq8WHdRqyUwW1bbg5EQjeVSRI7yvoqfUr3g507KGk8RlsbrI
         ANToU2xn5Qni39dExQg3NfcG9j3C3OgP+vIwiPP8Z8JpMhFMkGTlKQM2xhmLq6ATI0Jj
         Kd2g==
X-Forwarded-Encrypted: i=1; AJvYcCUaSLYbBjvnRFR2ekQ6AD5cqBeLY+Wx2U9IP8KmOcOn2NcbK95A/zpW7/PL5TrEqs8KcDsyP51tzIjQP5Pb@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1ndGm4CbG8u6FkrywXx/6p+qV4xUwi6mAzfx4w5fOojhOX7tU
	+5EOrZq0adrSRBc4LQXV0OONhW9XDU10AesNc21iubzG48voBJ/Kk/gEz6zcpg8=
X-Gm-Gg: ASbGncsOIHtwFjRYHYe0ywEOgdcCVot46yIEvclR8Wp7hRbErEqIPdbqcCNQb4lYVO5
	6sP3bpGcqDy99R67yjj3tkNB7fRRO84wFur8T9oI59nkbpDubuHMcGDfC+TLwhu7xjry2mQVK4r
	d7eZ3oSdjCkNGI21ySDhktbL3DP/H4ijEFyrj3eJWpEE71/Wcf4te78fHnrJ5qBtww6IVkEZKtl
	qpN3eS52x4sTR0S1+SBuEfvTd+F2KnRD7ctawBMbjIMNoc5sBaeH7dZ+zjMY/pJS5645IV5Nfz4
	GwYX2E4vO3co6pRIUwi4bo49ZPoZ3c9JQICoHmwy28C3kBBptn5cI51Zd0Y8Wb0MpWzIwDsvrWf
	Ptk06dA==
X-Google-Smtp-Source: AGHT+IFEQAlBtsd3c3WM20Ox494H4GnJiH3quGOuq3BsVzf5gTiqvKwfAHkZTbHznDN+fyFizN/S6A==
X-Received: by 2002:a05:6000:4313:b0:391:3207:2e6f with SMTP id ffacd0b85a97d-39d8fd8c3b9mr3053897f8f.42.1744301183470;
        Thu, 10 Apr 2025 09:06:23 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075a593sm59722495e9.25.2025.04.10.09.06.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 09:06:22 -0700 (PDT)
Message-ID: <e6dca8e2-d550-4819-9833-ecbbd1a8f376@linaro.org>
Date: Thu, 10 Apr 2025 17:06:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] media: platform: qcom/iris: add sm8650 support
To: neil.armstrong@linaro.org, Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250409-topic-sm8x50-iris-v10-v4-0-40e411594285@linaro.org>
 <20250409-topic-sm8x50-iris-v10-v4-6-40e411594285@linaro.org>
 <36e25d6e-36de-fec6-e54d-0683503c7a09@quicinc.com>
 <1550c870-188e-4b41-b17c-2009cda41ffc@linaro.org>
 <8cade183-72ac-eac1-1a57-a9db37657fca@quicinc.com>
 <a51e2e8a-bd7b-7d30-8cd6-9438b053ea2c@quicinc.com>
 <fb5cfe3a-36bf-4722-be7a-20e7f0c803bd@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <fb5cfe3a-36bf-4722-be7a-20e7f0c803bd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/04/2025 16:40, neil.armstrong@linaro.org wrote:
> On 10/04/2025 15:07, Dikshita Agarwal wrote:
>>
>>
>> On 4/10/2025 2:43 PM, Vikash Garodia wrote:
>>>
>>> On 4/10/2025 2:31 PM, Neil Armstrong wrote:
>>>> On 09/04/2025 18:57, Vikash Garodia wrote:
>>>>> Hi Neil,
>>>>>
>>>>> On 4/9/2025 8:08 PM, Neil Armstrong wrote:
>>>>>> Add support for the SM8650 platform by re-using the SM8550
>>>>>> definitions and using the vpu33 ops.
>>>>>>
>>>>>> The SM8650/vpu33 requires more reset lines, but the H.264
>>>>>> decoder capabilities are identical.
>>>>>>
>>>>>> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e Dell
>>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>> ---
>>>>>>    .../platform/qcom/iris/iris_platform_common.h      |  1 +
>>>>>>    .../platform/qcom/iris/iris_platform_sm8550.c      | 64 +++++++ 
>>>>>> +++++++++++++++
>>>>>>    drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
>>>>>>    3 files changed, 69 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>>>> b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>>>> index
>>>>>> fdd40fd80178c4c66b37e392d07a0a62f492f108..6bc3a7975b04d612f6c89206eae95dac678695fc 100644
>>>>>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>>>>>> @@ -35,6 +35,7 @@ enum pipe_type {
>>>>>>      extern struct iris_platform_data sm8250_data;
>>>>>>    extern struct iris_platform_data sm8550_data;
>>>>>> +extern struct iris_platform_data sm8650_data;
>>>>>>      enum platform_clk_type {
>>>>>>        IRIS_AXI_CLK,
>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>>>>>> b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>>>>>> index
>>>>>> 35d278996c430f2856d0fe59586930061a271c3e..d0f8fa960d53367023e41bc5807ba3f8beae2efc 100644
>>>>>> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
>>>>>> @@ -144,6 +144,10 @@ static const struct icc_info 
>>>>>> sm8550_icc_table[] = {
>>>>>>      static const char * const sm8550_clk_reset_table[] = { "bus" };
>>>>>>    +static const char * const sm8650_clk_reset_table[] = { "bus", 
>>>>>> "core" };
>>>>>> +
>>>>>> +static const char * const sm8650_controller_reset_table[] = 
>>>>>> { "xo" };
>>>>>> +
>>>>>>    static const struct bw_info sm8550_bw_table_dec[] = {
>>>>>>        { ((4096 * 2160) / 256) * 60, 1608000 },
>>>>>>        { ((4096 * 2160) / 256) * 30,  826000 },
>>>>>> @@ -264,3 +268,63 @@ struct iris_platform_data sm8550_data = {
>>>>>>        .dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>>>>>>        .dec_op_int_buf_tbl_size = 
>>>>>> ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
>>>>>>    };
>>>>>> +
>>>>>> +/*
>>>>>> + * Shares most of SM8550 data except:
>>>>>> + * - vpu_ops to iris_vpu33_ops
>>>>>> + * - clk_rst_tbl to sm8650_clk_reset_table
>>>>>> + * - controller_rst_tbl to sm8650_controller_reset_table
>>>>>> + * - fwname to "qcom/vpu/vpu33_p4.mbn"
>>>>>> + */
>>>>>> +struct iris_platform_data sm8650_data = {
>>>>>> +    .get_instance = iris_hfi_gen2_get_instance,
>>>>>> +    .init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>>>>>> +    .init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
>>>>>> +    .vpu_ops = &iris_vpu33_ops,
>>>>>> +    .set_preset_registers = iris_set_sm8550_preset_registers,
>>>>>> +    .icc_tbl = sm8550_icc_table,
>>>>>> +    .icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
>>>>>> +    .clk_rst_tbl = sm8650_clk_reset_table,
>>>>>> +    .clk_rst_tbl_size = ARRAY_SIZE(sm8650_clk_reset_table),
>>>>>> +    .controller_rst_tbl = sm8650_controller_reset_table,
>>>>>> +    .controller_rst_tbl_size = 
>>>>>> ARRAY_SIZE(sm8650_controller_reset_table),
>>>>>> +    .bw_tbl_dec = sm8550_bw_table_dec,
>>>>>> +    .bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
>>>>>> +    .pmdomain_tbl = sm8550_pmdomain_table,
>>>>>> +    .pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
>>>>>> +    .opp_pd_tbl = sm8550_opp_pd_table,
>>>>>> +    .opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
>>>>>> +    .clk_tbl = sm8550_clk_table,
>>>>>> +    .clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
>>>>>> +    /* Upper bound of DMA address range */
>>>>>> +    .dma_mask = 0xe0000000 - 1,
>>>>>> +    .fwname = "qcom/vpu/vpu33_p4.mbn",
>>>>>> +    .pas_id = IRIS_PAS_ID,
>>>>>> +    .inst_caps = &platform_inst_cap_sm8550,
>>>>>> +    .inst_fw_caps = inst_fw_cap_sm8550,
>>>>>> +    .inst_fw_caps_size = ARRAY_SIZE(inst_fw_cap_sm8550),
>>>>>> +    .tz_cp_config_data = &tz_cp_config_sm8550,
>>>>>> +    .core_arch = VIDEO_ARCH_LX,
>>>>>> +    .hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
>>>>>> +    .ubwc_config = &ubwc_config_sm8550,
>>>>>> +    .num_vpp_pipe = 4,
>>>>>> +    .max_session_count = 16,
>>>>>> +    .max_core_mbpf = ((8192 * 4352) / 256) * 2,
>>>>>> +    .input_config_params =
>>>>>> +        sm8550_vdec_input_config_params,
>>>>>> +    .input_config_params_size =
>>>>>> +        ARRAY_SIZE(sm8550_vdec_input_config_params),
>>>>>> +    .output_config_params =
>>>>>> +        sm8550_vdec_output_config_params,
>>>>>> +    .output_config_params_size =
>>>>>> +        ARRAY_SIZE(sm8550_vdec_output_config_params),
>>>>>> +    .dec_input_prop = sm8550_vdec_subscribe_input_properties,
>>>>>> +    .dec_input_prop_size = 
>>>>>> ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
>>>>>> +    .dec_output_prop = sm8550_vdec_subscribe_output_properties,
>>>>>> +    .dec_output_prop_size =
>>>>>> ARRAY_SIZE(sm8550_vdec_subscribe_output_properties),
>>>>>> +
>>>>>> +    .dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
>>>>>> +    .dec_ip_int_buf_tbl_size = 
>>>>>> ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
>>>>>> +    .dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>>>>>> +    .dec_op_int_buf_tbl_size = 
>>>>>> ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
>>>>>> +};
>>>>> While i was extending the data for QCS8300 (one another iris-v3 
>>>>> variant), i
>>>>> realize that this file iris_platform_sm8550.c is getting dumped 
>>>>> with all SOC
>>>>> platform data. It would be a good idea at this point to split it 
>>>>> into something
>>>>> like this
>>>>> 1. Introduce SOC specific c file and move the respective SOC 
>>>>> platform data to
>>>>> it, for ex, in this case sm8650_data
>>>>> 2. Move the common structs from iris_platform_sm8550.c to
>>>>> iris_platform_common.h. This way more SOCs getting added in future, 
>>>>> can include
>>>>> the common header to reuse them, otherwise it would end up using 
>>>>> 8550.c for all
>>>>> future SOC.
>>>>>
>>>>> Share your comments if you have any better approach to manage/re- 
>>>>> use these
>>>>> platform data considering more SOCs getting added.
>>>>
>>>> Right, yes the architecture is fine, but I don't feel 
>>>> iris_platform_common is
>>>> the right
>>>> place, perhaps we could introduce a platform_catalog.c where we 
>>>> could place all
>>>> the common
>>>> platform data and reuse them from the platform_<soc>.c files ?
>>> Common structs would certainly need to be part of a header which can be
>>> included. Where do you plan to keep common struct to be used across 
>>> SOC specific
>>> file in your approach ?
>>>>
>>>> I can design prototype on top of this patchset as an RFC.
>>> I was thinking that the changes are not that big, and can be done in 
>>> existing
>>> series though.
>>>
>> For now, I think you can introduce a platform_sm8650.c as part of this
>> series and use the common structure from platform_sm8550.c.
>> Shouldn't be a big change.
> 
> I tried but I don't how to solve this, you need a build-time ARRAY_SIZE for
> the arrays, so they need to be in the same .c file to allow a build-time
> evaluation of ARRAY_SIZE. If he common tables are moved into a header
> they will be duplicated into both platform_sm8650 & platform_sm8550 objects
> which is not what we want.
> 
> The solution would be to write all the platform tables & iris_platform_data
> into headers, with common headers, then include those into a 
> platform_catalog.c
> like is done for the drm/msm/dpu1 catalog.
> 
> Neil
> 
>>
>> Later you can post a separate patch series to add platform_catalog.c and
>> have common struct placed there which can be used across different SOC
>> platform files.
>>
>> or other way is,
>> Post a patch series to introduce platform_catalog.c with common struct 
>> and
>> then rebase your 8650 series on top of it.
>>
>> Thanks,
>> Dikshita
>>> Thanks,
>>> Vikash
>>>>
>>>> Neil
>>>>
>>>>>
>>>>> Regards,
>>>>> Vikash
>>>>>
>>>>>> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c
>>>>>> b/drivers/media/platform/qcom/iris/iris_probe.c
>>>>>> index
>>>>>> 4f8bce6e2002bffee4c93dcaaf6e52bf4e40992e..7cd8650fbe9c09598670530103e3d5edf32953e7 100644
>>>>>> --- a/drivers/media/platform/qcom/iris/iris_probe.c
>>>>>> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
>>>>>> @@ -345,6 +345,10 @@ static const struct of_device_id 
>>>>>> iris_dt_match[] = {
>>>>>>                .data = &sm8250_data,
>>>>>>            },
>>>>>>    #endif
>>>>>> +    {
>>>>>> +        .compatible = "qcom,sm8650-iris",
>>>>>> +        .data = &sm8650_data,
>>>>>> +    },
>>>>>>        { },
>>>>>>    };
>>>>>>    MODULE_DEVICE_TABLE(of, iris_dt_match);
>>>>>>
>>>>
> 

Eh as I read the suggestion about putting the structs - instantiating 
the structs in the header, I wondered if that would link but anyway.

One way to solve this without going the dpu1 route right now is to 
rename the platform files

iris_platform_sm8250.c -> iris_platform_common_hfi_gen1.c
iris_platform_sm8550.c -> iris_platform_common_hfi_gen2.c

The differentiation around HFI into "generations" instead of 
incrementing the already existing HFIXXX version is unfortunate.

At least this way we have a repository of common HFI code located in 
each file, in expectation of HFI GEN3 whenever.

---
bod

