Return-Path: <linux-arm-msm+bounces-38019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6254F9CDFB6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 14:18:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E5301B24266
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 13:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 646E21B81DC;
	Fri, 15 Nov 2024 13:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j6Fmzj99"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342EA52F71;
	Fri, 15 Nov 2024 13:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731676686; cv=none; b=ZgOdq5AbVQ9mEAdKuN51E7OrE0Y4kZtUCi7igc3cnWJHZAZBnh1VEiTOA+USJhBbo+JCaXcRaNBujxebPS47Tur+epW33wfnNVyP526N2sIKdQrsNp2ZWJA1wCm3QIxZijmZWv450U8wSezRU4ZYaudFQPFHJAwSMIp86evHR20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731676686; c=relaxed/simple;
	bh=7oXYRRawKbk2IfSVZUztCSg41vvROYYiVDjxrBKKIMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vFCnVj77lqCSBx0SsUAHsJgspL9YYA4pem3m6q8VYdz5KkTQWYJczIVosky//DJhJb8JOEGhTDzVIVliTMYshnXL+AO7QNiOM7D/PorX/A32rzNjlvbC3lfo9PEXTmXhlJgFTWeXMg0TV5APnTB4hC5c5/3i0Nh1pOo0IYRNzcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j6Fmzj99; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 089E0C4CECF;
	Fri, 15 Nov 2024 13:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731676686;
	bh=7oXYRRawKbk2IfSVZUztCSg41vvROYYiVDjxrBKKIMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j6Fmzj99uXSicxhZaVYIP1mAqUdBb6FtTakNUHAvI1VPGUWWB6pibG7sVHb0cSeeO
	 EJ/JTP8LoN7EkMk8kPRoslm2sYJukIttY00hzCTxaBATPdkuh/p+6TNVgVSVswFVyQ
	 4kxbbQGatL10thse9H7RS5tByKOOYa6scCzBB/3yRhVHZuGBKhpXRPUws7V6NDDMJo
	 0jGAzpwQ5wKr2l/kz1D6fuC8TqNTFrA+nCqGQgyoHdmk8QeS35p24zH7CzqdCqiorq
	 LIT9+Y+kvF15a2gl0cp00uqyr3+OKlCmfw6jpmIWWC4k58Nc/xge4Iptu0V/3R9a39
	 xS8YkB4gQ+emA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tBwCy-000000007nZ-0yyR;
	Fri, 15 Nov 2024 14:17:56 +0100
Date: Fri, 15 Nov 2024 14:17:56 +0100
From: Johan Hovold <johan@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: fix x1e80100 intf_6 underrun/vsync interrupt
Message-ID: <ZzdKBMRKs2MgLGon@hovoldconsulting.com>
References: <20241115-x1e80100-dp2-fix-v1-1-727b9fe6f390@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115-x1e80100-dp2-fix-v1-1-727b9fe6f390@linaro.org>

On Fri, Nov 15, 2024 at 01:55:13PM +0100, Stephan Gerhold wrote:
> The IRQ indexes for the intf_6 underrun/vsync interrupts are swapped.
> DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16) is the actual underrun interrupt and
> DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17) is the vsync interrupt.
> 
> This causes timeout errors when using the DP2 controller, e.g.
>   [dpu error]enc37 frame done timeout
>   *ERROR* irq timeout id=37, intf_mode=INTF_MODE_VIDEO intf=6 wb=-1, pp=2, intr=0
>   *ERROR* wait disable failed: id:37 intf:6 ret:-110
> 
> Correct them to fix these errors and make DP2 work properly.
> 
> Cc: stable@vger.kernel.org
> Fixes: e3b1f369db5a ("drm/msm/dpu: Add X1E80100 support")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>

This fixes the errors I was seeing with the third usb-c port on the
x1e80100 CRD:

Tested-by: Johan Hovold <johan+linaro@kernel.org>

Johan

