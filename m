Return-Path: <linux-arm-msm+bounces-49085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D34A41273
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 01:19:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C71B3ABB1F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 00:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7D3DF60;
	Mon, 24 Feb 2025 00:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rxogge4k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204D38F54
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 00:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740356342; cv=none; b=XmE3IfJwvOdqPNnromyvfI1GGnnnF1LNEGgS3xAP9UmCEwpzb4+6GNvDKjxX/y8vuco/VmMulePzrufFKl/tKpkJTKkKMn/AjgBUHe166kHfSsKwVjHzwcnerieWGp5JD1QA7BhL5JcBIyN+2cYYQxc7QXse1d/1HpxMR61dRko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740356342; c=relaxed/simple;
	bh=7Jy7dLx7zO3ZkOOyvfUI0Qww8vOfT8OV2kKdICBqy9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YofSJHEML6IDpB2xfujwNpNylAJ8TXAxzqDgQxTjqBlM/J8uf5BzA1MQiL29qCLAcX+52FR2X7ylrDYHaBKVLu2fdVsZyk8gDWTb4y9mfVyUar5sgpE2k1Y/Fq9qJrRvnbR5ZFLoqySYQRX0a3hRuDRD6RTgIZukZAq4o3/baGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rxogge4k; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30738a717ffso29515921fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Feb 2025 16:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740356339; x=1740961139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KGo606DZMNR3CPOmAAdH29sE1yGH7gxkKNN2u18HmZw=;
        b=rxogge4k0F1EP+QODG0E+y6/Qq8Vo9PVYQgUJEDysKAxTIepMkh3DZtSzYNtJfbU+y
         Kd5VqnXIB3S8xAqPSUc+dwUkjshaltdnT+kV6D2XOdkzV+aKqkmSIEU/8Zhd3ol53lJS
         cxoENrK2HHhL9azEZAcpllSEiG22CUYGpfS6CLlpLNAi854eQglGZQ/W4eHpelFnYHoi
         iHH7XP1ZP17Aypb58HxV3uUo5Yjv0nkDsifu6SqDUJW9J3A+R8y4Y02MfnvcZXjRQLJb
         HScTvIzlryx8kCjBeFPJFtqaqGjO4ZO5bLWLXmxXi/LXnjsMgOM5E7gGzhe1LocDX9On
         mRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740356339; x=1740961139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGo606DZMNR3CPOmAAdH29sE1yGH7gxkKNN2u18HmZw=;
        b=F4CXNgxs3PPZDTJFxHeIgzZjSWV8Fydi39932UgfPLq9gMD68lPlFz8LJddcNRbD/F
         3MEOBQjRezwlkhmOIVRlsvHSohq1333HoosYmHWZIPmX99HSAtMY4zkY1l6/Pw/g3m9F
         1gK3fbfYkUsuKzmILg26Ym6Kb5N/DH/3JuVUfpWntmqoOgAgqh9BjyxecXOGy3kEGVmI
         eVepm3AWi5jVV/UPwyfq2Mc1hgisaRFG0tRgpOKWZOuZ5YTFNEaOMfPEkBDH1wjdQ5+M
         PfAZB+fpv0KZy3WXFt3+Sj+yu4DPcGEG3bGVjoJ32j+yhMWzJ63wKGY2DSfd6xfwxQzd
         3+Dw==
X-Forwarded-Encrypted: i=1; AJvYcCX4rBlOw33qBiYX+/RCRhwu5+XyjJ2z3QJ/NqH+VMMG9ro4i4wHaliWx+l7aj217OzrO6N7mKORsu8m3nsA@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ6DeP4WzpIbd8ITtvX/IfRmEMHqTdnEisWrFSuMD2/Hz6O5OE
	56eA/fzUMvMhWM/sPki+66444FyCdgk/pOR4XzGMuhvrSAvfTYrkhlT0F7131Jc=
X-Gm-Gg: ASbGncsp/ItAH6v8bJLoni931jcAeFGRf/4z9M5Rka+HTsrOV1fyx2Sv3WEFj2uSMaK
	A6gQ1Dh+EijoNUarXG5Jnh1Qy2DFgxDfaaCoANwhIVjIsCnylzg2XgAqDfh2S2IPXaDSnK5N5Z0
	kuqRp8hFzUWqBk7hKjBa+wSlz2EH3per6MGWW1rwz5xhHArjf00CZ3Kt/KAmD5O+b3WvI4lNY7h
	UfWD45n2gAZpfiD/2ojSbal1Kp2YwzR/vYwbrQs1a2+hpWu84CUd4Q/slV29PQdNTxUdOTF9RQ0
	Tzurh5TDn6z7AoYGWEP766Nuytrmg3CII3qCP481OoIfuqTjU3N4SDh5i6jyRFCyS9gtIv8hpMk
	KsYMOSw==
X-Google-Smtp-Source: AGHT+IHh5wVjH6EUlxs4+YZZSHGEjFF9k8cOMxZNtJaJAuOd8RU4IAkF2m0DIXqEyGl4vlUyI3tWrg==
X-Received: by 2002:a05:6512:280b:b0:545:bb6:8e41 with SMTP id 2adb3069b0e04-54838f5b913mr4097064e87.52.1740356339157;
        Sun, 23 Feb 2025 16:18:59 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f10cc28sm3301582e87.201.2025.02.23.16.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 16:18:57 -0800 (PST)
Date: Mon, 24 Feb 2025 02:18:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sdm632-fairphone-fp3: Enable modem
Message-ID: <bz3mola5r7v4rs4esmhiticq2ahpkhtwxqnv6nweyfkebszvrp@ap6yn6pvrtww>
References: <20250222-fp3-remoteprocs-firmware-v1-0-237ed21c334a@lucaweiss.eu>
 <20250222-fp3-remoteprocs-firmware-v1-4-237ed21c334a@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222-fp3-remoteprocs-firmware-v1-4-237ed21c334a@lucaweiss.eu>

On Sat, Feb 22, 2025 at 02:00:50PM +0100, Luca Weiss wrote:
> Add the necessary supplies and set an appropriete firmware-name for the

Nit: appropriate

> modem and enable it.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
> index 5611209dbfa41d7834af7903535ed3e05604ba63..31ed26c31e6ea381a8942ccf569513df3300cdeb 100644
> --- a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
> @@ -87,6 +87,14 @@ &lpass {
>  	status = "okay";
>  };
>  
> +&mpss {
> +	firmware-name = "qcom/msm8953/fairphone/fp3/mba.mbn",
> +			"qcom/msm8953/fairphone/fp3/modem.mbn";

THe comment from the previous patch applies.

> +	pll-supply = <&pm8953_l7>;
> +
> +	status = "okay";
> +};
> +
>  &pm8953_resin {
>  	linux,code = <KEY_VOLUMEDOWN>;
>  	status = "okay";
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry

