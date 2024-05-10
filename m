Return-Path: <linux-arm-msm+bounces-19713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDC48C29B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 20:08:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E62D1F21828
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 18:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D7B2030A;
	Fri, 10 May 2024 18:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b="BnzsbmRW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CE218EA2
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 18:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715364491; cv=none; b=HxidmxitWdvlsFET+R9xkJYkIzBnbJhlZs3qwUSc0nHh+tjc7Z7RUdSSdm8jJnO98D46K3RvIKh4B3qqpMuFd9qnYuZ41vlAMtuav4RQBnQv0kPaD67uWEIVBcnDlJayron3n1tKu9D93FKvmsOdxDiAztwIx9FPqd8GdSzkTgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715364491; c=relaxed/simple;
	bh=TjfPV346g6HhhGBYNszs7914+sCUoduSH0CSumq3VbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dWxuOat6IirhwEfoNcLdtZ1ey5rlwAnPZ6Xn/xnVRbJoiMZUFFGOi9jFfVxZ/TJaxuNJSiSNZY7uZoDGzOBu+cF+WL63MUEsMxjMNa57iSFUJEg4M/79alsixOpjRO2Ou1uZqvt8ZC+HQYJwGwcD9etJ5IIjiXVhS2skeUQn0+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org; spf=pass smtp.mailfrom=kali.org; dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b=BnzsbmRW; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kali.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a4702457ccbso602222666b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 11:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1715364488; x=1715969288; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=92ZX8NnKazriVubJgAKcioLM/4xHP1npqFQLgQaFNHI=;
        b=BnzsbmRWbTpleBEi36Z6qPSe4hpM4c8zRhhr1suPCeNSuW4pOWB5Pj0RdLwfN98T2D
         iqymDjywBBEo65FtcudG8G4VEk/GF1gQ48nc/WQ+uvDtwb0cfRCvGHw8alKXDqaq+/B2
         OuaDLb2SUiZkDHX0dPNQydBru1ZJaNjvkbg8pJXngN9IJmYmMZW/BSQe6I+eNLB36Mb4
         sQBZj5V0Jbr3tn6D8POiscUwVsKhERCDmaH5O1MpskACpzs4MI84KVTarJRKcHVkVCiU
         XYzJ7bQpnccTRiofrPzjWHehbjAgW9BAbdCeGTLxEUbZpfAMnMv6q1X6c1L0XsRMc8FW
         sQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715364488; x=1715969288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=92ZX8NnKazriVubJgAKcioLM/4xHP1npqFQLgQaFNHI=;
        b=EIM3Vt/+yylI61iGTFjUrw7/yiQseJQmRkcql+zUo3gDTvoDpS40RUqWuL6pGEotne
         MZd5bxy9jef3u/yz+P/nEiUXmawxtbto2YWcKnDCWzravVh72zG7PDiLkIg5gaWPt3b7
         D2suP/N/eW15rd7lae6hkEgHC3Ppn8L4Xo1OPz853CYG6z+a/ksbSk5lQabmY7jTQdiP
         eBv3VMYn6nyrgWFl64GZ0FdP9VnaSw6tONi+l2xPqxlg6uM3LaXJ9HVRl72SpjV9ABV7
         5kCGiVYlPkILopxn+q849nmSJxL/YdXy+PNYAeZDXolU7wQOf51ebvAGw+6vUZNsthSi
         7a5A==
X-Forwarded-Encrypted: i=1; AJvYcCWk85yO+T+gXSaC3AuQCH8lIHhjvlLsYpM1SmNDXpjNgebvRx2bxySFRKWY6EZaeGLI2cHkbuQerhy4Ubb5HUVuU4J4leUINhfGO8bB2Q==
X-Gm-Message-State: AOJu0Yx71gcSDxw0us6umsTosVObDiUL6l943LJ5v/hUy3gc62z+3A8w
	av7desONycaGHD5co6pXaynghG3hW74tKJDL0Um1L30x3KZqu/lvbf4/EHVDoYBp8llg3HoPoNL
	PrSOHzV7EYkFGYPNs0RYPYnf4X/RCbjCaR4QBfw==
X-Google-Smtp-Source: AGHT+IEne6Tq/Vy41gsgsCpOQFLCZz1zGK8d8KflwozbCn6EK3PJH6kXr6qcuJTWIC2Y2Aury8Ixi48ihXvvJZ5ElME=
X-Received: by 2002:a50:bb0e:0:b0:572:df77:c1bf with SMTP id
 4fb4d7f45d1cf-5734d5974f2mr2413770a12.3.1715364488094; Fri, 10 May 2024
 11:08:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240510-topic-8280_off-v1-1-bcc70cda449e@linaro.org>
In-Reply-To: <20240510-topic-8280_off-v1-1-bcc70cda449e@linaro.org>
From: Steev Klimaszewski <steev@kali.org>
Date: Fri, 10 May 2024 13:07:55 -0500
Message-ID: <CAKXuJqiHq2JXtmHawyEyporhaOUKefaRC-aV++-1=uQk8afNkQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Set status = "reserved" on PSHOLD
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Johan Hovold <johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Konrad,

On Fri, May 10, 2024 at 8:40=E2=80=AFAM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
> On most devices, TZ seems to be blocking access to the PSHOLD reboot
> register. This seems to be TZ, as even kicking the hypervisor doesn't
> seem to make it writable.
>
> Fixes: 865ff2e6f5da ("arm64: dts: qcom: sc8280xp: Add PS_HOLD restart")
> Reported-by: Steev Klimaszewski <steev@kali.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts=
/qcom/sc8280xp.dtsi
> index 0549ba1fbeea..59f0a850671a 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -4623,6 +4623,8 @@ tsens0: thermal-sensor@c263000 {
>                 restart@c264000 {
>                         compatible =3D "qcom,pshold";
>                         reg =3D <0 0x0c264000 0 0x4>;
> +                       /* TZ seems to block access */
> +                       status =3D "reserved";
>                 };
>
>                 tsens1: thermal-sensor@c265000 {
>
> ---
> base-commit: 704ba27ac55579704ba1289392448b0c66b56258
> change-id: 20240510-topic-8280_off-11539fc57f98
>
> Best regards,
> --
> Konrad Dybcio <konrad.dybcio@linaro.org>
>
Tested on my X13s here and confirmed it does what it says on the tin now :)
Tested-by: Steev Klimaszewski <steev@kali.org>

