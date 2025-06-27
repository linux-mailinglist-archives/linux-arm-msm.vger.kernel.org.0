Return-Path: <linux-arm-msm+bounces-62809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC40FAEBA66
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 16:51:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02E453A321E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 14:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5349F2E889C;
	Fri, 27 Jun 2025 14:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="qLrUkMA9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865632D97A8
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 14:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751035870; cv=none; b=qsXdvLLSEXBGOtbRtqNH8xuQSUIo30T/4yzuNEtrIPpCXxbFnswYlBJiRE1gFqZP0z4lI1Tu7IFanKnNJKXwtw45TdmAgc1PJNvBooIaOm73fGv2gloP92fRlT4ajxw+GTsauXCAAdR4u/mcRzZ3TPH1n1Uo71iX463NrvZS4KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751035870; c=relaxed/simple;
	bh=UyBKwHH+NCfy2Fp8odnA/Wo1t4O71TtPU0o1rWMp+Dk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=YCKeKMXEoAxPmGXb15q/GTRDiREzHzJEo6NIxnq7XDSq/z5ur+Lem2K1VmRkZw3K85OjqIggpvcwMeC1ILP6siG9F38aNY/w9o5iRXjsHDQ8gyBpz/aIlQ5Rb4FG2Fp8H1G40WfhgO6DJ9iB0gPn2lK95rtzis8OPcwiyqdEaRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=qLrUkMA9; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-60c79bedc19so2796165a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 07:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751035867; x=1751640667; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pfsIeC1q9ILkZM7mTk4qTsHzqgjpNmZpZamVAmWOEoU=;
        b=qLrUkMA9b/IsKV7EW0iX5EhQdsu6TvWvqUf/AiBPiG5MsX4HiwyZ1P2LqIcMBPw2VO
         Jb0qVqBdaey19aCwlVD7/DyU+s+Gir+rHsvH+3Kms0+7c6w0u8EW4+9ak2uwNkFyv6kO
         cr4IB/H6RYx1I9XQPu7yt4GlowRrLWEeMbb1tJ5a/KmmjXRhJkQ52HwP4RNxVAdNkgut
         GEzD7LLJ2J+OJEkoCipTOabnyfqrPenXYdrYkVMr5t1E8Puw3p790Se9znPsYQvyADU1
         k0q8SshVxa4+rXaDaTf8XqxxDhVYHavrB8chfie78lj8Y/6zZ0o2L6UlZpXctch/R6Av
         SvHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751035867; x=1751640667;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pfsIeC1q9ILkZM7mTk4qTsHzqgjpNmZpZamVAmWOEoU=;
        b=n7NzIFRJB7bmS1J5RQVFENjZnMGy/NIS+jcwmddAJRlhRg1Azh+DInEF0fdqedLKHg
         umHLZYyTo3W7vCBqfv9iVcwdLxa43UV2EfRguGoZUCS1cVpYr6O4F56HRK8P0tsReLmA
         Ubu/qi3i/oopLBpbTWuFTyKTfUNJe2DE8+CvYjnVo2zWhaUbBUqABpdkT5h8itKkD4it
         IhabKD2chGOxCPANwhXXlztTOR4mLN4hdgMZ8VepKvq+CF/dwpQPqrV0Z1XJm4/AogKk
         ohAm3pxp6pXAQgAC1SZhv9RONgKHWG185AYe2m/K0jpX55Rz6cSM263cJlehEP67jMy2
         Xg7A==
X-Forwarded-Encrypted: i=1; AJvYcCV7rtVDR1v4lSQu4EJF3ZLcLyVX5NCuLnWymoG0efXKHMQnleTDnfP7gx9Lh8k1+OK5Gl3pnwv4dPuUOiaY@vger.kernel.org
X-Gm-Message-State: AOJu0YzDR2d3E4ZZ/TQC/2AUncif2V/L+0+m2AG7LxZwojkNcf2MXXWw
	185txhRA1u+o+KZstkSwbKle2fzXxEhAQZVNsZxlNSB/3uSFHUiD9hLhMabwvbRpIS8=
X-Gm-Gg: ASbGncslHQqH3VxSH472T66C/pWUj53fKoeVwecC0YyZHrW6xAeAhRinzH3Ko7gTBFZ
	vUAFDUaLvOzvKr7vGT2D5oVoKdiA8St7UhbKlXKUvIHaHFrcjHX8hO1I3OPcc+59tvONFAzJkNa
	LxHHue9yFcOWSOou9fmp3ZaBA68qFybyqu8I+bWIB8LwVwwIenub0bVydflkWMO06I6mjNmzvzH
	viUaVCSLh/FWlZO7nMcPrlp9SnbqNs13HyU+R5SOTqAv32RuotSHtR8IrmWBFH+9ZIOujSIPJEY
	/r4TesJqpuS38qXtsH57jxRPpBWrFgZVQnmHUNsnGP5WRulTNBJPqxrC+aBF5K6pJAg7qtadfnM
	NKVqe9gH4BCSz7uO97ilYtiVxzKqvJx4=
X-Google-Smtp-Source: AGHT+IEAV8Vw8kRnlbsTGuoP/oTwShQDEtpR4bSBf4ykT0TKkhmZMTVPe2BEFKyGiSf57dSvw0Wy8A==
X-Received: by 2002:a17:907:9407:b0:ada:abf7:d0e1 with SMTP id a640c23a62f3a-ae3500bf35dmr329595866b.37.1751035866592;
        Fri, 27 Jun 2025 07:51:06 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c0138bsm134123766b.85.2025.06.27.07.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 07:51:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Jun 2025 16:51:05 +0200
Message-Id: <DAXEERR0W25W.18J9UZ353AL09@fairphone.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280.dtsi: prevent garbage on
 serial port
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Casey Connolly" <casey.connolly@linaro.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Rob Herring" <robh@kernel.org>,
 <cros-qcom-dts-watchers@chromium.org>
Cc: "Stephan Gerhold" <stephan.gerhold@linaro.org>,
 <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250626132333.351351-1-casey.connolly@linaro.org>
In-Reply-To: <20250626132333.351351-1-casey.connolly@linaro.org>

Hi Casey,

On Thu Jun 26, 2025 at 3:23 PM CEST, Casey Connolly wrote:
> During early boot phases there can be garbage characters on the serial
> RX port unless it is configured as pull-up. Add the pull-up bias and
> mark the rx/tx pinconfs as being necessary for all boot phases.

Update the subject to remove ".dtsi"?

arm64: dts: qcom: sc7280: prevent garbage on serial port

Regards
Luca

>
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/q=
com/sc7280.dtsi
> index 64a2abd30100..60e4a311405a 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -5742,13 +5742,16 @@ qup_uart4_rx: qup-uart4-rx-state {
> =20
>  			qup_uart5_tx: qup-uart5-tx-state {
>  				pins =3D "gpio22";
>  				function =3D "qup05";
> +				bootph-all;
>  			};
> =20
>  			qup_uart5_rx: qup-uart5-rx-state {
>  				pins =3D "gpio23";
>  				function =3D "qup05";
> +				bootph-all;
> +				bias-pull-up;
>  			};
> =20
>  			qup_uart6_cts: qup-uart6-cts-state {
>  				pins =3D "gpio24";


