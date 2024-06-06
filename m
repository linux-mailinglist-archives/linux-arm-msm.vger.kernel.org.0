Return-Path: <linux-arm-msm+bounces-21893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE418FE4A2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 12:51:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA7DC1F27D44
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 10:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F9A41850BC;
	Thu,  6 Jun 2024 10:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LT1xlnTH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB02195396
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 10:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717671020; cv=none; b=mtADDfdMJ7FAcD6cIGcmyf7s6LI4kcIkWPB0dtsYN/+XkgnAi306N4T/+9DS06EeOEIg0P+Ze4BCMCiN8ztw8+eT90BjiMdB4JLPhtEvCa1YIerKEseuNGRCFir+YExi8YF4DvVX755jm58y1w0lpxSUlEyL+vA8fu1R4EhCUis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717671020; c=relaxed/simple;
	bh=lBpSg8Lv9yUtdVyrD0zIyZn+NBaMN/0TwzLyC0E371M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rm1wL01drXAnnJyatfQtz2ZXhNh0WAVujtEDfnpieRJLt83aheoB53FMqYVOy/4KebTbkOQ/zKgEzhh7P8eP8+XQxkGUIFF0LOkuOHuVW4QWoOm1nixXRFCnSUUsx0TBEZs7skHTLaDvGsOZXk4UvvdpXgpzLOfC/SSv9hw+0OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LT1xlnTH; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-578517c7ae9so798399a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 03:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717671017; x=1718275817; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rLnV9lT0RMBL8QGwcM84QsnzjUdPdV6KvK9KQAXkj0U=;
        b=LT1xlnTHOw+IJv/3G4D54cxSQ6rG63yD/gy+K4WRc7NzD17L+pIlWGJs4JX3G3Jm4e
         EhXx9TjlcgsLxaHLsqBtw4xV5uNCCRHGh5k05JXtKfUTIokS5BPqU9662D7AH6IG2euM
         7sAg8nODvuN0B+MA+BZLmISj8bvCh5Cc+dkWg0UMvj3nbskO9s/GFMJyiuYuRBMFhZPQ
         hZu1+pyGn9dEQJVtAY7pXVjJ95MAZzyYv9oyvIN5ldX5C1wQdhueFNpH/f4fQ+fgjMOd
         b6gIe8LeoKSE66J3JY7AQX/0qWVLlSv+ZlbspKIlHteCRsecCpjyu1DSK/yPoxeiqxi5
         M3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717671017; x=1718275817;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rLnV9lT0RMBL8QGwcM84QsnzjUdPdV6KvK9KQAXkj0U=;
        b=gtmppN659vIF93pEo+X6wSwtbpjJS9/6NYyA2WHoGP4Rfjgvh5m/KI2Lf6WZ3xo6+a
         /SFP4R9BjNR2+ebiIkTBZubNM4O9ftXj/QQuWIPzKf/7+tT+Hk5Mvz6eRrBJ+h6cpmwi
         r+ii0FaBdplR0jQhF6gtNW4Z0fQOSbrOoMQaFK7waBbYThUcFJsxwEGpMAnCc3GdavnA
         jN7yVIsL3iclaUcavrTXSwkap5NMR4/ApbZDgCF/TOCeEVt6Byf5P3kugb8WsSgw+raD
         BX4r2KqvyNdQywpU03UwiBZOVyg8oY+tV3GNjUeuhhP0wmE0MMfvzQBxP8l41SO3z1Iv
         vXJA==
X-Gm-Message-State: AOJu0YzVSB4WdSz2D33/0mx0iF1dTcpitylbK7BmNA0To/NzRD8kXpeM
	zZc43sRs30WcvsXseiB4UYCx3D3KtFjFTlXDfae675eG+ZQWpodINGX0lmI3CF8=
X-Google-Smtp-Source: AGHT+IEf8D6a3Fss655zcntCKNrqfpoiWNAqqz5twNeanQNxrZBHbWufZrKTjPS8aOjMyasKbiArWw==
X-Received: by 2002:a50:d592:0:b0:57a:48c:c0f4 with SMTP id 4fb4d7f45d1cf-57a8b6a69efmr3604817a12.17.1717671016695;
        Thu, 06 Jun 2024 03:50:16 -0700 (PDT)
Received: from [192.168.128.139] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57aae2366a4sm867633a12.92.2024.06.06.03.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 03:50:16 -0700 (PDT)
Message-ID: <80f6c943-71af-4200-89ac-d42736514390@linaro.org>
Date: Thu, 6 Jun 2024 12:50:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 31/31] arm64: dts: qcom: sm8650-*: Remove thermal zone
 polling delays
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240510-topic-msm-polling-cleanup-v2-0-436ca4218da2@linaro.org>
 <20240510-topic-msm-polling-cleanup-v2-31-436ca4218da2@linaro.org>
 <a6e75f97-0479-4346-af84-5d7bd05f0063@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <a6e75f97-0479-4346-af84-5d7bd05f0063@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.05.2024 2:47 PM, Bryan O'Donoghue wrote:
> On 10/05/2024 12:59, Konrad Dybcio wrote:
>> All of the thermal zone suppliers are interrupt-driven, remove the
>> bogus and unnecessary polling that only wastes CPU time.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8650.dtsi | 88 +++++++-----------------------------
>>   1 file changed, 16 insertions(+), 72 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index 62a6e77730bc..39e789b21acc 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -5328,8 +5328,6 @@ compute-cb@12 {
>>         thermal-zones {
>>           aoss0-thermal {
>> -            polling-delay-passive = <0>;
>> -            polling-delay = <0>;
> 
> Commit log doesn't really match the values being subtracted
> 
> polling-delay:
>   $ref: /schemas/types.yaml#/definitions/uint32
>   description:
>     The maximum number of milliseconds to wait between polls when
>     checking this thermal zone. Setting this to 0 disables the polling
>     timers setup by the thermal framework and assumes that the thermal
>     sensors in this zone support interrupts.
> 

OK I suppose there are 3 things at play:

1) for devices with polling-delay = <non_zero> without this patchset, the
   polling is removed and threshold crossings are defered to the PMIC periph
   or TSENS interrupts

2) for devices with polling-delay = <0>, this is a NOP cleanup, saving LoC

3) for devices with polling-delay-passive = <0>, this is a NOP, however in 99%
   of cases, this was a misconfiguration in the first place. I can leave such
   entries so that somebody has an easier time spotting it down the line. I'm not
   however willing to go over each one of them and assess what the value should be,
   as that requires significant effort across tens of platforms

Konrad

