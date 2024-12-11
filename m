Return-Path: <linux-arm-msm+bounces-41591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B000D9EDB14
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 00:18:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8444F18867A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 23:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D3C21F2C42;
	Wed, 11 Dec 2024 23:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MWbAuH7t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896B31F2367
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 23:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733959124; cv=none; b=ZDCSQuxSreMWZyz+YMhY+w9UJKHrj3InJ9PeV4vi9LUDwwyAwJqO61Jcg+0srnuGlG2sK0qPr5zs0hMoBC3RZ+14RhKymXWMP5F/zz9BShTBAC6Cbjf/BRK3fOOf1z4svMvaWRjlRmOInXXtgxKFtoNz4vbHqnm9WrICfn5xl6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733959124; c=relaxed/simple;
	bh=Vw0Rd6A8CkPce9mRpc49aoMHEVtyn7wqJ1+SvBkbGsU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=RjTZCJRjeu/bA61NC2JvpspQbwSnZB7utgWWIZ7IDgMVX2bPejoczE2XLyI7hWcvTyjgOkDNN8B4VD69N9cd1bVVnh5rpMGSv/nU6/kiwfRCb26hcmxLWi1doExWSWc6UQb9q4YkydxjFqJFrgIWHeUj5SvRfW5ZgmefDEoHQtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MWbAuH7t; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-434e3953b65so34695345e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 15:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733959119; x=1734563919; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRHUZTWrw/enXmUg5HJUc+kp5QUA2QAYg8TadYFylJU=;
        b=MWbAuH7ta3ztE4lKmo1WnN7lPC2b8xNu5vZtA4i+UH0PjfVviZz3NA4W4JifwCVm6F
         /2XLeSkAc4cj7+Gal2NjL0Qu8Vi+mdTgoSSM3DSPOe8hsl6g2xFrQ06yBxj/U6DXtjc+
         3AHGvrsoSKQpRlwqWgPmmKOUAi3cpeEj4QAzPcM2/dYYgl2j061tfDsMXVVDLG/E4L1H
         JvuMpf0p7xz7Y6wbi/8q6nJuapyPvaFKxYoM/wUG9PvZ7FxlifEBkPE86g7SzczeOUUA
         SvaaAWUxG9D/1+DhRggYpiIzY53s28VkGsZgbTpAHottubI055oPD7pWiHv9Q8rLfyRm
         sDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959119; x=1734563919;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rRHUZTWrw/enXmUg5HJUc+kp5QUA2QAYg8TadYFylJU=;
        b=FqCpvFKrdsdeqagYAmjSdbiiim7LtAwxOORRY/0jJkEfI5hASWcCRl2THwh5B+mEZF
         3kFX2+tudQ09xQNWulx7WgABvW20yMCI0xIyRRHJVV+aUrglDMyZfzBNyxwQd2WumgGR
         F1P6N6Oxp4KSzwBDdNtN2pjb3YbdZx+xOhBpoOg1rVAn+AKRE6vBQtolitgvsM9AHDWp
         26rlgmRtOZ/4Yp4Khszrhu1SNcOZjf3/WeIllGWlm0UspszruQLNH8fGtvRyR2XWxJuI
         UVZp2+p8aXu2VVu/zEh6OOCj7mzwnc3RFXeBFYheu2R1t5X1Klp75LH4Pb8s5/5WRLEs
         t80w==
X-Forwarded-Encrypted: i=1; AJvYcCW2Oto8jnOF4Xm6dfN+zsGAY78iWT/4aATWnhvl/a99OYwz2qfs9SV0lMEJk1KFmqVa5J43NNUqHlSo2+sA@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6WhQWi2YZblrYFsT4HKlEKjq/IuZzWyr5u67HVh4HiVlHSxt1
	aoA0Z7WAuCiRfuKNLkgrnL21OPIicxmjl1XkIbB5oE5O8s6OTXstyQv6VJN4XbA=
X-Gm-Gg: ASbGncu3m8L04u8lC5ZtgiG68DoQjsbd3cRDqvBT+LQtSanKDNkTK9B7XTZVl7tSdY+
	gn3DwuicJqPRKHgTDY3yPpWIw2jo+oCiE3tJKlvabc1lIaH/6aAPR/Q2udV/pLxdx1XKMgOuWEj
	ufjQ6X7x7bkL5h6Lh0BMrfvCT6o1EF9xF/V7vDdC1fS486SVqkOt93CA6S+el1+iIhwEns43WD1
	rGxbAOO7Rv9KuqKW4tmIYvgmvr3HZ+Bo+l14aXUvLfvU6p89SXyjJnE
X-Google-Smtp-Source: AGHT+IHm4dUrixa2oAB3OPqhfx0NrTgK9S/ClAQ/+/CAsZLq77t7Elt6vMKKQ3p5VLAN/iyTfeDFTg==
X-Received: by 2002:a05:600c:3acf:b0:434:a802:e99a with SMTP id 5b1f17b1804b1-4361c346253mr39230375e9.4.1733959118933;
        Wed, 11 Dec 2024 15:18:38 -0800 (PST)
Received: from localhost ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52c0be4sm273741395e9.28.2024.12.11.15.18.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 15:18:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Dec 2024 23:18:37 +0000
Message-Id: <D6997HYLIQ6L.3FN664SYBLTXM@linaro.org>
Cc: <tiwai@suse.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <dmitry.baryshkov@linaro.org>, <linux-sound@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 08/10] arm64: dts: qcom: qrb4210-rb2: enable wsa881x
 amplifier
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, <broonie@kernel.org>,
 <konradybcio@kernel.org>, <andersson@kernel.org>,
 <srinivas.kandagatla@linaro.org>
X-Mailer: aerc 0.18.2
References: <20241101053154.497550-1-alexey.klimov@linaro.org>
 <20241101053154.497550-9-alexey.klimov@linaro.org>
 <8078589d-d724-422e-a5f0-f5b6c67deafe@oss.qualcomm.com>
In-Reply-To: <8078589d-d724-422e-a5f0-f5b6c67deafe@oss.qualcomm.com>

On Sat Nov 2, 2024 at 9:30 AM GMT, Konrad Dybcio wrote:
> On 1.11.2024 6:31 AM, Alexey Klimov wrote:
> > One WSA881X amplifier is connected on QRB4210 RB2 board
> > hence only mono speaker is supported. This amplifier is set
> > to work in analog mode only. Also add required powerdown
> > pins/gpios.
> >=20
> > Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 45 ++++++++++++++++++++++++
> >  1 file changed, 45 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot=
/dts/qcom/qrb4210-rb2.dts
> > index fc71f5930688..76b9ae1b0ebc 100644
> > --- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> > +++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
> > @@ -63,6 +63,16 @@ hdmi_con: endpoint {
> >  		};
> >  	};
> > =20
> > +	i2c0_gpio: i2c0 {
> > +		compatible =3D "i2c-gpio";
> > +
> > +		sda-gpios =3D <&tlmm 4 GPIO_ACTIVE_HIGH>;
> > +		scl-gpios =3D <&tlmm 5 GPIO_ACTIVE_HIGH>;
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <0>;
> > +		status =3D "disabled";
>
> Does it not work with &i2c1?

Actually it does work with i2c1 (non-gpio version).
I am going to use that and will see how it behaves.

Thanks!

Best regards,
Alexey


