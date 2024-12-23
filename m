Return-Path: <linux-arm-msm+bounces-43127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D009FADF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 12:55:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91E9B18842F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 11:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0CA1A3A95;
	Mon, 23 Dec 2024 11:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ij7g3eW1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9971519006B
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 11:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734954892; cv=none; b=rXc47yA5nMwl98Ok4UqUIi4I4rtCO4wMJUPvTE11ZmPhFflxxwFCDrqyjO2cPY7IiU9hYzALimvACryBjxx44zayMLR9lPhhPJQPFkC2UtC466z8drv8VN9udbJTiDQ4HtVXCt8u6QSGLaeW31x+XKXg2z0H4l5X2J8QrRb0M+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734954892; c=relaxed/simple;
	bh=BLyuPg8/wbTYTxEvfb5srOid45ArNtSm/NjnXO3uzoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JZoMaip70WhkGU9MD+hIOxUFMpwr+R/Dlb2rB3SFExWy5V2juXsvK6Xn2aB4RS07zCM4zAZudlKSBBihKNNquWtEO96NUm/A1hKqqUEvvqUQhHCNA2HEwXR2kVkwASQLVPrT//wpVMEfH7zjus/5k/gjdM0TbBLK1lAsBt7xLEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ij7g3eW1; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5401d3ea5a1so4229629e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 03:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734954889; x=1735559689; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3+jwbDtoVtKwBF8Oc10PBTbPC29IY38yVbu5FIsCHHg=;
        b=ij7g3eW1uDDFJGRKOXXshbVynsmoSxm1pbUBm8L1jZX5Rk8aOO39rJ9RP2/PCjZoAV
         F+TwFWt782nZQw4aLZrx2DaGnljBGIBWP9eLQ6ToWzHHu6+iUSATP7eoByUqmOGI90En
         CGsfwPcPQHaDZmVIBq/BW8YOz+lyDJWgWOncn4M+ksntn3CZrpX/JtshKOk59BHG+6oP
         RIuGX2kB3/vv1PKrNCQ4WoZQv6PLEfHjRTUDDjMtzpnZd7ONS3j1t7nMtBmY8eMj31KH
         DBvQsSL5ZeLY2b53uJstg+pRkaTmrAb5f5Apf/ucjIlQdhE8HmhyZlRfmu+boZ3vyvk+
         iEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734954889; x=1735559689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+jwbDtoVtKwBF8Oc10PBTbPC29IY38yVbu5FIsCHHg=;
        b=iiGAlTCwOxixSP0Y2r2dNII8UXojcjd3zB+stHceXp+V5tgT5Dc4+KULAqzNxElG6r
         cKuRRqfQbmbBuisVt7UIDZl/qR2DFlKO112paDdgzRsE+ZbNj7bBj2fuPzlrCaz6EFoi
         M0an331KaXXbMBsC94ISbMluLKBZwmJ0HsFU79mkp4Wb4rPevThN/VVec1smstx8GXvD
         6VCrhhCpeQdMjGPYf2NA2ggXzHBxihOnH9Ga8PCOZ+D3RT2WnZiXcTb9pF3QanbQggnn
         0+rclx7r0p7DXhDkXWi4VVEqykykLbfSHVMRhhvod1iOEtoZyWmiApS/PGCUZRP57Ar3
         pjqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5Hi2u3P9DwUWBPeXCHUqdnQ1eeLWoAEos/k6m+4yXbYXjQLNFs/xqNChrvGy4/XjTO03G19mr/Akf7kPp@vger.kernel.org
X-Gm-Message-State: AOJu0Yx77QOWhGkIR9H2F5oBa4i7fndlGm61myR9/Tk6/ExBlZNvEPdD
	ZbYnQi943VWt9fh0dIPpdnlmjWNMLKIGGOhcRxPj70qkEqQoO/X7uNQdhAQxxc4=
X-Gm-Gg: ASbGnctQgD1v58yDCGxGt5Az0N6MAyNehLRikjbR3j/G/u+CmqNeVGNEtZAzMxqhNpX
	p7Q/9ZNbtn5N/0ndhq8SqpKh6VH1R/atb7HL/iXdyE9v/iXJw3FnQBTFCXIKL/jzLcC7cHgGq6M
	7GX+lvHyUoZ2DXhyes7LVIPBGXcy+vWO4zCV7Vi5628UGbJnJVdEJ+IA7bmzub3QUgJynF5eii1
	JP/XRjztVB0WsFhxFwr3svnwpsTixzhViOU26toin82vUWcqjnfiUDPw7/xyFoYtGO5oq0P30x9
	xVOhqdGd+V/V4ed5Db4wyt/J+DCaaa2OZB9t
X-Google-Smtp-Source: AGHT+IHgkznHFCE0oE4dZjBLaQaWr27Qjn5XAujqFFNK/MnseaS1Hy38/C0iy2Xshg8Nfw4fVADUyw==
X-Received: by 2002:a05:6512:10d4:b0:540:23af:837e with SMTP id 2adb3069b0e04-5422955fc5bmr3470236e87.39.1734954888661;
        Mon, 23 Dec 2024 03:54:48 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238214a6sm1249965e87.195.2024.12.23.03.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 03:54:47 -0800 (PST)
Date: Mon, 23 Dec 2024 13:54:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: opp: Add v2-qcom-adreno vendor
 bindings
Message-ID: <rzhm6lkryxfqepgejpgmu4mr2z5qlzcvuptmmxhhndafc4kwlo@uw6eiw4cqlmd>
References: <mz4zpcr4tqh2w7vt75f4ofxjzfve54ozzgpdbi2jjzk5pdxbk7@t36tlt3mmprt>
 <d858dadb-4098-4c9f-b4f0-393dc988db5f@quicinc.com>
 <4426b4kybtac6rc4twa5pgm3hvlegofemvqjcrvh6ni7f5z2h6@5dnlv3hgywh5>
 <c5e868e1-2dae-466c-a6fc-ef0f247fa0ce@quicinc.com>
 <278e62e1-02a4-4e33-8592-fb4fafcedf7e@quicinc.com>
 <CAA8EJprgshjbNqNErOb06jqV__LmbWvocsK5eD8PQqL+FaLb1g@mail.gmail.com>
 <f67c72c3-7393-47b0-9b9c-1bfadce13110@quicinc.com>
 <CAA8EJppy+V9m-t_qPEJh2iTkC7tyDcf2y8wD9vYoHtFSp=HrkQ@mail.gmail.com>
 <982686bb-0ddd-45a2-b620-564af4f01800@quicinc.com>
 <16e1145c-6ef4-4274-a8f9-966f0edef9fe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16e1145c-6ef4-4274-a8f9-966f0edef9fe@oss.qualcomm.com>

On Mon, Dec 23, 2024 at 12:31:27PM +0100, Konrad Dybcio wrote:
> On 4.12.2024 7:18 PM, Akhil P Oommen wrote:
> > On 11/16/2024 1:17 AM, Dmitry Baryshkov wrote:
> >> On Fri, 15 Nov 2024 at 19:54, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> >>>
> >>> On 11/15/2024 3:54 AM, Dmitry Baryshkov wrote:
> >>>> Hello Akhil,
> >>>>
> >>>> On Thu, 14 Nov 2024 at 20:50, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
> >>>>>
> >>>>> On 11/1/2024 9:54 PM, Akhil P Oommen wrote:
> >>>>>> On 10/25/2024 11:58 AM, Dmitry Baryshkov wrote:
> >>>>>>> On Thu, Oct 24, 2024 at 12:56:58AM +0530, Akhil P Oommen wrote:
> >>>>>>>> On 10/22/2024 11:19 AM, Krzysztof Kozlowski wrote:
> >>>>>>>>> On Mon, Oct 21, 2024 at 05:23:43PM +0530, Akhil P Oommen wrote:
> >>>>>>>>>> Add a new schema which extends opp-v2 to support a new vendor specific
> >>>>>>>>>> property required for Adreno GPUs found in Qualcomm's SoCs. The new
> >>>>>>>>>> property called "qcom,opp-acd-level" carries a u32 value recommended
> >>>>>>>>>> for each opp needs to be shared to GMU during runtime.
> >>>>>>>>>>
> >>>>>>>>>> Cc: Rob Clark <robdclark@gmail.com>
> >>>>>>>>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >>>>>>>>>> ---
> >>>>>>>>>>  .../bindings/opp/opp-v2-qcom-adreno.yaml           | 96 ++++++++++++++++++++++
> >>>>>>>>>>  1 file changed, 96 insertions(+)
> >>>>>>>>>>
> >>>>>>>>>> diff --git a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
> >>>>>>>>>> new file mode 100644
> >>>>>>>>>> index 000000000000..6d50c0405ef8
> >>>>>>>>>> --- /dev/null
> >>>>>>>>>> +++ b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
> >>>>>>>>>> @@ -0,0 +1,96 @@
> >>>>>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>>>>>>>>> +%YAML 1.2
> >>>>>>>>>> +---
> >>>>>>>>>> +$id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
> >>>>>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>>>>>>>> +
> >>>>>>>>>> +title: Qualcomm Adreno compatible OPP supply
> >>>>>>>>>> +
> >>>>>>>>>> +description:
> >>>>>>>>>> +  Adreno GPUs present in Qualcomm's Snapdragon chipsets uses an OPP specific
> >>>>>>>>>> +  ACD related information tailored for the specific chipset. This binding
> >>>>>>>>>> +  provides the information needed to describe such a hardware value.
> >>>>>>>>>> +
> >>>>>>>>>> +maintainers:
> >>>>>>>>>> +  - Rob Clark <robdclark@gmail.com>
> >>>>>>>>>> +
> >>>>>>>>>> +allOf:
> >>>>>>>>>> +  - $ref: opp-v2-base.yaml#
> >>>>>>>>>> +
> >>>>>>>>>> +properties:
> >>>>>>>>>> +  compatible:
> >>>>>>>>>> +    items:
> >>>>>>>>>> +      - const: operating-points-v2-adreno
> >>>>>>>>>> +      - const: operating-points-v2
> >>>>>>>>>> +
> >>>>>>>>>> +patternProperties:
> >>>>>>>>>> +  '^opp-?[0-9]+$':
> >>>>>>>>>
> >>>>>>>>> '-' should not be optional. opp1 is not expected name.
> >>>>>>>>
> >>>>>>>> Agree. Will change this to '^opp-[0-9]+$'
> >>>>>>>>
> >>>>>>>>>
> >>>>>>>>>> +    type: object
> >>>>>>>>>> +    additionalProperties: false
> >>>>>>>>>> +
> >>>>>>>>>> +    properties:
> >>>>>>>>>> +      opp-hz: true
> >>>>>>>>>> +
> >>>>>>>>>> +      opp-level: true
> >>>>>>>>>> +
> >>>>>>>>>> +      opp-peak-kBps: true
> >>>>>>>>>> +
> >>>>>>>>>> +      opp-supported-hw: true
> >>>>>>>>>> +
> >>>>>>>>>> +      qcom,opp-acd-level:
> >>>>>>>>>> +        description: |
> >>>>>>>>>> +          A positive value representing the ACD (Adaptive Clock Distribution,
> >>>>>>>>>> +          a fancy name for clk throttling during voltage droop) level associated
> >>>>>>>>>> +          with this OPP node. This value is shared to a co-processor inside GPU
> >>>>>>>>>> +          (called Graphics Management Unit a.k.a GMU) during wake up. It may not
> >>>>>>>>>> +          be present for some OPPs and GMU will disable ACD while transitioning
> >>>>>>>>>> +          to that OPP. This value encodes a voltage threshold and few other knobs
> >>>>>>>>>> +          which are identified by characterization of the SoC. So, it doesn't have
> >>>>>>>>>> +          any unit.
> >>>>>>>>>
> >>>>>>>>> Thanks for explanation and other updates. I am still not happy with this
> >>>>>>>>> property. I do not see reason why DT should encode magic values in a
> >>>>>>>>> quite generic piece of code. This creates poor ABI, difficult to
> >>>>>>>>> maintain or understand.
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> Configuring GPU ACD block with its respective value is a requirement for each OPP.
> >>>>>>>> So OPP node seems like the natural place for this data.
> >>>>>>>>
> >>>>>>>> If it helps to resolve your concerns, I can elaborate the documentation with
> >>>>>>>> details on the GMU HFI interface where this value should be passed on to the
> >>>>>>>> hardware. Also replace "few other knobs" with "Delay cycles & Calibration margin"
> >>>>>>>> in the above doc.
> >>>>>>>
> >>>>>>> Usually the preference for DT is to specify data in a sensible way
> >>>>>>> rather than just the values being programmed to the register. Is it
> >>>>>>> possible to implement this approach for ACD values?
> >>>>>
> >>>>> Krzysztof/Dmitry,
> >>>>>
> >>>>> BIT(0)-BIT(15) are static configurations which doesn't change between
> >>>>> OPPs. We can move it to driver.
> >>>>>
> >>>>> BIT(16)-BIT(31) indicates a threshold margin which triggers ACD. We can
> >>>>> keep this in the devicetree. And the driver can construct the final
> >>>>> value from both data and send it to GMU.
> >>>>>
> >>>>> If this is acceptable, I will send the v3 revision.
> >>>>
> >>>> Can the upper bitfield have a sensible representation in DT (like uV
> >>>> or something similar)?
> >>>
> >>> Closest approximation is quantized voltage steps. So, unit-less.
> >>> Converting it to the exact voltage requires identifying the pmic voltage
> >>> steps and other stuffs which are outside of my expertise.
> >>>
> >>> It is convenient if we can abstract it as an integer which correlates
> >>> with the voltage margin that should be maintained for each regulator corner.
> > 
> > Krzysztof,
> > 
> > Could you please confirm if this approach would be acceptable?
> > 
> > To reiterate, move the lower 16 bits which is same across OPPs to the
> > driver. Abstract the higher 16 bits as number of quantized voltage
> > margin when ACD mitigation gets triggered.
> 
> I know I'm not Krzysztof, but given this is ultimately a magic value
> passed to the firmware, I'm a bit lukewarm on decomposing it and would
> rather see the entire 32b passed in a property, so that if a future
> target needs a different constant in the lower word, we don't have to
> pull our hair out again, trying to add more spaghetti logic to account
> for that.

Also obviously being non-Krzysztof, if we don't have a semantic value
for the upper half I'm fine with having the magic value as a single
instance instead of spreading it between two places.

-- 
With best wishes
Dmitry

