Return-Path: <linux-arm-msm+bounces-83085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A1FC8137F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 16:02:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 095EF4E128D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 15:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D030289811;
	Mon, 24 Nov 2025 15:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Yes+e4yF";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="rmldshq9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A180258CE9;
	Mon, 24 Nov 2025 15:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763996561; cv=none; b=c71wNzMhGVt4y/4B7lsUZCPB7l1F23DueplwgZ7GLa1Gtarax9EuID94IrThu1IrcZWENtuGQAmzcFh8spH4d3ClPborkIk4Pv7S6fohumQrNKYXlG4+mXy+rfWaeuHinAyg+eVsMa0iet4oqb+4tV1buzquzfWQrE6L+INPvaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763996561; c=relaxed/simple;
	bh=MUSwhtgm3BCGsY/Yl3RMNuN5ZtNDXiP3mjH6apWIBWM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=FfYUjqNVKKsIASvrNXPf0kjOIbzUAralGxvpIBc3fkynQQm2AkLyUdFh1hMu7VPC0yY2poEyG48XwWdGQXDhlaDER+/G5ppAxw1SFMaBbN2Bs4yWeBnTcgzPnlBTf0fDFAHSLUBe3PhdaEqfHhHhKNlK4a/nt6u07X/3QkusXKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Yes+e4yF; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=rmldshq9; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:From:Subject:Date:Message-ID; t=1763996550; bh=BEapyRxXsmfjY6bhePE1aSR
	Gz1P0rziFs5A6ZoN1Afg=; b=Yes+e4yFOvIMy8Iz8H8ZTszQ/5u1gYi4N5VKqISehvrpVLWxD5
	sGvfSEinL3igowtVgsxe+Uc9/oa+p+PyotLtWmYEVy/tUmoWoXHQy17g5v/POD1sZg1G9bGOiWZ
	jyorZZRzI0HX2epAjt4qG21H4jHT6qpyScLcXdTiRYLgC7ORzvuqR2Lnfx2/0+P3gQzVqDHU1gG
	dOL4Nii4TNiKh5JPUV9gNS5AzBC4mbN5o/PW8f+zq8j4/Y8tfjNaBZkv6fVyI7f7AmfAV0/yObs
	QWzpGryQbCe5aoPVwZpNgId2MrAkLGMWaqBFkBmgNTztkO1dhFBAt0KLq8OvsExMd+A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:From:Subject:Date:Message-ID; t=1763996550; bh=BEapyRxXsmfjY6bhePE1aSR
	Gz1P0rziFs5A6ZoN1Afg=; b=rmldshq9bDSDnGF49ZzwV0C+EZRzRFERlhUvJjfZFj2Z2Ymra1
	pmyionvh9Y7d5eWiBBkB/w+lPr1rg6APYEDA==;
Message-ID: <bacb6293-a4e3-4d23-8a1f-cf42f221ba4b@mainlining.org>
Date: Mon, 24 Nov 2025 18:02:29 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sdm630/660: Add CDSP-related
 nodes
From: Nickolay Goppen <setotau@mainlining.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
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
Content-Language: ru-RU, en-US
In-Reply-To: <f0c41563-dcd1-4cf9-8b73-fb9fedd52710@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


23.11.2025 13:51, Nickolay Goppen пишет:
>
> 21.11.2025 15:09, Dmitry Baryshkov пишет:
>> On Fri, Nov 21, 2025 at 01:41:21PM +0530, Ekansh Gupta wrote:
>>>
>>> On 11/20/2025 5:17 PM, Konrad Dybcio wrote:
>>>> On 11/20/25 11:54 AM, Ekansh Gupta wrote:
>>>>> On 11/20/2025 1:27 PM, Nickolay Goppen wrote:
>>>>>> 20.11.2025 07:55, Ekansh Gupta пишет:
>>>>>>> On 11/20/2025 1:58 AM, Srinivas Kandagatla wrote:
>>>>>>>> On 11/12/25 1:52 PM, Konrad Dybcio wrote:
>>>>>>>>> On 11/10/25 6:41 PM, Srinivas Kandagatla wrote:
>>>>>>>>>> On 11/3/25 12:52 PM, Konrad Dybcio wrote:
>>>>>>>>>>> On 10/31/25 12:30 PM, Nickolay Goppen wrote:
>>>>>>>>>>>> 24.10.2025 16:58, Nickolay Goppen пишет:
>>>>>>>>>>>>> 24.10.2025 11:28, Konrad Dybcio пишет:
>>>>>>>>>>>>>> On 10/23/25 9:51 PM, Nickolay Goppen wrote:
>>>>>>>>>>>>>>> In order to enable CDSP support for SDM660 SoC:
>>>>>>>>>>>>>>>     * add shared memory p2p nodes for CDSP
>>>>>>>>>>>>>>>     * add CDSP-specific smmu node
>>>>>>>>>>>>>>>     * add CDSP peripheral image loader node
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Memory region for CDSP in SDM660 occupies the same spot as
>>>>>>>>>>>>>>> TZ buffer mem defined in sdm630.dtsi (which does not 
>>>>>>>>>>>>>>> have CDSP).
>>>>>>>>>>>>>>> In sdm660.dtsi replace buffer_mem inherited from SDM630 
>>>>>>>>>>>>>>> with
>>>>>>>>>>>>>>> cdsp_region, which is also larger in size.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> SDM636 also doesn't have CDSP, so remove inherited from 
>>>>>>>>>>>>>>> sdm660.dtsi
>>>>>>>>>>>>>>> related nodes and add buffer_mem back.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>> [...]
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> + label = "turing";
>>>>>>>>>>>>>> "cdsp"
>>>>>>>>>>>>> Ok, I'll change this in the next revision.
>>>>>>>>>>>>>>> + mboxes = <&apcs_glb 29>;
>>>>>>>>>>>>>>> +            qcom,remote-pid = <5>;
>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>> +            fastrpc {
>>>>>>>>>>>>>>> +                compatible = "qcom,fastrpc";
>>>>>>>>>>>>>>> +                qcom,glink-channels = 
>>>>>>>>>>>>>>> "fastrpcglink-apps-dsp";
>>>>>>>>>>>>>>> +                label = "cdsp";
>>>>>>>>>>>>>>> + qcom,non-secure-domain;
>>>>>>>>>>>>>> This shouldn't matter, both a secure and a non-secure 
>>>>>>>>>>>>>> device is
>>>>>>>>>>>>>> created for CDSP
>>>>>>>>>>>>> I've added this property, because it is used in other 
>>>>>>>>>>>>> SoC's, such as SDM845 and SM6115 for both ADSP and CDSP
>>>>>>>>>>>> Is this property not neccessary anymore?
>>>>>>>>>>> +Srini?
>>>>>>>>>> That is true, we do not require this for CDSP, as CDSP allows 
>>>>>>>>>> both
>>>>>>>>>> unsigned and signed loading, we create both secured and 
>>>>>>>>>> non-secure node
>>>>>>>>>> by default. May be we can provide that clarity in yaml 
>>>>>>>>>> bindings so that
>>>>>>>>>> it gets caught during dtb checks.
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> However in ADSP case, we only support singed modules, due to 
>>>>>>>>>> historical
>>>>>>>>>> reasons how this driver evolved over years, we have this flag 
>>>>>>>>>> to allow
>>>>>>>>>> compatiblity for such users.
>>>>>>>>> Does that mean that we can only load signed modules on the 
>>>>>>>>> ADSP, but
>>>>>>>>> the driver behavior was previously such that unsigned modules 
>>>>>>>>> were
>>>>>>>>> allowed (which was presumably fine on devboards, but not on fused
>>>>>>>>> devices)?
>>>>>>>> Yes, its true that we allowed full access to adsp device nodes 
>>>>>>>> when we
>>>>>>>> first started upstreaming fastrpc driver.
>>>>>>>>
>>>>>>>> irrespective of the board only signed modules are supported on 
>>>>>>>> the ADSP.
>>>>>>>> I think there was one version of SoC i think 8016 or some older 
>>>>>>>> one
>>>>>>>> which had adsp with hvx which can load unsigned modules for 
>>>>>>>> compute
>>>>>>>> usecase only.
>>>>>>>>
>>>>>>>> I have added @Ekansh for more clarity.
>>>>>>>>
>>>>>>>> --srini
>>>>>>> For all the available platforms, ADSP supports only signed 
>>>>>>> modules. Unsigned
>>>>>>> modules(as well as signed) are supported by CDSP and GDSP 
>>>>>>> subsystems.
>>>>>>>
>>>>>>> qcom,non-secure-domain property marks the corresponding DSP as 
>>>>>>> non-secure DSP.
>>>>>>> The implications of adding this property would be the following:
>>>>>>> on ADSP, SDSP, MDSP:
>>>>>>> - Only non-secure device node(/dev/fastrpc-Xdsp) is created.
>>>>>>> - Non-secure device node can be used for signed DSP PD offload.
>>>>>>>
>>>>>>> on CDSP, GDSP:
>>>>>>> - Both secure(/dev/fastrpc-Xdsp-secure) and 
>>>>>>> non-secure(/dev/fastrpc-Xdsp) devices
>>>>>>>     are created, regardless of this property.
>>>>>>> - Both the nodes can be used for signed and unsigned DSP PD 
>>>>>>> offload.
>>>>>>>
>>>>>>> Note: If the property is not added for CDSP/GDSP, only secure 
>>>>>>> device node can
>>>>>>> be used for signed PD offload, if non-secure device is used, the 
>>>>>>> request gets
>>>>>>> rejected[1].
>>>>>>>
>>>>>>> [1] 
>>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1245
>>>>>>>
>>>>>>> //Ekansh
>>>>>> Does this mean that the qcom,non-secure-domain property should be 
>>>>>> dropped from both nodes?
>>>>> I checked again and found that unsigned module support for CDSP is
>>>>> not available on this platform. Given this, the safest approach would
>>>>> be to add the property for both ADSP and CDSP, ensuring that all
>>>>> created device nodes can be used for signed PD offload. I can provide
>>>> The property allows *unsigned* PD offload though
>>> I don't think I can directly relate this property to unsigned PD 
>>> offload. This is just
>>> defining what type of device node will be created and whether the 
>>> channel is secure
>>> or not. There is a possibility of making unsigned PD request(on 
>>> CDSP/GDSP) irrespective
>>> of whether this property is added or not. If DSP does not support 
>>> unsigned offload, it
>>> should return failures for such requests.
>> Which part of the hardware and/or firmware interface does it define? If
>> it simply declared Linux behaviour, it is incorrect and probably should
>> be dropped.
> I still don't understand, do I need this property or not?

I've began testing the FastRPC on CDSP and the command

sudo fastrpc_test -d 3 -U 1 -t linux -a v68
has caused the following errors:

[   60.810545] arm-smmu 5180000.iommu: Unhandled context fault: 
fsr=0x402, iova=0xfffff000, fsynr=0x1, cbfrsynra=0x6, cb=3
[   60.810588] arm-smmu 5180000.iommu: FSR    = 00000402 [Format=2 TF], 
SID=0x6
[   60.810603] arm-smmu 5180000.iommu: FSYNR0 = 00000001 [S1CBNDX=0 PLVL=1]
[   60.815657] qcom_q6v5_pas 1a300000.remoteproc: fatal error received: 
:0:EX:kernel:0:frpck_0_0:77:PC=c0117de0
[   60.815684] remoteproc remoteproc2: crash detected in cdsp: type 
fatal error
[   60.815738] remoteproc remoteproc2: handling crash #1 in cdsp
[   60.815754] remoteproc remoteproc2: recovering cdsp
[   60.819267] (NULL device *): Error: dsp information is incorrect err: -32


>>>>> a more definitive recommendation once I know the specific use cases
>>>>> you plan to run.
>>>> Why would the usecase affect this?
>>> I'm saying this as per past discussions where some application was 
>>> relying on non-secure
>>> device node on some old platform(on postmarketOS)[1] and having this 
>>> property in place.
>>> So if similar usecase is being enabled here, the property might be 
>>> required[1].
>> DT files are not usecase-based.
>>
>>> [1] https://lkml.org/lkml/2024/8/15/117
>
-- 
Best regards,
Nickolay


