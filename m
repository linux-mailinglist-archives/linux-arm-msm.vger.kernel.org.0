Return-Path: <linux-arm-msm+bounces-70421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 424F2B317BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 14:26:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FD45177DD8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B27D2FB602;
	Fri, 22 Aug 2025 12:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wPI/W6Bw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636812ED866
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 12:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755865221; cv=none; b=p8XLK6emp//CILexnv3YX3XRm1lxIs6+Xxyi4rb2+87rD7ZdsHlA2bOaeQlhpz0efPeqceikgl1xmu06x9kPaUKMfHtrRj9JeDgjFScgV1sWUI0NU/l9ss5swUzhUAqWWgZBaTfSqSrL3iABozAwIOJ8ICTjyIlSLSeHWq1/FgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755865221; c=relaxed/simple;
	bh=E+jjXFPUMrxcYQGu8J7/hIVke/CYM0YElSc0SIVOFOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XiqXE3UXGmzVqkGAtmS6QkqUCgIAIQxsybta+hPPDcyfQQ7dsZNkzDaDNEhf5CGZwmrFKxHbLXkTH9f6Aotb3oCeYt4BtmhxG5pBMrfp6M1VP0/fOKrAb9x5ng0uS2Yvt/E570GLSqDdQHFnJVF3wgZhxWyG+SHwSYQyB1g2w9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wPI/W6Bw; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-afcb78d5dcbso304108766b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 05:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755865217; x=1756470017; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+xkZUgl3H4hv9cLVhOUAUwY3EVtx+RdpSL2hivLR0Zc=;
        b=wPI/W6BwthVlNUPNzLzufM9I6dgQ+h1SyWMvhGfL0LzVWF+kI2r3Zb5q+64B/QV7Y2
         /gsfJOqaYUHqX8p7SGu8AI/+7spslErOX875FLxq6b38z8zRq4UhqLR4CjeJ674TAnos
         HkMSEqC7KEyM/KJ0sFajav5NUz5hPMMX3qGwA+WIc2+fK4OudYr8H2a0sY03Ze0wf/FI
         WMwlzoWPLyGC9DNG6fUSneTiMFO6AKvgsyavST4n8Zu+q276rc+b8edwDm0NW25+u6nj
         bFBpB2Pi+sCAtfv7ock39Tu2EhG8nrKMafEVSRFXhhVYC4bR12TEoKKCf85LztA/I9M/
         yBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755865217; x=1756470017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xkZUgl3H4hv9cLVhOUAUwY3EVtx+RdpSL2hivLR0Zc=;
        b=wioDMEb6oHUqwzfUAgtBPjSdc7HtIzQhB4tOn9hSy3HjUa/gWgyH6PQmcBdaLTsqX1
         0u2vGcN2dfmgMt32X/aQ4npncs03J8tO6W1l+YRJ72lzljbRt5sOx8ks1WR7ot6JkZEm
         kvn4uzXJbR9HJNbnH6tSoydUotA3DgJdMrGcX4V48cU2nKsIcn4HMyVTUKfQbXoq4eRP
         oR2d1fPcXfBRuik6kJ0nTpXHBU87OzQDrIoo9T3rd7RyNdfMoG4KHZgv3OXQXkKP775e
         RHvd3wE1IahnZn0ZdkwXgKKT/SOpWjrh0kT4MPT0QfzsFZ3mh5DIX4t9ZfOUGYavrnd7
         jZFw==
X-Forwarded-Encrypted: i=1; AJvYcCUUo9RpiQo+dr0wZwMSJ4kVSSr0m2oO3ODer3wIZkvgT6NOL/a0kbbJ2BwM8n5oGKUsod6I5mmkc3ZRLs8C@vger.kernel.org
X-Gm-Message-State: AOJu0YwiQ7L+6rnTsrgzBWp02vRvzlqMJolEdEZDafQUr+UtbhfOXhR5
	NWrXuZRdBG89jIZirfzGTtF9A6X4yuH8Ce8LdX9PKNnC3x2+U+TWiVNyQts7cZBKTps=
X-Gm-Gg: ASbGncvxlWn9U66y3ouRvfnV9u3K0OxOSnkDq8x0FAd+6ro+h6iDwY38amIVNRU+ove
	afXdk/Abi7GlNNPJD9eJ+oW2LvNbJzbU9J5H9WLGMRvmEey6QOmae+LO3SOw9rpkHeqzwDbIzit
	vhgfMpFFFBeX/n9npdPoe811UjS0/yZ4ygLpVqTTtkevWEQl3vsyXkDNh7iMDnSETGTsrVc9383
	0Fsn8vIg1bigULuiGSRwXEdgK1iqLON3S37qrrBBc9Xl8TPAg7ZlbKuY+tRiAwBfybLfBdv019N
	jIuhYrjD//JoTr1/mKsmknoHXuyfiERf32YDqxqwgadzrnFs9P5N00BovBXVKqR9tC6DsLiXN21
	BWX1Fo9hNlk12Ym/W2YFr4G5DOqycv5f/9JE5PFfMkaAP
X-Google-Smtp-Source: AGHT+IH5MaDGOj90Ebe5kfSzujnkbY69jrqA+f32eLf+heWKCPnDNRvGCa6CIbti/l7iOXpa0qJl/g==
X-Received: by 2002:a17:906:6a1c:b0:af9:9ab0:6f3a with SMTP id a640c23a62f3a-afe28fd7ec3mr252586066b.23.1755865216613;
        Fri, 22 Aug 2025 05:20:16 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:63f:a353:7a5a:5beb])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded4cab98sm604993966b.89.2025.08.22.05.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 05:20:16 -0700 (PDT)
Date: Fri, 22 Aug 2025 14:20:11 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/3] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s:
 add HDMI nodes
Message-ID: <aKhge2ngLwj4uhmC@linaro.org>
References: <20250821-topic-x1e80100-hdmi-v1-0-f14ad9430e88@linaro.org>
 <20250821-topic-x1e80100-hdmi-v1-3-f14ad9430e88@linaro.org>
 <as7pbmhfgsg3ht3s5lu25pfjjamaxyonuohkuohono3kr2mxii@posspuko4vwa>
 <aKhYYjUuOQ7H1aPm@linaro.org>
 <26j2trl7lypmqzjnw6kwgqz32eqcags34qpgaua7zbwxd4lbgx@n54gemj42xbd>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26j2trl7lypmqzjnw6kwgqz32eqcags34qpgaua7zbwxd4lbgx@n54gemj42xbd>

On Fri, Aug 22, 2025 at 02:57:24PM +0300, Dmitry Baryshkov wrote:
> On Fri, Aug 22, 2025 at 01:45:38PM +0200, Stephan Gerhold wrote:
> > On Fri, Aug 22, 2025 at 02:01:30PM +0300, Dmitry Baryshkov wrote:
> > > On Thu, Aug 21, 2025 at 03:53:28PM +0200, Neil Armstrong wrote:
> > > > The Thinkpad T14s embeds a transparent 4lanes DP->HDMI transceiver
> > > > connected to the third QMP Combo PHY 4 lanes.
> > > > 
> > > > Add all the data routing, disable mode switching and specify the
> > > > QMP Combo PHY should be in DP-Only mode to route the 4 lanes to
> > > > the underlying DP phy.
> > > > 
> > > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > > ---
> > > >  .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 44 ++++++++++++++++++++++
> > > >  1 file changed, 44 insertions(+)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> > > > index 4cf61c2a34e31233b1adc93332bcabef22de3f86..5b62b8c3123633360f249e3ecdc8ea23f44e8e09 100644
> > > > --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> > > > @@ -62,6 +62,20 @@ switch-lid {
> > > >  		};
> > > >  	};
> > > >  
> > > > +
> > > > +	hdmi-connector {
> > > > +		compatible = "hdmi-connector";
> > > > +		type = "a";
> > > > +		pinctrl-0 = <&hdmi_hpd_default>;
> > > > +		pinctrl-names = "default";
> > > [...]
> > > > +
> > > > +		port {
> > > > +			hdmi_con: endpoint {
> > > > +				remote-endpoint = <&usb_1_ss2_qmpphy_out>;
> > > 
> > > Please describe the transparent bridge too. It can be covered by the
> > > simple-bridge.yaml / simple-bridge.c
> > > 
> > 
> > I think this isn't the case here(?), but how are we going to handle
> > devices where we don't know which bridge chip is used? I've seen at
> > least 3 or 4 different chips already across all X1E laptops and we don't
> > have schematics for most of them.
> 
> Open the case, inspect the board, identify the chip. Everything is as
> usual.
> 

The chip might not have any visible identifier. :-) But I guess there is
no point theorizing about such potential issues now. We'll see. I agree
it would be cleaner to have the bridges modelled.

Thanks,
Stephan

