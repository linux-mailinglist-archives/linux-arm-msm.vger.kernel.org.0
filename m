Return-Path: <linux-arm-msm+bounces-32054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5A097D33F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 11:02:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 361BC1F2179D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 09:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B6756F2F3;
	Fri, 20 Sep 2024 09:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yd+uO6vp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160A3273FE;
	Fri, 20 Sep 2024 09:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726822947; cv=none; b=XS2WzAIVa2IkoBOfxwZiJ57dt/r3DHxAoRfORrhpjpyEbR/cAtoZuqeOquuRFrZ6/bwOLXxWzY2wOKIk3of8fqHauJ7cDhEJ3x+gDXubH1XyFzqZNerknjuj/JqTBXSGUbrub41AICFbbY4M1COUXbb1QGBB36QqBRnsAmYnEOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726822947; c=relaxed/simple;
	bh=vL40QuaqUyXmvlqNrC3awGYHeM3daaijDcC2ZZTSI08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rln7fxHmxtZjwlOW8U2ASvwmDvNHZx3jmJOzd1MANIiolcrwCA/raepTZgGQqHDsKDCGfgBJzRxonVjfNgA8Po8aOZnwe89mHsYEN6YpqsT6JKYSOJnp9bHWTgNXXJ+UYFoOD7qdakVy6GdHfQxx3aDIjMqoirtOf4Roici65Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yd+uO6vp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D108C4CEC3;
	Fri, 20 Sep 2024 09:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726822946;
	bh=vL40QuaqUyXmvlqNrC3awGYHeM3daaijDcC2ZZTSI08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yd+uO6vprzIJUiCsDBFJ8zc0zk0lbcseywLXrXlXESPY/aDEQFgqn/I4jas8C5CWj
	 Tl7/x0Zlwu0B65kB3OKVu/EBeiiilFjUtxbx1t95XvK2ICG4iErusyjoBuOaJ+26YF
	 uaneRm8bc7HtsGfX6UTMGt0W4fsFO85exx4A5wWu0tST7ILtTJ4uKVMR13gWKMlASi
	 D6gobQS4cibPyFQHbjfvkDKYGPPLR9hkmmw53PpqCH05LnL3OJi3TG7FNE6dmMvCP0
	 +AWWBvPE+2nbWdDGkyPqVfhblHKcd4/H3kK3MLEnvitHXDF5QSBBZ45PGJW+02Ff0f
	 nkZsLI2BePojA==
Received: from johan by theta with local (Exim 4.98)
	(envelope-from <johan@kernel.org>)
	id 1srZWw-0000000023k-1uWu;
	Fri, 20 Sep 2024 11:02:22 +0200
Date: Fri, 20 Sep 2024 11:02:22 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Chris Lew <quic_clew@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pd_mapper: fix ADSP PD maps
Message-ID: <Zu06HiEpA--LbaoU@hovoldconsulting.com>
References: <20240918-x1e-fix-pdm-pdr-v1-1-cefc79bb33d1@linaro.org>
 <Zu0wb-RSwnlb0Lma@hovoldconsulting.com>
 <sziblrb4ggjzehl7fqwrh3bnedvwizh2vgymxu56zmls2whkup@yziunmooga7b>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sziblrb4ggjzehl7fqwrh3bnedvwizh2vgymxu56zmls2whkup@yziunmooga7b>

On Fri, Sep 20, 2024 at 11:49:46AM +0300, Dmitry Baryshkov wrote:
> On Fri, Sep 20, 2024 at 10:21:03AM GMT, Johan Hovold wrote:
> > On Wed, Sep 18, 2024 at 04:02:39PM +0300, Dmitry Baryshkov wrote:
> > > On X1E8 devices root ADSP domain should have tms/pdr_enabled registered.
> > > Change the PDM domain data that is used for X1E80100 ADSP.
> > 
> > Please expand the commit message so that it explains why this is
> > needed and not just describes what the patch does.
> 
> Unfortunately in this case I have no idea. It marks the domain as
> restartable (?), this is what json files for CRD and T14s do. Maybe
> Chris can comment more.

Chris, could you help sort out if and why this change is needed?

	https://lore.kernel.org/all/20240918-x1e-fix-pdm-pdr-v1-1-cefc79bb33d1@linaro.org/	

> > What is the expected impact of this and is there any chance that this is
> > related to some of the in-kernel pd-mapper regression I've reported
> > (e.g. audio not being registered and failing with a PDR error)?
> > 
> > 	https://lore.kernel.org/all/ZthVTC8dt1kSdjMb@hovoldconsulting.com/
> 
> Still debugging this, sidetracked by OSS / LPC.

Johan

