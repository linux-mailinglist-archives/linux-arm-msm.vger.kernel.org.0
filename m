Return-Path: <linux-arm-msm+bounces-63051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA08AED9B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 12:21:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3587D189AD40
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 10:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AF652586EE;
	Mon, 30 Jun 2025 10:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="IrZueZJ4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DC62580F0
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 10:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751278902; cv=none; b=V9a6A2pAoXP7XEEJNxMOipt8WAPmMZy8t+UP2D8Yya+kI20DerXyN7+RIa5cmcnzA8FC+yWO6TwYjq/GsmQ7/iLqpU9Fquzd1sIrmjaLOt2QZu0xScCAmIqegiALqKoXotMV1A3a6YUh4dracyGemfRu5FUQS3OzBCo1effKfK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751278902; c=relaxed/simple;
	bh=6BYE8AWJQLw8WAxO3Q5aBUTeX661u26mmGmL2fLnCZI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ZMWte7gXrGUqnavwgketK7hnIDbExh7q2oki11a66LE2f4YHBKu7r6zsvOtsSr7qa+q8pwN9/G47kSDHNun7FRn/BLvFh4O9OMkUM4vTKnj6oqc9WoJAu6fhK348Zy/savK5e+cz1NnnMcAB0RIFBNeAVlnbXegcAUBW7TruN40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=IrZueZJ4; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ae36e88a5daso373057666b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Jun 2025 03:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751278898; x=1751883698; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91/ZncbDlmcGCt22EAMRhuZKL6uaG/hY8UyZ2Q+pYCo=;
        b=IrZueZJ4qgDMos5cOw6vsmAKPNI7cL5oHlBxR9UC1YhL+Gik/jTsoOe6XDscbMCl/D
         m0b1kr5wj7n3L0V7y6Gu2taGzuNze2Trz/4F1hoehV3UkaCRyOYZv4FTAZrixGoXDCAL
         Ra1lqJVB3V41Bag3if4dM7UPHCeXCsx+seRMCn4xlr5ZNTzn5tZzCD1+ZJgfiE58pMj4
         k6y6iBv4TNPQowcdRpGeLnYeAWQjQ2JzHgL8eT1PYbAbBm4rGdx1FUt/OygzgsenUAeb
         75KzQYafl73kX3Oa9A+8PbNa0dpos0iA2Aa65Cxrg2FkYdFlf78aMhT5bCYVDMC6TetI
         mL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751278898; x=1751883698;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=91/ZncbDlmcGCt22EAMRhuZKL6uaG/hY8UyZ2Q+pYCo=;
        b=E6TWjHmcHhj0rMHlTBAjLGHCvLoJAgnLH32mE6C8bVIVzRra8a3owffcjxzeJIjlr6
         bNPENJdO5PPLBTjPHKiHjBI8clLd7DiX2xKksGeEDZ+MKoabDAT6x6kBQ2U7MTAqhA/+
         H2xYlKb4Djv2q80Cas4sXh3OUOu1aFQTRgrwy6ESmkbBeyIQ8yZHCnnBhXsRgtli/szi
         6ubZtwP9fV80iGQ52pgAr/HdhV9+Gm0A1/jKN6YOt6e0B/hU4YKMmEhozZXkg8QSHen9
         ukYTFAUpI8woeYaX+Jdz5od652OMR1L6j55oGKKzFCp5XmKs+9SGDostLEPv1b2prCKK
         v8rg==
X-Forwarded-Encrypted: i=1; AJvYcCXNOsoU571UBrf6/F/24lMT2Cwms2N48vCBlthM+mSYw4pBwPJxg2Jju5VxQZtlyJg2i4JUciX9ckIVGp/X@vger.kernel.org
X-Gm-Message-State: AOJu0YwiF3hL5UMvEiUnljncOkY70p+dUt2gxqjKjezkk/XwI0k2i1c1
	N3FsQTibROU5i/gH9yOQN9pbVNvN8EJsBEiIf8tlItXphTW1HBFzmzJMijQz2dxpOQA=
X-Gm-Gg: ASbGncuJ1T+qPe61ADHS5gEHSQMfVpyeocXx6Oir6/uQ3TsADeZXmb5LmsHB9Q9Ip8d
	f2GskbiHBd6/x7PJNGVZm9qwKaBqtZ3MT6tCrGymGQEDfkYt87LTVjwQhOYK0iqmSo3KIX5kTux
	YXZZVvUQ/qI/kIV5MOm/vOQvcetiQcKyp75cpld+rP0tW8roHDTxNt+hQK081QNMs9oxAuTH65r
	2DOAtH87x1pwbtTODCBAMU1HwgOmRPM8QtbmCP5f6VWVBZPDk1TpYSLKlupE7w9eTomZXEtkVKV
	dPRvZ4gzANDQKMkXJK8xkTjFsdKO6ew/wMcjFlQKdKBt1UNsj6Hw5c1FfbW99VcDAD3+BJQrwk1
	TfUS+Isxbwev8I9C1iuG6Nsv1hEkTiPmdIvrtNejMPeC5BUdkP+f8S4FUnRcVj9MjOyoNTd0=
X-Google-Smtp-Source: AGHT+IG0udIx5/vSjab4jTXQgQOixHxgW8J50sJp+ilVqsU6WQ7uEmPrf6nFFV5tvDzy3dhkra701g==
X-Received: by 2002:a17:907:9691:b0:ae0:c6fb:2140 with SMTP id a640c23a62f3a-ae3500f374emr1085087666b.32.1751278898278;
        Mon, 30 Jun 2025 03:21:38 -0700 (PDT)
Received: from localhost (2001-1c00-3b8a-ea00-c4de-d39d-05f4-c77a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b8a:ea00:c4de:d39d:5f4:c77a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35365a95esm649858666b.59.2025.06.30.03.21.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 03:21:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Jun 2025 12:21:36 +0200
Message-Id: <DAZSK2NT6TAT.1N6A4I8ETH92W@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <dmaengine@vger.kernel.org>,
 <linux-mmc@vger.kernel.org>
Subject: Re: [PATCH 14/14] arm64: dts: qcom: Add The Fairphone (Gen. 6)
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Will Deacon"
 <will@kernel.org>, "Robin Murphy" <robin.murphy@arm.com>, "Joerg Roedel"
 <joro@8bytes.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, "Viresh Kumar" <viresh.kumar@linaro.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 "Vinod Koul" <vkoul@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Robert Marko"
 <robimarko@gmail.com>, "Das Srinagesh" <quic_gurus@quicinc.com>, "Thomas
 Gleixner" <tglx@linutronix.de>, "Jassi Brar" <jassisinghbrar@gmail.com>,
 "Amit Kucheria" <amitk@kernel.org>, "Thara Gopinath"
 <thara.gopinath@gmail.com>, "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Zhang Rui" <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>,
 "Ulf Hansson" <ulf.hansson@linaro.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com>
 <20250625-sm7635-fp6-initial-v1-14-d9cd322eac1b@fairphone.com>
 <4200b3b8-5669-4d5a-a509-d23f921b0449@oss.qualcomm.com>
 <DAXA7TKVM4GI.J6C7M3D1J1XF@fairphone.com>
 <6d4e77b3-0f92-44dd-b9b0-3129a5f3785b@oss.qualcomm.com>
 <DAXEA131KUXZ.WTO7PST1F3X6@fairphone.com>
 <3fbae47b-d20d-426b-a967-b584e32b8c6e@oss.qualcomm.com>
In-Reply-To: <3fbae47b-d20d-426b-a967-b584e32b8c6e@oss.qualcomm.com>

On Fri Jun 27, 2025 at 5:34 PM CEST, Konrad Dybcio wrote:
> On 6/27/25 4:44 PM, Luca Weiss wrote:
>> On Fri Jun 27, 2025 at 4:34 PM CEST, Konrad Dybcio wrote:
>>> On 6/27/25 1:33 PM, Luca Weiss wrote:
>>>> On Wed Jun 25, 2025 at 4:38 PM CEST, Konrad Dybcio wrote:
>>>>> On 6/25/25 11:23 AM, Luca Weiss wrote:
>>>>>> Add a devicetree for The Fairphone (Gen. 6) smartphone, which is bas=
ed
>>>>>> on the SM7635 SoC.
>>>>>
>>>>> [...]
>>>>>
>>>>>> +&pm8550vs_d {
>>>>>> +	status =3D "disabled";
>>>>>> +};
>>>>>> +
>>>>>> +&pm8550vs_e {
>>>>>> +	status =3D "disabled";
>>>>>> +};
>>>>>> +
>>>>>> +&pm8550vs_g {
>>>>>> +	status =3D "disabled";
>>>>>> +};
>>>>>
>>>>> Hm... perhaps we should disable these by deafult
>>>>
>>>> Do you want me to do this in this patchset, or we clean this up later =
at
>>>> some point? I'd prefer not adding even more dependencies to my patch
>>>> collection right now.
>>>
>>> I can totally hear that..
>>>
>>> Let's include it in this patchset, right before SoC addition
>>> I don't think there's any pm8550vs users trying to get merged in
>>> parallel so it should be OK
>>=20
>> Okay, can do. Disable all of them (_c, _d, _e, _g), and re-enable them
>> in current users? I assume there might also be boards that only have
>> e.g. _d and no _c.
>
> I suppose it's only fair to do so, in line with
>
> d37e2646c8a5 ("arm64: dts: qcom: x1e80100-pmics: Enable all SMB2360 separ=
ately")

Sounds good, I've prepared this change for v2.

>
>
>>>>>> +&usb_1 {
>>>>>> +	dr_mode =3D "otg";
>>>>>> +
>>>>>> +	/* USB 2.0 only */
>>>>>
>>>>> Because there's no usb3phy description yet, or due to hw design?
>>>>
>>>> HW design. Funnily enough with clk_ignore_unused this property is not
>>>> needed, and USB(2.0) works fine then. Just when (I assume) the USB3
>>>> clock is turned off which the bootloader has enabled, USB stops workin=
g.
>>>
>>> The USB controller has two possible clock sources: the PIPE_CLK that
>>> the QMPPHY outputs, or the UTMI clock (qcom,select-utmi-as-pipe-clk).
>>=20
>> So okay like this for you, for a USB2.0-only HW?
>
> Yeah, maybe change the comment to something like:
>
> /* USB 2.0 only (RX/TX lanes physically not routed) */
>
> to avoid getting this question asked again

Ack

/* USB 2.0 only, HW does not support USB 3.x */

Regards
Luca

>
>>> Because you said there's no USB3, I'm assuming DP-over-Type-C won't
>>> be a thing either? :(
>>=20
>> Yep. I'd have preferred USB3+DP as well since it's actually quite cool
>> to have with proper Linux. On Android, at least on older versions it's
>> barely usable imo. Can't even properly watch videos on the big screen
>> with that SW stack.
>
> Bummer! Not something we can change though :(
>
> Konrad


