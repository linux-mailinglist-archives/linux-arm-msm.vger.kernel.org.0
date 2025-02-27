Return-Path: <linux-arm-msm+bounces-49637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FB2A476C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 08:42:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB35F16C86E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 07:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 118A62222A7;
	Thu, 27 Feb 2025 07:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="MqL0PS9N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D919A22170B
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 07:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740642135; cv=none; b=AORFjmPfP/csN4opANZcmrujfybr4xfvK0vCtfmZzpF+TE87mVOrUBfrYdCko06AnttvWomDxIB8f2Fm21RPiYiO8IxH4Napwo28ySoQpZ4ZoN7p9ex4sZ6OGei8oAjPHM1P6xiTMg0RgrfEKLTUYNMBewWtd+Fu7qv7mjkQWZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740642135; c=relaxed/simple;
	bh=hOWdYrxNiuPN+XNM7jJtHqXLqHZiONyk2eJf35zleLQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=lC1OGmeNal0Xkuvdcnxf3Xr9YyIqLt8nSCjtf5o1jVvlCEDfWnlOpQ27hY/NzD5Qdl4GeWXXRIqil/TEBNKzSlquh91CVRCtz889nthbF1vSWppE3O0MXSkR4RxMNo4K5aCoFSiovoPpdByenGfl4hXY4no0L10VTK/wNfb01dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=MqL0PS9N; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43994ef3872so3866805e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 23:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1740642130; x=1741246930; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDstNabKa+U0RFMr+z3tANP7Vpq5gfUk2k27kasy3M0=;
        b=MqL0PS9NAInaTWnWSw7cHRNWcriR0cflcIq2/WF0wQrPby2EiMBOywObtHbpAuQfBx
         D8Wenx9alUaIUJ2vpZB/+mcuqA+o0UkrwxLcK6ImBng1qEuzymEgX0wJ5HCchYQbsqav
         DznWcnMWq2E7KuITZAStKu3mcCsJp47bjhYAqbD5OR75oIJswJoRxOBBYoeZJGB6zzXF
         Ksi4Vt97tMysPaGPnP++Lfi4vWz5VEwV7Gy9gi2fYaVyQuKyiCuM1Z+3hvDdm/I5hWAK
         b0Um9R0jl5vFdol5oav0NVHltb1AfxHhUY5jtbLHZiKHGAm9Xv0TuGNVa8u6q+iU6DtG
         ixwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740642130; x=1741246930;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vDstNabKa+U0RFMr+z3tANP7Vpq5gfUk2k27kasy3M0=;
        b=L3TH+0fpBFHGvV9u+QpIt36eHJHD1733klLLF5Dy8tv2DIi8jjInbGukQ8QA+NTkKD
         BZT+BdbDhRmtU9D8QJqoa/G14IOamNmT+oMQv+bpVfdAF6gtFL81l/AdDyIlYRo360Xy
         31h066ipTMc9CaHzT2+L+0cN8TomNhFQ2VcAiMdVhSFdKtDKbbYdNPeIKJE4Ky1CzFeo
         Ed/7OTulzMttbErvgO0Xydr34CvIBu6BOcoJ1mmGqWiGAEtHg8mG10FaB/HS9l+tgI+8
         gf71Flvgo1ZIwY0+QNeWZYFTzFmzYuqOKU8JTxePwDwuiScesThwyDN0Q2Ae/sxCNLtM
         9JKw==
X-Forwarded-Encrypted: i=1; AJvYcCUKlSOgjSVS/hmBL1YLvSttgsrHtPaS+EOpHNM79wMro4h70HW5iXseoRjirqUG+qJqiqfhJiGGR0umnTeA@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6PeBLhWz8NjA/NGtw8X6y9W0F0v7KWgbj245CZ7T9E2PGjdZV
	AK1aSYaJAfxEc4QCZuuFS81MPnC4qZeL+6xM+cku0vHNrhCz1qRv71XRNRKaI/M=
X-Gm-Gg: ASbGncsBZj9l+9IfhdVjU4Jd+1gbOZtsyelZaai+iHyVI4aDOmGEodMXqmfliUZRoRG
	BFYl94jB9Ne8y9dg8CKJMIwE7UHgxhRppFse2P37rHs9DmXX3Kh9ejWa1FmMoQQJ4KWuq3uJaAN
	EdbspOw+Jr7M9ngKS76COdtcrzA+pLeBQUQUUIzIC5TvQgyZ27Ztg4hbb1dqrQB7MsCmX7G/3Mc
	/izKKQD7UbOOCc9vCgQlpzVkreGnQQC1DAId/JnhJwCSzd+0F1dSH4+rOk8kfEnYVpmDk/kzh6T
	ThCGIbPzZNcFodpNRSZZ5BvPbmI64eVkqHH1348E17qumpJBB6U4P2MDViMtCcxh+SrAg4c=
X-Google-Smtp-Source: AGHT+IEjgF0COFVrxkgx63jJMahBS/fzpXpuAZ0WbHEMTNr8DH0vZgYR2D9bi1jTvh7DSZQR0NvF4A==
X-Received: by 2002:a05:600c:468e:b0:439:9828:c44b with SMTP id 5b1f17b1804b1-43ab0f3ccddmr106690235e9.14.1740642130144;
        Wed, 26 Feb 2025 23:42:10 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba52b947sm45759585e9.2.2025.02.26.23.42.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 23:42:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Feb 2025 08:42:06 +0100
Message-Id: <D8324XX78W5E.273JA9U5U4NV8@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] Fairphone 5 DisplayPort over USB-C support
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, <cros-qcom-dts-watchers@chromium.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250226-fp5-pmic-glink-dp-v1-0-e6661d38652c@fairphone.com>
 <e5290e59-0022-4eba-abce-a11928d76d3a@oss.qualcomm.com>
In-Reply-To: <e5290e59-0022-4eba-abce-a11928d76d3a@oss.qualcomm.com>

On Wed Feb 26, 2025 at 6:44 PM CET, Konrad Dybcio wrote:
> On 26.02.2025 3:10 PM, Luca Weiss wrote:
>> This series adds all the necessary bits to enable DisplayPort-out over
>> USB-C on Fairphone 5.
>>=20
>> There's currently a dt validation error with this, not quite sure how to
>> resolve this:
>>=20
>>   arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: typec-mux@42: port=
:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpec=
ted)
>>           from schema $id: http://devicetree.org/schemas/usb/fcs,fsa4480=
.yaml#
>>=20
>> See also this mail plus replies:
>> * https://lore.kernel.org/linux-arm-msm/D0H3VE6RLM2I.MK2NT1P9N02O@fairph=
one.com/
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>> Luca Weiss (3):
>>       arm64: dts: qcom: qcm6490-fairphone-fp5: Add PTN36502 redriver
>>       arm64: dts: qcom: qcm6490-fairphone-fp5: Add OCP96011 audio switch
>>       arm64: dts: qcom: qcm6490-fairphone-fp5: Hook up DisplayPort over =
USB-C
>>=20
>>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 110 ++++++++++++++=
++++++-
>>  arch/arm64/boot/dts/qcom/sc7280.dtsi               |   2 +
>>  2 files changed, 108 insertions(+), 4 deletions(-)
>> ---
>> base-commit: 417c2d4ed67b729abea7dc73d7fb2153b7154d31
>
> I don't see this commit in -next, master, or qcom/, this series fails
> to apply atop next-20250225

Maybe I was a bit fast in sending this series, the 2 patches this
depends on have been merged into qcom tree yesterday, I've sent this
series based on latest linux-next + arm64-for-6.15 merged in.

https://web.git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/log/?h=
=3Darm64-for-6.15

Regards
Luca


>
> Konrad


