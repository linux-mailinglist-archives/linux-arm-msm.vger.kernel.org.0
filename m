Return-Path: <linux-arm-msm+bounces-75964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EC7BB8A49
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Oct 2025 08:53:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7729919C2156
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Oct 2025 06:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98C9A22E3FA;
	Sat,  4 Oct 2025 06:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P+Nf/o9I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0C8221704
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Oct 2025 06:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759560781; cv=none; b=WDFMv3DCnNerfGqrdJvVFHiqb4bxQlBl+/r0NKb67gZKKjdVqvTyrZqAKO8PLKNAL4+F4AQ4pBPF7g54do6/MvdUWlnYbxUvVgIKPchHjnKSFhZqnl3GEVqBLEldEK7Fr9xCnCc2MnlCx/Tfmas698JnmFiwsedK8E7jGpMkmDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759560781; c=relaxed/simple;
	bh=5J1baIdSL45ACTd+W/44QqTvopOgQHTKpCcOhxSE0Es=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=USdjqVO822Bt8NgNoR0WyY4bMXLpEb/HU6QX3dgIJUltcMMKF+EvXL7934zYv5uQiYX2dznymsDM0pCMm5uPfdXh2qjhanBPm3+1sLBCDzoSGW9i6uo89gFajPLGzXWVWDujB4i5CJCpI72DjQmlYfs5gn38u4mx/v4K+jvXLDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P+Nf/o9I; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-27eca7297a7so3984175ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 23:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759560779; x=1760165579; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gnkFM/YLSQkgvC/0LCYL21076eyFbXRBtw4lKWhs2uM=;
        b=P+Nf/o9IV9RKUdF/heAwoIfjj4lfCQ1PpPOJZT3a1zQfc3tuADZ8XpifnS87C6p8J2
         AjSYD4SgA6hFAP/rOU8gBlpg3onFokzCEu42lklKB3K+c8qSSWRyDJdBwtxO6J/N/kHz
         4iYsWxIszOitb62rthYlDDi+3EEOh13+xd/XkSEePLw4Pvz2LyYOYs7JI2ZKBDCN5v0F
         u2m3ANZKk41jkBpLsgwVA6kJFR8yYPrwrpW0c1LJbT9otv0D11Y/8AXsyfUSW5b8wxQj
         S+N9cj8L+/20T9maHFH7MHRWiMkKparjWUp8pKuB1kIT706SbU8BdFkCwWkXL8lCz3K5
         V1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759560779; x=1760165579;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gnkFM/YLSQkgvC/0LCYL21076eyFbXRBtw4lKWhs2uM=;
        b=pCyGEx3zl4aVO+7rOO3zcz3uRtpQi6bKdvccSCctd97KYwqOoZIVRjjbcru45NZV8b
         tnkddvTgit7oSc/JmaYkOtWyAk7QZ1XA9/NkzjzgZw/bcQKq4lJou9cvzfDKw58w85BN
         RyJ7fZ5Nv/sCnT61awcJmQieUvf6j9YUvkpRZaDK0iWYLIUszi8V9Sc43GJ97X0XjNWs
         h9FSiHh/nu24nZjSS2g2Oqwtj5sP1i1crm5tLIpSrH4pnrL9Raz/jIUaghg6VQ5HQ8zf
         IlyZ3sZ3aTcl5PsvjHAixk4dbTl6lvK66pC5Yq4uiZ3eI8w7dByqz8iuprYRM1op2f9S
         UGwA==
X-Forwarded-Encrypted: i=1; AJvYcCW49FCkmtQM/GMtJOJiA5EZaxfY/MBHCuN4ZHFk5p1ikOpDPtkuv7TWKH+HEOPZ5fKLWfm76PSSD+nQ2IVL@vger.kernel.org
X-Gm-Message-State: AOJu0YyTOK/GGm4q/iIRYNMWpI+Hm033dYxApPhh33TLqnxK0CbX47jg
	GAoVjK7U7zPGN/5eKCFsWVkuhVDDlR93JZJIdEEo67zsXJNX3NVeSJMs7+J08+trCFTvRWg9cg6
	yINDSKksgMbqRC6VQ5V4B2um4Cxv0GrHb+KYX4ZC5KA==
X-Gm-Gg: ASbGnct1m3cD807WwVqU/f86BnfQ6+vLvLcRbEZ5vOF4r9EGKHfMgRnIy2uTSjeuSNG
	PuvSxqtdSV/jdBAuCM/Lt22IS9kk+nmL01TRqhZ0BczCHMzRm9Avd/bE55CB70udB5PQLK26AsT
	1wYuNw9c1FpcYEidRL4cvPvlEsMiR7cgmSlVRyVGGtvzs9thRG07YLvFZQFPXX9/rGt4cOtMTv5
	8/fXdOBVMOUi9MDeolx90KppjzpFPcJhVJk1KA9UMsP2P+4LicY8dg=
X-Google-Smtp-Source: AGHT+IHRCGDfDow62sK4NuMTOWAffGvGwOQJ68YmDpR7uTO2azp/umx3vjWJEb/8Uryh4XdPpaafIIgOzzXi9FgKazs=
X-Received: by 2002:a17:902:d2d1:b0:27e:f07c:8429 with SMTP id
 d9443c01a7336-28e9a54edfbmr41659685ad.1.1759560778950; Fri, 03 Oct 2025
 23:52:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250826083657.4005727-1-jishnu.prakash@oss.qualcomm.com>
 <20250826083657.4005727-4-jishnu.prakash@oss.qualcomm.com>
 <20250829-classic-dynamic-clam-addbd8@kuoka> <5d662148-408f-49e1-a769-2a5d61371cae@oss.qualcomm.com>
 <4e974e77-adfc-49e5-90c8-cf8996ded513@kernel.org> <a0e885be-e87d-411a-884e-3e38a0d761e5@oss.qualcomm.com>
 <8c90cc3f-115e-4362-9293-05d9bee24214@linaro.org> <5d4edecf-51f3-4d4a-861f-fce419e3a314@oss.qualcomm.com>
 <20250927144757.4d36d5c8@jic23-huawei> <a3158843-dfac-4adc-838a-35bb4b0cbea4@oss.qualcomm.com>
In-Reply-To: <a3158843-dfac-4adc-838a-35bb4b0cbea4@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 4 Oct 2025 15:52:46 +0900
X-Gm-Features: AS18NWDVJCQB4nr_mbc2c7gb7f3R-Lx013HaHTF8W9UGQYmZaYQrsAiPHuxiRwQ
Message-ID: <CAGE=qrrCvq28pr9Y7it-CGMW=szKUnU+XBj1TmpoUwuASM05ig@mail.gmail.com>
Subject: Re: [PATCH V7 3/5] dt-bindings: iio: adc: Add support for QCOM PMIC5
 Gen3 ADC
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, agross@kernel.org, 
	andersson@kernel.org, lumag@kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	konradybcio@kernel.org, daniel.lezcano@linaro.org, sboyd@kernel.org, 
	amitk@kernel.org, thara.gopinath@gmail.com, lee@kernel.org, rafael@kernel.org, 
	subbaraman.narayanamurthy@oss.qualcomm.com, david.collins@oss.qualcomm.com, 
	anjelique.melendez@oss.qualcomm.com, kamal.wadhwa@oss.qualcomm.com, 
	rui.zhang@intel.com, lukasz.luba@arm.com, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	cros-qcom-dts-watchers@chromium.org, quic_kotarake@quicinc.com, 
	neil.armstrong@linaro.org, stephan.gerhold@linaro.org, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 4 Oct 2025 at 11:42, Jishnu Prakash
<jishnu.prakash@oss.qualcomm.com> wrote:
>
> Hi Jonathan,
>
> On 9/27/2025 7:17 PM, Jonathan Cameron wrote:
> > On Fri, 19 Sep 2025 20:17:43 +0530
> > Jishnu Prakash <jishnu.prakash@oss.qualcomm.com> wrote:
> >
> >> Hi Krzysztof,
> >>
> >> On 9/18/2025 5:45 AM, Krzysztof Kozlowski wrote:
> >>> On 18/09/2025 04:47, Jishnu Prakash wrote:
> >>>> Hi Krzysztof,
> >>>>
> >>>> On 9/17/2025 5:59 AM, Krzysztof Kozlowski wrote:
> >>>>> On 16/09/2025 16:28, Jishnu Prakash wrote:
> >>>>>>> You cannot have empty spaces in ID constants. These are abstract
> >>>>>>> numbers.
> >>>>>>>
> >>>>>>> Otherwise please point me to driver using this constant.
> >>>>>>
> >>>>>> These constants are for ADC channel numbers, which are fixed in HW.
> >>>>>>
> >>>>>> They are used in this driver: drivers/iio/adc/qcom-spmi-adc5-gen3.c,
> >>>>>> which is added in patch 4 of this series.
> >>>>>>
> >>>>>> They can be found in the array named adc5_gen3_chans_pmic[].
> >>>>>
> >>>>> Really? So point me to the line there using ADC5_GEN3_VREF_BAT_THERM.
> >>>>>
> >>>>
> >>>> We may not be using all of these channels right now - we can add them
> >>>> later based on requirements coming up. For now, I'll remove the channels
> >>>> not used in adc5_gen3_chans_pmic[].
> >>>
> >>> You are not implementing the feedback then. Please read it carefully.
> >>>
> >>
> >> Sorry, I misunderstood - so you actually meant I should remove the
> >> empty spaces in the definitions, like this?
> >>
> >> -#define ADC5_GEN3_VREF_BAT_THERM               0x15
> >> +#define ADC5_GEN3_VREF_BAT_THERM 0x15
> >>
> >> I thought this at first, but I somehow doubted this later, as I saw some
> >> other recently added files with empty spaces in #define lines, like:
> >>
> >> include/dt-bindings/iio/adc/mediatek,mt6373-auxadc.h
> >> include/dt-bindings/regulator/st,stm32mp15-regulator.h
> >>
> >> I can make this change, if you prefer this. Please let me know
> >> if I'm still missing something.
> >>
> >> Also please let me know if you want me to remove the unused
> >> channels - I would prefer to keep them if there's no issue,
> >> as we might need them later.
> >>
> > He is referring to 0x14 and below not being defined values.  So what
> > do they mean if they turn up in the DT?
> >
>
> Thanks for your clarification. To address your first point above, the macros
> added here only represent the ADC channel numbers which are supported for
> ADC5 Gen3 devices. If there are numbers missing in between (like 0x14),
> that is because there exist no valid ADC channels in HW matching those
> channel numbers.
>
> For your question above, if any of the undefined channels are used in the DT,
> they should ideally be treated as invalid when parsed in the driver probe and
> lead to an error. When I checked the code again, I saw we do not have such an
> explicit check right now, so I will add that in the next patch series.
>
> And to be clear on which channel numbers are supported, I think it may be
> best if, for now, we only add support for the channel numbers referenced in
> the array adc5_gen3_chans_pmic[] in drivers/iio/adc/qcom-spmi-adc5-gen3.c.
>
> There are only 18 channel numbers used in this array and I would remove
> all channels except for these from the binding files. During parsing, we
> would use this array to confirm if an ADC channel added in DT is supported.
>
> In case we need to add support for any more channels later, we could add
> their macros in the binding file and update the array correspondingly at
> that time.
>
> Does all this sound fine? Please let me know if you have any more concerns
> or queries.

No, it doesn't.  You keep ignoring my arguments and responding to
something else. I prefer not to store hardware values as bindings,
because these are not bindings (and you failed to prove which SW
interface they bind) and it's really not necessary.

