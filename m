Return-Path: <linux-arm-msm+bounces-26903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 883EF93A0E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 15:08:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 90C8CB2263E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 13:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13DE315278E;
	Tue, 23 Jul 2024 13:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GhB6RzNj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CFB152196
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 13:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721740089; cv=none; b=VJV8EH10kV2QXUIm2NzS1ZCI7DeDaKdZHFy7BdMqErNm1rAgMyN0g/syxn4bT72yg/WVCL0defBJDIq8qbZDHRNbFqbSZw1XNRHRsh+U6H1wniEmS9BOTxtDP8c+5Erdaa7dcdWfv8AHyScWoY4D0EW16CL6dgQLvfnLhmfbxg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721740089; c=relaxed/simple;
	bh=EGP8/x+qOKxt39hA0WYFmIxBm8vjF31dU4qFMMSMb/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ERzKFglbqaxzReMMEV0orN3RJJ5NNTYb9lyvYGsE8P9E0JlrdKZExDiw4sHrGrtBOu/US40FQ/QUpyh8NkJ/yhg2mTa6yFGpU99E24+zz5gAGsMUcOSt/8H6le7IsbyK9pXiHOreaNcmjT2rksyBXQ0EjsDRfA9mObfMzt0mLto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GhB6RzNj; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a6265d3ba8fso62070366b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 06:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721740085; x=1722344885; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lf0IcRiHGaD68W4jEGuR+IJFmIfm0bN1vJri7hfpUvY=;
        b=GhB6RzNjk7H+PeEQQriB3E9hmC0sh6gEDWvLhyQM/gXEEDnvN8XuFQe++Ae2rdvNc6
         rYORwQESQ6fFJzILbHvFHkv33pANq72Wfp6kVqvIDugKwhV9GhPfEffLxgGCzyeGMVbU
         9bvkeFK2g1TDYHJ02HDhi2TQyYLobpkRAKUMEkljrMX8xj1FukYqW3vy2zDn8Kivbj06
         bgLEAh/O/6dkvYzPEMVXj1JS887waubg8fESUiBdu/gKCY+KbEQsahVBpl1GoElFQV82
         Sc7Fu1KpoMP8wP5jEIEAJydD7DIVhVRe53lYYcUjUMAFxpuZKxdIVp+u2Gm4C8M5+BBw
         YLfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721740085; x=1722344885;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lf0IcRiHGaD68W4jEGuR+IJFmIfm0bN1vJri7hfpUvY=;
        b=A6MMhns6p1RSl8W1xQpNvS7WMmSjz+yJWrMcbP4It4rndBq5eiZj5Yi5yFrub31lSZ
         TXmVKBC+oT3l0CtHUx/w8Cc+a85vgXkiEYob3KDTVwmmFsXWjG59OSb5CH8BsfnJUsCh
         fvRSrWCVk3GHa3efcp8HLTFrOTycAGEQUc76vIWcYbMyVBU2usUyvknkWRg909T+VcSn
         zMyJMAXPVGoaLtObGA/GfkOIJTelr0ykGkX8nxPNhMZ0ZVvhR1ThghQ+S+UqNoxu+In8
         6iI+17IZT4LTfVpI9hnLV90UEgVflA4Btx2HqkcutZOObbv+WOEyCCrqHa5jtz9xWMyW
         dw2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXx2vpn2RbV2Pk10aNQ0/tcnsHOrPebfbV5IKV1zHUNpbJfsrTn5idOygwBN6dHnxo7pF0eWvTjmET6v9ai0ue0Ff3Rm5N2WYMl4guCLQ==
X-Gm-Message-State: AOJu0Yxzsnucp4EyMo3EiuMuTSnzhYQiA4p/jJ59qixN19wySTslG9bS
	cX0NqXeb8tkClpJAlA6ptOGNYXJbalWrX8KuwuO45IrgNWmk4VFfoAlS7yVIba4=
X-Google-Smtp-Source: AGHT+IFWhhQjXt6Pkry27QLYIErax7d8FMaA9kci5aV1Il2e8WmEvWyh8jnw3DnogrPLaS4ede0MNw==
X-Received: by 2002:a17:906:dc8f:b0:a6f:b58f:ae3c with SMTP id a640c23a62f3a-a7a87cd9f06mr216702566b.26.1721740085081;
        Tue, 23 Jul 2024 06:08:05 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7a826ab555sm125918766b.61.2024.07.23.06.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jul 2024 06:08:04 -0700 (PDT)
Message-ID: <45f5dae6-c606-4612-900a-b719f58d92ce@linaro.org>
Date: Tue, 23 Jul 2024 15:08:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: add HDMI nodes for msm8998
To: Marc Gonzalez <mgonzalez@freebox.fr>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <7d34a857-6495-482b-9070-1817c88c9913@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2024 2:57 PM, Marc Gonzalez wrote:
> On 23/07/2024 13:45, Konrad Dybcio wrote:
> 
>> On 23.07.2024 11:59 AM, Dmitry Baryshkov wrote:
>>
>>> On Tue, 23 Jul 2024 at 12:48, Marc Gonzalez wrote:
>>>
>>>> On 16/07/2024 18:37, Dmitry Baryshkov wrote:
>>>>
>>>>> No, that's fine. It is the SMMU issue that Konrad has been asking you
>>>>> to take a look at.
>>>>
>>>> Context:
>>>>
>>>> [    4.911422] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
>>>> [    4.923353] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>>>> [    4.927893] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
>>>> [    4.941928] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>>>> [    4.944438] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
>>>> [    4.956013] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>>>> [    4.961055] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
>>>> [    4.974565] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>>>> [    4.977628] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
>>>> [    4.989670] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>>>>
>>>>
>>>> As I mentioned, I don't think I've ever seen issues from cd00000.iommu
>>>> on my board.
>>>
>>> Interestingly enough, I can also see iommu errors during WiFi startup
>>> / shutdown on msm8998 / miix630. This leads me to thinking that it
>>> well might be that there is a missing quirk in the iommu driver.
>>>
>>>> I can test a reboot loop for a few hours, to see if anything shows up.
>>>
>>> Yes, please.
>>
>> Yeah I do trust you Marc that it actually works for you and I'm not
>> gonna delay this series because of that, but please go ahead and
>> reboot-loop your board
>>
>> 8998/660 is """famous""" for it's iommu problems
> 
> [   20.501062] arm-smmu 16c0000.iommu: Unhandled context fault: fsr=0x402, iova=0x00000000, fsynr=0x1, cbfrsynra=0x1900, cb=0
> 
> I get the above warning pretty reliably.
> I don't think it's related to the issue(s) you mentioned.
> System just keeps plodding along.

Yeah that one's "fine"

Konrad

