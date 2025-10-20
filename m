Return-Path: <linux-arm-msm+bounces-78005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 309D2BF1431
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 14:39:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D116C3435E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 12:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCFE925D917;
	Mon, 20 Oct 2025 12:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="sd42TPjP";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="z7pnsaRI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BBE481DD;
	Mon, 20 Oct 2025 12:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760963944; cv=none; b=IguC+fMtX28RfW4stL4CzkqQIQTjFuRKojJ4GwVnXaTd4aVW+oG5shUzytznpCY5RxJTBMjlMuoyr8fPweJ0Lm1AIWzlcb5wUOSrjoSFPnhk90XDrhAqi/Vi3R38kAKPRW+F2OLr6MM0ahlCeEVgzpJgTtmTMB3oVFOoTV03He0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760963944; c=relaxed/simple;
	bh=kRqi69XQNLrfoyWHvocNTpjCpJwacf080nY1DUms01k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DI3Qg0xepYSLIQrIBj0tkc/XqJv5TLi5TMBsTpLwl+J3K8L6ZsHd3d0XGsPyIE91i7XrrShBCBMfub3QbnVHT7ChvfZKsVOYmtqmJPKD6FsSQJQbwZCnQLONGVCNpiudeneBD7VxbWN+xgR82O/dVuVWZT9mqrUIL53kRWGs8a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=sd42TPjP; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=z7pnsaRI; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1760963915; bh=15XTphJuHRTHPbvt/FSmBC5
	2HicYBecaw+Q+beI6kPs=; b=sd42TPjPg7XsYRZ26aPWMMg8DyPSB5yjv7TRgtYFyYqHTslqZD
	UAxyjp91YiGjvBaXcjQjRVZTWw8WMnfFQsxrM1wGjtCBloq447NCtWMGm2SaPoJSC2byR4v/m4Z
	U8WRwgNczwHdpXkVxo/61INgluXIzw+1ug+k45XiniFnC4fhg+2DWZmoFbxyK1Mudg4C6Xq4eg7
	P57FhckdLv8+DH2ueFa/0iUG8tbCqL2EwNr8LFnqMzs021O0sI2GHbzbj8ZGBtuauG9mq2vHUwZ
	EC+wP8gVbfOXYBOV+HKKQHVndTCNxLic9V3VcJg9FDsdQbJq1bjemufAXTiW1vgdiYg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1760963915; bh=15XTphJuHRTHPbvt/FSmBC5
	2HicYBecaw+Q+beI6kPs=; b=z7pnsaRIqucJNDqH6fpjCrqBLBRYfAdbaMCxbEpZhSU2p+axCx
	K3z58t/W3Z00NGdMwpMmJsafYv1P8xrjrBAQ==;
Message-ID: <35c670f1-6de6-4f78-a452-fcffc57ec93c@mainlining.org>
Date: Mon, 20 Oct 2025 15:38:34 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm630/660: Add CDSP-related nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux@mainlining.org
References: <20251019-qcom-sdm660-cdsp-adsp-dts-v1-0-9ab5f2865a6e@mainlining.org>
 <20251019-qcom-sdm660-cdsp-adsp-dts-v1-1-9ab5f2865a6e@mainlining.org>
 <c605434b-b0f4-4a9a-8b28-cf1c77d5f20f@oss.qualcomm.com>
Content-Language: ru-RU, en-US
From: Nickolay Goppen <setotau@mainlining.org>
In-Reply-To: <c605434b-b0f4-4a9a-8b28-cf1c77d5f20f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


20.10.2025 15:27, Konrad Dybcio пишет:
> On 10/19/25 6:27 PM, Nickolay Goppen wrote:
>> In order to enable CDSP support for SDM660 SoC:
>>   * add shared memory p2p nodes for CDSP
>>   * add CDSP-specific smmu node
>>   * add CDSP peripheral image loader node
[...]
>>   		ranges = <0 0 0 0xffffffff>;
>> diff --git a/arch/arm64/boot/dts/qcom/sdm636.dtsi b/arch/arm64/boot/dts/qcom/sdm636.dtsi
>> index ae15d81fa3f9..41e4e97f7747 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm636.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm636.dtsi
>> @@ -16,6 +16,20 @@
>>    * be addressed when the aforementioned
>>    * peripherals will be enabled upstream.
>>    */
> You can now remove the above comment ("Turing IP" is CDSP)
>
Remove the whole comment?

-- 
Best regards,
Nickolay


