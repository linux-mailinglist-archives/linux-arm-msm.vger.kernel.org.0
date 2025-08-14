Return-Path: <linux-arm-msm+bounces-69265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDD1B26A05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 16:52:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0F1C1BC270D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 14:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E631FE45A;
	Thu, 14 Aug 2025 14:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HY/USMe8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E05C1FBCAD
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 14:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755182855; cv=none; b=I48DoFQOWeUGhM3hXZGjQ6mB8U0nbRnqSIRKCz1usaeChICd0gXB+rWt0zfZd8gWj7Awdo7NGrHEStrPpcYOZmo5hWCXP+OobbR71p+GF+vmUxmYgQRHsa4OpR7Awh8mVuktLzSPpr1RXrQrSPHUXGKwazygJifD4IJl+CpTKDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755182855; c=relaxed/simple;
	bh=FvgXrhJBchDglMj+MOf60VzgeTEvZMxp4caGmrdlrSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rucm/pAbXQVOz5djSI00j0XOb3ki1yJyqsDBaBRk874QACBY9Ge4cRpyuIZYnfI9NGgd9iyOLyaa4OQEuuq7lYnnRX9bUGpZ49kXiCMCWvNULJodLapZMwYlTJoPl6SZAy+6xDCOG4hKWc6qB1Xz8wIT8RlptUf7bU0fqC1zFlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HY/USMe8; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45a1b004954so7325965e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 07:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755182851; x=1755787651; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fZAqDF3XnpGXDPLOHIJz9Ec4YzJw9DgnDjI6cQZHRtQ=;
        b=HY/USMe8okexpKlUrKfbbNpKDfIBDuP4SY3bl8ibbi7B9RDgpRXy6KNgueAyLplG3+
         sEwkSJmAx0UqXPcx62eb3cb4xj9jH7L7+lGAugRIRUaidmYWnAI1Tt8OSCTO98eFhqib
         GUJdhWjwnbyD0H93XEvuks8UpQf1KTaF1WdSSJNQOyyzFwzyvyGoqOHnmacNU718JCEF
         STbUIRVorrPja0LTfArPxONKhJJGV2EiMI8fARlKalaTo4o+8/s7Ds20TGXsOKM4B0hf
         Fl7cgygPWhmbxTYgWxA616xue3rW7/aZ0I1AXXKMuYJsAKuZBSrVTwLLHr5Zwyci1DFo
         /MTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755182851; x=1755787651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZAqDF3XnpGXDPLOHIJz9Ec4YzJw9DgnDjI6cQZHRtQ=;
        b=MmR2TIgM0ikaTxs4KziMn0FOdjbq4FjEFJ6e/305mW+EA1I9nFukf1PFZXmIao9k1n
         PVJse1zCaNaSnxcsEc2hQ14XFQNTCz199Ffinxp0/M6218wa4ul6EG7FOn8d0UVi3gZ9
         ic4HG4FR5vP8jGrNXX9PgWFXK13jizIiOwYCygewfe6lfww7x8zCS0MZGETp5h7p1SVe
         WeIkLjx9+CiHQjfC5tPj5o8NpbmS067xZm8R7GtwZamYl4h/ifw8q6XLuaPS6lPbH+ku
         QVQD6uv5HwDloOCxcQN/H/XHMUMBDQgDisiWI+1za5x1wOR2mCyDfug4WBjIlqpMDEF6
         6GcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnoyqU5u2FKyee+rVTwTJQchx+BRTHvlrtCItDoDWx+mcD2f064pk1eVvLPuUre6JNDHJz0NWYPRuTG5Zj@vger.kernel.org
X-Gm-Message-State: AOJu0YwhFnRCpctnHMoZBhFv3Xdm2Qr/sPffRhWJ1Ca/vqPhYA+/ZEjf
	i52dnmhPDjPBX6AVexyWvOychhctAgZbMlRP7UgCCk1fa4SHZLzsAuy3ig630Mli3Eg=
X-Gm-Gg: ASbGnctIQKpK+vBmCKNZ7UiJMPLLJGCJaUXaEsi5MiXM9CzKI1SGmD37j0PTDK26QQP
	O7t0Dp0QdYkGYaDmNszXjh/rx5hRk0Ma8kDvG8xbiiEDo8D8eAUPpEiZtZSXGSOyEOk3PGs8ZXE
	e7Lh8oBwK4GTcfknxUXmSvMr9vXc8MzmZmkjtVgXzwd522BtsFOiiAp0YkAZ21ti2LiZLxcv+Ok
	nI8Wp0rHToWDi3mL7hqBTJGKF0uZlxE8yjYdgRzS1SCvP2464bxYTFZRElRsnfioCBI7qG1wydd
	4Bc3j2apsAFwS861zXVcVnULB2SocXwLQ+rMT5H+5hsxbaJwI9VZz5zoZ30D5sjpRJONf3erlw1
	AYYQcD6I4CO09TFL1jD6z42yJM3kXQ+Wk
X-Google-Smtp-Source: AGHT+IFhoWtHYN9QFJ0tW1CKBLQo56CkK5ldL2L/K77pZLZH70ja4pUfhvkjKDkzC2VxincZw5xstA==
X-Received: by 2002:a05:600c:3b87:b0:456:2a9:f815 with SMTP id 5b1f17b1804b1-45a1b615307mr29980105e9.4.1755182851303;
        Thu, 14 Aug 2025 07:47:31 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:1e8b:1779:ed5:b6f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c74ad27sm25133535e9.18.2025.08.14.07.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 07:47:30 -0700 (PDT)
Date: Thu, 14 Aug 2025 16:47:25 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Christopher Obbard <christopher.obbard@linaro.org>
Cc: Johan Hovold <johan@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Rui Miguel Silva <rui.silva@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/2] arm64: dts: qcom: x1e78100-t14s: add hpd gpio to
 dp controller
Message-ID: <aJ325wUrBjydnc1m@linaro.org>
References: <20250731-wip-obbardc-qcom-t14s-oled-panel-v6-0-4782074104d1@linaro.org>
 <20250731-wip-obbardc-qcom-t14s-oled-panel-v6-1-4782074104d1@linaro.org>
 <aJCyBbwNjZvTHnjT@hovoldconsulting.com>
 <CACr-zFCq08Pu2=eLfe5=sYdGWEHmy7w+=Eo++9AjP96uCLCNcQ@mail.gmail.com>
 <536dd237-e668-4a88-ac2b-3bc88dca8a3e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <536dd237-e668-4a88-ac2b-3bc88dca8a3e@linaro.org>

On Thu, Aug 14, 2025 at 04:21:09PM +0200, Neil Armstrong wrote:
> On 09/08/2025 00:28, Christopher Obbard wrote:
> > On Mon, 4 Aug 2025 at 14:13, Johan Hovold <johan@kernel.org> wrote:
> > > 
> > > On Thu, Jul 31, 2025 at 09:51:26PM +0100, Christopher Obbard wrote:
> > > > The eDP controller has an HPD GPIO. Describe it in the device tree
> > > > for the generic T14s model, as the HPD GPIO is used in both the
> > > > OLED and LCD models which inherit this device tree.
> > > 
> > > > @@ -5779,6 +5779,11 @@ tlmm: pinctrl@f100000 {
> > > >                        gpio-ranges = <&tlmm 0 0 239>;
> > > >                        wakeup-parent = <&pdc>;
> > > > 
> > > > +                     edp_hpd_active: edp-hpd-active-state {
> > > 
> > > The node name and label needs an index as this SoC has two edp hpd pins
> > > as I already pointed out.
> > 
> > Sure. After looking at the schematics this should be called
> > edp0_hpd_active. I will fix this in the next revision.
> > 
> > 
> > > > +                             pins = "gpio119";
> > > > +                             function = "edp0_hot";
> > > 
> > > And you also need to configure the bias somewhere as you should not rely
> > > on the firmware having configured things for you (as I also pointed out
> > > before).
> > > 
> > > On my T14s the internal pull-up has been disabled.
> > 
> > I am still unsure of what else needs to be set here. Can you help me
> > with the correct settings?
> 
> Just add bias-disable;
> 

I sent a patch fixing this for all the X1 devices upstream earlier [1],
so you could also just send v7 with just the second patch of your
series.

The bias-disable is really somewhat device-specific (what if there is no
pull down on the device side and someone disconnects the panel
entirely?), so I put it into each board DT separately like Johan
requested on v5. We have the same for the PCIe pinctrl.

Thanks,
Stephan

[1]: https://lore.kernel.org/linux-arm-msm/20250814-x1e80100-add-edp-hpd-v1-0-a52804db53f6@linaro.org/T/

