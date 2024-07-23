Return-Path: <linux-arm-msm+bounces-26910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5069F93A1B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 15:38:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC2FD1F228FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 13:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A3EA1534FC;
	Tue, 23 Jul 2024 13:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="fN81/OOc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E67208A0
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 13:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721741907; cv=none; b=fMX/FYkX9YbEplBbBr6a9tJhNIosfuhsAMsD1xu4ZUwTeqedOtGSQYtRuuKNkrMiaV97km/FYOXdOvPr0SGoV9h3rClJAly3iPNj4350E0VGQBdiDb+0QKdwNNRjbk4+geuJ36fzsfjOfWxF2o4toUkBdEI8R6tcQH9TDtaKtHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721741907; c=relaxed/simple;
	bh=+E523LiZG+8eaRFNtnAcYUzaYyDbJAEf5+qMTt8FN/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RYdoWpUSY5mXQ5ScRy3D3fGyD9Y7DEQ2T3pni4YFMwUOZ3Hzftod4XAvEKj7NV997yE1iH15CjUfHND8KWakXsgiW4AC8VW6tfqke2SCD1m4qavKfqgPk/NGQTotsZoeMj/KLmZv/7uV6zOMDcLHKEupr7PPAI4qSupb2c1tJ9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=fN81/OOc; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4279c10a40eso40383635e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 06:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1721741903; x=1722346703; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N3K8G5pHeQAwS16+pZRohvo75/Cf2iIKXzbelmWiAXE=;
        b=fN81/OOcYQxGIY3wBOzQCWNCOaureVT3GGmeD7X1lXlWAY0gRDf9bOf8yGnHHKzBh9
         rr46HFfBNTmbuZEzV61wFXH+/pdMG07kHH04gfb58qs3d3264wZDTedVAkU/iI7HIpfe
         9B3l3WyLFObuwlezwNHhnBklqf72KnIqc6vSAbDQ40hrKy4uU7VytU5I3htLKUGKt6hp
         5BGYav7NqfRIZYxe+7UtSC2fZUWtnSfIzcjBSvynGD8++o/rMasjgjsTDZ47fu4IumS0
         Zb0tbJHPKHt4i5RZ4Pbo+ymqL0MLzeT658+3k6JA0bmPR8McjNX7jbs3drY+NNbuGgfq
         3g+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721741903; x=1722346703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N3K8G5pHeQAwS16+pZRohvo75/Cf2iIKXzbelmWiAXE=;
        b=rP0FqW8WlA8fMa3aBSl9hPbfYeGG103nGBzHX9k9APCq3rk3TXfQTM4ggz0+znY8pG
         my3GEhuszkqZEFr9Z+1fzmMW6c64wk3Nplz5dDrsuawCpGhI5Y5l/ZcWywWqtq+AdJI0
         jYmx+tF/X1ElS5o/YbHLIzKBanzRfl0thrm1WS+cZLJNpR+kpCMBWqY2ZJWvRqB4e3QT
         3A3zH/TMZyirW1ryj4W8LtjeWiQYgW5ghBLft1+AogkdvrzF2tKBsvXajz6SNMyj0TKR
         UQ8aMASXAdSpF/7AO+yJg0BvtRCTg3BP/66bcKJ6H6bpr8s4NutKRoQ8GdtJq8gC7dQq
         XgZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWM8HbBJ+Es8Qw6IFuef13uCg4cS7wT5ekc9NlhN5SPR0SyVdajxDuMgmbgXjO5Lahd/OydUTHoHf6dO9t+/2oOyZi+/Um0F+fHKZcuA==
X-Gm-Message-State: AOJu0YyuImK5lz0w7H8/zi82/R4ts7NxngF6MUddLknK9B1Uu4igbnfW
	rCRKWxPirEQ70u8AW/xPx0Y+ZF0oEnCcFNL1+vyfvY6nA+7R0+4tuX1jiCC+RbE=
X-Google-Smtp-Source: AGHT+IGbKurHrcBQxOwjoCy3I00Mb7Ii4AMC80qELYY6RamyBgLgQUYcRMumqK9YF+XJH9OtD5bRNQ==
X-Received: by 2002:a05:600c:4eca:b0:426:6876:83bb with SMTP id 5b1f17b1804b1-427dc52921amr59397295e9.17.1721741903494;
        Tue, 23 Jul 2024 06:38:23 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d2a8e420sm203734675e9.35.2024.07.23.06.38.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jul 2024 06:38:23 -0700 (PDT)
Message-ID: <a8c7db04-7212-4bf0-b8b1-d371ee33478b@freebox.fr>
Date: Tue, 23 Jul 2024 15:38:22 +0200
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
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <45f5dae6-c606-4612-900a-b719f58d92ce@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/07/2024 15:08, Konrad Dybcio wrote:

> On 23.07.2024 2:57 PM, Marc Gonzalez wrote:
>
>> On 23/07/2024 13:45, Konrad Dybcio wrote:
>>
>>> On 23.07.2024 11:59 AM, Dmitry Baryshkov wrote:
>>>
>>>> On Tue, 23 Jul 2024 at 12:48, Marc Gonzalez wrote:
>>>>
>>>>> On 16/07/2024 18:37, Dmitry Baryshkov wrote:
>>>>>
>>>>>> No, that's fine. It is the SMMU issue that Konrad has been asking you
>>>>>> to take a look at.
>>>>>
>>>>> Context:
>>>>>
>>>>> [    4.911422] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
>>>>> [    4.923353] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>>>>> [    4.927893] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
>>>>> [    4.941928] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>>>>> [    4.944438] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
>>>>> [    4.956013] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>>>>> [    4.961055] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
>>>>> [    4.974565] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>>>>> [    4.977628] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
>>>>> [    4.989670] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>>>>>
>>>>>
>>>>> As I mentioned, I don't think I've ever seen issues from cd00000.iommu
>>>>> on my board.
>>>>
>>>> Interestingly enough, I can also see iommu errors during WiFi startup
>>>> / shutdown on msm8998 / miix630. This leads me to thinking that it
>>>> well might be that there is a missing quirk in the iommu driver.
>>>>
>>>>> I can test a reboot loop for a few hours, to see if anything shows up.
>>>>
>>>> Yes, please.
>>>
>>> Yeah I do trust you Marc that it actually works for you and I'm not
>>> gonna delay this series because of that, but please go ahead and
>>> reboot-loop your board
>>>
>>> 8998/660 is """famous""" for it's iommu problems
>>
>> [   20.501062] arm-smmu 16c0000.iommu: Unhandled context fault: fsr=0x402, iova=0x00000000, fsynr=0x1, cbfrsynra=0x1900, cb=0
>>
>> I get the above warning pretty reliably.
>> I don't think it's related to the issue(s) you mentioned.
>> System just keeps plodding along.
> 
> Yeah that one's "fine"

I booted 40 times in a loop.

`grep -a -i FSYNR console.logs` just returns the same 16c0000.iommu
"Unhandled context fault" message 76 times (as above).

NB: I have maxcpus=1 set in bootargs.

Could the iommu issue be a race condition, NOT triggered when code
runs with less parallelism?

Regards


