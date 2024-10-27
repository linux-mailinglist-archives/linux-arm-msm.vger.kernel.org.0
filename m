Return-Path: <linux-arm-msm+bounces-36080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D559B1F6F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 18:44:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 927051F20F6E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 17:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE6C815CD74;
	Sun, 27 Oct 2024 17:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ru1BjncU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CD91E517
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Oct 2024 17:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730051058; cv=none; b=N6B4kilVbqNlPyLttgCaKlHuNTWhc+Od6Goi+kxHljdzjPutU2XMVt8TfZEWCuCIR6EKZ553TONhcNW/3sCP3xl3t4E+D2gB/cc/NwQSmWdpwdUK6uOnJ0Fm7cWBPXfU0yS96+r3K6FxD4zpnB3s3j7omL1XqReWGTSemm4CBH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730051058; c=relaxed/simple;
	bh=MdunEshAHQ53TVlHzQQbbg3QFVE1V08Xf4kR7qvr/rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DHPy9stVKHqJIGuXH6c0/ke5mwCiFE632atjzbYlULknQxVLlfVGxuPCA3vtZUkjAcSglEPcKwtn0Zd8rPxcN6B7DTR4RJGDrhYAbdjF4anS3ifDtMt5PVIhwPc8J7rm5iwbAUAx8hBgnd0u+7lm71osFtt+i9Hr2n1m6XhhRnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ru1BjncU; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539eb97f26aso3488911e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Oct 2024 10:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730051055; x=1730655855; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N63/GxDEd0wfP94caNCMDYpxPCrMq7BQqlGivmRDQpI=;
        b=ru1BjncU7A48bGD0XCZS05ySvFPHgowOYhwlbBI4LKwI+jOLvfD8RuknPyxzsxFl38
         xP1VQD+JxI+vRj5/pk4Lr6PCj3j7ISNWtcMLFnHO3DcNRm7zZknKLi9OcZOaneRVPiDQ
         iLRbAIf3CmV4T5RJxP71NKMiO6cVhZmiuy8wz5IiflfmfoTQvn8mj6ohGzkO1IsGGFJX
         Td2CEWmYKJpMKfKEx+Ri1OEuJdgWhgtCbHdhZsHW6s4tlnQczLZv9Qgv+W+wY+QcV3EC
         05zLCpVGeUOfjRznntef7e+27z/yf6kV0dYrV2dn85R9lZmDaaGUDZqlaDhmVzvSxcHY
         QG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730051055; x=1730655855;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N63/GxDEd0wfP94caNCMDYpxPCrMq7BQqlGivmRDQpI=;
        b=mbQ56XL0VrgS22Qkxrl6Lc/ncdX/A96r0l44Wuf+6tJjH6L5VRCBzpTafX8usnjR4G
         XD7+YBwOg/cLqhdauYamCJ7rlsU76X6b8yEBCK0n5nSStq3S3lAdGTyH9/pLlgqEn9y4
         dF6Ta/hl1rzRoWmL39OoG8U00lwlOJb3L1fovnvnyp82yF2pd6OFoGhxVlikA35UA+22
         8Q9w32s4AuiHD2P5PZqOJfsYqb2xMfjnC0st7K4c/9xyo1w87aZy94djf7AT7ibuNQxU
         27OhbWHmRBQEnGC1C5XeXXlcJh941ENRPXeopIwdBrUaiXNqslL++V9LPqMt2JGx4Tel
         lInQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3nPwdIzPfVyDJ1k+CBa5aDf3FQL4MDf0sAhA48zOOIg9JUWG2+eo0MPpRo+RpSx1Liy9ZvdlKWjtcwyku@vger.kernel.org
X-Gm-Message-State: AOJu0YwYcAnflE044WD08bqJiSUI6kb7IfN9uEn+CGwXIky5EajCxlsD
	k/02bHPyNl26wUfsosYvqVhF0MoCiFDishW8/ErQrwbqpJRF47gQ0+3uu6DuvBg=
X-Google-Smtp-Source: AGHT+IEi/BxS5gMf/iVtcnfxqJkFsy//exVzbziM/ENyiYlUaB6IIu+67ZYUw4eK0ffqLydC7BaiXQ==
X-Received: by 2002:a05:6512:3404:b0:53b:27ba:2d11 with SMTP id 2adb3069b0e04-53b348cb2cbmr2582585e87.16.1730051054730;
        Sun, 27 Oct 2024 10:44:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1f4322sm825710e87.297.2024.10.27.10.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 10:44:13 -0700 (PDT)
Date: Sun, 27 Oct 2024 19:44:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, quic_ppratap@quicinc.com, 
	quic_jackp@quicinc.com
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Enable USB controllers for
 QCS8300
Message-ID: <fhgw2re45vn63lqox7vikg3hcak3wjf4wududebw7ow2enrqiq@inajq4l5qqir>
References: <20241011074619.796580-1-quic_kriskura@quicinc.com>
 <20241011074619.796580-3-quic_kriskura@quicinc.com>
 <xijjs445fzeuzbj2bg3ziwlzenrk4wo5zlyze4j5mldb444oj7@73ynic4xqfdj>
 <720aa372-a04b-4b0f-b2da-3be37a319ec9@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <720aa372-a04b-4b0f-b2da-3be37a319ec9@quicinc.com>

On Sun, Oct 27, 2024 at 11:59:44AM +0530, Krishna Kurapati wrote:
> 
> 
> On 10/26/2024 11:06 PM, Dmitry Baryshkov wrote:
> > On Fri, Oct 11, 2024 at 01:16:19PM +0530, Krishna Kurapati wrote:
> > > Enable primary USB controller on QCS8300 Ride platform. The primary USB
> > > controller is made "peripheral", as this is intended to be connected to
> > > a host for debugging use cases.
> > > 
> > > Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 23 +++++++++++++++++++++++
> > >   1 file changed, 23 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> > > index 7eed19a694c3..3e925228379c 100644
> > > --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> > > +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> > > @@ -265,3 +265,26 @@ &ufs_mem_phy {
> > >   	vdda-pll-supply = <&vreg_l5a>;
> > >   	status = "okay";
> > >   };
> > > +
> > > +&usb_1_hsphy {
> > > +	vdda-pll-supply = <&vreg_l7a>;
> > > +	vdda18-supply = <&vreg_l7c>;
> > > +	vdda33-supply = <&vreg_l9a>;
> > > +
> > > +	status = "okay";
> > > +};
> > > +
> > > +&usb_qmpphy {
> > > +	vdda-phy-supply = <&vreg_l7a>;
> > > +	vdda-pll-supply = <&vreg_l5a>;
> > > +
> > > +	status = "okay";
> > > +};
> > > +
> > > +&usb_1 {
> > > +	status = "okay";
> > > +};
> > > +
> > > +&usb_1_dwc3 {
> > > +	dr_mode = "peripheral";
> > > +};
> > 
> > So, can it be used as a USB host controller / connector? What needs to
> > be done in such a case?
> > 
> Adding vbus boost pinctrl and changing dr_mode to host must be enough for
> this case.

Could you please mention those either in the commie message or in the
comment before the board DT file?

-- 
With best wishes
Dmitry

