Return-Path: <linux-arm-msm+bounces-23500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CCC911A6A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 07:32:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73DB5283F82
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 05:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E25DB12BF25;
	Fri, 21 Jun 2024 05:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H8KeKQiv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7DE2A1CA;
	Fri, 21 Jun 2024 05:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718947975; cv=none; b=F+tNCN12q8gCxNQr7WSwxA7Vy1uFckW6dBY2TC1XSBms/2Mq+kTlh6spfxTgDNS0Rjzh7Sqr3WR0gmkbR8BN3wbbeQ2VRSQY/cWlfi/lkREvmxOqT3iLHtrwoAT9qdwu+BzjCuXwHtRO6JOTPrj1K7eIOY3ooyvkCHv8RDNEx3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718947975; c=relaxed/simple;
	bh=4CqgCqa3Q1dTMpcb7hgK8MqFA+9AJzBM37tCOxteDrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iDBbXEoUtpDqnH956A3yu0WVOiUOwNdmNojCsffxRiQq1rmTwhxCtWArRHZqen+UGvr/dI0y6fNlDwA97bx1dStdl5pi1wXshuXbGCTzCHt3ewxDWpli0lv4DvZ06bjKZ1pNs0C5S4Spy/yZoyKE46wWACk5IxQ2smQPSKzST0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H8KeKQiv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC42BC2BBFC;
	Fri, 21 Jun 2024 05:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718947975;
	bh=4CqgCqa3Q1dTMpcb7hgK8MqFA+9AJzBM37tCOxteDrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H8KeKQivB5V901OEXvQ+oU8gSVn550UtTRbXdUwynm8nZUpDlbpw/i4tIM25ukdC8
	 BO9RTAvHUalicwtw2p84Kfsba8S4nO/6LZwV+SSuEhbUN5I39vlx2rMHZDYbU3SP22
	 PUBiQp5XtGgY6TfxtcGpyPWe093//tcJRiR5Er/UrZVJhNW2uHxvtnoHwxPFTX6qAh
	 kEsdThjutbFd/JsihmbxUj0gd1EOc5GPoEBhwVq2Gd9CNLpeP1JyezvkLBQM6RnTtV
	 u+FNLjDzNCi0GC2PdzmyO2u8nn4TV1zgVPOjZ+Rhz42u80ZSjU2f1NOYYpdxJaPAEK
	 iJRC6SHfHyA8g==
Date: Fri, 21 Jun 2024 00:32:52 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Caleb Connolly <caleb.connolly@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qrb4210-rb2: set
 role-switch-default-mode
Message-ID: <6fpp4noq76tphgsmkuacp6jcgy4b73emgt76wxain6jisiidxt@itj2hedhlea3>
References: <20240619-rb2-fixes-v1-0-1d2b1d711969@linaro.org>
 <20240619-rb2-fixes-v1-2-1d2b1d711969@linaro.org>
 <CAA8EJpo94qg0dDR-H64v0yC7jLKHuD9O59m3hG2tNR4v3NAkLA@mail.gmail.com>
 <c10b1343-921b-494b-94dd-6f5acc894e6d@linaro.org>
 <v3dgoeybewgegi2xuixhaq5c7jwju6wojrmzcq3rtb5f5r5nfu@6gj4tfz5blx7>
 <35d9f16d-c009-4383-a616-9b21f0819b46@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35d9f16d-c009-4383-a616-9b21f0819b46@linaro.org>

On Thu, Jun 20, 2024 at 06:49:46PM GMT, Caleb Connolly wrote:
> 
> 
> On 20/06/2024 17:07, Dmitry Baryshkov wrote:
> > On Thu, Jun 20, 2024 at 03:30:29PM GMT, Caleb Connolly wrote:
> > > 
> > > 
> > > On 20/06/2024 15:15, Dmitry Baryshkov wrote:
> > > > On Wed, 19 Jun 2024 at 23:33, Caleb Connolly <caleb.connolly@linaro.org> wrote:
> > > > > 
> > > > > Give a hint to the OS which role we prefer. Host mode generally makes
> > > > > the most sense.
> > > > 
> > > > Why?
> > > 
> > > I guess this is subjective, but on these boards the more common usecase is
> > > host mode (before we had role switching we forced them to host mode...).
> > > > 
> > > > > 
> > > > > Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> > > > > ---
> > > > >    arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 4 ++++
> > > > >    1 file changed, 4 insertions(+)
> > > > 
> > > > Would it make sense to set this for all the RB and HDK boards?
> > > 
> > > The rb1/2 are the only boards which lack multiple USB controllers. For
> > > others it's fine to leave the default (peripheral mode).
> > 
> > SM8450-HDK and SM8650-HDK also have just a single USB-C port. My logic
> > was slightly different. We consider these devices to be SBCs, so I'd
> > expect that they act as hosts _by_default_. If somebody plugs RB board
> > into a laptop, then it's logical that it should work as a device, but
> > between the phone and the RB board the RB is a host.
> 
> Ahh I see, then yes perhaps it makes sense. I can send v2 with patches for
> other boards too.
> 
> * qrb2210-rb1
> * qrb4210-rb2
> * sm8450-hdk
> * sm8650-hdk
> 
> Any others?

qcs6490-rb3gen2 please.

I'm picking patch 1 for v6.10, no need to repost it.

Regards,
Bjorn

> > 
> 
> -- 
> // Caleb (they/them)

