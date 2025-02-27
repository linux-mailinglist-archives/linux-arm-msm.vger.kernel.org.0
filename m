Return-Path: <linux-arm-msm+bounces-49733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D85A4848C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 17:17:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E47783AC22B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 16:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8374F1B4241;
	Thu, 27 Feb 2025 16:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R3fqiv1Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFB31B3950
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 16:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740672464; cv=none; b=C4twPmLmOY9ZGHEIxXQdtX+sKAxdGAsvBvLrVSUDr4w82IFqrpepL2BEOU4RKHhghDKvb+YfMefKWO4hU+OpgCl/VMDMnKpP10+7JTwxMtkA1Kri47jOV6e9doRD8cZ7LIC3UMIeavUifFNBRlSPExqPJPGzf/bNw/73WZPsaPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740672464; c=relaxed/simple;
	bh=CWV28ba7/pK0pfEMDt6BpVkKjS1yOP/DZbLPMFCESts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HrukfdPqyzBeZuOqXnOq1iVgKS+EqnG04T9dMpv8FfveERQBdVSMPdpDHJNgKCCiKjpGeCGqaEWcG6hBzy26Rsqp/eHlLDSUHNYuAyDkC05+0E3LuuJ6DMSANeuVYMcTIwyKTvob2j3Od202u4dtPgzo2wRRGJ19YWWl8GiOy8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R3fqiv1Y; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3091fecb637so9962691fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 08:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740672460; x=1741277260; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xb088OdXJlTA9IPSpcKjiPeuNEBwco6JwP3ohVxG/tQ=;
        b=R3fqiv1YYZSIwyl573OWxgWA4kDjbCNBiTwSx+oI6zNaYF/DkAMuPWNbIdv8+mAUQC
         2wFfrTFS5AujvsmQali8BzjoP5jSjo9ocbc8B+9T7GivCk1QaAWGvYl8APZ+0sA5S2uJ
         odT3J7tRzrUvKo32MxFbAXISg228wgNa9Pi2ZdupkV8eHSojiYg3saYGfyF/qPZZ9OIs
         Ln+f/R2GLB6yqctHEhDp6Q38OacpgM3CfY6vDndLlRLUCEtd9aL3zkW0iMJK7V5QxpT8
         2m0ss6qr14x+k2NpFE1ZPMih9GXAXFBygivBcdBo8WgZFEqKAUEcLuLU+sEKlEUZeVYZ
         xOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740672460; x=1741277260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xb088OdXJlTA9IPSpcKjiPeuNEBwco6JwP3ohVxG/tQ=;
        b=w7JwmB6IDX//MxcV9gbgPm+nakHPr/BFY00TRncXJx4tuV5KUrtQP1xL1EdPlzY5dq
         c21fzQQp2VM8AiNoWcKGgRnhV3hArQD9z5x5Fry2AjJk6jvy/N7xbX4+BJACDVCmXFV5
         8djNoBtF/WNd/h14YrDv08lKZVEp1NjE4nSLxRVDLqcV4ZyJqEgSozoosaLygbTP3jqi
         Z+QjtDbSOtoIgRhpYnEIt3MLxDhInA2rJjDWW0hjeCYyWQL1rludZOck/i/b+yXO1qfn
         Pe4+eQRgWcJD+kDT2CG03ytIeoWBNJ/jaL8RTC+Q6BoLSXWvtYjRH+PvUTXOuqf2+a6z
         W2MA==
X-Forwarded-Encrypted: i=1; AJvYcCXKCWwe30FFC2r2ue+CIkIhw567qGAn9/kRThDKIEc6ym952qX6gEmcvk5I9IyBMF1I8oAKO4fEzLptk7dQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxWLknpjxyDTLtuu7E//aGoVFmDSqnvLC+34CEjuHEQyRjWgZjW
	4p5T/2OBcoR32ONyvl3gsT/Hk9iAUXfHFyJtTFsWsy6y8igSvsvpBjZWTVVVYh8=
X-Gm-Gg: ASbGnctjubtOfSOif01nA0QB2I24BN4HxLuIwfYnCrSp4QrHkOI2ckUyWqZQ8JrKn9Z
	3DFOpblAwtbX2zQGvYnlCXRM1LNcd2pQ8/WAlqXUbicraIA1EdJFT/1llTHwoUnGkiU3eDV+WMN
	On2Y9KvRdtsLW21KWzdiIPTCQ3Gl51IbHOoDF2nbR3zq7niuxERcHhCxnoegSmDcucXQttvJWnd
	FodpbVEGEYocRf82OP6SFmx/SzgLt8U9Q8gtrfoOd788wAt6GOS2cFuPfi4JkQcVoi/dqSSu3Bi
	/f0O5eIhUuezpXRrHcW2bHPJX5rxQQA84C9jLo0j3g9InD+QA01EkKP3F2K5x6QEwZV6Mfktnmp
	ql7vsNQ==
X-Google-Smtp-Source: AGHT+IE2tBs2MLi0CVU9yzfVsEhz9N65BqwobeMX6DA+APv9dvpZztToWRbeHRYswXJcbcUI2FoZ8A==
X-Received: by 2002:a2e:b607:0:b0:309:2747:e30 with SMTP id 38308e7fff4ca-30a80bff08amr59492871fa.10.1740672460272;
        Thu, 27 Feb 2025 08:07:40 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30b8688a8e3sm1946411fa.112.2025.02.27.08.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 08:07:38 -0800 (PST)
Date: Thu, 27 Feb 2025 18:07:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Felipe Balbi <balbi@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Saravana Kannan <saravanak@google.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Konrad Dybcio <konradybcio@kernel.org>, 
	Frank Li <Frank.li@nxp.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/7] usb: dwc3: core: Don't touch resets and clocks
Message-ID: <x45slyuz5bboqzqdyhgd22dx4vfsam6unvzymrmjvunef7cpfv@ixqrlvyzt4jp>
References: <20250226-dwc3-refactor-v4-0-4415e7111e49@oss.qualcomm.com>
 <20250226-dwc3-refactor-v4-3-4415e7111e49@oss.qualcomm.com>
 <w72zvfh3uf7crbkmuenxcjnu6moircjdy6rnbzszl4tjlm2jks@4z2k3iqt2ohi>
 <6v2kyk3rhss4itvo4dhwxyf3mp7ey7gh5abaklgwa27b4fw6ce@ofyuo3ortl4p>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6v2kyk3rhss4itvo4dhwxyf3mp7ey7gh5abaklgwa27b4fw6ce@ofyuo3ortl4p>

On Thu, Feb 27, 2025 at 09:55:29AM -0600, Bjorn Andersson wrote:
> On Thu, Feb 27, 2025 at 06:24:17AM +0200, Dmitry Baryshkov wrote:
> > On Wed, Feb 26, 2025 at 04:17:50PM -0800, Bjorn Andersson wrote:
> > > When the core is integrated with glue, it's reasonable to assume that
> > > the glue driver will have to touch the IP before/after the core takes
> > > the hardware out and into reset. As such the glue must own these
> > > resources and be allowed to turn them on/off outside the core's
> > > handling.
> > > 
> > > Allow the platform or glue layer to indicate if the core logic for
> > > clocks and resets should be skipped to deal with this.
> > > 
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > ---
> > >  drivers/usb/dwc3/core.c | 19 +++++++++++--------
> > >  drivers/usb/dwc3/glue.h |  1 +
> > >  2 files changed, 12 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> > > index d9f0a6782d36..aecdde8dc999 100644
> > > --- a/drivers/usb/dwc3/core.c
> > > +++ b/drivers/usb/dwc3/core.c
> > > @@ -2328,6 +2330,7 @@ static int dwc3_probe(struct platform_device *pdev)
> > >  
> > >  	probe_data.dwc = dwc;
> > >  	probe_data.res = res;
> > > +	probe_data.ignore_clocks_and_resets = false;
> > 
> > Isn't it a default value?
> > 
> 
> I like the false because it's explicit, but I have no strong attachment
> to it.

I'm more biased to the 'make unusal cases stand out', which means the
defaults can go away to highlight non-default cases.

> 
> That said, it's not the default value, because probe_data isn't
> zero-initialized. That would however make sense to do, in order to avoid
> surprises in the future when probe_data grows.

:-)

> 
> Regards,
> Bjorn
> 
> > >  
> > >  	return dwc3_core_probe(&probe_data);
> > >  }
> > > diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
> > > index e73cfc466012..1ddb451bdbd0 100644
> > > --- a/drivers/usb/dwc3/glue.h
> > > +++ b/drivers/usb/dwc3/glue.h
> > > @@ -17,6 +17,7 @@
> > >  struct dwc3_probe_data {
> > >  	struct dwc3 *dwc;
> > >  	struct resource *res;
> > > +	bool ignore_clocks_and_resets;
> > >  };
> > >  
> > >  int dwc3_core_probe(const struct dwc3_probe_data *data);
> > > 
> > > -- 
> > > 2.45.2
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

