Return-Path: <linux-arm-msm+bounces-76372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61254BC48E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 13:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 939DD3C388A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 11:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B809C2F3625;
	Wed,  8 Oct 2025 11:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ktA2dXdb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B71421767A;
	Wed,  8 Oct 2025 11:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759922758; cv=none; b=KBd4PvCVRjFE/xSe036v2jBRr/mymyfMrGSKKn9TSAbRR/d1POteGCx4ErNmyGejayWBX5vMMhlXYp+Gi8tTloZQP68jftc4qHecbmurUCcBKm/WSOuo9yaVsFDqEn/r0gt8m9RacXFEMjokDQGe1OeYP/caSUCoaXjYsqCSzdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759922758; c=relaxed/simple;
	bh=7Lw7FRVW2MvH3/Rvixa0nWeKPm0OS8Ha2dMuaX2+roU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=c0V3yKNr7oSNzEEEXoxRM+1Yu1IcQ5wmgh8p95ojUidiV0vyVJ8CGZFWiiAx/z0Ksyk+dFcflIv7CrRKJD6zGqycmNyGJ9BwnTGSkHQ7ihLJP457ZdIIUAaSNipw1lcRyLulpTUM7sc0ZilwuJcQ2LbvB+GTCuOoikB3wQ+XEBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ktA2dXdb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45ED1C4CEF4;
	Wed,  8 Oct 2025 11:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759922758;
	bh=7Lw7FRVW2MvH3/Rvixa0nWeKPm0OS8Ha2dMuaX2+roU=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=ktA2dXdbQbuNanzrsjqfgX2MC/2+Jh0zzWF890G8rUPoYTZXdNrQyYyOhVleubPef
	 Emre/paqk22DObvH2ikA85ll7I1TPTOVjE0sGjdfkvnkZz/fllGscmx6b+lrhNuYjc
	 b4fuiP4mqvf46MZC7xovn8GHFyCs+XrFay1nOUP9EBjo8mGzrr9YM8vzrM0/w8g2T6
	 IdpXzOXke2UFZi2uYKrPrL6HzoCMvOH8wT9U508E/O0a2k8u1U+Iu0neN1yCf7YQ01
	 WQbubU4rhNDrEsbCmm7tnZfYj3TRpkNCmgar9qmBPtJ1dhm9m0cw7U21RXdDV1e1Zp
	 XctQbZ0tZPnHg==
Message-ID: <b784387b-5744-422e-92f5-3d575a24d01c@kernel.org>
Date: Wed, 8 Oct 2025 20:25:51 +0900
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/24] arm64: dts: qcom: Update the pmh0110.dtsi for
 Glymur
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-14-24b601bbecc0@oss.qualcomm.com>
 <CAJKOXPdQH2jXcEY6ZpkmixvUt26SqdzYgDAiJ3RHMG7xkPyi_A@mail.gmail.com>
 <lcbcjpoazpwbltedkiqlw4l3aomwvi3qsfwvmwghb6uf5wvnme@kh7qdpunfuwr>
 <CAJKOXPcyhDdFW_u4YQLiHYj8gM7wYB-LOmB_PJs+5OOgn8WZFw@mail.gmail.com>
 <mzoctelzfp6h2ezzkc3j7gnghsaf67flxqlvfhtlpdfxtddsvi@zqihmnygvdjk>
 <20251008073123.GA20592@hu-kamalw-hyd.qualcomm.com>
 <799374b4-0c41-4ccb-9f99-954c7ce6d044@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <799374b4-0c41-4ccb-9f99-954c7ce6d044@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/10/2025 17:02, Krzysztof Kozlowski wrote:
> On 08/10/2025 16:31, Kamal Wadhwa wrote:
>> Hi Krzysztof, Dmitry, Konrad,
>>
>> On Thu, Sep 25, 2025 at 09:57:02PM +0300, Dmitry Baryshkov wrote:
>>> On Thu, Sep 25, 2025 at 10:34:52PM +0900, Krzysztof Kozlowski wrote:
>>>> On Thu, 25 Sept 2025 at 22:14, Dmitry Baryshkov
>>>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>>>
>>>>> On Thu, Sep 25, 2025 at 05:08:54PM +0900, Krzysztof Kozlowski wrote:
>>>>>> On Thu, 25 Sept 2025 at 15:34, Pankaj Patil
>>>>>> <pankaj.patil@oss.qualcomm.com> wrote:
>>>>>>>
>>>>>>> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>>>>>>>
>>>>>>> Add multiple instance of PMH0110 DT node, one for each assigned
>>>>>>> SID for this PMIC on the spmi_bus0 and spmi_bus1 on the Glymur
>>>>>>> CRD.
>>>>>>>
>>>>>>> Take care to avoid compilation issue with the existing nodes by
>>>>>>> gaurding each PMH0110 nodes with `#ifdef` for its corresponding
>>>>>>> SID macro. So that only the nodes which have the their SID macro
>>>>>>> defined are the only ones picked for compilation.
>>>>>>>
>>>>>>> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
>>>>>>> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
>>>>>>> ---
>>>>>>>  arch/arm64/boot/dts/qcom/pmh0110.dtsi | 66 ++++++++++++++++++++++++++++++++++-
>>>>>>>  1 file changed, 65 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/pmh0110.dtsi b/arch/arm64/boot/dts/qcom/pmh0110.dtsi
>>>>>>> index b99c33cba8860f1852231db33a127646c08c1e23..4a5c66e5c9fbc35cedb67601f4568844dc41fbea 100644
>>>>>>> --- a/arch/arm64/boot/dts/qcom/pmh0110.dtsi
>>>>>>> +++ b/arch/arm64/boot/dts/qcom/pmh0110.dtsi
>>>>>>> @@ -7,6 +7,8 @@
>>>>>>>  #include <dt-bindings/spmi/spmi.h>
>>>>>>>
>>>>>>>  &spmi_bus0 {
>>>>>>> +
>>>>>>> +#ifdef PMH0110_D_E0_SID
>>>>>>
>>>>>> NAK
>>>>>>
>>>>>> I already explained on IRC in great details why.
>>>>>
>>>>> A short summary or a link to a channel / date would be nice in order to
>>>>> include other people into the discussion.
>>>>>
>>>>
>>>> Of course but:
>>>> 1. You were there so maybe you remember the arguments, and:
>>>> 2. I'm offline, using phone, not having laptop, replying during my
>>>> personal time off just before merge window so any emergency time
>>>> should be spent on important matters instead these two huge patch
>>>> bombs adding such usage I already said: NO, don't do this.
>>>
>>>
>>> Well, If I'm asking, it means I don't rememebr the discussion. And I
>>> defeinitely didn't know that you are spending your personal vacation
>>> time in ML. And if the discussion was with some other people, then
>>> somebody else can drop the response to the question.
>>
>> Just wanted to give some background on this patch.
>> Even though PMH0104 and PMH0110 are common (b/w Kaanapali and Glymur),
>> they don't share the SIDs. So we tried to use status="disabled" to handle
>> this but we observed that because of the node name being common in the
>> two included files, it ends up overwriting the previous node with the
>> same name.
>>
>> eg-
>> #include "pmh0104.dtsi"  // assume contains pmic@4 { ...};
>> #include "pmh0110.dtsi"  // assume contains pmic@4 { status=disabled;};
>>
>> Here intention was to use the pmh0104 on sid-4, but it gets overwritten
>> with the pmh0110 on sid-4 ( with status disabled). This is why we ended
>> up using the `#ifdef`, ensuring that we can control the exact pmic that
>> gets picked by using the PMXXX_SID macro.
>>
>> side note, i did `grep` in the `/arch/arm64/boot/dts/` and i see a lot
>> of instances of `#if...` present in that.  Assuming the concern here is
>> about the use of `#ifdef`.
> 
> 
> #if are not desired in C code, so why would they be acceptable in DTS?
> It is not making the code easier to read at all.
> 
> On IRC in these older discussions I was very strongly against any DTSI
> which depends on some sort of outside values, except basic usage of
> defines. Original pmh0110.dtsi from kaanapali is fine:
> 	pmh0110_d_e0: pmic@PMH0110_D_E0_SID {
> 
> but doing ifdefs here that this define depends on something else makes
> code ungreppable (lookup unit address from sysfs and then git grep
> pmic@4) and difficult to follow.
> 
> My recommendation is either duplicate code or change DTSI files to not
> contain entire node, but its contents. At least these are
> recommendations I remember now.
> 
One more recommendation:
Different DTSI files per SoC, so pmh0110-kaanapali.dtsi and
pmh0110-glymur.dtsi.

We do not move the QUP engines into separate DTSI file to avoid
duplication. Each SoC has all of them duplicated. And then new SoC also
duplicates them.

We do not move SPI touchscreens or other I2C/SPI devices to separate
DTSI files. Each board duplicates such SPI device (and SPI can have
different <reg> - chip select! I2C as well, although a bit rarer).

Therefore I do not see any need for some #ifdefs in this code, just to
avoid duplication because that duplication is nothing odd.

Best regards,
Krzysztof

