Return-Path: <linux-arm-msm+bounces-26914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5A093A2F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 16:40:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C9371C22F84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 14:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7973E14F122;
	Tue, 23 Jul 2024 14:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="ySwd9f6T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B75115572F
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 14:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721745653; cv=none; b=OrBOHNDij4L7xn3RiM6LeCAhvuAl7IsUWIozp5WSezsTQu6wHIENk9JAZ4ofyiRBuD+A9I/WvbZtWPB0Ng2rtGkNB8ejlZRfuxFti72OeISTyDyjnmMDZO5rxGTWc0F9TAq92+mXJE/dftUnfmWLfcqfHspt+A/lKTyZBMpp348=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721745653; c=relaxed/simple;
	bh=Ii/qPPRPd4H6EAcpkggPFOvxtd203ZTNo2muiH3wxlY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=smTlHcfNwVJfCGqom3RZ5hV87eTN9MoXs0/ZV5eiLJUX4/Z2QbJYGF7UJVg8PSnUZ4R1qT7HcaPe/omUXU3ZVZwlVHGQAh1plU15EL2TvgOjalgPjB9bZqfT5D1yjmeaaKf11MSJRgsRgFhEvs626Z6vavrp3bjq7n9Uq5IdmVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=ySwd9f6T; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3687f91af40so2940651f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 07:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1721745649; x=1722350449; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T3K8m7UYLI9e2nw2FiKuLBXvna2sOiFY/YtJCGaVVwg=;
        b=ySwd9f6T3cVcPvOs/tIHOcDBGnpO6XUGfRTtzTkwBea+r8F7JnQiKe77aKgSOfQ7/2
         g4X7KE3i91VZ7dMThTcfS50JdgzFCgY/lb7Osh6YgfEjNsaJeZ8jBrZ/w3qc8sMPzlyy
         CmeWoCc1wo/Eo9lrjTjiC+72xrQ9cDziLgWAHGsSy61e/QXH7tO6Mq88EKkbsdcN5buZ
         6m0GGSDSt84wqCqETRMOmlOJysz8kN9L2FJs3Sd/sUDaeujc+T49PQqlq0iNsbMreYFY
         b6IQCe3KFUnOpuhDnPYenojCQ8VBsMaKtm7dRKhJS14pOwKB9SWva/2rFuGy49cXG9Fe
         8Nyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721745649; x=1722350449;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T3K8m7UYLI9e2nw2FiKuLBXvna2sOiFY/YtJCGaVVwg=;
        b=KhSsabSeKvwFhqfT5LnfiQ/5zY6JWhqW2kiso6CadiybT02qjBj55AruIEEYIAMUmD
         KqcnXO5gL3g0hwFs70LtFMk4ZqmDaTfy3Nj1e5ZnNniXS05Nq17xrt8H5gzueVcjLsYu
         fzY1lxbG8hhhKC5qptmlYkTQ0kJMO/Nf9gqiEiZpNHLsI/23D06sNqqdv75k7/lw5olE
         +XJ4WTYDct5TkJ44862iOx9NDUsBjhk9zfXlfkqVUuTSv4mMAPS9uX2DHihOjYQZst+F
         ZufTNGNPn9IgT2iRVRAx4leiigcQ50CbIvKCbB1mM4V40dWbOGO/y57kxNHkX2B17pDK
         Tx8A==
X-Forwarded-Encrypted: i=1; AJvYcCUg7diScJzW0uxcx6oEjrq9xZBtS5u2C/7iC6aJZ7fyV/sFtMSXRKEW9E0KtL4QdH8Jb3iIVuE6mDi40WwRyaHO2zQLzJLhJsqu3w/Kyw==
X-Gm-Message-State: AOJu0YwY56afMs88y0mcWJrWhttNBtBusHXeqevpyREybm5eMLIw9U1G
	WvsCLkvo36ZpVzDNYPiLOhEm3dQcWulwewX3nzhD/IF39pI3YlzyEITfpubSYys=
X-Google-Smtp-Source: AGHT+IGlwpdFnzbN5dFR3IJlUvCm4jcY/F9lixNZD/n0wR4wTR15Py/Fg3+cKLPkHHM/vuMRaPpzDw==
X-Received: by 2002:a05:6000:4026:b0:367:8a3b:2098 with SMTP id ffacd0b85a97d-369bbbb2e21mr7254343f8f.3.1721745649159;
        Tue, 23 Jul 2024 07:40:49 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-368787cf182sm11760210f8f.82.2024.07.23.07.40.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jul 2024 07:40:48 -0700 (PDT)
Message-ID: <0d5d3918-3988-4d29-8bb3-aaf7b0aa0045@freebox.fr>
Date: Tue, 23 Jul 2024 16:40:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: add HDMI nodes for msm8998
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
References: <20240627-hdmi-tx-v5-0-355d5c1fbc3c@freebox.fr>
 <20240627-hdmi-tx-v5-4-355d5c1fbc3c@freebox.fr>
 <d9898342-2439-4d3d-8e3d-5bf0a7a40245@linaro.org>
 <b6f6c845-6094-44ce-8ad0-ed4f6d353cec@freebox.fr>
 <CAA8EJpqrAFKCr63JHEpZ3b3zdRfoNXoJP6SqKDOO4sqc=c6YdQ@mail.gmail.com>
 <44101ecd-61f4-4609-bb22-12b40b692552@freebox.fr>
 <CAA8EJpprtmefNM_CJFRbYVNxOWUVVWbedBq44r7GXOdDrQ2WjA@mail.gmail.com>
 <04ef978f-2bfd-46cc-a9f7-40a6f1c507f8@linaro.org>
 <7d34a857-6495-482b-9070-1817c88c9913@freebox.fr>
 <45f5dae6-c606-4612-900a-b719f58d92ce@linaro.org>
 <a8c7db04-7212-4bf0-b8b1-d371ee33478b@freebox.fr>
 <57c165e6-d942-4a17-a26b-7e4a0422127c@linaro.org>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <57c165e6-d942-4a17-a26b-7e4a0422127c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/07/2024 15:43, Konrad Dybcio wrote:

> On 23.07.2024 3:38 PM, Marc Gonzalez wrote:
>
>> On 23/07/2024 15:08, Konrad Dybcio wrote:
>>
>>> On 23.07.2024 2:57 PM, Marc Gonzalez wrote:
>>>
>>>> On 23/07/2024 13:45, Konrad Dybcio wrote:
>>>>
>>>>> On 23.07.2024 11:59 AM, Dmitry Baryshkov wrote:
>>>>>
>>>>>> On Tue, 23 Jul 2024 at 12:48, Marc Gonzalez wrote:
>>>>>>
>>>>>>> On 16/07/2024 18:37, Dmitry Baryshkov wrote:
>>>>>>>
>>>>>>>> No, that's fine. It is the SMMU issue that Konrad has been asking you
>>>>>>>> to take a look at.
>>>>>>>
>>>>>>> Context:
>>>>>>>
>>>>>>> [    4.911422] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
>>>>>>> [    4.923353] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>>>>>>> [    4.927893] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
>>>>>>> [    4.941928] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>>>>>>> [    4.944438] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
>>>>>>> [    4.956013] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>>>>>>> [    4.961055] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
>>>>>>> [    4.974565] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>>>>>>> [    4.977628] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
>>>>>>> [    4.989670] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>>>>>>>
>>>>>>>
>>>>>>> As I mentioned, I don't think I've ever seen issues from cd00000.iommu
>>>>>>> on my board.
>>>>>>
>>>>>> Interestingly enough, I can also see iommu errors during WiFi startup
>>>>>> / shutdown on msm8998 / miix630. This leads me to thinking that it
>>>>>> well might be that there is a missing quirk in the iommu driver.
>>>>>>
>>>>>>> I can test a reboot loop for a few hours, to see if anything shows up.
>>>>>>
>>>>>> Yes, please.
>>>>>
>>>>> Yeah I do trust you Marc that it actually works for you and I'm not
>>>>> gonna delay this series because of that, but please go ahead and
>>>>> reboot-loop your board
>>>>>
>>>>> 8998/660 is """famous""" for it's iommu problems
>>>>
>>>> [   20.501062] arm-smmu 16c0000.iommu: Unhandled context fault: fsr=0x402, iova=0x00000000, fsynr=0x1, cbfrsynra=0x1900, cb=0
>>>>
>>>> I get the above warning pretty reliably.
>>>> I don't think it's related to the issue(s) you mentioned.
>>>> System just keeps plodding along.
>>>
>>> Yeah that one's "fine"
>>
>> I booted 40 times in a loop.
>>
>> `grep -a -i FSYNR console.logs` just returns the same 16c0000.iommu
>> "Unhandled context fault" message 76 times (as above).
>>
>> NB: I have maxcpus=1 set in bootargs.
>>
>> Could the iommu issue be a race condition, NOT triggered when code
>> runs with less parallelism?
> 
> No clue, can you try without maxcpus=1?

Same behavior without maxcpus=1

40 boots, no panics, no FSYNR other than 16c0000.iommu

> The thing will likely run slower (because reasons), but shouldn't
> explode

That makes sense!

- Hey, boot is slow. What can we do to make it slower?
- Well, just add a bunch of cores running in parallel, that will get the job done!

As a matter of fact, trying to boot to command-line with
maxcpus=1 causes the system to lock up & reboot.
I had to add a systemd script to enable some cores at init.
Some qcom daemon must be locking a core & expect progress
from another process.

Regards


