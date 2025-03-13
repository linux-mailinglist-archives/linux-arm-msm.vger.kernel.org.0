Return-Path: <linux-arm-msm+bounces-51245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BF1A5ED55
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 08:52:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AECC1796DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 07:52:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00AD3260A30;
	Thu, 13 Mar 2025 07:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="aTbTcFc8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C80260384
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 07:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741852331; cv=none; b=no0IOvC8u/9sIEpaw0/MZM0L3+vFX4E3OYohI9moVotIrn844KmHdS4d53W18rhfKAuFLXiiVcgouX8FIeIXzdfX8gOb5T3lVUC65I9Q3oqgOy81esh7XKfo5L5MelEYFdKrtaRhuF430LqtkjP1aZH97axnO3xSzbCID4Kg3Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741852331; c=relaxed/simple;
	bh=Fsrf7QgC862sGCWItFW6TJdYnI/pP94I9U5QzB4uQZE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=KUF9LLKt8Z2QDdqIxBSTijFfnSRAPwl6NAtGOOHrzNX+IN9QA19GfTznacLepFBnoKI3V2VckP8U1K9vBuO/Vu6q58c0U1Sc0Pb1obdlBMMwHWUZ4Dv6hjqGcKweg3P/pwHaxammDxEWczcG4yhI9xL0eTi5qyvDfb56qNPeSaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=aTbTcFc8; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so146197566b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Mar 2025 00:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1741852328; x=1742457128; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fsrf7QgC862sGCWItFW6TJdYnI/pP94I9U5QzB4uQZE=;
        b=aTbTcFc816ZG97krLmM4SvJkPtrastjW5YjyPQHTKPgnObvH6eRqsK6eEIZYnDrblQ
         q7RPGZ/kUECU56A2I1Ty1pmpPVMMeDf8wOvvkdFBGC8PtWvuhB5zPtFgGjMtOdPtT2Kf
         k//c/gFAmsOFTeDDYPfa84ohq1BbO4CxEN0EWvsfCL4ruOUuTWP7HHtu/b2h4saC29Ez
         MxnVtz9eLjBhGGR11fYmLmtY2gLJM5DLxNDg1VLGkKL+YTSZVKH5pffPkJ+2jtWJgmGT
         w4Ope8JK4WCw1e48OeNss/fPrviWjwsErKw1+nqi1q7CMzBQFk1BWepdqi9ytig+eSSd
         krdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741852328; x=1742457128;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fsrf7QgC862sGCWItFW6TJdYnI/pP94I9U5QzB4uQZE=;
        b=DjXC4PzP39/Rj6zCXNfP9/a66wfJSpLRU3a5lYUmHuoZb/FVMM5enpWCeY36vthCXY
         0pGHDph7Qcvn4NpJEpFiduZGXUsIbtNsjUu7TH+VUoQH3F6UQz+SDbFcHzEjct7xXBc4
         WwChOIHqlIyqcGq59HjmF5vHO5Q96dMCb3aLrfvRRpRcgffrrexj9CLtR35I5V51v+l2
         xFJEjZ4qxhjwFbG+izMg55U4u27CU1bYIRglI8dOLqIH/bQE6qqPLX1Ro1G9n3lkdUDX
         LRScRpZP49C5itnYQtl4o9vcPQ3BxRV5POOV8bJmZjAldm9JzERBoHOlDvsEQf1RXKul
         PDiA==
X-Forwarded-Encrypted: i=1; AJvYcCWUxqyqluBKwqp6VJDlezVbfTTgO4gPQ2w3yB3oyuhGETSFl9pUKLfJuRMn8x7+8R0kfaLfunYvJqY9+mbv@vger.kernel.org
X-Gm-Message-State: AOJu0YxreS0rKSjxY2/22DAec64S6sZOhXnVWaK7QXICM1ly8gshRziL
	7jufMe7aEIPXoR8kvkoP1BGfFjKq35S6NK4JXY3h/jDetWTAvS+B/La7FSTvEzI=
X-Gm-Gg: ASbGncuAxxgRfk7g5WlBXl3bSDwaqkng2zNN0KVZMAvu1YmD8zTy3j2lI7IM3IBISmT
	lF1wRnM1LOt8GyM7WL0yG5uDOTkA2GlHZHCLVVTqCgXWF9RmYMWERnFvhy+YL71cMtk2t6gNIuC
	476WhyUrTm+/kJVj4ym0XCQUeAqApT0ajtL17ZwIB8cPbtcozJ11PCjoo/AxRffjf3Bu66I/Ne6
	Xsfyk855q1GTatz/BUaPoxAB78H89rCEdML5V+39BpF2OJj/fYMzuG/IfeY+joouGuFg3QBvvzz
	k96c2GMKjdpRDNHcCqfP+iAHDG9wDaHWh6EWZbdZURhPqWqCXMEjd/ttQGhCqWxQCp79KtoO3Px
	FQRXF5WU5FwQrwA==
X-Google-Smtp-Source: AGHT+IHP8wNISZ67+M/6826xmvZWrQscMDK+8//hmYHwzIUECiMDJMX5zRuB3mlpe6FMpvHer7zRWg==
X-Received: by 2002:a17:907:2ce5:b0:ac2:b87f:2859 with SMTP id a640c23a62f3a-ac2b87f2a72mr1415546866b.55.1741852327837;
        Thu, 13 Mar 2025 00:52:07 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149ce8efsm49276366b.102.2025.03.13.00.52.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 00:52:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Mar 2025 08:52:06 +0100
Message-Id: <D8EZ47Z557OX.37FDVYA5AHET0@fairphone.com>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Jagadeesh
 Kona" <quic_jkona@quicinc.com>, "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8550: Additionally manage MXC
 power domain in camcc
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Taniya Das" <quic_tdas@quicinc.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@linaro.org>, "Vladimir Zapolskiy"
 <vladimir.zapolskiy@linaro.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
 <20250303225521.1780611-3-vladimir.zapolskiy@linaro.org>
 <dbxvzgqs5slrl5edqunal3wplg5jiszqv46dr4nzgowwlhkhxa@qwtfq7nfjwfo>
 <3210a484-b9c3-4399-bee1-9f5bbc90034c@linaro.org>
 <CAA8EJprP9Z181VDCT=xfyrBipzgiB0tfb8M_XZ4H=yOrvEnB0w@mail.gmail.com>
 <f41061a2-cf45-4588-8df7-22270c936ee2@quicinc.com>
In-Reply-To: <f41061a2-cf45-4588-8df7-22270c936ee2@quicinc.com>

Hi Taniya,

On Thu Mar 13, 2025 at 5:39 AM CET, Taniya Das wrote:
>
>
> On 3/4/2025 2:10 PM, Dmitry Baryshkov wrote:
>> On Tue, 4 Mar 2025 at 09:37, Vladimir Zapolskiy
>> <vladimir.zapolskiy@linaro.org> wrote:
>>>
>>> On 3/4/25 01:53, Dmitry Baryshkov wrote:
>>>> On Tue, Mar 04, 2025 at 12:55:21AM +0200, Vladimir Zapolskiy wrote:
>>>>> SM8550 Camera Clock Controller shall enable both MXC and MMCX power
>>>>> domains.
>>>>
>>>> Are those really required to access the registers of the cammcc? Or is
>>>> one of those (MXC?) required to setup PLLs? Also, is this applicable
>>>> only to sm8550 or to other similar clock controllers?
>>>
>>> Due to the described problem I experience a fatal CPU stall on SM8550-Q=
RD,
>>> not on any SM8450 or SM8650 powered board for instance, however it does
>>> not exclude an option that the problem has to be fixed for other clock
>>> controllers, but it's Qualcomm to confirm any other touched platforms,
>>=20
>> Please work with Taniya to identify used power domains.
>>=20
>
> CAMCC requires both MMCX and MXC to be functional.

Could you check whether any clock controllers on SM6350/SM7225 (Bitra)
need multiple power domains, or in general which clock controller uses
which power domain.

That SoC has camcc, dispcc, gcc, gpucc, npucc and videocc.

That'd be highly appreciated since I've been hitting weird issues there
that could be explained by some missing power domains.

Regards
Luca

>
>>> for instance x1e80100-camcc has it resolved right at the beginning.
>>>
>>> To my understanding here 'required-opps' shall also be generalized, so
>>> the done copy from x1e80100-camcc was improper, and the latter dt-bindi=
ng
>>> should be fixed.
>>=20
>> Yes
>>=20
>
> required-opps is not mandatory for MXC as we ensure that MxC would never
> hit retention.
>
> https://lore.kernel.org/r/20240625-avoid_mxc_retention-v2-1-af9c2f549a5f@=
quicinc.com
>
>
>>=20
>>=20


