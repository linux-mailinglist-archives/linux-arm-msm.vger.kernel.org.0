Return-Path: <linux-arm-msm+bounces-25992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB32992EB33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 17:01:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D990B2121F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 15:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB1D615CD78;
	Thu, 11 Jul 2024 15:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EQMEc+IV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81808154BE8;
	Thu, 11 Jul 2024 15:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720710078; cv=none; b=obFXT04z/SzX1Kcj6HeWQ+PTEjbgEPagM4+cxj6tFcTCPz/AekfO+E1mGkjDTuxQ6aPJKQa2I8q36L6iZb18Ja6DoCLShVnXoRM2aZGxgEtmszskIhMlTCnv/Hz0yct7gIMMb5F0saeULqZT/0QDJ1kgeYgfCdiYfpXTOwB5bc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720710078; c=relaxed/simple;
	bh=cbO/KRhRU5RpiqktSyiEnIwlpQFVvKQFp96GPxVwHr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WG5cu0CMpQMa0HKcAEyBMwwHfpXBu+YWc3ngwT8pG0JYslHOa/1boAaLBvj91DtWB0oRSQH8bieq3UjjUvBuNlyQFiSozf61rCRVBqRG28JTSvF34u7lC2q8NPDP2iDo7kn91ARSgkRitIxAM6r7waCYYhTMnTzHb9SoqlJCcaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EQMEc+IV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00F32C116B1;
	Thu, 11 Jul 2024 15:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720710078;
	bh=cbO/KRhRU5RpiqktSyiEnIwlpQFVvKQFp96GPxVwHr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EQMEc+IVmXqEhb86jpWSVanbwrjG+orKHT0VuzmeJWWHXKS6WE4s/qX6nztJgkr3y
	 8xvWfllsUCRyOeES1NySCFe6TPp3osxfajxGOiWrsrkl/Afg435V0wU7pefuWRvmH9
	 qFRK+bwlarIw+MTN4Up7sHB/Dhlp3zFBOJtvknyYeRI1gXuI1a/bW2T4zmHoiGFibs
	 KZ56g9E0jE5Qhdwcf4746cqwdNYFqqV8p4tUMXrrXzI8QQAsPwZgxtV3TAcSiJnjza
	 XKSJDT6PyOVba5EpLZGoGb1bHl6t44ctA5/VZI60wxvL7I91Ehage8wbZEL+A0VZFc
	 fDD8mN1dmkieA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sRvIJ-000000002bU-2meG;
	Thu, 11 Jul 2024 17:01:15 +0200
Date: Thu, 11 Jul 2024 17:01:15 +0200
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: enable GICv3 ITS for PCIe
Message-ID: <Zo_zu-RmbZyKijVQ@hovoldconsulting.com>
References: <20240711090250.20827-1-johan+linaro@kernel.org>
 <f7e74a6f-0548-4caa-a8fc-8180c619c9aa@linaro.org>
 <Zo-ssBBDbHRLtAwG@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zo-ssBBDbHRLtAwG@hovoldconsulting.com>

[ +CC: Mani ]

On Thu, Jul 11, 2024 at 11:58:08AM +0200, Johan Hovold wrote:
> On Thu, Jul 11, 2024 at 11:54:15AM +0200, Konrad Dybcio wrote:
> > On 11.07.2024 11:02 AM, Johan Hovold wrote:
> > > The DWC PCIe controller can be used with its internal MSI controller or
> > > with an external one such as the GICv3 Interrupt Translation Service
> > > (ITS).
> > > 
> > > Add the msi-map properties needed to use the GIC ITS. This will also
> > > make Linux switch to the ITS implementation, which allows for assigning
> > > affinity to individual MSIs.

> > X1E CRD throws tons of correctable errors with this on PCIe6a:

> What branch are you using? Abel reported seeing this with his branch
> which has a few work-in-progress patches that try to enable 4-lane PCIe.
> 
> There are no errors with my wip branch based on rc7, and I have the same
> drive as Abel.

For some reason I don't get these errors on my machine, but this has now
been confirmed by two other people running my rc branch (including Abel)
so something is broken here, for example, with the PHY settings.

I saw five correctable errors once, when running linux-next, but it took
several minutes and they were still minutes apart.

> Also note that the errors happen also without this patch applied, they
> are just being reported now.

I guess we need to track down what is causing these errors before
enabling ITS (and thereby the error reporting). 

At least L0s is not involved here, as it was with sc8280xp, as the
NVMe controllers in question do not support it.

Perhaps something is off because we're running the link at half width?

Johan

