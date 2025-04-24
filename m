Return-Path: <linux-arm-msm+bounces-55451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB24A9B2A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 17:42:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A036E3B2C23
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 15:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA3A22AE48;
	Thu, 24 Apr 2025 15:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1TgEdEU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E221A83F2;
	Thu, 24 Apr 2025 15:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745509338; cv=none; b=e4o6yL8Tna3qszPLVvikaia46qjQxLsQgNF+BPfwgvvLC4sa6iWaoAYc6/XAg2T3U5YQA46n1C7t9DXKwhHxWbmHmaJHSxnR6C11aTEV6q12t91ztjho0a8w+Vgdmu8Mi6zu1dqtWdJF3ZIL67rZ2yo1UdwbsB5Q2obkOXCkvN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745509338; c=relaxed/simple;
	bh=sLVR2iNTppTXQAcRCut30/mVZ0nbrm/5ErrJOq+YYrg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=StJsrd0DvrILUEg+r0EzZHCUp8PSk2J1gVinPh8LrKDrsrLajPnjsJc44dBmBIk+cIbWWlf5GYSuTvZnhX0/So+XDB2kJSCprzbMVsgVijGX8mK7H8+9TRrOjHX7fX3JEHkbsVdMsIuOHp2X0wh8Tw1pF2jKFpIM7sMf3eKM/rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1TgEdEU; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3d5e2606a1bso10347985ab.0;
        Thu, 24 Apr 2025 08:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745509336; x=1746114136; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/YWH17tBU0hJdHuLADhEdHN+B0EoB0cdNxUFZ1kvvcQ=;
        b=A1TgEdEU4PKG2akSHsG967R6GxfD7DLwqr2d1LijF3S/bXePGbAv0KivhlJQPpn+wI
         8EgrJ5qBfRMnbLZoDXlXhzj+6Poq+sQyqjKTEoyuaf7VxTE5TeOk6jGG1SWgrfwbCozZ
         CWF6fcKeOyMK/NXdq1N35A2z3tlAYKUV4dAtBlmqfc4IKQSAk5wT+wJTu3x3TD8McWFo
         2gMqzeNLWHtYKm07zA//IS5wMUgwY6UMg9v42l3dJo5riC41Kvs+qja5iAkG5D22I5pp
         tOcodjR0tQClL+JhCwgYvYxkoLKRVWwE5Lcsw4ZNu1YtePdyY+tGDEmhnRfqFAJbJi/O
         h5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745509336; x=1746114136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/YWH17tBU0hJdHuLADhEdHN+B0EoB0cdNxUFZ1kvvcQ=;
        b=rwzN0Hd2v52YCY9PIM4q6RsJ89GpDFMp3bzcP0zE2SB4D7sKdXaccj9QvLI0PLlkOJ
         F7N7GO/ZlnmgVhmEnIVkEDIq+RT9gZcnbsPHGkkNUjqQ9xJXMVeP2pHqWLjn8cfUgNwJ
         SAL0S6rUgOLgXTM0ARuGe5G/F13RUepNC85rw1dDZQh3wUuBLdGpH9s9+0ZiCMaTuaFo
         9hYw5+3AHgWOwppsxyMjR1oqSX15aArTjHpdH2FgWeayX2eRT8Z/msoyS1ju/+Ywn64G
         EVjL3axLl3K7HWrStrf2E8ZRd7MkMWpB2ctD/WMSH7KRuE60kQUiiKYasiBH2jYe/7tD
         ie8A==
X-Forwarded-Encrypted: i=1; AJvYcCWUnrt1+v7zVIJ1KHCvi+prBNg0Uoxupjam+7yVwQr2z/EVt9nuLBe7fPUhriiy+2Q/ZrVqJT3z86Vk2IfE@vger.kernel.org, AJvYcCX5NTQ0XIK/v90ZL2b/jh6NHejQTNVXgwNinKypBmdeV+bjC5HMKvsTPe8ruGLg8m+MA5Trwr3Us2Tr@vger.kernel.org, AJvYcCX6xsjkcatPCzp4d7FXIYSBwFreedGlcKyNWKKqHj7g9ZMKpkltILdeyyCknY8rLFa7L9QoRlNdAt9GdOlhqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg4lKrEqRey6xGJczk4n938a0YvcGYLQKvKEt3d6e9U5Lmu9Ek
	tncCdcGw+fY+gdBoyS1jy3cHm0Omvj/pRITKgXTDn63NxH4hCR8RTHF39fnbsPsI9VpJ75i3a2u
	6+WViZqmvAkcVdbYWcgiM77g0wxfoHOwJ
X-Gm-Gg: ASbGncsyeWzQnKcHRHBHtSvOc+0b3lesZvePPYK2y/LZVLyBe6JkxQ61W4EFWr7R8Mw
	pZVqzraQz4nMX8fRL4/v+NmDcA/3CxHZ47LC4n590HV5dw6h9tPlRR4rZKynbJEi/6Frmmp0Faa
	3kCCC3LPmMS+qXwFcBh9d6U79CFK30nkzd5H2RSh4oTQ1bvolxcvYd
X-Google-Smtp-Source: AGHT+IG//TvIiBwR814LEOdGMsYg62yMowfdDQKkUsInaSLAimfnnU6oR4fkx8PxDwvcwqNF6s6pr8e1CvFCG9kfKvc=
X-Received: by 2002:a92:ca4d:0:b0:3d0:4bce:cfa8 with SMTP id
 e9e14a558f8ab-3d93039f9f5mr36729035ab.3.1745509336209; Thu, 24 Apr 2025
 08:42:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424-qcom-linux-arm64-for-6-16-dell-inspiron14p-v1-0-ace76b31d024@linaro.org>
In-Reply-To: <20250424-qcom-linux-arm64-for-6-16-dell-inspiron14p-v1-0-ace76b31d024@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 24 Apr 2025 08:42:04 -0700
X-Gm-Features: ATxdqUH_eYyg3YB1_GN1gfP026C6_NNRbD5zcWSVfnW6kJxapeHfxVaEblg1ZeY
Message-ID: <CAF6AEGtiMLQ6xWrmbkmdkpb7gsdbkXaFw7V84nXDDWtLA=4f9A@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add x1e Dell Inpsiron 14p
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 4:53=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Add in a dtsi for the Dell Inspiron 14p.
>
> I'm currently using this as a daily driver including sending this series
> from. Its reasonably stable on 6.15-rcX.
>
> The first two patches can be applied without dependency, the final patch
> relies on patches staged for -next in the media tree to be applied,
> presently.
>
> https://gitlab.freedesktop.org/linux-media/media-committers/-/commit/2ab7=
f87a7f4bf392e3836a2600f115a1baa1415c
> https://lore.kernel.org/linux-media/20250407-b4-media-comitters-next-25-0=
3-13-ov02e10-v4-0-211e3e6fae90@linaro.org/
>
> Working for me included in this series:
>
> - USB
>   Both Type-C USB ports
>   Type-A port
>   Fingerprint reader
> - WiFi
> - Bluetooth
> - RGB Camera
> - Toucpad, keyboard
> - Display
>
> Working for me but not included:
> - Audio jack
> - Iris
>
> Not working:
> - Speaker output
>   Still WiP haven't touched this in a while
>
> - Battery
>   Dell has its own Embedded Controller likely from the x86 platform reuse=
d
>   on Qcom which we need to reverse engineer or get some information on to
>   make faster progress on.
>
> - cDSP
>   Haven't tried to bring this up.
>
> - EVA
>   No driver haven't tried it.
>
> - Bugs
>   Occasionally when resuming I get a fencing error with hyperlock and
>   freedreno, TBH it looks like something in the GPU or SMMU according to
>   Rob Clark: https://pastebin.com/AWjCyaap

Did you have the same issues on v6.14 or earlier?

The smmu pm usage count underflow is concerning, the smmu pm should be
tied to the GPU device via device_link_add().  I've never seen
something similar, but I'm still on v6.14.

Could you try reverting commit 0a679336dc17 ("iommu/arm-smmu: Set rpm
auto_suspend once during probe")

BR,
-R

>
>   Ath12k has been splatting for me up to 6.14 when removing a SSID.
>   I switched on ath12k debug when going to 6.15 and predictably couldn't
>   reproduce the bug, either because the timings have changed as a result
>   of Heisenbugging or because a fix has been slipped into ath12k.
>
>   Other than those two I'm pretty happy with this system.
>
>   The DTS is based on Aleksandrs Vinarskis XPS, Lenovo T14s and Qcom CRD.
>
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
> Bryan O'Donoghue (3):
>       dt-bindings: arm: qcom: Add Dell Inspiron 14 Plus 7441
>       arm64: dts: qcom: Add support for X1E80100 Dell Inspirion 14 Plus 7=
441
>       arm64: dts: qcom: x1e80100-dell-inspiron14-7441: Switch on CAMSS RG=
B sensor
>
>  Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
>  arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>  .../qcom/x1e80100-dell-inspirion-14-plus-7441.dts  | 1490 ++++++++++++++=
++++++
>  3 files changed, 1492 insertions(+)
> ---
> base-commit: f7570505263aff2b63142f0d68fa607cd60eb060
> change-id: 20250417-qcom-linux-arm64-for-6-16-dell-inspiron14p-ed68cd65eb=
ad
>
> Best regards,
> --
> Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
>

