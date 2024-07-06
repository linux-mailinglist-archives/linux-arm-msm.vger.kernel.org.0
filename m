Return-Path: <linux-arm-msm+bounces-25440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 872EC92959B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jul 2024 00:05:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D15C1F20FB1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 22:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B003E479;
	Sat,  6 Jul 2024 22:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="rFeD7k+D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1492D45BE4;
	Sat,  6 Jul 2024 22:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.177.23.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720303396; cv=none; b=rUahEfXf8bfMzvaMOn8eMh1ff1hp5P9uXfknB/EcC05QNiM6ch5Tr6RPLwAOT6+vW84IBYO2E2LuvuW5WI8j8VE0LgU5aGkWOSaT1i9mvyIDEuysLz9o79ajGAj35/jC0cBGe9PltPOWL8SZxQAWLjeqaZsuplgxR60XoCgVO1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720303396; c=relaxed/simple;
	bh=k1pXYM9Nz5xAeI1ho3otblg7r88CE7zsP7uwg/B6as0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qppRlRGFHL0N6ZXiplxAGHRWyGVR2pp1RA/tAFiSYBEQRIE8QwL248wp+hQVnQus5oBHOPkwsUWRprSrdJSmHtt/jLKQP01hN2ABE6+qEeXuvcwiTzp58eLhH2YWFEWUUJKWSllOTx7g4Jnym2wXOren/5cWqk0EKaxIL1qYbJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=rFeD7k+D; arc=none smtp.client-ip=89.177.23.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from [192.168.1.102] (76-224-187-148.lightspeed.sntcca.sbcglobal.net [76.224.187.148])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id C447116558C;
	Sun,  7 Jul 2024 00:03:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1720303391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wRb3VlLYFMlz9AY7LqmTBhiRMJRIGY8pfbaagwsayjA=;
	b=rFeD7k+DorhBgh1ThK4ghcyjZ9ggXvdQmtSRlAEmU5k8YJF+UeKzoCEMt/01w4QaUiPExW
	KBhDZInu3OBHwVIFBNg1EL9/C51cqMEEvR3fBV7H/LVvAxC70V6VbG5SOrpRde+inesePk
	zXpD81Bdb3xkl8iWjomL4OsRDebGmFo=
Message-ID: <b793eff2-2e38-49f8-8dbe-18c11d2b8f3e@ixit.cz>
Date: Sat, 6 Jul 2024 15:03:08 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] ARM: dts: qcom: apq8960: correct memory base
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240706193415.218940-1-david@ixit.cz>
 <ir4hatefzt6luxkjrqro2bf5k7s2hnsw6o75q5543rakh2zpvg@wnnerfjswabz>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
In-Reply-To: <ir4hatefzt6luxkjrqro2bf5k7s2hnsw6o75q5543rakh2zpvg@wnnerfjswabz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Bjorn,

the apq8960 is just mental typo due to dealing with apq8064 code at same 
time. I sent properly named patch [1] with your description and Dmitry's 
R-b.

Thank you
David

[1] `ARM: dts: qcom: msm8960: correct memory base`

On 06/07/2024 13:05, Bjorn Andersson wrote:
> On Sat, Jul 06, 2024 at 12:34:07PM GMT, David Heidelberg wrote:
>> Bootloader will provide the information anyway to the kernel.
> How about we describe an actual problem here?
>
> Perhaps this is the problem you're solving?:
>
> """
> DeviceTree validation requires a unit address on the memory node, adjust
> the base to match [Ref] and use this as unit address.
>
> The bootloader will update the information with the actual values during
> boot.
> """
>
> I'd also prefer s/apq8960/msm8960/ in $subject, is there a reason why
> you did choose apq8960?
>
> Regards,
> Bjorn
>
>> Ref: https://github.com/msm8916-mainline/lk2nd/blob/main/target/msm8960/rules.mk
>>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>>   arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git ./arch/arm/boot/dts/qcom/qcom-msm8960.dtsi ./arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
>> index a9c6d2dbb460..ebc43c5c6e5f 100644
>> --- ./arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
>> +++ ./arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
>> @@ -47,9 +47,9 @@ L2: l2-cache {
>>   		};
>>   	};
>>   
>> -	memory {
>> +	memory@80000000 {
>>   		device_type = "memory";
>> -		reg = <0x0 0x0>;
>> +		reg = <0x80000000 0>;
>>   	};
>>   
>>   	cpu-pmu {
>> -- 
>> 2.45.2
>>
-- 
David Heidelberg


