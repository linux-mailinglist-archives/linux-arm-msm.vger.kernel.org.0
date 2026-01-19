Return-Path: <linux-arm-msm+bounces-89747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A209D3B7D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 20:58:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F050630089BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 19:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D6CA2E1C63;
	Mon, 19 Jan 2026 19:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QyFJw+PU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D5A2BD0B;
	Mon, 19 Jan 2026 19:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768852695; cv=none; b=EgDp2LbzLAWkqb2qECoArP06B5vIwsuipQnVOutRGoSHCiwPjgsbZbsVZAeVmGu5lxfFXvA82t4Vdgig3b4wDoZ/grAILw+LIwZzku65b+gRzvnMXusEiMyE7nGWZJCTwaNX1WJKJjp0MXEhYoMdEErm+IfC/3Xp8/5PHsi/18g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768852695; c=relaxed/simple;
	bh=Fd+cyzWsz1pW/sMFaPY19RCYS3qQIc3jzaKeWYBrjOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FNe3Cegcopk4IR+mfsavVsljKgeQuhBCBjmErpTPBG8tjrxDj0h+nbL7ao2ZQ3J5kSiSb4ATG8lJ/6cKA88qf3sxvm64QyPwfbO+0NJiyXH+i6OPfwYUsfeUxOdb0HFQ2UJVKUTfDqkyu6sHAqtOc5kO9MesVvf5s1zlw3HfZuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QyFJw+PU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA487C116C6;
	Mon, 19 Jan 2026 19:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768852694;
	bh=Fd+cyzWsz1pW/sMFaPY19RCYS3qQIc3jzaKeWYBrjOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QyFJw+PUGCo/fHxooyqqRJFQSkG7RO7klVUYoJ0rEmNqqwawWJ0bO4BvwHKiW+Jx+
	 t85u7tOZUYRAnhrfGeF3seOpoE3oEzXGFIncyPI1efaBuXsDAedFLO12hCfUjKqNwA
	 /WxRUzbTPcyiX5KPmiukI4t2rZs7xtaWJttUjrfWAHKzPW/4ywCM6vVyvv0pUW+79E
	 TbMRbQ4P4FHVaGy8TCbjkCKknSPvtW0k3G4krjGERosdLKeptlZRtpKprCoZRXg5Ne
	 EjlJAWuF8ny20oAXyZMjhR3E5sKJOWxEBkwT9L6EWwg43ckAaCGf0I8NSdgNtAkzb+
	 MdJsNV7JzNDoA==
Date: Mon, 19 Jan 2026 13:58:12 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Elson Serrao <elson.serrao@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Souradeep Chowdhury <quic_schowdhu@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] dt-bindings: soc: qcom: eud: Restructure to model
 multi-path hardware
Message-ID: <sfazro75vspadpe4wco7zvlalcy2wbrbdjx2wn7lyonjgw22sf@z73u67pinusx>
References: <20260116232106.2234978-1-elson.serrao@oss.qualcomm.com>
 <20260116232106.2234978-2-elson.serrao@oss.qualcomm.com>
 <20260117-courageous-chamois-of-focus-20d5d5@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117-courageous-chamois-of-focus-20d5d5@quoll>

On Sat, Jan 17, 2026 at 12:57:58PM +0100, Krzysztof Kozlowski wrote:
> On Fri, Jan 16, 2026 at 03:20:58PM -0800, Elson Serrao wrote:
> > The Qualcomm Embedded USB Debugger (EUD) hardware can intercept up to
> > two independent High-Speed UTMI data paths, depending on the SoC
> > configuration. Each path operates independently with:
> > 
> > - Dedicated PHY interface
> > - Distinct USB connector and controller associations
> > - Role dependent routing
> > 
> > Model these hardware paths as separate eud-path nodes to accurately
> > represent the physical topology and add below per-path properties:
> > 
> > phys: EUD exposes a High-Speed debug hub that relies on HS-PHY for its
> > operation. This property references the HS-PHY associated with the UTMI
> > path.
> > 
> > usb-role-switch: Indicates that the USB port on this UTMI path supports
> > role switching. In device role, debug mode inserts the EUD hub into the
> > UTMI path. In host role, the EUD hub is bypassed and UTMI traffic flows
> > directly between the PHY and the USB controller.
> > 
> > This change breaks backwards compatibility, but the previous binding
> > omitted critical resources like PHY and did not describe per-path
> > topology. Without these modifications EUD cannot be guaranteed to
> > function.
> 
> It was working for 3 years, so your guarantees are just imprecise. FUD
> is not an argument.
> 
> Qualcomm task at 2022 was to post complete bindings. These were posted
> and accepted. Three years later you say that previous posting was
> bollocks and this cannot even work?
> 

That is correct. The description of the hardware that was provided when
this was upstreamed and the binding that was accepted based on this
description is wrong.

There's absolutely a value in maintainting backwards compatibility in
general, but is this one of those cases?

> Nah, take responsibility of what you did in the past.
> 

In my view the responsible thing is to accept that we got it wrong and
make sure EUD is enabled end-to-end so people can actually use it.

Regards,
Bjorn

