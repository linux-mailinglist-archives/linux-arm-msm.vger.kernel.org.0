Return-Path: <linux-arm-msm+bounces-83106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CBAC8199F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 17:36:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7A78B3470D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 16:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 421B929AB11;
	Mon, 24 Nov 2025 16:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="nQfbJhwS";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="vJdZ6dKD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F55298CA5;
	Mon, 24 Nov 2025 16:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764002063; cv=none; b=bY0J7p4m/u6Req84KUQJX6Oung5e81TLxmdhImWW4PdlBIHRYZZbkpgiUFbWMy8fcDB/VQMqmD4+cLnr+sJhRmGgYzcTUc4CbBmoG87Z2jBDOaVp8kX8tPDafraksuqbIeNN0RAjfcENMC682Ry1RIMZP1cJb4EUzun1FzGhWuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764002063; c=relaxed/simple;
	bh=bLNUntFA190P6T8OWsNO75VHvXpIqvxazFS9OQAK+00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bmCM4vk9zrsQVQ8rAOJEJ9VuWiv99IB1Rt6ukxOBqcKRwxJKm8FXZe5r0hYo4tQ03a5/G68szEyllvx/xlFssVdt09Xj1tcbiog0kGR5QvXeryv7NAaUy8gMQsMpBbSKjuJw+WdUVjVNBpgFAPByns91RQQMUYQQ1z7bRLIf1EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=nQfbJhwS; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=vJdZ6dKD; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1764002016; bh=t3iiIyLjsNz/9iVAMYIb9dy
	URt3jS7A9CBG5Ng6Av9Y=; b=nQfbJhwSl9Ch9At1qj8ZxBVu1yTESs/6Ita7lz87gRh0oEdmRF
	pYDMoaiNwIXyw+2Dn35oHHOX0smmzvlvpKYPLVZNJCH/m4AdW4/Bjvxj3fJxx0kBP34pxtO2/r8
	weMUdZLbnOb8CZubo/HkV5PZjbGsCIjqcKJlJ41OaSlDG2nHpvfsDW0c9eo14PY9m3u0kRAihC4
	TNbZtQInqWjVoljQ9JiXGiGbQM2q9VCwvD6cJDvdzGNwUpg1yiuuLGRme3RhDqRVpx4M+fBbp8D
	LJQpNlJF4Cbn0DBoJDbiyBkW/Sybov++p3ymWZaGCeLDTj1a5nWDeN/HXjGRz+nPfFg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1764002016; bh=t3iiIyLjsNz/9iVAMYIb9dy
	URt3jS7A9CBG5Ng6Av9Y=; b=vJdZ6dKDcB2EuUtgFlmkCD8dUw8eicd0/J/MOuiMxHBeAFGUIR
	T4uzKO/2MejgCHoQHq9Rlz0EqOhTQ7fshGBQ==;
Message-ID: <87d40d9d-0b04-4bfe-b035-260e094d1886@mainlining.org>
Date: Mon, 24 Nov 2025 19:33:35 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sdm630/660: Add CDSP-related
 nodes
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
 Chenna Kesava Raju <chennak@qti.qualcomm.com>,
 Bharath Kumar <bkumar@qti.qualcomm.com>
References: <a3cb6633-1595-41e7-8e87-ca48a98f822c@mainlining.org>
 <83c3aea5-764e-4e60-8b16-67b474f19357@oss.qualcomm.com>
 <d17548bb-ddce-4d60-8dc4-2c0633989299@oss.qualcomm.com>
 <f5c7eb1c-28b1-4cf1-afb0-b993384b7712@oss.qualcomm.com>
 <80836b8f-16a8-4520-ad11-5ca0abb3403e@oss.qualcomm.com>
 <99c22e73-797c-4a30-92ba-bc3bd8cf70f0@oss.qualcomm.com>
 <eddc16cb-d951-401c-8fb8-fccfcf600143@mainlining.org>
 <0b06f744-b695-43d9-8da3-4424e2b53a5e@oss.qualcomm.com>
 <24221ce7-24e4-4eaa-8681-ed9b4b9f2d6e@oss.qualcomm.com>
 <be4e2715-882d-4358-8575-374187f7ee2f@oss.qualcomm.com>
 <2h222ejvc37cldeno7e4qom5tnvdblqn2zypuquvadbcu7d3pr@765qomrwfvwl>
 <f0c41563-dcd1-4cf9-8b73-fb9fedd52710@mainlining.org>
 <bacb6293-a4e3-4d23-8a1f-cf42f221ba4b@mainlining.org>
 <51e5945d-e800-4f97-8e2e-f97f61b76fc8@oss.qualcomm.com>
Content-Language: ru-RU, en-US
From: Nickolay Goppen <setotau@mainlining.org>
In-Reply-To: <51e5945d-e800-4f97-8e2e-f97f61b76fc8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


24.11.2025 18:29, Ekansh Gupta пишет:
>
> On 11/24/2025 8:32 PM, Nickolay Goppen wrote:
>> 23.11.2025 13:51, Nickolay Goppen пишет:
>>> 21.11.2025 15:09, Dmitry Baryshkov пишет:
>>>> On Fri, Nov 21, 2025 at 01:41:21PM +0530, Ekansh Gupta wrote:
>>>>> On 11/20/2025 5:17 PM, Konrad Dybcio wrote:
>>>>>> On 11/20/25 11:54 AM, Ekansh Gupta wrote:
>>>>>>> On 11/20/2025 1:27 PM, Nickolay Goppen wrote:
>>>>>>>> 20.11.2025 07:55, Ekansh Gupta пишет:
>>>>>>>>> On 11/20/2025 1:58 AM, Srinivas Kandagatla wrote:
>>>>>>>>>> On 11/12/25 1:52 PM, Konrad Dybcio wrote:
>>>>>>>>>>> On 11/10/25 6:41 PM, Srinivas Kandagatla wrote:
>>>>>>>>>>>> On 11/3/25 12:52 PM, Konrad Dybcio wrote:
>>>>>>>>>>>>> On 10/31/25 12:30 PM, Nickolay Goppen wrote:
>>>>>>>>>>>>>> 24.10.2025 16:58, Nickolay Goppen пишет:
>>>>>>>>>>>>>>> 24.10.2025 11:28, Konrad Dybcio пишет:
>>>>>>>>>>>>>>>> On 10/23/25 9:51 PM, Nickolay Goppen wrote:
>>>>>>>>>>>>>>>>> In order to enable CDSP support for SDM660 SoC:
>>>>>>>>>>>>>>>>>      * add shared memory p2p nodes for CDSP
>>>>>>>>>>>>>>>>>      * add CDSP-specific smmu node
>>>>>>>>>>>>>>>>>      * add CDSP peripheral image loader node
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> Memory region for CDSP in SDM660 occupies the same spot as
>>>>>>>>>>>>>>>>> TZ buffer mem defined in sdm630.dtsi (which does not have CDSP).
>>>>>>>>>>>>>>>>> In sdm660.dtsi replace buffer_mem inherited from SDM630 with
>>>>>>>>>>>>>>>>> cdsp_region, which is also larger in size.
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> SDM636 also doesn't have CDSP, so remove inherited from sdm660.dtsi
>>>>>>>>>>>>>>>>> related nodes and add buffer_mem back.
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>>>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>>> [...]
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> + label = "turing";
>>>>>>>>>>>>>>>> "cdsp"
>>>>>>>>>>>>>>> Ok, I'll change this in the next revision.
>>>>>>>>>>>>>>>>> + mboxes = <&apcs_glb 29>;
>>>>>>>>>>>>>>>>> +            qcom,remote-pid = <5>;
>>>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>>> +            fastrpc {
>>>>>>>>>>>>>>>>> +                compatible = "qcom,fastrpc";
>>>>>>>>>>>>>>>>> +                qcom,glink-channels = "fastrpcglink-apps-dsp";
>>>>>>>>>>>>>>>>> +                label = "cdsp";
>>>>>>>>>>>>>>>>> + qcom,non-secure-domain;
>>>>>>>>>>>>>>>> This shouldn't matter, both a secure and a non-secure device is
>>>>>>>>>>>>>>>> created for CDSP
>>>>>>>>>>>>>>> I've added this property, because it is used in other SoC's, such as SDM845 and SM6115 for both ADSP and CDSP
>>>>>>>>>>>>>> Is this property not neccessary anymore?
>>>>>>>>>>>>> +Srini?
>>>>>>>>>>>> That is true, we do not require this for CDSP, as CDSP allows both
>>>>>>>>>>>> unsigned and signed loading, we create both secured and non-secure node
>>>>>>>>>>>> by default. May be we can provide that clarity in yaml bindings so that
>>>>>>>>>>>> it gets caught during dtb checks.
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> However in ADSP case, we only support singed modules, due to historical
>>>>>>>>>>>> reasons how this driver evolved over years, we have this flag to allow
>>>>>>>>>>>> compatiblity for such users.
>>>>>>>>>>> Does that mean that we can only load signed modules on the ADSP, but
>>>>>>>>>>> the driver behavior was previously such that unsigned modules were
>>>>>>>>>>> allowed (which was presumably fine on devboards, but not on fused
>>>>>>>>>>> devices)?
>>>>>>>>>> Yes, its true that we allowed full access to adsp device nodes when we
>>>>>>>>>> first started upstreaming fastrpc driver.
>>>>>>>>>>
>>>>>>>>>> irrespective of the board only signed modules are supported on the ADSP.
>>>>>>>>>> I think there was one version of SoC i think 8016 or some older one
>>>>>>>>>> which had adsp with hvx which can load unsigned modules for compute
>>>>>>>>>> usecase only.
>>>>>>>>>>
>>>>>>>>>> I have added @Ekansh for more clarity.
>>>>>>>>>>
>>>>>>>>>> --srini
>>>>>>>>> For all the available platforms, ADSP supports only signed modules. Unsigned
>>>>>>>>> modules(as well as signed) are supported by CDSP and GDSP subsystems.
>>>>>>>>>
>>>>>>>>> qcom,non-secure-domain property marks the corresponding DSP as non-secure DSP.
>>>>>>>>> The implications of adding this property would be the following:
>>>>>>>>> on ADSP, SDSP, MDSP:
>>>>>>>>> - Only non-secure device node(/dev/fastrpc-Xdsp) is created.
>>>>>>>>> - Non-secure device node can be used for signed DSP PD offload.
>>>>>>>>>
>>>>>>>>> on CDSP, GDSP:
>>>>>>>>> - Both secure(/dev/fastrpc-Xdsp-secure) and non-secure(/dev/fastrpc-Xdsp) devices
>>>>>>>>>      are created, regardless of this property.
>>>>>>>>> - Both the nodes can be used for signed and unsigned DSP PD offload.
>>>>>>>>>
>>>>>>>>> Note: If the property is not added for CDSP/GDSP, only secure device node can
>>>>>>>>> be used for signed PD offload, if non-secure device is used, the request gets
>>>>>>>>> rejected[1].
>>>>>>>>>
>>>>>>>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1245
>>>>>>>>>
>>>>>>>>> //Ekansh
>>>>>>>> Does this mean that the qcom,non-secure-domain property should be dropped from both nodes?
>>>>>>> I checked again and found that unsigned module support for CDSP is
>>>>>>> not available on this platform. Given this, the safest approach would
>>>>>>> be to add the property for both ADSP and CDSP, ensuring that all
>>>>>>> created device nodes can be used for signed PD offload. I can provide
>>>>>> The property allows *unsigned* PD offload though
>>>>> I don't think I can directly relate this property to unsigned PD offload. This is just
>>>>> defining what type of device node will be created and whether the channel is secure
>>>>> or not. There is a possibility of making unsigned PD request(on CDSP/GDSP) irrespective
>>>>> of whether this property is added or not. If DSP does not support unsigned offload, it
>>>>> should return failures for such requests.
>>>> Which part of the hardware and/or firmware interface does it define? If
>>>> it simply declared Linux behaviour, it is incorrect and probably should
>>>> be dropped.
>>> I still don't understand, do I need this property or not?
>> I've began testing the FastRPC on CDSP and the command
>>
>> sudo fastrpc_test -d 3 -U 1 -t linux -a v68
>> has caused the following errors:
>>
>> [   60.810545] arm-smmu 5180000.iommu: Unhandled context fault: fsr=0x402, iova=0xfffff000, fsynr=0x1, cbfrsynra=0x6, cb=3
>> [   60.810588] arm-smmu 5180000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x6
>> [   60.810603] arm-smmu 5180000.iommu: FSYNR0 = 00000001 [S1CBNDX=0 PLVL=1]
>> [   60.815657] qcom_q6v5_pas 1a300000.remoteproc: fatal error received: :0:EX:kernel:0:frpck_0_0:77:PC=c0117de0
>> [   60.815684] remoteproc remoteproc2: crash detected in cdsp: type fatal error
>> [   60.815738] remoteproc remoteproc2: handling crash #1 in cdsp
>> [   60.815754] remoteproc remoteproc2: recovering cdsp
>> [   60.819267] (NULL device *): Error: dsp information is incorrect err: -32
> Are you trying out only calculator or all the libs? If yes, can you please
> help with creating an issue in the above mentioned github project?
>
> On older platforms, I would suggest to only try with calculator as other
> libs are not stable.
>
> We are getting a better version of other test libs signed and will update
> the project with new libs post signing.
>
> //Ekansh
I've tested the calculator only and it also fails. I think that the CDSP 
has Hexagon version v60, that is lower than minimal v68 in the repo. I 
can help with creating an issue, what should I do?
>>
>>>>>>> a more definitive recommendation once I know the specific use cases
>>>>>>> you plan to run.
>>>>>> Why would the usecase affect this?
>>>>> I'm saying this as per past discussions where some application was relying on non-secure
>>>>> device node on some old platform(on postmarketOS)[1] and having this property in place.
>>>>> So if similar usecase is being enabled here, the property might be required[1].
>>>> DT files are not usecase-based.
>>>>
>>>>> [1] https://lkml.org/lkml/2024/8/15/117

-- 
Best regards,
Nickolay


