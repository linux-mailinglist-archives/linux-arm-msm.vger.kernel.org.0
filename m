Return-Path: <linux-arm-msm+bounces-24793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E461991DC23
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 12:13:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E418281EAC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 10:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43C8F12C489;
	Mon,  1 Jul 2024 10:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="OjB4fFmy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690B884D13
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jul 2024 10:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719828813; cv=none; b=Md87fDHDUGOjDQHIo+QW9oaIh+3VTNoEJD9SU1Tx6hFyMItDVfeGV8rYQQxWzh5Jk6XzrsRKUStMfGAsErhzd7kgxn7JN0VFHcjWLSpnnd6YJ0k5Z1c/F5DWtuLR2Sg3Lp3I4g2QT4+45Tp+hS5kHVIGs84wKeDij4A5/BiDV2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719828813; c=relaxed/simple;
	bh=wbQXOeAsXHy4G+RPUD1L4HvHY3UjpcFzd4LWh5TzHPk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=gTiKSDqtO+DXExIm0OGb5zUN1ytzhYCXHV+pn8g3oNuUcrK3FFeLBQ8HQXTAb/98HImiDrwkAxUnMXwnPzQiVrSWxKdlLWsrybLpColEhgZjVu7gJaQWHIYZPQYEaeIkNFwpkhZTaxucIW9igHrewg+xP0/jHCxiB2fIhddFR1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=OjB4fFmy; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-57cc1c00ba6so57750a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jul 2024 03:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1719828809; x=1720433609; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27HxPtMT+Pe7iuNMl9/1XfWreBshEKC9NaTAcn2bpUE=;
        b=OjB4fFmyDjkRaDVzRkat9MstEfgZVDsLnCVzQASOpbiTMuaNuFg6CrwPsMJNIrR//Z
         lw29irsO8swaHOXwBhYOKsWl348MvZ+w4mN4s+zYitJU3bNjeO3bCWS2EoiHIK2uzMJu
         AYIcOMaIz3xOtojdvrpWKjZmShs2P/sROipsVeaHJz0f5zvafNktFbctxPA6DSECVvHO
         WHfrBFW/IYrceBT42LaDDkAGYZvti1p/as78ABTUzJhW++kLAvTrjdMr9lZbea+MQKG+
         K7i/PuXHoLN85weWB1NDsz3jSJ/BuyGXqcER8nRs8JKekAb3CbjAffUARUNIbqLN66UW
         U8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719828809; x=1720433609;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=27HxPtMT+Pe7iuNMl9/1XfWreBshEKC9NaTAcn2bpUE=;
        b=XAP46UT2kT8X3oePmcLCAJG6lJyNXSVZlVBzYz7AoYB1Ldt/iw5+Bft8ijgy2jCMjx
         C/OugLgUrBJyobtYf3hu8mzZge/mfozyIq/XUnxjfx/VVvzCrO8zNODPXsnXcU3NdaTk
         N/fnjTRwnnzN9pxcQdxm8DKHAMojU4cF+pa/YPdmivLikcoVb15O2l+EZmjGXVLdn7Jy
         GvlT8M/0hx4dljCGHok+RyS4n6+e6J8X7F2qZlr7KpPqf8tNKlhKXHSmBOBTx6k9X6q1
         4r+Bf7pYSGWwI4wHS0s2ULP2bZr1ajtjOqOAG9+500wLTML9sJrNhITC5kcuQ9iGKi85
         WIkA==
X-Forwarded-Encrypted: i=1; AJvYcCVkWvg4/uKCWYqUe+w/6QzWrb64ySXjMD9kvbdvE/aiBVtA2ChYA+GQujndNytQL1VFjENZCmUCRgYMAIRKLyhQkeedqJT8hlH1Yjrp5g==
X-Gm-Message-State: AOJu0YySbTaHJSuUWbghIiNdwn0Wd/DSmcwYVSY0g6yTlFUD2l9CjebS
	WnzhEuqJRwRlYu+yk3jcU7ToBZDdhzZ996mGbkvlpydt3lKOyFAI+bGKypT489I=
X-Google-Smtp-Source: AGHT+IHj+BcVm87b41Z+G83EUAjJgrmIUWRa5gN38WLv/Sf6cUjrQOUekcEFjk4rw0lBU4DrEAitPg==
X-Received: by 2002:a05:6402:1941:b0:57d:456:e838 with SMTP id 4fb4d7f45d1cf-587a0b037ebmr3541191a12.31.1719828808730;
        Mon, 01 Jul 2024 03:13:28 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5861324feb7sm4244777a12.37.2024.07.01.03.13.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 03:13:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jul 2024 12:13:28 +0200
Message-Id: <D2E4FJAD0UZ7.ZDYOYNZ8QOJA@fairphone.com>
Cc: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: qrb4210-rb2: Correct PMI632 VBUS
 voltage
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dang Huynh" <danct12@riseup.net>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konrad.dybcio@linaro.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.17.0-0-g6ea74eb30457
References: <20240701-qrd4210rb2-vbus-volt-v1-1-5c06f8358436@riseup.net>
In-Reply-To: <20240701-qrd4210rb2-vbus-volt-v1-1-5c06f8358436@riseup.net>

On Mon Jul 1, 2024 at 12:09 PM CEST, Dang Huynh wrote:
> According to downstream sources, PMI632 maximum VBUS voltage is
> 1 volt.

Everywhere (also subject): s/volt/ampere/

Voltage for USB is 5V

Regards
Luca

>
> Taken from msm-4.19 (631561973a034e46ccacd0e53ef65d13a40d87a4)
> Line 685-687 in drivers/power/supply/qcom/qpnp-smb5.c
>
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> ---
> In previous patch series, there's a suggestion to correct
> PMI632's VBUS voltage.
>
> Unfortunately it didn't make it and probably forgotten.
> ---
>  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/d=
ts/qcom/qrb4210-rb2.dts
> index 1c7de7f2db79..1888d99d398b 100644
> --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> @@ -305,7 +305,7 @@ pmi632_ss_in: endpoint {
> =20
>  &pmi632_vbus {
>  	regulator-min-microamp =3D <500000>;
> -	regulator-max-microamp =3D <3000000>;
> +	regulator-max-microamp =3D <1000000>;
>  	status =3D "okay";
>  };
> =20
>
> ---
> base-commit: 642a16ca7994a50d7de85715996a8ce171a5bdfb
> change-id: 20240701-qrd4210rb2-vbus-volt-822764c7cfca
>
> Best regards,


