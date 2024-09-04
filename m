Return-Path: <linux-arm-msm+bounces-30635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C18396B2FE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 09:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59BDF280FBF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 07:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB53C13DBB6;
	Wed,  4 Sep 2024 07:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZb55oHw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777EA824AF;
	Wed,  4 Sep 2024 07:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725435425; cv=none; b=H9rjvUVWKmdROTvqMr37yLNMTM/Mo/f3CL0ffOhHx4CCFtKRx92U85bqSbAAowbqTn0uOZafvm2XeTX4uFIoqogZeyzWy4Y32QOZ92CqODEjkFYynt62DAD4XH2UpsacMpSbb/SQPP9jj2QAN0k4UcZYSqkUWIpGaniusedF3NM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725435425; c=relaxed/simple;
	bh=AfxzpX4GHl51hFDB4zqrm6o7GErc6877ymLCUd48txE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WNNaIw2c2GCAUzop5gSa761vR6mDUwwCdlRQj5f7qy1KjBb2jiBWu7hVVpaPfkpCXTZCrQh1wuZctqw+L4XCIvXSz/tOpuDjDC+4RLIvbl/hj9IwIvARXBpPewcQ/BF7xeT3sJDLaHwPcdgegRJSVFNkXVm8G03sgBnzUeUWaCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lZb55oHw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060FEC4CEC2;
	Wed,  4 Sep 2024 07:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725435425;
	bh=AfxzpX4GHl51hFDB4zqrm6o7GErc6877ymLCUd48txE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lZb55oHwrLAB5sjGQkLV4ny7WTr6hEA4VR7hczbYooL5I4DVHFqhRo6jWARP46Q/Y
	 kE+pi17yhNvs2nA4yQIJ5pqiVFG1GxV7lHPCWigq2VhvUCn20kHxygl+wViq4/iuCd
	 ChKTsje/b4mVqXMxHDyYfVlWUdArgh27kqE/LQh9auxEAVwFIhnbC/m7tPczdM7gyC
	 unABFN9RTFQIcHqtLDw8oDU+5K+BWjrLaSR1mXk35ttaSztVav09tJpAUTRK5jvDkH
	 J8e00gP3VpCgqzmGlO3+cDAkyOL2fGo9Oh8swyqZfPpwPYHsKp65rkPw4aS4FN4Ynh
	 sBXPpQbPR7Vig==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1slkZs-000000001kV-486R;
	Wed, 04 Sep 2024 09:37:21 +0200
Date: Wed, 4 Sep 2024 09:37:20 +0200
From: Johan Hovold <johan@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, patches@lists.linux.dev,
	linux-clk@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>,
	Taniya Das <quic_tdas@quicinc.com>
Subject: Re: [PATCH v3 1/2] clk: qcom: dispcc-sc7180: Only park display clks
 at init
Message-ID: <ZtgOMJ2fmkZO8nDG@hovoldconsulting.com>
References: <20240828171722.1251587-1-swboyd@chromium.org>
 <20240828171722.1251587-2-swboyd@chromium.org>
 <c1e35d3d-fa00-4453-aaa3-9f23a07acb4f@linaro.org>
 <CAE-0n51Ag1wpj0uUPVtMvgZJE2FF_FZkw+j=bRiAq3vYk=Y_Fw@mail.gmail.com>
 <CAE-0n53rNuyXcVcqTBSgbNzuJzCBkaHE21dPNkMTrs=BCTkmPg@mail.gmail.com>
 <ZtVmKWTBtJiA53U0@hovoldconsulting.com>
 <8a02734c7b64efa186e97a54eb34c632.sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a02734c7b64efa186e97a54eb34c632.sboyd@kernel.org>

On Tue, Sep 03, 2024 at 12:55:07PM -0700, Stephen Boyd wrote:
> Quoting Johan Hovold (2024-09-02 00:15:53)
> > On Fri, Aug 30, 2024 at 03:29:22PM -0700, Stephen Boyd wrote:
> > > Quoting Stephen Boyd (2024-08-29 09:34:05)
> > 
> > > > It sounds like it's better to make the default always park at
> > > > registration time and special case the one or two places where that
> > > > isn't possible, i.e. USB because it has special rate requirements. So I
> > > > should just go back to v1 then and pile on the QUP patches.
> > > 
> > > I've done this now and I'll push out clk-fixes with the QUP patches.
> > 
> > I assumed you'd fix up all the other SoCs affected by this, but I only
> > saw fixes for sm8550, sm8650 and x1e80100 in your fixes branch.
> > 
> > Just sent a corresponding fix for sc8280xp, which I've confirmed also
> > needs this for QUP:
> 
> Thanks!
> 
> >         https://lore.kernel.org/lkml/20240902070830.8535-1-johan+linaro@kernel.org/
> > 
> > But what about the sm8550 USB issue? Don't the other platforms also need
> > a corresponding fix (e.g. for when booting from USB)?
> 
> I don't know. Are you seeing USB host issues on other platforms with
> shared RCG clk_ops for the USB clk? It looks inconsistent that sometimes
> there's a USB GDSC but the shared clk ops aren't used. If nothing is
> broken then let's work on the proper fix, which is parking RCGs when the
> GDSC is turned off so that turning on the GDSC always works. If USB is
> broken for you then send another patch.

I haven't noticed any USB issues on the two platforms I work on and
which both have USB GDSCs (sc8280xp and x1e80100), but then again I
don't test USB booting regularly (if that's when the issue show up).

I was hoping you would have a theory as to why things broke on sm8550 so
that you can reason about which platforms need this, rather than have
multiple users debug these issues and play whack-a-mole with incomplete
fixes.

I don't see anything SoC specific about the QUP fixes and assume early
console handover is now broken on all Qualcomm SoCs for example.

Johan

