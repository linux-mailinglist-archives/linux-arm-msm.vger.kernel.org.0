Return-Path: <linux-arm-msm+bounces-50620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D3CA56115
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 07:45:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59F531891F28
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 06:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4918C1A0BDB;
	Fri,  7 Mar 2025 06:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pPdKXMHl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DDF19D8B2
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Mar 2025 06:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741329942; cv=none; b=YxtTYMSNKkmzKFEoPaCOUcDs3jIYFUJOWdG3U9chxQvErQzjBa5DAa4lfPyQrVPZj/d1nAfAfwibEWqxgIsYMdRPuEP3qomwVrHyj8El08czl16tsSPOTJtsEHKJ1DUVeFypQUVx0SRFq3YbASqrxbsHdkLcLFkgI1TUUdkpxvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741329942; c=relaxed/simple;
	bh=2IbWjjX0WxGiZ8sC4vYfyq7mDesPs3GJVhh1I5IA2tw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i0Ytmhxo1YAxbZiSPfSLtwrftGur4u/u9rrcGSZ+qfKE/BD+Vjvk4Ptq/MioICm2zncuBXp1KeUDu0/CfA8uhYlWK4a605umEL/2PeQ/HuzCuNVQApIMytvThgTnxaoeIrKw9dj9CkUzxxF06ZDOsiCY1ePKxYmR9kGXig+ZFlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pPdKXMHl; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30bf1d48843so8110571fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 22:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741329937; x=1741934737; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DkifpUNIVfalfehyoZ5anyUq+7xOJAxWFQWwUGknXdA=;
        b=pPdKXMHlySjylHroamrtvXuQwvwY9J+lAvfKDC3EFIKu3h8unGh1552CwiLMhlqAdB
         KeB6WUq89tjsQThjl98nyH0OlYX26qrnKIW6xA7Zm0o6zw8VlnRGAA8dY16WjFVq/zw2
         SqCZKTx80MbWDJdKYP8v5HlsXVlg7D/EwrTBngBAjlMB1O+SFz+j0FaHVE/oX9+pkKP0
         htcEgdU8W2poWkMqBVJxOtkQZdjSIzrcJLkEtSHTMfYfAfFyZuArUmRhUac2DeDGlZd8
         zYfPMn3nKlDVTx8Fm4gx0nP1/aS6cyUT5ap3QGA3ph37H+FRAR4iEzZuKFLiR1pJ56bJ
         sW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741329937; x=1741934737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkifpUNIVfalfehyoZ5anyUq+7xOJAxWFQWwUGknXdA=;
        b=WsUw9GIBt+x2ayJL1k1+zJ0oncLMBk5Yirg1lY9dbp0gbjNGFciY2XHJdJsXDnHmYs
         BXkyzd2j5pFhVI6wsTG4ZX9Qx9Xelpk6j0pJb4St1fI+D6Zt4VI1SXsKGmI42O23z0ST
         m0xKJ9m2RvqcgC9j3XWfACph/ZwvomS6NdDb2V5vkP3boE9XRaskDDoBrZ7RJZT6B+QY
         RSll5dFop1oFzTSiCld7E5nqKSeRE5RjSohjdG+AzaAcxGKYZ9FL9Jw3h8JLJKOy5ae/
         lFy6ZkwOgp9B/JFLCIy7vhLTEGeYkPc3ddBbJ49q9qDoDZSX1zLix2QNdZtpseA/vOSb
         3zhg==
X-Forwarded-Encrypted: i=1; AJvYcCWe1lBFfSdPNcUWzjXQuBEe5XAf2XPAMtueAR4zGwNBOlg95E1ngJ0kFf9A+AuOWyYErHzdo90ls8k0u+fN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6A+0UDmoUyilpt5uUY0LTYTVEaZxnoCH82GFFBNgqe9nqpFQy
	Yh2F3SWV7Dbo641MMK8ozxT0u3q3UCscrTFHzlCelus3pzjF5h0lI4rm1OaXI90=
X-Gm-Gg: ASbGncusli9/RFLGYolx8iQyGcBW7msa4t/VM1IatCutstefoG03DieqKCy/v/CUdcK
	e4UvsiviFXZ5KbYyuj2wOa+gsefw90Rd1JUoG378M/3AQZwq3n4Gx/z3ZDdR5uDvKoN8iWCEfmV
	fQiGBbeE5jeFaJJeZPl6Liuf8CkUYhNWUOv6knkHIdfU8szysirPolTEBe9sx0Zp/NcHVdXaJn/
	HIiHkw9W8YHO1idpH9sbQvaiyxeV4AxRSCsuWyCXKE8U9WYMs63bRe/INgmNy+E5bhiEuwCvhii
	vNldDqwywpgSsQOEN05VIuUIr5iqWtna+O9hHisAwXsibwnAui85fKkmVcoK6zTapBHsXSQGHFU
	l5kM/FD6prZF6kBjbDtxyeDA1
X-Google-Smtp-Source: AGHT+IEVwXNQL271t+0M8gZNNjaFYj/wP3rsGJm5Z+AyP5M40rV9YMISVPS8byjNiGXn0/FUIobKLQ==
X-Received: by 2002:a05:6512:3b9b:b0:549:38eb:d690 with SMTP id 2adb3069b0e04-549910b5e9fmr731477e87.36.1741329936903;
        Thu, 06 Mar 2025 22:45:36 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b1bcd96sm394407e87.207.2025.03.06.22.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 22:45:35 -0800 (PST)
Date: Fri, 7 Mar 2025 08:45:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Georg Gottleuber <ggo@tuxedocomputers.com>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	wse@tuxedocomputers.com, cs@tuxedocomputers.com
Subject: Re: [PATCH] arm64: dts: qcom: Add device tree for TUXEDO Elite 14
 Gen1
Message-ID: <5hvghahezqms6x4pi3acgaujyhiql6mzl2xhzph5phhki2yiyq@oi3xjatj7r64>
References: <57589859-fec1-4875-9127-d1f99e40a827@tuxedocomputers.com>
 <5e72992c-170c-48b9-8df4-2caf31c4ae44@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e72992c-170c-48b9-8df4-2caf31c4ae44@oss.qualcomm.com>

On Thu, Mar 06, 2025 at 01:50:56PM +0100, Konrad Dybcio wrote:
> On 6.03.2025 1:25 PM, Georg Gottleuber wrote:
> > Initial support for TUXEDO Elite 14 Gen1 based on Qualcomm Snapdragon X
> > Elite SoC (X1E78100).
> > 
> > Working:
> > * Touchpad
> > * Keyboard
> > * eDP (no brightness control yet)
> 
> in case your panel as a PWM backlight, you will need to set the PWM
> output pin function explicitly, see x1e80100-microsoft-romulus.dtsi
> 
> > * NVMe
> > * USB Type-C port
> > * WiFi (WiFi 7 untested)
> > * GPU (software rendering)
> > 
> > Not working:
> > * GPU (WIP: firmware loading but output is jerky)
> 
> Please tell us more
> 
> > * USB Type-A (WIP)
> > * Suspend with substantial energy saving
> > * Audio, Speakers, Microphones
> > * Camera
> > * Fingerprint Reader
> 
> If it's connected to the multiport controller, you should be able to
> just enable it, like on the T14s, similarly to the Type-A port
> 
> [...]
> 
> > Signed-off-by: Georg Gottleuber <ggo@tuxedocomputers.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile             |   1 +
> >  .../qcom/x1e80100-tuxedo-elite-14-gen1.dts    | 798 ++++++++++++++++++
> >  2 files changed, 799 insertions(+)
> >  create mode 100644
> > arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 140b0b2abfb5..f0a9d677d957 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -298,3 +298,4 @@ dtb-$(CONFIG_ARCH_QCOM)     += x1e80100-lenovo-yoga-slim7x.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)        += x1e80100-microsoft-romulus13.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)        += x1e80100-microsoft-romulus15.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)        += x1e80100-qcp.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)        += x1e80100-tuxedo-elite-14-gen1.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts b/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts
> > new file mode 100644
> > index 000000000000..86bdec4a2dd8
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts
> 
> > +&gpu {
> > +       status = "okay";
> > +
> > +       zap-shader {
> > +               firmware-name = "qcom/a740_zap.mbn";
> 
> Are the laptop's OEM key/security fuses not blown?

Can this laptop use "qcom/x1e80100/gen70500_zap.mbn" which is already a
part of linux-firmware?

-- 
With best wishes
Dmitry

