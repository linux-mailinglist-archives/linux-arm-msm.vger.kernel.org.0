Return-Path: <linux-arm-msm+bounces-86008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D36ACD2B26
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 09:54:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15A6E30109A0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 08:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C9142F0C63;
	Sat, 20 Dec 2025 08:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OLDHIbD7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251524A35;
	Sat, 20 Dec 2025 08:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766220846; cv=none; b=dL1k3VSUvH4c1pkal5rAeOQc6P8C/7ZtJVOQAYyBZu62VtOd+xxnv6nKEjb6TjdcBO/c0YTwH34dSOkXinVmFR2ZM7iRw0LNG3ll1GV+z72A6hk65Nhtnrkof0l8YZF8Ucl95kgY4TaEWYelUMhujWS1eu6JuVLY4TxOfJjj1bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766220846; c=relaxed/simple;
	bh=ME1PQR0kwfmB/h9m9Q9QgcF8LIQq656uWfk3ydEYZN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MZTUR6AmxHmdZqxAYTa9yxLiOG5UfQpVdotTeSU1/aAfLiBxfNsbRdDXyG7BL94Bf/opuIY9/kuNjdzl8vLNbuD0BrAi6Fa9Xa4lGWlA/HnRuCGFtxJYjPLXeOErE269ic/nO2upp3zNHwwHLciH8U7HD0YZam3BTCadrKA2MOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OLDHIbD7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20292C4CEF5;
	Sat, 20 Dec 2025 08:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766220845;
	bh=ME1PQR0kwfmB/h9m9Q9QgcF8LIQq656uWfk3ydEYZN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OLDHIbD7oyU8mmVmkoxmE4E8Qtb3yibI9KJsX+HvXPVAyAr3c8LgGbndyfebXe3EA
	 ChmOfPNoXcJIs/ZzW2KG/jCc83M/I84b4DmASvqXTKXRoKKFQH4GBhtOVxWAWj3Zf8
	 wtv6+IuSWStMJwvB05lsUzD5I7mcSDZY9q8AKxsqVYBNSkbUsofgBlz16o8fndLRHE
	 /xSveaX3vLihZqpX3TQtIDlWyopKGidVepz+xAv1vItCyZLnFlpbGidNrYfeyPpe6K
	 zTZz3oFkxYENiF73YVXVBB3iBEE8Vjg4VC4DHzXIJ9BhUo2l0qz3rbBPIIpwzWZJ8U
	 GEqOJ3cvLE8fw==
Date: Sat, 20 Dec 2025 09:54:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Alexandru Gagniuc <mr.nuke.me@gmail.com>, andersson@kernel.org, 
	mathieu.poirier@linaro.org, krzk+dt@kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/9] dt-bindings: remoteproc: qcom: add IPQ9574 image
 loader
Message-ID: <20251220-imaginary-merciful-quoll-a91a4c@quoll>
References: <20251219043425.888585-1-mr.nuke.me@gmail.com>
 <20251219043425.888585-2-mr.nuke.me@gmail.com>
 <20251219144433.GA3163791-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251219144433.GA3163791-robh@kernel.org>

On Fri, Dec 19, 2025 at 08:44:33AM -0600, Rob Herring wrote:
> On Thu, Dec 18, 2025 at 10:34:10PM -0600, Alexandru Gagniuc wrote:
> > Document the IPQ9574 native (non-PAS) WCSS image loader. It is similar
> > to IPQ8074 WCSS, but requires several new clocks. These clocks must be
> > enabled by the host in non-PAS mode, and are not optional. Add an
> > example that uses the "qcom,ipq9574-wcss-pil" binding.
> 
> Is the new example really much different and unique. If not, drop it 
> (especially since it wasn't even tested).

There is simply no example for existing devices, so this is fine. It
could be mentioned here WHY it is being added, which would solve two
people's questions (yours and mine earlier). If only people knew and
said WHY they are doing something.

Best regards,
Krzysztof


