Return-Path: <linux-arm-msm+bounces-37540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 846399C4CE4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 03:55:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48D40283504
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 02:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081D319EEA1;
	Tue, 12 Nov 2024 02:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wVj3X9nX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3EC207A28
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 02:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731380089; cv=none; b=MGtVI2fUW4O7a11VX/ulRD8yqyoSL96jQKeWjqrWj5+NjFshDwvcjeNcxv0Vjhm47dEpNC20z95MvcoIUls5BIgo6OYP6eXTZgcS5sYlmYoixkkTHtBxXlNJcnX53tPqHcXMLFV+bZrPlbwQueP3rR7EIbi1y7EVR0qzqnqB0ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731380089; c=relaxed/simple;
	bh=DDJsAVAG+kMW+7r8Zr+yPdZo6Pi9sqB61ilk/o3tLAE=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=W+EyblibdpL4J/7OAGEJTUljLGEe4+Z8pC8hVqa2jMqHC1r4xrc4T4P0TGeaQEm5I63LiQZhlubsqjNsbFNDWLkRKret7M/v+2n5DT90I7Y6S8TUMeQ1y4yQLTR34uT6J9MKBfr4mRjejVJS8Lx+5g3SsSyxpqEbJaje+p4y7Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wVj3X9nX; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37ed3bd6114so3146523f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Nov 2024 18:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731380087; x=1731984887; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eo9k8olRlknzdJkNiLmR5VQh+n8GJzR/az3L4re+Tfs=;
        b=wVj3X9nXocrVXc85UKo/UrFCtcsit6Hin+kCfpzb7u/mxXm3S2lv0dimgcfm6K9hiS
         9KiaoY8ZocVapRNTk3PFrwaAyVcTBWIEwl3FHUp31ybEiirO6bwXKOINQFt656PtCW64
         5G5QIDXM47h+wF19f8rRd3Q3lrTwZuVkdP0+g8/bGM4X3VyHWxNCiCoO9rqJCfFB0Z9d
         xKTxTILLYlGRusfDGxN3WhX3z92cE7j+JqKxVkqLgDm1ydZPb/aK8iF4cNw1rwlvUiOA
         2zimfdPrfJxrNpMtYbhqrUBcl2E9novtrNxc8/mG33o4EP4/asRIecF5+QrE1+sH7aQW
         Xc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731380087; x=1731984887;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Eo9k8olRlknzdJkNiLmR5VQh+n8GJzR/az3L4re+Tfs=;
        b=WGk4xPa8fSdC5hNZZ5gjWIyi8v1+4pgeSJOOHITmniLqTTIluzRf9bd0uTShajiJ7U
         ducNQnpQpkatdWsMAgnZzq5Aba2A1+ZFPDwaZ7VQwIfsgDSgpVndIMs0+y52yHYNgt1+
         Gd9zLE72Us8tepbLrLAVnQDE9elZg6Xa5K8BGFdjIRxmByYfyWK90YBdMT3oOIJr5TVZ
         gsF0z7/RKSF7OSr7rliZ2noFqDvkZAWqFNVRi8fEo+uk100aV6zI5fDK38AX1WB8h1pS
         CPIJSw9/Ew/BdB9pDLXU9B/0u6wmrEZQ/5O5CfgFz4WDA/LrAms9RnTBtgrwWTvrNe6Y
         gfvQ==
X-Forwarded-Encrypted: i=1; AJvYcCX60sKI7iZ43gnMeTeFwKCO2beDMxt4KaY8giCf+YDUFy3GxcAO9PkB0chh1ctrc4YWNGVr7t4FMhYV7vKf@vger.kernel.org
X-Gm-Message-State: AOJu0YyoxCuobTmYVsxIY0eehKwr+22S0VjF2KB4ADrINfLNdhgPJ/aS
	3JGxIrNJhi1wYyM9hdvqtK9w+VcKMAVENFfCYJWmr5v6WEIJnuV8HejdmpQ0wOc=
X-Google-Smtp-Source: AGHT+IF8K4KLTpQs8OZ6BAg8g9f/6FMePfNpTShhMBDtavRsG60Wn1AVvIB9gmZL8H0aCpapxdCHQw==
X-Received: by 2002:a5d:64e5:0:b0:37d:54d0:1f20 with SMTP id ffacd0b85a97d-381f18673e6mr12929497f8f.24.1731380086785;
        Mon, 11 Nov 2024 18:54:46 -0800 (PST)
Received: from localhost ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9973e8sm14295080f8f.48.2024.11.11.18.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Nov 2024 18:54:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 Nov 2024 02:54:45 +0000
Message-Id: <D5JV0MOQ5QLW.16CF2337CD1TW@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Cc: <linux-sound@vger.kernel.org>, <srinivas.kandagatla@linaro.org>,
 <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
 <konradybcio@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <krzysztof.kozlowski@linaro.org>, <caleb.connolly@linaro.org>,
 <linux-kernel@vger.kernel.org>, <a39.skl@gmail.com>
Subject: Re: [PATCH v4 4/5] arm64: dts: qcom: sm4250: add LPASS LPI pin
 controller
X-Mailer: aerc 0.18.2
References: <20241101005925.186696-1-alexey.klimov@linaro.org>
 <20241101005925.186696-5-alexey.klimov@linaro.org>
 <eaz4aordxjgnl7c2xhz6ek23eaapaszytcrea7a7y53b5p6aev@mtk7jsvywgcv>
In-Reply-To: <eaz4aordxjgnl7c2xhz6ek23eaapaszytcrea7a7y53b5p6aev@mtk7jsvywgcv>

On Fri Nov 1, 2024 at 7:50 AM GMT, Dmitry Baryshkov wrote:
> On Fri, Nov 01, 2024 at 12:59:24AM +0000, Alexey Klimov wrote:
> > Add the Low Power Audio SubSystem Low Power Island (LPASS LPI) pin
> > controller device node required for audio subsystem on Qualcomm
> > QRB4210 RB2. QRB4210 is based on sm4250 which has a slightly different
> > lpass pin controller comparing to sm6115.
> >=20
> > While at this, also add description of lpi_i2s2 pins (active state)
> > required for audio playback via HDMI.
> >=20
> > Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm4250.dtsi | 39 ++++++++++++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/qcom/sm4250.dtsi b/arch/arm64/boot/dts=
/qcom/sm4250.dtsi
> > index a0ed61925e12..1b9983ab122e 100644
> > --- a/arch/arm64/boot/dts/qcom/sm4250.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm4250.dtsi
> > @@ -36,3 +36,42 @@ &cpu6 {
> >  &cpu7 {
> >  	compatible =3D "qcom,kryo240";
> >  };
> > +
> > +&lpass_tlmm {
> > +	compatible =3D "qcom,sm4250-lpass-lpi-pinctrl";
> > +	gpio-ranges =3D <&lpass_tlmm 0 0 26>;
>
> I think this should be <&lpass_tlmm 0 0 27>. The driver defines pins
> 0-26.

Nice catch. Thanks, corrected and resend as version 5.

Best regards,
Alexey


