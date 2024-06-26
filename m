Return-Path: <linux-arm-msm+bounces-24207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E3791776B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 06:33:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 980CA1F23B3B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 04:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F40B713E02B;
	Wed, 26 Jun 2024 04:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RFI+a1Ca"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8205313D28C
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 04:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719376291; cv=none; b=kqzaVmSGOWQN6tTSXiPJHRt5h+6vEz5xZMKFZrfeV+YYH0Xn8MoCXCl0tyncKn3nMHBGD0HXhlkfB/nYYd0VKwlvKRa+6GJ5vIyTFFXaETQIyDQyuKtWVBJd3ZiSIR15q5/9jbI60XDI3Uvx8qLoeClSv0nZLRMa6GnfGQ9UXr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719376291; c=relaxed/simple;
	bh=adfuNxru1U6BeAy7pQ0mgIrjzsGqUpk7soP+iYRkcEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LL5gWSWspXY+5E0BqFzSiHfRm+XAYi/3PxRsHOKm62l5JPV9nnxvrJwSHBwJ3b3wExbeekBqHXqF+gTeX7VmraqwHFt4KzypyTWq+Juh4o5KjnkhDkbtEw8ndI834Th+9215Q67nPmgic1E0NsTXXShINVByTCQN6GglB1Uawco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RFI+a1Ca; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52caebc6137so5886683e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 21:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719376288; x=1719981088; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qDMOY6eglp03mIp9Xp9m5yyz1aKQNtppCZRvZo0tS5E=;
        b=RFI+a1CasWZa+RskgS+lmPtq0DDZcIc7pvm3d88xNl35yMzs98bGuh5pn9sHIlJo+G
         ER977FKHvff0gzOXIXvii3U1vJYen3YIUwViih6ULy7RaFqekE/xUARQCtFVAys54AnF
         oZhPXU9x5rAGnl26x70uYMNjEwROnXg6GtxHhK2LC1wRSOoFfLhtFYuZMStxZBjRQdVO
         MlzvGaBQBAVXy0N51I04KTV4GCbCHpJXyylgIG5+w/aWMa1BAtoPieqf2MvLQOgWBf9T
         8mdbEYhmggKVuUzxO0SsSo8JkMzoYabMb7qWh5JTuw0zeFlcBsCPeE2QSrrj8yD7fZyR
         jAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719376288; x=1719981088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDMOY6eglp03mIp9Xp9m5yyz1aKQNtppCZRvZo0tS5E=;
        b=QPOVAh60zqzbAjqGGW2xf341Ra7IqgoE1Z6epY1shzkws8bgZyzC9O/58VZ7CiLe7W
         fKkOmS2u0NK3Tz67RicE9ARrL0na1AqcWuGNIlNw/ITg3Jma95Vek46Uy9Do/dJB4LyS
         7PcM4oAvlk4TAv2FVW2eJ6Hw669T7lUkp0sw1WpdoG126F2vKAdB5vn5gSKsT5mTUjf/
         tleBXkuMOceSFJPShuKIp5UpI4dazzSwCceyetlce8pHVd1gJeCoYW+WwPmxe99r/fwz
         C6f9evV/lm3bz6c/8vX1IdhY2gsTuA9C7OAnAGdIs3c77jd75e6O4wiHc7ZEyLSnVVWe
         VcRA==
X-Forwarded-Encrypted: i=1; AJvYcCVjP0kfLB+f9xklJaWTtnLGwGTt2Ll7HVi4VYBZE+v+6qZzcFlqU3FGbCuqNueU+3KG3ifqnHJjaE/7zYF9cn4yAn2ReXFdRXTYAWw3oQ==
X-Gm-Message-State: AOJu0Yz4wNXqRJLu0E9/YMnrJFuizLMJ0wfwk3WyjLt9862krUFT6Eh4
	ETRzShA6ui6cDzommxmuUkCfY8tV1+s1QXelY0rIlzPk/r0uqJCCq2FuldCrP0g=
X-Google-Smtp-Source: AGHT+IEJDJbJ0nmjp0FdUDEdV4/Bu3Xu/XaM3QtCeSYzxL+1CRkCFEiMq1C2y/BjX9CIR2z91E+1Wg==
X-Received: by 2002:a2e:9684:0:b0:2ec:53a8:4b3e with SMTP id 38308e7fff4ca-2ec5b387fcamr53011001fa.38.1719376287461;
        Tue, 25 Jun 2024 21:31:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec67316e57sm4088891fa.103.2024.06.25.21.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 21:31:27 -0700 (PDT)
Date: Wed, 26 Jun 2024 07:31:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: Re: [PATCH] dt-bindings: display/msm/gmu: fix the schema being not
 applied
Message-ID: <vuzzs5xd2zacpamln7apyhnxebg3xadkagzheg5cz2fnuj2ggc@lancgcviktpy>
References: <20240623125930.110741-1-krzysztof.kozlowski@linaro.org>
 <20240625225127.GA361957-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625225127.GA361957-robh@kernel.org>

On Tue, Jun 25, 2024 at 04:51:27PM GMT, Rob Herring wrote:
> On Sun, Jun 23, 2024 at 02:59:30PM +0200, Krzysztof Kozlowski wrote:
> > dtschema v2024.4, v2024.5 and maybe earlier do not select device nodes for
> 
> That should be just since db9c05a08709 ("validator: Rework selecting 
> schemas for validation") AKA the 6x speed up in v2024.04.
> 
> > given binding validation if the schema contains compatible list with
> > pattern and a const fallback.  This leads to binding being a no-op - not
> > being applied at all.  Issue should be fixed in the dtschema but for now
> > add a work-around do the binding can be used against DTS validation.
> 
> The issue is we only look at the first compatible. I'm testing out a fix 
> and will apply it tomorrow assuming no issues. With that, I don't think 
> we should apply this patch.

I think we ended up picking up the next iteration of the patch, but we
can probably land a revert later.

> 
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > 
> > ---
> > 
> > Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > ---
> >  .../devicetree/bindings/display/msm/gmu.yaml         | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> > index b3837368a260..8d1b515f59ec 100644
> > --- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> > @@ -17,6 +17,18 @@ description: |
> >    management and support to improve power efficiency and reduce the load on
> >    the CPU.
> >  
> > +# dtschema does not select nodes based on pattern+const, so add custom select
> > +# as a work-around:
> > +select:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - qcom,adreno-gmu
> > +          - qcom,adreno-gmu-wrapper
> > +  required:
> > +    - compatible
> > +
> >  properties:
> >    compatible:
> >      oneOf:
> > -- 
> > 2.43.0
> > 

-- 
With best wishes
Dmitry

