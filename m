Return-Path: <linux-arm-msm+bounces-71252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D04DFB3C079
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 18:19:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90B73A61046
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 16:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E4D5321F23;
	Fri, 29 Aug 2025 16:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k2dkYqBB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA952D321D;
	Fri, 29 Aug 2025 16:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756484364; cv=none; b=SqcV1UJCTNRz2BgfsqvxFY1zrNA/cxMb7/P5zznDuciNhTpK4Dkj5CfdgOAVP8ReRPm2n/Ip4OPh68MAygme18K2nSP0F3ygrAUCg/GUkO1IDF6SAu26fODHXeLWofhLy6FuQVxX3lc9c6LaE/FYKbnfqrgFGRTSCXtS0WmG5wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756484364; c=relaxed/simple;
	bh=mG06DgRB9nSB41YmoGRe5I5pTt9S8mEWzesAoRYSmno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bUhp45/ZDmAvLor+zJW08a29kmEDedZaV1V+3dtt+RymziPfeOGLpoI4hure7DkF0/Q/eDBWSRljahwzYHHP6wvtVEKxx4JnSnzvxJmLCBoPWYcGkMnJdOALG6Q19sXibj57uElOcycYTsa9Hg1ZUJp1xVLdn+nTFBexzTM3y7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k2dkYqBB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 829CFC4CEF0;
	Fri, 29 Aug 2025 16:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756484363;
	bh=mG06DgRB9nSB41YmoGRe5I5pTt9S8mEWzesAoRYSmno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k2dkYqBBgpdKvZQ69UQRmmauu5XkxtkM3t/GeoYUbquRoN0fuRemfm4y1wzB9GyEY
	 uFdZYwd7VcVHIR++d+dp8rdfQ2RhLjzvaBFsEb/kwvA1pHRO85BprD9uk2g8v/pf4p
	 Jo86m6LTAqE/4w24ediycijdUy1X6o+Z+gQgmDgWM3s7NAPegMGCbjKwQMMMiv1mwq
	 4I129egsd+BuUHxCQmvD1aQ51aAKi1CYR5q82B2boRkpkqnvlKQPQOT19dZt5a48R6
	 r4SKK313p31441p83U7wz9eLEsDE4gvEtZGWYeYPmBafhNGIXEYhYO+2RXrHbZqCeM
	 TKR4oruUaHBlg==
Date: Fri, 29 Aug 2025 11:19:22 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Brian Norris <briannorris@chromium.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Georgi Djakov <djakov@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Odelu Kukatla <quic_okukatla@quicinc.com>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: interconnect: qcom: make sc7280
 aggre{1,2}-noc clocks optional
Message-ID: <175648436198.935222.9794956520699193444.robh@kernel.org>
References: <20250825155557.v2.1.I018984907c1e6322cf4710bd1ce805580ed33261@changeid>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825155557.v2.1.I018984907c1e6322cf4710bd1ce805580ed33261@changeid>


On Mon, 25 Aug 2025 15:55:56 -0700, Brian Norris wrote:
> We've found that some device firmware does not expose all the QoS
> resources necessary to manage these interconnects, and that the driver
> code that starts using them crashes. Leave 'clocks' as optional for
> qcom,sc7280-aggre1-noc and qcom,sc7280-aggre2-noc instead.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
> 
> Changes in v2:
>  * new in v2
> 
>  .../interconnect/qcom,sc7280-rpmh.yaml         | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


