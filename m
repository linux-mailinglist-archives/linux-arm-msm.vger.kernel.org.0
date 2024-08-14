Return-Path: <linux-arm-msm+bounces-28470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEA3951899
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 12:24:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAA1C1C21405
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 10:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B171AD9EE;
	Wed, 14 Aug 2024 10:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cSMV0iYo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664481AD9C6;
	Wed, 14 Aug 2024 10:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723631077; cv=none; b=A8cLDeEJCm6n+kZv4VnQjHHPeq+r0XGiX0oqURhWKf0KQor//qevhIPHLJxXQe7CGA4YwpMlaSyHB8uKraTU1udyklmAFgarC3TVRAqv/6ybm5FZ755AQwgU5Sm8+n+IRBK43/0jBTrhZ+1PAukYEzpiHCPblAZK5ne9nJVsyv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723631077; c=relaxed/simple;
	bh=F+fWOeFe8egGaghMJ7hHNwSuutzsrA20teroFHUZR1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nin0KOsQb9cLHX1Y1d+llDizIFaTwAYkdIHDfUc5iBL9oKu5ZjCqqsuWbvkE9FWH2Njp8o5K4gK3pHCSL0AKVmP6PNqpf/lNucqJc8Yg1cZxx8d0kHEtZGfOus91p4wuB/V/c0JmtFxnMoihFFzjKgTtOWIq1f8Yns6h+8OjcKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cSMV0iYo; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5bb477e3a6dso6317022a12.0;
        Wed, 14 Aug 2024 03:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723631074; x=1724235874; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GXV7UGdGyeZbDUA6+j8Vfo3psbnrsrWfJEuEHnyCD6c=;
        b=cSMV0iYo9OCIIYOm4V+ZkwMGBVCJrz8dSPDEOXee2nPojEJlmzCLtTOrqzihjCNuGd
         3j3CQXyYoufsrXy6JOdBp2EmZ+uYFiQrjhPvbN/kM3SourwMxmyMtesO+OgO7qrxWDVM
         9/xRImJjb1DmCz7ZhqklfTiB/z+iJNfOHCmgHOqMKjGJY+3beTjA2cOudn/aEniG02JH
         uUpLuaOFmg7px6H+XZam3sxIT32glmtTu6rGxJJVn0TaF7bARuOJRGPZS1gSzo2JyeJU
         bFqoHwcnLYavHDb2r2FmXLrFros6EGG+T3o7rbUXo3gk6iMGLIJBf5bra1+Dtn5fwUN6
         KeDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723631074; x=1724235874;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GXV7UGdGyeZbDUA6+j8Vfo3psbnrsrWfJEuEHnyCD6c=;
        b=jmK90hKRCbbwGoy1Zzb85D1vdQkHKOZPjUeVJshidGLB9HDrppGL/bjs8nr/C3cARW
         TARh3AZxJNOZgzDKmOGO3iKQVFZXg8BnR8YaVbIPzSd9sJNbArvqAtSfItrXtvlupZFk
         mxpxpzfSY4bOZSxprEzqLdCtvv4dx5Rt6KDHdrBjDwDF1LFrR0a2kdYbFl8lQQ1zN+GL
         jg4RyAvBT6pV0Ljf7IWeAaVS7TN2O88NSndFFU78FypxnhaOmCSJk/hb2pA6tSJroMqJ
         sJjODzxAbAzE+3cIoSENfugpZWBJnqf3hrke56ttG3Owjmb/hfdjfm3kZZTQ0y/QLVV0
         JxWQ==
X-Forwarded-Encrypted: i=1; AJvYcCX36AUkydIGo7rZhfmBvnQC7vXgPzuXyTB/fqWcoYsGHS4ZAuU3hODZxaqt9g/9gouenOzUkbUhgDxr4Fiu6ZUpxgx2jdor+E9QiWYHpFAGFwAI3J/MHd01T/dHH7ReWk2oseiUi1TGiTjdEwhplkRMOQUN3/KlRweDWGbFOZAtmPJndVcsaU5r45j5t6wYOOoiNFqaTS+nxT7BL25haGnTWtQ=
X-Gm-Message-State: AOJu0YxENEYh4GIl6ozrmr4Gk7gZAXhZmlRL2glcMJ8nQD7b0N20t7kY
	bQCxyZzcror6qRHVEonZOeOdPdxNwdiXInzD3gkhLejzAe1aqbDa
X-Google-Smtp-Source: AGHT+IHT8ikFBVHM/L8p7WeFJXeQpsp3MAxrag9rNzUpJWagZmc9oFeAj89CTDT921aOs9rTwLTbaQ==
X-Received: by 2002:a05:6402:2186:b0:5b6:d509:6e4f with SMTP id 4fb4d7f45d1cf-5bea1cad57dmr1806913a12.24.1723631073065;
        Wed, 14 Aug 2024 03:24:33 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5be99b0766fsm1231424a12.18.2024.08.14.03.24.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 03:24:32 -0700 (PDT)
Message-ID: <3077d600-c570-407a-87eb-6926a67636f9@gmail.com>
Date: Wed, 14 Aug 2024 12:24:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100: Add USB Multiport
 controller
To: Song Xue <quic_songxue@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krishna Kurapati <quic_kriskura@quicinc.com>,
 Konrad Dybcio <quic_kdybcio@quicinc.com>
References: <20240809-topic-h_mp-v1-0-3c5f468566d8@quicinc.com>
 <20240809-topic-h_mp-v1-2-3c5f468566d8@quicinc.com>
 <21fffb71-d559-4973-8028-d9c9b9f67001@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
In-Reply-To: <21fffb71-d559-4973-8028-d9c9b9f67001@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.08.2024 12:08 PM, Song Xue wrote:
> 
> On 8/9/2024 9:18 PM, Konrad Dybcio wrote:
>> X1E80100 has a multiport controller with 2 HS (eUSB) and 2 SS PHYs
>> attached to it. It's commonly used for USB-A ports and internally
>> routed devices. Configure it to support such functionality.
>>
>> Signed-off-by: Konrad Dybcio<konrad.dybcio@linaro.org>
>> ---

[...]

>> +
>> +                phys = <&usb_mp_hsphy0>, <&usb_mp_qmpphy0>,
>> +                       <&usb_mp_hsphy1>, <&usb_mp_qmpphy1>;
>> +                phy-names = "usb2-0", "usb3-0",
>> +                        "usb2-1", "usb3-1";
>> +                dr_mode = "host";
> 
> Why do we add the dr_mode definition in dtsi file rather than in corresponding board dts file?  Could we follow the node "usb_1_ss1_dwc3"  in x1e80100-crd.dtsi?

That is because the MP controller is host-only and it doesn't make sense
to ensure the OS of that in each board file separately. That's also how
it's done on other platforms with a MP controller description.

> 
> BTW, how do we verify the function of  multiport controller？From my test on x1e80100-crd,  the eusb6 which is from usb_mp_hsphy1 attaches the third-party repeater, do we need a new repeater node/driver to verify the function of eusb6?

I have a X1E Surface Laptop 7 with a USB-A port with a NXP PTN3222 in
front of it. Tested with a smoke test, with both SS and HS USB-A devices.

Konrad

