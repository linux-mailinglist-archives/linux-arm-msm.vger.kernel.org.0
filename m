Return-Path: <linux-arm-msm+bounces-57474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C5DAB1947
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 17:50:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C69F1541AB9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 15:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E34FC22FDE6;
	Fri,  9 May 2025 15:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="srAOc6HL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53F322F16C;
	Fri,  9 May 2025 15:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746805797; cv=none; b=ooUPd4isczw+aQyCxAkXe1GPXnAx1M3HGYuTGl1gdVL+qDh4w8UZcXF3DSekkoFceFkz07H5usZokB3zN+i7rUlWbqRU2M6cExd0jfpBe2iKhZ0hCGuXFYqfHOqmzGukfYr2Aw3eMAXvhV6efY73okCEl+aGNWk53lEJbXj35iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746805797; c=relaxed/simple;
	bh=f3uau16VPtaZdA3scq0IH4AZktliB26KN3ZGkhgmX7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZgbkwPR5XR6Cq6AGVajAQDsljMhiH3NX32DsvmVr4qwccLYxRBb8k/48SBVuhKZFb1Pb8Hq4GVYopWF/6NoUn3OjW2wXX+SVYGasQFkzcSVYO1R541tTTAqRZVmcZdu0L8WWOSOYQ1vt/lcdMo1ixjeUUHlHGKKKx03KcpIbWKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=srAOc6HL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060D7C4CEE4;
	Fri,  9 May 2025 15:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746805797;
	bh=f3uau16VPtaZdA3scq0IH4AZktliB26KN3ZGkhgmX7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=srAOc6HLhwtsApzFbOF2GhhwMQs2hcjYGetDCxlMeaRcxENt+3VTrhMat/8ljxH8j
	 gNo05C4zfp6ezLHZf7oBcM4su2l9YwdvOVl/npmJObAF16vIR54eI0Mavsyl+H6hYD
	 cwPmcigCulY5z/U6Rb+c+2/bllH0Aw+A86wgwAdzRqTGZjZT+n8sgUN957DpMZHl39
	 l0vFIA1yq6dh7vT+BOwyQsr0mGksRcWWwpsKQFbJcd7UZ30pDuQ7qWRknIMZJlJcXs
	 IZOcyoNgwlgtrJDWFLeteCxki+/BgLm5VoxWC2D6rIGHcUwBgvn9tszqERG0khS3Pm
	 2Md4hKwe6ajhQ==
Date: Fri, 9 May 2025 10:49:55 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display/msm: hdmi: Fix constraints on
 additional 'port' properties
Message-ID: <20250509154955.GA3546604-robh@kernel.org>
References: <20250507215912.2748964-1-robh@kernel.org>
 <fvrvrcqilnhma774kkojytlgwglsvgaxgukm2fc3gennaii4jz@dufjv3obqc7b>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fvrvrcqilnhma774kkojytlgwglsvgaxgukm2fc3gennaii4jz@dufjv3obqc7b>

On Thu, May 08, 2025 at 07:03:17AM +0300, Dmitry Baryshkov wrote:
> On Wed, May 07, 2025 at 04:59:12PM -0500, Rob Herring (Arm) wrote:
> > The MSM HDMI port nodes are missing any restrictions on additional
> > properties. The $ref should be to "/properties/port" rather than
> > "/$defs/port-base" as there are not additional properties in the nodes
> > to define.
> > 
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/display/msm/hdmi.yaml | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> I've verified, it applies on top of msm-next and produces no errors. I
> don't see a meaningful error in the bot's message (Rob, is there a
> chance to fix the bot?).

The problem was I broke dtschema on python 3.11 and earlier. It's now 
fixed.

Rob

