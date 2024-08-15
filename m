Return-Path: <linux-arm-msm+bounces-28647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA12C953815
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 18:17:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B5A31F21E2E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 16:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896BD1B29DA;
	Thu, 15 Aug 2024 16:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tzdLRCpf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8B317C9BD
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 16:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723738620; cv=none; b=kHWZEgDLwQVc2dczFLbWrZoxm45xIEHYmENfkMJ6kcgBaT0FrQgaKdazLbIUzkMgojLnDDLtJekW5SK1GDZxAwekeZAI4L30p/rS+7gJUEGiaiVnJGcmtzUZ1/Yn79Jzz+sW8TfRxHS65QsqoC2MjB7Z8dewaF9NOAMYkVr+1BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723738620; c=relaxed/simple;
	bh=sBwws+LY61nNor1YA9MG+DIegEePlRJSmnXHrQUIyB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JM9SO6cq5x1aarDhn+oQE+1YKRHaH+rLWONDF3t33e4JUKmEkNOJEKlI7OBPpF6WYKBlUFQ7JoPh+3SaB5JbJvV2nKCuTLtqXioSnibSvhry/Ob+pr0mhgGEYLoNmozMr+l4qRQFyLzwoK18ji2JV2rvwkqcSHChXieQHlzRw48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tzdLRCpf; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-428163f7635so7952365e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 09:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723738617; x=1724343417; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7iSVRsyD2HSmbbmHuq4IK1YmKComw1usx+Fslixenyg=;
        b=tzdLRCpfmWoZQd3Dp1w+D6iA5D6ek0roTYsSKMzsJ+LAc4qmu1q3M4gkBxrTZFTX7u
         WP6k+pLfxSxoTCPP7Mbz29bKV3fG3I/e5fwpg0D7DYvD/esAJL+AhEBR1xzNSfw+yS1K
         Dq20bvrpBE6X2H2lDyjlpnWHM28N1VyzfwFo2CfYRYhazb/ixQ16jT59DflbYWfg2ccg
         QfWFMT+YXaIeayGBF9SnEm5biRmVCMSqKEjLlAsaoPk4lh91748qbmVSqq62xfwKenLB
         OVbklb2TrT2d0JraxUvzU/tAsuMZySlColGV/KSIay2KtLp2wuKdrCLHy1we4XLPIOit
         HLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723738617; x=1724343417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7iSVRsyD2HSmbbmHuq4IK1YmKComw1usx+Fslixenyg=;
        b=XbEEjlSqCpZfi9QKl8Jr6OJizjKEgqrp9AH0romvel/Af5GPYcM22y+dyjwGTrwjac
         y17/EcfWL51o/V95IPiE5qzUgrOzAljeCciJyzctTvuKO3Iurvhfyh1sTV3TR+J9rBoq
         OPQENOwGYCpomjykv8GQU6mYVHA9vwbhMPTXXERSAgOsKZ9oHbqzXavnnixdED51KeCi
         UPnA5xd+2z72cRxhK5+9GOils3GBIwBE1FDtKQQwTFRcNjzcnlxKFaJO9b4E///qVlqb
         yM6IN95sFutEc0kW5ls870p/Rm/IH3k81S7IVamCegcWSJl2qDpIaMVPxPfQoMIul9Jg
         XyHg==
X-Gm-Message-State: AOJu0YyluAqpE95/Mt4+/vEkofGLdWq1RLUH/HsnCX2w05mi3Ajb+egJ
	m4JrlltJciZreC3jdzl/S3KOgQU+wdrtrPqikiOUwVqcZa5TtHskiaIb6xlTAkE=
X-Google-Smtp-Source: AGHT+IG8NyoAKzvdrXrSeebEfcJ4bLuiO1FJx8L+7oCyM+GdMTKzcJZZYpSpDK22H7YPVISRip1zLg==
X-Received: by 2002:a05:600c:511b:b0:426:66a2:b200 with SMTP id 5b1f17b1804b1-429dd1eedf4mr47166045e9.0.1723738616499;
        Thu, 15 Aug 2024 09:16:56 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429e7c04255sm24109495e9.16.2024.08.15.09.16.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2024 09:16:55 -0700 (PDT)
Message-ID: <a748e4b2-70f6-4bc4-b48a-21816848fee2@linaro.org>
Date: Thu, 15 Aug 2024 17:16:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] media: qcom: camss: Add support for VFE hardware
 version Titan 780
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-14-quic_depengs@quicinc.com>
 <b78f23ca-eb6e-45cf-9e42-86c906ff901f@linaro.org>
 <8e38308a-4198-420e-ac4d-718299033eb5@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <8e38308a-4198-420e-ac4d-718299033eb5@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15/08/2024 14:33, Depeng Shao wrote:
> Hi Bryan,
> 
> On 8/15/2024 12:23 AM, Bryan O'Donoghue wrote:
> 
>>> @@ -674,15 +675,17 @@ int vfe_reset(struct vfe_device *vfe)
>>>   {
>>>       unsigned long time;
>>> -    reinit_completion(&vfe->reset_complete);
>>> +    if (vfe->res->hw_ops->global_reset) {
>>> +        reinit_completion(&vfe->reset_complete);
>>> -    vfe->res->hw_ops->global_reset(vfe);
>>> +        vfe->res->hw_ops->global_reset(vfe);
>>> -    time = wait_for_completion_timeout(&vfe->reset_complete,
>>> -        msecs_to_jiffies(VFE_RESET_TIMEOUT_MS));
>>> -    if (!time) {
>>> -        dev_err(vfe->camss->dev, "VFE reset timeout\n");
>>> -        return -EIO;
>>> +        time = wait_for_completion_timeout(&vfe->reset_complete,
>>> +            msecs_to_jiffies(VFE_RESET_TIMEOUT_MS));
>>> +        if (!time) {
>>> +            dev_err(vfe->camss->dev, "VFE reset timeout\n");
>>> +            return -EIO;
>>> +        }
>>
>> Per my comment on the CSID - this feels like a fix you are introducing 
>> here in the guise of a silicon add.
>>
>> Please break it up.
>>
>> If you have a number of fixes to core functionality they need to be
>>
>> 1. Granular and individual
>> 2. Indivdually scrutable with their own patch and descritption
>> 3. git cherry-pickable
>> 4. Have a Fixes tag
>> 5. And be cc'd to stable@vger.kernel.org
>>
>> Can't accept either the fixes or the silicon add if the two live mixed 
>> up in one patch.
>>
> 
> This isn't a bug fix, adding a null pointer checking just because vfe780 
> doesn't have enable_irq/global_reset/isr/vfe_halt hw_ops, so adding the 
> null checking for these hw_ops in this patch and adding them in one patch.
> The original code doesn't have any bug.

Right but you could just have

static void vfe_global_reset(struct vfe_device *vfe)
{
         /* VFE780 has no global reset, simply report a completion */
         complete(&vfe->reset_complete);
}

const struct vfe_hw_ops vfe_ops_780 = {
	.global_reset = vfe_global_reset,
}

Instead of having a bunch of special cases in the top level code.

> 
>>> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/ 
>>> media/platform/qcom/camss/camss-vfe.h
>>> index fcbf4f609129..9dec5bc0d1b1 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
>>> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
>>> @@ -243,6 +243,7 @@ extern const struct vfe_hw_ops vfe_ops_4_7;
>>>   extern const struct vfe_hw_ops vfe_ops_4_8;
>>>   extern const struct vfe_hw_ops vfe_ops_170;
>>>   extern const struct vfe_hw_ops vfe_ops_480;
>>> +extern const struct vfe_hw_ops vfe_ops_780;
>>>   int vfe_get(struct vfe_device *vfe);
>>>   void vfe_put(struct vfe_device *vfe);
>>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/ 
>>> media/platform/qcom/camss/camss.c
>>> index 7ee102948dc4..92a0fa02e415 100644
>>> --- a/drivers/media/platform/qcom/camss/camss.c
>>> +++ b/drivers/media/platform/qcom/camss/camss.c
>>> @@ -1666,6 +1666,125 @@ static const struct camss_subdev_resources 
>>> csid_res_8550[] = {
>>>       }
>>>   };
>>> +static const struct camss_subdev_resources vfe_res_8550[] = {
>>> +    /* VFE0 */
>>> +    {
>>> +        .regulators = {},
>>> +        .clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb_clk", 
>>> "vfe0_fast_ahb",
>>> +               "vfe0", "cpas_vfe0", "camnoc_axi" },
>>
>> Should the camnoc AXI clock go here or in the CSID ?
>>
> 
> camnoc is responsible for ddr writing, so it is needed for the WM in vfe.

Right, I don't recall if you specified the clock for CSID and VFE but 
just for the record it should appear in only the one block.. VFE sounds 
good to me.

> 
> 
>>> +    /* VFE4 lite */
>>> +    {
>>> +        .regulators = {},
>>> +        .clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb_clk", 
>>> "vfe_lite_ahb",
>>> +               "vfe_lite", "cpas_ife_lite", "camnoc_axi" },
>>> +        .clock_rate = {    { 0, 0, 0, 0, 0 },
>>> +                { 0, 0, 0, 0, 80000000 },
>>> +                { 300000000, 300000000, 400000000, 400000000, 
>>> 400000000 },
>>> +                { 300000000, 300000000, 400000000, 400000000, 
>>> 400000000 },
>>
>> I realise you're specifying all of the operating points here but the 
>> clock only needs to appear once i.e.
>>
>> 1 x 300 MHz
>> 1 x 400 MHz
>> 1 x 480 MHz
>>
>> etc.
>>
> 
> Sure, will update in next series.
> 
>>> +                { 400000000, 480000000, 480000000, 480000000, 
>>> 480000000 },
>>> +                { 300000000, 300000000, 400000000, 400000000, 
>>> 400000000 },
>>> +                { 300000000, 300000000, 400000000, 400000000, 
>>> 400000000 } },
>>> +        .reg = { "vfe_lite1" },
>>> +        .interrupt = { "vfe_lite1" },
>>> +        .vfe = {
>>> +            .line_num = 4,
>>> +            .is_lite = true,
>>> +            .hw_ops = &vfe_ops_780,
>>> +            .formats_rdi = &vfe_formats_rdi_845,
>>> +            .formats_pix = &vfe_formats_pix_845
>>> +        }
>>> +    },
>>> +};
> 
>>> +void camss_reg_update(struct camss *camss, int hw_id, int port_id, 
>>> bool is_clear)
>>> +{
>>> +    struct csid_device *csid;
>>> +
>>> +    if (hw_id < camss->res->csid_num) {
>>
>> Does this cause do anything ? Is it just defensive programming ? Can 
>> the hw_id index exceed the number of CSIDs defined and if so why ?
>>
>> Smells wrong.
>>
> 
> It is just a defensive programming, just like some null pointer checking.

Right so, please drop then. We require the indexes to be in range in 
order to merge, our job is to make sure this is so.

Lets just reason about the code and make sure the indexes are right.

---
bod


