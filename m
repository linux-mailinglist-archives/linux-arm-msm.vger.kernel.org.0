Return-Path: <linux-arm-msm+bounces-66191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 451ABB0EBF7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 09:32:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 328B91C84F82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 07:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7ED7277CB4;
	Wed, 23 Jul 2025 07:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nvSDty53"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB892777E0;
	Wed, 23 Jul 2025 07:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753255920; cv=none; b=X9DPbSoQ73Mtv/KxojVJwjVGK15C1MtvTiyej1JOPHB8Mz5mA/B/r6BGKqemfra/rs1R36vNhHFncGrgOAG6dayqqRgHcrXjq5Pjw7JvQzuXz905CH0Qdab7O90pzIpCJDD/7NUPTE1gYubqbENWE8tisAVHsZ2dK9StuPDAtCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753255920; c=relaxed/simple;
	bh=/QBxlH5zQrdTKHeyh1iGe7dLjZTdGC5Aeaobly9L2QU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FMeDEaPS0N2e+Y6tZj6nGLVNXM9FDV5sd0++fc4MVtiZ2kCbdblyAyDpKxaIiYzIguQ7ft6cqfEPCeVBJf2gKaNWR7vbXnBwx632BsRrl0IRN9O/GarsWTOprpXthrwqT/PI1p4IULoNrg2EttQRIA/YilZnCDjUuy/5cEhpJn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nvSDty53; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C844CC4CEFB;
	Wed, 23 Jul 2025 07:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753255918;
	bh=/QBxlH5zQrdTKHeyh1iGe7dLjZTdGC5Aeaobly9L2QU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nvSDty53hPukhZjxVudDihFZMxMriSEyT4HyGfP2MoxKHuFW9YUCOTXBbIdAo87oD
	 w8dBRgA/gkGnu6MUyvmStlhdQB2wmAwBVFq188hHHRtvQFg5AYEcNcKy0H6xGDgDbY
	 f8VbuwXvIIKhdcUKa9rKAFYIccGUzt/CS2c1CDUhYtpKBzmaVLE5xycAmDDBBXTm+9
	 NyOQacP57fboxfeXojJVdZUKbL8I9KwK+ohJl/0Tz3eAGrUbcOTipniK076iiNHcAU
	 5AeLFubD7Rop0sHqdOf7kxhSYACixY5ijEk6Yizy18IgyPija/aWeQkBD38C05CLJb
	 U1MVZ8SlH3AWw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1ueTx8-000000002OG-1g36;
	Wed, 23 Jul 2025 09:31:50 +0200
Date: Wed, 23 Jul 2025 09:31:50 +0200
From: Johan Hovold <johan@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Christopher Obbard <christopher.obbard@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Rui Miguel Silva <rui.silva@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/3] arm64: dts: qcom: x1e80100: add epd hpd pinctrl
Message-ID: <aICP5pE6oXFIxHVk@hovoldconsulting.com>
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
 <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-1-ff33f4d0020f@linaro.org>
 <Z_kB3jOH04-zFnym@hovoldconsulting.com>
 <bc65cf3e-22ca-4383-bf7a-24a3d343eb26@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc65cf3e-22ca-4383-bf7a-24a3d343eb26@linaro.org>

On Wed, Jul 23, 2025 at 09:03:40AM +0200, Neil Armstrong wrote:
> On 11/04/2025 13:49, Johan Hovold wrote:
> > On Wed, Apr 02, 2025 at 03:36:32PM +0100, Christopher Obbard wrote:
> >> Add edp_hpd_active pinctrl to the X1E80100 device tree.
> > 
> > Please squash this one with the patch adding the user.
> >   
> >> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> >> ---
> >>   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 5 +++++
> >>   1 file changed, 5 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> >> index 46b79fce92c90d969e3de48bc88e27915d1592bb..5b1b80c445404fd02e9f6e5dab207610b03ff9c5 100644
> >> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> >> @@ -6389,6 +6389,11 @@ data-pins {
> >>   					bias-pull-up;
> >>   				};
> >>   			};
> >> +
> >> +			edp_hpd_active: edp-hpd-active-state {
> > 
> > Please keep the nodes sorted by name.
> > 
> >> +				pins = "gpio119";
> >> +				function = "edp_hot";
> > 
> > There is no "edp_hot" function on x1e so I wonder how this has been
> > tested.
> > 
> > As I mentioned in a comment to an earlier revision this pin has been
> > configured by the firmware as "edp0_hot".
> 
> With edp_hot, screen stays black with UI comes up, with edp0_hot it works again.

Right.

> > Since there is also an "edp1_hot" pin, this needs to be reflected in the
> > node name and label.
> > 
> > Pin configurations really do belong in board files, but unfortunately
> > this was not followed for x1e. You should still include the bias
> > configuration (somewhere).
> 
> Which bias ? do this pin config needs an additional bias config ?

The boot firmware has disabled the bias, but we should not rely on the
firmware to have configured the pin for us.

Johan

