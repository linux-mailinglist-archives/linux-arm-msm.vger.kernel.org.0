Return-Path: <linux-arm-msm+bounces-9764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD10984935B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Feb 2024 06:31:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3ED5E1F214EC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Feb 2024 05:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C7D2B671;
	Mon,  5 Feb 2024 05:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b="dX5TZh9e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A806CB667
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Feb 2024 05:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707111071; cv=none; b=F32MOOf/FBVa78CrBvdSZW6+3lDnZ1FcN8k69ywaHDqkqgWIDbhv3WsDhXoCNS8IPbTZzZf0N/DCuycWMjSo5LzBWG0CSBd8wLKiMg7O3w4U8Ak9s6n4nFpQ3IFb6EJnYEvAsH73mpjx2vOf4ZDwcZY4oBnYzZMVbsGBLNPzQyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707111071; c=relaxed/simple;
	bh=8dvg3kspNp0mB8pEf9n87ygvuTCSpQuz16yR20ablaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qr+zi3UeySra2go6WxQsZWIMqjSG+JpGuKVCv4f3mAZvwz2+bcw1iFU8sh6iSPFXrgjOU+mMumO1Mspt8a640cTXowbEj6cvyoOHkdbD5sW3mkEJVsX8gqo8vnw8oNUBKkCBhXtAJ8+8VfYpFy2B/rwAhmhPkD7/Y9JXlawl8wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org; spf=pass smtp.mailfrom=kali.org; dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b=dX5TZh9e; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kali.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5605c7b0ca2so682461a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Feb 2024 21:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1707111067; x=1707715867; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvTivQr7yMNzLTdZH8/6zPuEHJDF3llGK5yB7TgmFXs=;
        b=dX5TZh9endnz5X4Vmi42rhPjNpgNQNzqE5DyPw38VqQcfOlDNH7yDa88Ik0045XZez
         oKXcN0Mtu3fZpFTrs70VF1v3nltiXyVlfviygMzU1dQTkkB44E0e6MRQ+aBlR0Al8yCq
         0ye11L4LZhR2a8kCZloLcutMJCNO7Jq9qVK+sf2tvkXcWeQaUMfMYnM/W8PNUgIM7v52
         aPj8CXCLk5B4TBkpqCfZGO26BT2MLYhgTv9lwA9M5OQMT+KJTfzq0waWTMGnheamysiD
         uvyGip6M4bjbpdjIddlF3xBzP3ut/31AoyfAnyhwm/7Zr3UuOvQse9xnC2l3tZvoXa1D
         BvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707111067; x=1707715867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qvTivQr7yMNzLTdZH8/6zPuEHJDF3llGK5yB7TgmFXs=;
        b=nql5Pr6JMz5on74s6QxzYseap5FlnwmswvYbf+c8u33IvWUFLXjrvcNgnj3NIfXx09
         O76xuttM7OQ0FvxHIT1dd0YA1p+eYzvj7ny22/jnh2qzbWwFomc7IAFO0XjOh7o0EKSk
         YQIMofXKQ6O3uSre8tY63z+WyU7t9f/3Gcp8wTmp0BGxl5JNK8Gb9EDlanNfMeUMFud8
         o3nVVYabJFSye4g0latChwVxNQgCYNDAR0HAFOQ6DY08auTE3CdhC7mxHZxSPB7eRw3Q
         h9nRHESJtEmQC/vuWF0vWDmZOeVJCB9vqQYJIkla3yXfWa+jCmsUMVJPSk2ydLTj9X2T
         l9/Q==
X-Gm-Message-State: AOJu0YwAI2C4K9rNvuWLD5WGRPgbXHFu81GXghpWy4T9mxj6m481HzBe
	CzDS/faXhYfVoIcO62BUXdORK9ygZNkDuplvNvRbLgTYV3igPuMjwSOFrCbXAZXsPBdm4PLc6QC
	rz9AMjz0aRpROnnfobLXMoBJysfyfmDDmjbk9wg==
X-Google-Smtp-Source: AGHT+IHpSsbuM22ODC/FineIS1A+7QNo1EsBE6usAyuXcNL6M4/S2bquVhwbhRHk6Q4R/EBSTCYYCxIqBhlLa1zRUAE=
X-Received: by 2002:a05:6402:30b7:b0:560:5ace:2476 with SMTP id
 df23-20020a05640230b700b005605ace2476mr1496897edb.35.1707111066439; Sun, 04
 Feb 2024 21:31:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125154531.417098-1-krzysztof.kozlowski@linaro.org>
 <c34dd7ca-01b5-4424-a8ec-a525b8d722a3@linaro.org> <5497d428-cdc1-4057-afda-6861d2e3860a@linaro.org>
 <e9b6f790-831c-4df6-b16c-8d7a2f8ddc26@linaro.org>
In-Reply-To: <e9b6f790-831c-4df6-b16c-8d7a2f8ddc26@linaro.org>
From: Steev Klimaszewski <steev@kali.org>
Date: Sun, 4 Feb 2024 23:30:54 -0600
Message-ID: <CAKXuJqjDM3P4wOKz3CaAB9DUyemqQ6ks=FPnfL7OsHnnyoyn=A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-x13s: correct analogue
 microphone route
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2024 at 8:27=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 26/01/2024 14:22, Krzysztof Kozlowski wrote:
> > On 26/01/2024 14:21, Srinivas Kandagatla wrote:
> >> Thanks Krzystof,
> >>
> >> On 25/01/2024 15:45, Krzysztof Kozlowski wrote:
> >>> Starting with Qualcomm SM8350 SoC, so Low Power Audio SubSystem (LPAS=
S)
> >>> block version v9.2, the register responsible for TX SMIC MUXn muxes i=
s
> >>> different.  The LPASS TX macro codec driver is being fixed to handle
> >>> that difference, so the DTS must be updated as well for new widget na=
me.
> >>>
> >>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>>
> >>> ---
> >>>
> >> Unfortunately this is breaking mic on X13s.
> >
> > This alone? Of course, there is dependency... Or you meant something el=
se?
>
> There was no further comments on my proposal to skip touching sc8280xp:
> https://lore.kernel.org/alsa-devel/20240125153110.410295-1-krzysztof.kozl=
owski@linaro.org/T/#mc45e487f25a2d6388b5c478b1b7827b113640f4f
>
> so I will go with that approach. Please ignore this DTS patch. I will
> send ASoC changes which won't affect sc8280xp.
>
> Best regards,
> Krzysztof
>
>
I somehow missed that patchset or conversation; As an owner of an
X13s, which is sc8280xp, I can say, neither pre-dts patch, nor post,
seem to do much good.  When I attempt to do a voice chat in armcord,
the responses I get to how I sound when using the mic on the X13s
itself range from "You sound like hot trash" to "You sound like a
robot with hiccups".

-- steev

