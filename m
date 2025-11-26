Return-Path: <linux-arm-msm+bounces-83514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C883C8BDF5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 21:34:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 137934E139D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 20:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 048F933FE2C;
	Wed, 26 Nov 2025 20:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="P6E4fh4i";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="/TAPCxn2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F551342530;
	Wed, 26 Nov 2025 20:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764189241; cv=none; b=Dm/+ZrH1IunutJ9ngeOfh66IkhsMmFosMDYGPPUdeYXS7YiFh5SZpwLLMmTFzfdBMZEF10k7iKQo9/7JJ4JmpiyIAr54ImJJHHuiMBOpq6D7n+OmPeuekME/8uqoHFAjpDKvmoxi9pbWbN23KhLfxcE99l99lMlq5Bagbi0HAIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764189241; c=relaxed/simple;
	bh=2V1WVTsatQen9U9JF7DIJfUZ133XnLHXYaVaNOqlgeY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=HGH9DyWKoa8hg3lIMSQpwhMP05AAULsBef+GAxrIJ+hGCwKD7eLONgPV8N9YnSbJS+WwYzwQgKx19skM/VfoRUbE0mlU6jdWkvIRCrrPDh6bHp+KDh640vEeIxD3ZVVYYeusZNs5lrLYrqNSGmqT92iK9PfGzvONMBEY/Qf90P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=P6E4fh4i; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=/TAPCxn2; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:From:Subject:Date:Message-ID; t=1764189174; bh=qfeyTQCqs/GpNNiaqKNjXmM
	YHuM+FPVBQgBAIMYRFf4=; b=P6E4fh4iVbzpLdYlnlaGFraUeQuaCdUdaHeDEMhm5znHWKkSTI
	l5diVPyVDMHJ7l/nTDi554Eh7v4O5pjdxUtFhGp/z49E5kg4C8JBkwllq9IK0gxwZPi6WcvbbOH
	5R/DE7fdrtYoRYidtK6hT5olk6XPHQaO4pCB8VHTRhqmnVBziz/cMLVxnsJJCpswHGmciNlWKM9
	+V7uo7woHapYcP+dUr1tk6BA5cz6hnx8dX5icFJAh8zbRZj9NVRG6SnQM/LJsR6R3Ybb9r4mcba
	ldq+A8S1DzRVPfzaV+sHBuOCmYp9+rvfYOZzazOXE71b7255o0XQAeUsNcX8AsDuEzQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:From:Subject:Date:Message-ID; t=1764189174; bh=qfeyTQCqs/GpNNiaqKNjXmM
	YHuM+FPVBQgBAIMYRFf4=; b=/TAPCxn27KtJWsnZJHKNtTS9leeYPwW1gckllCchK3IV6bEkhu
	0IECq8oXjNyAdLWD9V4tXsPzx6M8fQ39QxDg==;
Message-ID: <c7975038-83ee-406e-a0a3-6a26485556da@mainlining.org>
Date: Wed, 26 Nov 2025 23:32:53 +0300
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
 <515191cf-a8b8-4487-989b-4c1736a67b2c@mainlining.org>
Content-Language: ru-RU, en-US
In-Reply-To: <515191cf-a8b8-4487-989b-4c1736a67b2c@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

26.11.2025 17:00, Nickolay Goppen пишет:
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
>>
> When I've removed the qcom,non-secure-domain property from cdsp and 
> tried to run hexagonrpcd via this command:
>
> sudo -u fastrpc hexagonrpcd -f /dev/fastrpc-cdsp  -R 
> /usr/share/qcom/sdm660/Xiaomi/clover/ -d cdsp -c 
> /usr/share/qcom/sdm660/Xiaomi/clover/dsp/cdsp/fastrpc_shell_3
>
> It raised the following error:
>
> qcom,fastrpc 
> 1a300000.remoteproc:glink-edge.fastrpcglink-apps-dsp.-1.-1: Error: 
> Untrusted application trying to offload to signed PD
>
I've tried to add "hlos2_vote_turing_adsp_smmu_clk "as "iface" clock and 
"hlos2_vote_turing_adsp_gdsc" as a second power-domain and cdsp_smmu 
gave the following error:

hlos1_vote_turing_adsp_smmu_clk status stuck at 'off'

>
>
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


