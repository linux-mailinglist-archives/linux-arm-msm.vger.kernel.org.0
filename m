Return-Path: <linux-arm-msm+bounces-85870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD7FCCFBA3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 13:14:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B8C430056F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 12:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0E6A312822;
	Fri, 19 Dec 2025 12:11:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8FA82C08B1;
	Fri, 19 Dec 2025 12:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766146298; cv=none; b=Pgoc4WI9+DM2+keia6ywypT6263I+vnSpY9smc/UQf6L4kiwd8wroVVybiAsYdR3Nbtrp6oPLLN/ddB4PZvhzn4qQn4e8AUBO13/0sp0ok5Mss3zj9QsbHdu8VBOecSrWxa5y6a2Dox5iUg7/1Gg+Y3G4JiqMOsfMNoNuQP3+b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766146298; c=relaxed/simple;
	bh=bDcqQG83RN8b6h4lbODTAb3alpf98NZ6TPwo9QOmpws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GtxJBMR9uwm35V392MwY+LaI6fBHjzTkIswFpG160J44fDIh9MLxJbpoMjdrDs+z7EdOhzVSvv9kLmQosCrLiZ7EEioNAOgqPVpAx1Q8R7jYCZNrnGLdAy45F1SPB13KsmDwZGsYhWJD9nuyC7Ii/FK0pVMB25QVrHktDrqkOVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC856FEC;
	Fri, 19 Dec 2025 04:11:28 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB0203F5CA;
	Fri, 19 Dec 2025 04:11:33 -0800 (PST)
Message-ID: <13141782-ba6e-4753-9613-2b128e008d56@arm.com>
Date: Fri, 19 Dec 2025 12:11:32 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: add CTCU device for monaco
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20251103-enable-ctcu-for-monaco-v4-0-92ff83201584@oss.qualcomm.com>
 <20251103-enable-ctcu-for-monaco-v4-1-92ff83201584@oss.qualcomm.com>
 <c6a75ea4-a36c-4f99-ae36-75f062937a66@oss.qualcomm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <c6a75ea4-a36c-4f99-ae36-75f062937a66@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/12/2025 09:08, Jie Gan wrote:
> 
> 
> On 11/3/2025 3:06 PM, Jie Gan wrote:
>> The CTCU device for monaco shares the same configurations as SA8775p. Add
>> a fallback to enable the CTCU for monaco to utilize the compitable of the
>> SA8775p.
>>
> 
> Gentle reminder.

I was under the assumption that this was going via msm tree ? Sorry, I
misunderstood. I can pull this in for v6.20

Suzuki

> 
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 9 + 
>> ++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight- 
>> ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight- 
>> ctcu.yaml
>> index c969c16c21ef..460f38ddbd73 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
>> @@ -26,8 +26,13 @@ description: |
>>   properties:
>>     compatible:
>> -    enum:
>> -      - qcom,sa8775p-ctcu
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - qcom,qcs8300-ctcu
>> +          - const: qcom,sa8775p-ctcu
>> +      - enum:
>> +          - qcom,sa8775p-ctcu
>>     reg:
>>       maxItems: 1
>>
> 


