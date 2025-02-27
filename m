Return-Path: <linux-arm-msm+bounces-49726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61781A4841E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 17:03:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C6AF175A0C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 16:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A96C1B0103;
	Thu, 27 Feb 2025 15:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j+UIFuGD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EE31A8F71;
	Thu, 27 Feb 2025 15:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740671733; cv=none; b=BbEOO0pC8/sKEpqabRaRHorYDoIytNjfyZBBDX8AFoLC7sGH1XT1r2cOAJpnOhWAqUVymrOUk4u+6ip0aMwNUPNX08pqX+GS4HT6murKrgH8ccDBsQMkEWiK7b+bGCmF0Gr/xtviAkbzJEy+XIJZ/LasPKEfwSZ2fj2fwhYqlNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740671733; c=relaxed/simple;
	bh=rguxfsI49eQ9tz5tUwlYijwyPiNkuMJxPbT9i5OxPkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dq228SEfkxwGCgvXBkDdco3B59vP5FYgHkQXEy06on8Gg48oDpGaqpLM1YYz9gOiVMbY7GHhaM3kblXSlxvynalbNoRdKyTICBCyPIBWIZsvhO1cHiqo5GQPVbxZaQrL1Iu+Pce4gWrEv0/NgyBaIvkzBoeG7rQ+UYV5OEnI40A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j+UIFuGD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E24F4C4CEDD;
	Thu, 27 Feb 2025 15:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740671733;
	bh=rguxfsI49eQ9tz5tUwlYijwyPiNkuMJxPbT9i5OxPkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j+UIFuGDGV2alEgyObw1drzkORF2NIUoVbG4Ew5JSdfKRCRcB/WWuNheccm1SV1Ow
	 k6JzbMqI7fVziGOz0R01DEKqDqiwFpYh1NdvLWKaEV6bSd1cYDK1V6ul1430u6b62X
	 XgR+okcI7BFnfBVPEr4fJSl1GjmDezXYKqbmnihLifpyEzUakoN4UMegValWDj7hko
	 Ag6vAZRQzXX77YTmGtlnXqOwYbrQkDkUmsEURjf+5sqBZm/yxJOXWbZgubrOrNy2vd
	 tlFM/7qPA9pw1bOVFfyAk9nydK9wlBB+ZQUDe/hlU09onX+jheMqivhA8LsWRGFifY
	 ZIGtfM12LL8tw==
Date: Thu, 27 Feb 2025 09:55:29 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Felipe Balbi <balbi@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Saravana Kannan <saravanak@google.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Konrad Dybcio <konradybcio@kernel.org>, 
	Frank Li <Frank.li@nxp.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/7] usb: dwc3: core: Don't touch resets and clocks
Message-ID: <6v2kyk3rhss4itvo4dhwxyf3mp7ey7gh5abaklgwa27b4fw6ce@ofyuo3ortl4p>
References: <20250226-dwc3-refactor-v4-0-4415e7111e49@oss.qualcomm.com>
 <20250226-dwc3-refactor-v4-3-4415e7111e49@oss.qualcomm.com>
 <w72zvfh3uf7crbkmuenxcjnu6moircjdy6rnbzszl4tjlm2jks@4z2k3iqt2ohi>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <w72zvfh3uf7crbkmuenxcjnu6moircjdy6rnbzszl4tjlm2jks@4z2k3iqt2ohi>

On Thu, Feb 27, 2025 at 06:24:17AM +0200, Dmitry Baryshkov wrote:
> On Wed, Feb 26, 2025 at 04:17:50PM -0800, Bjorn Andersson wrote:
> > When the core is integrated with glue, it's reasonable to assume that
> > the glue driver will have to touch the IP before/after the core takes
> > the hardware out and into reset. As such the glue must own these
> > resources and be allowed to turn them on/off outside the core's
> > handling.
> > 
> > Allow the platform or glue layer to indicate if the core logic for
> > clocks and resets should be skipped to deal with this.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > ---
> >  drivers/usb/dwc3/core.c | 19 +++++++++++--------
> >  drivers/usb/dwc3/glue.h |  1 +
> >  2 files changed, 12 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> > index d9f0a6782d36..aecdde8dc999 100644
> > --- a/drivers/usb/dwc3/core.c
> > +++ b/drivers/usb/dwc3/core.c
> > @@ -2328,6 +2330,7 @@ static int dwc3_probe(struct platform_device *pdev)
> >  
> >  	probe_data.dwc = dwc;
> >  	probe_data.res = res;
> > +	probe_data.ignore_clocks_and_resets = false;
> 
> Isn't it a default value?
> 

I like the false because it's explicit, but I have no strong attachment
to it.

That said, it's not the default value, because probe_data isn't
zero-initialized. That would however make sense to do, in order to avoid
surprises in the future when probe_data grows.

Regards,
Bjorn

> >  
> >  	return dwc3_core_probe(&probe_data);
> >  }
> > diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
> > index e73cfc466012..1ddb451bdbd0 100644
> > --- a/drivers/usb/dwc3/glue.h
> > +++ b/drivers/usb/dwc3/glue.h
> > @@ -17,6 +17,7 @@
> >  struct dwc3_probe_data {
> >  	struct dwc3 *dwc;
> >  	struct resource *res;
> > +	bool ignore_clocks_and_resets;
> >  };
> >  
> >  int dwc3_core_probe(const struct dwc3_probe_data *data);
> > 
> > -- 
> > 2.45.2
> > 
> 
> -- 
> With best wishes
> Dmitry

