Return-Path: <linux-arm-msm+bounces-75246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A25BA2923
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 08:50:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD7E53B4856
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 06:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8218927D784;
	Fri, 26 Sep 2025 06:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rW+ruKNK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DAA275B02
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 06:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758869428; cv=none; b=ivR+u0zIEC/537E7tYuQnHLDHwFKE1cMEKQFnkCqOzCfR+mJHELQ+d/aASlJ6KvO6yFRM3o7jtrVRIDUwKJSh105yypMwskLqEnQ4fF5icG8CnHZzaleRmAjuiFgVDSfo8BN/cGKr6OleYeWUBSFR7rvUb14tpWKhcmtgAyJVKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758869428; c=relaxed/simple;
	bh=JeiZMAdBfoDaJdELXLbBBT1DLTAze95bhqjWibF8b5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kna+hWS0QrnkSCcIg157IH586iuEoGBa4SW3znyGd+pmu5Y4csmg4wDb1lKVnBgs1ZB7QZg5KNCYzNxupGViVveLGDqmcW1aH1l15TzZDJQUUBdCJUE7EddiAaG0zxu3QLVr/rFwZvhk5q+YxrnCccx9NWdIEfyo135T+sitY9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rW+ruKNK; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e414f90ceso231025e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 23:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758869425; x=1759474225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NFTsrA5/XpN/aDPrsWUi64EUIAXE1gernUECI4xL01o=;
        b=rW+ruKNKll5EhnG2oOhKIvMEad+3krImExig4LkwcQG7DBj0kcn2NryFioX3fSmJH7
         HklP74ToNbfZITW6vXgRm1RjZwHVfvJkh3EJHE9ci2GDxTi9Z/DzvF74cw0n234YhrPI
         RhpMH2SkrY6ls6ZvbfBzGbbOU0I43O1vWXC7pFV358LP+O6T3mLHCnxeMjYhZ4PaWFBv
         /CPPYIlByCPyXJ3hhK4yJL4tOvNkuBl1JI2fJbl6li7FfnUNZp+7IM3zje/wxKrewIxA
         agwutEIni/EBxf4BZZW4Xtrkpjy1YT+61bjSSxSm54ECR2IbpyhyflEHX0rrcyis8fNh
         doRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758869425; x=1759474225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFTsrA5/XpN/aDPrsWUi64EUIAXE1gernUECI4xL01o=;
        b=IuIGq9j0t1Y790sLuUIkEJ3mViF1FlLgKYN0gqnOl8ktLcyteDqMKmcGm0AIMzxivD
         GSNAXWAFeKXdc2G0Du3jjUkLUPb0MLWaChVSzYeZMKMvovt0kGBn/eqfHsrzfk2G3F5x
         TcvRYQ4HWqAdMd8jO1twbWh7arSOiGaXyyo4GhYjGiucd2tYoe9ymZ1VGW6ecQXKU4t+
         ogQSsjG5wi+tgGXsENiXoR5YUjX0vARRsKAPSzAfoMcn3G9kP8DYSrJXDmQHhu7AguQw
         0UsNC2HeLZCogf24XILKi9Bj6U3+Zn47jf0WIcT+2HfaGP995Y+nhJr9L9wAUZMHJ3qf
         Bcow==
X-Forwarded-Encrypted: i=1; AJvYcCVywyKgvpK/ASgIlTGdiD9AUKXCs35NSNZwvkfhgraPzbrZZhOlXNO8Ff1m4QbihJ2CuWdxmeXNh3EXAtHd@vger.kernel.org
X-Gm-Message-State: AOJu0YzUfvzx8EvwDQpFVZrof7zM87NhrAiMyaGWZpvpQFYF4iv6gK4a
	XPnDrCW8nel582q5Bgd/BJVuKOvnsY9V1cmF/11hvzwYUI9nMyoGSc8LDe00Oc+4NnA=
X-Gm-Gg: ASbGncsfTAXhJkY8fODufzxuluY6stse1BbfM+4ZoVwF0pYKIIcVNxSR1bZI6zXHXsp
	jSYGlLtrgdkU6fXbOFS2/0OtmSaAWgEZrzmqZG+1Gs3S+c64xyiFD41O1q9UE1xl8Lv7grNXz4W
	U72wKpntkPzs1WHw1ryCxRxq0vtGpilPSn1/P0pY9/MjIzCtDbL+B/mnULixO3h2tgp9LHq3oEi
	obvpwBhtIZRFkA4Xeb9s/Nxfho6ct3EYlLCuMJCmYDIZ1a+8RSajJlI8eIvCKnIMT03W+CpxLB/
	7AUCjNAJhlYBfUzMY1oVVeUSPPuGGCvNAo2+WFLwoDfwDF4uwm2R4vQtNekDsIXhMFdP7ya5G/p
	wHAdqb2IyRnb//nRL90o6Ww==
X-Google-Smtp-Source: AGHT+IFyx6DPnlr6W6V0+TXiAp7mU5XDK4wWvIBL9OAv7zYNMXQhdyyL5XhqSCjFW7RXKqfYCBtV6w==
X-Received: by 2002:a05:600c:8484:b0:46e:1abc:1811 with SMTP id 5b1f17b1804b1-46e329f653emr46236185e9.27.1758869424835;
        Thu, 25 Sep 2025 23:50:24 -0700 (PDT)
Received: from linaro.org ([86.121.170.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2ab31ea3sm103257195e9.12.2025.09.25.23.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 23:50:24 -0700 (PDT)
Date: Fri, 26 Sep 2025 09:50:22 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: glymur: Describe display related
 nodes
Message-ID: <r7f4zzugs3io4ho7qdjudh2ebyphtsjdnchnj7hnt7msoiylfz@dhfgzjg3sh46>
References: <20250925-dts-qcom-glymur-crd-add-edp-v1-0-20233de3c1e2@linaro.org>
 <20250925-dts-qcom-glymur-crd-add-edp-v1-1-20233de3c1e2@linaro.org>
 <43jgqfcw2nnasdnskfdri5swddr6kunvvp6oxzqibnlvyc4jd2@4y6x7fy5shq2>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43jgqfcw2nnasdnskfdri5swddr6kunvvp6oxzqibnlvyc4jd2@4y6x7fy5shq2>

On 25-09-25 20:11:11, Dmitry Baryshkov wrote:
> On Thu, Sep 25, 2025 at 06:02:48PM +0300, Abel Vesa wrote:
> > The MDSS (Mobile Display SubSystem) on Glymur comes with 4 DisplayPort
> > controllers. Describe them along with display controller and the eDP
> > PHY. Then, attach the combo PHYs link and vco_div clocks to the Display
> > clock controller and link up the PHYs and DP endpoints in the graph.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/glymur.dtsi | 492 ++++++++++++++++++++++++++++++++++-
> >  1 file changed, 484 insertions(+), 8 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > index a131cd6c3d9e7f14ed1c4aef4b68e1860cc3bca5..41d89998b1fe14a24cd528e73afc37cf2a840bab 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi

[...]

> > +			mdss_dp0: displayport-controller@af54000 {
> > +				compatible = "qcom,glymur-dp";
> > +				reg = <0x0 0xaf54000 0x0 0x104>,
> > +				      <0x0 0xaf54200 0x0 0xc0>,
> > +				      <0x0 0xaf55000 0x0 0x770>,
> > +				      <0x0 0xaf56000 0x0 0x9c>,
> > +				      <0x0 0xaf57000 0x0 0x9c>;
> > +
> > +				interrupts-extended = <&mdss 12>;
> > +
> > +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> > +					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
> > +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
> > +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> > +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
> 
> No pixel1 clock?

Will add it in next version. Everywhere.

> > +
> > +			mdss_dp1: displayport-controller@af5c000 {
> > +				compatible = "qcom,glymur-dp", "qcom,sm8650-dp";
> 
> This doesn't match your own bindings. WT?

Urgh. Yep, this is wrong. sm8650 compatible needs to be dropped. Will do
in the next version.

> > +
> > +				mdss_dp1_opp_table: opp-table {
> > +					compatible = "operating-points-v2";
> 
> Is it differnt from dp0 table?

Nope, they are the same. Will use the dp0 table for all controllers.

Thanks for reviewing.

Abel

