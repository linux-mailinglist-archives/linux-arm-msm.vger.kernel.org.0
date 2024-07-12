Return-Path: <linux-arm-msm+bounces-26015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 107DD92F6CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 10:20:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB96D282FB1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 08:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E1013D609;
	Fri, 12 Jul 2024 08:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fiT0IAnp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D3D2E3E5;
	Fri, 12 Jul 2024 08:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720772426; cv=none; b=pDG1iKG6xYUSeOqAtY0mpBMu3b6YJozXvED9v4ZnsAKpdbdHIBkD+TVgx6R8vEBNLJqbjkDMMV/0ot9as8kzicjGpAzp1Vwc5YT+iQvfIwedknaqHh3rnIwl/laJEf0BavlSTuHJL4CBgfeF12ANDIycHEjAWinyV2Tu3fQJ2W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720772426; c=relaxed/simple;
	bh=mksiNGL71vBTfMC2oL1EyJAq8EgwBRCDXPevFY/JTgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BABB7ztCLCisIUqLd78/5kZ7iU4XNa/9TFE5Q+9RIKbc7LCNMQ7oqC37l7Z33uVcRaJbXxWagN4bXM3/MHDafuHrcqxIctqlw4qr/HXaELJytPPl9UyJfP0KJtipnzg1Axj8PGibYNzSUaHrBWrr/WkTKNRF0u0xBJnCTZ9a7z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fiT0IAnp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E22BEC4AF09;
	Fri, 12 Jul 2024 08:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720772426;
	bh=mksiNGL71vBTfMC2oL1EyJAq8EgwBRCDXPevFY/JTgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fiT0IAnpHP8Itv7lpRCpYlB6GY6LLvHaYQPStPvr8ZDBM6ZvQeosmPteC3E/jQvmY
	 M4too9FGwLl75KfLzjcpZZwXCj03Ul3lnFxZz5ux1Gqa5G/LDSCFjL495cf8DbqeHL
	 x5PnJnRJFUuQi003A9LPcalPOHx+VZ79xIlvcfHkvsiy3pnJV59oKb/hiQyoa0gul1
	 6r2/oJWvaEl5WcGmExWayh6vN5XHkuKhCPwXeQF78u51KOwX5w38KQtdNF7j47JWHS
	 wKK+xrozuVmu2KxjomByWBVnWjLzR51ZfSb8nlWY5SWdNI64HNoG5CHkAOlZ1d2AIX
	 /+Z48TZws10+A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sSBVw-000000006Lc-0GDs;
	Fri, 12 Jul 2024 10:20:24 +0200
Date: Fri, 12 Jul 2024 10:20:24 +0200
From: Johan Hovold <johan@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: enable GICv3 ITS for PCIe
Message-ID: <ZpDnSL8as7km9_0b@hovoldconsulting.com>
References: <20240711090250.20827-1-johan+linaro@kernel.org>
 <f7e74a6f-0548-4caa-a8fc-8180c619c9aa@linaro.org>
 <Zo-ssBBDbHRLtAwG@hovoldconsulting.com>
 <Zo_zu-RmbZyKijVQ@hovoldconsulting.com>
 <20240711161947.GA4434@thinkpad>
 <20240711164153.GA4992@thinkpad>
 <ZpAPaker8mulvKCj@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZpAPaker8mulvKCj@hovoldconsulting.com>

On Thu, Jul 11, 2024 at 06:59:22PM +0200, Johan Hovold wrote:
> On Thu, Jul 11, 2024 at 10:11:53PM +0530, Manivannan Sadhasivam wrote:
> > On Thu, Jul 11, 2024 at 09:49:52PM +0530, Manivannan Sadhasivam wrote:

> > > My hunch is the PHY settings. But Abel cross checked the PHY settings with
> > > internal documentation and they seem to match. Also, Qcom submitted a series
> > > that is supposed to fix stability issues with Gen4 [1]. With this series, Gen 4
> > > x4 setup is working on SA8775P-RIDE board as reported by Qcom. But Abel
> > > confirmed that it didn't help him with the link downgrade issue.
> > > 
> > > Perhaps you can give it a try and see if it makes any difference for
> > > this issue?
> 
> If there are known issues with running at Gen4 speed without that
> series, then it seems quite likely that doing so anyway could also cause
> correctable errors.
> 
> Unfortunately, I get a hypervisor reset when I tried booting with that
> series so there appears to be some implicit dependency on something
> else (e.g. the 4l stuff).

The first patch in that series breaks icc handling, which crashes
machines like the X13s and the x1e80100 CRD on boot. I've just reported
this here:

	https://lore.kernel.org/lkml/ZpDlf5xD035x2DqL@hovoldconsulting.com/

With that fixed, and with the hacky dependency on having max-link-speed
specified in the DT for the series to have any affect at all, the gen4
stability series indeed seems to make the AER error go away (Abel just
confirmed using a branch I'd prepared).

Let's try to get that series in shape and merged in some form as
everyone will be hitting these Correctable Errors currently with the
NVMe on x1e80100.

Johan

