Return-Path: <linux-arm-msm+bounces-64495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 309BEB0142F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 09:16:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5407C7B5542
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 07:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D09751E3DED;
	Fri, 11 Jul 2025 07:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="MqndLE7P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432271EA84
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 07:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752218169; cv=none; b=Ej3k2Ol1QK+snIr6+a0S8+edfOcnwib7oR1HtQNN6QC7d1k5BNq4X3b3k6KRXygKwOG9jIQ/59huCUu16DBEJ1hemxLQgHm4hnHjiGlvE2vDUEYjxaSePqjuQR8APyjS29JaErQaDbgP0/DmcxZ0+MEcVFMx6Quj5MmxkKBf6F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752218169; c=relaxed/simple;
	bh=mQN9mdk1zfE/Tq5fh19Uc5eXfQWbs21bpIrv8ogxK2Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=GZ3LcdqRRDVswOFQbZ8QkxkCcuqxPOLE+Mz69X7bKRpYWOuaKQqqWGBVSF1jH6hVP3JQ+smLruCEy/5NejP8oa9MPH2PiUM2ou//pRGiY7PATZG/uHdVak1vCsN4lYI8qdfecvhtRzxoksBnvIL40IGTgjShIibNgy8JL2ekfHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=MqndLE7P; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ae401ebcbc4so316120666b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 00:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752218166; x=1752822966; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQN9mdk1zfE/Tq5fh19Uc5eXfQWbs21bpIrv8ogxK2Q=;
        b=MqndLE7PKl9zzR0Rw+yxuQH9xRgcSWHu0Bj/CMeSKIjfBBTkvDDEWfrDTCXfLmOjtC
         q928gjsdLd/k7BCARcEk4yd1Tx6yE2kLDq7Oo6ODDP80dxuPNrd5nCr3XygIoTHlGVZF
         mQscZFbdEkjC7CwkiL/cwpZaKK5sBIlC/likUE+IbptK5En51OoQIkrh9Bn4U/adORgu
         G/seUWpX++2qDiK662J4vh/SNklqxQ4LqQ4NLELTX5xmZ/38C+QBhh0PYpKwN0/7oOtp
         Vz4kp0Yg4N7QmOQIuU5jpE96/2cS6s6fwfQg5flmgzZUSXHjj6JfEzpga36hd1qZdYLY
         uOdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752218166; x=1752822966;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mQN9mdk1zfE/Tq5fh19Uc5eXfQWbs21bpIrv8ogxK2Q=;
        b=WSJS5If27P74T02Zjpv+5iGdD8AwEmbAW/Gg5sxwEC+5YirrD/r05tbNL8T/rfP95i
         /SUcQiGQsfaF0jvm5xLOTYIm6MBqk3yz5CC8tOk4MQqIsW89WWXftXk937Yi1yI+mqFy
         D0cdlUJXbVxmkb+ZKtoVydzV1Ya/tlCJ4lLB8FGL5g+5pm1ApXqJqiiRrEN5KqQAXfrM
         4TJkWYbRvqCcBgRLrY4JNe98rE5GkVMzv3mma/BNOhkq6De1EoeRUm3IuuE0O/mT1nh6
         p94SiRrJOhueIyynCwpdUNaM9NCGagKoQ4xj21W55jpA40yARiZYXFu5+RM+l88iQyS/
         VQwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoNX1gRv+EnuNi9e298bkQfoId13sUI9rSSFxLyaHYXlCi6LgjvdUGIcDuE7RiSTqJjTmv1XRUoWH7Hfgg@vger.kernel.org
X-Gm-Message-State: AOJu0Yws0PzOHxNwDm952FAoXoFwF2fCm3WvU2hgdlXJ75k1hdRUuuzx
	IqnCH76YgHn6rgSoL2PXDCHbQNgTOsbs3R1mcvFyi+xSX5aM47IQwmvNRzQZYqIEWh8=
X-Gm-Gg: ASbGnctT/F4vyltUeEwLwGI7LiDdEGDiBaQdh3uaH0ApmRrYR4wC7hiWtRQgCEEKxwK
	FTbV6Oigo3n0srlGcT5DjRTYyC+f3txwj3C/7dUjm+W8cpQyYtfvsmcKqLzHR4p1B7pJt9anVUX
	KbkZbVnLrKrD15NGfyqTQbd2xgVSsXJiol7rctY5DnYpd7L1pR0RTEB3DI5EcdFgCJBNinh2MIP
	U1AU1VLkEToc+PJNsdLhln1Fl1enK/fJhTBpH55cO09qaBOdtvPQpUPE6CsE/50STTMN3mfJYcp
	xR5DxGQujAYRxieouYX8cd2H5VHVwLHwxOEiU+pfhoDvDIRNOhKOtG9VC01q2Bmja/f4Y9vVJoq
	w6UvC/D5iasMIC5e5E0HV3QqGCjeAFnnnkojKilF+C0ES+FdtjEhF6Tp6SXe1FnwlGlc=
X-Google-Smtp-Source: AGHT+IH2FGswcnzP9yBEATuhQDfW/yRMBsxTqQVMW57GBq/sG29jWT8g0652cQbAb2QfRokBgo4ULg==
X-Received: by 2002:a17:907:cd07:b0:ae3:64ec:5eb0 with SMTP id a640c23a62f3a-ae6fbc55069mr219024266b.11.1752218165525;
        Fri, 11 Jul 2025 00:16:05 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8264613sm254810266b.91.2025.07.11.00.16.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 00:16:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Jul 2025 09:16:03 +0200
Message-Id: <DB91HZVOWORI.32382ZPLWQMOS@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Liam Girdwood"
 <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 4/4] regulator: qcom-rpmh: add support for pm7550
 regulators
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250625-pm7550-pmr735b-rpmh-regs-v1-0-cab8ef2e5c92@fairphone.com> <20250625-pm7550-pmr735b-rpmh-regs-v1-4-cab8ef2e5c92@fairphone.com> <bc27209a-e0f8-40bf-979f-3d747c501ae8@oss.qualcomm.com> <23ae6ddb-682a-4c4a-bd63-f0a1adb6f4f8@oss.qualcomm.com> <DB7I7D3P01FF.3T5WRSTJIWLVK@fairphone.com> <c1a48230-c4f5-4c04-a53a-449bd90b1fd8@oss.qualcomm.com> <DB8FM0YYS9UL.JP6OVNZAXWBP@fairphone.com> <c57e130c-38a7-491d-945c-7d5530d4fb46@oss.qualcomm.com>
In-Reply-To: <c57e130c-38a7-491d-945c-7d5530d4fb46@oss.qualcomm.com>

On Thu Jul 10, 2025 at 6:08 PM CEST, Konrad Dybcio wrote:
> On 7/10/25 4:06 PM, Luca Weiss wrote:
>> On Thu Jul 10, 2025 at 3:03 PM CEST, Konrad Dybcio wrote:
>>> On 7/9/25 1:56 PM, Luca Weiss wrote:
>>>> On Wed Jun 25, 2025 at 4:20 PM CEST, Konrad Dybcio wrote:
>>>>> On 6/25/25 4:10 PM, Konrad Dybcio wrote:
>>>>>> On 6/25/25 11:18 AM, Luca Weiss wrote:
>>>>>>> Add RPMH regulators exposed by Qualcomm Technologies, Inc. PM7550 P=
MIC.
>>>>>>> It has 6 FTS525 (FT-SMPS) and 23 LDOs with 3 different types.
>>>>>>> L1-L11 are LDO515 LV NMOS, L12-L13 are LDO515 MV PMOS, L14-L23 are
>>>>>>> LDO512 MV PMOS.
>>>>>>>
>>>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>>>> ---
>>>>>>
>>>>>> FWIW everything you said in the commit message is correct, but I'm n=
ot
>>>>>> 100% sure how to map these LDO types to the existing definitions
>>>>>
>>>>> OK so found another page (also made sure that the supply maps are
>>>>> indeed OK)
>>>>>
>>>>> SMPS is OK
>>>>> L1-L11 is OK
>>>>> L14-23 is OK
>>>>>
>>>>> L12/13 -> pmic5_pldo515_mv
>>>>
>>>> Based on what are you saying that?
>>>>
>>>> Based on 80-62408-1 Rev. AG for the LDO515, the Output voltage range f=
or
>>>> MV PMOS is "programmable range 1.504-3.544" which matches "pmic5_pldo"=
.
>>>>
>>>> But yes, in the table next to it, it's saying 1.8-3.3V, which matches
>>>> "pmic5_pldo515_mv".
>>>>
>>>> If you're sure, I can update it but the datasheet is a bit confusing.
>>>> Let me know!
>>>
>>> I was looking at the same datasheet as you and took into account both
>>> the LDO type from e.g. Table 3-12 and the output ranges from Table 3-24
>>=20
>> But why, looking at table 3-24, is there a mismatch between that text
>> "programmable range 1.504-3.544" and the table on the right saying
>> min 1.8 and max 3.3V?
>>=20
>> Programmable range sounds more like what we'd want? No clue...
>
>>>> (3.544 - 1.504) * 1_000_000 / 8_000
> 255.0
>
> I would asssume there's an 8-bit register that holds the value,
> hence the >>>programmable<<< range may be larger

Okay thanks, you've convinced me enough :)

Will send v2 shortly with this updated!

Regards
Luca

>
> Konrad


