Return-Path: <linux-arm-msm+bounces-21575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 312848FB06E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 12:52:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6236B1C23227
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 10:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA70145346;
	Tue,  4 Jun 2024 10:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HN/DpX8B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C14144D1A;
	Tue,  4 Jun 2024 10:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717498309; cv=none; b=L6uh5KurbnPJqVUGzdYCbOj/VO4+Kt00ycSGhl7+PnlAFhpDnZFaJmhIkWME2HZIn22lQ2ja5Sl5TK5fdgPw2ExXuskanYnLMydR3kRGp8pgAHC4dHsP/JSQWHnrReSJZUOanlTjFpL7bnMjovARzkls2x2f/0k/MGkPRPHaNgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717498309; c=relaxed/simple;
	bh=dDFtLAPrbCWFw67uOUgzc5PB0wqcAOjBbz+GAOH3WwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NSw8LvabfQfAGovO3oKoQvInQ/oXRubz4nu1EIbEWUA1Cl0TDxEpioEpNl5lAu47UGE2gs/CrRBE06KnZU2Y0IcVTbZmKPf9EGQaMgcA2QJou1sIoh/fPyijvHkL+9ILwgPSmXTuB06673LDjOu754dPAq6Se3mX3SuL+X0j5Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HN/DpX8B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E4F2C2BBFC;
	Tue,  4 Jun 2024 10:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717498309;
	bh=dDFtLAPrbCWFw67uOUgzc5PB0wqcAOjBbz+GAOH3WwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HN/DpX8B41dOmqn89bNy/yYXnXP1XKB9vqGTDnOuHhh6+OqcQAOoOXN61IJ025NY2
	 ND108xDiXy7bN6JDhc0XibCKS+4xduOfJcs7Ls/d/eEkaYkHzfzltyycFoalqNYriP
	 4XzZIlNI6ugzBC/lLDWOhKlnO8uQhQREjSStGHqpbdJyI9qCcFdeqHbrSBC9XQ5Cn4
	 UHBJ1DLV/IrFh+r3t8YyMVHEB8nNho4yE6NZGQzNKjZs63jVS+nSzRHu1LIj9eKEDo
	 08SUwFzDnrB5wYtRi0xY4yhBHwKiyse2qsqKaHR6xaX1n0aeK+xyPSS9hdA+z9oJfM
	 aMWlA10s4i7KQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sERlb-000000002uY-1Jgj;
	Tue, 04 Jun 2024 12:51:48 +0200
Date: Tue, 4 Jun 2024 12:51:47 +0200
From: Johan Hovold <johan@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Subject: Re: [PATCH] dt-bindings: usb: qcom,dwc3: set minItems for
 interrupt-names
Message-ID: <Zl7xw4ER-BBvcuct@hovoldconsulting.com>
References: <20240527144538.155704-1-brgl@bgdev.pl>
 <f709f17d-c20c-4777-b23b-8275f6d4f3f5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f709f17d-c20c-4777-b23b-8275f6d4f3f5@kernel.org>

On Mon, May 27, 2024 at 05:13:39PM +0200, Krzysztof Kozlowski wrote:
> On 27/05/2024 16:45, Bartosz Golaszewski wrote:
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
> 
> Can you also fix other cases? I found there at least two other. I missed
> that during review... or maybe we discussed it? I remember that commit
> was a pain :/

Yes, please make sure to fix those two remaining instances at the same
time.
 
> But be sure that this is what we actually want. Maybe intention was to
> have fixed number of interrupts (so no minItems in interrupts)?

I'm pretty sure the intention was to keep the SuperSpeed interrupts
optional.

Johan

