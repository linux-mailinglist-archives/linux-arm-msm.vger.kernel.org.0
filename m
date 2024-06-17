Return-Path: <linux-arm-msm+bounces-22835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B6190AA79
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 11:59:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AC981F2112C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 09:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE19D192B7B;
	Mon, 17 Jun 2024 09:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xDfvt/bi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D0019408B
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 09:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718618339; cv=none; b=jGR0TyKKvvHOd2rP65ox2T5JVFyEqQxDkKPZfVDZXX3Tfae7LvEsRmQIVJBIUsZvQLEL1xizQ+99OZawVcWWQTrynlE+Lp/Ctu7HwM0oifxOViAngZmrixGAbfEoEK3q1p8/VQnXm8wh/fhDvEsPAHuMaKKz+TnfotB9zcGbFf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718618339; c=relaxed/simple;
	bh=6DeoBATRz+sRNdEAraKJhgJcEuP9qvhe61nCz7zb4yw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ryhLWnWG07UlGOKNn6dUXjG8t8XD3fWe0LGq9y0cFNsQHZCcLUbwh3+7K+3kJISdyaTQHWSJalvLItVixX3o8/n60fKxbY0kYUgJ9pSUxPs8jAqLMeHFs03APWlAh1maKJZ/lsAI0sd/npY8JwgvN1eYYj2jIma7ZLVnGeyxbIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xDfvt/bi; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ebd95f136bso48121071fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 02:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718618336; x=1719223136; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Go2agfDIBq2xSgfWmJcN9bkmoZergV3qWa8jfl+m24U=;
        b=xDfvt/binYalwZ+Amt0Y8nr4vsTWwo9de7KKx+05ynb2ByliFgxEG1CGGIHXSpbzux
         pvhbhAiJCpAEZiH3GTVhMpQqkr/DxaVsy8AVY0+oAK+2jiuvC21DKTOHWwTFZEUDjzv4
         oNZIwj48sKtKlG0qJ1rsprFCZX+a8H7Ywjf/M+q8OXAQqtpo0LJGsVhm5TZWDKIA91fa
         6zmDl1jCNnTAQxsehxs3igI6rAcSC5Mt9t/VzdGcdfr5Q17FFsRHBnSXQ4W0u7IBxnFS
         2P//TFxDxPyvVIBvwc1U1s2QU2+G4o5pKrKxeMFbxxdd7dpVZt2ODkLbAYG42mbE/Yky
         YYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718618336; x=1719223136;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Go2agfDIBq2xSgfWmJcN9bkmoZergV3qWa8jfl+m24U=;
        b=Yap7PacwyfPq6nU5IZzKFbqbggiQnMY0Jg2A2Yl9ocPI6lKpYzcysORkteD8A5YiiP
         zdKup+OJRzeY7PcFrpcpSTKg1+IAfyO4bFJ5uHYwK0jXfM7hBxRjqyVToEuYD77PnzYz
         KN4VuV0q5fVjo8xUvaYCsy54GXziPV/WXfbaJPfraDCAC/ppObY4sisdGRhckxw+dB51
         a+a+6Z1/cFsmlEaEfjDJNvmjSlfgh+Pm3RxzI0SQnYWbS6QJRr8QiV7MLX6/HsNe7O7s
         BreY25XFxqydi46z/GEX5gOv3EOCt+BJvkFYySOL/4o3onQuItxR86RyiaFaw0GUVj0y
         aO0w==
X-Forwarded-Encrypted: i=1; AJvYcCVZjWuTIInN+3WsuL2OWdJFvaaqVmrlf+VWaocxccRLCgbLqr338C+JVfRRCIyvwHrw9mYFhNP93eesZMterUk21VFa7KKU0CAsiS1F4w==
X-Gm-Message-State: AOJu0YxBTJeJ8cOGvDldh0VGL4j1Y910+P25He8dc36PcbM2pCkgBKGX
	pUHUIYIxeiMLKvrtAAc29jRtfwwUr/2iq3vT77xROu+lVyU+Z6nOkT80STYZBlc=
X-Google-Smtp-Source: AGHT+IHn1QvVmniqMsgQ5YEbbsJNDrlNQrexOVuNFQyDehD3a6PDaHxig2xGul9h2+FgIDXlZ9Lhxg==
X-Received: by 2002:a2e:3304:0:b0:2eb:e312:5af1 with SMTP id 38308e7fff4ca-2ec0e5c6e65mr63988941fa.22.1718618336162;
        Mon, 17 Jun 2024 02:58:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c17d72sm12891131fa.68.2024.06.17.02.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 02:58:55 -0700 (PDT)
Date: Mon, 17 Jun 2024 12:58:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Amit Pundir <amit.pundir@linaro.org>
Subject: Re: [PATCH v9 1/4] arm64: dts: qcom: sm8550-qrd: add the Wifi node
Message-ID: <gaqlffxmax777iptimspviznwsmxq4h6c6dvh3zbtoeja4ewfp@ld3t3tchucxl>
References: <20240605122729.24283-1-brgl@bgdev.pl>
 <20240605122729.24283-2-brgl@bgdev.pl>
 <m2ocalmjfiitgr2ziqtegll4gzs5l5hykgx57fzz2n7u45szje@faa2xxfmksm4>
 <CAMRc=MchOAwNR0i-_x13Y60gXGJHtnmVvmCet17u+TKUgrZ33A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MchOAwNR0i-_x13Y60gXGJHtnmVvmCet17u+TKUgrZ33A@mail.gmail.com>

On Mon, Jun 17, 2024 at 11:53:27AM GMT, Bartosz Golaszewski wrote:
> On Mon, Jun 17, 2024 at 11:32 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Wed, Jun 05, 2024 at 02:27:26PM GMT, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Describe the ath12k WLAN on-board the WCN7850 module present on the
> > > board.
> > >
> > > [Neil: authored the initial version of the change]
> > >
> > > Co-developed-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > Tested-by: Amit Pundir <amit.pundir@linaro.org>
> > > Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 97 +++++++++++++++++++++++++
> > >  arch/arm64/boot/dts/qcom/sm8550.dtsi    |  2 +-
> > >  2 files changed, 98 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > > index c55a818af935..c9d3c0549ab5 100644
> > > --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > > @@ -1784,7 +1784,7 @@ pcie0: pcie@1c00000 {
> > >
> > >                       status = "disabled";
> > >
> > > -                     pcie@0 {
> > > +                     pcieport0: pcie@0 {
> >
> > Ideally this should come as a separate commit, with proper Fixes tag,
> > changing all pcie ports at once.
> >
> 
> Why? this is not a bug, we didn't need this label until now.

Oh, I'm blind. Plese excuse me. I've read it as if you wre changing the
node name.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> Bart
> 
> > >                               device_type = "pci";
> > >                               reg = <0x0 0x0 0x0 0x0 0x0>;
> > >                               bus-range = <0x01 0xff>;
> > > --
> > > 2.40.1
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

