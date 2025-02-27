Return-Path: <linux-arm-msm+bounces-49611-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9E9A47460
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 05:24:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67B60188660F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 04:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF69F1E8330;
	Thu, 27 Feb 2025 04:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DMzwtVa2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C129188006
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 04:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740630265; cv=none; b=CeNy/0BkwpK4zzxDlUAiU/eFAPGslXHQsxsM/9AsJfXKAdwboKxXbDyQwSojHuyjOBRMejTgce24Uk4wXOOosdvZZbjnB0s5KtA7MaAT33B7b4/+toA5MxMehc5YQ7Y9HuqtuWFRN979hvB23Q93boxgp0Ome85yonrN0ZvjUR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740630265; c=relaxed/simple;
	bh=GQrep6THGEFfEeZwaQe//qMyhuL44R85HqtTXacsQwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZM7sG1o/8vJBB6clPhUUkaDticcAYI/1WkuOanhj4ss8b0bIZCr6JzP4hnz8gV8D1KHF2akuA/Mkxz0tQm7R+C3pULpO7U/DE6egQGcELX1SGMqrLRcHhRCzAJJjTPenCF7WvgCY8M7t/4ydTTwnPYI3otwNomVgSXdmeHroCe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DMzwtVa2; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-548409cd2a8so485031e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 20:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740630261; x=1741235061; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1BIKB82LpdlnmqrEnsr6U/nF5X3U1VHYp+Ab/GWMNqM=;
        b=DMzwtVa22NxQO9YGI0xsgmr0rkFQ+vrlYMyhRUxPmK5I4J0F3T7OGj3jIRozkW6gm7
         ZeHa+TSyKfqZf0KsOnnCW3nRi5742vhrclyx7sUvs8RvMgn2YNG6sEScfq4WDhHPzbax
         6iyWxNuWAwxWZEJtj1JSznhRJiw3+ANQOALH2nLbYLmc8s0wsg2YYGpEUOVmyZCedAtA
         4Hrf43IOt+23HXs3HgCuUeE6jEcPIN4juMjJtPiCI/9kDx1cGVrtTCP7mV7mni+bAN/R
         vkXQvwhoGDCe38G3wYOmysP8HYDm3fxFiJaFyb+glFZ61N2OT4kZ4CzD9HhLBBgsJaaa
         wsnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740630261; x=1741235061;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1BIKB82LpdlnmqrEnsr6U/nF5X3U1VHYp+Ab/GWMNqM=;
        b=B9i1nvCfOfv09kUx1lUW8HUSKIjZALkEVr+EFRNYZHkRKls9iCGT+t1qmaOxILx94k
         IqOSFjmO8n8ZuY9Wp7E575BOG5m47s0He2cgL5/tsybj73r+yQvOuu+jNHVsrFE45dfv
         R4FLqq3dqXvC3MJems+wo+c5XKrDdvdYjA5HAiXVtAYSejqXjfaN/tPizN2phcMRCynH
         RMr0ou1ZbQZGtt8CjSGYr6HGxzU5sj8bCxS51iFc4lW+3KUlhUZ/q52NQrINQohVEo08
         StGU7dYfSQeqiPffBepo+LQq06WqpqfRvY059t73duSCcxCWgECMbl7v5OGkxZtPApOA
         Xmtw==
X-Forwarded-Encrypted: i=1; AJvYcCVHYFGluewbDe914UxqiGNExK4+PxOeLdIqXHEx5Cr2xEmaIwrLNhTgP1p5liEZL3tEMaDyUGRgxdTZWfhZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxUS6t1KeOk56RhYCwWgtaE6SEu7pGbvD223rILTuCh7USkYaRI
	mFHCO1vTRm0nicP7HvelFBDmqbKYTCRpzqHY4CvBWoHGAlR37KRGGdQEObXeH3k=
X-Gm-Gg: ASbGncvjPef1vWrstF7N1xNtK8BV0P6Qcgfbq+N8EfKTp8eGkFNLsBfcg3TNgIDBYYt
	ujgG48YT8aQYRzXd/HtZhwR80zeIA6YOuCClAIzQpHITSZRZbvpIzWyN4lggVIFE3pTGSVVuVJS
	kAlvsjEDu/e9PGg+qtIOzC0c8LYTpZXDVOBWRGb46v6Y3kXFA4MBG+FvtTJczzm8YNTMjBil0KT
	nU8O+otCj5yZ6oDKZmns35JMcTg435Rqmok28u8ADqz1rgsAvfWq0nUb5DfZqqBeE27/Ia6A0hs
	37ZPWGPLkEmZL2Kl3HFluv+TLDqeA5kaQ0JiGmaLnRvPMKIHmXiC7ffsBmnAGCS0nmcJLrkBu9R
	W1eZDzw==
X-Google-Smtp-Source: AGHT+IGIniJ2q9dLlxOMrazyqcBa1KLqAlXIytyXZvZz/PtReLoH+1OdzX8tTefQVa3tCb4ZcXGA1w==
X-Received: by 2002:a05:6512:33cc:b0:545:1ce0:6407 with SMTP id 2adb3069b0e04-548510dd946mr5844511e87.27.1740630260622;
        Wed, 26 Feb 2025 20:24:20 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494417b7b3sm61383e87.100.2025.02.26.20.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 20:24:19 -0800 (PST)
Date: Thu, 27 Feb 2025 06:24:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Saravana Kannan <saravanak@google.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Frank Li <Frank.li@nxp.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/7] usb: dwc3: core: Don't touch resets and clocks
Message-ID: <w72zvfh3uf7crbkmuenxcjnu6moircjdy6rnbzszl4tjlm2jks@4z2k3iqt2ohi>
References: <20250226-dwc3-refactor-v4-0-4415e7111e49@oss.qualcomm.com>
 <20250226-dwc3-refactor-v4-3-4415e7111e49@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226-dwc3-refactor-v4-3-4415e7111e49@oss.qualcomm.com>

On Wed, Feb 26, 2025 at 04:17:50PM -0800, Bjorn Andersson wrote:
> When the core is integrated with glue, it's reasonable to assume that
> the glue driver will have to touch the IP before/after the core takes
> the hardware out and into reset. As such the glue must own these
> resources and be allowed to turn them on/off outside the core's
> handling.
> 
> Allow the platform or glue layer to indicate if the core logic for
> clocks and resets should be skipped to deal with this.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/usb/dwc3/core.c | 19 +++++++++++--------
>  drivers/usb/dwc3/glue.h |  1 +
>  2 files changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index d9f0a6782d36..aecdde8dc999 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -2328,6 +2330,7 @@ static int dwc3_probe(struct platform_device *pdev)
>  
>  	probe_data.dwc = dwc;
>  	probe_data.res = res;
> +	probe_data.ignore_clocks_and_resets = false;

Isn't it a default value?

>  
>  	return dwc3_core_probe(&probe_data);
>  }
> diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
> index e73cfc466012..1ddb451bdbd0 100644
> --- a/drivers/usb/dwc3/glue.h
> +++ b/drivers/usb/dwc3/glue.h
> @@ -17,6 +17,7 @@
>  struct dwc3_probe_data {
>  	struct dwc3 *dwc;
>  	struct resource *res;
> +	bool ignore_clocks_and_resets;
>  };
>  
>  int dwc3_core_probe(const struct dwc3_probe_data *data);
> 
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry

