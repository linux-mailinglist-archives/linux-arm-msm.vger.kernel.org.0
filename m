Return-Path: <linux-arm-msm+bounces-67405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAAAB1856C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 18:09:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EA0D188FA82
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 16:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE1328C5A0;
	Fri,  1 Aug 2025 16:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rvKWKKbA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E5A26C39B;
	Fri,  1 Aug 2025 16:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754064564; cv=none; b=FjvYjwpkuavAqG0lNQbBk5qy3m6Rh+EESpMvdiBuR1LwzHAUNfdVJGWxtRq+h5qTu0b9YckRA6SgFENWEW3DEj4FVjY5TGKOfIHBYz0ageIF/VZHrlC+48SlKMp59J4m2aSbAg9D2HD3RTUmVOOlDLxRlJtLG8kTMy1VREZBL9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754064564; c=relaxed/simple;
	bh=fF7jdCoxSI4PIYqc+nC8jQ5Zo2bBLXUC0r4Wf+iGzd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JHFY8b9+7idXsG7TFQT5jlZiI0A8j+KrwB6sItpNR769pERZz6j74B4w8qrIVWIFOnLwTu0cG2B+YUsU83zenWnomiqqaSzqrwCqyJu4CBxmPl6NpA3KBfIh7oEblLNiQShBV08JDMfn6mJLno8Bie5iMze588UtoOzwZ7pTeos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rvKWKKbA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B856EC4CEE7;
	Fri,  1 Aug 2025 16:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754064564;
	bh=fF7jdCoxSI4PIYqc+nC8jQ5Zo2bBLXUC0r4Wf+iGzd8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rvKWKKbAWpN9RgkvBv1iHGLhHE5Yszey8SjnnYGuY17WCKQDoro7TkUsJnl7f3MQR
	 Q/K3Zq+/XCKg23+Snpvd9UnCfXui69teQ14tsUSCc1zrERer3cslnmmSUlB1LtnKNs
	 XWefJZR00eZSj1CTLDbyiGxkz5Lx3aLNuhjOiX0k4UCuYT9DFYuoDe6l8UPVla0gzU
	 Xo00+IR/MmOBQ6FXJKthXYDnljneXb17nJnMGlMNxhGWLmD/kYi13D18pbpDALFmXI
	 zDE1Rk/8DaksAvyKvJj7YB+YIOhVEcAgGbGtlVGi8zl8cdZ5n/5JKrSADLDvAGl3XR
	 aNqELRO3R+iiA==
Message-ID: <4fa9074e-609a-42aa-975a-a6daa7dd6d42@kernel.org>
Date: Fri, 1 Aug 2025 18:09:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 2/3] arm64: dts: qcom: sm8650: Enable MCQ support for
 UFS controller
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>, alim.akhtar@samsung.com,
 avri.altman@wdc.com, bvanassche@acm.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, agross@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250730082229.23475-1-quic_rdwivedi@quicinc.com>
 <20250730082229.23475-3-quic_rdwivedi@quicinc.com>
 <eab85cb3-7185-4474-9428-8699fbe4a8e5@kernel.org>
 <40ace3bc-7e5d-417a-b51a-148c5f498992@quicinc.com>
 <2a7bf809-73d9-4cb6-bcc9-3625ef1eb1fa@kernel.org>
 <kayobeddgln5oi3g235ruh7f7adbqr7srim7tmt3iwa3zn33m4@cenneffnuhnv>
 <5a32e933-03b9-4cc3-914c-46bdb2cedce6@kernel.org>
 <54gttzkpxg55vrh5wsvyvteovki377w3yjfejjddpzzrvldwkg@p7sc4knnvla3>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <54gttzkpxg55vrh5wsvyvteovki377w3yjfejjddpzzrvldwkg@p7sc4knnvla3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01/08/2025 17:33, Manivannan Sadhasivam wrote:
> On Fri, Aug 01, 2025 at 04:20:37PM GMT, Krzysztof Kozlowski wrote:
>> On 01/08/2025 14:24, Manivannan Sadhasivam wrote:
>>> On Thu, Jul 31, 2025 at 10:38:56AM GMT, Krzysztof Kozlowski wrote:
>>>> On 31/07/2025 10:34, Ram Kumar Dwivedi wrote:
>>>>>
>>>>>
>>>>> On 31-Jul-25 12:15 PM, Krzysztof Kozlowski wrote:
>>>>>> On 30/07/2025 10:22, Ram Kumar Dwivedi wrote:
>>>>>>> Enable Multi-Circular Queue (MCQ) support for the UFS host controller
>>>>>>> on the Qualcomm SM8650 platform by updating the device tree node. This
>>>>>>> includes adding new register regions and specifying the MSI parent
>>>>>>> required for MCQ operation.
>>>>>>>
>>>>>>> MCQ is a modern queuing model for UFS that improves performance and
>>>>>>> scalability by allowing multiple hardware queues. 
>>>>>>>
>>>>>>> Changes:
>>>>>>> - Add reg entries for mcq_sqd and mcq_vs regions.
>>>>>>> - Define reg-names for the new regions.
>>>>>>> - Specify msi-parent for interrupt routing.
>>>>>>>
>>>>>>> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>>>>>>> ---
>>>>>>>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 9 ++++++++-
>>>>>>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>>>>>>> index e14d3d778b71..5d164fe511ba 100644
>>>>>>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>>>>>>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>>>>>>> @@ -3982,7 +3982,12 @@ ufs_mem_phy: phy@1d80000 {
>>>>>>>  
>>>>>>>  		ufs_mem_hc: ufshc@1d84000 {
>>>>>>>  			compatible = "qcom,sm8650-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
>>>>>>> -			reg = <0 0x01d84000 0 0x3000>;
>>>>>>> +			reg = <0 0x01d84000 0 0x3000>,
>>>>>>> +			      <0 0x01da5000 0 0x2000>,
>>>>>>> +			      <0 0x01da4000 0 0x0010>;
>>>>>>
>>>>>>
>>>>>> These are wrong address spaces. Open your datasheet and look there.
>>>>>>
>>>>> Hi Krzysztof,
>>>>>
>>>>> I’ve reviewed it again, and it is correct and functioning as expected both on our upstream and downstream codebase.
>>>>> I think it is probably overlooked by you. Can you please double check from your end?
>>>>>
>>>>
>>>> No, it is not overlooked. There is no address space of length 0x10 at
>>>> 0x01da4000 in qcom doc/datasheet system. Just open the doc and look
>>>> there by yourself. The size is 0x15000.
>>>>
>>>
>>> The whole UFS MCQ region is indeed of size 0x15000, but the SQD and VS registers
>>> are at random offsets, not fixed across the SoC revisions. And there are some
>>> big holes within the whole region for things like ICE and all.
>>>
>>> So it makes sense to map only the part of these regions and leave the unused
>>> ones.
>> Each item in the reg represents some continuous, dedicated address
>> space, not individual registers or artificially decided subsection. The
>> holes in such address space is not a problem, we do it all the time for
>> all other devices as well.
>>
>> You need to use the definition of that address space.
>>
> 
> What if some of the registers in that whole address space is shared with other
> peripherals such as ICE?


It will be a different address space. We don't talk about imaginary
3rd-party SoC. Qualcomm datasheet lists address spaces in very precise
way. We were recently fixing all address spaces for remoterpocs based on
that.

> 
> I agree with the fact that artifically creating separate register spaces leads
> to issues, but here I'm worried about hardcoding the offsets in the driver which
> can change between SoCs and also the shared address space with ICE.

Drivers are expected to hard-code offsets and all drivers do it. Look at
display, sound codecs (both SoC and soundwire devices). Everything
hard-coded offsets internal to address space.

What you essentially want is (making it border case) "reg" per register.

Best regards,
Krzysztof

