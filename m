Return-Path: <linux-arm-msm+bounces-26810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 831159390CD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 16:41:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A950B21776
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 14:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A2A116DC16;
	Mon, 22 Jul 2024 14:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cRm8tlkz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717D216C6B8
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 14:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721659255; cv=none; b=Jfz2zBV7dFDQVVhu5b/oRy3JL96S3DO7IUOzAfpoL4ZGF1CJfqS74vg3JmogZp8URYbTxitSBSGJBxh+QmmX5VLtH7RHIp5l3sArgLs+DLRb3OZFNhC5aK+srBgKjW0O1CkE0J3DsLc1FXF1JaYPXGigzlhi2Po6QK1XbQw4wpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721659255; c=relaxed/simple;
	bh=o51mjZOr7upQQVamh4+U9Js9b7LkHzgOy/EvXR5VmYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pLAKSrd/ZFt2pQF5mHZuMtR08p4JPLhaoZx7D3VeZWwmgX7ZtgjkrrGS4c35r8/2Vlj2vb8Y4zA4a6LSxJlmx86TnhRhJfBeCMV6TTV1gYh4AosRn4CpjdDdLjzeEE2EpiOovYMCJLX4Lu6xq/LaGLnBWFWBZ25tkBD4ufXSIdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cRm8tlkz; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-a797c62565aso414391466b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 07:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721659252; x=1722264052; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V2nvyjeyG9ehh9Y2EyZ5Wh77KHFZbpScnbBRLqxpiKU=;
        b=cRm8tlkz2jqUxLehXLwzAcpaO3eJ8wz1x4nltAUKt9JLziYpLvttISo0uiybp9dKrk
         DE/EIZOhbsOoGke5wWCfW8G68ENYdJ57pQ7gWW2N+gUt/K7Ec/pnQzBgCV0A0vwnCfyx
         Y9Yti6vHPv/yUj9gDNqbCrBjGKex/Aij5i+UDNYVlReqkEMzLipOtmHQsAfWkdtSaayv
         fRx9jMotdKd7vS2zcnOMcRUhWd0uV8EDZkEKa92jDoW0dgD68ShnM1pMspo8kA5ibFhI
         Ch5vDDdqyLveP7kDxH+NRwj52AVAZSdfbByFZ++liRbNope3FkgIE3YL7slzQ3aMxiiq
         cUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721659252; x=1722264052;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V2nvyjeyG9ehh9Y2EyZ5Wh77KHFZbpScnbBRLqxpiKU=;
        b=ZOYyG013rsoilnHbJzsl8I8txGMY0k3s8UfhsJpM1JRPmKrG6RbEGgXEth3A4dHxev
         nPtaLXmxr8/UZVlACjO6NdqOwBKsHIsf2fGWTP5/fDqrA4jTvdZmYUeS/Ys005YT0jNZ
         5/XBrtVuB+xgU3JTfwDznY3exoTZQv+z6v9JwP0yFqsznk4V/cgSzXYt2aIFUUk3ztRy
         gRYwmT854gGNgWIBb2xlcHyWQutMp5T3vf3unGgk5awkyUgtpl8fPloeEd+b5so8yGVZ
         dcLqx8J7YWhEoHuBf3DYpZf0B5Vg7JTNFNcbfGXweh6mTXVCJaFoHmQADf1c0g+TZg45
         kibA==
X-Gm-Message-State: AOJu0Yzy/JYxb1Vhh3imispT8fZfzlAZdRiLOCamp5F+96ZpLTn5iJM7
	j5tQ1/lGymgDoWSdIOzcvVp8rB/eIlQC+wI2p/iZGdjeuVl2b9rJsbfmkXBIxRs=
X-Google-Smtp-Source: AGHT+IEEF4doNpQ4j9pHl5lqNBYbD9TdMrhFVijh96wG9AzNjMvvhfqhK8pCT6DFqqeJb99NbsGvUQ==
X-Received: by 2002:a17:907:7d86:b0:a79:81a4:faff with SMTP id a640c23a62f3a-a7a885a1867mr6508766b.66.1721659251733;
        Mon, 22 Jul 2024 07:40:51 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff1f:b280:702:9410:ae6e:5c88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7a3c9510e6sm428501066b.222.2024.07.22.07.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 07:40:51 -0700 (PDT)
Date: Mon, 22 Jul 2024 16:40:46 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, Doug Anderson <dianders@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rob Clark <robdclark@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: x1e80100-yoga: Update panel
 bindings
Message-ID: <Zp5vboqXeVWaNrs-@linaro.org>
References: <20240719185250.4877-1-robdclark@gmail.com>
 <20240719185250.4877-2-robdclark@gmail.com>
 <Zp4HCPYId4sjd32Q@linaro.org>
 <CAF6AEGt3hggc+eiWfr4V7YzoVtMNT01EUfn0X_+WvsjuBBDEwA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGt3hggc+eiWfr4V7YzoVtMNT01EUfn0X_+WvsjuBBDEwA@mail.gmail.com>

On Mon, Jul 22, 2024 at 07:37:05AM -0700, Rob Clark wrote:
> On Mon, Jul 22, 2024 at 12:15 AM Stephan Gerhold
> <stephan.gerhold@linaro.org> wrote:
> >
> > On Fri, Jul 19, 2024 at 11:52:50AM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Use the correct panel compatible, and wire up enable-gpio.  It is wired
> > > up in the same way as the x1e80100-crd.
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts   | 13 ++++++++++++-
> > >  1 file changed, 12 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> > > index f569f0fbd1fc..28a6ea5a24fd 100644
> > > --- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> > > +++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> > > @@ -592,9 +592,13 @@ &mdss_dp3 {
> > >
> > >       aux-bus {
> > >               panel {
> > > -                     compatible = "edp-panel";
> > > +                     compatible = "samsung,atna45dc02", "samsung,atna33xc20";
> > > +                     enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
> > >                       power-supply = <&vreg_edp_3p3>;
> > >
> > > +                     pinctrl-0 = <&edp_bl_en>;
> > > +                     pinctrl-names = "default";
> > > +
> > >                       port {
> > >                               edp_panel_in: endpoint {
> > >                                       remote-endpoint = <&mdss_dp3_out>;
> > > @@ -663,6 +667,13 @@ &pcie6a_phy {
> > >       status = "okay";
> > >  };
> > >
> > > +&pmc8380_3_gpios {
> > > +     edp_bl_en: edp-bl-en-state {
> > > +             pins = "gpio4";
> > > +             function = "normal";
> > > +     };
> >
> > Did you omit the "power-source" here on purpose? It works without
> > because the firmware already configures this pin, but ideally we should
> > provide the full configuration.
> 
> I just copied the CRD.. other than the panel, things appear to be
> wired up in the same way.
> 

It looks like Abel has an older version of my patch in his tree. The
patch that I sent upstream has the "power-source":

https://lore.kernel.org/linux-arm-msm/20240715-x1e80100-crd-backlight-v2-3-31b7f2f658a3@linaro.org/

Can you copy it from there?

Thanks,
Stephan

