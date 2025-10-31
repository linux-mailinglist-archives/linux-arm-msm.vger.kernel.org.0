Return-Path: <linux-arm-msm+bounces-79961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E20FC26DAA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 21:03:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 412EC4F0A48
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 20:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 700E2324B1B;
	Fri, 31 Oct 2025 20:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zG+OIw9J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352A93254BA
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 20:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761940996; cv=none; b=qIrfhHnLdtRskvm5wkpYVl+ZiMj5FD8tSnVSg3gmgTyOEy7VCAIj+tDs/gGNIYiTawSp/gdgUIjPPnggeeD8TN9bQqtxT2vD01nn7bw8KWgUApMJY0gbE6/XRvaJ9cfNSb5zDpr5qYIRnrmwk0hWlT9AD2ra6fhoXLnLzAnF16M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761940996; c=relaxed/simple;
	bh=pekSXNuOJMyQ4q/03RRiUcweDeleMd9ySR1swHqoG2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UiYjoPthYZdbYOfJ6CMwmNU3wrNq+swCzp8T0TybE9zfKn6WubVWrzJaHJaRhLbLzpnZJVy8zyfQqEQTsX/o/lWyHuGHqU7XgD53n9fmlzBJ6aBu0PtcwUloDiT0XpSDdL8860GdpoWJBMnshrNzCz8DZRgjZEQluBqf7hjRltQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zG+OIw9J; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-429babfccd9so2099282f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 13:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761940992; x=1762545792; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xFMVGK4JZfy5QeK8e6Y4XSDkgKnmVKBnb6mic7gpxPA=;
        b=zG+OIw9JX/g+K8YvO1AnHc8FdFTEuUiURKYFBVHHVHT+E9H6fF5VuEVJKZVUW1ka1M
         xVEitGOnOod8nts9esNXBYZvnUMM/kMs5Kno5FGMJ+RxNBAINf751mVtg57uVfjbx/cO
         Xjv0cvz///XNiihUbTjBmTpkfe3i/nlmd8hIVTbYk/DhJjV7Fi5JqhMiMy7yynGnVsm4
         HYsPH/qIWuazqK1TC+IUwtPCbQIskeQbqphyMD/oDegNE3Mze/ipw9zP/HbrRS6uzzKK
         JxByuOjexKxXgZb0+H6Ov1SsTKqB0VMTvHBs6g+LhAXZuEB7wYKgegwhqyLmEnEZC7Jg
         3OSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761940992; x=1762545792;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xFMVGK4JZfy5QeK8e6Y4XSDkgKnmVKBnb6mic7gpxPA=;
        b=W+v/8zHFEwD8fYrrr/CoO9In81hh0LCqbCHHGSFwjnL406iTzogX1yP/4NXQlzmrKU
         ymsc5i6uppgrnxuaO9o9jscDFdL2MvHUau9MNcX8YT6kCEuzgLkZQ8sZ6q0wkda4oYzX
         QYSg7pWmSyGSyZbFhpzMXPROeIyZ5CwS1rFRb9sGBSvVYHbSvGOqcwrWkxz/6jh5O5/c
         jA5rI9Zv7U79L0VgSNHtaDR7Q9ct9CwRQPDiRd7CAvSASMl1SmkCpYRODO9lO9fkP3g0
         DrxYOJ49klA5vsmxANKfmLIg9gCjEeAUHGchSJTUmrb8dQGf34COgp6OkTidObNQs7F0
         duBg==
X-Forwarded-Encrypted: i=1; AJvYcCXk6NOrXwuBmM//cpbNCQuzD8vu4JLejXo0Bdj3PhDXcYRyoku/IpQ2LE0e9Tt3cWBD+NgwLJQvc3pvBs91@vger.kernel.org
X-Gm-Message-State: AOJu0YyGxR698eZL54uF3j32LErU38cb9QqYjHrxMnBqXzBB8kgW3WRi
	cN+p1xx51xok1BvUQp8UwQIhnsT+o5lzFlEderCcr733pqdbgN2zg77wFcMoeTqY9uU=
X-Gm-Gg: ASbGncuvOODX5zPvJOer/edUo5FmHZjVxdAtEx6AyuukpIuNSDSVcyMML2rZOqu/bTD
	PCFHfu5QiIW2v7xNBYeeW7fCCombrqD0Hqqoj3mscHhZntIVt1XINXaKGsWG2ujEBtvn88r/uNS
	xItcWT4zi/pvBcY8SXSn22j5+u9osmSLEQUarj8BjpAbDUwYrfiw/bcEQ1zs8ko0aqSr4EUcJRl
	0wIvPnVWX/4bpf1m2LGaLxFdp8kS5WqIC5LF8yL4blcaLsg5oV6syaOX988OV1O0qNfsmzhnRYo
	Lr4Rudi3z6kBEUqVuD0g6iqTPR+3a2JGpPGYY9A7Q3KrzEpKbsnHvvoz54FGXAWyjbYS/aLsLBx
	yfnmb+bUSj/XgUlUXEw6Y9MDm7oWG9uV0P3Gw/tBbRxE2kQ1pu+Fsn9FK52mvFuWzpxVsAk2Alr
	pQrwCkHMBx4DdIHlm2ws62t5sDOtqBf9x3IdhqeXm8vAvo5pgRMef6
X-Google-Smtp-Source: AGHT+IFoDMNezZ2FtdDg+VeeaZkZr+rjEweVUyAajc2RHfvBBmHoP8hagvjjFPsfAx8iIgtKBiyJ6A==
X-Received: by 2002:a5d:5d11:0:b0:427:697:c2db with SMTP id ffacd0b85a97d-429bd6860f9mr4454371f8f.20.1761940992311;
        Fri, 31 Oct 2025 13:03:12 -0700 (PDT)
Received: from [192.168.0.21] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4772fc524ddsm27384415e9.7.2025.10.31.13.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 13:03:11 -0700 (PDT)
Message-ID: <3c35c36d-c116-4a1d-91c8-ae1ee2e1f840@linaro.org>
Date: Fri, 31 Oct 2025 20:03:09 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] media: dt-bindings: Add CAMSS device for Kaanapali
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
 yijie.yang@oss.qualcomm.com, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251030-add-support-for-camss-on-kaanapali-v5-0-f8e12bea3d02@oss.qualcomm.com>
 <20251030-add-support-for-camss-on-kaanapali-v5-2-f8e12bea3d02@oss.qualcomm.com>
 <631e4da1-92a0-4d44-b92e-bdcc56196c26@linaro.org>
 <e9da04ab-5119-4bfd-a25c-50e7b2ef05d3@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <e9da04ab-5119-4bfd-a25c-50e7b2ef05d3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 31/10/2025 17:39, Vijay Kumar Tumati wrote:
> 
> On 10/31/2025 6:50 AM, Bryan O'Donoghue wrote:
>> On 31/10/2025 02:59, Hangxiang Ma wrote:
>>> Add the compatible string "qcom,kaanapali-camss" to support the Camera
>>> Subsystem (CAMSS) on the Qualcomm Kaanapali platform.
>>>
>>> The Kaanapali platform provides:
>>> - 3 x VFE, 5 RDI per VFE
>>> - 2 x VFE Lite, 4 RDI per VFE Lite
>>> - 3 x CSID
>>> - 2 x CSID Lite
>>> - 6 x CSIPHY
>>>
>>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>> ---
>>>   .../bindings/media/qcom,kaanapali-camss.yaml       | 406 ++++++++++ 
>>> +++++++++++
>>>   1 file changed, 406 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/qcom,kaanapali- 
>>> camss.yaml b/Documentation/devicetree/bindings/media/qcom,kaanapali- 
>>> camss.yaml
>>> new file mode 100644
>>> index 000000000000..c34867022fd1
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/media/qcom,kaanapali-camss.yaml
>>> @@ -0,0 +1,406 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/media/qcom,kaanapali-camss.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm Kaanapali Camera Subsystem (CAMSS)
>>> +
>>> +maintainers:
>>> +  - Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>>> +
>>> +description:
>>> +  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: qcom,kaanapali-camss
>>> +
>>> +  reg:
>>> +    maxItems: 16
>>> +
>>> +  reg-names:
>>> +    items:
>>> +      - const: csid0
>>> +      - const: csid1
>>> +      - const: csid2
>>> +      - const: csid_lite0
>>> +      - const: csid_lite1
>>> +      - const: csiphy0
>>> +      - const: csiphy1
>>> +      - const: csiphy2
>>> +      - const: csiphy3
>>> +      - const: csiphy4
>>> +      - const: csiphy5
>>> +      - const: vfe0
>>> +      - const: vfe1
>>> +      - const: vfe2
>>> +      - const: vfe_lite0
>>> +      - const: vfe_lite1
>>
>> No test pattern generator on this part ?
>>
>> We have patches in-flight to add TPG so it makes no sense to omit 
>> these registers from current or new submissions.
>>
>> https://lore.kernel.org/linux-media/20251017-camss_tpg-v5-1- 
>> cafe3ad42163@oss.qualcomm.com/
>>
>> While we're at it we should consider adding in the other key 
>> functional blocks.
>>
>> OFE, IPE etc, there's no harm in including the registers even if the 
>> intention and outcome is never switching that functionality on.
>>
> Hi Bryan, we have quite a few register spaces on Kaanapali or any other 
> target that are not required for the RDI only CAMSS driver, including 
> ICP, JPEG, OFE, IPE, CDMs and some custom modules like CRE along with 
> the TPG. So do I understand your suggestion correctly that you advise 
> all of those are enlisted in the DTSI and the bindings although the 
> driver doesn't make use of or map them?

TPG is in process of being upstreamed by qcom.

I think the list of registers above should be included in the dts 
because the DTS is a description of hardware, not a description of 
camss/rdi.

The point of DTS is to do that, describe hardware and to be consumable 
outside of the upstream linux kernel.

u-boot, BSD, potentially even a downstream Linux kernel or driver.

>>> +
>>> +  clocks:
>>> +    maxItems: 34
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: camnoc_nrt_axi
>>> +      - const: camnoc_rt_axi
>>> +      - const: camnoc_rt_vfe0
>>> +      - const: camnoc_rt_vfe1
>>> +      - const: camnoc_rt_vfe2
>>> +      - const: camnoc_rt_vfe_lite
>>> +      - const: cam_top_ahb
>>> +      - const: cam_top_fast_ahb
>>> +      - const: csid
>>> +      - const: csid_csiphy_rx
>>> +      - const: csiphy0
>>> +      - const: csiphy0_timer
>>> +      - const: csiphy1
>>> +      - const: csiphy1_timer
>>> +      - const: csiphy2
>>> +      - const: csiphy2_timer
>>> +      - const: csiphy3
>>> +      - const: csiphy3_timer
>>> +      - const: csiphy4
>>> +      - const: csiphy4_timer
>>> +      - const: csiphy5
>>> +      - const: csiphy5_timer
>>> +      - const: gcc_hf_axi
>>> +      - const: vfe0
>>> +      - const: vfe0_fast_ahb
>>> +      - const: vfe1
>>> +      - const: vfe1_fast_ahb
>>> +      - const: vfe2
>>> +      - const: vfe2_fast_ahb
>>> +      - const: vfe_lite
>>> +      - const: vfe_lite_ahb
>>> +      - const: vfe_lite_cphy_rx
>>> +      - const: vfe_lite_csid
>>> +      - const: qdss_debug_xo
>>> +
>>> +  interrupts:
>>> +    maxItems: 16
>>> +
>>> +  interrupt-names:
>>> +    items:
>>> +      - const: csid0
>>> +      - const: csid1
>>> +      - const: csid2
>>> +      - const: csid_lite0
>>> +      - const: csid_lite1
>>> +      - const: csiphy0
>>> +      - const: csiphy1
>>> +      - const: csiphy2
>>> +      - const: csiphy3
>>> +      - const: csiphy4
>>> +      - const: csiphy5
>>> +      - const: vfe0
>>> +      - const: vfe1
>>> +      - const: vfe2
>>> +      - const: vfe_lite0
>>> +      - const: vfe_lite1
>>> +
>>> +  interconnects:
>>> +    maxItems: 2
>>> +
>>> +  interconnect-names:
>>> +    items:
>>> +      - const: ahb
>>> +      - const: hf_mnoc
>>> +
>>> +  iommus:
>>> +    maxItems: 1
>>
>>
>> This can't be right.
>>
>> The experience we are having with Iris for example shows that 
>> restricting the iommus is wrong.
>>
>> For this and future bindings I'm expecting to see the full list of 
>> AC_VM_HLOS S2 VMID targets.
>>
>> The second we try to switch on say something like the JPEG encoder 
>> this list and its upstream binding becomes a problem.
>>
>> - S1_IFE_HLOS        @ 0x1c00
>> - S1_CDM_BPS_IPS_HLOS    @ 0x1820
>> - S1_CDM_BPS_IPS_HLOS    @ 0x18c0
>> - S1_CDM_BPS_IPS_HLOS    @ 0x1980
>> - S1_CDM_BPS_IPS_HLOS    @ 0x1800
>> - S1_JPEG_HLOS        @ 0x18a0
>> - S1_RT_CDM_HLOS    @ 0x1860
>> - S1_CDM_BPS_IPE_HLOS    @ 0x1840
>> - S1_CDM_BPS_IPE_HLOS    @ 0x1880
>> - S1_CRE_HLOS        @ 0x18e0
>>
>> The ICP mappings can come later if ever via iommu-maps..
>>
>> ---
>> bod
>>
> Similar to the above, You are advising to declare all the S2 HLOS mapped 
> streams in the bindings and the DTSI? If we do that in the DTSI, I 
> wonder how we can specifically map the RDI output buffers to the IFE 
> context bank only, for instance, going by the current CAMSS driver 
> implementation. Perhaps, IFE should be the first one in the list for now 
> and the driver will be extended later when we support more devices? I 
> will explore on that. Good to understand these details and practices. 
> Thank you.
> 

We've run into trouble with that in Iris.

https://lore.kernel.org/linux-arm-msm/c9d8f76a-513f-4a09-bba4-cb8f0df1d2fe@kernel.org/

The right thing to do is to describe everything that targets the HLOS - 
main CPU.

For non CPU targets - like say setting up the SMMU for the ICP - we 
could add those mappings in with iommu-map later.

The CPU side SID map should be complete. It doesn't divulge any 
propitiatory information or secret sauce, it just makes our lives easier 
in the end.

---
bod

