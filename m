Return-Path: <linux-arm-msm+bounces-56063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 290FCAA06B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 11:13:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29A343A9FF2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 09:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A2429DB96;
	Tue, 29 Apr 2025 09:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZssbhFc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7910F288CAD;
	Tue, 29 Apr 2025 09:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745917983; cv=none; b=KRcm0aq39AwlqXjpGpcpNLBXekuOP/Wm1Hp1YE5DAglFi6G8jZFDgoK6gMYtdYg7GgvGhwpxutXJg8s5KI4RzQG9xAfGRJJKn3bkdNpUhds61uLveyXnBMMxyiFfpYeXuDVLLs1GDvq9QAN63ihEgZ1yhQXoYKxMiEUpDjgi6fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745917983; c=relaxed/simple;
	bh=Wbe2M0VWW0l3TpFJbV/zwwleX2QVAjqwy64HzEhZniQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gnTIFUOecjD3UlmwrUebcvEM6T7YgL/lQqJYVEONz+6pUbABpxCDsspeayLZDVAn8pHY6ZZLI557OvwqImithh/PIysVgMjP6qwe1oLXQBCzDb3D00snAGiXdtvVNFw8ApihSCsN37A9q4PXAJ9tjQl90qZmeDbaT+aFimM2mi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mZssbhFc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D715DC4CEE3;
	Tue, 29 Apr 2025 09:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745917982;
	bh=Wbe2M0VWW0l3TpFJbV/zwwleX2QVAjqwy64HzEhZniQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mZssbhFclDQ7ndTaodsXm6/kASD92fVbnD9t8cGcpzKx42f5vBUao/ozjjGPhdqYu
	 53vipy8Oc9rI2qieXq98MHsr8M83eK+fEtQHnlO3/8wZNWCv1abSg4VFCLpogv3Wsx
	 /Lvuh/cc1oRNTtDxa9BqFR6ns0ZV34qzupn7fbO6A5WTo8faaVgh8WYg4bmlHroyDF
	 DdhdTh3kNFvedMszyDRmtNvSVpjr6PyGeMCKaotjpdyUE26/VUObIE+fvn4B9CTNxh
	 1RkaXQrxohiriRWedHOfxC+GxuahoVvJ7TVo2+qTd6ndhpD5mkLbnD2L0CI1Q6Lf1X
	 VA1vl2FeX6LKg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u9h1U-000000001GF-2nZH;
	Tue, 29 Apr 2025 11:13:04 +0200
Date: Tue, 29 Apr 2025 11:13:04 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Xilin Wu <wuxilin123@gmail.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH 0/7] arm64: dts: qcom: x1e80100-*: Drop useless DP3
 compatible override
Message-ID: <aBCYIMdEPrhMzNxi@hovoldconsulting.com>
References: <20250429-x1e80100-dts-drop-useless-dp-compatible-override-v1-0-058847814d70@linaro.org>
 <aBCUiIrg3oehMVjx@hovoldconsulting.com>
 <aBCWdpk2HXPaJPlH@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBCWdpk2HXPaJPlH@linaro.org>

On Tue, Apr 29, 2025 at 12:05:58PM +0300, Abel Vesa wrote:
> On 25-04-29 10:57:44, Johan Hovold wrote:
> > On Tue, Apr 29, 2025 at 10:42:28AM +0300, Abel Vesa wrote:
> > > It all started with the support for CRD back when we had different
> > > compatibles for eDP and DP. Meanwhile, that has been sorted out and it
> > > is now figured out at runtime while using only the DP compatible.
> > > 
> > > It's almost funny how this got copied over from CRD and spread to all
> > > X Elite platforms.
> > > 
> > > TBH, the best reason to drop it ASAP is to make sure this doesn't spread
> > > beyond X Elite to newer platforms.
> > > 
> > > Functionally nothing changes.
> > > 
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > > Abel Vesa (7):
> > >       arm64: dts: qcom: x1e-crd: Drop useless DP3 compatible override
> > >       arm64: dts: acom: x1e80100-qcp: Drop useless DP3 compatible override
> > >       arm64: dts: qcom: x1e80100-t14s: Drop useless DP3 compatible override
> > >       arm64: dts: qcom: x1e80100-s15: Drop useless DP3 compatible override
> > >       arm64: dts: qcom: x1e80100-hp-x14: Drop useless DP3 compatible override
> > >       arm64: dts: qcom: x1e80100: Drop useless DP3 compatible override
> > >       arm64: dts: qcom: x1e80100-romulus: Drop useless DP3 compatible override
> > 
> > Since this is essentially a clean up perhaps you should have squashed
> > these into one patch.
> 
> I was actually thinking that before sending, but then I decided to add
> the Fixes tag to each one. Since it's such a trivial worthless cleanup,
> I wasn't sure if the Fixes tags were worth it either.

Right, since it's not a bug you should probably have skipped the Fixes
tags too.
 
> I can squash them if the consensus is that it's not backporting.

We should definitely not backport these as they are not fixing any bugs.

Johan

