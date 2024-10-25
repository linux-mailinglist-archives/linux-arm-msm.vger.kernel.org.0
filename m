Return-Path: <linux-arm-msm+bounces-35805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A62ED9AF9EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 08:29:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB177280C68
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 06:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18A9219A297;
	Fri, 25 Oct 2024 06:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W04LpWCW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B065A18C346
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 06:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729837723; cv=none; b=C0AYa2nGcocYJpODfeiFEV7t8KAno4SJppSXebHFnsES8Iz/zgcbQeuIAssNUEkrCtoGtzh/xFmO3AXqgZTeSCAIqeq3vNW609FY1FgpODiiBTaXWXgZRnTNsR8FU0U4zS2tY56Z9LbozXRvsQpIaS7RcnN4F2zC4s1iEJlq8TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729837723; c=relaxed/simple;
	bh=WwQi+D7FjT7HiEmRpKp14FbmPnTWN2j43SBZvSVshyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H62b+XwWuUyP5HxV28EQghEzS8VWy2mE9QLAp1ibkl9ZQozCe+0B4CT6SU+Z40KDlzYPDIdldsJ9KgAdr8GBDAdfDl1atM1nPMsAVTlTpl3lrGK0rGqXuz4oMCKWq4pJ/JlQLxEjWvTzIUzi8u0Wlx/9IuWwYmfB7yMnDXdLJHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W04LpWCW; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb57f97d75so14696801fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 23:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729837719; x=1730442519; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ggQprwB+vTricRp85OZCHCZrtqv0PIzjtgOf5gOgeCo=;
        b=W04LpWCWQuZjfMkPWTQrU4/HaikbvKIpiqEpLXqphOSJrv1zbzBe2QCUuw2ErZqTa4
         yrvaXnhzCa05lOxWgaMb5u4Ixqp++MYK43m4XEFQb7KO0kiYakQTJEQWOtBvhTEyr5mm
         Ave5QkvQHrM2pVn0hE6oY/7Kawfg0axoGGsQ+MjcpyZoIT4pEfinkC9Jynli7XSK3Pw5
         WC1GZgkTKWiEg399U5rl+2OObi+6Wul59OmZkIrw1PxUyr1frTbi5RASxPIFvR4uJKdS
         KlVIZSWciceky5HKmbLgoiv1MKjW47HWwXrrhw0MpReWooQ0JYPBKfmlj1yfOn4s+vZP
         qk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729837719; x=1730442519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ggQprwB+vTricRp85OZCHCZrtqv0PIzjtgOf5gOgeCo=;
        b=h6aSQp/DoOPAXa1WbcvmXJAsiSBFn0pfuO1/vAesSXK80CEIkj2DIzTY3TvkHZwYum
         gbkD3Ck9fu5PFrX/Qjukbdep3pYCrWmNpVLgL6WFPD4MWF8fR+EfUbB35Ekbo5Mw7NxF
         r1G8mq1h0dQbg2qxSQJGiFYGnKCiZWbDu6BW65eWEnZKmkZQNWfTqls4uTIrRE9Naw/H
         OfXU7H6dec6lxUWE0NtSAp4U13rE9piSHAfTXXw8Qo5iIRkmDOI1Jz4AXgs3sBXxZ3rj
         oeR60dEwrUdjUwsUXfxHKmhkeTlFkfBOINBGGxfWFo1FAPyMx/3MOiICMG3eXbsVl5n7
         s1BA==
X-Forwarded-Encrypted: i=1; AJvYcCX3hGw7xdNgkvSky6mpgsat2l4vm0HQC1AjJvO1hVOVuydzGXTBVE0igR1UMq0z74Pujkli/RbT0COQmKB7@vger.kernel.org
X-Gm-Message-State: AOJu0Yw79GptgIg/dcV8t7g7FWOQh4mGoM1TQFUoHbylvhK7UbpHdopO
	lgWQHus/9/olh20C9zvMgW5jG4b0Gi2uhwpdD4vSUuVc7rsaOJKxSU8WQJ7B2m0=
X-Google-Smtp-Source: AGHT+IFaqSi3YpsyTfNZEHslT6tXnIucCTkmvLVJIORZGEveGd+wYqYmRBCEZV5qZEaTCrCcylcBhg==
X-Received: by 2002:a2e:b8c2:0:b0:2fb:382e:410f with SMTP id 38308e7fff4ca-2fca8227ddbmr26408121fa.26.1729837718711;
        Thu, 24 Oct 2024 23:28:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb4612a5asm703221fa.122.2024.10.24.23.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 23:28:36 -0700 (PDT)
Date: Fri, 25 Oct 2024 09:28:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: opp: Add v2-qcom-adreno vendor
 bindings
Message-ID: <4426b4kybtac6rc4twa5pgm3hvlegofemvqjcrvh6ni7f5z2h6@5dnlv3hgywh5>
References: <20241021-gpu-acd-v2-0-9c25a62803bc@quicinc.com>
 <20241021-gpu-acd-v2-2-9c25a62803bc@quicinc.com>
 <mz4zpcr4tqh2w7vt75f4ofxjzfve54ozzgpdbi2jjzk5pdxbk7@t36tlt3mmprt>
 <d858dadb-4098-4c9f-b4f0-393dc988db5f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d858dadb-4098-4c9f-b4f0-393dc988db5f@quicinc.com>

On Thu, Oct 24, 2024 at 12:56:58AM +0530, Akhil P Oommen wrote:
> On 10/22/2024 11:19 AM, Krzysztof Kozlowski wrote:
> > On Mon, Oct 21, 2024 at 05:23:43PM +0530, Akhil P Oommen wrote:
> >> Add a new schema which extends opp-v2 to support a new vendor specific
> >> property required for Adreno GPUs found in Qualcomm's SoCs. The new
> >> property called "qcom,opp-acd-level" carries a u32 value recommended
> >> for each opp needs to be shared to GMU during runtime.
> >>
> >> Cc: Rob Clark <robdclark@gmail.com>
> >> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >> ---
> >>  .../bindings/opp/opp-v2-qcom-adreno.yaml           | 96 ++++++++++++++++++++++
> >>  1 file changed, 96 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
> >> new file mode 100644
> >> index 000000000000..6d50c0405ef8
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
> >> @@ -0,0 +1,96 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/opp/opp-v2-qcom-adreno.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Qualcomm Adreno compatible OPP supply
> >> +
> >> +description:
> >> +  Adreno GPUs present in Qualcomm's Snapdragon chipsets uses an OPP specific
> >> +  ACD related information tailored for the specific chipset. This binding
> >> +  provides the information needed to describe such a hardware value.
> >> +
> >> +maintainers:
> >> +  - Rob Clark <robdclark@gmail.com>
> >> +
> >> +allOf:
> >> +  - $ref: opp-v2-base.yaml#
> >> +
> >> +properties:
> >> +  compatible:
> >> +    items:
> >> +      - const: operating-points-v2-adreno
> >> +      - const: operating-points-v2
> >> +
> >> +patternProperties:
> >> +  '^opp-?[0-9]+$':
> > 
> > '-' should not be optional. opp1 is not expected name.
> 
> Agree. Will change this to '^opp-[0-9]+$'
> 
> > 
> >> +    type: object
> >> +    additionalProperties: false
> >> +
> >> +    properties:
> >> +      opp-hz: true
> >> +
> >> +      opp-level: true
> >> +
> >> +      opp-peak-kBps: true
> >> +
> >> +      opp-supported-hw: true
> >> +
> >> +      qcom,opp-acd-level:
> >> +        description: |
> >> +          A positive value representing the ACD (Adaptive Clock Distribution,
> >> +          a fancy name for clk throttling during voltage droop) level associated
> >> +          with this OPP node. This value is shared to a co-processor inside GPU
> >> +          (called Graphics Management Unit a.k.a GMU) during wake up. It may not
> >> +          be present for some OPPs and GMU will disable ACD while transitioning
> >> +          to that OPP. This value encodes a voltage threshold and few other knobs
> >> +          which are identified by characterization of the SoC. So, it doesn't have
> >> +          any unit.
> > 
> > Thanks for explanation and other updates. I am still not happy with this
> > property. I do not see reason why DT should encode magic values in a
> > quite generic piece of code. This creates poor ABI, difficult to
> > maintain or understand.
> > 
> 
> Configuring GPU ACD block with its respective value is a requirement for each OPP.
> So OPP node seems like the natural place for this data.
> 
> If it helps to resolve your concerns, I can elaborate the documentation with
> details on the GMU HFI interface where this value should be passed on to the
> hardware. Also replace "few other knobs" with "Delay cycles & Calibration margin"
> in the above doc.

Usually the preference for DT is to specify data in a sensible way
rather than just the values being programmed to the register. Is it
possible to implement this approach for ACD values?

>  
> > 

-- 
With best wishes
Dmitry

