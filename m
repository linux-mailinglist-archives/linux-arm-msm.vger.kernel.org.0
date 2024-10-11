Return-Path: <linux-arm-msm+bounces-34139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A007B99A810
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 17:42:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A6A1280618
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 15:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C632196D9D;
	Fri, 11 Oct 2024 15:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sKp+XNi0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D199194AF3
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 15:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728661338; cv=none; b=h1fC6U+f9Vdt1M5kpNgVG2JLDc4Ytsu+DM+38uoLpKY1F1bf+m83gT/ORfVNydT5zz30UWf7T9r0NSjztcVqtefGTMtwPX1pfZXLYjc8zGtRpTg+/1ZiO87DMaJaB2j43b7tr9GFeNkiksAnwYyvFxpgECqWS9XgSDVCGhLcs00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728661338; c=relaxed/simple;
	bh=FTB9gGHrl3Jgo0ca2thxV5WEisBt66Y4CiZP+f9CMcA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=pJsJ+sEflSFr+m5itBzxMl2cAdjD3iB/8IKbxEdmI2g4oMLjWuwOS22H3E6XT+Lkw9P7b3kUQdmBn8fsdZB3vtIjOl/MJJZKLVWmGjEW9OTaRtTMuY3F938AHFamkjueOUdaRBqpy+bdSqXahW3Z6401g142HMzqagmvSE0Y7kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sKp+XNi0; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20c71603217so20288295ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 08:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728661336; x=1729266136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FTB9gGHrl3Jgo0ca2thxV5WEisBt66Y4CiZP+f9CMcA=;
        b=sKp+XNi0BNljQwl4hJt1qpUhGymq25wIhI21H5QnPkIY8EgwgY7RFKJZ03WHCeNlaN
         t51Z2r3pK/ESS8vavXHHz4BkSXpViHKcFJDMPtEHCFhtqZHkgxxkshzwrra+wx6YID41
         6GMXqNgE1BLTxcm7KTS4yV60G3TgqkCQde0Oqciiw7Ne/UVGeFJr26cbDLItFB1qxdSq
         gvNZMSLYhuXFjQRiLr8rTZpoNuuh2UO3KUd1fR/Q1opQtNmh7jcBxvXQtohc9Gg3QZ/8
         IyhF9MDtOCEbaxPAOg2/bsj+4COOXFqiatd4yrAoMrpFdFQosVHSPqYZdRRxObFe1C0m
         KPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728661336; x=1729266136;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FTB9gGHrl3Jgo0ca2thxV5WEisBt66Y4CiZP+f9CMcA=;
        b=HPDBb/8BkNP1B+omABja6DKoliJ9PEQxoST6AOwKrGE+TVp9p0uQVYSaA4j8SmfLVD
         Fs4AdPYpBsm9IImwnILc+A36WD1AV+Wd5DX+nwArTiXIkUTfQbmDbOVrdnw7zdT3LfWZ
         98oRtvu91+aAxeJEXPTRElo/baN1OJbBfoVhcos1uVSrd+p040zbktv18VIzzxuY9a1z
         uA1Syi8y5j21WarMh5OR37jpOCfizY6+z+YHkSLhQxxVRiKgHJgGznVKtSww91R1qb7w
         2khQJmo1F4vc+cp9iBbZLIcYx13XMmFOHUrYQPx+h4Fhb6DVbq9piDtYhkXys4Or68k/
         gtQw==
X-Forwarded-Encrypted: i=1; AJvYcCXsY6rrYtR1rMA1DZeUyZzAkNE6Uvc2kpFOe1FW9BW5C+yex8TWyB47GHfF92i2HngDKqtf64Mq/a7e4U3o@vger.kernel.org
X-Gm-Message-State: AOJu0YzrtlI9qBd9EPqTDyS2vHPAViONOPIU8rsa1nnjJfPIX83YAUjc
	W9DFnjXo4UMz+p7q4buqYGzTi7Y4DvgE8w470b8TdgAjcyFESO7V8j7lshw8GQ==
X-Google-Smtp-Source: AGHT+IHp+vfQ0g8KOlGcVVFt/8dwQEWB4fGW+orH2uW909xVMHZ0L705DG0vqVSgL8WCAKaDo4xSUw==
X-Received: by 2002:a17:903:1c7:b0:20b:5046:354 with SMTP id d9443c01a7336-20ca16c2c0amr34930705ad.55.1728661335888;
        Fri, 11 Oct 2024 08:42:15 -0700 (PDT)
Received: from [127.0.0.1] ([36.255.17.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8bada634sm24786675ad.5.2024.10.11.08.42.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 08:42:15 -0700 (PDT)
Date: Fri, 11 Oct 2024 21:12:11 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Qiang Yu <quic_qianyu@quicinc.com>
CC: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, abel.vesa@linaro.org,
 quic_msarkar@quicinc.com, quic_devipriy@quicinc.com,
 dmitry.baryshkov@linaro.org, kw@linux.com, lpieralisi@kernel.org,
 neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v6_3/8=5D_dt-bindings=3A_PCI=3A_qc?=
 =?US-ASCII?Q?om=2Cpcie-x1e80100=3A_Add_=27global=27_interrupt?=
User-Agent: K-9 Mail for Android
In-Reply-To: <eyxkgcmgv5mejjifzsevkzm2yqdknilizrvhwryd745pkfalgk@kau4lq4cd7g3>
References: <20241011104142.1181773-1-quic_qianyu@quicinc.com> <20241011104142.1181773-4-quic_qianyu@quicinc.com> <eyxkgcmgv5mejjifzsevkzm2yqdknilizrvhwryd745pkfalgk@kau4lq4cd7g3>
Message-ID: <4802B12B-BAC1-4E99-BDFE-A2340F4A8F24@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On October 11, 2024 8:03:58 PM GMT+05:30, Krzysztof Kozlowski <krzk@kernel=
=2Eorg> wrote:
>On Fri, Oct 11, 2024 at 03:41:37AM -0700, Qiang Yu wrote:
>> Document 'global' SPI interrupt along with the existing MSI interrupts =
so
>> that QCOM PCIe RC driver can make use of it to get events such as PCIe
>> link specific events, safety events, etc=2E
>
>Describe the hardware, not what the driver will do=2E
>
>>=20
>> Though adding a new interrupt will break the ABI, it is required to
>> accurately describe the hardware=2E
>
>That's poor reason=2E Hardware was described and missing optional piece
>(because according to your description above everything was working
>fine) is not needed to break ABI=2E
>

Hardware was described but not completely=2E 'global' IRQ let's the contro=
ller driver to handle PCIe link specific events like Link up, Link down etc=
=2E=2E=2E They improve user experience like the driver can use those interr=
upts to start bus enumeration on its own=2E So breaking the ABI for good in=
 this case=2E

>Sorry, if your driver changes the ABI for this poor reason=2E
>

Is the above reasoning sufficient?=20

- Mani

>NAK=2E
>
>Best regards,
>Krzysztof
>

=E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

