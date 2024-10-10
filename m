Return-Path: <linux-arm-msm+bounces-33795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50213997F46
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 10:18:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D23C1C23E6D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 08:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B801CF5CD;
	Thu, 10 Oct 2024 07:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hp3lW6mn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E7B195390;
	Thu, 10 Oct 2024 07:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728544566; cv=none; b=UGnLX9gbgACtfCSqiXwa2FpJdFH+55Z6627c0lo1k90AwyefuJipVs+udoqLEnXeTGv+kZQPLSsZJRzJFOIG2jwKS3kMmiyxC+5dt0PNr70oEYdQTH4NsaTmnreZwG5H8elybZUTNyd7ILujR+4H5CJcclvzKOZH3caCN+aDXMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728544566; c=relaxed/simple;
	bh=drsg3VRIXQztC5tLFtVhcFRd98uKLaK+3DRFgQTrYFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JSlZa0ORSxtYHz3ub0W0F2UFSi6eGZ19YsQz4mIOOtOY1LGEzVFhB+MwVtlg1/xFpn9BgE9Z9L8C4aEjjvmsplaVuFWUa32jqSoszkiKjNxh/5as+fmwnGWw4mhOlR/7JMN6pxaPiSO+IVN/rCAD1cKOJ69F27Su1EED0bGGHD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hp3lW6mn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17A1AC4CEC5;
	Thu, 10 Oct 2024 07:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728544566;
	bh=drsg3VRIXQztC5tLFtVhcFRd98uKLaK+3DRFgQTrYFw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hp3lW6mnbK0jx7EI0HliZfd0odArwHFCNnmQZGgW9dpaQs5pG6q2NUS6461nHeagX
	 PGTLF0rU8d/3hzGNJexBDRiuvsHoc7Jb3UE2pDBJaa9B1bPFrh0kzwcjpAYNRf/Pc6
	 70N4+c3QMSrlx8op2GOltSe9rJTZXncjxEyrIgvoinzwU1o5wNjLjt2Wa5bY46tYvw
	 gLctvCGsAgY/2laDbUj3MbcIBkN/0dD/v232AWmwww5nbIjJ3I5CkH3RzTN6oQZdmm
	 iPYHi5/EUP6vax/q8NVMzeK0rdTo1AXi+UeLTOX6vBaEBOWqVhpvGHcZNcD2C8+bWO
	 MlxoecPthM2OQ==
Message-ID: <f94de63b-2ca3-4749-b008-b47d6df8e1ff@kernel.org>
Date: Thu, 10 Oct 2024 09:15:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: remoteproc: qcom,pas-common: Introduce
 iommus and qcom,devmem property
To: Shiraz Hashim <quic_shashim@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Mukesh Ojha <quic_mojha@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241004212359.2263502-1-quic_mojha@quicinc.com>
 <20241004212359.2263502-2-quic_mojha@quicinc.com>
 <pt5x7miszg3vrqjimhdfesxghnpdsu4zzdr37vcmuze7yccmkn@twjeb5cfdqph>
 <ZwP/tA06k6we7uUh@hu-mojha-hyd.qualcomm.com>
 <CAA8EJpqay7Nryb5HwwHE1+iiMXKUvqi-djmCsYN8fxigt-s-tQ@mail.gmail.com>
 <20241009140419.GH1421305@hu-shashim-hyd.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241009140419.GH1421305@hu-shashim-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/10/2024 16:04, Shiraz Hashim wrote:
> On Mon, Oct 07, 2024 at 06:25:01PM +0200, Dmitry Baryshkov wrote:
>> On Mon, 7 Oct 2024 at 17:35, Mukesh Ojha <quic_mojha@quicinc.com> wrote:
>>>
>>> On Sun, Oct 06, 2024 at 10:38:01PM +0300, Dmitry Baryshkov wrote:
>>>> On Sat, Oct 05, 2024 at 02:53:54AM GMT, Mukesh Ojha wrote:
>>>>> From: Shiraz Hashim <quic_shashim@quicinc.com>
>>>>>
>>>>> Qualcomm’s PAS implementation for remote processors only supports a
>>>>> single stage of IOMMU translation and is presently managed by the
>>>>> Qualcomm EL2 hypervisor (QHEE) if it is present. In the absence of QHEE,
>>>>> such as with a KVM hypervisor, IOMMU translations need to be set up by
>>>>> the KVM host. Remoteproc needs carveout memory region and its resource
>>>>> (device memory) permissions to be set before it comes up, and this
>>>>> information is presently available statically with QHEE.
>>>>>
>>>>> In the absence of QHEE, the boot firmware needs to overlay this
>>>>> information based on SoCs running with either QHEE or a KVM hypervisor
>>>>> (CPUs booted in EL2).
>>>>>
>>>>> The qcom,devmem property provides IOMMU devmem translation information
>>>>> intended for non-QHEE based systems.
>>>>>
>>>>> Signed-off-by: Shiraz Hashim <quic_shashim@quicinc.com>
>>>>> Co-Developed-by: Mukesh Ojha <quic_mojha@quicinc.com>
>>>>> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
>>>>> ---
>>>>>  .../bindings/remoteproc/qcom,pas-common.yaml  | 42 +++++++++++++++++++
>>>>>  .../bindings/remoteproc/qcom,sa8775p-pas.yaml | 20 +++++++++
>>>>>  2 files changed, 62 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>>>>> index 63a82e7a8bf8..068e177ad934 100644
>>>>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>>>>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>>>>> @@ -52,6 +52,48 @@ properties:
>>>>>      minItems: 1
>>>>>      maxItems: 3
>>>>>
>>>>> +  iommus:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  qcom,devmem:
>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
>>>>> +    description:
>>>>> +      Qualcomm’s PAS implementation for remote processors only supports a
>>>>> +      single stage of IOMMU translation and is presently managed by the
>>>>> +      Qualcomm EL2 hypervisor (QHEE) if it is present. In the absence of QHEE,
>>>>> +      such as with a KVM hypervisor, IOMMU translations need to be set up by
>>>>> +      the KVM host. Remoteproc might need some device resources and related
>>>>> +      access permissions to be set before it comes up, and this information is
>>>>> +      presently available statically with QHEE.
>>>>> +
>>>>> +      In the absence of QHEE, the boot firmware needs to overlay this
>>>>> +      information based on SoCs running with either QHEE or a KVM hypervisor
>>>>> +      (CPUs booted in EL2).
>>>>> +
>>>>> +      The qcom,devmem property provides IOMMU devmem translation information
>>>>> +      intended for non-QHEE based systems. It is an array of u32 values
>>>>> +      describing the device memory regions for which IOMMU translations need to
>>>>> +      be set up before bringing up Remoteproc. This array consists of 4-tuples
>>>>> +      defining the device address, physical address, size, and attribute flags
>>>>> +      with which it has to be mapped.
>>>>
>>>> I'd expect that this kind of information is hardware-dependent. As such
>>>> it can go to the driver itself, rather than the device tree. The driver
>>>> can use compatible string to select the correct table.
>>>>
>>>
>>> IIUC, are you saying that to move this into driver file and override the
>>> compatible string via overlay ?
>>
>> Ideally we should live without compat overrides. On the other hand,
>> sc7180 and sc7280 provide an example of doing exactly that.
> 
> I am not sure if there can arise a case where updated adsp firmware
> for particular board(s) may require additional access.
> 
> Having it in device tree adds a convenience to deal with such
> variance. 
> 

That's a downstream argument... Just look at the downstream DTS.
Everything, even software properties, can be added to DT, right?

Best regards,
Krzysztof


