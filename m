Return-Path: <linux-arm-msm+bounces-49557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB52DA46AE1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 20:22:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A3DA16E544
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 19:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92889236A70;
	Wed, 26 Feb 2025 19:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h/gfgBbM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DE022E3F1;
	Wed, 26 Feb 2025 19:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740597741; cv=none; b=lf/jPoB6MODetwng56J1L+uy/hVNWKTog7HcPPHMNQYIl3/e9C2/FrYsUtOFAa6Q3n3Q22bMdtvsxW9ar60Ic0Rjta502CNWPJwef15IggRLD9yeZsSV8vfA16Zh6Hspf2g/Qa/49EtS+9rFFwnHd0FZ+v2QDJHgNW2SMOL9wow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740597741; c=relaxed/simple;
	bh=70HPt7cXIlQ+KkPTytAjDaBWtPrvl6+QqP5ouDBmFLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NJ/FvrV92SXuKRlDBp4JW/KVFWKzeKgBC0hTNdINNMzc+RH5ZqBj1beRZyl+b/FXYThP9ElJYurlwxkA8Tkv8tVDYI+j7229Gcz/2Rv3HvtIbmTSiuicg0P2UvK/2Uq7hzw8n8tZDhiZInvGRxKrYSf8n9Q0qL50TLfZ8lJLyUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h/gfgBbM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEA20C4CEE8;
	Wed, 26 Feb 2025 19:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740597740;
	bh=70HPt7cXIlQ+KkPTytAjDaBWtPrvl6+QqP5ouDBmFLo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h/gfgBbMNup3uDIk+icOzLt+LsY+Y44k8czZKXOueFZxvu3VjgCaT0LKGbx0NH4hM
	 95gfVq8fUKWCl49f+d+VYi0PzzX9vQZjCCygY8pnRa7krLyNP9B07mWtqrMY5benNh
	 REf55tk6hg8R0iGPKQM8nUAXOnK6AQBQKCpMKk7EO6Y7hP843P0Smpl289HbzUjzUM
	 E34XPLILwjLYkIbVPPyszQizUdn9qPSqZUcIMp65lrO+o2qomYIhFi8ovxT6fCOH9f
	 KjsPnoGEVu66EuTgGRpHGn4/DsYYO/NOl0arqfq3Cp/HA1R8liQJ9Qn0BLvuda0/tw
	 Pw1fkbci+l7ew==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e4c0c12bccso121263a12.1;
        Wed, 26 Feb 2025 11:22:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU73DmcGC+2Igambfpkz/QDf6UPCkz6xZGTjicmqH3z8Dkk8pw4bhBaZA5ZLkez04vgJpiQIEkRjYCr@vger.kernel.org, AJvYcCW4m8tYuDWahZcgU5k0S32E80gwYZMrFborUToxOHgHs2zZjwjRAu0ZTV3dviT+ltFHoJ6nuH/x8ZT19OXA4Q==@vger.kernel.org, AJvYcCXMaCN6eBYNJdmJ5uzfpdNyZedf+zi0hymqhgO0Aj6au2vtsd/9AzGCF6a4A2G1is+FlK6uOBzIdBRFlCzE@vger.kernel.org
X-Gm-Message-State: AOJu0YyW8hLD0LLBvxLtkMD0+Y78wuEfdV+yd1uP7ZTBlu//2kBnYmHX
	k5SGosM2G7K7P4ixd6v5Z2QRzbOx2znUdbd/aKfWbbfA/+FExay/3SbmfyGWK1Z5CnMkxkl5iUq
	y/0ZJz1ST19mJWDJyPG5bJa1O2A==
X-Google-Smtp-Source: AGHT+IE879zpQVonAD3+QX2VFbqk24PyMa64J5Q0ZFCMgA4E7ybBbhC+LwGrmURfNPkEUYddUs8POdQv17d4bNrYwl4=
X-Received: by 2002:a05:6402:518f:b0:5e0:51c0:701e with SMTP id
 4fb4d7f45d1cf-5e0b7254f98mr23443051a12.32.1740597739433; Wed, 26 Feb 2025
 11:22:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250226-qcom-nonroot-overlays-v1-0-26c6e7605833@trvn.ru> <20250226-qcom-nonroot-overlays-v1-1-26c6e7605833@trvn.ru>
In-Reply-To: <20250226-qcom-nonroot-overlays-v1-1-26c6e7605833@trvn.ru>
From: Rob Herring <robh@kernel.org>
Date: Wed, 26 Feb 2025 13:22:07 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJH5g-A0Td8zYn--FuYFZi=HQ96BeNSMLuxQU6+5X3k-w@mail.gmail.com>
X-Gm-Features: AQ5f1JqBSWKWscupDtx7XUeNsPytnMVaiTjrHhniqHbmTDtYseDb8YQVhIUWai0
Message-ID: <CAL_JsqJH5g-A0Td8zYn--FuYFZi=HQ96BeNSMLuxQU6+5X3k-w@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: qrb5165-rb5-vision-mezzanine: Fix
 broken overlay root
To: Nikita Travkin <nikita@trvn.ru>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 8:30=E2=80=AFAM Nikita Travkin <nikita@trvn.ru> wro=
te:
>
> When converting to the overlay format, it was missed that "/" in the
> overlay corresponds to the overlay's own root node and not the fragment
> targeted to update root of the base dts, which should be "&{/}" instead.
> This results in the cma node never actually being applied by libfdt.
>
> Fix the overlay to use correct target node.
>
> Fixes: 231c03c6119d ("arm64: dts: qcom: qrb5165-rb5-vision-mezzanine: Con=
vert mezzanine riser to dtbo")
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtso | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtso b=
/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtso
> index ae256c713a36078afdadc67193f381a19ea8e5d3..254df3d518d8cbfb1082511f3=
8e132435b7fdf59 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtso
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtso
> @@ -9,7 +9,7 @@
>  #include <dt-bindings/clock/qcom,camcc-sm8250.h>
>  #include <dt-bindings/gpio/gpio.h>
>
> -/ {
> +&{/} {
>         reserved-memory {

IMO, this should be applied to the /reserved-memory node rather than
the root node. Though I also think using overlays to set CMA size is
questionable. It's much easier to change the kernel command line than
apply an overlay.

>                 linux,cma {
>                         compatible =3D "shared-dma-pool";
>
> --
> 2.48.1
>

