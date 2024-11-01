Return-Path: <linux-arm-msm+bounces-36738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 600419B912A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 13:34:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83CE41C20EEA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 12:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C42D019C54E;
	Fri,  1 Nov 2024 12:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kEF+sB1a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43CF194ACC;
	Fri,  1 Nov 2024 12:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730464439; cv=none; b=tekSU6BrrV6P/5p2xSfXScHELZGN80dbYgp/134djE/tAA44RDgUNaFmmtBBMuFdn0yPkuDMyo3OE7cyN+81jovlJkwYrrdu+RqeiTr3kEwPYULEc469CB6UMV4TdEG7LZVdQpfeydITrTgzoAEAyV1bGFqClFdW3QoUt3dQ2yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730464439; c=relaxed/simple;
	bh=NLZgXQly6/JBYeaoMI2Gj4UqVeX9adEe2V/e7lQ8X5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z8I/FzOatnBrS5Aw6WGR77Uhv+Rw0Lnsn2mFOED0bx/zWCDZh8wuPewUxZa2fa3tJ9KbUz2d5Ylf9VqoPzDvYqEvgBxbiOocnBGx8QEq2HmS0gy4aWDvUZSPXrC35AuMGxOPiCjX7wjUn1lzHeT/lcmII9tgqLVrQ3wzrYymcfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kEF+sB1a; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3a5075ed279so7628925ab.0;
        Fri, 01 Nov 2024 05:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730464437; x=1731069237; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=luTIfl8fjfaYqdOzb0XicGQ8fkkc3h4j7fSA6fwqKtI=;
        b=kEF+sB1a4/r9IryvNFDlcF30DzX0h5gQ6Z9wjcKhbFOJY1YO/UwPVE1ztABM/reY1I
         W7n9xtNrETydxZxZhiM+ahWgRZhGrc4By6bqU0Hm3+zcJhmjQtRytkwLU9x3eC2N4Fb0
         fi2GnibXNLGLLPYKXO/vracNhfxceK1o05CfeqCIJfVyo5heEQLLBH9MFuMFFmHExgRj
         jQWWvoKOKZPzwtemwiqv5gSME39hUvN2flIr5iuZdFvAVnqya+g5HH5kT98dmTUIzdVq
         KZMo7Jt7Kk9knxJF1AOTZeOzARZN8FewQzIljnGoBljSE7IkAZU9IDxxRCT9Bh8aK7kj
         1B3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730464437; x=1731069237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=luTIfl8fjfaYqdOzb0XicGQ8fkkc3h4j7fSA6fwqKtI=;
        b=xPGfXkfOV08Ft/uizmT3F2tEEDnsqULsoa/2dRN6PQiwUdcomx62jPTcH8YKcJrXZz
         gZMg4Zls6h+35yYswuid+l3+MhuZOc42cZt8/5otylR8cyeZ8D1AbKfR42Hz920r/BJx
         sZY7EV5YLeSHd/vWaqX4qrOquxpRSunjb1Hqdpzaz3SXf85zG6Gl8BXuopF9PZgLvYcA
         ypx84isEwlgljXAOjk4G55XcKqJv6EjXOUQwZoI4kVXqnnJ+U8fQtVmFlMg3Cz1mB4Pu
         51DYHqzqlEmoK4iYWz5sQrOBbW5sAWkfC5JdwDZkaQYQq+pMzsp8U2xa3CGQyXYVfW7Q
         PJbA==
X-Forwarded-Encrypted: i=1; AJvYcCUTdtddbld5udZRSRHnVNt2x1gPbpc7vbhsxIArhgJ3cvkLEgZQd64lvs1Rl1/h3Js8rML968wCshN5@vger.kernel.org, AJvYcCUhQCHNXD01RgEMVTcpaBD3BDCKq2VA9BIn2hJyd0p+pyQz0rmbnJypo2VVxIvcaD6kFZzS3tRNic9c1JmN@vger.kernel.org, AJvYcCWuqsgmzFoU1C5dvzUjln1uciX4SlhW99t01vX91lZHXiKRpzhGMHHQOyiwv8K+h9OzWBHJ/smWO3gSIuFEXw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzj3UuEYv4g2SHiDsRlUWjRErHNl9HF+CBiA3jZ0XxEE3tGSai
	kEVUoiefWAWZ7nRSOzo3pFb2uvitsOy4YCGizHq9QBfAZXk5y3FSTPdzJ45EqaVtn3rIvhL+b7u
	SjAhAMT5lOxHz1stS5vetIxAtXPg=
X-Google-Smtp-Source: AGHT+IHROmGFY4O7d8AzmJAHmAMWlbgwtTWlJERIniDbvCooTOD9qLFdaEGNBi0WQhCjbz4p3oj41XFMGb3QjjueJBk=
X-Received: by 2002:a05:6e02:1e07:b0:3a4:e9b3:22ad with SMTP id
 e9e14a558f8ab-3a602f7fbabmr77904845ab.0.1730464436782; Fri, 01 Nov 2024
 05:33:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241025-b4-linux-next-24-10-25-camss-dts-fixups-v1-0-cdff2f1a5792@linaro.org>
 <20241025-b4-linux-next-24-10-25-camss-dts-fixups-v1-6-cdff2f1a5792@linaro.org>
In-Reply-To: <20241025-b4-linux-next-24-10-25-camss-dts-fixups-v1-6-cdff2f1a5792@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 1 Nov 2024 05:33:44 -0700
Message-ID: <CAF6AEGu_qJYV3TnprJsqsWV_GoLhiBFQ8LNwfYDjczDparvZCA@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sdm845-db845c-navigation-mezzanine:
 Add cma heap for libcamera softisp support
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Depeng Shao <quic_depengs@quicinc.com>, Vikram Sharma <quic_vikramsa@quicinc.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 8:49=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> libcamera softisp requires a linux,cma heap export in order to support
> user-space debayering, 3a and export to other system components such as
> pipewire, Firefox/Chromium - Hangouts, Zoom etc.

AFAIU libcamera could use udmabuf, etc, and there is no hw requirement
for CMA.  So it doesn't seem we should be adding this to dt.  And I'd
really prefer that we not be using CMA just for lolz.

BR,
-R

> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso     | 11 +++++=
++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.=
dtso b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
> index d62a20f018e7a7e1c7e77f0c927c2d9fe7ae8509..c8507afcd1e0d1f9b14b6e4ed=
cbc646032e7b6c9 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
> @@ -9,6 +9,17 @@
>  #include <dt-bindings/clock/qcom,camcc-sdm845.h>
>  #include <dt-bindings/gpio/gpio.h>
>
> +/ {
> +       reserved-memory {
> +               linux,cma {
> +                       compatible =3D "shared-dma-pool";
> +                       size =3D <0x0 0x8000000>;
> +                       reusable;
> +                       linux,cma-default;
> +               };
> +       };
> +};
> +
>  &camss {
>         vdda-phy-supply =3D <&vreg_l1a_0p875>;
>         vdda-pll-supply =3D <&vreg_l26a_1p2>;
>
> --
> 2.47.0
>
>

