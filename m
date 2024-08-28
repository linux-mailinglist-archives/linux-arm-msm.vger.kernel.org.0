Return-Path: <linux-arm-msm+bounces-29760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8124D9625AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 13:13:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6D991F23F46
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 11:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2301D16D4CA;
	Wed, 28 Aug 2024 11:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IuVg21wX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD9B16C866
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 11:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724843609; cv=none; b=ClASzqHkrPNATVA4W4XBGI+uI8jowobrhcsGKXKhHgBPMIYGlClai5IzcBuidvRz0KVu0DybUSNGCkTb/QBbRHc0588gGE9WJ2kJELihkdAkNmVDLdK59SwykZq2pGpPvMAhhfGW0mFeikIbkYx9S0vYs77pUdaQO3DzJB8zIBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724843609; c=relaxed/simple;
	bh=ptebulUHSMZLOWZlqh7/gAibzwIt0+7beVs0dWeM5Bs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qbvQOZhWgJ75+I4wSntaIb8WZNn3PuZJScSehg5PLce/IiV70erM1WRTvlE4m415Rsphtv0Ql8a5mqKhJchiZciaRF7yaPZdmxDLEoxCLgwJms29m3dWCe7XhwqVhy49nrw92UKi0oo4Mv9AHZJAw4X/HRnLCGlujPeyyCiFwTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IuVg21wX; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5bec4c3ace4so1080082a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 04:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724843604; x=1725448404; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GMaB8qLEa2uCN/rXdJjEQqqqxE1oJ3oOoi7R0UTEgvE=;
        b=IuVg21wXRXGc1UaxOyyuCu4fMEV5X1udf4ag7hrVHdiL4wi3F/ezXuQlXjh8aDZocy
         I3u5iAoax5L0k7Ms7INpZn6D2Qt2IRTciHI9eWPXG0Y9wG0K+WtM1LYw1rU8TQsbJ7Qn
         7l+Xkqu935A5aJe/9PMDCBd2gwnxsz5C7wYAFn6HTzJbDqBrvh6Uc3KOl7E84jBuQrjN
         s36pU26oLFBGse7oGqfRaTVgOYRhFPXEcfJsQSIZs69YxvqxleQevhxNlaRPBFbFV12K
         RIW4Fd6s7GWNpiYfVxqNiSqZtSFpQSB18HPPHrrzG+womlcn3yH7aRJ01DdVaA/F9vaq
         x4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724843604; x=1725448404;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GMaB8qLEa2uCN/rXdJjEQqqqxE1oJ3oOoi7R0UTEgvE=;
        b=NogxLzMgcws15JOkXRI2Edfg//6qbRlidBmKfeLU7oKRQaWxVb5GhjpyW4w0huI9I8
         UErxN1i9tJGNhsv3rx/vspumWHaqyeC7ajXewFevndWX0wQDDedoVm2d4wdMvcYpDrOA
         pzTuJ3fwQAe7DJk51GCxe5ASEBzl82FiUrwKUSuwxjsnZKL3qiilp3Um9AF30Y/vTTIP
         WxW06/rQX2uk0GJs05HZ5bDMK/g6BuhqlRKWpZgDH3xV96V2vq7oNmYoaBpOf+EAYVSd
         3R0KvjBRHUlLJo4BTWOc05X/GFoPUZmfomOOpO1mCdgRIQJ1xzhaFjxGZbUDHvHThRLE
         NECQ==
X-Gm-Message-State: AOJu0YwHuiaHnPqdiM9YTgc+/pvsjnYKDvMbhHFh24vFCU2Vas4FQMBm
	CG+Zz81z+p40gZjbstK1mMroAAFupyDkM5TXEZ3ezPpv5pZQOe3Id5+r0ST4nv8=
X-Google-Smtp-Source: AGHT+IFK5mU3ayisMyzpmvftrPHN4t4HKiVqyuCiTMjGSzJxgFF0eBTD7RBXuFU1p0MpYkM6P2lLuA==
X-Received: by 2002:a17:906:6a28:b0:a86:8000:be46 with SMTP id a640c23a62f3a-a86a52b3672mr719741766b.3.1724843604335;
        Wed, 28 Aug 2024 04:13:24 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e549e010sm229978466b.61.2024.08.28.04.13.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 04:13:23 -0700 (PDT)
Message-ID: <6ab35d34-0a5f-44ac-9621-18067fd23558@linaro.org>
Date: Wed, 28 Aug 2024 13:13:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/16] arm64: dts: qcom: sc7180: change labels to
 lower-case
To: Konrad Dybcio <konradybcio@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240828-dts-qcom-label-v1-0-b27b72130247@linaro.org>
 <20240828-dts-qcom-label-v1-3-b27b72130247@linaro.org>
 <1145f7e2-248d-4170-b7be-db694e37fec4@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <1145f7e2-248d-4170-b7be-db694e37fec4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/08/2024 12:53, Konrad Dybcio wrote:
> On 28.08.2024 9:17 AM, Krzysztof Kozlowski wrote:
>> DTS coding style expects labels to be lowercase.  No functional impact.
>> Verified with comparing decompiled DTB (dtx_diff and fdtdump+diff).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sc7180-firmware-tfa.dtsi  |  84 ++---
>>  .../arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi |   8 +-
>>  .../boot/dts/qcom/sc7180-trogdor-homestar.dtsi     |   8 +-
>>  .../boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi  |   8 +-
>>  arch/arm64/boot/dts/qcom/sc7180.dtsi               | 344 ++++++++++-----------
>>  arch/arm64/boot/dts/qcom/sm7125.dtsi               |  16 +-
>>  6 files changed, 234 insertions(+), 234 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180-firmware-tfa.dtsi b/arch/arm64/boot/dts/qcom/sc7180-firmware-tfa.dtsi
>> index ee35a454dbf6..f362b6b436ce 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180-firmware-tfa.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180-firmware-tfa.dtsi
>> @@ -6,82 +6,82 @@
>>   * by Qualcomm firmware.
>>   */
>>  
>> -&CPU0 {
>> +&cpu0 {
>>  	/delete-property/ power-domains;
>>  	/delete-property/ power-domain-names;
>>  
>> -	cpu-idle-states = <&LITTLE_CPU_SLEEP_0
>> -			   &LITTLE_CPU_SLEEP_1
>> -			   &CLUSTER_SLEEP_0>;
>> +	cpu-idle-states = <&LITTLE_cpu_sleep_0
>> +			   &LITTLE_cpu_sleep_1
>> +			   &cluster_sleep_0>;
> 
> I suppose this wasn't intended

Yeah, I need to improve the pattern. Thanks for finding this.

Best regards,
Krzysztof


