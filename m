Return-Path: <linux-arm-msm+bounces-80850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6D8C43553
	for <lists+linux-arm-msm@lfdr.de>; Sat, 08 Nov 2025 23:23:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF4AE3B01FD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Nov 2025 22:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F99284884;
	Sat,  8 Nov 2025 22:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="FWXrSRZg";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="eLZxWjvz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD9415624D;
	Sat,  8 Nov 2025 22:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762640591; cv=none; b=ijegifUxxVuhnfZhqYiHmnnYpYu0le2T+U86KmHL0i2iGLsB1ihyWDCIJ/BVuSAjLa2Va4vmEs2Myc+7vL36pPjybHqEC5f/oE2zj0KS+CQeE+CMJj7OnUv2K9Q+8uYirFJ2nVB/fXT2xLOS/0PHDHh6IwHTdtiwOlaLcN48rUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762640591; c=relaxed/simple;
	bh=Zxmz/6xnhDmC3ahYKt7LW7kSKauydh8zL8KC1SW/6pc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c7LnHurP/MbHn7COo3cXj2Rds+GMuwhTGXYJJlwe7ExqgpiBALJ06p9smgRstQi0ytoq50J/i0ZTTDefpiMQbqWQvP1fDTqzkzXtnqptk7Q0LRyCJTJdCSXjIMu6vFV9enOf8MaZjeNuhQ8lYvgj15eQpsjHvdvDF5lo5t/rkW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=FWXrSRZg; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=eLZxWjvz; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1762640534; bh=1CBJA8HoXaRC/9yNlqiRB47
	gRSldQcEX9ftAxFVldRM=; b=FWXrSRZg262bOSDQkIm/hhHX6RIxKDcZHj9v33EnYSXhWtwy67
	cNCFB7wQFyXIVCoJ8AnOv2/6AGywGVq6BYoFmGoVReEOz00QgD86AdxYzJJYAXd8CRu5lwdHiTr
	5RVLTXYyOzsYkN/oUWn1gIPokTo+6xMf/j8H6V/jdmPbGLXR2gWgknGKTJAknfmJoHyj2UKdMMZ
	k25Q+9bQA/ZXx8cg3XzTSS5J8fS+D0gYXf6K8rmDKdTdvr0JhhiXxwTAe3gxRR2a1KGE/YSpZj5
	OP8CgsJiQTyOjR4mkRlzXuD4DEnvLSF0SCz8ZJWjLXH1n/fAFRb05ApCFgXrJI9bQ2g==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1762640534; bh=1CBJA8HoXaRC/9yNlqiRB47
	gRSldQcEX9ftAxFVldRM=; b=eLZxWjvzJ5wMm6uya6KOrlLC7dlWJ3hZAaQKFAvGtVvIK62wsj
	bHA39ATu6ezxgkUQugNOHWAiqZeb/rzAbgCw==;
Message-ID: <1fac29fc-5de8-4e24-8a25-067d47fe0ff7@mainlining.org>
Date: Sun, 9 Nov 2025 01:22:13 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sdm630: Add FastRPC nodes to
 ADSP
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux@mainlining.org
References: <20251023-qcom-sdm660-cdsp-adsp-dts-v2-0-895ffe50ab5f@mainlining.org>
 <20251023-qcom-sdm660-cdsp-adsp-dts-v2-3-895ffe50ab5f@mainlining.org>
 <229c1807-e534-4f9c-b459-350be0a12888@oss.qualcomm.com>
Content-Language: ru-RU, en-US
From: Nickolay Goppen <setotau@mainlining.org>
In-Reply-To: <229c1807-e534-4f9c-b459-350be0a12888@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


24.10.2025 11:26, Konrad Dybcio пишет:
> On 10/23/25 9:52 PM, Nickolay Goppen wrote:
>> Add FastRPC subnode with compute-cb subnodes to ADSP node.
>>
>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sdm630.dtsi | 33 +++++++++++++++++++++++++++++++++
>>   1 file changed, 33 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>> index f4906ee3f0c3..2764666714e6 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>> @@ -2342,6 +2342,39 @@ q6routing: routing {
>>   						};
>>   					};
>>   				};
>> +
>> +				fastrpc {
>> +					compatible = "qcom,fastrpc";
>> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
>> +					label = "adsp";
>> +					qcom,non-secure-domain;
> I'm not sure this property is valid

I've looked into FastRPC driver and found out, that the 
"qcom,non-secure-domain" property isn't valid at least for adsp

>
> Konrad

-- 
Best regards,
Nickolay


