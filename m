Return-Path: <linux-arm-msm+bounces-20889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3266F8D2D15
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 08:19:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B8941F21CF0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 06:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13DC016132A;
	Wed, 29 May 2024 06:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="wvgLXS7p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2976215EFC9
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 06:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716963527; cv=none; b=iYWpR3b+NfF3kcXUmHLtOxxkOdpnYaft7zxfqRNJ67pDCP25ZlJNipNzyAexxoY6LxTk2HjITk54FnUpjF6H10sc4geaWEMxNOYTLhNH3hYvQ439UlcFqquJUGwtqXAbFznv9lDtV9WX7ZM0Kg7dEGnhZzUKc3nuL6O9Jyq+XqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716963527; c=relaxed/simple;
	bh=td+A5mMkrhdvg9ElSzQdaHWmnHQqfG3xEYFSntb3ivs=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=B6Q5xl/DGaAJWlvKc3yh8qyTk3B8p6vlVYq8354JIelIAlWk+FgcjgvoBUEUlGPFS6PHOh/AYb3LkctY/qkFntcNUeZgC26v7Rbp3YQ7tPkHrFNC8j1Hlpdn9ac6+o1KCauVnLpQi6n334F8CUOBh4cTcAwXqWUKLJvk8l21vks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=wvgLXS7p; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5785e443cf4so1642676a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 23:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1716963522; x=1717568322; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b5o98irvL1PvcmMP2g/CoSXINiWvruSSImbYO4qwby8=;
        b=wvgLXS7pAUfty21u7wWUO6QH5bSCBphX1OAVLcg+LHw3oEYmkTRWUcvpTOKvv/6Ha5
         /Wdko+S9m3RL8dNKlZZdZc06Q6gaCoUr4YgRzvaNvMNQNUaXM6CxRqHJGKZe4H3Si9QK
         LZvoSYoMhFMXAWxS4p8N+rpzhkLJqTHwG98ZQ21YFlnkehyYrgl2uXbtahhtULWrDz8J
         msByiEUcM/14L1BN1zTyHvgNiPZgAvUY+TJfevs5rBLXPqIO/w8tyaGqNf5CK96kqfdH
         lZpVn7tcDIcCTLampjsiahaw+ctxVdKotrcCjKki5Qt6OiRjGAXlzxM7rmYgY5NG+S8C
         NayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716963522; x=1717568322;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b5o98irvL1PvcmMP2g/CoSXINiWvruSSImbYO4qwby8=;
        b=KOEvVIgsJbqRvg1p2/HvTe7d7MV8xdAi3kBG5valQUunIReL6kCmrVIxltl3Jo1IPP
         qsx/ctAM33/PSVVQpZOMwHjqDKGIUbLHsnxdsVJMvC2tF3hLJBPtwfPOfmeC3qb8HsKZ
         2HAHO+ulpJj50chKmEQP1Eryz8bwAVZ5TOqT0iu113cw4GOOAaYSvIK8n4uV2FwkmZE5
         OpFlJ9q+iy6HCeJKXVuMhd+8eIu9mV9VIpM4YzwyjCgft2aT2mh8XXGFhdAMQD1EgLPy
         cyxBGbe1xtXVUZjOFrxfz0G9jdaAYE6ulfSqJDz0z+/dN3XPuvu/ypDXwwpv2829lOBk
         MCTw==
X-Forwarded-Encrypted: i=1; AJvYcCWqtxnUweoEiUBi5cyxm6picpCsoi/ANxPGcRxsuNlSFLxXSJJybWaCeQeCw4MuUFTON0mNnocxMJcx4G4kWVlkRQ2mq0nYXfF03fVtiQ==
X-Gm-Message-State: AOJu0YxdJve9osTeAy4ay3KbTGIqo5G4+Oti2xgJiMeupUy21gQwobt2
	KcqhIbJpBF8DXudtmIkp7dGn3LwZNuX2Gqy+AEdbuC5dHUnueo2Kq+20wvW4w+w=
X-Google-Smtp-Source: AGHT+IG1oXccLJqlT99AbIl0tXdj+h1O8dL6G8y8/9eKbxzPQr8rGYbOgwG7VHPYBxA5kpGfbl/kHg==
X-Received: by 2002:a17:906:314e:b0:a59:c319:f1dc with SMTP id a640c23a62f3a-a62642daa92mr969475866b.4.1716963522482;
        Tue, 28 May 2024 23:18:42 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6555bc091asm7799266b.138.2024.05.28.23.18.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 23:18:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 May 2024 08:18:41 +0200
Message-Id: <D1LWRSO8RFAI.1PQ450TISFN2D@fairphone.com>
To: "Bjorn Andersson" <andersson@kernel.org>
Cc: <cros-qcom-dts-watchers@chromium.org>, "Konrad Dybcio"
 <konrad.dybcio@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Srinivasa Rao Mandadapu" <quic_srivasam@quicinc.com>, "Mohammad Rafi
 Shaik" <quic_mohs@quicinc.com>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH DNM 2/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 DisplayPort sound support
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.17.0
References: <20240510-sc7280-apr-v1-0-e9eabda05f85@fairphone.com>
 <20240510-sc7280-apr-v1-2-e9eabda05f85@fairphone.com>
 <hqwrfe2tcb6vlxybmn52k3j2xrxbt3vw5rqwudindbhj3s3nez@obkr3ayos6gm>
In-Reply-To: <hqwrfe2tcb6vlxybmn52k3j2xrxbt3vw5rqwudindbhj3s3nez@obkr3ayos6gm>

On Tue May 28, 2024 at 11:35 PM CEST, Bjorn Andersson wrote:
> On Fri, May 10, 2024 at 02:27:09PM GMT, Luca Weiss wrote:
> > Add the required nodes for sound playback via a connected external
> > display (DisplayPort over USB-C).
> >=20
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> > Depends on a bunch of patches upstream doing bringup of Display (DSI),
> > DisplayPort, GPU, and then finally audio could land. But we're blocked
> > on DPU 1:1:1 topology for all of that unfortunately.
> >=20
> > And also machine driver for sound just exists a bit hackily.
>
> Thanks for sharing this, Luca. Can you please resubmit this once it's
> ready to be merged, so that I don't need to keep track of it?

Definitely, though I don't expect it to be soon unfortunately, maybe you
can ask your colleagues though to fix that DPU 1:1:1 topology ;)

>
> Regards,
> Bjorn
>
> > ---
> >  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 36 ++++++++++++++=
++++++++
> >  1 file changed, 36 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/=
arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> > index 05bbf1da5cb8..2bbbcaeff95e 100644
> > --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> > +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> > @@ -14,6 +14,8 @@
> >  #include <dt-bindings/leds/common.h>
> >  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> >  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> > +#include <dt-bindings/sound/qcom,q6afe.h>
> > +#include <dt-bindings/sound/qcom,q6asm.h>
> >  #include "sc7280.dtsi"
> >  #include "pm7250b.dtsi"
> >  #include "pm7325.dtsi"
> > @@ -774,6 +776,12 @@ &pon_resin {
> >  	status =3D "okay";
> >  };
> > =20
> > +&q6afedai {
> > +	dai@104 {
> > +		reg =3D <DISPLAY_PORT_RX>;
> > +	};
> > +};
> > +
> >  &qup_spi13_cs {
> >  	drive-strength =3D <6>;
> >  	bias-disable;
> > @@ -847,6 +855,34 @@ &sdhc_2 {
> >  	status =3D "okay";
> >  };
> > =20
> > +&sound {
> > +	compatible =3D "fairphone,fp5-sndcard";
> > +	model =3D "Fairphone 5";
> > +
> > +	mm1-dai-link {
> > +		link-name =3D "MultiMedia1";
> > +		cpu {
> > +			sound-dai =3D <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
> > +		};
> > +	};
> > +
> > +	displayport-rx-dai-link {
> > +		link-name =3D "DisplayPort Playback";
> > +
> > +		cpu {
> > +			sound-dai =3D <&q6afedai DISPLAY_PORT_RX>;
> > +		};
> > +
> > +		platform {
> > +			sound-dai =3D <&q6routing>;
> > +		};
> > +
> > +		codec {
> > +			sound-dai =3D <&mdss_dp>;
> > +		};
> > +	};
> > +};
> > +
> >  &spi13 {
> >  	status =3D "okay";
> > =20
> >=20
> > --=20
> > 2.45.0
> >=20


