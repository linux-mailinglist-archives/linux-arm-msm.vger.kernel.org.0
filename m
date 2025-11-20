Return-Path: <linux-arm-msm+bounces-82667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 84530C73BC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 12:31:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 82A9A35ED53
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 11:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE14C333751;
	Thu, 20 Nov 2025 11:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="rjTeQ4z7";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="CZJV5SXz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB793321A2;
	Thu, 20 Nov 2025 11:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763637810; cv=none; b=FMyINy2u1GfkMP2v8kSEI/X1yTgqrlmCFXS0MMJBDSXFcAcLNKP91DcvYDSwowbQz+f7dW3gy2wNNTwmnHLEYVe0CRc1gEEunPbLebeJT2pssNa6UTMxaXnHaZS3VIYFDA9n1F84VoUobNrWOR3KvxbCA7Y10uOa+bNq3wg3qt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763637810; c=relaxed/simple;
	bh=e+ol9DBdd3gY9flGOlpZzQToFVt3TP9LnQp+tRcShdM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L4ktPxYiW4xVTyuHdB6Jw3a8MvtcgrVBm80BUYg4FOJ0oCyqJPG210AnRuDkrDKJn68nJ29vrElt8Dfl0QFIx91QabUngn5ffNuFIflshDLrgfQtTbxtfEUN9P74YwuMEH2kFIDHm4nzDpsujmFV7wtpoDsZxAX1vHB0s0POYlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=rjTeQ4z7; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=CZJV5SXz; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1763637738; bh=SIczPgLJhv2djAIVVB0+mcc
	9o/FjU+1chmK5EWtpDs0=; b=rjTeQ4z7PQy3zAV7wF6Gzr5PYa8MfCa4qNig+1jxIPZ1NSMvAp
	kRLY6EUZHtHAcXzxo2HAVLbdjpWp45S/TicRi5UnF7IYRZjepqaHMMeQswomxoHcXJzZFt63okE
	TqIhE2AAv9jtR+PcSwKq1du1IUn4nggtYfxQa5WEQF4rcfr1RsGuGDMTAN2omqocMDB1nBLeCtq
	gyCiC5Bl+k8k0kIEYOisKpbbcszPCqXQ+XfcnAuaq3JeEp8dDBwIU0EuGsODgwEbDV2HDCXl75X
	LnZcSD8P2ZQKNrym7/kmifQCRMvETCYDzSBSwNxzMwS0Z2n6d4SUtFKCnQAIlYpoFpQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1763637738; bh=SIczPgLJhv2djAIVVB0+mcc
	9o/FjU+1chmK5EWtpDs0=; b=CZJV5SXzebAXJSXecYwuRL3i8LduyvP8SQkTdkR69YSZCCV7Rd
	Qf4QrOY3YshSS8BqMou0t3qdo3cgbF+7CPBQ==;
Message-ID: <ab054cf7-83bb-452d-aa52-d431672c63e3@mainlining.org>
Date: Thu, 20 Nov 2025 14:22:17 +0300
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
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux@mainlining.org, Chenna Kesava Raju <chennak@qti.qualcomm.com>,
 Bharath Kumar <bkumar@qti.qualcomm.com>
References: <20251023-qcom-sdm660-cdsp-adsp-dts-v2-0-895ffe50ab5f@mainlining.org>
 <20251023-qcom-sdm660-cdsp-adsp-dts-v2-1-895ffe50ab5f@mainlining.org>
 <07066c46-4121-48da-846a-3a180d245589@oss.qualcomm.com>
 <47b40a91-8365-4431-9fd9-1e48fad2a4e1@mainlining.org>
 <a3cb6633-1595-41e7-8e87-ca48a98f822c@mainlining.org>
 <83c3aea5-764e-4e60-8b16-67b474f19357@oss.qualcomm.com>
 <d17548bb-ddce-4d60-8dc4-2c0633989299@oss.qualcomm.com>
 <f5c7eb1c-28b1-4cf1-afb0-b993384b7712@oss.qualcomm.com>
 <80836b8f-16a8-4520-ad11-5ca0abb3403e@oss.qualcomm.com>
 <99c22e73-797c-4a30-92ba-bc3bd8cf70f0@oss.qualcomm.com>
 <eddc16cb-d951-401c-8fb8-fccfcf600143@mainlining.org>
 <0b06f744-b695-43d9-8da3-4424e2b53a5e@oss.qualcomm.com>
Content-Language: ru-RU, en-US
From: Nickolay Goppen <setotau@mainlining.org>
In-Reply-To: <0b06f744-b695-43d9-8da3-4424e2b53a5e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

20.11.2025 13:54, Ekansh Gupta пишет:
>
> On 11/20/2025 1:27 PM, Nickolay Goppen wrote:
>> 20.11.2025 07:55, Ekansh Gupta пишет:
>>> On 11/20/2025 1:58 AM, Srinivas Kandagatla wrote:
>>>> On 11/12/25 1:52 PM, Konrad Dybcio wrote:
>>>>> On 11/10/25 6:41 PM, Srinivas Kandagatla wrote:
>>>>>> On 11/3/25 12:52 PM, Konrad Dybcio wrote:
>>>>>>> On 10/31/25 12:30 PM, Nickolay Goppen wrote:
>>>>>>>> 24.10.2025 16:58, Nickolay Goppen пишет:
>>>>>>>>> 24.10.2025 11:28, Konrad Dybcio пишет:
>>>>>>>>>> On 10/23/25 9:51 PM, Nickolay Goppen wrote:
>>>>>>>>>>> In order to enable CDSP support for SDM660 SoC:
>>>>>>>>>>>     * add shared memory p2p nodes for CDSP
>>>>>>>>>>>     * add CDSP-specific smmu node
>>>>>>>>>>>     * add CDSP peripheral image loader node
>>>>>>>>>>>
>>>>>>>>>>> Memory region for CDSP in SDM660 occupies the same spot as
>>>>>>>>>>> TZ buffer mem defined in sdm630.dtsi (which does not have CDSP).
>>>>>>>>>>> In sdm660.dtsi replace buffer_mem inherited from SDM630 with
>>>>>>>>>>> cdsp_region, which is also larger in size.
>>>>>>>>>>>
>>>>>>>>>>> SDM636 also doesn't have CDSP, so remove inherited from sdm660.dtsi
>>>>>>>>>>> related nodes and add buffer_mem back.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>>>>>>>>>>> ---
>>>>>>>>>> [...]
>>>>>>>>>>
>>>>>>>>>>> +            label = "turing";
>>>>>>>>>> "cdsp"
>>>>>>>>> Ok, I'll change this in the next revision.
>>>>>>>>>>> +            mboxes = <&apcs_glb 29>;
>>>>>>>>>>> +            qcom,remote-pid = <5>;
>>>>>>>>>>> +
>>>>>>>>>>> +            fastrpc {
>>>>>>>>>>> +                compatible = "qcom,fastrpc";
>>>>>>>>>>> +                qcom,glink-channels = "fastrpcglink-apps-dsp";
>>>>>>>>>>> +                label = "cdsp";
>>>>>>>>>>> +                qcom,non-secure-domain;
>>>>>>>>>> This shouldn't matter, both a secure and a non-secure device is
>>>>>>>>>> created for CDSP
>>>>>>>>> I've added this property, because it is used in other SoC's, such as SDM845 and SM6115 for both ADSP and CDSP
>>>>>>>> Is this property not neccessary anymore?
>>>>>>> +Srini?
>>>>>> That is true, we do not require this for CDSP, as CDSP allows both
>>>>>> unsigned and signed loading, we create both secured and non-secure node
>>>>>> by default. May be we can provide that clarity in yaml bindings so that
>>>>>> it gets caught during dtb checks.
>>>>>>
>>>>>>
>>>>>> However in ADSP case, we only support singed modules, due to historical
>>>>>> reasons how this driver evolved over years, we have this flag to allow
>>>>>> compatiblity for such users.
>>>>> Does that mean that we can only load signed modules on the ADSP, but
>>>>> the driver behavior was previously such that unsigned modules were
>>>>> allowed (which was presumably fine on devboards, but not on fused
>>>>> devices)?
>>>> Yes, its true that we allowed full access to adsp device nodes when we
>>>> first started upstreaming fastrpc driver.
>>>>
>>>> irrespective of the board only signed modules are supported on the ADSP.
>>>> I think there was one version of SoC i think 8016 or some older one
>>>> which had adsp with hvx which can load unsigned modules for compute
>>>> usecase only.
>>>>
>>>> I have added @Ekansh for more clarity.
>>>>
>>>> --srini
>>> For all the available platforms, ADSP supports only signed modules. Unsigned
>>> modules(as well as signed) are supported by CDSP and GDSP subsystems.
>>>
>>> qcom,non-secure-domain property marks the corresponding DSP as non-secure DSP.
>>> The implications of adding this property would be the following:
>>> on ADSP, SDSP, MDSP:
>>> - Only non-secure device node(/dev/fastrpc-Xdsp) is created.
>>> - Non-secure device node can be used for signed DSP PD offload.
>>>
>>> on CDSP, GDSP:
>>> - Both secure(/dev/fastrpc-Xdsp-secure) and non-secure(/dev/fastrpc-Xdsp) devices
>>>     are created, regardless of this property.
>>> - Both the nodes can be used for signed and unsigned DSP PD offload.
>>>
>>> Note: If the property is not added for CDSP/GDSP, only secure device node can
>>> be used for signed PD offload, if non-secure device is used, the request gets
>>> rejected[1].
>>>
>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1245
>>>
>>> //Ekansh
>> Does this mean that the qcom,non-secure-domain property should be dropped from both nodes?
> I checked again and found that unsigned module support for CDSP is
> not available on this platform. Given this, the safest approach would
> be to add the property for both ADSP and CDSP, ensuring that all
> created device nodes can be used for signed PD offload. I can provide
> a more definitive recommendation once I know the specific use cases
> you plan to run.

It would be nice to have some testing instructions or how-to, something 
simple as "hello world" to be able to test it, to see if it works at all


> //Ekansh
>>>>> Konrad

-- 
Best regards,
Nickolay


