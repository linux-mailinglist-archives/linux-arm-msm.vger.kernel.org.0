Return-Path: <linux-arm-msm+bounces-53193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEE2A7B822
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 09:12:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57A2C3B7530
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 07:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A51C418BC3F;
	Fri,  4 Apr 2025 07:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="CG8dWdLM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABFA18C031
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Apr 2025 07:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743750728; cv=none; b=iOF0KWZq45GavMAc7BGGaQPN3p8BSL1VRAng40oCTYmDFEHKqzWksL9SAl91APpLC9wwgwE/NxJL2MV+TGWZEaDeOJLJVixu13/B9MUKCRtTK7S0RRpw6CR5qtg7b3ccTTbVV8E+CvqabN9ZlskkVvzIKpijG1RG58oeyspPejM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743750728; c=relaxed/simple;
	bh=U23hVQDvBPnjEz1wdi+mc/GNtiHL10BsAGjmKYpM6TA=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=Cr11+zzYDOYlYLitiFWkaPOkcAtI4UBzH3FdTJXfn6kR9E+Dke59kal4rXares1tT7j1v8h/FF/hmlx2HuIsYDyD511OubnOHpNucnSy2pVDTiiLydoCR5fMIX9x+1d18k6KBb9OaUNGCuPFIxRHpr5+YH6d0hHxtSRRDffjRik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=CG8dWdLM; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac6e8cf9132so332794066b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Apr 2025 00:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1743750725; x=1744355525; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U23hVQDvBPnjEz1wdi+mc/GNtiHL10BsAGjmKYpM6TA=;
        b=CG8dWdLMsTxbZTBlmZmH7+lJRcBpTSOrE+yAZKODTsIQQQ7rCx/hwFYGwe86eUjrsf
         GoKSsBFpx/os0Fam6hkuRVwJm9m8l/Tpm/KCYCEKz7ia2DyiuYBvEpNySIom/2PzrDW1
         C6qwjki37n/PeMyxr+bR2l1hQ5fYv0ktARX/AtWMZYOoLuO78LBTRv2QqoPzgHPChDHO
         4PM/4VX6jScS17JYmp1kjhefgcm8tjRmOO86D97FlGQbFjQx4tvrCuCXM0Gykjsw/dIe
         719KxaKA4s41OxaU3Gn0OIm2d18PB/x6pThlrcf8bF9KMXzZj3DJcORg2Gn2fJr9BY8Y
         PFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743750725; x=1744355525;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U23hVQDvBPnjEz1wdi+mc/GNtiHL10BsAGjmKYpM6TA=;
        b=oYv9Kb24Wgrc+/zQpepM7419M2ZcdzRMzUF341UnmfCYWN0Kb7ItV4BysZWc23wuHM
         qA3SuBuM4+Y2Oo6Tw+rM47eqOU6HkmWYTTGq+7KT5+7YkCixrdWvPXqxugBzbJ644bvW
         sAP8vA5HIyMKaaoSRUi8lO5XFUDuvNDtl2m8Kunvx3o6xQdXX3k/uD4cdG/8Eh7YC7O1
         J5JwfxVbDoPUCjmFQzDzWB4JgTImPOiRxmcV5FdMNdFzrAPwuun2fBnabw2By1huT+vj
         W6veyTnOVOfShKlRmloJ+x24E4U3h9TgpsN98fo/j4mjRG/E7U/pcNaHuDaJDuJA3H+B
         3Mmw==
X-Forwarded-Encrypted: i=1; AJvYcCWAEWefWa055yy9Dkd5C92Uc7yNYGnM2xi/ONFSzH2ovgegyEoFEpj0XuhZ9z4Nk7XDmkprVIgbz8ccIQOW@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0cJjdR18y1/uMmc4AwMLvQQtfiQAgSDFER4+M89hpmtxzrMb3
	y0dI/wjMEtMpq5Sf3y0HKBSK8TYE8g1lmefaur/lwVT/Gl2/FevtFZjnN/0ioqg=
X-Gm-Gg: ASbGncvh0Nk4pXs4aUWFxnw13hOGSTiZlYhu3C10UlFBO59j86pwmlT3k7Wl+h+B3q/
	m4ReHBTM8Z0hwPIWrniZBcD+7tBjlETf1CGkqTExpP+2M/eFNbmqpXTGGSU2ziS06AsGd5Z3n4n
	G7RdUNE3TT7flOmNJrpURLeQGvvrbT7WceTc52FCEOydq79iHUzvbqfx0OFEWW+qq2MfLykjbGG
	AwiLtvb5NJe6QNlWDEB9cSpNfhZT87l/MbDm3BEljFfPPWG/tZ48QJ4sIIsIZt4Me4up9tqyC91
	bKGPSNZzNLxxwaU85S8a3gOKvgZVcKaxIxsWkOh7qn5q03fkN+bDxoklVygFojCaS7fy0t/IHxG
	Bb49Lops/nLVqMw==
X-Google-Smtp-Source: AGHT+IFN6J+KZNpV9GFYn4RUt9e/peo9TpSfWt8AYxwIXQxs3kWCtPSeLrpO1q1TafhsMbSbK20xMA==
X-Received: by 2002:a17:907:da6:b0:ac3:4487:6a99 with SMTP id a640c23a62f3a-ac7d1c39469mr190978066b.47.1743750724902;
        Fri, 04 Apr 2025 00:12:04 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe5d44dsm209663066b.13.2025.04.04.00.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 00:12:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Apr 2025 09:12:04 +0200
Message-Id: <D8XO1JU37NEV.YN595H7NEOU7@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Prasad Kumpatla"
 <quic_pkumpatl@quicinc.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>
Cc: <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <kernel@oss.qualcomm.com>, "Mohammad Rafi Shaik" <quic_mohs@quicinc.com>
Subject: Re: [PATCH v1 3/8] arm64: dts: qcom: qcs6490-rb3gen2: Modify WSA
 and VA macro clock nodes for audioreach solution
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250317054151.6095-1-quic_pkumpatl@quicinc.com>
 <20250317054151.6095-4-quic_pkumpatl@quicinc.com>
 <4c27d6b9-781b-4106-8165-97c9750cf99f@oss.qualcomm.com>
In-Reply-To: <4c27d6b9-781b-4106-8165-97c9750cf99f@oss.qualcomm.com>

Hi Konrad,

On Tue Apr 1, 2025 at 6:05 PM CEST, Konrad Dybcio wrote:
> On 3/17/25 6:41 AM, Prasad Kumpatla wrote:
>> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>=20
>> Modify and enable WSA, VA and lpass_tlmm clock properties.
>> For audioreach solution mclk, npl and fsgen clocks
>> are enabled through the q6prm clock driver.
>>=20
>> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
>> ---
>
> Instead, put the inverse changes in sc7280-chrome-common.dtsi please

How are we going to handle other sc7280-based platforms, such as my
QCM6490 Fairphone 5 needing to use q6afecc instead of q6prmcc which gets
used in this patchset?

One solution might be to put q6afecc into the base sc7280.dtsi file,
then we have a sc7280-audioreach.dtsi which overwrites q6afecc with
q6prmcc which then gets included by boards using audioreach.

I also don't think we can split this across sc7280 vs qcm6490 vs sm7325,
there seems to be any combination possible on any of these SoCs -
depending on the firmware shipped with it.

So somewhat similar to the current sc7280-chrome-common.dtsi but just
for audioreach.

Regards
Luca

>
> Konrad


