Return-Path: <linux-arm-msm+bounces-34024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 505C0999CC6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 08:36:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCDAAB20F24
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 06:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B461F1309;
	Fri, 11 Oct 2024 06:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H1l68gF8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9D3199FB9;
	Fri, 11 Oct 2024 06:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728628589; cv=none; b=TuGUr4Bx61AAc6AUU3OBgKSqTr3lNdjWpz9iUFTebXjNkO1WBk7U2WuqF3M7ZV6SSrCfTc7RD2mtQ0kWtXsLxQzEnJ0iyTFAWNAP4QJl7inG8fM3uDNzerkGxslKKEZxrA7Y+L4k82dSPATTOdE2R2TokqWe9zN+sNkDJQSqoNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728628589; c=relaxed/simple;
	bh=CrQYK7ks5t8HLoC1QvVn/wgqIQOWlmWPGK+YGoKdXoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YX0LZheEpdy3ooRTMAkB/GzS0R2ePeKgghRHDdOlm6IQOKbgG9hXVQ1b8C+0PV3YhmyU8Qmhk8dE34h1rcJ1oacE42WH74JfqmHGfkhvPzo5LRVBOIKnxiqCA0Fktb8gqrT061u2OBE+RJq51tD7yzh4OHtELV1DFL3M7cj6Ppw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H1l68gF8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B641C4CEC3;
	Fri, 11 Oct 2024 06:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728628589;
	bh=CrQYK7ks5t8HLoC1QvVn/wgqIQOWlmWPGK+YGoKdXoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H1l68gF8uaLCkomQMUYCPsFACWAvaFjI1KuhNMvNuVeRMlMAgkaldfZMZ2qY4kCjL
	 O5k+WKJMlogN63gf2bxt6kveSUlAqQSamVVR3+QzuZVC131RY1ClI6h7Wn2PRc5lNI
	 MOgtk4p35pS8+AdUqEraWOLaWoj2Kr1YJzvLDH1MPzEEXVP5YGsMbuh82ouUYKsREH
	 HMnS4cemDROKnXbklRd+fPP+GrTKUkcXnjPqu0sJOMwPhLYcPmHk6AkK8jUq1R9wYQ
	 kdBI4OY4QMMExtWfDz1mQeA37w16MR67OD4rOY+fOit4inBg3mm9KoHJq87Y/dUDJ0
	 mkCZ2qk77hThg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sz9GM-000000002Vt-47wt;
	Fri, 11 Oct 2024 08:36:35 +0200
Date: Fri, 11 Oct 2024 08:36:34 +0200
From: Johan Hovold <johan@kernel.org>
To: =?utf-8?B?SsOpcsO0bWU=?= de Bretagne <jerome.debretagne@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sc8280xp: Add Microsoft Surface
 Pro 9 5G
Message-ID: <ZwjHcj9Wapb9fBVp@hovoldconsulting.com>
References: <20240908223505.21011-1-jerome.debretagne@gmail.com>
 <20240908223505.21011-6-jerome.debretagne@gmail.com>
 <ZweV5mcEWHofpF4J@hovoldconsulting.com>
 <CA+kEDGE9fVWNK+3Y8JtM8jG9ki+QCoPAM=8AGC+HARL2CwyJYg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+kEDGE9fVWNK+3Y8JtM8jG9ki+QCoPAM=8AGC+HARL2CwyJYg@mail.gmail.com>

On Thu, Oct 10, 2024 at 11:17:35PM +0200, Jérôme de Bretagne wrote:
> Le jeu. 10 oct. 2024 à 10:52, Johan Hovold <johan@kernel.org> a écrit :
> > On Mon, Sep 09, 2024 at 12:35:05AM +0200, Jérôme de Bretagne wrote:

> > You mention it in the commit message, but since a lot of this is copied
> > from the X13s (and CRD) devicetrees you should probably make that clear
> > here as well and include the relevant copyright notices. For example by
> > adding:
> >
> >         Based on ...
> >
> >         Copyright ...

> Thank you for the suggestion, so it would look like this?

You can still keep your copyright notice first, and I meant something
like:

	/*
	 * Microsoft Surface Pro 9 5G devicetree
	 *
	 * Copyright (c) 2024, Jérôme de Bretagne <...>
	 *
	 * Based on sc8280xp-crd.dts and sc8280xp-lenovo-thinkpad-x13s.dts:
	 *
	 * Copyright (c) 2021, The Linux Foundation. All rights reserved.
	 * Copyright (c) 2022, Linaro Limited
	 */

> How do you want me to add this to the patchset?
> Should I send a separate fix-up patch?
> Or should I create a newer v3 patchset?

Ah, sorry, I missed that Bjorn had already picked this one up. Either
leave it as is, or send an incremental (fix-up) patch.

Johan

