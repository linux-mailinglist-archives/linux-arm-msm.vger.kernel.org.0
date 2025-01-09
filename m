Return-Path: <linux-arm-msm+bounces-44641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BF4A07C57
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 16:47:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7CECA7A4805
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 15:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DB6A22339;
	Thu,  9 Jan 2025 15:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zLjXV+Sq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DAC21E094
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 15:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736437565; cv=none; b=L1lb1uwKiokYbhszGXdTT/w5NAuTN9VLWVY5keDY+70ImwNGNUDiUBB16gfYBPUlVy/eiXTMVXcs90V4vMuxfBvWq/uio6fueYy2OL3NYWUhG8n+jPu1qav8kX2AYzqv8jItLgGnJp9tTi2b6kqNZqeT/KWaz4pivvtmXDh6Dr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736437565; c=relaxed/simple;
	bh=BS/MX1QXS8P16euJNL/gkW579BFNpOJeMb4GcXH8A90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WI8FJn+gXp7qxsQeYcYdarMBt5QBHDOznQ2x1srA1JMx66ke2PTNJ5t2ENXY9nj891u45f39XY3OQcsfW0cHtIgyevgGWGcA9ehkvDGLxc4b2gjONi7hRNGCqBPNcf3dYKMlJ+4NL4ofYlYVMiWjNXriuSTXgenlHV0cejNsKeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zLjXV+Sq; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aaee0b309adso184808666b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 07:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736437560; x=1737042360; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lj7zF9yCT6iI8nTXFn7pM7jMwkdbgRLxACERXiTTYDw=;
        b=zLjXV+SqSeRCL0ALr1vSC4S6mqLyJu+LPt17nm6Q2NXmcTe+QbP0xaSfMZMLsVH4fI
         oDECkJNMo31PmBQyx0w8S0zZSJpoHb11xo+mb/W8igtCOv3dQZ8gLD7RY9mlZ4l2bgDx
         VW/9gf0Da+aojrMiXP4rIW1GB417rtC65qzC+1JB/VHamk3k5OxJYRsQLJ9kkubj+ZqL
         RhnKYJsZdi1s3UwJWMJwVxyUZn1+iSz39Z41VXwoCpSYKVPfQfwZYC1zK48RXF7ygQlg
         GwG9xfaFUc/Csj/6+CEZSCwJZl9Fjhrg6Asz0IIlVD53u78YgS2LGsmM0hBMCCI3GfB0
         AXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736437560; x=1737042360;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lj7zF9yCT6iI8nTXFn7pM7jMwkdbgRLxACERXiTTYDw=;
        b=e5pismbjxtUYcKketXkelHSWIZ0mWPIwCv4WpNh313wjmkfbfTKqYVnPhk68anDpO7
         E40voiZwcPizdTm0X4OGIwaPGerE7pv2iVu4ezsh2yBKFojAriyC7NooGcYrn8AnxScz
         G39DDGtX6ziMEfq748b86f4HeaTGBHewPT+70EHqk/3gzyvvwjYcnBDmrZIbDf7F6wPY
         vTD9+mQUWswDwhgw76iSwIqTOol3xa4Z0zM9VRKSIIlq25W1BJX60Lk0fv1CQ+HCN0yM
         udSH0mFHzyTCq+PUP9fF9ejnOvIMaFl4xuaP/DJIdsvjwzb2KxZN30wicN2IB3or42/D
         i4IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWn2rMUzsagleAvbQqRiG8TeccRL5M4y/RS0eI4muok4aPu3HcLUw/x57m0vvp/mwwJmscsgy6wyC4XzIJV@vger.kernel.org
X-Gm-Message-State: AOJu0YxVqvE/9Kz40LQes+Q0V3alS4nfj3fcn0mvWj6Riqq5slp9ATjo
	Ic63cO9MrTfkmPMfbWlTy64clxL+NQyu1GyUEeon5H1wy3aug3UMAa1xwVMCDJA=
X-Gm-Gg: ASbGncvE/prv14UA3Fx/rONDRT9KfjCQbnoKvevvC8rLeFLJNC8zoto76dG+4B0Xw5Z
	vtpHbaEK5NxFamefB6MUtNyjCiqswesSn93pz/RxX0Sf4PtCvz5HM67hyI0bnZ/+tBbTP26MRCH
	WglVcl1sJT2H/Xs9XtQ+bNUsKqhFXBinB33ovWlbwooYD6Cr2dUT3iiZSkfLDhSYf70Pp1mm8jI
	AvgVqHg3e6y3IqRxTmV7SKSt7Jzs3Wzo3/cyvG46T3V4363ftYOLGadocquduoL/f8u
X-Google-Smtp-Source: AGHT+IG9s1bF4yLCeTCYPm6xNv7HsJRyhyn0nm+PfjOfIoW5V8+Nrr1yYd+O5a84ncBZlJ+Vq51yNQ==
X-Received: by 2002:a17:907:72cf:b0:aa6:a33c:70a7 with SMTP id a640c23a62f3a-ab2abc8ecb0mr629646366b.49.1736437560082;
        Thu, 09 Jan 2025 07:46:00 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:ad4b:8bbc:31c3:a8b7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c905f067sm84488566b.14.2025.01.09.07.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 07:45:59 -0800 (PST)
Date: Thu, 9 Jan 2025 16:45:54 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100-crd: Drop duplicate DMIC
 supplies
Message-ID: <Z3_vMrFfdIne4yVl@linaro.org>
References: <20241203-x1e80100-va-mic-bias-v1-2-0dfd4d9b492c@linaro.org>
 <f65e1559-b409-4906-aabb-eb24b5b0fcf2@linaro.org>
 <Z1ATxAsXFhQraQwH@linaro.org>
 <afd010c9-8c24-482e-a479-2396f08c972b@oss.qualcomm.com>
 <Z1H1BHAeO-0832Ea@linaro.org>
 <6vfrlwir6sfommhn3met6wnjm76lnnxw4rdwzq75b7lzcy4jep@2cbcfvb3tvr2>
 <Z3-XoDgUgdS7DDvm@linaro.org>
 <0f9e456b-cd54-4496-a2d2-795aae744385@oss.qualcomm.com>
 <Z3_PPOwPNOPkZPkz@linaro.org>
 <4f0ca97e-ac6c-4b73-ab19-c91c6f3eb697@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f0ca97e-ac6c-4b73-ab19-c91c6f3eb697@oss.qualcomm.com>

On Thu, Jan 09, 2025 at 03:00:01PM +0100, Konrad Dybcio wrote:
> On 9.01.2025 2:29 PM, Stephan Gerhold wrote:
> > On Thu, Jan 09, 2025 at 01:57:17PM +0100, Konrad Dybcio wrote:
> >> On 9.01.2025 10:32 AM, Stephan Gerhold wrote:
> >>> On Wed, Jan 08, 2025 at 05:07:47PM -0600, Bjorn Andersson wrote:
> >>>> On Thu, Dec 05, 2024 at 07:46:28PM +0100, Stephan Gerhold wrote:
> >>>>> On Thu, Dec 05, 2024 at 06:11:47PM +0100, Konrad Dybcio wrote:
> >>>>>> On 4.12.2024 9:33 AM, Stephan Gerhold wrote:
> >>>>>>> On Wed, Dec 04, 2024 at 08:20:15AM +0100, Krzysztof Kozlowski wrote:
> >>>>>>>> On 03/12/2024 18:44, Stephan Gerhold wrote:
> >>>>>>>>> The WCD938x codec provides two controls for each of the MIC_BIASn outputs:
> >>>>>>>>>
> >>>>>>>>>  - "MIC BIASn" enables an internal regulator to generate the output
> >>>>>>>>>    with a configurable voltage (qcom,micbiasN-microvolt).
> >>>>>>>>>
> >>>>>>>>>  - "VA MIC BIASn" enables "pull-up mode" that bypasses the internal
> >>>>>>>>>    regulator and directly outputs fixed 1.8V from the VDD_PX pin.
> >>>>>>>>>    This is intended for low-power VA (voice activation) use cases.
> >>>>>>>>>
> >>>>>>>>> The audio-routing setup for the X1E80100 CRD currently specifies both
> >>>>>>>>> as power supplies for the DMICs, but only one of them can be active
> >>>>>>>>> at the same time. In practice, only the internal regulator is used
> >>>>>>>>> with the current setup because the driver prefers it over pull-up mode.
> >>>>>>>>>
> >>>>>>>>> Make this more clear by dropping the redundant routes to the pull-up
> >>>>>>>>> "VA MIC BIASn" supply. There is no functional difference except that we
> >>>>>>>>> skip briefly switching to pull-up mode when shutting down the microphone.
> >>>>>>>>>
> >>>>>>>>> Fixes: 4442a67eedc1 ("arm64: dts: qcom: x1e80100-crd: add sound card")
> >>>>>>>>
> >>>>>>>> If there is no functional difference and this is just redundant, then
> >>>>>>>> there is nothing to fix, so drop the tag. But the point is that users
> >>>>>>>> might want the low-power VA. You claim they don't want... sure, I am
> >>>>>>>> fine with that but there is nothing to fix in such case.
> >>>>>>>>
> >>>>>>>
> >>>>>>> The fix here is that two mutually exclusive power supplies for the DMIC
> >>>>>>> are specified in the device tree. You can only have one of them active
> >>>>>>> at the same time. The Linux driver handles that gracefully, but the
> >>>>>>> device tree is still wrong and IMO deserves a fixes tag.
> >>>>>>>
> >>>>>>> The functional difference is that we skip briefly switching to pull-up
> >>>>>>> mode when shutting down the microphone. Users won't notice that, but
> >>>>>>> it's not the intended behavior.
> >>>>>>>
> >>>>>>> I don't claim that users don't want to switch to the low-power pull-up
> >>>>>>> mode (VA MIC BIASn). However, we would need a different mechanism to
> >>>>>>> give them the option to switch at runtime. "audio-routing" just
> >>>>>>> specifies static routes, so the current description does not allow
> >>>>>>> switching between the two modes either.
> >>>>>>
> >>>>>> Is there no existing mechanism to alter this at runtime?
> >>>>>>
> >>>>>
> >>>>> I don't think so... Since it's currently exposed as two separate DAPM
> >>>>> supplies (instead of a mux or similar) you can only choose between one
> >>>>> of them in the static routes specified by "audio-routing" in the DT.
> >>>>>
> >>>>> I tried looking at how downstream handles this, but this left me even
> >>>>> more confused than I was before. :-) On CRD we currently have the
> >>>>> following routes in DT:
> >>>>>
> >>>>> 	"VA DMIC0", "MIC BIAS3",
> >>>>> 	"VA DMIC1", "MIC BIAS3",
> >>>>> 	"VA DMIC2", "MIC BIAS1",
> >>>>> 	"VA DMIC3", "MIC BIAS1",
> >>>>> 	"VA DMIC0", "VA MIC BIAS3",
> >>>>> 	"VA DMIC1", "VA MIC BIAS3",
> >>>>> 	"VA DMIC2", "VA MIC BIAS1",
> >>>>> 	"VA DMIC3", "VA MIC BIAS1",
> >>>>>
> >>>>> MIC BIAS and VA MIC BIAS are mutually exclusive, so this is not correct.
> >>>>> But if you look at e.g. SM8550 downstream they have:
> >>>>>
> >>>>> 	"TX DMIC0", "MIC BIAS3",
> >>>>> 	"TX DMIC1", "MIC BIAS3",
> >>>>> 	"TX DMIC2", "MIC BIAS1",
> >>>>> 	"TX DMIC3", "MIC BIAS1",
> >>>>> 	"VA DMIC0", "VA MIC BIAS3",
> >>>>> 	"VA DMIC1", "VA MIC BIAS3",
> >>>>> 	"VA DMIC2", "VA MIC BIAS1",
> >>>>> 	"VA DMIC3", "VA MIC BIAS1";
> >>>>>
> >>>>> Note the TX DMIC vs VA DMIC. So they specify one of the supplies for the
> >>>>> TX macro DMIC, and the low-power one for the VA macro DMIC. That would
> >>>>> be fine.
> >>>>>
> >>>>> Now the question is: If we can use the DMIC through both the TX and the
> >>>>> VA macro, and we're not doing voice activation, why are we using the VA
> >>>>> macro in the first place?
> >>>>>
> >>>>> @Srini: Do you remember why?
> >>>>>
> >>>>
> >>>> What's the verdict regarding this?
> >>>>
> >>>
> >>> We started discussing this, but did not come to a conclusion yet if we
> >>> should be recording from the DMICs using the TX macro instead of the VA
> >>> macro.
> >>>
> >>> The patch I submitted is still valid though, independent of that
> >>> question. Since we're not doing voice activation we want to have the
> >>> "full quality" MIC BIAS supply, not the low-power one.
> >>
> >> Can/should we discuss a new sound API to make this toggleable?
> >>
> >> Do these microphones physically connect to muxable inputs, or does this
> >> depend on board wiring?
> >>
> > 
> > The WCD938x codec has 4 MIC_BIAS output pins that are typically used as
> > power supply for microphones. Inside the codec there is an option to
> > drive these output pins in one of two modes:
> > 
> >  1. Internal regulator to generate the output with a configurable
> >     voltage (qcom,micbiasN-microvolt). Exposed as "MIC BIASn" supply in
> >     the Linux driver.
> > 
> >  2. "Pull-up mode" that bypasses the internal regulator and directly
> >     outputs fixed 1.8V from the VDD_PX pin. Exposed as "VA MIC BIASn"
> >     supply in the Linux driver.
> > 
> > The board-specific part here is only which microphone is wired to which
> > MIC BIAS pin (e.g. DMIC0 -> MIC BIAS3, DMIC2 -> MIC BIAS1 etc). 
> > 
> > Both options will work if the microphone can operate at 1.8V. In that
> > case, I think generally we want (1) for normal audio use cases and (2)
> > for low-power use cases (like "voice activation").
> > 
> > Apparently the same applies for the "macro" to use. TX macro should be
> > used for normal audio, and VA macro only for low-power use cases. With
> > that there is a clear mapping:
> > 
> >  - TX macro DMICs -> full power "MIC BIAS" supply
> >  - VA macro DMICs -> low-power "VA MIC BIAS" supply
> > 
> > I don't see why someone would want to change this mapping, so I don't
> > think it's worth making this user configurable.
> > 
> > Given that we're currently using the VA macro for normal audio, we
> > should describe VA macro DMICs -> full power "MIC BIAS" supply for now
> > and ideally migrate to using the TX macro later.
> 
> So, in short, if I understood you correctly, audio comes in through a
> hardwired connection to a given macro, but the bias pins can be configured
> to output the bias voltage through any of the macros.
> 

That's not entirely right. In our case here, the digital data from the
DMIC goes directly to both the TX and VA macro. The power supply comes
directly from the WCD983x codec. So the macro isn't involved in the bias
voltage at all. Perhaps a picture will help:

                             +------+                         
                        Data |      |  Power                  
                          +--+ DMIC |<----------------+       
                          |  |      |                 |       
                          |  +------+                 |       
    +---------------------+---+    +------------------+------+
    | SoC  +----------+   |   |    | WCD983x       MIC_BIAS1 |
    |      | TX Macro |<--+   |    |                  ^      |
    |      +----------+   |   |    | +-----------+    |      |
    |      +----------+   |   |    | | Regulator +----X--+   |
    |      | VA Macro |<--+   |    | +-----------+       |   |
    |      +----------+       |    |       ^          VDD_PX |
    +-------------------------+    +-------+-----------------+
                                           |             ^    
                                           |             |    

X inside the WCD983x is where we can make the choice, if we want to use
the internal regulator or output VDD_PX on MIC_BIAS1 directly. 

We can also choose to consume the microphone data either via the TX
macro or the VA macro. IIRC there is no mux for this, the data just ends
up in both at the same time.

Does that help explain it?

Thanks,
Stephan

