Return-Path: <linux-arm-msm+bounces-34925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 535949A3B4C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 12:22:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A1491F279E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 10:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8D1B201271;
	Fri, 18 Oct 2024 10:17:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39FB220103B;
	Fri, 18 Oct 2024 10:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729246679; cv=none; b=alYpiEYjwVsMQXdVdL17Sfh89WtMcdT4PruPG5nbR8mZOIAIbhG+AARRX1dgBn/S8prevRXOl4L6ykvY8IwmY0J93mWRUhdAq23nFRchtByz21RJ93izjK1wN2L5THc1JSGy5XOIloBwSdPPEKA+5XMntPe+NrtmoHAonDKeis4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729246679; c=relaxed/simple;
	bh=t32HRxvQHTCLyJXn0fwMnZ/lX9qh1nDua7GDBZkjGXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m/eLy48vnRjwo6iFVFfd5VRm+LJFkh7J7BzmQ6YEiMhKRfUFnMZM07LLN7snLhppzRCMY9V6CIpA3MGVAJdHx+j27/TyDRimqHHZQrLPU/Ppm8XpJ9HBqIHQHpSYH3ajzSp2gjDPWNXGJ1DWar9ZLlUaUaHTz9TWpmqURHZsnf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34417FEC;
	Fri, 18 Oct 2024 03:18:27 -0700 (PDT)
Received: from [10.57.22.188] (unknown [10.57.22.188])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0F0A13F58B;
	Fri, 18 Oct 2024 03:17:54 -0700 (PDT)
Message-ID: <a82cd3f2-a8ba-4f19-820d-509dc45f74c1@arm.com>
Date: Fri, 18 Oct 2024 11:17:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: Add device-name in the coresight
 components
Content-Language: en-GB
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Mao Jinlong <quic_jinlmao@quicinc.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Tao Zhang <quic_taozha@quicinc.com>, songchai <quic_songchai@quicinc.com>,
 Jie Gan <quic_jiegan@quicinc.com>
References: <20240703122340.26864-1-quic_jinlmao@quicinc.com>
 <20240703122340.26864-2-quic_jinlmao@quicinc.com>
 <980422ea-8c44-47a4-8996-8653bab3ef8a@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <980422ea-8c44-47a4-8996-8653bab3ef8a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/07/2024 20:13, Krzysztof Kozlowski wrote:
> On 03/07/2024 14:23, Mao Jinlong wrote:
>> Current name of coresight component's folder consists of prefix of
>> the device and the id in the device list. When run 'ls' command,
>> we can get the register address of the device. Take CTI for example,
>> if we want to set the config for modem CTI, but we can't know which
>> CTI is modem CTI from all current information.
>>
>> cti_sys0 -> ../../../devices/platform/soc@0/138f0000.cti/cti_sys0
>> cti_sys1 -> ../../../devices/platform/soc@0/13900000.cti/cti_sys1
>>
>> Add device-name in device tree which can provide a better description
>> of the coresight device. It can provide the info like the system or
>> HW it belongs to.
>>
>> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
>> ---
>>   .../devicetree/bindings/arm/arm,coresight-cti.yaml          | 6 ++++++
>>   .../devicetree/bindings/arm/arm,coresight-dummy-source.yaml | 6 ++++++
>>   .../devicetree/bindings/arm/arm,coresight-stm.yaml          | 6 ++++++
>>   .../devicetree/bindings/arm/qcom,coresight-tpdm.yaml        | 6 ++++++
>>   4 files changed, 24 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
>> index 2d5545a2b49c..6a73eaa66a42 100644
>> --- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
>> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
>> @@ -98,6 +98,12 @@ properties:
>>     power-domains:
>>       maxItems: 1
>>   
>> +  arm,cs-dev-name:
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    description:
>> +      Define the name which can describe what kind of HW or system the
>> +      coresight device belongs to.
> 
> Don't we use already label for such cases? Power domains, input, leds,
> panels, IIO, hwmon and more.

We do and if we can get hold of them, that would be ideal. but do we get 
them in the binary DT blob ?  At least I couldn't see them on my Juno
dtb.


Cheers
Suzuki


> 
> Best regards,
> Krzysztof
> 


