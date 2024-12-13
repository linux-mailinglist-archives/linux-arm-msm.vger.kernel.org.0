Return-Path: <linux-arm-msm+bounces-42006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 288899F0C20
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 13:22:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DA7716953F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 12:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C52F61DE3D4;
	Fri, 13 Dec 2024 12:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DErs1+59"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283B3364D6;
	Fri, 13 Dec 2024 12:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734092572; cv=none; b=V6NqHtVssYdCXbkqRelNJbsaJf5IGxHc0TM0erm5/0BWU2bNb4wx5rdtXcVNBTmsjoxnk2oIzwk6qZpYK6EBFD+6GfxprQSnXZvOqDfcHnIHZLqz2/Ue+V63hth3+9f9vnQYlSjwGxUtNUNX5Er0SPh7PGZzv9xz9rgi7DJhj2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734092572; c=relaxed/simple;
	bh=U3QUOvDZaoZGjZS7fyQetfYuWqSr0tVIbRvxfKog4fY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tbC819+qQ44GZyXEg7bV6KOPsKaQsWM+SxcjzapR3uzwTVDjfE9UyIiGRzUclJX/GXM5DKtQjuiHxx0dcogHb9aApIuUBvCWrI44bahzzHKWnS7fklK2u38b/1DM8sNQNAV4SoKeDmMDVH1gkTymjsD2mkQGd6Ww9QZseChwWFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DErs1+59; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21683192bf9so16286645ad.3;
        Fri, 13 Dec 2024 04:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734092570; x=1734697370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gkoUtHZ7hhKzvxPmGPTU+DH+8L2cClH0s6/xHoWqxVg=;
        b=DErs1+59cSAicKWWOVVmooJIQ1o7Cvn7mnJ0ciK6zwk59NlGKxhRXkK9TRX0eVt77Z
         S6t1tenNRBUjfWxEMTV2h4Wq+JbRDnkYlVdxX8sE+zTKaDfX5S9WnnDFD/3775F46nD1
         zpvNt40QtQQ4FqhaYIsCczAw0JettFpPz1O6jO9YH5icXkGi6f6m1hwkSt/YMddG5WtE
         Z69vD+jY5rehm0s6KuzryNk2Fka9ISgqLbj61tFCJmKf2PN2Qi8hhl2JCK3Yc/pbC+H0
         dQ5JqBLEwN9RoyGkRi1SGYRRqNGWzGx/eLyOjuikdcPr+rDqBe9NEhCOhx6dxAb9xl3a
         17Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734092570; x=1734697370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkoUtHZ7hhKzvxPmGPTU+DH+8L2cClH0s6/xHoWqxVg=;
        b=A26+WcoOZ7GvjrdfOC7g+BQwi1fASuvF9UyvKR8AL6YWImeI/d8RXLQtViq2R84Daz
         qV9B5epvt9kTEqKCGS9fT0OcZV6EwhfxHuazhDHD5E4dIwmy2a4VHR5wJHJkfd+tVGDK
         RlYQ/1e4PfBnlPFbvYZREAIysY0R0guciJbzmUcDkTHg4+NP6q5lNR1FY4R/d7YzeyyU
         /emRVjxN4DfhvDFROzOqNm/EIthYP+RpDpiG057uxNT6CCtvMG4Fw3VYv0qI2X9b7Alg
         xVyDQKAQ+MrzXuGAd3gFEsjo/zjaw2Mg4QTOxQdyDylggspAMfQpdCVLGK5/Eo5To9S/
         igpA==
X-Forwarded-Encrypted: i=1; AJvYcCWC4dbeCS4u/XvReHfaQ8MpaSyzTO+Is73asf4fXiSzTG4BSWa3O1RoImShyGs9BRAKNgjz7vmMvWko@vger.kernel.org, AJvYcCWcvkkzcjPTJ33nqkkVFhy2R8yyReQQDdUfev2MBUJ21/1TkKlJObNv4/tAbNwNqZI7E/0mBSLkT8gPfAaabA==@vger.kernel.org, AJvYcCWdmQA5sjaFxuTmG/memazpknc8xB4GlaWUL5r5T9wTZjFHGD5F0pLwbHP4h7dvPmu8WRkmzNWUGKOTCuRz@vger.kernel.org
X-Gm-Message-State: AOJu0YwGkbNCwUR0BK6hzrcphOuLAN16jnqSnGQEBxdD4BQpS+WNaDIj
	S5Hawra2TuUFwCx35k0gE5vpueZ4Cx4tDXUfr72Dzv8Gk6D9IQwp
X-Gm-Gg: ASbGncsCwaBEEC8/GhzdoJrME98vc+iiF800J7YXegvbBWmSjsX0DbtuqAOXh8iADFn
	JJz3ZZwCt0tpJt1ImRSZSzKKckI+DHGoc48KfJ8meRkPqU5pPzJLqmhyOKmqhT/zRFjlQdlGiVY
	1FE/0HN6eJhB4VTdCM2AYiM0WPjoZB048M9LtFnh1KAZiJAG1MglDrEW4SB/hukoVL6CKWdHILF
	QZHOpFeq18suVlNELKPCYPdqwQzgKiNjb8SxnxJbFRAdcunRhONr+8=
X-Google-Smtp-Source: AGHT+IEJnyNxZS4ySVLIK90Wt6be9G+XuLk0qehQfXbAcEf8V8n7nbza5Ww3ZcMMXXcYXU5LJrWrZA==
X-Received: by 2002:a17:902:d4d0:b0:211:7156:4283 with SMTP id d9443c01a7336-21892a3fce5mr34329275ad.43.1734092570245;
        Fri, 13 Dec 2024 04:22:50 -0800 (PST)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8f0bcb7sm139067335ad.224.2024.12.13.04.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 04:22:49 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org,
	chenxuecong2009@outlook.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	gty0622@gmail.com,
	johan+linaro@kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mitltlatltl@gmail.com,
	robh@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc8280xp: Add Huawei Matebook E Go (sc8280xp)
Date: Fri, 13 Dec 2024 20:21:35 +0800
Message-ID: <20241213122135.593760-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <5b5ad9f7-5071-4b4e-940d-aedecf179600@oss.qualcomm.com>
References: <5b5ad9f7-5071-4b4e-940d-aedecf179600@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I am not sure, huawei even provided the PMGK driver, but I think it is
not loaded.

If you talking about adsp cdsp and sdsp/slpi (this one should be
unrelated), in the firmware driver files, some of them are same
as the x13s one

adspr.jsn
adspua.jsn
battmgr.jsn
cdspr.jsn

as for qcadsp8280.mbn should be different from x13s, in the old days,
Gao and Chen used firmware from x13s totally, and the firmware didn't
work (If I remember correctly, can't be loaded).

As I know, the adsp firmware is tied with many things, even if huawei
have moved many features to EC, the device still need it. (like normal
usb function, audio? btw, this device can use audioreach-tplg.bin from
x13s as well, I am not sure if it fits well.)


>>>
>>>> +     chosen {
>>>> +             #address-cells =3D <2>;
>>>> +             #size-cells =3D <2>;
>>>> +             ranges;
>>>> +
>>>> +             framebuffer0: framebuffer@c6200000 {
>>>> +                     compatible =3D "simple-framebuffer";
>>>> +                     reg =3D <0x0 0xC6200000 0x0 0x02400000>;
>>>> +                     width =3D <1600>;
>>>> +                     height =3D <2560>;
>>>> +                     stride =3D <(1600 * 4)>;
>>>> +                     format =3D "a8r8g8b8";
>>>> +             };
>>>> +     };
>>>
>>> This should be redundant, as you should have efifb
>>>
>>
>> I think no, it won't boot up without it(stuck at EFI stub: Booting Linux
>> Kernel)
> 
> Do you have CONFIG_EFI and CONFIG_FB_EFI enabled?
> 

Yes, I enabled them.

> (also, your email client does something funny and posts 0x3d, which
> is ASCII for '=' after that symbol)
> 
> 

I am sorry, hah, the first time I reply it by gmail directly, but it
didn't help me cc to others. Then I sent the exported original
message(it added the 3D for `=`, I didn't notice that at that time).

>>
>> [...]
>>
>>>
>>>> +
>>>> +     wcd938x: audio-codec {
>>>> +             compatible =3D "qcom,wcd9380-codec";
>>>> +
>>>> +             pinctrl-names =3D "default";
>>>> +             pinctrl-0 =3D <&wcd_default>;
>>>
>>> Please follow this order throughout the file:
>>>
>>> property-n
>>> property-names
>>>
>>
>> Do you mean I should arragne as following? If so, I actually keep
>> reference devicetree untouched. x13s and crd are written like this.
> 
> Yeah, we try to unify the style as we progress and we still haven't
> gotten around to cleaning up files that have been in the tree for
> years..
> 
>>
>> pinctrl-0 =3D <&wcd_default>>;
>> pinctrl-names =3D "default";
> 
> Yes please
> 
> [...]
> 

Got it. I will do it in V2.

>>>> +     gpio-keys {
>>>> +             compatible =3D "gpio-keys";
>>>> +
>>>> +             pinctrl-names =3D "default";
>>>> +             pinctrl-0 =3D <&mode_pin_active>, <&vol_up_n>;
>>>> +
>>>> +             switch-mode {
>>>> +                     gpios =3D <&tlmm 26 GPIO_ACTIVE_HIGH>;
>>>
>>> This could use a label too - "Tablet Mode Switch", perhaps?
>>>
>>
>> This part I follow Lenovo Yoga C630 one (see [1]), it doesn't use it,
>> and this node is not referenced.
> 
> So "label" could mean
> 
> label: node-name@unit-address {
> 	  property = "value";
> };
> 
> when talking about DT nodes, but here I'm speaking of the
> "label" property (which you set to "Volume Up" in the node below).
> That is read by Linux and provides a nice human-readable name to
> the userspace.
> 

It makes sense, agree. I misunderstood.

>>>
>>>> +
>>>> +             /* /lib/firmware/ath11k/WCN6855/hw2.1/board-2.bin
>>>> +              * there is no calibrate data for huawei,
>>>> +              * but they have the same subsystem-device id
>>>> +              */
>>>> +             qcom,ath11k-calibration-variant =3D "LE_X13S";
>>>
>>> Oh, this can be taken care of! See [2], [3].
>>>
>>
>> I have a glance, now I know we should extract something or it won't be
>> there.
>> Question is how can I extract them? I have a quick search, got no luck.
>> As for windows drivers, in the folder
>>
>> bdwlan.e02
>> bdwlan.e07
>> bdwlan.e1d
>> bdwlan.e1e
>> bdwlan.e23
>> bdwlan.e26
>> bdwlan.e32
>> bdwlan.e47
>> bdwlan.e81
>> bdwlan.e84
>> bdwlan.e85
>> bdwlan.e8c
>> bdwlan.e8e
>> bdwlan.e9f
>> bdwlan.ea3
>> bdwlan.eb8
>> bdwlan.elf
>> bdwlan.elf.g
>> bdwlang.e8b
>> bdwlang.e9f
>> bdwlang.ea3
>> bdwlang.eb8
>> bdwlang.elf
>> Data20.msc
>> Data.msc
>> m320.bin
>> m3.bin
>> qcwlan8280.cat
>> qcwlan8280.inf
>> qcwlan8280.sys
>> regdb.bin
>> wlanfw20.mbn
>> wlanfw.mbn
> 
> Adding Dmitry who has gone through this multiple times and may be
> able to help
> 
> Konrad

I see, thanks.

Pengyu

