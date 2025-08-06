Return-Path: <linux-arm-msm+bounces-67824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0A9B1BE6E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 03:52:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C77D018A5C38
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 01:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E07F386334;
	Wed,  6 Aug 2025 01:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U2gsLbCe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60B62E3717;
	Wed,  6 Aug 2025 01:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754445121; cv=none; b=TkHjSVmuNeDI59IRCHTaNzTXZezLkmtwQylnfPUOs1MpmXARJdGryaZ2Ev1f1iwtHdNR/cyLUt6kIk/MkXFF1XtsDjXltQi/JKGvpKf9F7u3U3NHBms/exnpAZbtl5FkazUQZaZF7PF03EQ/KZH7goAl3Q/XXpLAExYc4uNWfAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754445121; c=relaxed/simple;
	bh=zj2lKVqxTzS7iIQ5R0qKeSaL/o+KsXJuI6WZjj1p0dQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MHv4J2Fcclpct8weWkPn95B1BOyNOvjB5Vdez16P59xzxcm85VM+FY+9RhBm8JJVQ7GL6Hzdwooa9FyHYwLtu3ZZwYmvNBuGmpVGFIahzmscULg7AbKNeu/RYDsjL+3v0RrMr2XPv5MlWmcS0eRp7BsM9opx+EtznPcyTA7F6vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U2gsLbCe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDD84C4CEF0;
	Wed,  6 Aug 2025 01:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754445121;
	bh=zj2lKVqxTzS7iIQ5R0qKeSaL/o+KsXJuI6WZjj1p0dQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U2gsLbCeuhmEOnyyQj3YYSGLx5AxcEjgQ/KfZj83C9+rdWU3MM/lnJGCPNZTL1/5F
	 TY39ZI7HtW5LAYXoZh7JhZ2pvwQTMxr9cgxrgd7cRSG3fGgcM4JQyak/t0YjPSd7Rz
	 S/015Ez8TdYqs11VWal0x+z39KwtObO294pOHgH2QnHRIEGf63d7c04cGmQ3D9pAjj
	 DleWDANpxfOnpCmeg1k/fNR2wdx3BoDmLmzbiSvEC/YL+Wj5NaA72GxHNcZcapwZ1q
	 WO9f8PAFjOCORDzwqVaP4bJ3LYqVUVqpnt32/Erkr5ikMp9UQBoPdUOCOmE3y/PH/b
	 zHe2nX3uBiUVQ==
Date: Tue, 5 Aug 2025 18:51:59 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>
Subject: Re: [PATCH] soc: qcom: mdt_loader: Deal with zero e_shentsize
Message-ID: <3qaicrc3wkmsampq6f6hjmuiwbary6d5l7vrdrvjprzsbb4lbq@4dx66ch6wdj5>
References: <20250730-mdt-loader-shentsize-zero-v1-1-04f43186229c@oss.qualcomm.com>
 <490f9017-629d-4c19-8c2a-7fd106b4568c@linaro.org>
 <zf5tkmd6mhhn3ktbip7vxeri6oozyswzit2a4j7kkfghnwqrwy@cd6dlf32vwsx>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zf5tkmd6mhhn3ktbip7vxeri6oozyswzit2a4j7kkfghnwqrwy@cd6dlf32vwsx>

On Thu, Jul 31, 2025 at 11:23:25PM +0300, Dmitry Baryshkov wrote:
> On Thu, Jul 31, 2025 at 04:58:09PM +0200, Neil Armstrong wrote:
> > On 30/07/2025 22:51, Bjorn Andersson wrote:
> > > Firmware that doesn't provide section headers leave both e_shentsize and
> > > e_shnum 0, which obvious isn't compatible with the newly introduced
> > > stricter checks.
> > > 
> > > Make the section-related checks conditional on either of these values
> > > being non-zero.
> > > 
> > Missing:
> > Fixes: 9f35ab0e53cc ("soc: qcom: mdt_loader: Fix error return values in mdt_header_valid()")
> > 
> > Or it won't apply on stable kernels
> 
> Then it should also be:
> 
> Cc: stable@vger.kernel.org
> 

Given that the fixed commit is Cc: stable, it makes sense to include
both.

Thanks,
Bjorn

> 
> -- 
> With best wishes
> Dmitry

