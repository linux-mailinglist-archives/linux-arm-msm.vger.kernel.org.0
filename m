Return-Path: <linux-arm-msm+bounces-52950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FEDA777E7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 11:40:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7BB127A2E18
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 09:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F1A1EA7FC;
	Tue,  1 Apr 2025 09:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="X7n4Hcnp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1273338B
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Apr 2025 09:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743500415; cv=none; b=bYc/Q2YaOKhtU26AgxTAeSYKbn/xpcTj/QbKw6Az3u1IEVat4dVeuWL7WUEqpEDOaLMNIqB8xJ6gcXTDQ/09dKURUE0k0v2g/Eo7P+Y0B17AQDwdf/ZquaTI3sU4Bwnd342oh7gP/WjY2s9jJTTs1jFTVA1HQb4Mv23gFo0syZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743500415; c=relaxed/simple;
	bh=GeVmDJpAtGcYjcUa2o1CX+EeNS1itmpdgxrXq/vSfE8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=Cz8Sv2FIGe1FdkCycGIm0mrG3WMLEm3cbHhpxYfp1ihlzIi2vvhfmAEz/+Oq6MK8nR+m9LdIAIpbaR8ZwB620jpUtqX2n0KZVtz4KE1x0xPpcWKg95JmSs+1mGG1/74Y4OCrPm+b6OfJ5ZqWWlGrUWn1LI8RoVWwLXoUD1YwVR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=X7n4Hcnp; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3914a5def6bso2993008f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Apr 2025 02:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1743500412; x=1744105212; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+FKTm75hAoWCZk3tYIS+seDyAX4QbuwmOdx2PPDqFY=;
        b=X7n4HcnpY5rALXsRLFaG3zcIUVCKGBhwkL6O9a/lYU/YdhpcOH/FxNz/iGDA2h9Kys
         0z4RvqsMhVKC0mjFt/Slm/K69ag7QIY1sgl4Moook6+iFaFgmxIkUnPoZqczPa/FKQoX
         CKoN0t8/wQg0AJ9L9drKDoECzNG5ZZ+ojWZNtp8YDpd2jhMrOath7xvVAzJyG1LipsNj
         MXAgnM6c09aSapTcjQqMSUL+kncndJrWgSlgqLpAMhsIDmgEdFtBqlA5CGs93qe+eOV6
         pBSTPVMARFbQUIpZV7J6PwVB7okrf3eZIDNAUxelbepRYq6NDk9Vh5Kxo6gVsETd4jKS
         odIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743500412; x=1744105212;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V+FKTm75hAoWCZk3tYIS+seDyAX4QbuwmOdx2PPDqFY=;
        b=NNjUVL8Cuc7KKEWuxByD4jzCRKm3VERfNBeVkzPGJ0deH4r3fZVfTzCQHR/66Eubku
         KddURSF8SkT5gtKCOXErty7ZomfZRPh4ixqOzyNBARp9v6E+HnCLN24zHm9LEcGmg6lE
         OA126pOgGZvOFGgVVHG0Nl3JAT4mFiMw+CVq0UO5TVbS1J2WPQp+9cLxhFgbhDTnc8wq
         0/4BJH2JflCTBkFh9xgpf649AubNZnBBUtUSP2wngJYFKwgsCeAH1hfpXa+MTmlpW5WL
         V15Rxeiassn2hKCTu0oRdwnABHDG1Ka71wkCpzGRCeaHtHpPCpLIaDwxpQVXFnd+IBjx
         hqkw==
X-Forwarded-Encrypted: i=1; AJvYcCX78VGXcwtCRPzrkv6X3DIdQrCPHtwL5XpZe5cFEAkolKg1G5O6/6TmIXPiEXPOxmKg2lcCn41TrdMa09lT@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5W+9tGAHAezAYku7+c7wKVZi6M8MDAfphvbZWNE91aozAQPh9
	bRXElBDs5C4+NyQ/Mp2mmRGZW6Fj0lujahNDAVCnInovcFKnsJOHSbdB9elMwPS8v+BU7HL9cxu
	6FQ8=
X-Gm-Gg: ASbGnct+nuFynhMxA/+u0bhIluITYQuI8akv77HHCj93DC73xSLbPBGaWEWsn7SvFYr
	mxsMDMRe/B2RiPmDDvvbGcpDoa5RjKHnU/XUbAUjLTLZHSaJ5tJr97gBNrkxPNokTf0Vltr5CEq
	dSiYooex2zBGvTy6U51GKS46SsFpHlykka72M5KdzUoRjmlk3AvuNge5RHyRyoyKPr+SHVBDkfO
	08gEwjjUoIEl+ihQ7TsUriUbUFjspN8JNw30YOLXH2SW7kLlbmHMFQwO0nt0LRwVt7Yw9XPARlN
	KPrQJDn2PjJOB/I8IegaFIJmqzellPUdxIPxF4g5kvXZog==
X-Google-Smtp-Source: AGHT+IFGKl3GrrQSY2k0LwXqmE/5+t+Rxzi5kNvE+QhbGIrUMVYhxDyj/cR0tPI+E2YJQFya68o5Zw==
X-Received: by 2002:a05:6000:1ace:b0:397:8f09:5f6 with SMTP id ffacd0b85a97d-39c1211d5ecmr9166807f8f.47.1743500412204;
        Tue, 01 Apr 2025 02:40:12 -0700 (PDT)
Received: from localhost ([41.66.98.107])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7023a341ad3sm26451347b3.22.2025.04.01.02.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 02:40:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Apr 2025 11:40:08 +0200
Message-Id: <D8V7BAC36W6I.127OOFAEB4N63@fairphone.com>
Subject: Re: Venus probe issues on SM6350 SoC
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Vikash Garodia" <quic_vgarodia@quicinc.com>, "Dikshita Agarwal"
 <quic_dikshita@quicinc.com>, "Konrad Dybcio" <konradybcio@kernel.org>,
 <linux-arm-msm@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <D8S03CCD8LGW.TA2FRY4CKEGT@fairphone.com>
 <bb733204-ad6d-8487-ba17-b38cd9ea1ac0@quicinc.com>
 <49f8a822-4df4-0a61-b342-bd6c418314c9@quicinc.com>
 <D8V4SZVFFHGD.17Y9J8WFKNHYY@fairphone.com>
 <9edeecac-008a-ed28-a029-9fe2278c12c4@quicinc.com>
In-Reply-To: <9edeecac-008a-ed28-a029-9fe2278c12c4@quicinc.com>

On Tue Apr 1, 2025 at 11:21 AM CEST, Vikash Garodia wrote:
>
> On 4/1/2025 1:12 PM, Luca Weiss wrote:
>> On Tue Apr 1, 2025 at 8:55 AM CEST, Vikash Garodia wrote:
>>>
>>>
>>> On 4/1/2025 11:47 AM, Vikash Garodia wrote:
>>>> Hi Luca,
>>>>
>>>> On 3/28/2025 8:52 PM, Luca Weiss wrote:
>>>>> Hi all, and Vikash and Dikshita,
>>>>>
>>>>> Konrad Dybcio was suggesting I write an email here, maybe someone has=
 a
>>>>> good idea what I can try.
>>>>>
>>>>> I've been working on bringup for SM6350/SM7225 ("lagoon") for the
>>>>> Fairphone 4 smartphone but have been stuck on getting Venus working f=
or
>>>>> a long time (~January 2022). Essentially, whatever I try probe fails
>>>>> with the following error:
>>>>>
>>>>> [   41.939451] qcom-venus aa00000.video-codec: non legacy binding
>>>>> [   42.162105] qcom-venus aa00000.video-codec: wait for cpu and video=
 core idle fail (-110)
>>>>> [   42.167037] qcom-venus aa00000.video-codec: probe with driver qcom=
-venus failed with error -110
>>>>>
>>>>> I've double checked the videocc driver against downstream, the videoc=
c
>>>>> GDSCs and their flags, compared dts bits, checked basic driver bits b=
ut
>>>>> I couldn't find anything to get further than this.
>>>>>
>>>>> For driver / compatible, it doesn't seem to matter if I use sm8250 or
>>>>> sc7280 compatible or actually the struct I created for sm6350.
>>>>>
>>>>> I'll attach the log with some extra debug prints below.
>>>>>
>>>>> My git branch for reference: https://github.com/z3ntu/linux/commits/s=
m6350-6.14.y-wip-venus/
>>>>>
>>>>> I didn't try the new Iris driver yet, mostly because as far as I can
>>>>> tell, VPU_VERSION_IRIS2_1 is not yet supported there, just IRIS2
>>>>> (sm8250) and IRIS3 (sm8550). But I'm also happy to try something ther=
e.
>>>> The good part if IRIS2_1 configuration have firmware support with gen2=
 HFIs.
>>>> Since you are wiling to give a try, let me or Dikshita share the firmw=
are with
>>>> you in a short while, and with that, you can directly try SM6350 with =
IRIS
>>>> driver. Given that we have already validated SC7280 with gen2 (downstr=
eam
>>>> version of IRIS though), i am quite hopeful that SM6350 can be up with=
 iris.
>>>> FYI, iris is having just the h264 decoder at this point with RFC patch=
es posted
>>>> for VP9 and H265 decoder.
>>> Pls try with below firmware bins on IRIS driver. We can debug from ther=
e. Hope
>>> you have the access to download the binary.
>>>
>>> https://git.codelinaro.org/clo/linux-kernel/linux-firmware/-/commit/560=
35bf6edac7eb4d2867528c598eb646ee68651
>>=20
>> Hi Vikash,
>>=20
>> Thanks for sharing these binaries!
>>=20
>> I've signed them with sectools for my device and tried them first with
>> the venus driver.
>>=20
>> There it looks like the firmware doesn't load at all:
>> [   44.798028] qcom-venus aa00000.video-codec: fail to load video firmwa=
re
>> [   44.800367] qcom-venus aa00000.video-codec: probe with driver qcom-ve=
nus failed with error -22
>>=20
>> Then with iris driver and qcom,sm8250-venus compatible while it does
>> seem to complete the probe function (I see a print I've added in
>> iris_probe before the last "return 0;"), the phone crashes.
> The approach to update the SM8250 platform data to bringup looks good. Co=
uld you
> share the boot crash stack as well ?

Hi Vikash,

Unfortunately there's no log in dmesg when this happens, the phone just
freezes, I'm not sure right now whether it reboots into ramdump mode then.

But also for ramdump I haven't yet used the tools to debug such a crash,
so that wouldn't help me too much right now.

I can also try later to try and find what part of the code triggers
this, by adding some prints around the files, maybe that reveals a bit
of what's happening there.

Regards
Luca

