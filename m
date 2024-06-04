Return-Path: <linux-arm-msm+bounces-21576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 948A98FB07A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 12:53:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B324284445
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 10:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A97144D2E;
	Tue,  4 Jun 2024 10:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S5Xmet7c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A064E13C67C;
	Tue,  4 Jun 2024 10:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717498380; cv=none; b=JYWyli+zd2wH6ROhLugaR5fKdUg469NgdvYz4W7cn34LeMcdCtr327hHRsP9MwKNxdTD2pcr/pNLmKLqH6MNAXm/zNr2s3L32LGBoNmd1LESQlnsQyhNMxD1zAU6LrwY/bzU7W7qm3FHixALgnqKvOBvlpMN+xNqDXdeMc8iSAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717498380; c=relaxed/simple;
	bh=CIT+PLRRVeQCc2z7Vg7ycTCgsifejpCEeedaNo9Y7s0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VDNgFFEbINf9Z9wuWenuGJmiqu2kI0lROaI0ftsekEHbfSv6eDaal2JY8PE4ulXZxrZ87Sb0clXM+ZQhIPAFXoKfkvNzjBobGJWEsJ156OZVme7mMzKN1Jv84AWJDEX8J6e9owzSb32nhBFCEq8SYD+0/n3ZltVdG+bxze3tGQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S5Xmet7c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17212C2BBFC;
	Tue,  4 Jun 2024 10:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717498380;
	bh=CIT+PLRRVeQCc2z7Vg7ycTCgsifejpCEeedaNo9Y7s0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S5Xmet7couJFpLtaS/ov6U1F0VLxO4CKzvTvoWut/0vHH5PURzAXdg8upaH/1YpAu
	 jjkLEw5yqSiL+JmnU/n0SIjshrR2GiZjlSCazWpM4vh7qhCrqfR+RzrH2bY4vGJTRb
	 EU3G+zlN+DnOgGSqsrJ3ChOLrSB9cEIl6CKfhVY28u/cflYdT7UoCG23l+NdgutNt9
	 6+DI5daCEbmYIIx5FqHI4eTXj2kJaqMhHyOYXkleb4aEYBmGCFj+T/GTM3TWLq6SLV
	 oY5iMigYIs4DlbBiQV6OsYZOA+pLfqyJIdZX6kHvQR6FWHWhrUFWTHTy4Ii2WfOfpJ
	 m4+YNJDMSwM5w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sERml-000000002vu-0RVB;
	Tue, 04 Jun 2024 12:52:59 +0200
Date: Tue, 4 Jun 2024 12:52:59 +0200
From: Johan Hovold <johan@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] dt-bindings: usb: qcom,dwc3: set minItems for
 interrupt-names
Message-ID: <Zl7yCy5G2q0SGlwr@hovoldconsulting.com>
References: <20240527144538.155704-1-brgl@bgdev.pl>
 <CAMRc=McurmN4Hs2MVGCjF0z_FX+84v0psGuTse0K7caSVF445A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McurmN4Hs2MVGCjF0z_FX+84v0psGuTse0K7caSVF445A@mail.gmail.com>

On Tue, Jun 04, 2024 at 08:52:52AM +0200, Bartosz Golaszewski wrote:
> On Mon, May 27, 2024 at 4:45 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > There's a set of compatibles for which we set a strict list of 5 interrupt
> > names even though minItems for the interrupts property is 4. One of the
> > USB controllers on sa8775p only consumes 4 interrupts which leads to
> > dtbs_check errors. Make the last entry optional by setting minItems to 4.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > index cf633d488c3f..4251dc25ee9a 100644
> > --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> > @@ -468,6 +468,7 @@ allOf:
> >            minItems: 4
> >            maxItems: 5
> >          interrupt-names:
> > +          minItems: 4
> >            items:
> >              - const: pwr_event
> >              - const: hs_phy_irq
> > --
> > 2.43.0
> >
> 
> Gentle ping.

As was pointed out elsewhere in this thread, there are two more
issues like introduced by the same patch which should be fixed at the
same time.

Johan

