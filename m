Return-Path: <linux-arm-msm+bounces-25883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFD792D8B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 21:03:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7949BB228AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 19:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9BF97BAF7;
	Wed, 10 Jul 2024 19:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CEevvTM2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151A119753B
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 19:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720638196; cv=none; b=bNmnl14LWz2QfnGOpcVMBnSV55n8RD1NqxlheQ6onDUvFiagcuKVqWLRfGrTgp6thd93GVhRuGqcSQTMRifsPSjO45wPWX4AIGR2FkEvmqUP6W91GW7LSs5g0i85Eo/eQOa2tsXbf+Y93rClAyvoX3KMbKrlgnRi37ibfgtLvNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720638196; c=relaxed/simple;
	bh=3d7FSi9Hcl0cdnxEUaHj4eTaDqmo6qk52W+AULnYB6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MWJWYwQAqV+cdWNWV7E4+1aUkB82lwQWrIVzIuLenXPoFOI10mJusApa5K6SL24XQPtyBWHMOPkvj/t0QYYn0T+zsHORKdv8oxFOn+228RhH0EXffguXUmNBcFcCdGed6SSil676xNmFwEhOFTNve1Y89+ssGKFHKdV7+GzfqyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CEevvTM2; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4266f3e0df8so600135e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 12:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720638193; x=1721242993; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0zjwLVxsSVCJgFEWP9NFLGfREZ7pPp0SWHJc73R22HA=;
        b=CEevvTM2CaEtOXJr+Z0HWaUAbgnXFEJamMk3ldKT/UL2ic5msqIAiy7gi0RhIEQ8HV
         1sXUdLYtSl7I2nP10mBwoGep3vI30T56+wm0EwH8GDpn9S8bMUR90hroEpVVoKpSNogN
         fk/wfM51Aifzx8OAxXOxQY1FwdagHYb1PcMgAtVN6j4LGq7sFvQvGBbS1rhnmZgU5qGA
         JO5HxmYmKJPI24u99pjB+jtpJsCthfxt1xkknagkUPrJJ4teUbkBS8YVyLGWMdEti7U2
         xpryqJ5f29i/Qqq26V0p0jkYs3j9wJdjNAo2M2QiOptLp4soSLgPcXmztP+UBHviQZi4
         pjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720638193; x=1721242993;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0zjwLVxsSVCJgFEWP9NFLGfREZ7pPp0SWHJc73R22HA=;
        b=Eh5CMDMTgYS0zPtQvhdos4jbqAdL+SjKL0oRR1+iQgW1EU1y+4RU6Y8Ls3XN/IF33T
         SdtEHD/l2YvOVYpLbQ6fArPM//SxoGth5DTTwg70Eao/8Cayr16RwvsK1941BGScnaj+
         bxVW4gpQGvrJbVgk4Qguz2CgFaccgKhyItAd4wiAx5+qOvA7+behwxJQS967D4qOwDjd
         G5XeRxAr1GJgOKHDSgfR7704JRXJtjwkycwd3mMDQc+SFDCIvkfpguRZ7Gxk+vc+snM/
         3XF8RparkBiACF6uqckL5Y/vZKm7MjF2g0t1fP+OJZGxrV+RnsU65C6a5VhGM99xyza0
         9KEw==
X-Forwarded-Encrypted: i=1; AJvYcCXYbc8tpmenzli3B/+BLDQnJEyNVol80InwmwZffWz5f3MfptItSk7UrvEYaPxHCUZWGFuPrM9CqEx8Sco+SzgU+vavqOElKw1tIGJWMQ==
X-Gm-Message-State: AOJu0YyUX6DVClOdpGCfQf71Ysn7/Bt0Fz9Zx8E2BPDSOvEgwN/KPB56
	m+alzziFfLURYun8LYBJJHNzpOZkzGNiqoWzOoCPgTUTR7mA4iTsHJjLZMuO23Q=
X-Google-Smtp-Source: AGHT+IExUAfzX0VoKakNYezADDA6Ffrq1A7HPVyOijOdE6adHeuyL79HjX9TXAmqMlMfUj5GJI4TPw==
X-Received: by 2002:a05:600c:68c:b0:426:6960:34b2 with SMTP id 5b1f17b1804b1-426708f9b36mr39492695e9.33.1720638193372;
        Wed, 10 Jul 2024 12:03:13 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff1f:b280:236a:cbae:b7ec:1f7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfab182sm5890728f8f.94.2024.07.10.12.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 12:03:12 -0700 (PDT)
Date: Wed, 10 Jul 2024 21:03:06 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: display: panel: samsung,atna33xc20:
 Document ATNA45AF01
Message-ID: <Zo7a6qso7RZ2pkmb@linaro.org>
References: <20240710-x1e80100-crd-backlight-v1-0-eb242311a23e@linaro.org>
 <20240710-x1e80100-crd-backlight-v1-1-eb242311a23e@linaro.org>
 <CAD=FV=XJuV12mStW3eUm5MHG8BA9W_fn0skN=BrtmqC+fnCZig@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=XJuV12mStW3eUm5MHG8BA9W_fn0skN=BrtmqC+fnCZig@mail.gmail.com>

On Wed, Jul 10, 2024 at 10:35:28AM -0700, Doug Anderson wrote:
> On Wed, Jul 10, 2024 at 10:05 AM Stephan Gerhold
> <stephan.gerhold@linaro.org> wrote:
> >
> > The Samsung ATNA45AF01 panel is an AMOLED eDP panel that has backlight
> > control over the DP AUX channel. While it works almost correctly with the
> > generic "edp-panel" compatible, the backlight needs special handling to
> > work correctly. It is similar to the existing ATNA33XC20 panel, just with
> > a larger resolution and size.
> >
> > Add a new "samsung,atna45af01" compatible to describe this panel in the DT.
> >
> > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > ---
> >  .../devicetree/bindings/display/panel/samsung,atna33xc20.yaml       | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
> > index 765ca155c83a..d668e8d0d296 100644
> > --- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
> > @@ -14,7 +14,11 @@ allOf:
> >
> >  properties:
> >    compatible:
> > -    const: samsung,atna33xc20
> > +    enum:
> > +      # Samsung 13.3" FHD (1920x1080 pixels) eDP AMOLED panel
> > +      - samsung,atna33xc20
> > +      # Samsung 14.5" WQXGA+ (2880x1800 pixels) eDP AMOLED panel
> > +      - samsung,atna45af01
> 
> Seems OK, but a few thoughts:
> 
> 1. Is it worth renaming this file? Something like
> "samsung,atna-oled-panel.yaml"? I'd be interested in DT maintainer
> folks' opinions here.
> 

I think examples for both approaches exist in the kernel tree, so I am
also interested in the opinion of the DT maintainers here. :-)

> 2. In theory you could make your compatible look like this:
> 
> compatible = "samsung,atna45af01", "samsung,atna33xc20"
> 
> ...which would say "I have a 45af01 but if the OS doesn't have
> anything special to do that it would be fine to use the 33xc20
> driver". That would allow device trees to work without the kernel
> changes and would allow you to land the DT changes in parallel with
> the driver changes and things would keep working.
> 
> ...and, in fact, that would mean you _didn't_ need to add the new
> compatible string to the driver, which is nice.
> 

Yeah, I considered this. I mentioned the reason why I decided against
this in patch 2:

> While ATNA45AF01 would also work with "samsung,atna33xc20" as a fallback
> compatible, the original submission of the compatible in commit
> 4bfe6c8f7c23 ("drm/panel-simple: Add Samsung ATNA33XC20") had the timings
> and resolution hardcoded. These would not work for ATNA45AF01.

Basically, it works with the current driver. But if you would run the
kernel at the state of the original submission then it would behave
incorrectly. This is why I considered the resolution and timings to be
part of the "samsung,atna33xc20" "ABI". The new panel would not be
compatible with that.

I don't mind changing it, if there is consensus that we should ignore
this and use the fallback compatible instead.

Thanks,
Stephan

