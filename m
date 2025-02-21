Return-Path: <linux-arm-msm+bounces-49000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE9AA4035A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2025 00:14:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F5333A4B69
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 23:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F661204C0E;
	Fri, 21 Feb 2025 23:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t5UdMqzL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1088C1F9F70;
	Fri, 21 Feb 2025 23:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740179509; cv=none; b=pVrUmK5xOnm6oWoaKL37avzcCxY9N7sMQ/ZkyMlK9bqE7YMCfZV6rn9D1Uuq/epETxErlfbTG5ROom0ahB1PL67qSBLfZ1Lm13scK19ZJEWPaTXRqLMJEAQZTmJRW6qsTbw3Y1VpRzx/SB9sqPXr6TchHbyEFNeLn8jFYbWAQW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740179509; c=relaxed/simple;
	bh=AQoq1PHYG8aFQ1LcI2Aef/ozCgtbZVuCUR1MfPY45j4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yfv6a/gDfsK5cmsXg4JezronSa7l418w+lRUjljE7XwZluo8G+pmPynjinh1cmWCqFXkQ7z5uGb0hzii9fEW0FeZ+7JccY4kHUQfjx1YfuGuLFXN07gXHr8YAJJ8RGVLLGZ8lhymV3IJsdoqk/f2ZDoZ5V6VqztIWpMMcXUjfjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t5UdMqzL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 443B1C4CED6;
	Fri, 21 Feb 2025 23:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740179508;
	bh=AQoq1PHYG8aFQ1LcI2Aef/ozCgtbZVuCUR1MfPY45j4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t5UdMqzLtGN/zULWN5fYMHTSUXmM4WhK6vp9903+CjUqOks/gJlBE2+LOUk58Zn35
	 3G/K9pygR5yz8upm+foCC1zwRYYkkbeAvqUqXb7+Hiu3pjiybZzBtHDSk6R/K1+AdO
	 bIlZUtwX0/PnAX4eunvETPj/jjdABLP963XlG1xwamfBArQPnvOkOPni0N+6lHwP23
	 TJdcsXCayzQuOTjJ8/2iQWvN3jJcs1Lpoye8UE1z17Qb0n/iixsXITXR3CcVS+WfvB
	 pLYdW/Kwy/rDO4dhCuHvj6ZLJoXIjD//nbv81ZBuOFS5FH+rUD9lIbPEH0wXiKrdVF
	 edsatwJWy1MuA==
Date: Fri, 21 Feb 2025 17:11:46 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: display: msm: mdp4: add LCDC clock
 and PLL source
Message-ID: <174017950586.286463.3669528376090939192.robh@kernel.org>
References: <20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org>
 <20250220-fd-mdp4-lvds-v2-1-15afe5578a31@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220-fd-mdp4-lvds-v2-1-15afe5578a31@linaro.org>


On Thu, 20 Feb 2025 13:14:43 +0200, Dmitry Baryshkov wrote:
> Add the LCDC / LVDS clock input and the XO used to drive internal LVDS
> PLL to MDP4 controller bindings. The controller also provides LVDS PHY
> PLL, so add optional #clock-cells to the device.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/mdp4.yaml | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


