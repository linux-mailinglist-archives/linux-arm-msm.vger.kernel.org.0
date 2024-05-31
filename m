Return-Path: <linux-arm-msm+bounces-21191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A26F8D5845
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 03:41:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FA151F244B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 01:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01FC9EAE7;
	Fri, 31 May 2024 01:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wm6x+fuF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC3EE56A;
	Fri, 31 May 2024 01:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717119712; cv=none; b=nMtd0xuzBm+qSLCBCb1CKaWT9RMJGAnoSwI5HuiUlP5urjGzJvqiYZj4MMO3k0COhshxxysg1NfIFWylM6PeSvagNkdV+wgF/7t6DQxMgEH01rUoIgiXPragDCNzbjAFf7IW951AQAcxkKk62W00FedsD2kDh/pa6bU2shaDwlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717119712; c=relaxed/simple;
	bh=55yn3OtPaMw1a7Vf5v4d+0TZywmDuWK/8w+Q8FRDWTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mk6yY5RhjpzENtvmLei+UYrPpPoN+BCXV/nvViN7BvqN7qcQOGGaFvoA87ceip0pXn0ELgP12gopZgxSrr4aJm2/DQ3QsJdO4AoezMuU67UkAiloCIrUoMrYcMNrtkp7qjva8oQ1rezqPsEOtc4gdmbwmxBBe4DnUU1gAWNnxjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wm6x+fuF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 769ECC2BBFC;
	Fri, 31 May 2024 01:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717119712;
	bh=55yn3OtPaMw1a7Vf5v4d+0TZywmDuWK/8w+Q8FRDWTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wm6x+fuFMAvfI6dngXA+Q+DFmbCIW3Bvtg16Vt5ouK55OBJ3nwEOUgOfnG1SBmEYQ
	 cbDT2Xp1ZKcUMyuJyF7sVr1BGTepI6oPJ61EzROCI75YKu5NJd1KV0bem0uM97L+Kq
	 ccIOfZXAf/6isyVY5UYnORVHgc8jg9p7K8Dt7KTptYk8UyIrvIIV9ERh+CGZ0xNXhg
	 QqVponSy+cpO7W5wK1xGhkOOxbEFGk0nyPWu5yzF//orfrder4stjLoOUFoO4WkJBQ
	 CTcficFtffW1TpbbDtibH21kV/C3PsnyV0cg6fx1P9cYFHUWDB18WfrG27H/m4RI0n
	 9RXwAl/WoApnA==
Date: Thu, 30 May 2024 20:41:51 -0500
From: Rob Herring <robh@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: konrad.dybcio@linaro.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	Tengfei Fan <quic_tengfan@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: Re: (subset) [PATCH 0/3] arm64: qcom: SA8775p: Add llcc support
Message-ID: <20240531014151.GA3684019-robh@kernel.org>
References: <20240529101534.3166507-1-quic_tengfan@quicinc.com>
 <171703961686.615222.7092607304287257293.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171703961686.615222.7092607304287257293.b4-ty@kernel.org>

On Wed, May 29, 2024 at 10:27:00PM -0500, Bjorn Andersson wrote:
> 
> On Wed, 29 May 2024 18:15:31 +0800, Tengfei Fan wrote:
> > The SA8775p platform has LLCC as the system cache controller. It
> > includes 6 LLCC instances and 1 broadcast interface.
> > 
> > 
> 
> Applied, thanks!
> 
> [3/3] arm64: dts: qcom: sa8775p: Add llcc support for the SA8775p platform
>       commit: 809c20b1ffc80200bfcbbeceb0d946a3e0eed3a4

I'm confused why you didn't pick up the driver and binding?

Rob

